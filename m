Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7mzD-0003fj-7A
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:39:09 +0000
Date: Wed, 3 Oct 2018 21:38:44 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, michals@xilinx.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nagasuresh12@gmail.com
Subject: Re: [LINUX PATCH v11 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181003213844.14d4095e@bbrezillon>
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

Hi Naga,

On Tue, 25 Sep 2018 17:50:31 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> +static int anfc_read_param_get_feature_sp_read_type_exec(struct nand_chip *chip,
> +							 const struct nand_subop
> +							 *subop)
> +{
> +	const struct nand_op_instr *instr;
> +	struct anfc_nand_controller *nfc = to_anfc(chip->controller);
> +	unsigned int op_id, len;
> +	struct anfc_op nfc_op = {};
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	u32 dma_mode, addrcycles, write_size;
> +
> +	anfc_parse_instructions(chip, subop, &nfc_op);
> +	instr = nfc_op.data_instr;
> +	op_id = nfc_op.data_instr_idx;
> +
> +	if (nfc_op.cmds[0] == NAND_CMD_PARAM) {
> +		nfc->prog = PROG_RDPARAM;
> +		dma_mode = 0;
> +		addrcycles = 1;
> +		write_size = 0;
> +	}
> +	if (nfc_op.cmds[0] == NAND_CMD_GET_FEATURES) {
> +		nfc->prog = PROG_GET_FEATURE;
> +		dma_mode = 0;
> +		addrcycles = 1;
> +		write_size = 0;
> +	}
> +	if (nfc_op.cmds[0] == NAND_CMD_READ0) {
> +		nfc->prog = PROG_PGRD;
> +		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
> +		write_size = mtd->writesize;
> +		dma_mode = 1;
> +	}
> +

Sorry, but I still don't understand why nfc->prog is different. Did you
try using PROG_PGRD for all these ops? I mean, the sequence is the
same, and you keep passing the opcode and the number of address cycles
to the engine using other reg fields.

Also, you're not using the addrcycles info provided by the the address
instruction and instead deduce it based on the opcode, which is wrong.
To make it clearer, I'd like to avoid those
nfc_op.cmds[0] == NAND_OPCODE tests, because it's exactly the kind of
things we were trying to get rid off by introducing the ->exec_op()
interface.

> +	anfc_prepare_cmd(nfc, nfc_op.cmds[0], 0, dma_mode, write_size,
> +			 addrcycles);
> +	anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> +
> +	if (!nfc_op.data_instr)
> +		return 0;
> +
> +	len = nand_subop_get_data_len(subop, op_id);
> +	anfc_rw_pio_op(mtd, nfc->buf, roundup(len, 4), 1, nfc->prog, 1, 0);
> +	memcpy(instr->ctx.data.buf.in,  nfc->buf, len);
> +
> +	return 0;
> +}
