Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skcu9-0006Qt-Cv
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: UBI fastmap updates
Date: Fri, 29 Jun 2012 17:14:18 +0200
Message-Id: <1340982869-77042-1-git-send-email-richard@nod.at>
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

Fastmap is now disabled by default.
If you attach an image it will not automatically convert it
to the fastmap format.
UBI has a new module parameter "fm_auto".
If set to 1 UBI will create a fastmap automatically on your
flash device.
Please see commit "Add a module parameter to enable fastmap"
for more details.

If you want to test fastmap you can use my git repo:
git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v15

Enjoy!
//richard

[PATCH 01/11] UBI: Fastmap: Fix mem leak in error path
[PATCH 02/11] UBI: Fastmap: Amend self_check_eba()
[PATCH 03/11] UBI: Fastmap: Remove forward declaration
[PATCH 04/11] UBI: Fastmap: Move fastmap specific code into
[PATCH 05/11] UBI: Fastmap: Kill TODO
[PATCH 06/11] UBI: Fastmap: Remove unused variable
[PATCH 07/11] UBI: Fastmap: Fix scan regression
[PATCH 08/11] ubi: fastmap: Remove 'ubi' parameter of 'destroy_ai()'
[PATCH 09/11] ubi: fastmap: Do not free 'ai' in 'scan_all()'
[PATCH 10/11] UBI: Fastmap: Disable fastmap per default
[PATCH 11/11] UBI: Fastmap: Add a module parameter to enable fastmap
