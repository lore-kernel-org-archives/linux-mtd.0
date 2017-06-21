Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNkEt-0000XO-89
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 18:20:28 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5LIIV1d006491
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 14:20:11 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b7w132p0c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 14:20:11 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <zohar@linux.vnet.ibm.com>;
 Thu, 22 Jun 2017 04:20:08 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5LIJwCH12320972
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 04:20:06 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v5LIJYHV028441
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 04:19:34 +1000
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>,
 linux-fsdevel@vger.kernel.org, linux-ima-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 08/10] jffs2: define integrity_read method
Date: Wed, 21 Jun 2017 14:18:28 -0400
In-Reply-To: <1498069110-10009-1-git-send-email-zohar@linux.vnet.ibm.com>
References: <1498069110-10009-1-git-send-email-zohar@linux.vnet.ibm.com>
Message-Id: <1498069110-10009-9-git-send-email-zohar@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Define an ->integrity_read file operation method to read data for
integrity hash collection.

Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>
---
 fs/jffs2/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index c12476e309c6..5a63034cccf5 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -57,6 +57,7 @@ const struct file_operations jffs2_file_operations =
 	.mmap =		generic_file_readonly_mmap,
 	.fsync =	jffs2_fsync,
 	.splice_read =	generic_file_splice_read,
+	.integrity_read = generic_file_read_iter,
 };
 
 /* jffs2_file_inode_operations */
-- 
2.7.4
