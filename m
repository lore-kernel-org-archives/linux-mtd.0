Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eNDVH-0001uh-49
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 07:55:29 +0000
Date: Fri, 8 Dec 2017 08:54:50 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Hanna Hawa <hannah@marvell.com>
Subject: Re: [PATCH v2] mtd: nand: add ->exec_op() implementation
Message-ID: <20171208075450.GA4359@kwain>
References: <20171207145434.21586-1-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171207145434.21586-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

Be careful when defining macros: avoid to name your arguments with a
value used in the macro that is not meant to be replaced.

On Thu, Dec 07, 2017 at 03:54:34PM +0100, Miquel Raynal wrote:
> +
> +#define NAND_OP_DATA_IN(l, buf, ns)					\
> +	{								\
> +		.type = NAND_OP_DATA_IN_INSTR,				\
> +		.ctx.data = {						\
> +			.len = l,					\
> +			.buf.in = buf,					\

Here.

> +			.force_8bit = false,				\
> +		},							\
> +		.delay_ns = ns,						\
> +	}
> +
> +#define NAND_OP_DATA_OUT(l, buf, ns)					\
> +	{								\
> +		.type = NAND_OP_DATA_OUT_INSTR,				\
> +		.ctx.data = {						\
> +			.len = l,					\
> +			.buf.out = buf,					\

And here.

> +			.force_8bit = false,				\
> +		},							\
> +		.delay_ns = ns,						\
> +	}

It works in your series because these macros are always called with the
second argument being a variable named 'buf', but that's not safe.

Thanks!
Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
