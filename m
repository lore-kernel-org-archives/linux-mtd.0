Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llq0Y-0002HR-1n
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 19:40:44 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 23 Mar 2009 20:29:32 +0100
References: <200903230852.02597.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407E@EXGMBX01.sasken.com>
In-Reply-To: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407E@EXGMBX01.sasken.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200903232029.32897.jbe@pengutronix.de>
Subject: Re: DOC2000 flash: Do I miss something?
Cc: Ravi Vasarla <ravi.vasarla@sasken.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Montag, 23. M=E4rz 2009, Ravi Vasarla wrote:
> Hi,
>
> Kindly check the DOC2000 driver which is available under  -> Device
> Drivers-> Memory Technology Devices (MTD)-> Memory Technology Device (MTD)
> support (MTD [=3Dm])-> NAND Flash Device Drivers (Which has recommanded t=
oo).
> The below error message due to the way old doc driver implemented.

What is the correct setup of this device to make it work?

I tried:

$ flash_eraseall /dev/mtd0
$ nandwrite -a /dev/mtd0 root.jffs2

$ mount -t jffs2 /dev/mtdblock0 /mnt
When I try to mount it, I get many of these messages:
[...]
CLEANMARKER node found at 0x003e4000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x003e8000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x003ec000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x003f0000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x003f4000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x003f8000 has totlen 0xc !=3D normal 0x0
[...]

But the mount seems successfull, as I can see the files and I can also modi=
fy=20
some text files in this filesystem. After unmount and reboot at the next=20
mount again I see many of these messages:
[...]
CLEANMARKER node found at 0x003fc000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x00400000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x00404000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x00408000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x0040c000 has totlen 0xc !=3D normal 0x0
CLEANMARKER node found at 0x00410000 has totlen 0xc !=3D normal 0x0
[...]

But now also these ones:
[...]
mtd->read(0x3a50 bytes from 0x4105b0) returned ECC error
mtd->read(0x1a14 bytes from 0x4125ec) returned ECC error
Empty flash at 0x004125e8 ends at 0x00412600
mtd->read(0x1cc bytes from 0x412834) returned ECC error
mtd->read(0x200 bytes from 0x412600) returned ECC error
mtd->read(0x33 bytes from 0x412800) returned ECC error

Device broken or setup wrong?

Regards,
Juergen

=2D-=20
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228    =
 |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555=
 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/ =
 |
