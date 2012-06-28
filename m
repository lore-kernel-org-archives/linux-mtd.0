Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkFyk-0008Oe-G9
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 14:45:55 +0000
Received: by wgbds1 with SMTP id ds1so185486wgb.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 07:45:52 -0700 (PDT)
Date: Thu, 28 Jun 2012 17:45:46 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: fastmap: Do not free 'ai' in 'scan_all()'
Message-ID: <20120628174546.491954e2@pixies.home.jungo.com>
In-Reply-To: <20120628165239.52cffc64@pixies.home.jungo.com>
References: <20120628165239.52cffc64@pixies.home.jungo.com>
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

Do not call 'destroy_ai(ai)' at error handling of 'scan_all', since:
- 'ai' is allocated in 'ubi_attach' (the caller of scan_all) and
  provided as an argument. It's not scan_all's responsibility to free it
- It is not consistent with scan_all's sister function
  'ubi_attach_fastmap()' which does not free the given 'ai'
- It will cause a double free as 'ubi_attach' (the caller of scan_all)
  already destroys 'ai' in case of an error

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
- compile tested

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 019fbd3..8a339e4 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1152,11 +1152,11 @@ static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai)
 					       sizeof(struct ubi_ainf_peb),
 					       0, 0, NULL);
 	if (!ai->aeb_slab_cache)
-		goto out_ai;
+		return -ENOMEM;
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
-		goto out_ai;
+		return -ENOMEM;
 
 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vidh)
@@ -1218,8 +1218,6 @@ out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
 out_ech:
 	kfree(ech);
-out_ai:
-	destroy_ai(ai);
 	return err;
 }
 
