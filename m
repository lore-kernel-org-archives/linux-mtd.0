Received: from mtiwmhc12.worldnet.att.net ([204.127.131.116])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZDW9-0007qN-HV
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 18:41:41 +0100
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <Russ.Dill@asu.edu>
Date: Sun, 6 Jul 2003 13:41:58 -0400
Message-ID: <000001c343e5$e6bb1d20$239efea9@who5>
MIME-Version: 1.0
In-Reply-To: <1057473735.2659.247.camel@localhost>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: RE: File systems and Disk on Chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(See below, to honor the hosting list's policies.)
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Russ Dill
> Sent: Sunday, July 06, 2003 2:42 AM
> To: Gregg C Levine
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: File systems and Disk on Chips
>=20
> On Sat, 2003-07-05 at 17:00, Gregg C Levine wrote:
> > Hello from Gregg C Levine
> > I have here a 2 Megabyte Disk on Chip device, plugged into a
carrier
> > board. It is now wearing the GRUB based firmware. How when I bring
up
> > my system, the DOC device complains about the lack of a file
system.
> > Any ideas as to how I could put a file system on this device?
> > Preferably as a native Linux format.
>=20
> Basically, you put a block filesystem on top of NFTL that grub
> understands. Grub does not at this point understand YAFFS or JFFS2
on
> NAND flash, but I'm sure there a lot of people who are looking for
that
> and it wouldn't be difficult to do.
>=20
> --
> Russ Dill <Russ.Dill@asu.edu>
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
Hello again from Gregg C Levine
Okay that makes more sense. But now how do I go about creating the "
block filesystem on top of NFTL", that I need to use?=20

For example, I've gotten with my test image, as far as creating a
floppy disk image, and booting that, inside the Bochs emulator. It
worked, the test kernel launched, and told me that the kernel did what
it was supposed to do.=20

My other problem, is that I still can not get the utilities inside
that directory to properly compile, they always break when trying to
create the ones that manage the JFFS2 stuff. I am hoping that the
snapshot from yesterday has been fixed, but I don't know.
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
