Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiQ05-0001Bw-Hn
 for linux-mtd@lists.infradead.org; Sat, 23 Jun 2012 13:03:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI fastmap updates 
Date: Sat, 23 Jun 2012 15:03:15 +0200
Message-Id: <1340456602-46050-1-git-send-email-richard@nod.at>
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

The highlights are:
	- Fastmap produces anchor PEBs if none are available
	  (creating a fastmap on an image created by ubinize works now)
	- Fastmap is now able to reuse all PEBs if no empty PEBs are available
	- Minor fixes

If you want to test fastmap you can use my git repo:
git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v13

Enjoy!
//richard

[PATCH 1/7] UBI: Fastmap: Modify the WL sub-system to prodcue a free
[PATCH 2/7] UBI: Fastmap: Fix WARN_ON()
[PATCH 3/7] UBI: Fastmap: Ensure that not all anchor PEBs go into a
[PATCH 4/7] UBI: Fastmap: Fix ubi_assert()
[PATCH 5/7] UBI: Fastmap: Kill max_pnum logic
[PATCH 6/7] UBI: Fastmap: Reuse all fastmap PEB if no free PEBs are
[PATCH 7/7] UBI: Fastmap: Get rid of fm_pool_mutex
