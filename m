Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecbAx-0003rp-4l
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 18:14:04 +0000
Date: Fri, 19 Jan 2018 19:13:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH] mtd: nand: Fix build issues due to an anonymous union
Message-ID: <20180119191339.551eed6d@bbrezillon>
In-Reply-To: <20180119181127.10473-1-miquel.raynal@free-electrons.com>
References: <20180119181127.10473-1-miquel.raynal@free-electrons.com>
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

On Fri, 19 Jan 2018 19:11:27 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> GCC-4.4.4 raises errors when assigning a parameter in an anonymous
> union, leading to this kind of failure:
> 
> drivers/mtd/nand/marvell_nand.c:1936:
>     warning: missing braces around initializer
>     warning: (near initialization for '(anonymous)[1].<anonymous>')
>     error: unknown field 'data' specified in initializer
>     error: unknown field 'addr' specified in initializer
> 
> Work around the situation by naming these unions.
> 
> Reported-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 13 +++++++------
>  include/linux/mtd/rawnand.h  | 14 ++++++++++----
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e4e39890a975..a3260e6207b8 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2332,23 +2332,24 @@ nand_op_parser_must_split_instr(const struct nand_op_parser_pattern_elem *pat,
>  {
>  	switch (pat->type) {
>  	case NAND_OP_ADDR_INSTR:
> -		if (!pat->addr.maxcycles)
> +		if (!pat->ctx.addr.maxcycles)
>  			break;
>  
>  		if (instr->ctx.addr.naddrs - *start_offset >
> -		    pat->addr.maxcycles) {
> -			*start_offset += pat->addr.maxcycles;
> +		    pat->ctx.addr.maxcycles) {
> +			*start_offset += pat->ctx.addr.maxcycles;
>  			return true;
>  		}
>  		break;
>  
>  	case NAND_OP_DATA_IN_INSTR:
>  	case NAND_OP_DATA_OUT_INSTR:
> -		if (!pat->data.maxlen)
> +		if (!pat->ctx.data.maxlen)
>  			break;
>  
> -		if (instr->ctx.data.len - *start_offset > pat->data.maxlen) {
> -			*start_offset += pat->data.maxlen;
> +		if (instr->ctx.data.len - *start_offset >
> +		    pat->ctx.data.maxlen) {
> +			*start_offset += pat->ctx.data.maxlen;
>  			return true;
>  		}
>  		break;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 469dc724f5df..f89fd2331f4a 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -962,7 +962,7 @@ struct nand_op_parser_pattern_elem {
>  	union {
>  		struct nand_op_parser_addr_constraints addr;
>  		struct nand_op_parser_data_constraints data;
> -	};
> +	} ctx;
>  };
>  
>  #define NAND_OP_PARSER_PAT_CMD_ELEM(_opt)			\
> @@ -975,21 +975,27 @@ struct nand_op_parser_pattern_elem {
>  	{							\
>  		.type = NAND_OP_ADDR_INSTR,			\
>  		.optional = _opt,				\
> -		.addr.maxcycles = _maxcycles,			\
> +		.ctx.addr = {					\
> +			.maxcycles = _maxcycles,		\
> +		},						\

Or just
		.ctx.addr.maxcycles = _maxcycles,

No need to send a new version, I'll fix it when applying.

>  	}
>  
>  #define NAND_OP_PARSER_PAT_DATA_IN_ELEM(_opt, _maxlen)		\
>  	{							\
>  		.type = NAND_OP_DATA_IN_INSTR,			\
>  		.optional = _opt,				\
> -		.data.maxlen = _maxlen,				\
> +		.ctx.data = {					\
> +			.maxlen = _maxlen,			\
> +		},						\
>  	}
>  
>  #define NAND_OP_PARSER_PAT_DATA_OUT_ELEM(_opt, _maxlen)		\
>  	{							\
>  		.type = NAND_OP_DATA_OUT_INSTR,			\
>  		.optional = _opt,				\
> -		.data.maxlen = _maxlen,				\
> +		.ctx.data = {					\
> +			.maxlen = _maxlen,			\
> +		},						\
>  	}
>  
>  #define NAND_OP_PARSER_PAT_WAITRDY_ELEM(_opt)			\
