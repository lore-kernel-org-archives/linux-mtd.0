Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel23-00076e-TN
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI Fastmap updates (v7++)
Date: Wed, 13 Jun 2012 12:41:57 +0200
Message-Id: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de, shmulik.ladkani@gmail.com,
 tim.bird@am.sony.com, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here are some updates for UBI Fastmap.

Beside of mostly minor changes it addresses also two major issues:

1. While creating the fastmap we have to see all PEBs, no PEB has to be in flight.
To ensure this fastmap calls ubi_wl_flush(). But after running more tests I encountered
the problem that sometimes PEBs are still missing. It turned out that  ubi_wl_flush() itself
can create new work which will be processed after ubi_wl_flush() returns.
To fix this I've changed wear_leveling_worker() such that it does not call schedule_erase()
and instead calls the erase worker direly.
Furthermore the erase worker has been changed to omit the call to ensure_wear_leveling(),
which produces again work.
With this changes ubi_wl_flush() really returns only if all work is done and fastmap sees als PEBs.
Artem, I know this is a sledgehammer solution. What do you prefer?

2. wear_leveling_worker() does not use ubi_wl_get_peb(),
therefore some changes are not visible to fastmap.
To address this issue a second small pool has been added.
It contains PEBs to be used by wear_leveling_worker().
For now this pool get refilled and checked by any call to ubi_wl_get_peb().
We cannot refill this pool upon it's empty.
This could trigger a call to ubi_update_fastmap().
As described above  ubi_update_fastmap() calls ubi_wl_flush()
which could call ubi_update_fastmap() again...

Later I'll release some test-scripts and patches to proof the correctness of fastmap.
The patches are mostly very hacky, 
I try to rewrite them in a sane manner such that we can add them into the fastmap code.
E.g. We could cal scan_all() after attaching from a fastmap to proof that fastmap reconstructs
the EBA table correctly.

Happy testing!
//richard

[PATCH 01/21] UBI: Fastmap: enhance find_early_wl_entry()
[PATCH 02/21] UBI: Fastmap: Add PEB leak detection
[PATCH 03/21] UBI: Fastmap: Remove useless code
[PATCH 04/21] UBI: Fastmap: Check for duplicated PEBs in add_aeb()
[PATCH 05/21] UBI: Fastmap: Rewrite scan_pool()
[PATCH 06/21] UBI: Fastmap: Ensure that new_fm->e[0]->ec is always
[PATCH 07/21] UBI: Fastmap: Prevent PEB leak
[PATCH 08/21] UBI: Fastmap: Add scrub support to add_aeb()
[PATCH 09/21] UBI: Fastmap: Make ubi_wl_get_fm_peb() return a
[PATCH 10/21] UBI: Fastmap: Detect whether a PEB has to be unmapped.
[PATCH 11/21] UBI: Fastmap: Adjust comment above ubi_wl_flush()
[PATCH 12/21] UBI: Fastmap: Handle unused "used" PEBs better
[PATCH 13/21] UBI: Fastmap: Introduce WL pool Signed-off-by: Richard
[PATCH 14/21] UBI: Fastmap: Erase PEBs synchronous in
[PATCH 15/21] UBI: Fastmap: Fix NULL-pointer bug
[PATCH 16/21] UBI: Fastmap: Fix loglevel
[PATCH 17/21] UBI: Fastmap: Relax EC self check
[PATCH 18/21] UBI: Fastmap: Store magic values in be32
[PATCH 19/21] UBI: Fastmap: Minor fixes
[PATCH 20/21] UBI: Fastmap: Torture fastmap PEBs that showed bit
[PATCH 21/21] UBI: Fastmap: make checkpatch.pl happy Signed-off-by:
