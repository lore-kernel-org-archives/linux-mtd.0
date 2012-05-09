Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSArD-0006g7-6e
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 17:39:31 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC v2] UBI: UBIVIS (aka checkpointing) support
Date: Wed,  9 May 2012 19:38:38 +0200
Message-Id: <1336585125-127220-1-git-send-email-richard@nod.at>
Cc: Heinz.Egger@linutronix.de, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 tim.bird@am.sony.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patch set implements UBIVIS (checkpointing) support for
UBI.

Changes since v1:
        - renamed it to UBIVIS (at least in Kconfig)
        - UBIVIS parameters are now configurable via Kconfig
        - several bugs have been fixed (design and implementation bugs)
        - added lots of comments to make the review process easier
        - made checkpatch.pl happy

Currently I'm testing UBIVIS on different workloads to find bugs
and good configuration parameters (mostly for the pool size).
So, expect v3 soon! :-)

Description:

Checkpointing is an optional feature which stores the physical to
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
   eraseblocks of a device. N is momentarily set to 64, this value can
   be changed via Kconfig.

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

[PATCH 1/7] [RFC] UBI: Add checkpoint on-chip layout
[PATCH 2/7] [RFC] UBI: Add checkpoint struct to ubi_device
[PATCH 3/7] [RFC] UBI: Export next_sqnum()
[PATCH 4/7] [RFC] UBI: Export compare_lebs()
[PATCH 5/7] [RFC] UBI: Make wl subsystem checkpoint aware
[PATCH 6/7] [RFC] UBI: Implement checkpointing support
[PATCH 7/7] [RFC] UBI: wire up checkpointing

Thanks,
//richard
