Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRfuH-0003yT-Du
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 05:22:59 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Fri, 17 Jul 2009 10:50:48 +0530
Subject: RE: ECC & Magic bitmask errors with JFFS2 file system on 6.23
	kernel for	powerpc
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB315009A2A5@EXGMBX01.sasken.com>
References: <OFCCF65728.700286E7-ON652575F5.00531F58-652575F5.00522500@lntemsys.com>
In-Reply-To: <OFCCF65728.700286E7-ON652575F5.00531F58-652575F5.00522500@lntemsys.com>
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

Hi Rupesh,

Just see how the JFFS2 file system writing on NAND, does it writing on OOB =
area also. It looks to be it is using the OOB area too for placing the data=
. If you modify your driver in such manner which only uses the data space o=
f the given block or page.

Regards,
Ravi Kumar

________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Rupesh Kumar [Rupesh.Kumar@Lntemsys.com]
Sent: Thursday, July 16, 2009 20:39
To: linux-mtd@lists.infradead.org
Subject: ECC & Magic bitmask errors with JFFS2 file system on 6.23 kernel f=
or   powerpc

Hi

We are using Linux kernel 2.6.23 from freescale LTIB
(MPC8313E_RDB_K26_20081226-LTIB.iso) on our custom board.
JFFS2 is used as RFS and  nand write.jffs2 utility in the u-boot is used
to burn the image on to the nand flash.

When we boot for the first time everything seems to be OK. On subsequent
reboots we are seeing following error messages reported by kernel on
bootup.
In addition we also see Magic bitmask errors being reported.

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

We verified erase size passed as an argument for creating jffs2 file
system (initial googling on the issue).
After contacting freescale we came to know that, it is a known issue and
they dont have planned to work on this in near future. :(
Please give your valuable suggestions so that we can fix this problem and
make our board running properly.

Thanks
Rupesh


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
