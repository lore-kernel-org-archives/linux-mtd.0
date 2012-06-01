Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb0-0001g7-Sz
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:00 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI: Fastmap updates (v7+)
Date: Fri,  1 Jun 2012 17:16:21 +0200
Message-Id: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches apply on Artems fastmap tree.
git://git.infradead.org/linux-ubi.git#fastmap

[PATCH 01/23] UBI: Fastmap: Fix EC overflow calculation
[PATCH 02/23] UBI: Fastmap: Introduce fm_mutex
[PATCH 03/23] UBI: Fastmap: Fix find_fastmap() logic.
[PATCH 04/23] UBI: Fastmap: Write a fastmap also at detaching
[PATCH 05/23] UBI: Fastmap: Fix memory corruption
[PATCH 06/23] UBI: Fastmap: Serialize ubi_wl_get_peb()
[PATCH 07/23] UBI: Fastmap: Simplify ubi_wl_put_fm_peb() logic
[PATCH 08/23] UBI: Fastmap: make ubi_is_fm_block() static
[PATCH 09/23] UBI: Fastmap: Remove ubi->old_fm logic
[PATCH 10/23] UBI: Fastmap: Allocate and free ubi_attach_info in
[PATCH 11/23] UBI: Fastmap: Fix messages
[PATCH 12/23] ubi: fastmap: harmonize medium erase-counter seek
[PATCH 13/23] UBI: Fastmap: Add comments to fastmap paremters
[PATCH 14/23] UBI: Fastmap: Rename fastmap attributes
[PATCH 15/23] UBI: Fastmap: Use reserved_pebs
[PATCH 16/23] UBI: Fastmap: Store bad_peb_count in fastmap
[PATCH 17/23] UBI: Fastmap: Add ubi_assert()
[PATCH 18/23] UBI: Fastmap: Handle bitflipps correctly
[PATCH 19/23] UBI: Fastmap: Handle protection queue correctly
[PATCH 20/23] UBI: Fastmap: Write fastmap only at detach time if
[PATCH 21/23] UBI: Fastmap: Fix error message
[PATCH 22/23] UBI: Fastmap: Address one of Artems TODOs
[PATCH 23/23] UBI: Fastmap: Make checkpatch.pl happy (again)

All patches have been tested with ubi-tests.

TODO:
- Add a function to UBI which produces a free PEB to be used as
  fastmap super block.

Thanks,
//richard
