Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUufZ-0008JD-J3
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 13:58:11 +0000
Date: Mon, 18 Jun 2018 15:57:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: fix return value check for bad block status
Message-ID: <20180618155757.6cbe0fae@xps13>
In-Reply-To: <1528880556-20348-1-git-send-email-absahu@codeaurora.org>
References: <1528880556-20348-1-git-send-email-absahu@codeaurora.org>
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

On Wed, 13 Jun 2018 14:32:36 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Positive return value from read_oob() is making false BAD
> blocks. For some of the NAND controllers, OOB bytes will be
> protected with ECC and read_oob() will return number of bitflips.
> If there is any bitflip in ECC protected OOB bytes for BAD block
> status page, then that block is getting treated as BAD.
>=20
> Fixes: c120e75e0e7d ("mtd: nand: use read_oob() instead of cmdfunc() for =
bad block check")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
> index f28c3a5..4a73f73 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -440,7 +440,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_=
t ofs)
> =20
>  	for (; page < page_end; page++) {
>  		res =3D chip->ecc.read_oob(mtd, chip, page);
> -		if (res)
> +		if (res < 0)
>  			return res;
> =20
>  		bad =3D chip->oob_poi[chip->badblockpos];

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

I suppose this patch is a good candidate to be part of a future
mtd/fixes PR?

Regards,
Miqu=C3=A8l
