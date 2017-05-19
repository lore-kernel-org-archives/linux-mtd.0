Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0005ge-Do
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:50 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 13/30] kselftest.txt: standardize document format
Date: Thu, 18 May 2017 22:24:05 -0300
Message-Id: <576c937dad1f8c3600c5e4453cda9fc3b55741ff.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
MIME-Version: 1.0
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- promote the level of the document title;
- use literal blocks where needed;
- add whitespaces to fix one literal block.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kselftest.txt | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/Documentation/kselftest.txt b/Documentation/kselftest.txt
index 5bd590335839..98be003ce4eb 100644
--- a/Documentation/kselftest.txt
+++ b/Documentation/kselftest.txt
@@ -1,4 +1,6 @@
+======================
 Linux Kernel Selftests
+======================
 
 The kernel contains a set of "self tests" under the tools/testing/selftests/
 directory. These are intended to be small tests to exercise individual code
@@ -15,14 +17,17 @@ hotplug test is run on 2% of hotplug capable memory instead of 10%.
 Running the selftests (hotplug tests are run in limited mode)
 =============================================================
 
-To build the tests:
+To build the tests::
+
   $ make -C tools/testing/selftests
 
 
-To run the tests:
+To run the tests::
+
   $ make -C tools/testing/selftests run_tests
 
-To build and run the tests with a single command, use:
+To build and run the tests with a single command, use::
+
   $ make kselftest
 
 - note that some tests will require root privileges.
@@ -33,10 +38,12 @@ Running a subset of selftests
 You can use the "TARGETS" variable on the make command line to specify
 single test to run, or a list of tests to run.
 
-To run only tests targeted for a single subsystem:
+To run only tests targeted for a single subsystem::
+
   $  make -C tools/testing/selftests TARGETS=ptrace run_tests
 
-You can specify multiple tests to build and run:
+You can specify multiple tests to build and run::
+
   $  make TARGETS="size timers" kselftest
 
 See the top-level tools/testing/selftests/Makefile for the list of all
@@ -46,10 +53,12 @@ possible targets.
 Running the full range hotplug selftests
 ========================================
 
-To build the hotplug tests:
+To build the hotplug tests::
+
   $ make -C tools/testing/selftests hotplug
 
-To run the hotplug tests:
+To run the hotplug tests::
+
   $ make -C tools/testing/selftests run_hotplug
 
 - note that some tests will require root privileges.
@@ -62,11 +71,13 @@ You can use kselftest_install.sh tool installs selftests in default
 location which is tools/testing/selftests/kselftest or a user specified
 location.
 
-To install selftests in default location:
+To install selftests in default location::
+
    $ cd tools/testing/selftests
    $ ./kselftest_install.sh
 
-To install selftests in a user specified location:
+To install selftests in a user specified location::
+
    $ cd tools/testing/selftests
    $ ./kselftest_install.sh install_dir
 
@@ -77,10 +88,10 @@ Kselftest install as well as the Kselftest tarball provide a script
 named "run_kselftest.sh" to run the tests.
 
 You can simply do the following to run the installed Kselftests. Please
-note some tests will require root privileges.
+note some tests will require root privileges::
 
-cd kselftest
-./run_kselftest.sh
+   $ cd kselftest
+   $ ./run_kselftest.sh
 
 Contributing new tests
 ======================
@@ -101,8 +112,10 @@ Contributing new tests(details)
 
  * Use TEST_GEN_XXX if such binaries or files are generated during
    compiling.
+
    TEST_PROGS, TEST_GEN_PROGS mean it is the excutable tested by
    default.
+
    TEST_PROGS_EXTENDED, TEST_GEN_PROGS_EXTENDED mean it is the
    executable which is not tested by default.
    TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
-- 
2.9.4
