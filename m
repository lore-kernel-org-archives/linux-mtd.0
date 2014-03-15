Received: from ppp118-210-37-193.lns20.adl2.internode.on.net ([118.210.37.193]
 helo=audi.shelbyville.oz)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOsYU-0000Ok-Au
 for linux-mtd@lists.infradead.org; Sat, 15 Mar 2014 17:39:31 +0000
From: Ron <ron@debian.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Fix index regression in nand_read_subpage
Date: Sun, 16 Mar 2014 04:01:06 +1030
Message-Id: <1394904668-22978-1-git-send-email-ron@debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I stumbled across this while reviewing changes to the code by eye,
and I'm a bit surprised that it seems to have gone unnoticed so far
but unless I'm missing something obvious, the "clean up" changes in
7351d3a5dbf4 really did alter the previous behaviour, which I think
was correct (or if it wasn't then I'm surprised _it_ went unnoticed
for as long as it did!).

I haven't actually been bitten by it myself either way (I'm currently
bashing on issues in u-boot, and spotted this while comparing it with
the latest kernel code), but I figured I'd pass it along for review.

Patch is against Linus' master a4ecdf82f8ea49f7d3a07.

  Cheers,
  Ron
