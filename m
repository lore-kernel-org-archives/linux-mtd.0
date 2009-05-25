Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8U18-00056p-Cd
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 06:50:57 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS: Add an error code if the compr is not present
Date: Mon, 25 May 2009 08:49:10 +0200
Message-Id: <1243234150-29786-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the compressor is not present, mount_ubifs need
to return an error code. This way ubifs_fill_super
will stop and handle the error.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 fs/ubifs/super.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 832b1a7..9a589d8 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1187,6 +1187,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (!ubifs_compr_present(c->default_compr)) {
 		ubifs_err("'compressor \"%s\" is not compiled in",
 			  ubifs_compr_name(c->default_compr));
+		err = -ENOTSUPP;
 		goto out_free;
 	}
 
-- 
1.6.3.1
