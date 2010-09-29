Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P10hY-0000gm-Nr
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 17:44:21 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Add support for BBT without touching OOB area
Date: Wed, 29 Sep 2010 19:43:49 +0200
Message-Id: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Cc: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without this patch (number three) NAND controllers which use complete OOB
area for ECC information can not use a BBT at all. The vendor bit is
gone after the first write and the flash BBT stores a marker in the OOB
area. The patch simply moves the marker into the data area.

The series contains:
- [PATCH 1/5] mtd/nand: use ALIGN where possible
- [PATCH 2/5] mtd/nand: pull in td into read_bbt()
clean up.

- [PATCH 3/5] mtd/nand: add support for BBT without OOB
adds the functionality.

- [PATCH 4/5] mtd/nand: introduce NAND_CREATE_EMPTY_BBT
NAND_CREATE_BBT creates a BBT based on vendor's informations (or something
else if specified). Without NAND_CREATE_BBT the BBT is written to flash
after the first bad block is found. This options enforces writting an
"empty" table.

- [PATCH 5/5] mtd/nandsim: add module param for BBT handling
Used for first testing.

Sebastian
