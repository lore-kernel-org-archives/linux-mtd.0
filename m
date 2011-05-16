Received: from e32.co.us.ibm.com ([32.97.110.150])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLz5N-0006ur-Ct
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 14:47:54 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e32.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id p4GEaMiH018302
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 08:36:22 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	p4GElacM107338
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 08:47:39 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p4G8lY06015369
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 02:47:36 -0600
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: linux-security-module@vger.kernel.org
Subject: [PATCH v5 14/21] evm: add evm_inode_post_init call in jffs2
Date: Mon, 16 May 2011 10:45:08 -0400
Message-Id: <1305557115-15652-15-git-send-email-zohar@linux.vnet.ibm.com>
In-Reply-To: <1305557115-15652-1-git-send-email-zohar@linux.vnet.ibm.com>
References: <1305557115-15652-1-git-send-email-zohar@linux.vnet.ibm.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@nokia.com>, Mimi Zohar <zohar@us.ibm.com>,
	David Safford <safford@watson.ibm.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mimi Zohar <zohar@linux.vnet.ibm.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After creating the initial LSM security extended attribute, call
evm_inode_post_init_security() to create the 'security.evm'
extended attribute.

Signed-off-by: Mimi Zohar <zohar@us.ibm.com>
---
 fs/jffs2/security.c |   26 +++++++++++++++++++-------
 1 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index cfeb716..6847769 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -20,6 +20,7 @@
 #include <linux/xattr.h>
 #include <linux/mtd/mtd.h>
 #include <linux/security.h>
+#include <linux/evm.h>
 #include "nodelist.h"
 
 /* ---- Initial Security Label Attachment -------------- */
@@ -28,19 +29,30 @@ int jffs2_init_security(struct inode *inode, struct inode *dir,
 {
 	int rc;
 	size_t len;
-	void *value;
-	char *name;
+	struct xattr lsm_xattr;
+	struct xattr evm_xattr;
 
-	rc = security_inode_init_security(inode, dir, qstr, &name, &value, &len);
+	rc = security_inode_init_security(inode, dir, qstr, &lsm_xattr.name,
+					  &lsm_xattr.value,
+					  &lsm_xattr.value_len);
 	if (rc) {
 		if (rc == -EOPNOTSUPP)
 			return 0;
 		return rc;
 	}
-	rc = do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY, name, value, len, 0);
-
-	kfree(name);
-	kfree(value);
+	rc = do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY, lsm_xattr.name,
+			       lsm_xattr.value, lsm_xattr.value_len, 0);
+	if (rc)
+		goto out;
+	rc = evm_inode_post_init_security(inode, &lsm_xattr, &evm_xattr);
+	if (err)
+		goto out;
+	rc = do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY, evm_xattr.name,
+			       evm_xattr.value, evm_xattr.value_len, 0);
+	kfree(evm_xattr.value);
+out:
+	kfree(lsm_xattr.name);
+	kfree(lsm_xattr.value);
 	return rc;
 }
 
-- 
1.7.3.4
