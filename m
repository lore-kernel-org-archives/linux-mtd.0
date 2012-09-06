Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Xu3-0007Mj-30
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 08:57:35 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mxc_nand : allow swapping the Bad block Indicator for
 NFC v1.
Date: Thu, 6 Sep 2012 10:56:12 +0200
References: <1345811288.2848.308.camel@sauron.fi.intel.com>
 <1345825064-9147-1-git-send-email-gcembed@gmail.com>
In-Reply-To: <1345825064-9147-1-git-send-email-gcembed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201209061056.12386.jbe@pengutronix.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, J.Lambrecht@televic.com,
 Sascha Hauer <kernel@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 =?utf-8?q?Ga=C3=ABtan_Carlier?= <gcembed@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ga=C3=ABtan,

Ga=C3=ABtan Carlier wrote:
> Any comments for this patch ?

Sorry, a little bit late.

> Swap the BI-byte on position 0x7D0 with a data byte at 0x835.  To fix a b=
ug
> in Freescale imx NFC v1 SoC's for 2K page NAND flashes: imx27 and imx31.
> Warning: The same solution needs to be applied to the boot loader and the
> flash programmer.

What sense does it make to swap the bytes at offset 0x7D0 and 0x835?

Background: the NFC in the i.MX27/i.MX31 (NFCv1) and i.MX25/i.MX35 (NFCv2) =
can=20
only handle 512 byte pages with 16 bit OOB at once. To get them work with 2=
 k=20
page NANDs they only do the 512 + 16 step four times. The result is, a 2 k=
=20
page NAND is not handled as 2 k data and 64 bytes OOB, its handled instead =
as
a stream of 2112 bytes:

               |<-------- 2112 bytes --------->|
               512+16 | 512+16 | 512+16 | 512+16

Which means the NFC mixes data and OOB/checksums into its internal SRAM. Bu=
t=20
all upper routines still use this SRAM content with a 2048 (data) + 64 (OOB=
)=20
bytes layout (to be more precise also the NFC hardware uses this layout).=20
Result is, the factory bad block markers are lost, because the NFC stores t=
he=20
first 48 bytes from each OOB into the SRAM's data area (beginning with offs=
et=20
2000 (=3D 0x7D0) in the data area).

So, the main goal of this swap patch should be to keep the factory bad bloc=
k=20
markers _and_ to make use of them.

But the i.MX driver does not register its own bad block pattern description=
,=20
so the default one is used with the BBM at position NAND_LARGE_BADBLOCK_POS=
=20
(which means offset 0 in the OOB area).

So, I think, all upper layers still search for the BBM at offset 0 of the O=
OB=20
area, which results to SRAM's offset 0x800 (for NFCv1) and not 0x835. This=
=20
means this patch keeps the factory bad block markers, but they won't still =
be=20
used as expected.

IMHO the bytes at SRAM's offset 0x7D0 and 0x800 for the NFCv1 must be swapp=
ed=20
(and 0x7D0 and 0x1000 for the NFCv2) to keep the factory bad block markers=
=20
_and_ to make use of them. Or am I wrong?

Regards,
Juergen

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | http://www.pengutronix.de/ =
 |
