Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA0CC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uMN1c5fdS2qaMHweodql5U46mxGVUJZIpcuL8uns63Q=; b=ia2razGEIA/Zb0
	m3L4Pa8RKmlRnIuRZmew5HS9qy1rFBqAZOBmLDaHDf2bFAavHGcG1afmbNqfViw6j17JnaxkaqU+h
	ZN/vpNS6Jk/omj8x3Z73n+rlBaM+wpfSU8GXINJDNuuaxRAxpNRdJwfvFGNUvGIBScqpL768Otm6q
	6rvR6d/DTNnkvn4PQw81Z0kztq8XnOA9GkoCi7wgoFCS4Qf2Z8dbRx5vDBzFtpprjCEGSXTnqcqNN
	mr65D0d0I/5d67FjhgSmmUYp2iWwHuCKfzAGQakc/kfbPE7a4k6NuYY9PRCwrkmjGTFs1kcQXkMrO
	SP3Awpp8vYv6qPXQ2d4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIbQ-009qtZ-1U;
	Mon, 20 Mar 2023 16:43:20 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIbK-009qqO-1V
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 16:43:18 +0000
Received: from ramsan.of.borg ([84.195.187.55])
	by michel.telenet-ops.be with bizsmtp
	id agjA2900G1C8whw06gjAcb; Mon, 20 Mar 2023 17:43:10 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1peIab-00E2y0-Dv;
	Mon, 20 Mar 2023 17:43:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1peIbG-007Sdk-7P;
	Mon, 20 Mar 2023 17:43:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
Date: Mon, 20 Mar 2023 17:43:08 +0100
Message-Id: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_094314_659542_DDEE51A2 
X-CRM114-Status: GOOD (  13.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
"mtd-rom" does not work:
  1. Probing fails with "physmap-flash 0.flash: map_probe failed",
  2. The kernel crashes later in a spectacular way, cfr. the logs below.

U-Boot flinfo says:

    Bank # 1: CFI conformant flash (16 x 16)  Size: 64 MB in 512 Sectors
      AMD Standard command set, Manufacturer ID: 0x01, Device ID: 0x227E
      Erase timeout: 4096 ms, write timeout: 1 ms
      Buffer write timeout: 3 ms, buffer size: 64 bytes
      Sector Start Addresses:
      00000000   RO   00020000        00040000   RO   00060000   RO   00080000
      000A0000        000C0000        000E0000        00100000        00120000
      00140000        00160000        00180000        001A0000        001C0000
      ...
      03FC0000        03FE0000

    Bank # 2: missing or unknown FLASH type

Does anyone have a clue? Using "mtd-rom", I can at least read the FLASH
under Linux.

Thanks in advance!

Crash logs:

    WARNING: bad unlock balance detected!
    6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #29 Not tainted
    -------------------------------------
    rcS/66 is trying to release lock ((null)) at:
    [<c011f038>] copy_process+0x1120/0x193c
    but there are no more locks to release!

    other info that might help us debug this:
    1 lock held by rcS/66:
     #0: c28008d8 (&mm->mmap_lock){++++}-{3:3}, at: copy_process+0xcc4/0x193c

    stack backtrace:
    CPU: 0 PID: 66 Comm: rcS Not tainted 6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #29
    Hardware name: Generic R8A7779 (Flattened Device Tree)
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x68/0x90
     dump_stack_lvl from lock_release+0x168/0x328
     lock_release from up_write+0x20/0x244
     up_write from copy_process+0x1120/0x193c
     copy_process from kernel_clone+0xa0/0x2e4
     kernel_clone from sys_clone+0x6c/0x94
     sys_clone from ret_fast_syscall+0x0/0x1c
    Exception stack(0xf0a2dfa8 to 0xf0a2dff0)
    dfa0:                   00200068 bed21738 01200011 00000000 00000000 00000000
    dfc0: 00200068 bed21738 00000042 00000078 00000000 00200000 0020123c bed2176c
    dfe0: 002004c0 bed21738 00000000 00119664
    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 66 at kernel/locking/rwsem.c:1364 up_write+0x98/0x244
    DEBUG_RWSEMS_WARN_ON(sem->magic != sem): count = 0x0, magic = 0x0, owner = 0x0, curr 0xc27b04c0, list not empty
    Modules linked in:
    CPU: 0 PID: 66 Comm: rcS Not tainted 6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #29
    Hardware name: Generic R8A7779 (Flattened Device Tree)
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x68/0x90
     dump_stack_lvl from __warn+0x7c/0x1c0
     __warn from warn_slowpath_fmt+0xec/0x138
     warn_slowpath_fmt from up_write+0x98/0x244
     up_write from copy_process+0x1120/0x193c
     copy_process from kernel_clone+0xa0/0x2e4
     kernel_clone from sys_clone+0x6c/0x94
     sys_clone from ret_fast_syscall+0x0/0x1c
    Exception stack(0xf0a2dfa8 to 0xf0a2dff0)
    dfa0:                   00200068 bed21738 01200011 00000000 00000000 00000000
    dfc0: 00200068 bed21738 00000042 00000078 00000000 00200000 0020123c bed2176c
    dfe0: 002004c0 bed21738 00000000 00119664
    irq event stamp: 1863
    hardirqs last  enabled at (1863): [<c026c664>] kmem_cache_free+0x130/0x158
    hardirqs last disabled at (1862): [<c026c614>] kmem_cache_free+0xe0/0x158
    softirqs last  enabled at (1624): [<c0101474>] __do_softirq+0x178/0x3e8
    softirqs last disabled at (1611): [<c01276f0>] __irq_exit_rcu+0x110/0x168
    ---[ end trace 0000000000000000 ]---

  or:

    WARNING: bad unlock balance detected!
    6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #27 Not tainted
    -------------------------------------
    systemd/1 is trying to release lock (
    8<--- cut here ---
    Unable to handle kernel paging request at virtual address 4e22202c when read
    [4e22202c] *pgd=00000000
    Internal error: Oops: 5 [#1] SMP ARM
    Modules linked in:
    CPU: 2 PID: 1 Comm: systemd Not tainted 6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #27
    Hardware name: Generic R8A7779 (Flattened Device Tree)
    PC is at string_nocheck+0x44/0x64
    LR is at 0xffffffff
    pc : [<c080ac48>]    lr : [<ffffffff>]    psr: 000f0093
    sp : f0829a28  ip : f0829af4  fp : c0b13875
    r10: 00000008  r9 : f0829a7c  r8 : f0829aec
    r7 : f0829af4  r6 : f0829b7c  r5 : 4e22202c  r4 : f0829af4
    r3 : ffffff04  r2 : 4e22202c  r1 : 00000000  r0 : f0829aee
    Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
    Control: 10c5387d  Table: 6332004a  DAC: 00000051
    Register r0 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r1 information: NULL pointer
    Register r2 information: non-paged memory
    Register r3 information: non-paged memory
    Register r4 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r5 information: non-paged memory
    Register r6 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r7 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r8 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r9 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r10 information: non-paged memory
    Register r11 information: non-slab/vmalloc memory
    Register r12 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Process systemd (pid: 1, stack limit = 0x(ptrval))
    Stack: (0xf0829a28 to 0xf082a000)
    9a20:                   f0829aee f0829af4 4e22202c c080c990 c18c0918 ffffff04
    [...]
     string_nocheck from string+0x54/0x64
     string from vsnprintf+0x220/0x36c
     vsnprintf from vprintk_store+0x130/0x3b4
     vprintk_store from vprintk_emit+0xa8/0x23c
     vprintk_emit from vprintk_default+0x1c/0x24
     vprintk_default from _printk+0x28/0x58
     _printk from print_lockdep_cache+0x3c/0x68
     print_lockdep_cache from print_unlock_imbalance_bug+0x6c/0xe0
     print_unlock_imbalance_bug from lock_release+0x168/0x328
     lock_release from up_write+0x20/0x244
     up_write from copy_process+0x1120/0x193c
     copy_process from kernel_clone+0xa0/0x2e4
     kernel_clone from sys_clone+0x6c/0x94
     sys_clone from ret_fast_syscall+0x0/0x1c
    Exception stack(0xf0829fa8 to 0xf0829ff0)
    9fa0:                   b64f47b8 b64f4c10 01200011 00000000 00000000 00000000
    9fc0: b64f47b8 b64f4c10 00000000 00000078 00000020 00000000 b64f4750 00000001
    9fe0: 00000078 be953908 b6ea5253 b6e47746
    Code: e28dd00c e49de004 e28dd008 e12fff1e (e7d23001)
    ---[ end trace 0000000000000000 ]---

---
 arch/arm/boot/dts/r8a7779-marzen.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index fd40890bd77bc64c..632519edba6b5a47 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -26,6 +26,33 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	flash@0 {
+		compatible = "mtd-rom";
+		reg = <0x0 0x04000000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "uboot-env";
+				reg = <0x00040000 0x00040000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "flash";
+				reg = <0x00080000 0x03f80000>;
+			};
+		};
+	};
+
 	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
