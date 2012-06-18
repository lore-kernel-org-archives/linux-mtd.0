Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgefw-0000eh-6M
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/22] UBI: Fastmap: Remove more useless new lines
Date: Mon, 18 Jun 2012 18:18:53 +0200
Message-Id: <1340036345-96726-11-git-send-email-richard@nod.at>
In-Reply-To: <1340036345-96726-1-git-send-email-richard@nod.at>
References: <1340036345-96726-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, shmulik.ladkani@gmail.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index caefcb3..8aa43e8 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1272,7 +1272,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 			if (!ec_hdr) {
 				ret = -ENOMEM;
-
 				goto err;
 			}
 
@@ -1282,7 +1281,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			if (ret && ret != UBI_IO_BITFLIPS) {
 				ubi_err("unable to read EC header");
 				kfree(ec_hdr);
-
 				goto err;
 			}
 
@@ -1291,7 +1289,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			if (ret < 0) {
 				ubi_err("unable to erase old SB");
 				kfree(ec_hdr);
-
 				goto err;
 			}
 
@@ -1301,7 +1298,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				ubi_err("erase counter overflow!");
 				kfree(ec_hdr);
 				ret = -EINVAL;
-
 				goto err;
 			}
 
@@ -1311,7 +1307,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			kfree(ec_hdr);
 			if (ret) {
 				ubi_err("unable to write new EC header");
-
 				goto err;
 			}
 
@@ -1334,7 +1329,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		if (!tmp_e) {
 			ubi_err("could not find an early PEB");
 			ret = -ENOSPC;
-
 			goto err;
 		}
 
@@ -1345,7 +1339,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
 		ubi_err("fastmap too large");
 		ret = -ENOSPC;
-
 		goto err;
 	}
 
@@ -1365,7 +1358,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				kfree(new_fm->e[i]);
 			}
 			ret = -ENOSPC;
-
 			goto err;
 		}
 
-- 
1.7.6.5
