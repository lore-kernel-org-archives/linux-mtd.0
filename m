Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAHQR-0005cL-Vu
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 13:52:12 +0000
Received: by mail-yw0-x244.google.com with SMTP id l126so22945708ywe.3
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2016 06:51:51 -0700 (PDT)
MIME-Version: 1.0
From: Jeff Harris <jefftharris@gmail.com>
Date: Tue, 7 Jun 2016 09:51:30 -0400
Message-ID: <CAGMfbUNqs4prnok7P8xMVs3y18=mJcS9spovOPX8djRDfJKxJw@mail.gmail.com>
Subject: UBI bitflip maintenance
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am looking to add a maintenance activity to our product to detect
correctable NAND bitflips and process them appropriately before they
become errors.  In looking at the MTD and Linux mailing lists, there
was work done by Richard Weinberger on this feature in March and
November of 2015.  Was the work completed?

I have been using Richard's work to develop a method which seems to be
working, though testing is in progress.  I've added an ioctl to check
bitflips on an individual PEB index.  An application will periodically
call the ioctl for each of the PEBs in a partition.

The ioctl performs a read on the whole PEB and looks for correctable
or uncorrectable ECC conditions.  If there is a bitflip, the
ubi_wl_entry is retrieved from the ubi->lookuptbl at the PEB index.
Following Richard's work, the ubi_wl_entry is examined to determine
its state and how to repair it.

If there is no entry, the PEB, which is assumed to be corrupt or
otherwise bad, is erased so that on the next attach, it may become
valid.  If the PEB is in the free list, the PEB is removed from the
list, and an erase is scheduled.  Otherwise, the logic is similar to
that in ubi_wl_scrub_peb.  We do not use fastmap, so I haven't looked
at that case.

Some status will need to be passed back to the user application to
prevent it from repeatedly trying to repair entries which have truly
gone bad and can not be repaired.

Does this approach of using the PEB index alleviate some of the
concerns Richard noted regarding race conditions with nodes becoming
bad while work is being scheduled?  An erase may be scheduled, but
with the node no longer in the free list, it shouldn't be used by any
intermediate operation, right?

Thanks,
Jeff
