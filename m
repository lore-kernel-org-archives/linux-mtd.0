Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vYd-0000R4-T3
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 18:09:45 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
Subject: [RFC] avoid a live lock in wear_leveling_worker()
Date: Mon, 23 Nov 2015 19:09:05 +0100
Message-Id: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[ NOTE:
  This has been debugged + tested on v3.0 and then forward ported to
  v4.0-rc2. From what I see the problem should still occur whith proper
  timming.
]

On boot I managed run into a live lock situation within UBI. For $reason
UBI triggered ensure_wear_leveling() and decided to move a block.

It reads the VID header and then invokes ubi_eba_copy_leb(). It tries to
leb_write_trylock() but the PEB is already locked by `sshd' (which is in
UBI-read path, waiting for the NAND device) so it returns MOVE_RETRY.
Based on MOVE_RETRY UBI decides to invoked schedule_erase() on the empty
PEB.
The erase_worker() shows up on the CPU almost right away. It erases the
PEB via sync_erase() and then invokes ensure_wear_leveling() and decides
to move a block. The situation repeats as described in the previous
chapter. The only thing changed since the previous iteration is the EC
counter.

UBI expects that MOVE_RETRY is a temporary situation while here it is
persistent.
Each invocation of schedule_erase() invokes nand_get_device() which
succeeds so the UBI background threads owns the NAND device and can erase
a block. During the erase process the UBI threads schedules away while the
NAND drivers waits for an interrupt. While idle, the scheduler puts run able
tasks on the CPU. Two of them are waiting on the wait queue in
nand_get_device() but did not yet have the chance to run since the last
nand_release_device() invocation. One of them owns the PEB lock that causes
ubi_eba_copy_leb() return MOVE_RETRY.
After the erase process completes the NAND device is released via
nand_release_device() and the two waiting tasks receive a wake up. They
are not put on the CPU right away and the UBI tasks continues (no need
resched flag set).
The UBI task tries to copy the block but because it can't get the PEB
lock it schedules the PEB for erasing and gets the nand_get_device()
immediately.
The live lock happens because the condition which was true at the wake up
time is no longer true at the time the waiting task managed to get on the
CPU.
>From a little tracing:

|18596594us : ensure_wear_leveling: schedule scrubbing
|18596609us : wear_leveling_worker: scrub PEB 1132 to PEB 640
|18596627us : __schedule: ubi_bgt0d -> ubifs_bgt0_2
|18596637us : __schedule: ubifs_bgt0_2 -> sshd
|18596645us : __schedule: sshd -> cat
|18596653us : __schedule: cat -> swapper
|18596839us : __schedule: swapper -> ubi_bgt0d
|18596855us : __schedule: ubi_bgt0d -> swapper
|18597045us : __schedule: swapper -> ubi_bgt0d
|18597073us : __schedule: ubi_bgt0d -> swapper
|18597263us : __schedule: swapper -> ubi_bgt0d
|18597280us : default_wake_function: cat
|18597286us : default_wake_function: sshd
|18597293us : default_wake_function: ubifs_bgt0_2 
  ^read block within UBI

|18597304us : ubi_eba_copy_leb: copy LEB 2:486, PEB 1132 to PEB 640
|18597311us : ubi_eba_copy_leb: Lock woned by process: sshd
|18597315us : ubi_eba_copy_leb: contention on LEB 2:486, cancel
|18597318us : wear_leveling_worker: MOVE_RETRY
|18597323us : wear_leveling_worker: cancel moving PEB 1132 (LEB 2:486) to PEB 640
|18597329us : schedule_erase: schedule erasure of PEB 640, EC 3136, torture 0
|18597336us : erase_worker: erase PEB 640 EC 3136
|18597340us : erase_worker: erase PEB 640, old EC 3136
|18597349us : nand_erase_nand: start = 0x000005500000, len = 131072
^ erase in progress

|18597366us : __schedule: ubi_bgt0d -> sshd
|18597376us : __schedule: sshd -> ubifs_bgt0_2
|18597384us : __schedule: ubifs_bgt0_2 -> cat
|18597391us : __schedule: cat -> swapper
|18597556us : __schedule: swapper -> ubi_bgt0d
|18597574us : __schedule: ubi_bgt0d -> swapper
|18598376us : __schedule: swapper -> ubi_bgt0d
|18598391us : __schedule: ubi_bgt0d -> swapper
|18598580us : __schedule: swapper -> ubi_bgt0d
|18598594us : default_wake_function: cat
|18598601us : default_wake_function: ubifs_bgt0_2
|18598607us : default_wake_function: sshd

The next thing that happens once the erase completes is
=> ensure_wear_leveling: schedule scrubbing

Patch #1 avoids the live lock by invoking schedule() in case there is
someone in the waitqueue so the waiter has a chance to get on the CPU
while the device is free.
Patch #2 is an optimization so the free (and empty) EB is not erased if
nothing was written into it.

Sebastian
