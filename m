Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9JkL-0002lS-4s
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 15:41:34 +0000
Subject: [PATCH 3/4] mtd: cfi_cmdset_0002: use 0x50 erase command for SST
	39VFxxxxB chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 22 Oct 2010 17:40:25 +0200
Message-ID: <20101022154025.11097.94378.stgit@dev.siriade.com>
In-Reply-To: <20101022154015.11097.94660.stgit@dev.siriade.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: fggs@terra.com.br, zhangyd6@gmail.com, w.sang@pengutronix.de,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 209928b..a359967 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -292,6 +292,8 @@ static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
 
 	cfi->addr_unlock1 = 0x555;
 	cfi->addr_unlock2 = 0x2AA;
+
+	sector_erase_cmd = CMD(0x50);
 }
 
 static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
