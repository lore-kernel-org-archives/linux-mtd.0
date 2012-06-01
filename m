Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaMZq-0004VQ-Bg
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 07:47:19 +0000
Message-ID: <4FC87383.2020303@intel.com>
Date: Fri, 01 Jun 2012 10:47:15 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: UBIFS master node corruption
References: <jq7t2r$md2$1@dough.gmane.org>
In-Reply-To: <jq7t2r$md2$1@dough.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 31/05/12 16:52, Romain Izard wrote:
> Sirs,
> 
> While using a system based on UBI and UBIFS, I am encountering a rare
> but regular occurence of corruption of the master node of the UBIFS
> partitions.
> 
> This is happening on a device using a MLC flash with a 8 KiB write
> pages, 2 MiB erase blocks, and an embedded hardware controller ensuring
> a 24bit/KiB BCH error correction. The flash is split in multiple MTD
> partitions and UBI/UBIFS is only used on some partitions. Because the
> system is reusing a legacy bootloader, other MTD partitions are used as
> raw MTD areas, or as UBI containing static cramfs volumes.
> 
> The system is derived from the BSP provided by my IC vendor, based on
> linux-2.6.32 with android patches, upon which were added various
> bugfixes and additional features, as well as the UBI and UBIFS bugfixes
> from the ubifs-v2.6.32 repository.
> 
> The most common corruption I observe is that LEB 1 & 2, containing the
> master nodes, are not synchronized anymore: one of the LEBs contains
> many additional versions of the master node, just as if the other LEB
> had been recovered from the past. I can see that by analyzing the
> contents of the LEB from the beginning, as the only difference for each
> written node in the beginning of the erase block is the sequence number
> and the crc.  Thus it does not look like the shorter LEB has been
> corrupted, only cut short. Unfortunatly, due to the difficulty of
> reproducing the issue, I do not have any trace of what happened that led
> to this. I only get the information from the fact that the kernel
> refuses to mount the file system.
> 
> Have you ever encountered this kind of issue before ?

You need to make sure you have this patch from the 
linux-2.6.32.y branch of linux-stable:

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 21 Apr 2011 14:49:55 +0300
Subject: [PATCH] UBIFS: fix master node recovery

commit 6e0d9fd38b750d678bf9fd07db23582f52fafa55 upstream.

This patch fixes the following symptoms:
1. Unmount UBIFS cleanly.
2. Start mounting UBIFS R/W and have a power cut immediately
3. Start mounting UBIFS R/O, this succeeds
4. Try to re-mount UBIFS R/W - this fails immediately or later on,
   because UBIFS will write the master node to the flash area
   which has been written before.

The analysis of the problem:

1. UBIFS is unmounted cleanly, both copies of the master node are clean.
2. UBIFS is being mounter R/W, starts changing master node copy 1, and
   a power cut happens. The copy N1 becomes corrupted.
3. UBIFS is being mounted R/O. It notices the copy N1 is corrupted and
   reads copy N2. Copy N2 is clean.
4. Because of R/O mode, UBIFS cannot recover copy 1.
5. The mount code (ubifs_mount()) sees that the master node is clean,
   so it decides that no recovery is needed.
6. We are re-mounting R/W. UBIFS believes no recovery is needed and
   starts updating the master node, but copy N1 is still corrupted
   and was not recovered!

Fix this problem by marking the master node as dirty every time we
recover it and we are in R/O mode. This forces further recovery and
the UBIFS cleans-up the corruptions and recovers the copy N1 when
re-mounting R/W later.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
 fs/ubifs/recovery.c |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index f94ddf7..31d09d1 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -299,6 +299,32 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 			goto out_free;
 		}
 		memcpy(c->rcvrd_mst_node, c->mst_node, UBIFS_MST_NODE_SZ);
+
+		/*
+		 * We had to recover the master node, which means there was an
+		 * unclean reboot. However, it is possible that the master node
+		 * is clean at this point, i.e., %UBIFS_MST_DIRTY is not set.
+		 * E.g., consider the following chain of events:
+		 *
+		 * 1. UBIFS was cleanly unmounted, so the master node is clean
+		 * 2. UBIFS is being mounted R/W and starts changing the master
+		 *    node in the first (%UBIFS_MST_LNUM). A power cut happens,
+		 *    so this LEB ends up with some amount of garbage at the
+		 *    end.
+		 * 3. UBIFS is being mounted R/O. We reach this place and
+		 *    recover the master node from the second LEB
+		 *    (%UBIFS_MST_LNUM + 1). But we cannot update the media
+		 *    because we are being mounted R/O. We have to defer the
+		 *    operation.
+		 * 4. However, this master node (@c->mst_node) is marked as
+		 *    clean (since the step 1). And if we just return, the
+		 *    mount code will be confused and won't recover the master
+		 *    node when it is re-mounter R/W later.
+		 *
+		 *    Thus, to force the recovery by marking the master node as
+		 *    dirty.
+		 */
+		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
 	} else {
 		/* Write the recovered master node */
 		c->max_sqnum = le64_to_cpu(mst->ch.sqnum) - 1;
-- 
1.7.10.2



Otherwise could you send copies of the corrupted LEB 1 and 2?

And the output from:

	git log v2.6.32..HEAD -- fs/ubifs


> Do you have an idea of what could be happenning that triggers this
> problem ?
> 
> If you could provide any help on this issue, I'd be glad to accept it.
> 
> Regards,
