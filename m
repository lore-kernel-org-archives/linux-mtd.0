Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exais-0008My-1g
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 15:59:52 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [PATCH v8 0/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
Date: Sun, 18 Mar 2018 16:59:26 +0100
Message-Id: <20180318155929.16561-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eighth revision of the rework patchset to use exec_op for NXP
Vybrid (and others) NAND Flash Controller.

--
Stefan

Changes in v8:
- Check NAND status in vf610_nfc_write_page

Changes in v7:
- (accidentally none)

Changes in v6:
- Checkpatch style fixes
- Subject change

Changes in v5:
- Fix COMMAND_NADDR_BYTES macro (fixes oob/page test issues)
- Renamed page_access to data_access
- Removed unclear debugging messages
- Introduce vf610_nfc_fill_row to avoid code duplication in
  vf610_nfc_(read|write)_page
- Add patch to enable ONFI SET/GET_FEATURES
- Comment/commit message fixes

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

Stefan Agner (3):
  mtd: rawnand: vf610_nfc: make use of ->exec_op()
  mtd: rawnand: vf610_nfc: remove old hooks
  mtd: rawnand: vf610_nfc: support ONFI SET/GET_FEATURES commands

 drivers/mtd/nand/raw/vf610_nfc.c | 632 +++++++++++++++++++++++----------------
 1 file changed, 380 insertions(+), 252 deletions(-)

-- 
2.16.2
