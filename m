Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHrbd-0003jn-9z
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 14:36:29 +0000
Date: Wed, 31 Oct 2018 15:36:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix nanddev_neraseblocks()
Message-ID: <20181031153602.7abe8825@xps13>
In-Reply-To: <20181028112955.26547-1-boris.brezillon@bootlin.com>
References: <20181028112955.26547-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Sun, 28 Oct 2018
12:29:55 +0100:

> nanddev_neraseblocks() currently returns the number pages per LUN
> instead of the total number of eraseblocks.
>=20
> Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAN=
D devices")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  include/linux/mtd/nand.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index abe975c87b90..78b86dea2f29 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -324,9 +324,8 @@ static inline unsigned int nanddev_ntargets(const str=
uct nand_device *nand)
>   */
>  static inline unsigned int nanddev_neraseblocks(const struct nand_device=
 *nand)
>  {
> -	return (u64)nand->memorg.luns_per_target *
> -	       nand->memorg.eraseblocks_per_lun *
> -	       nand->memorg.pages_per_eraseblock;
> +	return nand->memorg.ntargets * nand->memorg.luns_per_target *
> +	       nand->memorg.eraseblocks_per_lun;
>  }
> =20
>  /**


Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
