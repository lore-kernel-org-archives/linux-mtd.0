Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LtJu-0004jm-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 20:48:38 +0000
From: " Brian Michalk" <michalk@awpi.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: fdisk problems 
Date: Thu, 25 Jan 2001 14:31:59 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICIEMMCEAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <NEBBLKIBMLGPAFMHEJICKEMKCEAA.michalk@awpi.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The source code changes:
nftlmount.c
...
if (memcmp(mh->DataOrgID, "ANAND", 6) == 0) {
	printk("memcmp found \"ANAND\"\n");
	/* first boot record */
...
if ((nftl->nb_boot_blocks + 2) >= nftl->nb_blocks) {
	printk("nb_boot_blocks+2 >= nb_blocks\n");
	goto ReplUnitTable; /* small consistency check */
}
...
if (nftl->numvunits > (nftl->nb_blocks - nftl->nb_boot_blocks - 2)) {
	printk("numvumits > nb_blocks-nb_boot_blocks-2\n");
	goto ReplUnitTable; /* small consistency check */
}
...
if (MTD_READECC(nftl->mtd, block * nftl->EraseSize +
		i + SECTORSIZE, SECTORSIZE,
		&retlen, buf, (char *)&oob) < 0) {
	printk("MTD_READECC(...) < 0\n");
	goto ReplUnitTable;
}

What dmesg said:
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xE0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
9 flash chips found. Total DiskOnChip size: 72 Mb
mtd: Giving out device 0 to DiskOnChip 2000
DiskOnChip 2000 found at address 0xE2000
Flash chip found: Manufacturer ID: EC, Chip ID: E6 (Samsung KM29U64000)
9 flash chips found. Total DiskOnChip size: 72 Mb
mtd: Giving out device 1 to DiskOnChip 2000
ftl_cs: FTL header not found.
ftl_cs: FTL header not found.
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
NFTL_notify_add for DiskOnChip 2000
mtd->read = c01ad26c, size = 75497472, erasesize = 8192
NFTL_setup
memcmp found "ANAND"
MTD_READECC(...) < 0
memcmp found "ANAND"
MTD_READECC(...) < 0
Could not find valid boot record
Could not mount NFTL device
NFTL_notify_add for DiskOnChip 2000
mtd->read = c01ad26c, size = 75497472, erasesize = 8192
NFTL_setup
memcmp found "ANAND"
MTD_READECC(...) < 0
memcmp found "ANAND"
MTD_READECC(...) < 0
Could not find valid boot record
Could not mount NFTL device



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
