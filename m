Received: from fmr06.intel.com ([134.134.136.7] helo=caduceus.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cGKQ-0008EH-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 03:13:39 +0100
Received: from petasus.jf.intel.com (petasus.jf.intel.com [10.7.209.6])
	by caduceus.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g772BRx13101
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 02:11:27 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by petasus.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g772Ajm04200
	for <linux-mtd@lists.infradead.org>; Wed, 7 Aug 2002 02:10:46 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C38@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 peoblems with K3 strata flash on Dalhart 
Date: Wed, 7 Aug 2002 10:11:28 +0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi  David,
	According to your email  I  rebuild a JFFS2 image with the   block
size 0x10000,  same as the datasheet saids.
but the problem still exist.  First bootup will success without any error
message. but when I reset the board and boot it again, many errors occurs.

---------------------  first  time bootup
message-----------------------------
Creating 7 MTD partitions on "Lubbock flash":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x00080000 : "RedBoot[backup]"
0x00080000-0x00180000 : "unallocated space"
0x00180000-0x00980000 : "JFFS2"
0x00980000-0x00fc0000 : "unallocated space"
0x00fc0000-0x00fc1000 : "RedBoot config"
mtd: partition "RedBoot config" doesn't end on an erase block -- force
read-only
0x00fe0000-0x01000000 : "FIS directory"
Linux Kernel Card Services 3.1.22
  options:  [pm]
Intel PXA250/210 PCMCIA (CS release 3.1.22)
Unable to initialize kernel PCMCIA service.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
ds: no socket drivers loaded!
FAT: bogus logical sector size 453
jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0002ff58 ends at 0x00030000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0034fffc ends at 0x00350000 (with
0xe0021985)! Marking dirty
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 80K
INIT: version 2.74 booting
INIT: Entering runlevel: 3
Starting system logger:  syslogd
Starting INET services:  inetd
Starting pcmcia Starting PCMCIA services: module directory
/lib/modules/2.4.18-rmk6-pxa2/pcmcia not found.

Linux login:

After login.  create/del/ files are all OK.

---------------------  second   time bootup
message-----------------------------

cfi probe success.
Using RedBoot partition definition
Creating 7 MTD partitions on "Lubbock flash":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x00080000 : "RedBoot[backup]"
0x00080000-0x00180000 : "unallocated space"
0x00180000-0x00980000 : "JFFS2"
0x00980000-0x00fc0000 : "unallocated space"
0x00fc0000-0x00fc1000 : "RedBoot config"
mtd: partition "RedBoot config" doesn't end on an erase block -- force
read-only
0x00fe0000-0x01000000 : "FIS directory"
Linux Kernel Card Services 3.1.22
  options:  [pm]
Intel PXA250/210 PCMCIA (CS release 3.1.22)
Unable to initialize kernel PCMCIA service.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP

jffs2_scan_empty(): Empty block at 0x0030fffc ends at 0x00310000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0032fffc ends at 0x00330000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0034fffc ends at 0x00350000 (with
0xe0021985)! Marking dirty
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 80K
Write of 68 bytes at 0x0035e908 failed. returned 0, retlen 0
Not marking the space at 0x0035e908 as dirty because the flash driver
returned retlen zero
INIT: version 2.74 booting
Write of 257 bytes at 0x0035e908 failed. returned 0, retlen 0
Not marking the space at 0x0035e908 as dirty because the flash driver
returned retlen zero
Write of 185 bytes at 0x0035e908 failed. returned 0, retlen 0
Not marking the space at 0x0035e908 as dirty because the flash driver
returned retlen zero
Write of 68 bytes at 0x0035e908 failed. returned 0, retlen 0
Not marking the space at 0x0035e908 as dirty because the flash driver
returned retlen zero

Linux login:

After login.  create/del/ files will all fail.

[root@Linux /root]$touch test
Write of 68 bytes at 0x0035e908 failed. returned 0, retlen 0
Not marking the space at 0x0035e908 as dirty because the flash driver
returned retlen zero
touch: Input/output error







-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
To: Yuan, Cain
Cc: 'nico@cam.org'; linux-mtd@lists.infradead.org
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 



cain.yuan@intel.com said:
> 	I am now test JFFS2 file system on Dalhart with Redboot as
> boorloader, Linux version 2.4.18-rmk6-pxa2 and some patches for
> dalhart.

What erase size did you create your JFFS2 image with?

--
dwmw2
