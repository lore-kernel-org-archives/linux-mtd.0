Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqEXM-0002D4-Av
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 06:44:29 +0000
Date: Wed, 13 Apr 2016 09:41:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Pervushin <dpervushin@embeddedalley.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [patch] UBI: clean up return in ubi_remove_volume()
Message-ID: <20160413064126.GC8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My static checker says that "err" can be uninitialized if
"vol->reserved_pebs" is <= 0.  I don't think that can happen but
returning a literal is cleaner anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 1ae17bb..10059df 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -405,7 +405,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	if (!no_vtbl)
 		self_check_volumes(ubi);
 
-	return err;
+	return 0;
 
 out_err:
 	ubi_err(ubi, "cannot remove volume %d, error %d", vol_id, err);
