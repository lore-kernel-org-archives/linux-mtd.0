Received: from pop.perto.com.br ([200.182.168.130] helo=rsmail.perto.com.br)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19h8Dl-0006Bp-Li
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jul 2003 14:39:31 +0100
Received: from [192.168.2.78] (localhost [127.0.0.1])
	by rsmail.perto.com.br (8.11.6/linuxconf) with ESMTP id h6SDh2832598
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jul 2003 10:43:02 -0300
From: Moises Beck <moises@digicon.com.br>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-Id: <1059399490.2230.10.camel@localhost.localdomain>
Mime-Version: 1.0
Date: 28 Jul 2003 10:38:11 -0300
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: problems with smartemedia
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
	I am trying to use a smartmedia card on a ppc MPC850 processor, running
a ELDK 2.0.2. A modified the file spia.c to corform it for the
parameters of my board. During the inicialization of Linux, it`s all OK,
where we can see:

...
NAND device: Manufacture ID: 0x98, Chip ID: 0x73 (Toshiba TH58V128DC)
Creating 1 MTD partitions on "Toshiba TH58V128DC":
0x00000000-0x01000000 : "SPIA flash partition 1"
NFTL driver: nftlcore.c $Revision: 1.83 $, nftlmount.c $Revision: 1.23 $
...

	But, when I try to mount the device, the kernel show the following
messages:

bash-2.05# mount /dev/mtdblock3 /mnt/nand
Oops: machine check, sig: 7
NIP: C000BF58 XER: 20000071 LR: C000BF40 SP: C02D9DF0 REGS: c02d9d40
TRAP: 0200
MSR: 00001032 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c02d8000[7] 'mtdblockd' Last syscall: -1
last math 00000000 last altivec 00000000
GPR00: 00001032 C02D9DF0 C02D8000 00000001 00009032 00000001 00000000
00000018
GPR08: 00000001 00000001 00000000 C019F4F0 00000000 100268F4 01FDE000
007FFF61
GPR16: 00000000 00000001 007FFF00 FFFFFFFF 01FD867C C1FF5000 00000000
C026060C
GPR24: 00000003 C02605F8 FFFFFFF8 00000001 00000000 C02605F8 00000001
C02D9DF0
Call backtrace:
00000000 C00D2A8C C00D271C C00D4DC4 C00D6988 C00D6EEC C00D70DC
C0004DC8
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
Rebooting in 180 seconds..

	Do someone have some idea about it ??

Thanks
Moises Beck
