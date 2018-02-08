Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejw6K-0007Cx-2F
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 23:59:37 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [RFC PATCH v3 0/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Date: Fri,  9 Feb 2018 00:59:18 +0100
Message-Id: <20180208235921.31840-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Third revision of the rework patchset to use exec_op for NXP
Vybrid (and others) NAND Flash Controller.

I now avoided calling back into the stack for the ECC read/
write pages. This increases speed 4469 KiB/s write speed and
13490 KiB/s read speed (v2 was 3495 KiB/s/13490 KiB/s).

IMHO it start to look better, probably still needs some fine
tuning. What I don't like too much is that the custom
read/write page accessors dupplicate some code, maybe this
could be done somewhat nicer.

--
Stefan

Changes in v3:
- Separate exec_op() callback addition and removal of old callbacks
- Push data into regs in one function
- Readd op parser
- Implement custom read/write page for hardware ECC
- Rely on generic ecc.write_page_raw
- Use nand_read_oob_op instead of nand_read_page_op

Stefan Agner (3):
  mtd: nand: vf610_nfc: remove unused function
  mtd: nand: vf610_nfc: make use of ->exec_op()
  mtd: nand: vf610_nfc: remove old hooks

 drivers/mtd/nand/vf610_nfc.c | 493 +++++++++++++++++++++----------------------
 1 file changed, 239 insertions(+), 254 deletions(-)

-- 
2.16.1
