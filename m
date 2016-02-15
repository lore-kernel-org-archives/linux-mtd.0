Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aVQkK-0002hu-4q
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2016 21:31:52 +0000
Received: by mail-wm0-x241.google.com with SMTP id c200so17692964wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2016 13:31:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455300685-27009-2-git-send-email-zajec5@gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-2-git-send-email-zajec5@gmail.com>
Date: Mon, 15 Feb 2016 16:31:30 -0500
Message-ID: <CAC=U0a0TybW0jHavZtuWk5-1AEX809rX_e-+qGwYwehk=+cpAw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
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
>
> This will allow drivers handle ECC properly.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

Thanks Rafal
>
> ---
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  include/linux/mtd/nand.h     | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index f2c8ff3..ef977f3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3979,7 +3979,7 @@ ident_done:
>  static int nand_dt_init(struct nand_chip *chip)
>  {
>         struct device_node *dn =3D nand_get_flash_node(chip);
> -       int ecc_mode, ecc_strength, ecc_step;
> +       int ecc_mode, ecc_algo, ecc_strength, ecc_step;
>
>         if (!dn)
>                 return 0;
> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
>                 chip->bbt_options |=3D NAND_BBT_USE_FLASH;
>
>         ecc_mode =3D of_get_nand_ecc_mode(dn);
> +       ecc_algo =3D of_get_nand_ecc_algo(dn);
>         ecc_strength =3D of_get_nand_ecc_strength(dn);
>         ecc_step =3D of_get_nand_ecc_step_size(dn);
>
> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
>         if (ecc_mode >=3D 0)
>                 chip->ecc.mode =3D ecc_mode;
>
> +       if (ecc_algo >=3D 0)
> +               chip->ecc.algo =3D ecc_algo;
> +
>         if (ecc_strength >=3D 0)
>                 chip->ecc.strength =3D ecc_strength;
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 25854d2..8deca1b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -513,6 +513,7 @@ struct nand_hw_control {
>   */
>  struct nand_ecc_ctrl {
>         nand_ecc_modes_t mode;
> +       enum nand_ecc_algo algo;
>         int steps;
>         int size;
>         int bytes;
> --
> 1.8.4.5
>
