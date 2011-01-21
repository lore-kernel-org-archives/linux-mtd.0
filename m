MIME-Version: 1.0
In-Reply-To: <1295518680-8737-1-git-send-email-s-ghorai@ti.com>
References: <1295518680-8737-1-git-send-email-s-ghorai@ti.com>
From: Kishore Kadiyala <kishorek.kadiyala@gmail.com>
Date: Fri, 21 Jan 2011 13:41:53 +0530
Message-ID: <AANLkTimsD1108ASF3H9Y8pjaTsfv0D33K11KOXDmypvJ@mail.gmail.com>
Subject: Re: [PATCH] omap3: nand: bch ecc support added
To: Sukumar Ghorai <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ghorai,

<snip>

> =A0#ifdef CONFIG_MTD_PARTITIONS
> diff --git a/drivers/mtd/nand/omap_bch_decoder.c b/drivers/mtd/nand/omap_=
bch_decoder.c
> new file mode 100644
> index 0000000..da42bda
> --- /dev/null
> +++ b/drivers/mtd/nand/omap_bch_decoder.c
> @@ -0,0 +1,393 @@
> +/*
> + * drivers/mtd/nand/omap_omap_bch_decoder.c
> + *
> + * Whole BCH ECC Decoder (Post hardware generated syndrome decoding)
> + *
> + * Copyright (c) 2007 Texas Instruments
> + *
> + * Author: Sukumar Ghorai <s-ghorai@ti.com
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Michael Fillinger <m-fillinger@ti.com>

Vimal was the original author who has created this file
[No change in file name/directory hierarchy].
It's not fair to remove Vimal's author and add your's.

Instead you should have kept his name and added your's.

<snip>

Regards,
Kishore
