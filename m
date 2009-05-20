Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6mXJ-00035W-Ve
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 14:12:59 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Date: Wed, 20 May 2009 09:11:51 -0500
Subject: RE: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page	NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C01138180E0@dlee02.ent.ti.com>
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
	<4A11F5FC.40709@boundarydevices.com>
	<4A11FA90.3060403@boundarydevices.com>
In-Reply-To: <4A11FA90.3060403@boundarydevices.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Troy,

> -----Original Message-----
> From: Troy Kisky [mailto:troy.kisky@boundarydevices.com]
> Sent: Monday, May 18, 2009 8:17 PM
> To: Narnakaje, Snehaprabha
> Cc: dwmw2@infradead.org; davinci-linux-open-source@linux.davincidsp.com;
> linux-mtd@lists.infradead.org; tglx@linutronix.de; akpm@linux-
> foundation.org
> Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
> page NAND chips
>=20
> Troy Kisky wrote:
> > nsnehaprabha@ti.com wrote:
> >> From: Sneha Narnakaje <nsnehaprabha@ti.com>
> >>
> >> This patch adds 4-bit ECC support for large page NAND chips using the
> new ECC
> >> mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has
> been
> >> adjusted to use this mode.
> >>
> >> The patches have been verified on DM355 device with 2K Micron devices
> using
> >> mtd-tests and JFFS2. Error correction upto 4-bits has also been
> verified using
> >> nandwrite/nanddump utilities.
> >>
> >> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> >> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> >> ---
> >>  drivers/mtd/nand/davinci_nand.c |   37
> +++++++++++++++++++++++++++++++------
> >>  1 files changed, 31 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/davinci_nand.c
> b/drivers/mtd/nand/davinci_nand.c
> >> index ba6940d..4557b8d 100644
> >> --- a/drivers/mtd/nand/davinci_nand.c
> >> +++ b/drivers/mtd/nand/davinci_nand.c
> >> @@ -689,15 +707,22 @@ static int __init nand_davinci_probe(struct
> platform_device *pdev)
> >>  				info->mtd.oobsize - 16;
> >>  			goto syndrome_done;
> >>  		}
> >> +		if (chunks =3D=3D 4) {
> >> +			info->ecclayout =3D hwecc4_2048;
> >> +			info->ecclayout.oobfree[1].length =3D
> >> +				info->mtd.oobsize - 49;
> >
> Most drivers set chip->ecc.layout =3D ... Is it ok to use ecclayout
> instead?????

info->ecclayout is internal to davinci nand driver, since info is of type '=
struct davinci_nand_info'.

In the davinci_nand.c source, there is already code to assign info->ecclayo=
ut to chip->ecc.layout.

syndrome_done:
                info->chip.ecc.layout =3D &info->ecclayout;

We have this internal structure to handle different ecc modes (ecc bits vs.=
 page sizes).

Thanks
Sneha

>=20
>=20
>=20
