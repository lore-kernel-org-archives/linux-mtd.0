Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBFDU-0007tj-IU
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 16:43:52 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i37EtXj9012291
	for <linux-mtd@lists.infradead.org>; Wed, 7 Apr 2004 16:55:33 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id RAA17148
	for <linux-mtd@lists.infradead.org>;
	Wed, 7 Apr 2004 17:43:41 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <40742192.5030901@imc-berlin.de>
Date: Wed, 07 Apr 2004 17:43:14 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

on my embedded PPC system with linux-2.425 I have two flash devices.
The first one (a new MBM29LV652UE) is directly connected to the MPC8xx
and used to store bootloader, kernel and rootfs (jffs2). It's detected
via CFI by do_map_probe("cfi_probe"...).

The second one (MBM29LV800BA) is connected via some glue logic via an FPGA.
Accesses to this one are very slow. For some reason it does not react on the
CFI sequence and thus not detected. So I use do_map_probe("jedec_probe"...)
instead.

...
  Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
init_dab4k_mtd: bank 1, name: DAB4K 0, size:8388608 bytes
Search for id:(04 225b) interleave(1) type(2)
Found: Fujitsu MBM29LV800BA
DAB4K 1: Found 1 x16 devices at 0x0 in 16-bit mode
number of JEDEC chips: 1
init_dab4k_mtd: bank 2, name: DAB4K 1, size:1048576 bytes
DAB4K flash0: Using Static image partition definition
Creating 5 MTD partitions on "DAB4K 0":
0x00120000-0x00800000 : "JFFS2"
0x00000000-0x00030000 : "U-Boot"
0x00030000-0x00040000 : "Environment"
0x00040000-0x00050000 : "FPGA"
0x00050000-0x00120000 : "Kernel"
DAB4K flash1: Using Static image partition definition
Creating 2 MTD partitions on "DAB4K 1":
0x00000000-0x00004000 : "DADSP Boot"
0x00030000-0x00080000 : "Selfstart"

Everything seems fine. "eraseall /dev/mtd6" works. But when I try to
write data to the second flash

	dd if=/dev/urandom of=/dev/mtd6 bs=64k count=1

the kernel crashes with

Warning: DQ5 raised while program operation was in progress, however operation completed OK
Warning: DQ5 raised while program operation was in progress, however operation completed OK
Warning: DQ5 raised while program operation was in progress, however operation completed OK
Waiting for write to complete timed out in do_write_oneword.
Oops: kernel access of bad area, sig: 11
NIP: 0FDF96B8 XER: 00000000 LR: 1006DA30 SP: 7FFFFC90 REGS: c0b31f50 TRAP: 0400
    Not tainted
MSR: 4000d032 EE: 1 PR: 1 FP: 0 ME: 1 IR/DR: 11
TASK = c0b30000[97] 'dd' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: 1006DAAC 7FFFFC90 00000000 0FEC09E0 7FFFFD40 00010000 1018B000 1017A1B8
GPR08: 0FE0D744 100A0000 00000000 7FFFFC50 42000002 100A6B24 00000000 00000001
GPR16: 00000000 00000000 00000000 00000000 00000001 00000000 00000001 00000000
GPR24: 7FFFFF88 7FFFFF78 00010000 1007C170 7FFFFD40 7FFFFD40 00000005 1007C170
Call backtrace:
0FECCB20 1006DAAC 1006C504 10011A18 10004770 10004360 0FDAFD14
00000000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
  <0>Rebooting in 10 seconds..

When I increase the timeout in drivers/mtd/chips/cfi_cmdset_0002.c:do_write_oneword()

	/* Polling toggle bits instead of reading back many times
	   This ensures that write operation is really completed,
	   or tells us why it failed. */
	dq6 = CMD(1<<6);
	dq5 = CMD(1<<5);
-	timeo = jiffies + (HZ/1000); /* setting timeout to 1ms for now */
+	timeo = jiffies + (10 * HZ/1000); /* setting timeout to 10ms for now */

then I still get the warnings about "DQ5 raised" but not about the timeout. Thus
the system does not crash. So I suspect that something in the lines:

		} else {
			printk(KERN_WARNING "Waiting for write to complete timed out in do_write_oneword.");

			chip->state = FL_READY;
			wake_up(&chip->wq);
			cfi_spin_unlock(chip->mutex);
			DISABLE_VPP(map);
			ret = -EIO;
		}

causes the crash...

Ideas?

-- 
Steven Scholz

imc Measurement & Control               imc Meﬂsysteme GmbH
Voltastr. 5                             Voltastr. 5
13355 Berlin                            13355 Berlin
Germany                                 Deutschland
