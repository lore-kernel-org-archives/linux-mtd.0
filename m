Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS6yC-0005kf-3R
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 12:25:48 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p52C4MZV005917
	for <linux-mtd@lists.infradead.org>; Thu, 2 Jun 2011 08:04:22 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p52CPZtW116654
	for <linux-mtd@lists.infradead.org>; Thu, 2 Jun 2011 08:25:35 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p528PNmN018783
	for <linux-mtd@lists.infradead.org>; Thu, 2 Jun 2011 05:25:24 -0300
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: linux-security-module@vger.kernel.org
Subject: [PATCH v6 13/20] evm: add evm_inode_post_init call in jffs2
Date: Thu,  2 Jun 2011 08:23:36 -0400
Message-Id: <1307017423-15093-14-git-send-email-zohar@linux.vnet.ibm.com>
In-Reply-To: <1307017423-15093-1-git-send-email-zohar@linux.vnet.ibm.com>
References: <1307017423-15093-1-git-send-email-zohar@linux.vnet.ibm.com>
Cc: Dmitry Kasatkin <dmitry.s.kasatkin@gmail.com>,
	Mimi Zohar <zohar@us.ibm.com>,
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
