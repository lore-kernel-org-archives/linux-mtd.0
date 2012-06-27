Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjudC-0008RU-Op
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 15:58:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI fastmap updates
Date: Wed, 27 Jun 2012 17:57:40 +0200
Message-Id: <1340812676-14460-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the next round of UBI fastmap updates.
Most changes are coding style and kernel doc fixes.

The highlights are:
	- Fastmap stores now the pool size in it's anchor PEB
	  such that users can set custom pool sizes. (E.g using ubinize)

I've addressed all TODOs.
I did not remove this point from the TODO list:
"2. Implement power-cut emulation infrastructure similar to what is in UBIFS and
   test UBI + fastmap with it."

Artem, do we really need a new power-cut emulation infrastructure?
I did some tests using integck (integck -p -m 0 /mnt).
Nothing bad happened. :-)
Ff you disable writing the fastmap at detach time you can also simulate
a power cut. I did that very often. We written fastmap has to be valid at any time!
Also if a power cut happens while writing the fastmap it's CRC will be
bad and fastmap falls back to scanning mode.
So, I'm not 100% sure what fastmap specific power cut tests need to be done.

Another point:
UBI_FM_MAX_POOL_SIZE is currently 256.
A fastmap pool cannot be greater than this value.
Are we fine with this upper limit?

If you want to test fastmap you can use my git repo:
git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v14

Enjoy!
//richard

[PATCH 01/16] UBI: Fastmap: Check find_mean_wl_entry()'s return
[PATCH 02/16] UBI: Fastmap: Kernel doc updates
[PATCH 03/16] UBI: Fastmap: Fix license version
[PATCH 04/16] UBI: Fastmap: Rename self_check_fastmap()
[PATCH 05/16] UBI: Fastmap: Address a TODO
[PATCH 06/16] UBI: Fastmap: Address another TODO
[PATCH 07/16] UBI: Fastmap: Address jet another TOOD
[PATCH 08/16] UBI: Fastmap: Address another TOOD
[PATCH 09/16] UBI: Fastmap: Be more verbose on fastmap failure
[PATCH 10/16] UBI: Fastmap: More kernel doc updates
[PATCH 11/16] UBI: Fastmap: Store pool sizes in fastmap
[PATCH 12/16] UBI: Fastmap: Make checkpatch.pl happy
[PATCH 13/16] UBI: Fastmap: Remove one point from TODO list
[PATCH 14/16] UBI: Fastmap: Remove one point from TODO list
[PATCH 15/16] UBI: Fastmap: Remove one point from TODO list
[PATCH 16/16] UBI: Fastmap: Remove one point from TODO list
