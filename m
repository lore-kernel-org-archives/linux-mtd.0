Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eccQW-0000VS-BD
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 19:34:13 +0000
Date: Fri, 19 Jan 2018 11:33:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Miquel Raynal <miquel.raynal@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: Fix build issues due to an anonymous union
Message-Id: <20180119113359.22dd2de344c41f8bbdba844e@linux-foundation.org>
In-Reply-To: <20180119191339.551eed6d@bbrezillon>
References: <20180119181127.10473-1-miquel.raynal@free-electrons.com>
 <20180119191339.551eed6d@bbrezillon>
Mime-Version: 1.0
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

On Fri, 19 Jan 2018 19:13:39 +0100 Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Fri, 19 Jan 2018 19:11:27 +0100
> Miquel Raynal <miquel.raynal@free-electrons.com> wrote:
> 
> > GCC-4.4.4 raises errors when assigning a parameter in an anonymous
> > union, leading to this kind of failure:
> > 
> > drivers/mtd/nand/marvell_nand.c:1936:
> >     warning: missing braces around initializer
> >     warning: (near initialization for '(anonymous)[1].<anonymous>')
> >     error: unknown field 'data' specified in initializer
> >     error: unknown field 'addr' specified in initializer
> > 
> > Work around the situation by naming these unions.
> > 
> > Reported-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Tested-by: Andrew Morton <akpm@linux-foundation.org>

> > @@ -975,21 +975,27 @@ struct nand_op_parser_pattern_elem {
> >  	{							\
> >  		.type = NAND_OP_ADDR_INSTR,			\
> >  		.optional = _opt,				\
> > -		.addr.maxcycles = _maxcycles,			\
> > +		.ctx.addr = {					\
> > +			.maxcycles = _maxcycles,		\
> > +		},						\
> 
> Or just
> 		.ctx.addr.maxcycles = _maxcycles,
> 
> No need to send a new version, I'll fix it when applying.

Yes, this also works with gcc-4.4.4:

--- a/include/linux/mtd/rawnand.h~mtd-nand-fix-build-issues-due-to-an-anonymous-union-fix
+++ a/include/linux/mtd/rawnand.h
@@ -975,27 +975,21 @@ struct nand_op_parser_pattern_elem {
 	{							\
 		.type = NAND_OP_ADDR_INSTR,			\
 		.optional = _opt,				\
-		.ctx.addr = {					\
-			.maxcycles = _maxcycles,		\
-		},						\
+		.ctx.addr.maxcycles = _maxcycles,		\
 	}
 
 #define NAND_OP_PARSER_PAT_DATA_IN_ELEM(_opt, _maxlen)		\
 	{							\
 		.type = NAND_OP_DATA_IN_INSTR,			\
 		.optional = _opt,				\
-		.ctx.data = {					\
-			.maxlen = _maxlen,			\
-		},						\
+		.ctx.data.maxlen = _maxlen,			\
 	}
 
 #define NAND_OP_PARSER_PAT_DATA_OUT_ELEM(_opt, _maxlen)		\
 	{							\
 		.type = NAND_OP_DATA_OUT_INSTR,			\
 		.optional = _opt,				\
-		.ctx.data = {					\
-			.maxlen = _maxlen,			\
-		},						\
+		.ctx.data.maxlen = _maxlen,			\
 	}
 
 #define NAND_OP_PARSER_PAT_WAITRDY_ELEM(_opt)			\
_
