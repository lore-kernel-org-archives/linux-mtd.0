Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNkF3-0000Xx-5c
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 18:20:41 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5LIIUOu130672
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 14:20:17 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b7v51wam5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 14:20:16 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <zohar@linux.vnet.ibm.com>;
 Thu, 22 Jun 2017 04:20:14 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5LIK3la45809846
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 04:20:11 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v5LIJchv028549
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 04:19:38 +1000
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>,
 linux-fsdevel@vger.kernel.org, linux-ima-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 09/10] ubifs: define integrity_read method
Date: Wed, 21 Jun 2017 14:18:29 -0400
In-Reply-To: <1498069110-10009-1-git-send-email-zohar@linux.vnet.ibm.com>
References: <1498069110-10009-1-git-send-email-zohar@linux.vnet.ibm.com>
Message-Id: <1498069110-10009-10-git-send-email-zohar@linux.vnet.ibm.com>
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
 fs/ubifs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 2cda3d67e2d0..eeb4e872e47a 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1754,4 +1754,5 @@ const struct file_operations ubifs_file_operations = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
+	.integrity_read = generic_file_read_iter,
 };
-- 
2.7.4
