Received: from isilmar-3.linta.de ([188.40.101.200] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCVDN-0003rY-2q
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 10:00:29 +0000
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: <linux-pcmcia@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] pcmciamtd: add another ID
Date: Thu, 13 May 2010 12:00:01 +0200
Message-Id: <1273744801-26318-4-git-send-email-linux@dominikbrodowski.net>
In-Reply-To: <20100513095749.GA25909@comet.dominikbrodowski.net>
References: <20100513095749.GA25909@comet.dominikbrodowski.net>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reported-by: Komuro <komurojun-mbn@nifty.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/mtd/maps/pcmciamtd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 050aa8e..c4aacbf 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -747,6 +747,7 @@ static struct pcmcia_device_id pcmciamtd_ids[] = {
 	PCMCIA_DEVICE_PROD_ID12("KINGMAX TECHNOLOGY INC.", "SRAM 256K Bytes", 0x54d0c69c, 0xad12c29c),
 	PCMCIA_DEVICE_PROD_ID12("Maxtor", "MAXFL MobileMax Flash Memory Card", 0xb68968c8, 0x2dfb47b0),
 	PCMCIA_DEVICE_PROD_ID123("M-Systems", "M-SYS Flash Memory Card", "(c) M-Systems", 0x7ed2ad87, 0x675dc3fb, 0x7aef3965),
+	PCMCIA_DEVICE_PROD_ID12("PRETEC", "  2MB SRAM CARD", 0xebf91155, 0x805360ca),
 	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB101EN20", 0xf9876baf, 0xad0b207b),
 	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB513EN20", 0xf9876baf, 0xe8d884ad),
 	PCMCIA_DEVICE_PROD_ID12("SMART Modular Technologies", " 4MB FLASH Card", 0x96fd8277, 0x737a5b05),
-- 
1.6.3.3
