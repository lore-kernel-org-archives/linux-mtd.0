Received: from securedesign.net ([216.99.200.242] helo=firewall.sdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MTtM-0000lC-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 13:23:57 +0100
Message-ID: <003b01c10ebc$8a7ef0a0$160aa8c0@gumby>
From: "Stephen Herzog" <mtd@sdesign.com>
To: <cabcam@optusnet.com.au>, <linux-mtd@lists.infradead.org>
References: <000901c10e92$eca169e0$4c418990@adsl>
Subject: Re: Recovery of crashed DoC???
Date: Tue, 17 Jul 2001 05:32:28 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Greetings,

Assuming the OS is not the data you really, really, need, you could try=20
the following:  Remove the DoC and attach a regular IDE drive to the=20
SBU 4825 and boot from IDE first. Next compile a kernel on it with=20
DoC support. You will have to install your kernel on a floppy disk=20
however to get it to boot rather than from DoC. Now put the DoC back
in the SBU, boot from floppy/linux-kernel try mounting the DoC. Perhaps
you can get some of the data that way.=20

I don't think you want to use the DINFO.EXE utility.  That tool places
a dos bios patch on the nftl layer that allows the computer to boot=20
from the DoC.=20

Good luck,

Stephen Herzog

----- Original Message -----=20
From: "Colin Durey" <cabcam@optusnet.com.au>
To: "MTD List Admin (E-mail)" <linux-mtd@lists.infradead.org>
Sent: Tuesday, July 17, 2001 12:34 AM
Subject: Recovery of crashed DoC???


> I have a 40mb DoC which contains critical information that I really, =
really,
> need to get hold of.
> Linux fails to boot after discovering damaged blocks. The DoC is set =
as the
> boot device on an embedded SBU (Advantech 4825).
>=20
> Plugging in a floppy and booting DOS, then using the DoC utility =
DINFO.EXE
> returns the following info:
> Drive Name:  C:
> Disk Size 40,072 kb
> Software Version 1.10
> TrueFFS Compatibility 3.3.2
> Firmware size 48kb
>=20
> which suggest that the chip is still alive, at least.
>=20
> Is there any way in which to read the data files from the DoC?  I have =
been
> told to use the utility DUPDATE.EXE to change the drive name to D: or
> something other than C:, so that I can then connect another HD and =
boot it
> as C: and then mount the DoC as a secondary drive and subsequently =
recover
> the precious files. DUPDATE.EXE doesn't seem to want to let me do =
that.
>=20
> Anyone know what to do?
>=20
> Colin Durey
> Cabcam - Tech Division
> +61-2-96984711 (T)  +61-2-96984674 (F)
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
