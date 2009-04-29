Message-ID: <49F852EB.1080701@nokia.com>
Date: Wed, 29 Apr 2009 16:15:23 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Mika Korhonen <mika.j.korhonen@gmail.com>
Subject: Re: [PATCH] OMAP OneNAND: add missing __devexit_p wrappers
References: <7948530904290459q36d9c3fcq2db0dedcf88549d2@mail.gmail.com>
In-Reply-To: <7948530904290459q36d9c3fcq2db0dedcf88549d2@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------060606050107020605040104"
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060606050107020605040104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mika Korhonen wrote:
> The patch follows as attachment as gmail damages whitespaces and
> git-send-mail is right now out of question.

This goes via MTD mailing list.


--------------060606050107020605040104
Content-Type: text/x-diff;
 name="0001-OMAP-OneNAND-add-missing-__devexit_p-wrappers.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-OMAP-OneNAND-add-missing-__devexit_p-wrappers.patch"

>From b72b537ff229a8d62540569bc543c419702ecb05 Mon Sep 17 00:00:00 2001
From: Mika Korhonen <mika.j.korhonen@gmail.com>
Date: Wed, 29 Apr 2009 14:10:34 +0300
Subject: [PATCH] OMAP OneNAND: add missing __devexit_p wrappers

Fixes build in configurations where devexit functions get discarded

Signed-off-by: Mika Korhonen <mika.j.korhonen@gmail.com>
---
 drivers/mtd/onenand/omap2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index f2e9de1..4882935 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -778,8 +778,8 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 
 static struct platform_driver omap2_onenand_driver = {
 	.probe		= omap2_onenand_probe,
-	.remove		= omap2_onenand_remove,
-	.shutdown	= omap2_onenand_shutdown,
+	.remove		= __devexit_p(omap2_onenand_remove),
+	.shutdown	= __devexit_p(omap2_onenand_shutdown),
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner  = THIS_MODULE,
-- 
1.5.6.5


--------------060606050107020605040104--
