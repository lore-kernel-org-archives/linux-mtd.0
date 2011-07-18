Date: Tue, 19 Jul 2011 00:43:55 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
Message-ID: <20110718164354.GA3328@S2100-06.ap.freescale.net>
References: <20004.12663.29494.339601@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20004.12663.29494.339601@ipc1.ka-ro>
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 18, 2011 at 03:13:27PM +0200, Lothar Wa=DFmann wrote:
> Hi,
>=20
> with the gpmi-nfc driver for imx28 from Shawn Guo on a TX28 I

To be clear, the author of gpmi-nfc driver is Huang Shijie (Cc-ed).

Regards,
Shawn

> encountered some problems with jffs2 when overwriting pages that have
> been written with 0xff (e.g. from padding from the file system image
> file).
>=20
> The problem is that the ECC info for an all-0xff block is not all-0xff
> and thus a newly erased block is different from a block that has been
> written with 0xff.
> If such a block is being altered (jffs2 thinking it can simply
> overwrite it without erasing first) the ECC information will be
> corrupted and will produce ECC errors upon read.
>=20
> The only remedy I can think of is to prevent empty pages from actually
> being written to flash, but leaving them in the erased state instead.
>=20
> Any comments?
>=20
>=20
> Lothar Wa=DFmann
> --=20
> ___________________________________________________________
>=20
> Ka-Ro electronics GmbH | Pascalstra=DFe 22 | D - 52076 Aachen
> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
> Gesch=E4ftsf=FChrer: Matthias Kaussen
> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>=20
> www.karo-electronics.de | info@karo-electronics.de
> ___________________________________________________________
>=20
