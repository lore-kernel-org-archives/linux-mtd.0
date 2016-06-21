Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]
 helo=rainbowdash.ducie.codethink.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFOtL-0007TG-TG
 for linux-mtd@lists.infradead.org; Tue, 21 Jun 2016 16:51:12 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs-next: make xattr structures static
Date: Tue, 21 Jun 2016 17:50:43 +0100
Message-Id: <1466527843-1163-1-git-send-email-ben.dooks@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix sparse warnings from the use of "struct xattr_handler"
structures that are not exported by making them static. Fixes
the following sparse warnings:

/fs/ubifs/xattr.c:595:28: warning: symbol 'ubifs_user_xattr_handler' was not declared. Should it be static?
/fs/ubifs/xattr.c:601:28: warning: symbol 'ubifs_trusted_xattr_handler' was not declared. Should it be static?
/fs/ubifs/xattr.c:607:28: warning: symbol 'ubifs_security_xattr_handler' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/xattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index b5fc279..e237811 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -592,19 +592,19 @@ static int ubifs_xattr_set(const struct xattr_handler *handler,
 		return __ubifs_removexattr(inode, name);
 }
 
-const struct xattr_handler ubifs_user_xattr_handler = {
+static const struct xattr_handler ubifs_user_xattr_handler = {
 	.prefix = XATTR_USER_PREFIX,
 	.get = ubifs_xattr_get,
 	.set = ubifs_xattr_set,
 };
 
-const struct xattr_handler ubifs_trusted_xattr_handler = {
+static const struct xattr_handler ubifs_trusted_xattr_handler = {
 	.prefix = XATTR_TRUSTED_PREFIX,
 	.get = ubifs_xattr_get,
 	.set = ubifs_xattr_set,
 };
 
-const struct xattr_handler ubifs_security_xattr_handler = {
+static const struct xattr_handler ubifs_security_xattr_handler = {
 	.prefix = XATTR_SECURITY_PREFIX,
 	.get = ubifs_xattr_get,
 	.set = ubifs_xattr_set,
-- 
2.8.1
