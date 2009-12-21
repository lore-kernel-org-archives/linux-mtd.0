Received: from mail-pw0-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMgrl-0004U0-Ka
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 11:56:02 +0000
Received: by pwj11 with SMTP id 11so3412355pwj.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 03:55:56 -0800 (PST)
Message-ID: <4B2F631F.4070303@gmail.com>
Date: Mon, 21 Dec 2009 19:59:27 +0800
From: Liuwenyi <qingshenlwy@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, viro@zeniv.linux.org.uk, jmorris@namei.org,
	akpm@linux-foundation.org, joel.becker@oracle.com, serue@us.ibm.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	onlyflyer@gmail.com, strongzgy@gmail.com
Subject: [PATCHv2 08/12]posix_acl: Add the check items
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Reply-To: qingshenlwy@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

move the ACL validation check in to fs/posix_acl.c.
Including nullpointer check and PTR_ERR check.

---
Signed-off-by: Liuwenyi <qingshenlwy@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: James Morris <jmorris@namei.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Joel Becker <joel.becker@oracle.com>
Cc: Serge Hallyn <serue@us.ibm.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index 7cdc319..1eb4726 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -403,13 +403,10 @@ static int jffs2_acl_setxattr(struct dentry
*dentry, const char *name,

if (value) {
acl = posix_acl_from_xattr(value, size);
- if (IS_ERR(acl))
- return PTR_ERR(acl);
- if (acl) {
- rc = posix_acl_valid(acl);
- if (rc)
- goto out;
- }
+ rc = posix_acl_valid(acl);
+ if (rc)
+ goto out;
+
} else {
acl = NULL;
}

-- 
Best Regards,
Liuwenyi
