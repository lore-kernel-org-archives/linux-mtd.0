Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd1Z7-0004iU-6T
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 19:43:25 +0000
Received: by lahg1 with SMTP id g1so36940599lah.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 12:43:02 -0700 (PDT)
From: Tom Englund <tomenglund26@gmail.com>
To: linux-mtd@lists.infradead.org,
	computersforpeace@gmail.com
Cc: Tom Englund <tomenglund26@gmail.com>
Subject: [PATCH 1/1] pcmciamtd: Add id for PRETEC 4MB SRAM
Date: Fri, 18 Sep 2015 21:42:59 +0200
Message-Id: <1442605379-27627-1-git-send-email-tomenglund26@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The module pcmciamtd doesn't generate a mtd node for PRETEC 4MB SRAM
cards without the id and hash added to pcmciamtd.c

Tested on 3 different 4MB pretec sram cards.

Signed-off-by: Tom Englund <tomenglund26@gmail.com>
---
 drivers/mtd/maps/pcmciamtd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index af747af..3dad211 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -700,6 +700,7 @@ static const struct pcmcia_device_id pcmciamtd_ids[] = {
 	PCMCIA_DEVICE_PROD_ID12("Maxtor", "MAXFL MobileMax Flash Memory Card", 0xb68968c8, 0x2dfb47b0),
 	PCMCIA_DEVICE_PROD_ID123("M-Systems", "M-SYS Flash Memory Card", "(c) M-Systems", 0x7ed2ad87, 0x675dc3fb, 0x7aef3965),
 	PCMCIA_DEVICE_PROD_ID12("PRETEC", "  2MB SRAM CARD", 0xebf91155, 0x805360ca),
+	PCMCIA_DEVICE_PROD_ID12("PRETEC", "  4MB SRAM CARD", 0xebf91155, 0x20b6bf17),
 	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB101EN20", 0xf9876baf, 0xad0b207b),
 	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB513EN20", 0xf9876baf, 0xe8d884ad),
 	PCMCIA_DEVICE_PROD_ID12("SMART Modular Technologies", " 4MB FLASH Card", 0x96fd8277, 0x737a5b05),
-- 
2.5.1
