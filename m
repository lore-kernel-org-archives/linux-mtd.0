Received: from zeke.inet.com ([199.171.211.198])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QAR0-0006cy-8h
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 19:34:58 +0100
Received: from tex.inetint.com (tex [172.16.99.35]) by zeke.inet.com (INET
	SMTP Server)  with ESMTP id h5BIZSre010328 for
	<linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 13:35:28 -0500 (CDT)
Received: from harpo.inetint.com (localhost [127.0.0.1])
	by tex.inetint.com (8.12.1/8.12.1) with ESMTP id h5BIZQpU011311
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 13:35:26 -0500 (CDT)
Received: from inet.com ([172.16.20.84]) by harpo.inetint.com
          (Netscape Messaging Server 4.15) with ESMTP id HGBYB200.QPF for
          <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 13:35:26 -0500
Message-ID: <3EE7766E.3090301@inet.com>
Date: Wed, 11 Jun 2003 13:35:26 -0500
From: Eli Carter <eli.carter@inet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mtd newbie & mtdblock write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

I'm trying to use mdtblock on an AMD (CFI) flash chip.
I can read the data from the chip and I can mount a filesystem residing 
on the chip, so that much works.

But write and erase don't work.

When I try to write 0's to part of the chip, I get this message in 
/var/log/messages:
"Last[2] is ff, datum is 0 "
The command used is:
%dd if=/dev/zero of=/dev/mtdblock1 seek=4096 count=1
dd: /dev/mtdblock1: Invalid argument
1+0 records in
1+0 records out
%
(Done as root)

I'm using 2.5.68-rmk1 (+modifications).

I have specified 2 partitions, the first at offset 0, size 0x170000, and 
the second at offset 0x170000, size 8MB-0x170000.  The first partition 
has mask_flags set to MTD_WRITABLE (making it read-only, correct?), but 
the second partition does not.

Am I doing something obviously wrong?  Is there a good starting point 
for figuring out what has gone awry?

TIA,

Eli

PS
My kernel config is has
# Memory Technology Devices (MTD)
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_REDBOOT_PARTS=y
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
CONFIG_MTD_IQ80321=y
# CONFIG_MTD_EDB7312 is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_UCLINUX is not set
# Self-contained MTD device drivers
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_NAND is not set

-- 
--------------------. "If it ain't broke now,
Eli Carter           \                  it will be soon." -- crypto-gram
eli.carter(a)inet.com `-------------------------------------------------
