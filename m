Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjudL-00005s-4Z
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 15:58:30 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/16] UBI: Fastmap: Remove one point from TODO list
Date: Wed, 27 Jun 2012 17:57:56 +0200
Message-Id: <1340812676-14460-17-git-send-email-richard@nod.at>
In-Reply-To: <1340812676-14460-1-git-send-email-richard@nod.at>
References: <1340812676-14460-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

BE/LE has been tested using qemu-ppc and an x86 box.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 TODO |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/TODO b/TODO
index 267b8d3..12a019a 100644
--- a/TODO
+++ b/TODO
@@ -6,5 +6,3 @@ to the ubi-utils.git repository, to a separate branch at the beginning
 
 2. Implement power-cut emulation infrastructure similar to what is in UBIFS and
    test UBI + fastmap with it.
-5. Test that the same UBI image works fine on both LE and BE machines. I guess
-   we can do this using sime kind of emulators?
-- 
1.7.6.5
