Received: from smtp.ispras.ru ([83.149.199.79])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJHpW-0005XE-6I
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 08:30:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
From: koloskov <koloskov@ispras.ru>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: jffs2: Do not rewrite =?UTF-8?Q?posix=5Facl=5Fequiv=5Fmode=28=29?=
 =?UTF-8?Q?=20result=20in=20=20jffs=32=5Fset=5Facl=28=29?=
In-Reply-To: <f75d56ff5d79c7a3b16e3579ed10ca4c@ispras.ru>
References: <f75d56ff5d79c7a3b16e3579ed10ca4c@ispras.ru>
Message-ID: <028837a9a50ec9241d93c26d2daba477@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 05 Feb 2015 08:30:31 -0000

 From ad03fe743959c04a9e7d611c026c201a14ce0ed6 Mon Sep 17 00:00:00 2001
 From: Andrey Koloskov <koloskov@ispras.ru>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Date: Tue, 13 Jan 2015 14:37:18 +0400
Subject: [PATCH] jffs2: Do not rewrite posix_acl_equiv_mode() result in
  jffs2_set_acl()

Result of posix_acl_equiv_mode() is rewritten with one of 
jffs2_do_setattr(),
so it is always assumed that acl can be exactly represented by the
traditional file mode permission bits.

The patch adds a new variable for store result of 
posix_acl_equiv_mode().

Found by Linux File System Verification project (linuxtesting.org).

Signed-off-by: Andrey Koloskov <koloskov@ispras.ru>
---
  fs/jffs2/acl.c |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index 2f7a3c0..63705bd 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -229,16 +229,16 @@ static int __jffs2_set_acl(struct inode *inode, 
int xprefix, struct posix_acl *a

  int jffs2_set_acl(struct inode *inode, struct posix_acl *acl, int 
type)
  {
-	int rc, xprefix;
+	int rc, xprefix, not_equiv;

  	switch (type) {
  	case ACL_TYPE_ACCESS:
  		xprefix = JFFS2_XPREFIX_ACL_ACCESS;
  		if (acl) {
  			umode_t mode = inode->i_mode;
-			rc = posix_acl_equiv_mode(acl, &mode);
-			if (rc < 0)
-				return rc;
+			not_equiv = posix_acl_equiv_mode(acl, &mode);
+			if (not_equiv < 0)
+				return not_equiv;
  			if (inode->i_mode != mode) {
  				struct iattr attr;

@@ -249,7 +249,7 @@ int jffs2_set_acl(struct inode *inode, struct 
posix_acl *acl, int type)
  				if (rc < 0)
  					return rc;
  			}
-			if (rc == 0)
+			if (not_equiv == 0)
  				acl = NULL;
  		}
  		break;
-- 
1.7.9.5
