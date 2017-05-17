Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAuSi-0007Kw-Sn
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 08:37:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 6/6] ubifs: Remove dead code from ubifs_get_link()
Date: Wed, 17 May 2017 10:36:49 +0200
Message-Id: <20170517083649.25135-6-richard@nod.at>
In-Reply-To: <20170517083649.25135-1-richard@nod.at>
References: <20170517083649.25135-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We check the length already, no need to check later
again for an empty string.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 2cda3d67e2d0..ccb7a1279fd5 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1698,12 +1698,6 @@ static const char *ubifs_get_link(struct dentry *dentry,
 
 	pstr.name[pstr.len] = '\0';
 
-	// XXX this probably won't happen anymore...
-	if (pstr.name[0] == '\0') {
-		fscrypt_fname_free_buffer(&pstr);
-		return ERR_PTR(-ENOENT);
-	}
-
 	set_delayed_call(done, kfree_link, pstr.name);
 	return pstr.name;
 }
-- 
2.12.0
