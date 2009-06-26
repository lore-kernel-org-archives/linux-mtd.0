Message-ID: <57946.192.168.10.89.1246035773.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <53729.192.168.10.89.1246035472.squirrel@dbdmail.itg.ti.com>
References: <53729.192.168.10.89.1246035472.squirrel@dbdmail.itg.ti.com>
Date: Fri, 26 Jun 2009 22:32:53 +0530 (IST)
Subject: Re: [PATCH][MTD][NAND]: fix omap2.c compile failure and warning
From: "vimal singh" <vimalsingh@ti.com>
To: "vimal singh" <vimalsingh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: "david-b@pacbell.net" <david-b@pacbell.net>,
	"tom.leiming@gmail.com" <tom.leiming@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Somehow I do not see below errors on compilation:
drivers/mtd/nand/omap2.c: In function 'omap_wait':
drivers/mtd/nand/omap2.c:543: error: 'jiffies' undeclared (first use in this
function)
drivers/mtd/nand/omap2.c:543: error: (Each undeclared identifier is reported
only once
drivers/mtd/nand/omap2.c:543: error: for each function it appears in.)
drivers/mtd/nand/omap2.c:557: error: implicit declaration of function
'time_before'

But still including 'linux/jiffies.h'.

Below is the patch.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
Signed-off-by: Ming Lei <tom.leiming@gmail.com>
---

drivers/mtd/nand/omap2.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 0cd76f8..3b6e6ad 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -11,6 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/sched.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
@@ -541,7 +543,7 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip
*chip)
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 							mtd);
 	unsigned long timeo = jiffies;
-	int status, state = this->state;
+	int status = NAND_STATUS_FAIL, state = this->state;

 	if (state == FL_ERASING)
 		timeo += (HZ * 400) / 1000;
@@ -558,6 +560,7 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip
*chip)
 		status = __raw_readb(this->IO_ADDR_R);
 		if (!(status & 0x40))
 			break;
+		cond_resched();
 	}
 	return status;
 }
