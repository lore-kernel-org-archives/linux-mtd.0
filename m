Received: from na3sys009aog110.obsmtp.com ([74.125.149.203])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRmnd-0005P2-2y
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 14:53:33 +0000
Received: by qyk27 with SMTP id 27so3681463qyk.6
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 07:53:30 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: fixup merged 'UBIFS: fix-up free space earlier'
Date: Wed,  1 Jun 2011 10:53:28 -0400
Message-Id: <1306940008-28454-1-git-send-email-bengardiner@nanometrics.ca>
In-Reply-To: <1306923407.4405.94.camel@localhost>
References: <1306923407.4405.94.camel@localhost>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the patch 'UBIFS: intialize LPT earlier' was massaged before being applied
the context of the next patch 'UBIFS: fix-up free space earlier' was muddled
sufficiently for the order of allocate-lpt then free-space-fixup was reversed --
I think.

Put the free-space-fixup after allocate-lpt.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---
With this fixup applied on-top-of the ubifs-2.6 master I am able to mount a
ubinized image containing a UBIFS volume which has the free-space-fixup flag
set. No assertions are displayed.

---
 fs/ubifs/super.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4722f31..70e8c92 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1284,12 +1284,6 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	init_constants_master(c);
 
-	if (!c->ro_mount && c->space_fixup) {
-		err = ubifs_fixup_free_space(c);
-		if (err)
-			goto out_infos;
-	}
-
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
@@ -1305,6 +1299,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_master;
 
+	if (!c->ro_mount && c->space_fixup) {
+		err = ubifs_fixup_free_space(c);
+		if (err)
+			goto out_master;
+	}
+
 	if (!c->ro_mount) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
-- 
1.7.4.1
