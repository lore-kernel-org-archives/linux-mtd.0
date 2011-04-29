Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFkyz-0008RW-B7
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 10:31:34 +0000
Received: by wwi18 with SMTP id 18so363065wwi.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 03:31:31 -0700 (PDT)
Sender: Bryan De faria <bryan.defaria@gmail.com>
From: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
To: 
Subject: [PATCH 3/3] omap : nand : fix subpage ecc issue with prefetch
Date: Fri, 29 Apr 2011 12:31:10 +0200
Message-Id: <1304073070-24526-4-git-send-email-bdefaria@adeneo-embedded.com>
In-Reply-To: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
References: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
To: linux-omap@vger.kernel.org
Cc: Bryan DE FARIA <bdefaria@adeneo-embedded.com>, jjhiblot@adetelgroup.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When reading a subpage with a non dividable by 4 ecc number of byte, the
prefetch function gets first the extra bytes, then reads the bytes lefting.
Extra bytes are not returned in the buffer (they are overwritten), which makes
the software ecc fail.

Signed-off-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
---
 drivers/mtd/nand/omap2.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index eab51da..728db14 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -267,7 +267,6 @@ static void omap_read_buf_pref(struct mtd_info *mtd, u_char *buf, int len)
 		else
 			omap_read_buf8(mtd, buf, len);
 	} else {
-		p = (u32 *) buf;
 		do {
 			r_count = gpmc_read_status(GPMC_PREFETCH_FIFO_CNT);
 			r_count = r_count >> 2;
-- 
1.7.1
