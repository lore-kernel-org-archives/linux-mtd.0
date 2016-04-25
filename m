Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aui50-0005BW-Pk
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 15:05:43 +0000
Date: Mon, 25 Apr 2016 17:05:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 3/3] mtd: brcmnand: respect ECC algorithm set by NAND
 subsystem
Message-ID: <20160425170510.26a3eb63@bbrezillon>
In-Reply-To: <1461324197-1333-3-git-send-email-zajec5@gmail.com>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
 <1461324197-1333-3-git-send-email-zajec5@gmail.com>
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

On Fri, 22 Apr 2016 13:23:15 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> It's more reliable than guessing based on ECC strength. It allows using
> NAND on devices with BCH-1 (e.g. D-Link DIR-885L).

Brian, Kamal, could you add your Ack on this patch.

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcm=
nand/brcmnand.c
> index c3331ff..dcb22dc 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1927,7 +1927,7 @@ static int brcmnand_setup_dev(struct brcmnand_host =
*host)
> =20
>  	switch (chip->ecc.size) {
>  	case 512:
> -		if (chip->ecc.strength =3D=3D 1) /* Hamming */
> +		if (chip->ecc.algo =3D=3D NAND_ECC_HAMMING)
>  			cfg->ecc_level =3D 15;
>  		else
>  			cfg->ecc_level =3D chip->ecc.strength;



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
