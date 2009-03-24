Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm0fY-0004Lw-2f
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 07:03:36 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Juergen Beisert <jbe@pengutronix.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Tue, 24 Mar 2009 12:30:48 +0530
Subject: RE: DOC2000 flash: Do I miss something?
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624081@EXGMBX01.sasken.com>
References: <200903230852.02597.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407E@EXGMBX01.sasken.com>,
	<200903232029.32897.jbe@pengutronix.de>,
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624080@EXGMBX01.sasken.com>
In-Reply-To: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624080@EXGMBX01.sasken.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Forgotton to add the info for cleanmarker, info is available at=20
http://www.infradead.org/pipermail/linux-mtd/2007-June/018584.html
http://www.infradead.org/pipermail/linux-mtd/2004-June/009835.html

Regards,
Ravi

________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Ravi Vasarla [ravi.vasarla@sasken.com]
Sent: Tuesday, March 24, 2009 12:16
To: Juergen Beisert; linux-mtd@lists.infradead.org
Subject: RE: DOC2000 flash: Do I miss something?

Hi,

Just check with nandwrite with option -j (--jffs2 oob layout) instead of au=
toplace oob layout. Also check the oob structure is filled in nandwrite and=
 respective info is
available at diskonchip.c file should match.
 The below message is coming due to mis matching the oob and ecc layout.  W=
hich should be same in diskonchip.c with respect to writing the data using =
nandwrite.c

Regards,
Ravi

________________________________________
From: Juergen Beisert [jbe@pengutronix.de]
Sent: Tuesday, March 24, 2009 00:59
To: linux-mtd@lists.infradead.org
Cc: Ravi Vasarla
Subject: Re: DOC2000 flash: Do I miss something?

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
fy
some text files in this filesystem. After unmount and reboot at the next
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

--
Pengutronix e.K.                              | Juergen Beisert            =
 |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228    =
 |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555=
 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/ =
 |
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In
case you are not the original intended Recipient of the message, you must n=
ot, directly or
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are
requested to delete it and inform the sender. Any views expressed in this m=
essage are
those of the individual sender unless otherwise stated. Nothing contained i=
n this message
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of
viruses. However the company accepts no liability for any damage caused by =
any virus
transmitted by this email


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In=20
case you are not the original intended Recipient of the message, you must n=
ot, directly or=20
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are=20
requested to delete it and inform the sender. Any views expressed in this m=
essage are=20
those of the individual sender unless otherwise stated. Nothing contained i=
n this message=20
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation=20
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due=20
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of=20
viruses. However the company accepts no liability for any damage caused by =
any virus=20
transmitted by this email
