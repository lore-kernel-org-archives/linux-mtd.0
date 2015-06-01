Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzWzT-00087d-BV
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 21:11:27 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH 2/6] mtd: nandsim: Fix kasprintf() usage
Date: Mon,  1 Jun 2015 23:10:50 +0200
Message-Id: <1433193054-26865-3-git-send-email-richard@nod.at>
In-Reply-To: <1433193054-26865-1-git-send-email-richard@nod.at>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, maximlevitsky@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kasprintf() used in get_partition_name() does a dynamic
memory allocation and can fail. We have to handle that case.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index f232427..52c0c1a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -743,6 +743,11 @@ static int init_nandsim(struct mtd_info *mtd)
 			goto error;
 		}
 		ns->partitions[i].name   = get_partition_name(i);
+		if (!ns->partitions[i].name) {
+			NS_ERR("unable to allocate memory.\n");
+			ret = -ENOMEM;
+			goto error;
+		}
 		ns->partitions[i].offset = next_offset;
 		ns->partitions[i].size   = part_sz;
 		next_offset += ns->partitions[i].size;
@@ -756,6 +761,11 @@ static int init_nandsim(struct mtd_info *mtd)
 			goto error;
 		}
 		ns->partitions[i].name   = get_partition_name(i);
+		if (!ns->partitions[i].name) {
+			NS_ERR("unable to allocate memory.\n");
+			ret = -ENOMEM;
+			goto error;
+		}
 		ns->partitions[i].offset = next_offset;
 		ns->partitions[i].size   = remains;
 		ns->nbparts += 1;
-- 
1.8.4.5
