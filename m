Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ojq95-0005LI-32
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2010 09:01:48 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] NAND: add support for reading ONFI parameters from
	NAND device
Date: Fri, 13 Aug 2010 11:01:31 +0200
References: <201008121453.50207.ffainelli@freebox.fr>
	<201008122147.54733.ffainelli@freebox.fr>
	<4C647E87.3050205@broadcom.com>
In-Reply-To: <4C647E87.3050205@broadcom.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008131101.31482.ffainelli@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Friday 13 August 2010 01:06:47 Brian Norris wrote:
> Hi,
>=20
> On 08/12/2010 12:47 PM, Florian Fainelli wrote:
> >> Also, previously, you said:
> >>> +   if (!is_power_of_2(val) || val =3D=3D 1 || val > (1 << 4)) {
> >>> the !is_power_of_2 check does not work for ONFI version 2.1 (3), so I
> >>> would only keep the two other checks."
> >>=20
> >> So why is it now:
> >>> +   if (is_power_of_2(val) || val =3D=3D 1 || val > (1 << 4)) {
> >>=20
> >> Is that a typo? Perhaps it's better to throw that test out altogether.
> >=20
> > That was not a typo, I actually misread the ONFI specification and
> > confused bit is set, with the actual value. So this is the correct
> > check, sorry about that.

I forgot to answer that, yes, that was a typo, the original code was right=
=20
(that is: !is_power_of_2()).

>=20
> Again, I might be mistaken, but it seems that the "is_power_of_2" would
> weed out ONFI 1.0, since val would be simply 1 << 1, i.e., val =3D=3D 2.
> Really, it seems that the ONFI version number may or may not be a power
> of two. If so, then we should just check individual bits as performed in
> the other tests (and perhaps include a test to be sure "val & 1 =3D=3D 0")

2 is still a power of 2, even though the exponent is 1 and is_power_of_2(2)=
=20
returns true.

=46rom my understanding of the ONFI specification, the corresponding bit is=
 set,=20
when the ONFI version is supported. What is not clear to me and this is whe=
re=20
the is_power_of_2() check will return false, is in the case we have a devic=
e=20
supporting, say ONFI 2.0, we might have bits 1, 2, 3, 4 being set (30), whi=
ch=20
is not a power of 2. I agree with you on that. So let's just check the=20
invidual bits instead starting with the higher one.

>=20
> >> I "fixed" the changes I mentioned as well as a few coding style, logic
> >> cleanups, etc. (e.g. too many levels of logic, creating lines > 80
> >> chars). Here's a new patch. I didn't change over the crc function to
> >> the library function because that would require configuring the Kbuild
> >> options and setting a dependency, which I'm not familiar with. I'm
> >> certainly not an expert on most of this, so take my patch with a grain
> >> of salt!
> >=20
> > It is usually as simple as doing the proper select FOO in the related
> > Kconfig.
>=20
> Thanks for the tip. It worked for me.

I will respin the patch with Matthieu's comments and yours.
=2D-
=46lorian
