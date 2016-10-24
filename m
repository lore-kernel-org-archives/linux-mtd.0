Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byeTm-0003bf-1W
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 12:35:53 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] MAINTAINERS: add more people to the MTD maintainer team
Date: Mon, 24 Oct 2016 14:35:26 +0200
Message-Id: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian has been maintaining the MTD subsystem alone for several years
now, and maintaining such a subsystem can really be time consuming.

Create a maintainer team formed of the most active MTD contributors
to help Brian with this task, which will hopefully improve the
subsystem reactivity.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Hi all,

I'm just trying to summarize what I understood the process would be,
don't hesitate to correct me if I'm wrong.

For each release we will assign a specific MTD maintainer which will be
responsible for taking MTD core patches and pulling spi-nor and nand PRs
into the MTD tree and eventually send one or several PRs to Linus.

For fixes that are submitted after -rc1, I usually ask Brian to apply
them directly into the MTD tree (I don't think there's a real need to
prepare spi-nor and nand PRs for fixes), so we can proceed the same
way: ask the maintainer assigned to this release to also take care of
applying fixes and sending PRs to Linus before each -rc.

If you have other ideas, or would like to proceed differently, don't
hesitate propose them.

Thanks,

Boris
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cd38a7e0064..cbf9583fdbe7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7912,6 +7912,10 @@ F:	mm/
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	David Woodhouse <dwmw2@infradead.org>
 M:	Brian Norris <computersforpeace@gmail.com>
+M:	Boris Brezillon <boris.brezillon@free-electrons.com>
+M:	Marek Vasut <marek.vasut@gmail.com>
+M:	Richard Weinberger <richard@nod.at>
+M:	Cyrille Pitchen <cyrille.pitchen@atmel.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-- 
2.7.4
