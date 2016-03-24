Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj6ej-0004mR-Pe
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2016 14:54:51 +0000
Received: by mail-wm0-x22d.google.com with SMTP id l68so240094069wml.0
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2016 07:54:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1458784407-12908-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1458784407-12908-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Date: Thu, 24 Mar 2016 11:54:14 -0300
Message-ID: <CAAEAJfDswRC47O1JDRhPkLxPe6aqFLwJQRWJhYPyPTA9RKNsJg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: jz4780: fixup,
 device structure assigned at probe
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alex Smith <alex@alex-smith.me.uk>, Harvey Hunt <harvey.hunt@imgtec.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Jorge,

On 23 March 2016 at 22:53, Jorge Ramirez-Ortiz
<jorge.ramirez-ortiz@linaro.org> wrote:

Can you re-submit, with some proper commit log explaining the patch?

> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mtd/nand/jz4780_bch.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.=
c
> index 755499c..d74f4ba 100644
> --- a/drivers/mtd/nand/jz4780_bch.c
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -287,7 +287,6 @@ static struct jz4780_bch *jz4780_bch_get(struct devic=
e_node *np)
>         bch =3D platform_get_drvdata(pdev);
>         clk_prepare_enable(bch->clk);
>
> -       bch->dev =3D &pdev->dev;
>         return bch;
>  }
>
> --
> 2.5.0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


Thanks,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
