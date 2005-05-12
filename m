Received: from rproxy.gmail.com ([64.233.170.194])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWBae-0004UQ-Rx
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 07:10:53 -0400
Received: by rproxy.gmail.com with SMTP id y7so40625rne
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2005 04:10:57 -0700 (PDT)
Message-ID: <f6d0cd06050512041048406f5c@mail.gmail.com>
Date: Thu, 12 May 2005 16:40:57 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: MTD for Intel Strata L18 Flash
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using Linux Kernel 2.6.10 and enabled the JFFS2 file system in the ker=
nel.
Flash has a partition ( 0xA0980000 ) which will be used for JFFS2 and
it's erased.

After booting the kernel,  when i try to mount the JFFS2 partition
from flash, it works fine and it's empty.

When i try to copy any data to mounted partition then it gives following er=
ror.

***************************************************************************=
*************
[root@Linux /]$ mount
/dev/ram0 on / type cramfs (ro)
/proc on /proc type proc (rw,nodiratime)
none on /dev/pts type devpts (rw)
/dev/mtdblock0 on /disc type jffs2 (rw,noatime)
[root@Linux /]$ cp etc/issue disc/
Write error in obliterating obsoleted node at 0x00540000: -30
Write of 68 bytes at 0x0054000c failed. returned -30, retlen 0
Not marking the space at 0x0054000c as dirty because the flash driver retur=
ned r
etlen zero
Write of 68 bytes at 0x0054000c failed. returned -30, retlen 0
Not marking the space at 0x0054000c as dirty because the flash driver retur=
ned r
etlen zero
cp: unable to open `disc/issue': Read-only file system
***************************************************************************=
****************

Pl. note that Same Kernel Image and ramdisk works fine with Intel W18
(28F128W18) flash but doesn't work with Intel Strata L18 (28F256L18)
flash.

Can anyone tell me what could be the issue as both the flashes are CFI
compliant ?

Thanks in advance
Niraj
