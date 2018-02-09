Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ekHAI-0006JG-Su
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 22:29:08 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, Stefan Agner <stefan@agner.ch>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH v4 0/3] mtd: nand: vf610: fix error handling in
 vf610_nfc_probe()
Date: Sat, 10 Feb 2018 01:28:33 +0300
Message-Id: <1518215316-21504-1-git-send-email-khoroshilov@ispras.ru>
In-Reply-To: <20180130141141.7f4fd15a@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

vf610_nfc_probe() misses error handling of mtd_device_register()
and contains unneeded of_node_put() on error path.

v2: Add nand_cleanup() to undone nand_scan_tail() as Boris Brezillon noted.
v3: Rename error labels, remove of_node_put() per Boris Brezillon request.
v4: Separate fix in to 3 patches.

Alexey Khoroshilov (3):
  mtd: nand: vf610: remove the unnecessary of_node_put()
  mtd: nand: vf610: improve readability of error label
  mtd: nand: vf610: check mtd_device_register() return code

 drivers/mtd/nand/vf610_nfc.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

-- 
2.7.4
