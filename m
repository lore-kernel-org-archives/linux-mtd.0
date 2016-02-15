Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aVQjI-0002LA-VN
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2016 21:30:49 +0000
Received: by mail-wm0-x241.google.com with SMTP id b205so10297571wmb.1
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2016 13:30:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455300685-27009-3-git-send-email-zajec5@gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-3-git-send-email-zajec5@gmail.com>
Date: Mon, 15 Feb 2016 16:30:27 -0500
Message-ID: <CAC=U0a2ZeJrxHwCQZ5U3QvO7+W4Y9m4LRbULvOJGgMG9rutDng@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: brcmnand: fix check for Hamming algorithm
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 devicetree@vger.kernel.org
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

On Fri, Feb 12, 2016 at 1:11 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> So far we were treating ECC strength 1 as Hamming algorithm. It didn't
> supporting some less common devices with BCH-1 (e.g. D-Link DIR-885L).
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

Thanks Rafal
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcm=
nand/brcmnand.c
> index 844fc07..b8055da 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1842,7 +1842,7 @@ static int brcmnand_setup_dev(struct brcmnand_host =
*host)
>
>         switch (chip->ecc.size) {
>         case 512:
> -               if (chip->ecc.strength =3D=3D 1) /* Hamming */
> +               if (chip->ecc.algo =3D=3D NAND_ECC_HAMMING)
>                         cfg->ecc_level =3D 15;
>                 else
>                         cfg->ecc_level =3D chip->ecc.strength;
> --
> 1.8.4.5
>
