Received: from tortuga.cyrius.com ([94.228.35.166])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OLh6M-0006uG-EB
	for linux-mtd@lists.infradead.org; Mon, 07 Jun 2010 18:31:11 +0000
Date: Mon, 7 Jun 2010 19:31:01 +0100
From: Martin Michlmayr <tbm@cyrius.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: Add support for Macronix 25L8005
Message-ID: <20100607183101.GA378@jirafa.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for Macronix 25L8005.  Tested on a HP t5325 Thin Client.

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>

index 81e49a9..372df59 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -641,6 +641,7 @@ static const struct spi_device_id m25p_ids[] = {
 
 	/* Macronix */
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
+	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, 0) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, 0) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },

-- 
Martin Michlmayr
http://www.cyrius.com/
