Received: from [209.50.160.217] (helo=goofy.vitronics.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtpY4-00039X-DM
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 14:53:08 +0000
Date: Thu, 19 Feb 2004 09:54:42 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-ID: <A1F0D47583A2D711919F00600819B3A4024630@goofy.vitronics.com>
content-class: urn:content-classes:message
From: "Cruz, Maria" <maria.cruz@VITRONICS.com>
To: <linux-mtd@lists.infradead.org>
Subject: building blkmtd as a module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
I have Redhat linux 9.0 (kernel 2.4.20-6).  i am trying to rebuild my =
kernel and add in=20
Y=3DMemory Technology Device (MTD) support
Y=3DCaching block device access to MTD devices"
%under submenu , Self-contained MTD device drivers"
M=3DMTD emulation using block device"
%under main menu, Block devices
M=3DLoopback device support  %already set
%under main menu, File Systems
M=3DJournalling Flash File System v2 (JFFS2) support

where Y=3Dbuilt into kernel and M=3Dmake a module.  All is fine until I =
do a "make modules_install", then i get an error:
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.20-6mtd; =
fi
depmod: *** Unresolved symbols in =
/lib/modules/2.4.20-6mtd/kernel/drivers/mtd/devices/blkmtd.o
depmod:         recalc_sigpending_tsk
The function "recalc_sigpending_tsk" is in signal.o.  what is wrong?  =
GPL license issue? dependency issue (i do a "make dep" right after "make =
menuconfig").  the .config has mtd setup:
# Memory Technology Devices (MTD)
#
CONFIG_MTD=3Dy
# CONFIG_MTD_DEBUG is not set
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CHAR is not set
CONFIG_MTD_BLOCK=3Dy
...
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLKMTD=3Dm
....

I notice signal.o is only included as "builtin".  When i select all of =
mtd as builtin then i get no error.  what to do?
thanks
maria cruz
maria.cruz@vitronics.com
