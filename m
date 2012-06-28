Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkF9U-0001jt-0W
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 13:52:56 +0000
Received: by bkwj4 with SMTP id j4so2160730bkw.36
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 06:52:53 -0700 (PDT)
Date: Thu, 28 Jun 2012 16:52:39 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: fastmap: Remove 'ubi' parameter of 'destroy_ai()'
Message-ID: <20120628165239.52cffc64@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: nyoushchenko@mvista.com,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

The 'ubi' argument of 'destroy_ai' was added during fastmap development,
but it is no longer used.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
Applies to linux-ubi.git fastmap

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 3d9be42..019fbd3 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -97,7 +97,7 @@
  * it that way, or re-structure all the code. :-)
  */
 static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
-static void destroy_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
+static void destroy_ai(struct ubi_attach_info *ai);
 
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
@@ -1219,7 +1219,7 @@ out_vidh:
 out_ech:
 	kfree(ech);
 out_ai:
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return err;
 }
 
@@ -1280,7 +1280,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		 */
 		err = ubi_scan_fastmap(ubi, ai);
 		if (err > 0) {
-			destroy_ai(ubi, ai);
+			destroy_ai(ai);
 			ai = alloc_ai();
 			if (!ai)
 				return -ENOMEM;
@@ -1334,10 +1334,10 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		}
 
 		self_check_eba(ubi, ai, scan_ai);
-		destroy_ai(ubi, scan_ai);
+		destroy_ai(scan_ai);
 	}
 
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return 0;
 
 out_wl:
@@ -1346,7 +1346,7 @@ out_vtbl:
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 out_ai:
-	destroy_ai(ubi, ai);
+	destroy_ai(ai);
 	return err;
 }
 
@@ -1385,10 +1385,9 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 
 /**
  * destroy_ai - destroy attaching information.
- * @ubi: UBI device object
  * @ai: attaching information
  */
-static void destroy_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
+static void destroy_ai(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
 	struct ubi_ainf_volume *av;
