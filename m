Received: from [62.27.52.34] (helo=mx01.init-6.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jfad-000824-VA
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 14:41:32 +0100
Received: from p508312b9.dip.t-dialin.net ([80.131.18.185]
	helo=mx00.init-6.org)
	by mx01.init-6.org with asmtp (TLSv1:DES-CBC3-SHA:168)	(Exim 4.10)
	id 19jfaW-0007UC-00
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2003 15:41:24 +0200
Received: from boss.home.init-6.org ([192.168.225.254] helo=mail.init-6.org)
	by mx00.init-6.org with smtp (Exim 4.10)
	id 19jfaX-0007bT-00
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2003 15:41:25 +0200
Message-ID: <1037.193.110.102.2.1060004485.squirrel@mail.init-6.org>
Date: Mon, 4 Aug 2003 15:41:25 +0200 (CEST)
From: "Frank Enderle" <fen@init-6.org>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Subject: possible issue with amd/fujitsu flashes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

i still don't know if i'm right here, but there may be an issue with the
mtd driver
in kernel 2.4.22-pre9. i stepped into it as i tried to update my dbox to
the newest
head image. while everything went fine the box didn't restart after reboot
and the
serial console showed the following error:

---->
D-Box 2 flash driver (size->0x800000 mem->0x10000000)
D-Box 2 flash memory: Found 2 x16 devices at 0x0 in 32-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
Oops: kernel access of bad area, sig: 11
NIP: C00A94FC XER: 00000000 LR: C00A9440 SP: C1FF3E70 REGS: c1ff3dc0 TRAP:
0300    Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00000003, DSISR: 0000041F
TASK = c1ff2000[1] 'swapper' Last syscall: 120
last math 00000000 last altivec 00000000
GPR00: C00A9440 C1FF3E70 C1FF2000 C0148250 C0148250 00000000 00000031
C1FFB000
GPR08: 00000017 0000FFFF 00000010 C1F14110 0000000D 00031B58 01FFBB00
00000000
GPR16: 007FFF00 01FF5248 00000000 FFFFFFFF 01FAEEA8 007FFEC0 00800000
00000000
GPR24: 00000000 00000000 00000000 007FFF21 C0148250 C1F14110 0000FFFF
00000000
Call backtrace:
C0027C58 C00A9440 C00A9640 C00AF9E0 C00AF56C C00A9144 C00A8784
C01571D8 C01505F0 C0150634 C000227C C0004DA0
Kernel panic: Attempted to kill init!
<----

as i chatted with one of the developers of neutrino he mentioned that
there was as
cvs code cleanup in the mtd part of the kernel and sent me the log details:

---->
2003-07-22  stuart  <stuart@cvs.tuxbox.org>
            * mtd//include/linux/mtd/cfi.h,
mtd//drivers/mtd/chips/Makefile.common,
              mtd//drivers/mtd/chips/cfi_cmdset_0001.c,
mtd//drivers/mtd/chips/cfi_cmdset_0002.c,
              mtd//drivers/mtd/chips/cfi_cmdset_0020.c,
mtd//drivers/mtd/chips/cfi_probe.c,
              mtd//drivers/mtd/chips/cfi_util.c:
              Added generic support for reading CFI extended query tables,
and device IDs,
              and applying fixups for buggy CFI data.
              Moved all current workarounds to this structure.
<----

to proof that he compiled a version for me with another kernel (2.4.21)
which didn't show that
error:

---->
D-Box 2 flash driver (size->0x800000 mem->0x10000000)
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
Creating 6 MTD partitions on "D-Box 2 flash memory":
0x00000000-0x00020000 : "BR bootloader"
0x00020000-0x00040000 : "flfs (ppcboot)"
0x00040000-0x00720000 : "root (cramfs)"
0x00720000-0x00800000 : "var (jffs2)"
0x00020000-0x00800000 : "flash without bootloader"
0x00000000-0x00800000 : "complete flash"
<----

he adviced me to send a bugreport to the mtd project since obviously the
mtd driver tries to
access bad areas.

maybe you can review and fix the problem.

notice: the dbox is a powerpc based platform.

regards

frank
