Received: from redmailwall2.attws.com ([198.180.219.46])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18J2Gd-0004ID-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2002 01:54:31 +0000
Received: from viruswall.entp.attws.com (viruswall.entp.attws.com [135.214.42.163])
	by redmailwall2.attws.com (8.11.6+Sun/8.9.3) with ESMTP id gB32OXR17371
	for <linux-mtd@lists.infradead.org>; Mon, 2 Dec 2002 18:24:34 -0800 (PST)
Received: from hadron.wireless.attws.com (localhost.localdomain [127.0.0.1])
	by hadron.wireless.attws.com (8.12.1/8.12.1) with ESMTP id gB32NwRE001631
	for <linux-mtd@lists.infradead.org>; Mon, 2 Dec 2002 18:23:58 -0800
Received: (from daryl@localhost)
	by hadron.wireless.attws.com (8.12.1/8.12.1/Submit) id gB32NwsU001630
	for linux-mtd@lists.infradead.org; Mon, 2 Dec 2002 18:23:58 -0800
Date: Mon, 2 Dec 2002 18:23:58 -0800
From: R/db <daryl.bunce@attws.com>
To: linux-mtd@lists.infradead.org
Subject: DoC2000 288MiB / grub clobbered after partitioning
Message-ID: <20021202182358.A1534@attws.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks everyone for all the good stuff.
Mark (Meade), could you add a note into
your howto about dropping the right-most
zero when feeding the win: param to dformat?
(It was confusing to me, especially after
reading the M-Sys documentation)


Just a quick mention of what I'm encountering.
I'm still working at it and gathering info but
thought I'd throw this out in case someone else
has any ideas and because I'm pretty certain
so far of what is happening ( =3D many attempts
all starting from scratch/known pieces yielding
the same results).  Short form: partitioning
the nftla clobbers grub.

Basics are Mark Meade's 10 Oct 2002 ss 1:
  build grub accordingly
  dformat /WIN:D000 /BDKF0:GRUB_F~1
  shutdown the machine
  power up machine
  tell bios to netboot
  see   grub>   (most everything prior scrolled
     into the bitbucket)
  shutdown the machine
  power up machine
  tell bios to boot from hda1
  boot linux
Cool so far.  At this point though I can't find
  a partion table for /dev/nftla (hence can't
  mount /dev/nftla1).  So I run fdisk (see below),
  it sez its going to make a new partition table
  (cool) then I make some partitions/write them
  to the DoC, mke2fs them, mount them, copy files
  to them, unmount, mount again, reboot, whatever.

  Partitions are still there, fdisk has a quirk
  where it will report the proper partitions and
  if I don't spec the dev (nftla) it reports all
  the partions on all devices (normal) and the
  message that the nftla doesn't have a valid
  table (still prints those partitions).  Data is
  still valid within those partitions.

GRUB at this point is hosed.  Rebooting (selecting
netboot in bios), the DoC grabs control then
the machine reboots, ad infinitum.

Whatever.  I'm still gathering info.




specifics, if you're still reading:
DoC2000/288MiB
kernel 2.4.19+usagi(IPv6)+kerneli(crypto)+mtd(cvs,
   various dates (recent))
M-Sys Utils 5.1.4 (tffs_5.1.4_DOS_TOOLS.zip,late Nov 2002)
GRUB from cvs (29 Nov 2002 + other recent ones)+patch
   from Mark Meade's 9 Oct 2002 email on the mtd list.
SBC: MyComp.tw TH-512, Transmeta Crusoe TM5400/600MHz,
   ~388Megs RAM, VIA 686A/B chipset

syslog says:
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: EC, Chip ID: 75 (Samsung KM29U256T)
9 flash chips found. Total DiskOnChip size: 288 MiB
NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we =
know what it means...
  nftla: nftla1 nftla2
 Ignoring DiskOnChip 2000 at 0xD2000 - already configured
 Ignoring DiskOnChip 2000 at 0xD4000 - already configured
 Ignoring DiskOnChip 2000 at 0xD6000 - already configured

Cannot calculate an NFTL geometry to match size of 0x8d040
Using C:1002 H:16 S:36 (=3D=3D 0x8ce80 sects)

fdisk -l /dev/nftla says
Disk /dev/nftla: 16 heads, 36 sectors, 1002 cylinders
Units =3D cylinders of 576 * 512 bytes
                               =20
     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             1       171     49230   83  Linux
/dev/nftla2           172      1002    239328   83  Linux

(partition two was just a place-holder and will get rm'd
then three more partitions will take its place)

Interestingly, fdisk -l without specifiying the device
gives all the normal info PLUS the message:
Disk /dev/nftla doesn't contain a valid partition table


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Solaris)
Comment: For info see http://www.gnupg.org

iD8DBQE97BW9seEAy04yxr4RApClAJ9SmH474hYiZJ1h2eJyfGk8HitEiwCfdm95
NozdejghzkiRky6JH5iPhK4=
=Khqa
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
