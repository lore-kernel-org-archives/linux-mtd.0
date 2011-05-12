Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKTI1-000139-Bo
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 10:38:45 +0000
Date: Thu, 12 May 2011 12:38:34 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC] MTD: export more NAND-related informations to syfs
In-Reply-To: <1305194463.2713.79.camel@localhost>
Message-ID: <Pine.LNX.4.64.1105121237220.15966@lnxricardw.se.axis.com>
References: <201105061728.20948.ffainelli@freebox.fr>
	<1304707173.7222.96.camel@localhost>
	<201105091621.38720.ffainelli@freebox.fr>
	<1305194463.2713.79.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Thu, 12 May 2011, Artem Bityutskiy wrote:
>=20
> > On Mon, 2011-05-09 at 16:21 +0200, Florian Fainelli wrote:
> > Hello Artem,
> >=20
> > On Friday 06 May 2011 20:39:33 Artem Bityutskiy wrote:
> > > On Fri, 2011-05-06 at 17:28 +0200, Florian Fainelli wrote:
> > > > +       /* NAND related attributes */
> > > > +       const char *nand_type;
> > > > +       const char *nand_manufacturer;
> > >=20
> > > Why other flashes cannot have type and manufacturer ?
> >=20
> > You are right, I will add this for NOR and SPI Flashes. My RFC was more=
 about=20
> > whether it is granted to add new members to struct mtd_info to get=20
> > informations=20
>=20
> struct mtd_info describes an mtd device. Things, which are common for
> all mtd devices should be there, I think.
>=20
> > Alternatively, would not it be better to have something like this:
> >=20
> > /sys/class/mtd/...
> >    nand0/
> >        manufacturer
> >        type
> >        onfi/
> >           version
> >           jedec_id
> >           ...
> >     nor0/
> >        cfi/
> >           manufacturer
> >           id
> >=20
> > This would allow us not to abuse the sysfs directory of a MTD partition=
 to=20
> > contain chip specific informations.
>=20
> Why do you call it "abuse" and why is it better to "abuse" the directory
> common to all MTD devices comparing to the directory of the specific MTD
> device? :-)
>=20
> I think that everything related to mtdX has to be in the mtdX
> subdirectory.

Couldn't one have a link to some form of chip directory structure, that=20
seems to be a common way of dealing with multiple sys subdirectories that=
=20
have something else in common than the directory path.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
