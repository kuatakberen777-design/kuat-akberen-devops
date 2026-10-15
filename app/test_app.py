import os
import unittest

import app


class AppTest(unittest.TestCase):
    def test_defaults(self):
        for key in app.DEFAULTS:
            os.environ.pop(key, None)
        out = app.render(app.get_student())
        self.assertIn("Surname: Kuat", out)
        self.assertIn("Application is running successfully!", out)

    def test_env_override(self):
        os.environ["STUDENT_GROUP"] = "TEST-GROUP"
        self.assertIn("Group: TEST-GROUP", app.render(app.get_student()))
        del os.environ["STUDENT_GROUP"]


if __name__ == "__main__":
    unittest.main()
