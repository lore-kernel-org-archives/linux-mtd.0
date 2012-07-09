Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoCvg-0003qF-Vd
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 12:19:09 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI fastmap updates
Date: Mon,  9 Jul 2012 14:18:36 +0200
Message-Id: <1341836323-43916-1-git-send-email-richard@nod.at>
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
It fixes all issues pointed out by Shmulik. :-)

If you want to test fastmap you can use my git repo:
git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v17

Enjoy!
//richard

[PATCH 1/7] UBI: Fastmap: Fix lock imbalance in case of an error
[PATCH 2/7] UBI: Fastmap: Get rid of find_fastmap switch
[PATCH 3/7] UBI: Fastmap: Fix memory leak in error path
[PATCH 4/7] UBI: Fastmap: Fix double free in error path
[PATCH 5/7] UBI: Fastmap: Kerneldoc fixes
[PATCH 6/7] UBI: Fastmap: Make sure that find_wl_entry() never
[PATCH 7/7] UBI: Fastmap: Make checkpatch.pl happy
