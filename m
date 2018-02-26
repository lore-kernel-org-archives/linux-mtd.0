Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqQB2-0006ve-AM
 for linux-mtd@lists.infradead.org; Mon, 26 Feb 2018 21:19:23 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [PATCH v5 0/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Date: Mon, 26 Feb 2018 22:18:52 +0100
Message-Id: <20180226211855.30015-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fifth revision of the rework patchset to use exec_op for NXP
Vybrid (and others) NAND Flash Controller. The most important
change tries to implement a nicer way of handling the endianness
hack.

The driver now passes all MTD tests. The approximate write/read
speed measured by mtd_speedtest is still looking good:

            write            read
original:    4036 KiB/s     13741 KiB/s
v2:          3495 KiB/s     13490 KiB/s
v3:          4469 KiB/s     13490 KiB/s
v5:          4440 KiB/s     13834 KiB/s

--
Stefan

Changes in v5:
- Fix COMMAND_NADDR_BYTES macro (fixes oob/page test issues)
- Renamed page_access to data_access
- Removed unclear debugging messages
- Introduce vf610_nfc_fill_row to avoid code dupplication in
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
  mtd: nand: vf610_nfc: make use of ->exec_op()
  mtd: nand: vf610_nfc: remove old hooks
  mtd: nand: vf610_nfc: support ONFI SET/GET_FEATURES commands

 drivers/mtd/nand/raw/vf610_nfc.c | 622 +++++++++++++++++++++++----------------
 1 file changed, 369 insertions(+), 253 deletions(-)

-- 
2.16.2
