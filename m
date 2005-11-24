Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfJUC-0006W4-PT
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 15:58:14 +0000
Message-ID: <4385E2F4.6010603@intel.com>
Date: Thu, 24 Nov 2005 18:57:40 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <Pine.LNX.4.64.0511231440450.6022@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0511231440450.6022@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Deadlock in cfi_cmdset_0001.c on simultaneous write operations.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas,
 
I'm using non SMP platform ( Mainstone II). CONFIG_PREEMPT is disabled.
Partition size is 8MB. Current configuration: each logical volume is 
located on each h/w partition. Logical volumes don't share h/w partitions.
I also disabled erase suspend on write feature.
 
I applied code which you have send in previous letter.
 >diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c 
b/drivers/mtd/chips/cfi_cmdset_0001.c
 >index 143f01a..a4b07e2 100644
 >--- a/drivers/mtd/chips/cfi_cmdset_0001.c
 >+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
 >@@ -644,9 +644,8 @@ static int get_chip(struct map_info *map
 >                 *
 >                 * - contension arbitration is handled in the owner's 
context.
 >                 *
 >-                * The 'shared' struct can be read when its lock is 
taken.
 >-                * However any writes to it can only be made when the 
current
 >-                * owner's lock is also held.
 >+                * The 'shared' struct can be read and/or written only 
when
 >+                * its lock is taken.
 >                 */
 >                struct flchip_shared *shared = chip->priv;
 >                struct flchip *contender;
 >@@ -675,14 +674,13 @@ static int get_chip(struct map_info *map
 >                        }
 >                        timeo = jiffies + HZ;
 >                        spin_lock(&shared->lock);
 >+                       spin_unlock(contender->mutex);
 >                }
 > 
 >                /* We now own it */
 >                shared->writing = chip;
 >                if (mode == FL_ERASING)
 >                        shared->erasing = chip;
 >-               if (contender && contender != chip)
 >-                       spin_unlock(contender->mutex);
 >                spin_unlock(&shared->lock);
 >        }
After that code behavior has changed.
It didn't halt on basic simultaneous write operations.
But it failed to kernel panic in our test case. (Five applications, each 
of them performs writing, erasing and reading own logical volume )
Here is kernel panic message:
After this message I received two more almost the same as this kernel 
panic messages.
 
Unable to handle
 kernel NULL pointer dereference at virtual address 00000000
pgd = c34d0000
[00000000] *pgd=a38ca031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1]
Modules linked in:
CPU: 0
PC is at dequeue_task+0x10/0x7c
LR is at deactivate_task+0x24/0x30
pc : [<c0030eb8>]    lr : [<c003129c>]    Tainted: P
sp : c391dfa8  ip : 00000000  fp : c391dfb4
r10: c3982300  r9 : c02095a8  r8 : c3c732d4
r7 : 00000007  r6 : c02deba0  r5 : c013b990  r4 : c3982300
r3 : 00000008  r2 : 00000000  r1 : 00000000  r0 : c3982300
Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: A3564000  DAC: 00000015
Process testapp_fm1 (pid: 939, stack limit = 0xc391c1a4)
Stack: (0xc391dfa8 to 0xc391e000)
dfa0:                   c391dfc8 c391dfb8 c003129c c0030eb4 02c76300 
c391e004
dfc0: c391dfcc c01a0928 c0031284 02734e47 33c93d00 00000075 c3982450 
c3c732f0
dfe0: c391e08c c02deba0 00000007 c3c732d4 00000001 00000001 c391e0c8 
c391e008
Backtrace:
[<c0030ea8>] (dequeue_task+0x0/0x7c) from [<c003129c>] 
(deactivate_task+0x24/0x3
0)
[<c0031278>] (deactivate_task+0x0/0x30) from [<c01a0928>] 
(schedule+0x1a8/0x4c8)
 r4 = 02C76300
[<c01a0780>] (schedule+0x0/0x4c8) from [<c013b994>] (get_chip+0xb80/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013b0b0>] (get_chip+0x29c/0xbb8)
[<c013ae14>] (get_chip+0x0/0xbb8) from [<c013d3dc>] 
(do_write_buffer+0x188/0x194
0)
[<c013d254>] (do_write_buffer+0x0/0x1940) from [<c013ece0>] 
(cfi_intelext_write_
buffers+0x14c/0x1ac)
[<c013eb94>] (cfi_intelext_write_buffers+0x0/0x1ac) from [<c012e794>] 
(part_writ
e+0xc0/0x108)
[<c012e6d4>] (part_write+0x0/0x108)
Code: e1a0c00d e92dd800 e24cb004 e1a0c001 (e5913000)
