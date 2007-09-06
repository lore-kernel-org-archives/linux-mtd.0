Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITCTR-0001k2-OY
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 04:12:30 -0400
Received: from dslb-082-083-043-147.pools.arcor-ip.net ([82.83.43.147]:36299
	helo=localhost)
	by mail.ku-gbr.de with esmtpsa (Exim 4.50 #1 (Debian))
	id 1ITCTM-0002ph-Ep
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2007 10:12:20 +0200
Received: from anita ([10.10.0.18] helo=anita.doom)
	by localhost with esmtp (Exim 4.67) (envelope-from <lists@ku-gbr.de>)
	id 1ITCTK-0004i7-K2
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 10:12:18 +0200
Received: from konsti by anita.doom with local (Exim 4.68)
	(envelope-from <lists@ku-gbr.de>) id 1ITCTH-0001Uy-Rp
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 10:12:15 +0200
Date: Thu, 6 Sep 2007 10:12:15 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: General performance of NAND operations i.e mount and ls
Message-ID: <20070906081215.GA5693@anita.doom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Finally I have my NAND driver running quite well.

It is attached to this Platform:

CPU: XScale-PXA270 [69054117] revision 7 (ARMv5TE), cr=0000397f
Machine: synertronixx GmbH scb9520 module
Memory policy: ECC disabled, Data cache writeback
Run Mode clock: 208.00MHz (*16)
Turbo Mode clock: 520.00MHz (*2.5, active)
Memory clock: 208.00MHz (/2)
System bus clock: 208.00MHz
CPU0: D VIVT undefined 5 cache
CPU0: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU0: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets

What I want to aks is, if my performance is reasonable or if I have
built in a show stopper there. 
Modprobe takes two seconds, okay:

# time modprobe scb9xxx
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron NAND 1GiB 3,3V 8-bit)
2 NAND chips detected
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 1GiB 3,3V 8-bit":
0x00000000-0x80000000 : "NAND Flash"
real    0m 1.49s
user    0m 0.01s
sys     0m 1.40s

dmesg:

NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron NAND 1GiB 3,3V
8-bit)
2 NAND chips detected
Scanning device for bad blocks
Bad eraseblock 1838 at 0x0e5c0000
Bad eraseblock 2697 at 0x15120000
Bad eraseblock 3888 at 0x1e600000
Bad eraseblock 4338 at 0x21e40000
Bad eraseblock 4501 at 0x232a0000
Bad eraseblock 8534 at 0x42ac0000
Bad eraseblock 14308 at 0x6fc80000
Bad eraseblock 14329 at 0x6ff20000
Bad eraseblock 16142 at 0x7e1c0000
Creating 1 MTD partitions on "NAND 1GiB 3,3V 8-bit":
0x00000000-0x80000000 : "NAND Flash"

Mounting lasts 20 seconds, is that a reasonable time for jffs2 on 2GiB
NAND? May be...

# time mount -t jffs2 /dev/mtdblock4 /mnt
JFFS2 notice: (186) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0
of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
real    0m 19.03s
user    0m 0.01s
sys     0m 19.01s

But the fist/initital ls takes half an hour, is this okay or are your
faster?

# time ls -la /mnt
drwxr-xr-x    3 root     root            0 Jan  1 02:00 .
drwxr-xr-x   18 root     root            0 Jan  1 02:00 ..
-rw-r--r--    1 root     root    1693788160 Jan  1  1970 buildroot-20070607-scb9xxx-5.0.3.tar
-rw-r--r--    1 root     root    1693788160 Jan  1  1970 copi
real    16m 32.38s
user    0m 0.00s
sys     10m 3.32s
#

What are your experiences on flash devices?

Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
