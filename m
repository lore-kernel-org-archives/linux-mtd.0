Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRiOT-0002MK-2j
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 10:11:18 +0000
Received: by ewy3 with SMTP id 3so2154931ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 03:11:14 -0700 (PDT)
Subject: Re: [PATCH 2/3] UBIFS: intialize the LPT earlier
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <e0fb2d40ab7314049654d85b86a4c27e9a1801ef.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
	<e0fb2d40ab7314049654d85b86a4c27e9a1801ef.1306780983.git.bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 13:06:50 +0300
Message-ID: <1306922810.4405.91.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Matthew
	L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for the patch, however

On Mon, 2011-05-30 at 14:56 -0400, Ben Gardiner wrote: 
> +	err = ubifs_lpt_init(c, 1, !c->ro_mount);
> +	if (err)
> +		goto out_lpt;

You cannot call ubifs_lpt_init()

> +
>  	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
>  		ubifs_msg("recovery needed");
>  		c->need_recovery = 1;
>  		if (!c->ro_mount) {
>  			err = ubifs_recover_inl_heads(c, c->sbuf);

Before ubifs_recover_inl_heads() is called in case of dirty FS.

I've massaged your patch and pushed the following analogous patch to the
ubifs tree, please check/test:



>From 678ef9ad3daa453723f04f84f9db6a22994e7343 Mon Sep 17 00:00:00 2001
From: Ben Gardiner <bengardiner@nanometrics.ca>
Date: Mon, 30 May 2011 14:56:15 -0400
Subject: [PATCH] UBIFS: intialize LPT earlier

The current 'mount_ubifs()' implementation does not initialize the LPT until the
the master node is marked dirty. Move the LPT initialization to before marking
the master node dirty. This is a preparation for the next patch which will move
the free-space-fixup check to before marking the master node dirty, because we
have to fix-up the free space before doing any writes.

Artem: massaged the patch and commit message.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   29 ++++++++++++++++-------------
 1 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1e40db7..6d357fd 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1282,17 +1282,24 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_master;
 
-	init_constants_master(c);
-
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
-		if (!c->ro_mount) {
-			err = ubifs_recover_inl_heads(c, c->sbuf);
-			if (err)
-				goto out_master;
-		}
-	} else if (!c->ro_mount) {
+	}
+
+	init_constants_master(c);
+
+	if (c->need_recovery && !c->ro_mount) {
+		err = ubifs_recover_inl_heads(c, c->sbuf);
+		if (err)
+			goto out_master;
+	}
+
+	err = ubifs_lpt_init(c, 1, !c->ro_mount);
+	if (err)
+		goto out_master;
+
+	if (!c->ro_mount) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
 		 * will notice this immediately on the next mount.
@@ -1300,13 +1307,9 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_DIRTY);
 		err = ubifs_write_master(c);
 		if (err)
-			goto out_master;
+			goto out_lpt;
 	}
 
-	err = ubifs_lpt_init(c, 1, !c->ro_mount);
-	if (err)
-		goto out_lpt;
-
 	err = dbg_check_idx_size(c, c->bi.old_idx_sz);
 	if (err)
 		goto out_lpt;
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
