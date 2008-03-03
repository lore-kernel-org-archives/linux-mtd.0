Received: from smtp4.pp.htv.fi ([213.243.153.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWF6Q-0002UI-A1
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 18:09:31 +0000
Date: Mon, 3 Mar 2008 20:07:52 +0200
From: Adrian Bunk <bunk@kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [2.6 patch] mtd/ubi/vtbl.c: fix memory leak
Message-ID: <20080303180752.GK26072@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes a memory leak introduced by commit 
4ccf8cffa963c7b5bdc6d455ea9417084ee49aa8 and spotted by the Coverity 
checker.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/mtd/ubi/vtbl.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-2.6/drivers/mtd/ubi/vtbl.c.orig	2008-03-02 14:06:25.000000000 +0200
+++ linux-2.6/drivers/mtd/ubi/vtbl.c	2008-03-02 14:15:54.000000000 +0200
@@ -502,40 +502,41 @@ static int init_volumes(struct ubi_devic
 		vol = kzalloc(sizeof(struct ubi_volume), GFP_KERNEL);
 		if (!vol)
 			return -ENOMEM;
 
 		vol->reserved_pebs = be32_to_cpu(vtbl[i].reserved_pebs);
 		vol->alignment = be32_to_cpu(vtbl[i].alignment);
 		vol->data_pad = be32_to_cpu(vtbl[i].data_pad);
 		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
 					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
 		vol->name_len = be16_to_cpu(vtbl[i].name_len);
 		vol->usable_leb_size = ubi->leb_size - vol->data_pad;
 		memcpy(vol->name, vtbl[i].name, vol->name_len);
 		vol->name[vol->name_len] = '\0';
 		vol->vol_id = i;
 
 		if (vtbl[i].flags & UBI_VTBL_AUTORESIZE_FLG) {
 			/* Auto re-size flag may be set only for one volume */
 			if (ubi->autoresize_vol_id != -1) {
 				ubi_err("more then one auto-resize volume (%d "
 					"and %d)", ubi->autoresize_vol_id, i);
+				kfree(vol);
 				return -EINVAL;
 			}
 
 			ubi->autoresize_vol_id = i;
 		}
 
 		ubi_assert(!ubi->volumes[i]);
 		ubi->volumes[i] = vol;
 		ubi->vol_count += 1;
 		vol->ubi = ubi;
 		reserved_pebs += vol->reserved_pebs;
 
 		/*
 		 * In case of dynamic volume UBI knows nothing about how many
 		 * data is stored there. So assume the whole volume is used.
 		 */
 		if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 			vol->used_ebs = vol->reserved_pebs;
 			vol->last_eb_bytes = vol->usable_leb_size;
 			vol->used_bytes =
