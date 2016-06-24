Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGW7E-0002rz-Fq
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 18:46:09 +0000
Received: by mail-wm0-x233.google.com with SMTP id v199so32255325wmv.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 11:45:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466277476-14853-2-git-send-email-hauke@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <1466277476-14853-2-git-send-email-hauke@hauke-m.de>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 24 Jun 2016 15:45:45 -0300
Message-ID: <CAAEAJfATWJL0fGEcBup+cWzhHUe_4CF4XHWuvp4NYOesmaTyZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ubi: open volumes define in device tree
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
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

On 18 June 2016 at 16:17, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> This makes it possible to define a volume to open in device tree. This
> is helpful when a root file system is on a ubi layer. Without this
> patch it is only possible to device with with kernel command line
> parameters.
>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  Documentation/devicetree/bindings/mtd/ubi.txt | 22 +++++++++++++++++
>  drivers/mtd/ubi/build.c                       | 34 +++++++++++++++++++++=
++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/ubi.txt b/Documentatio=
n/devicetree/bindings/mtd/ubi.txt
> index 5fcd47e..f87a7d8 100644
> --- a/Documentation/devicetree/bindings/mtd/ubi.txt
> +++ b/Documentation/devicetree/bindings/mtd/ubi.txt
> @@ -13,6 +13,16 @@ Describe of a UBI layer in device tree.
>                         which have to be assigned to the newly created UB=
I
>                         device (assigned automatically by default)
>
> +Partitions on a UBI layer can be defined:
> +
> + - compatible:                 "ubi,volume"
> + - name:               name of the ubi volume to open
> + - ubi-mode:           mode of the ubi volume to open value:
> +                       UBI_READONLY:   1
> +                       UBI_READWRITE:  2
> +                       UBI_EXCLUSIVE:  3
> +                       UBI_METAONLY:   4
> +
>  Example:
>
>  partitions {
> @@ -29,5 +39,17 @@ partitions {
>                 label =3D "system_sw";
>                 reg =3D <0x1c0000 0xc800000>;
>                 compatible =3D "ubi,device";
> +
> +               rootfsA@0 {
> +                       compatible =3D "ubi,volume";
> +                       name =3D "rootfsA";
> +                       ubi-mode =3D <1>;
> +               };
> +
> +               data_vol@0 {
> +                       compatible =3D "ubi,volume";
> +                       name =3D "data_vol";
> +                       ubi-mode =3D <2>;
> +               };
>         };
>  };
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 16baeb5..1c22533 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1,6 +1,7 @@
>  /*
>   * Copyright (c) International Business Machines Corp., 2006
>   * Copyright (c) Nokia Corporation, 2007
> + * Copyright (c) 2016 Hauke Mehrtens <hauke@hauke-m.de>
>   *

A tangential comment for this and other patches.

There's no need to add your copyright when you are submitting
small contributions.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
