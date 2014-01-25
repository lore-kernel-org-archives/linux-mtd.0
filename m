Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6z3h-0007Rw-De
 for linux-mtd@lists.infradead.org; Sat, 25 Jan 2014 08:57:45 +0000
Received: by mail-pd0-f175.google.com with SMTP id w10so3973011pde.34
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jan 2014 00:57:24 -0800 (PST)
Date: Sat, 25 Jan 2014 00:57:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v1 2/2] mtd: nand: omap: fix ecclayout to be in sync with
 u-boot NAND driver
Message-ID: <20140125085719.GC3162@norris-Latitude-E6410>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
 <1386925978-23705-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386925978-23705-3-git-send-email-pekon@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stefan Roese <sr@denx.de>, Michael Trimarchi <michael@amarulasolutions.com>,
 r-woodruff2@ti.com, u-boot@lists.denx.de, avinashphilipk@gmail.com,
 Artem Bityutskiy <dedekind1@gmail.com>, jp.francois@cynove.com,
 r.meier@siemens.com, balbi@ti.com, Tom Rini <trini@ti.com>,
 Enric Balletbo Serra <eballetbo@iseebcn.com>, linux-mtd@lists.infradead.org,
 Igor Grinberg <grinberg@compulab.co.il>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 linux-omap <linux-omap@vger.kernel.org>, ivan.djelic@parrot.com,
 Nikita Kiryanov <nikita@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 13, 2013 at 02:42:58PM +0530, Pekon Gupta wrote:
> @@ -1851,7 +1854,13 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		ecclayout->eccbytes		= nand_chip->ecc.bytes *
>  							(mtd->writesize /
>  							nand_chip->ecc.size);
> -		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
> +		oob_index			= BADBLOCK_MARKER_LENGTH;
> +		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++) {
> +			if ((i % nand_chip->ecc.bytes) || (i == 0))
> +				ecclayout->eccpos[i] = oob_index;
> +			else
> +				ecclayout->eccpos[i] = ++oob_index;

This if-else structure, with a combined assignment and increment kind of
obscures the logic of what you're really trying to do. Could this be
better as follows?

		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++) {
			ecclayout->eccpos[i] = oob_index;
			if (((i + 1) % nand_chip->ecc.bytes) == 0)
				oob_index++;
		}

> +		}
>  		/* software bch library is used for locating errors */
>  		nand_chip->ecc.priv		= nand_bch_init(mtd,
>  							nand_chip->ecc.size,

Brian
