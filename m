Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MiFQj-00016R-G2
	for linux-mtd@lists.infradead.org; Mon, 31 Aug 2009 22:32:58 +0000
Received: by fxm26 with SMTP id 26so927842fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Aug 2009 15:32:51 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 1 Sep 2009 07:32:50 +0900
Message-ID: <3da39c4b0908311532h61d2ff6dn1e48396d2bb8de55@mail.gmail.com>
Subject: inftl and BBT question
From: Lal <learner.kernel@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In function write_bbt (in file nand_bbt.c), the 'to' address is
this->bbt_erase_shift aligned if NAND_BBT_SAVECONTENT is enabled,
while it is this->page_shift aligned for all other cases.

 to = ((loff_t) page) << this->page_shift;

                /* Must we save the block contents ? */
                if (td->options & NAND_BBT_SAVECONTENT) {
                        /* Make it block aligned */
                        to &= ~((loff_t) ((1 << this->bbt_erase_shift) - 1));

Later in function nand_erase_nand (in file nand_base.c), erase
operation is aborted if 'to' address is not block aligned.

        /* Start address must align on block boundary */
        if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
                DEBUG(MTD_DEBUG_LEVEL0, "nand_erase: Unaligned address\n");
                return -EINVAL;
        }

The NAND_BBT_SAVECONTENT is enabled only in nftl_scan_bbt function,
while it is not enabled in inftl_scan_bbt function.

Can someone explain why this option is not enabled for inftl case?
Does inftl not support bad block table?

Thanks
Lal
