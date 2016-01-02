Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aFUQ9-0001on-Hl
 for linux-mtd@lists.infradead.org; Sat, 02 Jan 2016 22:13:10 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Cc: adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Use XATTR_*_PREFIX_LEN
Date: Sat,  2 Jan 2016 23:12:42 +0100
Message-Id: <1451772762-2360-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...instead of open coding it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index e8b01b7..e53292d 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -267,7 +267,7 @@ static int check_namespace(const struct qstr *nm)
 
 	if (!strncmp(nm->name, XATTR_TRUSTED_PREFIX,
 		     XATTR_TRUSTED_PREFIX_LEN)) {
-		if (nm->name[sizeof(XATTR_TRUSTED_PREFIX) - 1] == '\0')
+		if (nm->name[XATTR_TRUSTED_PREFIX_LEN] == '\0')
 			return -EINVAL;
 		type = TRUSTED_XATTR;
 	} else if (!strncmp(nm->name, XATTR_USER_PREFIX,
@@ -277,7 +277,7 @@ static int check_namespace(const struct qstr *nm)
 		type = USER_XATTR;
 	} else if (!strncmp(nm->name, XATTR_SECURITY_PREFIX,
 				     XATTR_SECURITY_PREFIX_LEN)) {
-		if (nm->name[sizeof(XATTR_SECURITY_PREFIX) - 1] == '\0')
+		if (nm->name[XATTR_SECURITY_PREFIX_LEN] == '\0')
 			return -EINVAL;
 		type = SECURITY_XATTR;
 	} else
-- 
2.5.0
