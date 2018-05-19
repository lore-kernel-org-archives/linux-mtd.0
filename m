Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fK1ED-0002SP-1Z
 for linux-mtd@lists.infradead.org; Sat, 19 May 2018 12:44:54 +0000
Received: by mail-wm0-x243.google.com with SMTP id j5-v6so19520986wme.5
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2018 05:44:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/1] fix OOB size decoding on SK Hynix H27UCG8T2BTR
Date: Sat, 19 May 2018 14:44:30 +0200
Message-Id: <20180519124431.16000-1-martin.blumenstingl@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The OOB size of the SK Hynix H27UCG8T2BTR is currently detected to be
640 bytes, while the datasheet states that it should be 1280 bytes.

I only have one single device with a SK Hynix NAND flash, so I cannot
say whether this fix may or may not break other chips. other datasheets
I have checked:
- H27UBG8T2B uses a page size of 8KiB -> not applicable
- H27UBG8T2A also uses a page size of 8KiB -> not applicable either

so I would appreciate if someone else could confirm (even if it's
"just" by looking at a datasheet) that this patch should work for other
SK Hynix NAND chips with 16KiB page size.

I decided not to add a "Fixes" tag because it seems H27UCG8T2BTR was
not supported properly at any point in the past (upstream at least).


Martin Blumenstingl (1):
  mtd: rawnand: hynix: fix decoding the OOB size on H27UCG8T2BTR

 drivers/mtd/nand/raw/nand_hynix.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.17.0
