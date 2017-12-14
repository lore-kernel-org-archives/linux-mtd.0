Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePMhw-0000xr-WA
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 06:09:28 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4 v3] mtd: onenand: samsung: Simplify code and fix leaks in
 error handling paths
Date: Thu, 14 Dec 2017 07:03:48 +0100
Message-Id: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
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
This also free_irq which was not handled at all. ( I hope I'm correct :) )

The 2nd patch is about an un-handled error code which looks spurious.
Not sure if I'm right.

The 3rd patch propagates an error code instead of returning a hard-coded
value.

The last one removes a useless include spotted while compile-testing.


v3: patch 1/4 updated to fix a bug introduced in v2
    patch 2/4 unchanged
    patch 3/4 and 4/4 added
    now the patch are cross-compile tested :)

Theses patches have been cross compile-tested-only.

Christophe JAILLET (4):
  mtd: onenand: samsung: use devm_ function to simplify
    code and fix some leaks
  mtd: onenand: samsung: return an error if 
    'mtd_device_parse_register()' fails
  mtd: onenand: samsung: Propagate the error returned
    by 'onenand_scan()'
  mtd: onenand: samsung: Remove a useless include

 drivers/mtd/onenand/samsung.c | 172 +++++++++---------------------------------
 1 file changed, 35 insertions(+), 137 deletions(-)

-- 
2.14.1
