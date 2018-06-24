From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, liang.yang@amlogic.com, yixun.lan@amlogic.com,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/1] fix OOB size decoding on SK Hynix H27UCG8T2BTR
Date: Sun, 24 Jun 2018 22:53:54 +0200
Message-Id: <20180624205355.20060-1-martin.blumenstingl@googlemail.com>
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


changes since v1 at [0]:
- don't apply the fix for all Hynix chips with 16KiB page size as
  suggested by Miquel Raynal
- added an inline comment what the new logic is supposed to do
- I asked Hynix for feedback on my initial patch, unfortunately it
  seems that they cannot disclose any information from the datasheets
  publicly


[0] https://patchwork.ozlabs.org/cover/916836/


Martin Blumenstingl (1):
  mtd: rawnand: hynix: fix decoding the OOB size on H27UCG8T2BTR

 drivers/mtd/nand/raw/nand_hynix.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.18.0
