Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNZt6-0002cQ-6t
 for linux-mtd@lists.infradead.org; Sun, 22 Sep 2013 02:59:09 +0000
Message-ID: <523E5D57.6040008@freescale.com>
Date: Sun, 22 Sep 2013 11:00:39 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: correct extemded param page error handling
References: <1379706242-20548-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1379706242-20548-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C221=C8=D5 03:44, Brian Norris =D0=B4=B5=C0:
> If the ONFI extended parameter page gives codeword_size =3D=3D 0, the
> extended ECC information is corrupt and should not be used. Currently,
> we (correctly) avoid using the information, but we don't report the
> error to the caller, so the caller doesn't know that we didn't
> initialize ecc_strength_ds and ecc_step_ds. Now the caller can warn the
> user that it does not have sufficient information.
>
> This also removes the false and useless "ONFI extended param page
> detected" debug message (it was printed even on the aforementioned
> corruption, and for the success case, we don't really want a print).
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index 00022b4..0b39d0c 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2912,12 +2912,13 @@ static int nand_flash_detect_ext_param_page(str=
uct mtd_info *mtd,
>  	/* get the info we want. */
>  	ecc =3D (struct onfi_ext_ecc_info *)cursor;
> =20
> -	if (ecc->codeword_size) {
> -		chip->ecc_strength_ds =3D ecc->ecc_bits;
> -		chip->ecc_step_ds =3D 1 << ecc->codeword_size;
> +	if (!ecc->codeword_size) {
> +		pr_debug("Invalid codeword size\n");
> +		goto ext_out;
>  	}
> =20
> -	pr_info("ONFI extended param page detected.\n");
> +	chip->ecc_strength_ds =3D ecc->ecc_bits;
> +	chip->ecc_step_ds =3D 1 << ecc->codeword_size;
>  	ret =3D 0;
> =20
>  ext_out:
Acked-by: Huang Shijie <b32955@freescale.com>
