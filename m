Received: from mail.rdsor.ro ([193.231.238.10])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EuogS-0006S2-QB
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 05:19:00 -0500
From: Balint Cristian <rezso@rdsor.ro>
To: husamsenussi@gmail.com
Date: Fri, 6 Jan 2006 12:18:46 +0200
References: <200512230211.11487.husamsenussi@gmail.com>
	<200601040926.38030.rezso@rdsor.ro>
	<200601052052.38441.husamsenussi@gmail.com>
In-Reply-To: <200601052052.38441.husamsenussi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200601061218.46838.rezso@rdsor.ro>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip Millennium Plus 64M in OMAP1510 device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 05 January 2006 22:52, husamsenussi@gmail.com wrote:
> Hi,
>=20
> No I don't  have VTIHOST,  but I have iPAQ h6300with OMAP1510  and with l=
inux=20
> (2.6.14), and I'm willing to help.


>=20
> I manage to get the old driver to  discover the card, but I couldn't moun=
t the=20

Do you manageged in 16 bit mode ? Can please share with me the patch ?

> filesystem because I don;t have TrueFFS file system

Well, you can erase it ;-) JFFS is better.

   I have develed a patch for openwince's jtag tool to access via jtag the =
whole MTD
chip [based on a 8-bit kernel driver], a 16 bit version of the driver is tr=
ivial, to have a sane tool,
especialy that pxa use the DoC at boot time in 16 bit. This jtag tool can h=
elp a ton
do port linux from the scratch.



I would apreciate tho shere with me the patch.

~cristian

>=20
> Do you know the prices for VTIHOST !!!!

Well, openwince's jtag is far more beter idea .....


> Thanks
>=20
> On Wednesday 04 January 2006 07:26, Balint Cristian wrote:
> > On Friday 23 December 2005 04:11, husamsenussi@gmail.com wrote:
> >
> >
> > Hello !
> >
> > 	Do you have   Texas Instruments (VTIHOST) for flash this chip
> > via JTAG ?
> > 	This comes with the OMAP 1510 platform from TI.
> >
> > 	It can help us to write a sane driver for 2.6.x and this chip.
> >
> > > Hi,
> > >
> > > I'm having problem loading the MDOC + driver, for some reason the dri=
ver
> > > returning the wrong flash ID.
> > >
> > > This is what I see in my log file
> > >
> > > Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufactu=
rer
> > > ID: 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
> > > Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufactu=
rer
> > > ID: 98, Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
> > > Jan =A01 00:18:32 h6300 user.info kernel: 2 flash chips found. Total
> > > DiskOnChip size: 0 MiB
> > >
> > >
> > > I'm running linux 2.6.14.3 in iPAQ h6340 with OMAP1510 processer, and=
 I'm
> > > using the old driver because the new only support 16M
> > >
> > > Thanks.
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20

=2D-=20
Balint Cristian
area network engineer
=2E........................................................................=
=2E...
RCS & RDS  Oradea
Tel.: +40359.400.400
=46ax: +40359.400.444
http://www.rcs-rds.ro
        suport@rdsor.ro
=2E........................................................................=
=2E..........
Privileged/Confidential Information may be contained in this message.=20
If you are not in the addresses indicated in this message (or responsible
for delivery of the message to such person), you may not copy or deliver
this message to anyone. In such a case, you should destroy this=20
message and kindly notify the sender by reply e-mail.=20
