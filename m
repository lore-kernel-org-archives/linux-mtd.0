Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llgka-00074s-GO
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 09:47:27 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Juergen Beisert <jbe@pengutronix.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 23 Mar 2009 15:14:35 +0530
Subject: RE: DOC2000 flash: Do I miss something?
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB063562407E@EXGMBX01.sasken.com>
References: <200903230852.02597.jbe@pengutronix.de>
In-Reply-To: <200903230852.02597.jbe@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Kindly check the DOC2000 driver which is available under  -> Device Drivers=
-> Memory Technology Devices (MTD)-> Memory Technology Device (MTD) support=
 (MTD [=3Dm])-> NAND Flash Device Drivers (Which has recommanded too).
 The below error message due to the way old doc driver implemented.

Regards,
Ravi Kumar


________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Juergen Beisert [jbe@pengutronix.de]
Sent: Monday, March 23, 2009 13:22
To: linux-mtd@lists.infradead.org
Subject: DOC2000 flash: Do I miss something?

Hi,

I'm trying to use a DiskOnChip device (MD2202-D16) on my x86 based board.
I activated all available DOC drivers in the current 2.6.28.8 kernel, but o=
nly
the DOC2000 driver will work with this device:

[...]
DiskOnChip 2000 found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba:NAND 16MiB 3,3V=
 8-bit)
1 flash chips found. Total DiskOnChip size: 16 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Ignoring DiskOnChip 2000 at 0xDA000 - already configured
DiskOnChip failed TOGGLE test, dropping.
[...]

$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00004000 "DiskOnChip 2000"

$ ls /dev/mtd*
/dev/mtd0       /dev/mtd0ro     /dev/mtdblock0

But I can't work with it:

$ flash_eraseall /dev/mtd0
/dev/mtd0: Bad block check not available

$ nandwrite -j /dev/mtd0 root.jffs2
MEMGETINFO: Inappropriate ioctl for device

Is it due to this driver is marked as "depricated"? What can I use an an
alternative to make the device work again?

Regards,
Juergen

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
