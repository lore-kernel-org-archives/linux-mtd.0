Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aVQvg-0000pe-Rj
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2016 21:43:37 +0000
Received: by mail-wm0-x241.google.com with SMTP id c200so17735768wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2016 13:43:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
Date: Mon, 15 Feb 2016 16:43:15 -0500
Message-ID: <CAC=U0a2v7-6OGvUCiyNgvey_RQonG3XYnnfP-VeuRFLUwbVTiQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
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
> This allows specifying algorithm used for NAND ECC. There are two
> available values: "bch" and "hamming". It's important as having just
> ECC parameters (step, strength) isn't enough to determine algorithm,
> e.g. you can't distinct BCH-1 and Hamming.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

Thanks Rafal
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |  3 +++
>  drivers/of/of_mtd.c                            | 33 ++++++++++++++++++++=
++++++
>  include/linux/mtd/nand.h                       |  5 ++++
>  include/linux/of_mtd.h                         |  6 +++++
>  4 files changed, 47 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentati=
on/devicetree/bindings/mtd/nand.txt
> index b53f92e..a2c2df5 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,6 +3,9 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_fir=
st",
>    "soft_bch".
> +- nand-ecc-algo : string, algorithm of NAND ecc.
> +                 Supported values are: "bch", "hamming". The default one=
 is
> +                 "bch".
>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not presen=
t false
>
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed..f2a6630 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -50,6 +50,39 @@ int of_get_nand_ecc_mode(struct device_node *np)
>  EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
>
>  /**
> + * It maps 'enum nand_ecc_algo' found in include/linux/mtd/nand.h into t=
he
> + * device tree binding of 'nand-ecc-algo'.
> + */
> +static const char * const nand_ecc_algos[] =3D {
> +       [NAND_ECC_BCH]          =3D "bch",
> +       [NAND_ECC_HAMMING]      =3D "hamming",
> +};
> +
> +/**
> + * of_get_nand_ecc_algo - Get nand ecc algorithm for given device_node
> + * @np:        Pointer to the given device_node
> + *
> + * The function gets ecc algorithm string from property 'nand-ecc-algo' =
and
> + * returns its index in nand_ecc_algos table, or errno in error case.
> + */
> +int of_get_nand_ecc_algo(struct device_node *np)
> +{
> +       const char *pm;
> +       int err, i;
> +
> +       err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
> +       if (err < 0)
> +               return err;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
> +               if (!strcasecmp(pm, nand_ecc_algos[i]))
> +                       return i;
> +
> +       return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);
> +
> +/**
>   * of_get_nand_ecc_step_size - Get ECC step size associated to
>   * the required ECC strength (see below).
>   * @np:        Pointer to the given device_node
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7604f4b..25854d2 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -119,6 +119,11 @@ typedef enum {
>         NAND_ECC_SOFT_BCH,
>  } nand_ecc_modes_t;
>
> +enum nand_ecc_algo {
> +       NAND_ECC_BCH,
> +       NAND_ECC_HAMMING,
> +};
> +
>  /*
>   * Constants for Hardware ECC
>   */
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index e266caa..0f6aca5 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -13,6 +13,7 @@
>
>  #include <linux/of.h>
>  int of_get_nand_ecc_mode(struct device_node *np);
> +int of_get_nand_ecc_algo(struct device_node *np);
>  int of_get_nand_ecc_step_size(struct device_node *np);
>  int of_get_nand_ecc_strength(struct device_node *np);
>  int of_get_nand_bus_width(struct device_node *np);
> @@ -25,6 +26,11 @@ static inline int of_get_nand_ecc_mode(struct device_n=
ode *np)
>         return -ENOSYS;
>  }
>
> +static inline int of_get_nand_ecc_algo(struct device_node *np)
> +{
> +       return -ENOSYS;
> +}
> +
>  static inline int of_get_nand_ecc_step_size(struct device_node *np)
>  {
>         return -ENOSYS;
> --
> 1.8.4.5
>
