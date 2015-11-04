Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0lU-00016q-KL
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:18:25 +0000
Received: by qgad10 with SMTP id d10so44083432qga.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 08:18:03 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/6] pxa3xx_nand: Assorted changes
Date: Wed,  4 Nov 2015 13:13:40 -0300
Message-Id: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series contains a number of fixes and cleanups.
As described below, this series doesn't seem to fix any
currently known regression. IMO, there's no need to pick
any of this for v4.4-rc.

The first patch fixes a timeout found when issuing a CMD_PARAM,
without using the keep-config option. This timeout happens
only on NFCv2 (i.e. Armada 370/375/XP) with the keep-config option.

Since all the Armada 370/375/XP boards currently specify
keep-config, no user should be affected by the timeout.

The second patch is a fix for some leftovers issues from the
recent cleanup series by Antoine. Altough the patch can be
considered a fix, I'm not aware of any regression so I can't
argue it should be queued as a fix.

The rest of the patches are either cleanups or improvements.

Patch 3 simplifies the code around keep-config and removes
a silly goto.

Patch 4 removes the open-coded NAND chip sensing.

Patch 5 removes an unused macro.

Path 6 uses enable/disable clk to save power in resume/suspend
paths.

Thanks,

Ezequiel Garcia (6):
  mtd: pxa3xx_nand: Increase the initial chunk size
  mtd: pxa3xx_nand: Fix initial controller configuration
  mtd: pxa3xx_nand: Simplify pxa3xx_nand_scan
  mtd: pxa3xx_nand: Remove redundant NAND sensing
  mtd: pxa3xx_nand: Remove dead code
  mtd: pxa3xx_nand: Gate/ungate the NAND clock in suspend/resume paths

 drivers/mtd/nand/pxa3xx_nand.c | 101 +++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 59 deletions(-)

-- 
2.5.2
