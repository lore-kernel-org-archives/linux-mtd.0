Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QAg8-0006p4-P0
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 19:50:36 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 8FD246D00B9
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 14:46:20 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 6D96D6D00B5
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 18:46:20 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Wed, 11 Jun 2003 14:38:52 -0400
MIME-Version: 1.0
Message-Id: <200306111438.52353.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Help with mtd + jffs2
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been trying to get the mtd driver working with the flash
device on the TS-5300 card - all seemed to be going well :=3D

$Id: ftl.c,v 1.50 2003/05/21 10:49:47 dwmw2 Exp $
physmap flash device: 200000 at 9400000
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
kmod: failed to exec /sbin/modprobe -s -k cmdlinepart, errno =3D 2
cmdlinepart partition parsing not available
kmod: failed to exec /sbin/modprobe -s -k RedBoot, errno =3D 2
RedBoot partition parsing not available
Using physmap partition definition
Creating 3 MTD partitions on "Physically mapped flash":
0x00000000-0x000e0000 : "BOOT FIRMWARE"
mtd: Giving out device 0 to BOOT FIRMWARE
ftl_cs: FTL header not found.
0x000e0000-0x00100000 : "BIOS-DO_NOT_TOUCH"
mtd: Giving out device 1 to BIOS-DO_NOT_TOUCH
ftl_cs: FTL header not found.
0x00100000-0x00200000 : "PNC-2000 filesystem"
mtd: Giving out device 2 to PNC-2000 filesystem
ftl_cs: FTL header not found.

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 000e0000 00010000 "BOOT FIRMWARE"
mtd1: 00020000 00010000 "BIOS-DO_NOT_TOUCH"
mtd2: 00100000 00010000 "PNC-2000 filesystem"

But then I tryed to put the jffs2 file system image onto
the device :=3D

# cp /myapp/jffs2_file_sys.img /dev/mtd0
cp: unable to open `/dev/mtd0': No such device
#

but I have the device !
# ls -al /dev/mtd?
crw-------    1 root     root      90,   0 Jan  1  1970 /dev/mtd0
crw-------    1 root     root      90,   2 Jan  1  1970 /dev/mtd1
crw-------    1 root     root      90,   4 Jan  1  1970 /dev/mtd2
crw-------    1 root     root      90,   6 Jan  1  1970 /dev/mtd3
crw-------    1 root     root      90,   8 Jan  1  1970 /dev/mtd4

So Close but, So Far ;(

Can anyone suggest what I may have cocked-up ?
Where I can go from here - be nice ;)

TIA,
	Frank.=20
