Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBD3i-0006Z1-PP
 for linux-mtd@lists.infradead.org; Sat, 13 Oct 2018 06:05:56 +0000
Date: Sat, 13 Oct 2018 08:05:42 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: ams-delta: Use ->exec_op()
Message-ID: <20181013080542.2ae9b199@bbrezillon>
In-Reply-To: <20181012204101.26274-2-jmkrzyszt@gmail.com>
References: <20181003120028.9257-1-jmkrzyszt@gmail.com>
 <20181012204101.26274-1-jmkrzyszt@gmail.com>
 <20181012204101.26274-2-jmkrzyszt@gmail.com>
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

Hi Janusz,

On Fri, 12 Oct 2018 22:41:01 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Replace legacy callbacks with ->select_chip() and ->exec_op().
> 
> In order to remove any references to legacy structure members, use of 
> .IO_ADDR_R/W has been replaced wit runtime calculations based on

				 ^ with

> priv->io_base.

Can we do that in 2 steps?

1/ Stop using .IO_ADDR_R/W
2/ Convert the driver to ->exec_op()

> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---

[...]

> -static int ams_delta_nand_ready(struct nand_chip *this)
> +static int ams_delta_exec_op(struct nand_chip *this,
> +			     const struct nand_operation *op, bool check_only)
>  {
>  	struct ams_delta_nand *priv = nand_get_controller_data(this);
> +	const struct nand_op_instr *instr;
> +	int ret = 0;
> +

You should have:

	if (check_only)
		return 0;

Other than that, the conversion looks good, so you can add

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com> once you've
addressed my comments.

Regards,

Boris

> +	for (instr = op->instrs; instr < op->instrs + op->ninstrs; instr++) {
> +
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			gpiod_set_value(priv->gpiod_cle, 1);
> +			ams_delta_write_buf(priv, &instr->ctx.cmd.opcode, 1);
> +			gpiod_set_value(priv->gpiod_cle, 0);
> +			break;
> +
> +		case NAND_OP_ADDR_INSTR:
> +			gpiod_set_value(priv->gpiod_ale, 1);
> +			ams_delta_write_buf(priv, instr->ctx.addr.addrs,
> +					    instr->ctx.addr.naddrs);
> +			gpiod_set_value(priv->gpiod_ale, 0);
> +			break;
> +
> +		case NAND_OP_DATA_IN_INSTR:
> +			ams_delta_read_buf(priv, instr->ctx.data.buf.in,
> +					   instr->ctx.data.len);
> +			break;
> +
> +		case NAND_OP_DATA_OUT_INSTR:
> +			ams_delta_write_buf(priv, instr->ctx.data.buf.out,
> +					    instr->ctx.data.len);
> +			break;
> +
> +		case NAND_OP_WAITRDY_INSTR:
> +			ret = priv->gpiod_rdy ?
> +			      nand_gpio_waitrdy(this, priv->gpiod_rdy,
> +						instr->ctx.waitrdy.timeout_ms) :
> +			      nand_soft_waitrdy(this,
> +						instr->ctx.waitrdy.timeout_ms);
> +			break;
> +		}
> +
> +		if (ret)
> +			break;
> +	}
>  
> -	return gpiod_get_value(priv->gpiod_rdy);
> +	return ret;
>  }
