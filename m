Received: from smtp.seznam.cz ([212.80.76.43])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM1tb-0007l5-Sm
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 06:53:06 -0500
Received: from ladis by orphique with local (Exim 3.36 #1 (Debian))
	id 1FM1uj-0000eQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2006 12:54:09 +0100
Date: Wed, 22 Mar 2006 12:54:09 +0100
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060322115409.GA2242@orphique>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ladislav Michl <Ladislav.Michl@seznam.cz>
Subject: jffs2 Oops on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm experiencind following Oops while mounting jffs2 NAND partiton:

Checked all inodes but still 0x13364c bytes of unchecked space?
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 817 [#1]
Modules linked in: nsswitch-04 nsquade1-03 nsblank-02 nsblank-01 nscpu-00 nsdetect nssysutil mmc_block mmc_core
CPU: 0
PC is at jffs2_garbage_collect_pass+0x1e8/0x53c
LR is at 0x1
pc : [<c00d0e88>]    lr : [<00000001>]    Not tainted
sp : c3e25ef0  ip : 60000093  fp : c3e25f58
r10: c3e380e8  r9 : 00000000  r8 : c3e38000
r7 : 00000000  r6 : c3e38000  r5 : c3e3802c  r4 : c3ec98a8
r3 : c01d7940  r2 : 00000000  r1 : 00000000  r0 : 00000046
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 317F  Table: 1342C000  DAC: 00000015
Process jffs2_gcd_mtd5 (pid: 138, stack limit = 0xc3e24194)
Stack: (0xc3e25ef0 to 0xc3e26000)
5ee0:                                     c3e25f0c c3e25f00 c00428d0 c004281c 
5f00: c3e25f38 c3e25f10 c0042f7c c00428c4 20000013 c3db8040 c3db8234 c3e25f5c 
5f20: 00000000 00000000 c3e25f44 c3e25f48 20000013 c3e24000 c3e38000 00000000 
5f40: 00000000 00000000 00000000 c3e25ff4 c3e25f5c c00d3d80 c00d0cb0 00000001 
5f60: 00000000 00000080 00000000 00000000 00000000 c34e1f4c c34e1f40 c003aefc 
5f80: c003aa70 40172c60 c3e25fa4 c3e25f98 c003af2c c003ae90 00000000 00000000 
5fa0: 00000000 c3e25fb0 c001dd84 c0034758 00000000 c3e38000 c00d3c9c c003aa60 
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
5fe0: 00000000 00000000 00000000 c3e25ff8 c003aa60 c00d3cac 00000000 00000000 
Backtrace: 
[<c00d0ca0>] (jffs2_garbage_collect_pass+0x0/0x53c) from [<c00d3d80>] (jffs2_garbage_collect_thread+0xe4/0x120)
[<c00d3c9c>] (jffs2_garbage_collect_thread+0x0/0x120) from [<c003aa60>] (do_exit+0x0/0x3d0)
 r6 = 00000000  r5 = 00000000  r4 = 00000000 
Code: e59f0348 ebfd9ea4 eaffffec ebfd9ea2 (e5877000) 
 <0>Kernel panic - not syncing: Fatal exception

Kernel version is 2.6.15 with CVS jffs2 from 10. Mar 2006 and omap2 patch
applied (http://www.muru.com/linux/omap/patches/patch-2.6.15-omap2.bz2).

You can find jffs2 image and kernel objdump here:
ftp://ftp.linux-mips.org/pub/linux/mips/people/ladis/jffs2_oops/

I'm ready to do any testing you ask for.

Thanks a lot,
	ladis
