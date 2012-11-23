Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tbsby-0006Rv-PD
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 12:44:07 +0000
From: Johan Gunnarsson <johan.gunnarsson@axis.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 23 Nov 2012 13:45:41 +0100
Subject: RE: [PATCH] nand_wait_ready timeout fix
Message-ID: <A612847CFE53224C91B23E3A5B48BAC755FB48A606@xmail3.se.axis.com>
References: <1353605488-29438-1-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1353605488-29438-1-git-send-email-matthieu.castet@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Matthieu CASTET
> Sent: den 22 november 2012 18:31
> To: linux-mtd@lists.infradead.org
> Cc: Matthieu CASTET; dedekind1@gmail.com
> Subject: [PATCH] nand_wait_ready timeout fix
>=20
> nand_wait_ready timeout should not assume HZ=3D100.
> Make it independent of HZ value by using msecs_to_jiffies.
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c
> b/drivers/mtd/nand/nand_base.c
> index 1a03b7f..16e95e7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -492,7 +492,7 @@ static void panic_nand_wait_ready(struct mtd_info
> *mtd, unsigned long timeo)
>  void nand_wait_ready(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip =3D mtd->priv;
> -	unsigned long timeo =3D jiffies + 2;
> +	unsigned long timeo =3D jiffies + msecs_to_jiffies(20);

This won't work well for HZ <=3D 50 (probably not a very realistic case,
but still...)

I was involved in a discussion about this some months ago. The output of
that discussion was that it is probably safe to set the timeout to much
longer, like 1000ms, for both program and erase commands.

>=20
>  	/* 400ms timeout */
>  	if (in_interrupt() || oops_in_progress)
> --
> 1.7.10.4
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
