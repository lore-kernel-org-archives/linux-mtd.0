Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0Det-0008KN-Sx
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 20:54:05 +0000
Date: Mon, 17 Apr 2017 22:53:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v5 1/6] nand: spi: add basic blocks for infrastructure
Message-ID: <20170417225331.4f5c53fd@bbrezillon>
In-Reply-To: <1491810713-27795-2-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
 <1491810713-27795-2-git-send-email-peterpandong@micron.com>
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

On Mon, 10 Apr 2017 15:51:48 +0800
Peter Pan <peterpandong@micron.com> wrote:

> +
> +struct spinand_ecc_engine_ops {
> +	void (*get_ecc_status)(struct spinand_device *chip,
> +			       unsigned int status, unsigned int *corrected,
> +			       unsigned int *ecc_errors);

No need to specify ecc, we're interacting with an ECC engine, so I
guess it's already assumed.

	void (*get_stats)(struct spinand_device *chip,
			  unsigned int status,
			  unsigned int *corrected,
			  unsigned int *errors);

BTW, we probably need max_bitflips, unless corrected already contains
this information, in which case it should probably be clarified (better
name + kernel doc).

> +	void (*disable_ecc)(struct spinand_device *chip);
> +	void (*enable_ecc)(struct spinand_device *chip);

Ditto, just enable()/disable().

> +};
> +
> +enum spinand_ecc_type {
> +	SPINAND_ECC_ONDIE,
> +	SPINAND_ECC_HW,
> +};

Probably something we should extract from rawnand.h and move to nand.h
so that we can share the same definition (until we also share the ECC
engine interface).

> +
> +struct spinand_ecc_engine {
> +	u32 strength;
> +	u32 steps;
> +	const struct spinand_ecc_engine_ops *ops;
> +};

The same ECC engine engine can possibly be used with different NAND
devices. So what you're describing here is more an ECC engine user than
the ECC engine itself.

Ideally we should have:

struct nand_ecc_engine {
	/* Some info describing engine caps. */
	const struct spinand_ecc_engine_ops *ops;
};

struct nand_ecc_engine_user {
	u32 strength;
	u32 steps;
	struct nand_ecc_engine *engine;
};

Anyway, I think we can keep that for later.

BTW, would you mind keeping all that is ECC related outside of this
initial series, or at least, add it in separate patches?
