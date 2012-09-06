Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9bkr-000528-T1
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 13:04:24 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mxc_nand : allow swapping the Bad block Indicator for
 NFC v1.
Date: Thu, 6 Sep 2012 15:03:09 +0200
References: <1345811288.2848.308.camel@sauron.fi.intel.com>
 <1345825064-9147-1-git-send-email-gcembed@gmail.com>
In-Reply-To: <1345825064-9147-1-git-send-email-gcembed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201209061503.09923.jbe@pengutronix.de>
Cc: J.Lambrecht@televic.com, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?utf-8?q?Ga=C3=ABtan_Carlier?= <gcembed@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ga=C3=ABtan Carlier wrote:
> Swap the BI-byte on position 0x7D0 with a data byte at 0x835.  To fix a b=
ug
> in Freescale imx NFC v1 SoC's for 2K page NAND flashes: imx27 and imx31.
> Warning: The same solution needs to be applied to the boot loader and the
> flash programmer.
>
> This is a modified version of patch sent by J=C3=BCrgen Lambrecht :
> [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block Indicator,
> and use for imx27pdk nand support.
>
>  v3: - use accessor function for I/O memory accesses as suggested by Artem
>        Bityutskiy
>      - rename function name as suggested by Artem Bityutskiy
>
>  v2: - Use a flag in a mxc_nand_platform structure instead of adding opti=
on
>        in Kconfig
>
>  v1: - Original patch "Add 'config IMX_NFC_V1_BISWAP'" by J=C3=BCrgen Lam=
brecht
>
> Signed-off-by: Ga=C3=ABtan Carlier <gcembed@gmail.com>

One additional note: If a user intend to boot from NAND (aka "external boot=
")=20
there is one drawback with this patch: the very first page of the NAND will=
=20
be read in hardware to load the bootstrap code. But the hardware doesn't kn=
ow=20
anything about swapping bytes!
So, when writing the very first page of the NAND the swap *must* be omitted=
=20
(which also means the factory bad block marker of the first block in the NA=
ND=20
has to be interpreted differently).

Regards,
Juergen

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | Phone: +49-5121-206917-5128=
 |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555=
 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/ =
 |
