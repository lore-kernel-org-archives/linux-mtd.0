Received: from mail164.messagelabs.com ([216.82.253.131])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MId1m-0002fi-QQ
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 06:29:33 +0000
In-Reply-To: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB314CD226DF@EXGMBX01.sasken.com>
To: Ravi Vasarla <ravi.vasarla@sasken.com>
Subject: RE: Problem with jffs2 on linux 2.6.23
MIME-Version: 1.0
Message-ID: <OFF85877ED.A4F56E8D-ON652575DD.00173AC5-652575DD.00235628@lntemsys.com>
From: Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>
Date: Mon, 22 Jun 2009 12:07:24 +0530
Content-Type: text/plain; charset="US-ASCII"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
The erase size/Block size of nand device is 128KB, also the JFFS2 image is 
created with erase size of 128KB. 
I verified this by enabling debug statements. I am not able to undersatnd 
the reason for ECC / Magic Bitmask error.

I tried using linux-2.6.20 kernel with the same file system and observed 
that ECC / Magic Bitmask error is not coming then.

Is jffs2 code in linux 2.6.23 kernel is buggy ?

Thanks
Rupesh


   



Ravi Vasarla <ravi.vasarla@sasken.com> 
06/15/2009 03:56 PM

To
Rupesh Kumar <Rupesh.Kumar@Lntemsys.com>, "linux-mtd@lists.infradead.org" 
<linux-mtd@lists.infradead.org>
cc

Subject
RE: Problem with jffs2 on linux 2.6.23






Hi Rupesh,

It usually comes when jffs2 image is not build correctly, i mean with 
correct block size and erase size. Kindly check once again, please enable 
the MTD debug and file system debug flags to see more debug info.

Regards,
Ravi Kumar
+91 97415 00768

________________________________________
From: linux-mtd-bounces@lists.infradead.org 
[linux-mtd-bounces@lists.infradead.org] On Behalf Of Rupesh Kumar 
[Rupesh.Kumar@Lntemsys.com]
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
This message may contain confidential, proprietary or legally privileged 
information. In 
case you are not the original intended Recipient of the message, you must 
not, directly or 
indirectly, use, Disclose, distribute, print, or copy any part of this 
message and you are 
requested to delete it and inform the sender. Any views expressed in this 
message are 
those of the individual sender unless otherwise stated. Nothing contained 
in this message 
shall be construed as an offer or acceptance of any offer by Sasken 
Communication 
Technologies Limited ("Sasken") unless sent with that express intent and 
with due 
authority of Sasken. Sasken has taken enough precautions to prevent the 
spread of 
viruses. However the company accepts no liability for any damage caused by 
any virus 
transmitted by this email
