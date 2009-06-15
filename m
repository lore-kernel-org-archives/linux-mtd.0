Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MG9OT-0000pD-D0
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 10:26:32 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Mon, 15 Jun 2009 15:56:16 +0530
Subject: RE: Problem with jffs2 on linux 2.6.23 
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB314CD226DE@EXGMBX01.sasken.com>
References: <OFA28454EB.D09A6F01-ON652575D6.002DC4B1-652575D6.0031F5DB@lntemsys.com>
In-Reply-To: <OFA28454EB.D09A6F01-ON652575D6.002DC4B1-652575D6.0031F5DB@lntemsys.com>
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


________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Rupesh Kumar [Rupesh.Kumar@Lntemsys.com]
Sent: Monday, June 15, 2009 14:46
To: linux-mtd@lists.infradead.org
Subject: Problem with jffs2 on linux 2.6.23

Hi
We are using jffs2 RFS for our board with linux 2.6.23 . we are suing nand
write.jffs2 utility in the u-boot to burn the image on to the
nand flash,

Our problem is
Booting First time with the RFS seems to be fine. As system run and we do
reboot system it prints following messages and boots up.
///////////////////////////
mtd->read(0x400 bytes from 0x1b00000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01b001d0:
0xfffe instead
mtd->read(0x400 bytes from 0x2500000) returned ECC error
mtd->read(0x400 bytes from 0x27c0000) returned ECC error
mtd->read(0x400 bytes from 0x2c20000) returned ECC error
mtd->read(0x400 bytes from 0x2cc0000) returned ECC error
mtd->read(0x400 bytes from 0x2d00000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02d00074:
0xfffe instead
Empty flash at 0x02d00078 ends at 0x02d003e4
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02d003e4:
0xffef instead
Empty flash at 0x02d003e8 ends at 0x02d00780
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x02d00780:
0xfffb instead
mtd->read(0x400 bytes from 0x3320000) returned ECC error
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x03320190:
0xffff instead
Empty flash at 0x03320194 ends at 0x0332047c
////////////////////////////
During run time also it prints these messages.

I am not able to understand the cause of this error. Please help me in
fixing this error.

The same file system is working fine with the linux 2.6.20 kernel.
Thanks

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
