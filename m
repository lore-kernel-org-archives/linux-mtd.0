Received: from [202.130.83.226] (helo=www.avantwave.com ident=[+/B90ACo/UKngURvHtNrM39Evo6Or2Sm])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rywq-0005M4-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2002 11:54:16 +0100
Received: from [192.168.0.97] ([192.168.0.97])
	by www.avantwave.com (8.11.6/linuxconf) with ESMTP id g8JAsCJ22736
	for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2002 18:54:12 +0800
Subject: jffs2 BUG() in gc.c:135 "Checked all inodes but still..."
From: Victor Tse <victortse@avantwave.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1032432851.1847.22.camel@www.avantwave.com>
Mime-Version: 1.0
Date: 19 Sep 2002 18:54:11 +0800
Content-Transfer-Encoding: 7bit
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

Hi,

I am using the latest code updated from CVS with 2.4.18-rmk7 on a ~4.5MB
partition on a 8MB NAND flash.

We already have a running filesystem on the flash previously created
with code from CVS on Sep 6. Seconds after the partition is mounted, a
kernel BUG() appears:

Checked all inodes but still 0x5a8 bytes of unchecked space?
kernel BUG at gc.c:135!
Unable to handle kernel NULL pointer dereference at virtual address
00000000
...

The number of bytes reported is different every time.

Before updating to the latest code there had been strange behaviors e.g.
seemingly corrupted executable files that restores itself after a
reboot, and we get different bad CRC reports every time the system boots
up. However generally the system is stable enough for our development.

Is the new code compatible with old data? Should I just rebuild the
whole filesystem with the new code by erasing it and copying all files
into it? Any help is greatly appreciated...


ksymoops output:

kernel BUG at gc.c:135!
Unable to handle kernel NULL pointer dereference at virtual address
00000000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c0 0392c0>]    lr     Not tainted
sp : c09fbf08  ip : c09fbec0  fp : c09fbf18
r10: 00000000  r9 : 00000003  r8 : c0717904
r7 : c07178e0  r6 : c07178cc  r5 : c07178cc  r4 : 00000000
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 00000001
Flags: nZCv  IRQs on  FbIQs on  Mode SVControl: 217F  Table: C0614015 
DAC: 00000015
Process jffs2_gcd_mtd4 (pid: 11, stackpage=c09fb000)
Stack: (0xc09fbef8 to 0xc09fc000)
bee0:                                                       c003f2f8
c00392c0
bf00: 60000013 ffffffff c09fa000 c09fbf5c c09fbf1c c008d4cc4 c003928c
c07d4000 00000000 00000000 00000000 00000000 c09fa000 c07178cc 00000000
bf40: c07178e0 00000000 00000003 00000000 c09fbff4 c09fbf60 c0090bd4
c008d430
bf60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff
bf80: ffffffff ffffffff 00000013 000c00000 00000000 000 00000000
bfa0: 00000000 c09fbfb0 c0034914 c003bb68 00000000 00000000 00000600
c00909e4
bfc0: c07178cc c0717800 00000000 c07178e0 00000000 00000003 00000000
c07dde1c
bfe0: 00000000 c0717800 00000000 c09fbff8 c0035c40 c00909f4 ffffffff
ffffffff
Backtrace:
Function entered at [<c0039270c>] from [<c008C09FA000
Function entered at [<c008d420>] from [<c0090bd4>]
Function entered at [<c00909e4>] from [<c0035c40>]
 r5 = C0717800  r4 = 00f000000
Code:
Kernel panic: Aiee, killing interrupt handler!
Warning (Oops_read): Code line not seen, dumping what data is available


Trace; 0000000c0039270c <END_OF_CODE+b40206fc0/????>
Trace; c008d420 <jffs2_garbage_collect_pass+0/7ac>
Trace; c0090bd4 <jffs2_garbage_collect_thread+1f0/208>
Trace; c00909e4 <jffs2_garbage_collect_thread+0/208>
Trace; c0035c40 <kernel_thread+38/48>



-- 
Victor Tse <victortse@avantwave.com>
