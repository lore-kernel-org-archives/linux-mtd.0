Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7n6p-0000Qu-H7
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:47:01 +0000
Date: Wed, 3 Oct 2018 21:46:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, michals@xilinx.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nagasuresh12@gmail.com
Subject: Re: [LINUX PATCH v11 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181003214633.54e93c00@bbrezillon>
In-Reply-To: <1537878031-22253-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1537878031-22253-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 25 Sep 2018 17:50:31 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> +static int anfc_zero_len_page_write_type_exec(struct nand_chip *chip,
> +					      const struct nand_subop *subop)
> +{
> +	const struct nand_op_instr *instr;
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	struct anfc_nand_controller *nfc = to_anfc(chip->controller);
> +	unsigned int op_id;
> +	struct anfc_op nfc_op = {};
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	u32 addrcycles;
> +
> +	anfc_parse_instructions(chip, subop, &nfc_op);
> +	nfc->prog = PROG_PGRD;
> +	instr = nfc_op.data_instr;
> +	op_id = nfc_op.data_instr_idx;
> +
> +	addrcycles = achip->raddr_cycles + achip->caddr_cycles;
> +
> +	anfc_prepare_cmd(nfc, nfc_op.cmds[0], NAND_CMD_PAGEPROG, 1,

Why are the second opcode and the number of address cycles hardcoded.
That's simply not future-proof, and I don't want that. Also, I don't
understand why you do that, you have all the information you need in
subop and you keep guessing some parameters.

> +			 mtd->writesize, addrcycles);
> +	anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> +
> +	return 0;
> +}
