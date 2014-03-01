Received: from mail-bn1lp0144.outbound.protection.outlook.com
 ([207.46.163.144] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJZvM-0003rf-Bq
 for linux-mtd@lists.infradead.org; Sat, 01 Mar 2014 02:45:13 +0000
From: Insop Song <Insop.Song@gainspeed.com>
To: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH] Check flag status register for Micron n25q512a
Date: Sat, 1 Mar 2014 02:44:46 +0000
Message-ID: <106fa8b5760a4a88be8cb469fab79186@BY2PR07MB011.namprd07.prod.outlook.com>
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <20140227073314.GD13420@norris-Latitude-E6410>
 <201402272101.59845.marex@denx.de>
In-Reply-To: <201402272101.59845.marex@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Priyanka.Jain@freescale.com" <Priyanka.Jain@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

> From: Marek Vasut [mailto:marex@denx.de]
> Sent: Thursday, February 27, 2014 12:02 PM
>=20
> On Thursday, February 27, 2014 at 08:33:14 AM, Brian Norris wrote:
> > + Marek
>=20
> Thanks, I really need to subscribe to this ML ;-/
>=20
> > Hi Insop,
> >
> > On Mon, Jan 06, 2014 at 05:21:17AM +0000, Insop Song wrote:
> > > In order to use Micron n25q512a, MTD, two changes are required as
> > > follows: - jedec code should be fixed
> >
> > I have a feeling there are more than one "n25q512a" device, with
> > different IDs.
>=20
> ACK, I have similar feeling. Jain, can you tell us the precise marking on=
 your
> N25Q512A chip (that is, every single letter on the top of the chip packag=
e
> exactly as it is engraved there ) please? Or make a photo ...
>=20
> Insop, can you please do the same ?
>=20
> [...]

25Q512A
13640

>=20
> > > @@ -782,7 +864,7 @@ static const struct spi_device_id m25p_ids[] =3D =
{
> > >
> > >  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
> > >  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> > >  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> > >
> > > -	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> > > +	{ "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },
> >
> > You probably want to figure out the distinction between the old table
> > entry and the new one, and assign your new entry a new string
> > accordingly.
>=20
> ACK. The datasheet actually claims this change is correct, see [1] (page =
40,
> table 21), but as we know, Micron really does shitty job when it comes to
> using the JEDEC IDs for it's chips.
>=20

"n25q512a1" okay?
Or any other suggestion?

> > >  	/* PMC */
> > >  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> > >
> > > @@ -996,6 +1078,13 @@ static int m25p_probe(struct spi_device *spi)
> > >
> > >  	spi_set_drvdata(spi, flash);
> > >
> > >  	/*
> > >
> > > +	 * Micron n25q512a requires to check flag status register
> > > +	 */
> > > +	flash->flag_status =3D false;
> > > +	if (strcmp(id->name, "n25q512a") =3D=3D 0)
> > > +		flash->flag_status =3D true;;
> >
> > This doesn't look good at all. If any other flash start to need this,
> > we don't want to code each ID string here. That's fragile and
> > non-scaleable. If we need this option, you need to add another flag to
> > the m25p_ids[] table, I guess...
>=20
> This waiting for some bit in FSR looks like it can be wrapped into
> wait_till_ready(), no ?
>=20
> What I cannot find in the datasheet though is any evidence which would
> clearly mandate the use of FSR bit 0x80 to test if the chip is ready for =
next
> operation instead of using the regular STATUS register bit . Insop, can y=
ou
> please elaborate on why using the FSR is needed ?
>=20

If I don't check FSR(Flag Status Register), then I was not able to program =
this flash.
I've used C SDK from Aardvark I2C/SPI Host Adapter to program directly, and=
 we had to check FSR.
Also in linux driver, I had to put the check otherwise, I am not able to wr=
ite the flash.
I think it is mandatory though datasheet is not so clear about it.


> [1]
> https://www.micron.com/~/media/Documents/Products/Data%20Sheet/N
> OR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf
