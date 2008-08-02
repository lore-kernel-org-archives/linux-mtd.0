Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KPPyI-00030h-Jc
	for linux-mtd@lists.infradead.org; Sat, 02 Aug 2008 22:53:11 +0000
Received: by fg-out-1718.google.com with SMTP id l26so746842fgb.26
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Aug 2008 15:53:09 -0700 (PDT)
Date: Sun, 3 Aug 2008 02:53:04 +0400
From: Alexander Beregalov <a.beregalov@gmail.com>
To: viro@zeniv.linux.org.uk, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/mtd/mtdsuper.c: fix build error
Message-ID: <20080802225304.GD4856@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alexander Beregalov <a.beregalov@gmail.com>

drivers/mtd/mtdsuper.c: fix build error

drivers/mtd/mtdsuper.c:184: error: implicit declaration of
	function 'lookup_bdev'
drivers/mtd/mtdsuper.c:197: error: implicit declaration of
	function 'bdput'

Introduced by commit d5686b444ff3f72808d2b3fbd58672a86cdf38e7


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
---

 drivers/mtd/mtdsuper.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 9b6af7e..ec950cd 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -13,6 +13,7 @@
 #include <linux/mtd/super.h>
 #include <linux/namei.h>
 #include <linux/ctype.h>
+#include <linux/fs.h>
 
 /*
  * compare superblocks to see if they're equivalent
