Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4688C71153
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMQOwp5VsoTx59uO3x+IPuwpmr2TDs47+tIx3Xi4mCU=; b=CGBYm5IvmLIlCq
	Fzv5YVKYbP9hikvXgGx/afvohvVBf67vDCQXhft7e4jFnC9vvmdPcMqPsB6ixSzLxyZlgEKo2OU8M
	57OdwDgRRU9IG2PjcV0nC9nghoVgoi95mQ9eb9xQeOjB/8a1SGxlemKrDR1UYufC1m1+1UXOQxTnq
	qQwcza1pWxpEW1sd2839P5iE6lXYSRESkb9k9y9lFf41+lZKsCdbtm7U0I3M8OasPYXCgTDMw5zro
	+vQN4UgORCm0a2zgdI19ZHJ/dez11qHugEMpJAOumiSBU85NKs9ujApOc/GsqxuMD+aicF/2fF/xB
	zVmghOsxXCf8UtpC4WhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0aG-00BmT9-33;
	Tue, 29 Aug 2023 15:24:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0aC-00BmSX-1g
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 15:24:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA54C626F1;
	Tue, 29 Aug 2023 15:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61F9C433C9;
	Tue, 29 Aug 2023 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693322683;
	bh=Exn2LZln7TVIpYAfmCkUGiUBtJ/Ig1A3tB21reF1oW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ADprn7JGDQ7MPkIqXzOmN55dCzErb0HTFAzZMFwZ31/NEcCjCimfhRFiEReLx3qLk
	 QM6DatKMUZc6sJH407T9cEwyoe1cyyE3CYfTIwrcQQTbJHjn0YaPggqZBnTtWjg9cI
	 DGA3KTwl7MROUd0ISVZ4BOe0Pi4bPYFqPuXTIqO1cwDxpnX6F5dP+E76fcm5i+r8rh
	 xoPIrE1VU9kHED4BMcY3sWdu/hK9dB7HFFnL7TNdEEdfaPIf8ZhHLnLXz+DNvO+XnP
	 gqGtS0AmumzHYinWFgooCTFOJlQto1zxhULiFX7g187qlTQV+oFDb7DO8rn02D6/a6
	 nUuzh/G+FcRRw==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 29 Aug 2023 17:23:57 +0200
Subject: [PATCH 2/2] mtd: key superblock by device number
MIME-Version: 1.0
Message-Id: <20230829-vfs-super-mtd-v1-2-fecb572e5df3@kernel.org>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
In-Reply-To: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, 
 Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=openpgp-sha256; l=2946; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Exn2LZln7TVIpYAfmCkUGiUBtJ/Ig1A3tB21reF1oW8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaS8490ao2Ile8w40+Q3+5bWI5Nfx17zNr1c9sZCzumQ45fY
 0zmLOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYiUcLwP5x5wvWjLP+U/4Uv+scw4+
 PJHIl0yfp3Gnd3dq4/+kA/YzIjwxSeex9jdm8zlpl++sScr0JrLyxbzfO04dGpwgcTJ756fo8HAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_082444_642383_1831F5F1 
X-CRM114-Status: GOOD (  21.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mtd driver has similar problems than the one that was fixed in
commit dc3216b14160 ("super: ensure valid info").

The kill_mtd_super() helper calls shuts the superblock down but leaves
the superblock on fs_supers as the devices are still in use but puts the
mtd device and cleans out the superblock's s_mtd field.

This means another mounter can find the superblock on the list accessing
its s_mtd field while it is curently in the process of being freed or
already freed.

Prevent that from happening by keying superblock by dev_t just as we do
in the generic code.

Link: https://lore.kernel.org/linux-fsdevel/20230829-weitab-lauwarm-49c40fc85863@brauner
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 drivers/mtd/mtdsuper.c | 45 +++++++++++----------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 5ff001140ef4..b7e3763c47f0 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -19,38 +19,6 @@
 #include <linux/fs_context.h>
 #include "mtdcore.h"
 
-/*
- * compare superblocks to see if they're equivalent
- * - they are if the underlying MTD device is the same
- */
-static int mtd_test_super(struct super_block *sb, struct fs_context *fc)
-{
-	struct mtd_info *mtd = fc->sget_key;
-
-	if (sb->s_mtd == fc->sget_key) {
-		pr_debug("MTDSB: Match on device %d (\"%s\")\n",
-			 mtd->index, mtd->name);
-		return 1;
-	}
-
-	pr_debug("MTDSB: No match, device %d (\"%s\"), device %d (\"%s\")\n",
-		 sb->s_mtd->index, sb->s_mtd->name, mtd->index, mtd->name);
-	return 0;
-}
-
-/*
- * mark the superblock by the MTD device it is using
- * - set the device number to be the correct MTD block device for pesuperstence
- *   of NFS exports
- */
-static int mtd_set_super(struct super_block *sb, struct fs_context *fc)
-{
-	sb->s_mtd = fc->sget_key;
-	sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, sb->s_mtd->index);
-	sb->s_bdi = bdi_get(mtd_bdi);
-	return 0;
-}
-
 /*
  * get a superblock on an MTD-backed filesystem
  */
@@ -62,8 +30,7 @@ static int mtd_get_sb(struct fs_context *fc,
 	struct super_block *sb;
 	int ret;
 
-	fc->sget_key = mtd;
-	sb = sget_fc(fc, mtd_test_super, mtd_set_super);
+	sb = sget_dev(fc, MKDEV(MTD_BLOCK_MAJOR, mtd->index));
 	if (IS_ERR(sb))
 		return PTR_ERR(sb);
 
@@ -77,6 +44,16 @@ static int mtd_get_sb(struct fs_context *fc,
 		pr_debug("MTDSB: New superblock for device %d (\"%s\")\n",
 			 mtd->index, mtd->name);
 
+		/*
+		 * Would usually have been set with @sb_lock held but in
+		 * contrast to sb->s_bdev that's checked with only
+		 * @sb_lock held, nothing checks sb->s_mtd without also
+		 * holding sb->s_umount and we're holding sb->s_umount
+		 * here.
+		 */
+		sb->s_mtd = mtd;
+		sb->s_bdi = bdi_get(mtd_bdi);
+
 		ret = fill_super(sb, fc);
 		if (ret < 0)
 			goto error_sb;

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
