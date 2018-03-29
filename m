Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1Q8M-0007IZ-7Y
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 05:29:59 +0000
Received: by mail-ot0-x242.google.com with SMTP id i28-v6so5200088otf.8
 for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2018 22:29:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <746862757.61253.1522008301855.JavaMail.zimbra@raptorengineeringinc.com>
References: <746862757.61253.1522008301855.JavaMail.zimbra@raptorengineeringinc.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 29 Mar 2018 07:29:43 +0200
Message-ID: <CACna6rwWT1CNkov7PJiCCDYGciEa_assaj0MO3nkJNL2h_sJOA@mail.gmail.com>
Subject: Re: [PATCH] mtd/powernv_flash: Enable partition support
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tomthy,

On 25 March 2018 at 22:05, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> On certain systems, such as the Talos II, skiboot emits a partition
> table for the main PNOR MTD device in the generated device tree.
>
> Allow this partition table to be parsed and the partitions to be
> exposed via MTD device partition nodes.

Your commit is missing a Signed-off-by


> ---
>  drivers/mtd/devices/powernv_flash.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/po=
wernv_flash.c
> index 26f9feaa5d17..f76045f78221 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -2,6 +2,7 @@
>   * OPAL PNOR flash MTD abstraction
>   *
>   * Copyright IBM 2015
> + * Copyright Raptor Engineering, LLC 2018
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -47,6 +48,8 @@ enum flash_op {
>         FLASH_OP_ERASE,
>  };
>
> +static char const * const part_probes[] =3D { "ofpart", NULL };
> +
>  /*
>   * Don't return -ERESTARTSYS if we can't get a token, the MTD core
>   * might have split up the call from userspace and called into the
> @@ -267,9 +270,14 @@ static int powernv_flash_probe(struct platform_devic=
e *pdev)
>         /*
>          * The current flash that skiboot exposes is one contiguous flash=
 chip
>          * with an ffs partition at the start, it should prove easier for=
 users
> -        * to deal with partitions or not as they see fit
> +        * to deal with partitions or not as they see fit.  skitboot plac=
es this
> +        * on the first MTD partition.
> +        *
> +        * Certain partitions may also be exposed to the host, such as th=
e boot
> +        * kernel firmware partition.
>          */
> -       return mtd_device_register(&data->mtd, NULL, 0);
> +       mtd_set_of_node(&data->mtd, dev->of_node);
> +       return mtd_device_parse_register(&data->mtd, part_probes, NULL, N=
ULL, 0);

It seems the only change introduced by this patch is passing a list of
parsers. That way you override a default list of parsers:
"cmdlinepart", "ofpart", NULL
with a custom one:
"ofpart", NULL

I don't see how it really changes anything/much. Can you explain it
please? It seems that the only purpose of your change is to don't
probe "cmdlinepart" parser which reads "mtdparts=3D" from the cmd line.

Which parser exactly is supposed to detect partitions on your device?
"fixed-partitions"? "ofoldpart"? Does your DTB contains "compatible"
property for flash node? Please paste the relevant part of your DTB if
applicable.


>  }
>
>  /**

--=20
Rafa=C5=82
