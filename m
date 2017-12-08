Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNPvq-0001Vd-5V
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 21:11:44 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/2] mtd: onenand: samsung: Simplify code and fix leaks in
 error handling paths
Date: Fri,  8 Dec 2017 22:11:03 +0100
Message-Id: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first patch converts 's3c_onenand_probe()' to devm_ functions.
This fixes a leak in one path (line 872).
This also free_irq which was not handled at all. (I hope I'm correct :) )

The 2nd patch is about an un-handled error code which looks spurious.
Not sure if I'm right.


While compile-testing it, I had to tweak the code because I don't have any
cross-compiler.
I commented the line "#include <asm/mach/flash.h>" and the compilation
succeeded. So maybe, this include is also useless.
I've left it as-is, though.


Theses patches have been compile-tested-only.


Christophe JAILLET (2):
  mtd: onenand: samsung: use devm_ function to simplify code and fix
    some leaks
  mtd: onenand: samsung: return an error if
    'mtd_device_parse_register()' fails

 drivers/mtd/onenand/samsung.c | 145 ++++++++++++++----------------------------
 1 file changed, 47 insertions(+), 98 deletions(-)

-- 
2.14.1
