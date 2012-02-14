Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxPOu-0002CD-BR
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 20:55:02 +0000
From: Richard Weinberger <rw@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 0/7] UBI checkpointing support
Date: Tue, 14 Feb 2012 21:06:39 +0100
Message-Id: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Cc: tglx@linutronix.de, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patch set implements checkpointing support for
UBI. Checkpointing is an optional feature which stores the physical to
logical eraseblock relations in a checkpointing superblock to reduce
the initialization time of UBI. The current init time of UBI is
proportional to the number of physical erase blocks on the FLASH
device. With checkpointing enabled the scan time is limited to a fixed
number of blocks.

Checkpointing does not affect any of the existing UBI robustness
features and in fact the checkpointing code falls back into scanning
mode when the checkpoint superblock(s) are corrupted.

The checkpoints consist of two elements:

1) A primary checkpoint block, which contains merily a pointer to the
   erase block(s) which hold the real checkpointing data.

   This primary block is guaranteed to be held within the first N
   eraseblocks of a device. N is momentarily set to 16, but it might
   be necessary to make this configurable in some way.

2) The secondary checkpoint blocks, which contain the real
   checkpointing data (physical to logical eraseblock relations,
   erase counts, sequence numbers ...)

   Aside of that the checkpointing data contains a list of blocks
   which belong to the active working pool. The active working pool is
   a fixed number of blocks for shortterm, longterm and unknown
   storage time, which can be modified before the next checkpoint set
   is written to FLASH. These blocks need to be scanned in the
   conventional UBI scan mode.

   The reason for these pool blocks is to reduce the checkpoint
   updates to the necessary minimum to avoid accelerated device
   wearout in scenarios where data changes rapidly. The checkpoint
   data is updated whenever a working pool runs out of blocks.

   The number of pool blocks can be defined with a config option at
   the moment, but this could also be done at runtime via sysfs. In
   case of a change the checkpointing data would be reconstructed.

So the checkpoint scan consists of the following steps:

   1) Find the primary checkpoint block by scanning the start of the
      device.

   2) Read the real checkpoint data and construct the UBI device info
      structures.

   3) Scan the pool blocks.

All these operations scan a limited number of erase blocks which makes
the UBI init O(1) and independent of the device size.

The checkpoint functionality is fully compatible with existing UBI
deployments. If no checkpoint blocks can be found then the device is
scanned and the checkpoint blocks are created from the scanned
information.

Aside of review and testing it needs to be decided, whether the number
of pool blocks should be deduced from the device size (number of
physical eraseblocks) or made configurable at compile or runtime.

Thanks to the folks at CELF who sponsored this work!

[RFC][PATCH 1/7] MTD: UBI: Add checkpoint on-chip layout
[RFC][PATCH 2/7] MTD: UBI: Add checkpoint struct to ubi_device
[RFC][PATCH 3/7] MTD: UBI: Export next_sqnum()
[RFC][PATCH 4/7] MTD: UBI: Make wl subsystem checkpoint aware
[RFC][PATCH 5/7] MTD: UBI: Make process_eb() checkpoint aware
[RFC][PATCH 6/7] MTD: UBI: Implement checkpointing support
[RFC][PATCH 7/7] MTD: UBI: wire up checkpointing
