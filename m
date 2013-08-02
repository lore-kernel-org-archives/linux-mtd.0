Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5Ftr-0003bi-2u
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 14:00:11 +0000
Message-ID: <1375452301.14869.323.camel@sauron.fi.intel.com>
Subject: Re: [PATCH -next 1/7] mtd: tests: introduce mtd_test module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, Akinobu Mita
 <akinobu.mita@gmail.com>
Date: Fri, 02 Aug 2013 17:05:01 +0300
In-Reply-To: <CAN8TOE987JxGfj-O5NxVCOCVkjsiFy2pRuNMaY3m6+mHdvqtnA@mail.gmail.com>
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
 <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
 <CAN8TOE987JxGfj-O5NxVCOCVkjsiFy2pRuNMaY3m6+mHdvqtnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-07-27 at 12:27 -0700, Brian Norris wrote:
> > These functions will be used for reducing code duplication among
> > mtd/tests modules later.
> 
> I like this idea. There is definitely too much code duplication.
> 
> However, there is an important tradeoff here: now to run these (very
> simple) tests, we have a two-step process*:
> 
> insmod mtd_test.ko
> insmod mtd_<actualtest>.ko dev=<MTD>

The helpers do not have to be in a separate module. Here is a short
patch demonstrating how we could put all the helpers to a single .c file
and then just link it to the tests.

It renames mtd_oobtest.c to oobtest.c, and this part of the patch is
omitted. Do it by hand if you want to try this patch:

$ mv drivers/mtd/tests/mtd_oobtest.c drivers/mtd/tests/oobtest.c

Note, I do realize that the code will actually be copied to every test
module, but I think it is fine for our small test infrastructure.

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Fri, 2 Aug 2013 16:41:37 +0300
Subject: [PATCH] tmp: a patch to demonstrate a possible way of having test
 helpers

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/Makefile       |   2 +
 drivers/mtd/tests/mtd_oobtest.c  | 714 --------------------------------------
 drivers/mtd/tests/oobtest.c      | 718 +++++++++++++++++++++++++++++++++++++++
 drivers/mtd/tests/test_helpers.c |   6 +
 drivers/mtd/tests/test_helpers.h |   1 +
 5 files changed, 727 insertions(+), 714 deletions(-)
 delete mode 100644 drivers/mtd/tests/mtd_oobtest.c
 create mode 100644 drivers/mtd/tests/oobtest.c
 create mode 100644 drivers/mtd/tests/test_helpers.c
 create mode 100644 drivers/mtd/tests/test_helpers.h

diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index bd0065c..41a34d3 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -7,3 +7,5 @@ obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_nandecctest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_nandbiterrs.o
+
+mtd_oobtest-objs := oobtest.o test_helpers.o
diff --git a/drivers/mtd/tests/test_helpers.c b/drivers/mtd/tests/test_helpers.c
new file mode 100644
index 0000000..70c4692
--- /dev/null
+++ b/drivers/mtd/tests/test_helpers.c
@@ -0,0 +1,6 @@
+#include "test_helpers.h"
+
+int a_helper(void)
+{
+       return 0;
+}
diff --git a/drivers/mtd/tests/test_helpers.h b/drivers/mtd/tests/test_helpers.h
new file mode 100644
index 0000000..0948a6e
--- /dev/null
+++ b/drivers/mtd/tests/test_helpers.h
@@ -0,0 +1 @@
+int a_helper(void);

-- 
Best Regards,
Artem Bityutskiy
