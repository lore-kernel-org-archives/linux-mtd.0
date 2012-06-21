Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpGr-0001km-5G
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:50:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/15] UBI: Fastmap: Add new self check
Date: Thu, 21 Jun 2012 23:50:06 +0200
Message-Id: <1340315408-27375-14-git-send-email-richard@nod.at>
In-Reply-To: <1340315408-27375-1-git-send-email-richard@nod.at>
References: <UBI fastmap updates>
 <1340315408-27375-1-git-send-email-richard@nod.at>
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

If fastmap is able to detect that it's missing PEBs
fall back to scanning mode and print a fat warning.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 76b0d2f..68be3d5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -461,6 +461,26 @@ out:
 	return ret;
 }
 
+static int self_check_fastmap(struct ubi_attach_info *ai)
+{
+	struct ubi_ainf_peb *aeb;
+	struct ubi_ainf_volume *av;
+	struct rb_node *rb1, *rb2;
+	int n = 0;
+
+	list_for_each_entry(aeb, &ai->erase, u.list)
+		n++;
+
+	list_for_each_entry(aeb, &ai->free, u.list)
+		n++;
+
+	 ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb)
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
+			n++;
+
+	return n;
+}
+
 /**
  * ubi_attach_fastmap - creates ubi_attach_info from a fastmap.
  * @ubi: UBI device object
@@ -978,6 +998,19 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto free_hdr;
 	}
 
+	/*
+	 * If fastmap is leaking PEBs (must not happen), raise a
+	 * fat warning and fall back to scanning mode.
+	 * We do this here because in ubi_wl_init() it's too late
+	 * and we cannot fall back to scanning.
+	 */
+	if (WARN_ON(self_check_fastmap(ai) != ubi->peb_count -
+		    ubi->bad_peb_count - used_blocks)) {
+		ret = UBI_BAD_FASTMAP;
+		kfree(fm);
+		goto free_hdr;
+	}
+
 	fm->size = fm_size;
 	fm->used_blocks = used_blocks;
 
-- 
1.7.6.5
