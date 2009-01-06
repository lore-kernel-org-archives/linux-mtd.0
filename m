Received: from ppsw-7.csi.cam.ac.uk ([131.111.8.137])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKIGe-0005oA-K1
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2009 20:11:13 +0000
Received: from coriolanus.eng.cam.ac.uk ([129.169.154.144]:60804)
	by ppsw-7.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1LKIGa-0001Jz-PQ (Exim 4.70) for linux-mtd@lists.infradead.org
	(return-path <jic23@cam.ac.uk>); Tue, 06 Jan 2009 20:11:08 +0000
Message-ID: <4963BAD4.50803@cam.ac.uk>
Date: Tue, 06 Jan 2009 20:11:00 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2, 2.6.28-git8 : Weird problem.
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Having applied a few board specific patches on top of
Linus' tree (around 2.6.28-git8)
run into the following.

Anyone have an ideas or seeing anything similar?

Works fine on 2.6.28 so git bisection underway, but
will take a while given speed of flashing this device
(intelmote 2)


WARNING: udev_root != /dev/
Creating initial device nodes...done.
Unable to handle kernel NULL pointer dereference at virtual address 00000150
pgd = c0004000
[00000150] *pgd=00000000
Internal error: Oops: 17 [#1] PREEMPT
Modules linked in:
CPU: 0    Not tainted  (2.6.28_r1.0-06127-g238c6d5 #2)
PC is at set_dumpable+0x3c/0xc8
LR is at commit_creds+0x140/0x23c
pc : [<c0092450>]    lr : [<c0051f90>]    psr: 60000093
sp : c1083ed4  ip : c1083ee4  fp : c1083ee0
r10: 00000000  r9 : 00000000  r8 : c1d38400
r7 : c1c3f080  r6 : c02a72f8  r5 : c1c4faa0  r4 : 00000000
r3 : 60000093  r2 : 60000093  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a1e1c000  DAC: 00000015
Process jffs2_gcd_mtd2 (pid: 787, stack limit = 0xc1082268)
Stack: (0xc1083ed4 to 0xc1084000)
3ec0:                                              c1083f20 c1083ee4 c0051f90 
3ee0: c0092420 00000100 00000000 fffffeff ffffffff ffffffff ffffffff 00000100 
3f00: 00000000 c1082000 c02a0e38 00000000 00000000 c1083f40 c1083f24 c0039028 
3f20: c0051e5c ffffffff ffffffff 00000000 00000000 c1083ff4 c1083f54 c0114ef0 
3f40: c0038e10 c0278768 00000002 c0114ecc c1c724a0 00000000 00000000 00000000 
3f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
3f80: 58000442 00000000 00000000 c1083fac c1083f9c c00319ac c002fec4 00000000 
3fa0: 00000000 c1083fb0 c001df84 c0031998 00000000 c1d38400 c0114ecc c0039064 
3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
3fe0: 00000000 00000000 00000000 c1083ff8 c0039064 c0114ed8 a0311021 a0311421 
Backtrace: 
[<c0092414>] (set_dumpable+0x0/0xc8) from [<c0051f90>] (commit_creds+0x140/0x23c)
[<c0051e50>] (commit_creds+0x0/0x23c) from [<c0039028>] (daemonize+0x228/0x264)
 r7:00000000 r6:00000000 r5:c02a0e38 r4:c1082000
[<c0038e00>] (daemonize+0x0/0x264) from [<c0114ef0>] (jffs2_garbage_collect_thread+0x24/0x1e4)
 r3:c1c724a0 r2:c0114ecc r1:00000002 r0:c0278768
 r5:00000000 r4:00000000
[<c0114ecc>] (jffs2_garbage_collect_thread+0x0/0x1e4) from [<c0039064>] (do_exit+0x0/0x758)
 r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:00000000
Code: e89da800 e10f2000 e3823080 e121f003 (e5903150) 
---[ end trace 28404767015f24df ]---
note: jffs2_gcd_mtd2[787] exited with preempt_count 1

Thanks,

--
Jonathan Cameron
