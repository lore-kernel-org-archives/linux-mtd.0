Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoxUl-0002fi-Oe
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 20:29:38 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: richard@nod.at, bpringle@sympatico.ca, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org, Stefan Agner <stefan@agner.ch>
Subject: [RFC PATCH v4 0/2] mtd: nand: vf610_nfc: make use of ->exec_op()
Date: Thu, 22 Feb 2018 21:29:16 +0100
Message-Id: <20180222202918.8708-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fourth revision of the rework patchset to use exec_op for NXP
Vybrid (and others) NAND Flash Controller. The most important
change tries to implement a nicer way of handling the endianness
hack.

However, this currently fails oobtest and nandbiterrs test. With
some debugging enabled it looks like this:
[   42.930460] mtd_oobtest: writing OOBs of whole device
[   42.935576] vf610_nfc 400e0000.nand: OP_CMD: code 0xff
[   42.944713] vf610_nfc 400e0000.nand: OP_CMD: code 0x70
[   42.949955] vf610_nfc 400e0000.nand: OP_CMD: code 0x80
[   42.955254] vf610_nfc 400e0000.nand: OP_ADDR: col 2048, row 1024
[   42.961387] vf610_nfc 400e0000.nand: OP_DATA_OUT: len 64, offset 0
[   42.974332] vf610_nfc 400e0000.nand: OP_CMD: code 0x70
[   42.983101] vf610_nfc_write_oob, ret -5
[   42.986986] mtd_oobtest: error: writeoob failed at 0x0
[   42.992311] mtd_oobtest: error: use_len 2, use_offset 0
[   42.999054] mtd_oobtest: error -5 occurred
[   43.003301] =================================================

It seems that when I set page_access on such granular level I
do in the current patchset version, then it influences commands
such as status too... I guess I have to partially reimplement
nand_exec_prog_page_op..?

--
Stefan

Changes in v4:
- Rebased to nand/next
- Simplify filling of address cycles
- Use accessors for SRAM (vf610_nfc_rd_from_sram/vf610_nfc_wr_to_sram)
- Use two op-parser patterns to avoid a single command reading and writing
  in a single operation
- Implement (read|write)_(page|oob)[_raw] to set page_access
- Set and clear vf610_nfc_ecc_mode in ecc (read|write)_page
- Clear/set 16-bit config when 16-bit bus is used and 8-bit access is
  requested

Changes in v3:
- Separate exec_op() callback addition and removal of old callbacks
- Push data into regs in one function
- Readd op parser
- Implement custom read/write page for hardware ECC
- Rely on generic ecc.write_page_raw
- Use nand_read_oob_op instead of nand_read_page_op

Stefan Agner (2):
  mtd: nand: vf610_nfc: make use of ->exec_op()
  mtd: nand: vf610_nfc: remove old hooks

 drivers/mtd/nand/raw/vf610_nfc.c | 642 ++++++++++++++++++++++++---------------
 1 file changed, 399 insertions(+), 243 deletions(-)

-- 
2.16.2
