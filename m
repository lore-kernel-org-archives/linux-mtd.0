Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1823C4646D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 18:37:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F005208E3
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 18:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VqCL1Iav";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mnvLlQbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F005208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAoHc8YeG1dp+GP8fS6ebmomifr/in1OHUIMa7O8R/c=; b=VqCL1IavtNwf+t
	QtxbR298IZ/3PMWCfGAv2Zb2uzwk/duWrj9nB8FQqXbqzCQPflGrPe9r0eiXOQvB4VZrKXm7f4TVK
	yVaBfkIrWgzxuvYDFeMOoj43KtN0hsPQGSgUQvXHLj4128mjOT6AQqw0ByibHCFhxdVl9MzZR2RFA
	bXEWbRxm+qNdpIFuLYuJDVYHn54xDIE6wmHe2nitkPhRt4PU+GzSQqT/0E5zo5CCI8xp4PePhys5Z
	ObiQPhdRnMHLMnWpaYioKjwLr6ZXVDBVSH6HRLeFeuVokbQXCLyMXmGv+BgSu+wctXScNuBrjNbwA
	oZ19gVa/2dn/lefRXwyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgvkV-0003e6-RQ; Fri, 28 Jun 2019 18:37:27 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgviC-0000MC-QL
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 18:35:17 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5SIYFLu114564;
 Fri, 28 Jun 2019 18:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=SzhUagx5xKDjUPMnCOT6QDZ48tKdmDiAhiUc4dwBNMc=;
 b=mnvLlQbV2QHV26kqG92l3MXPrAPzWnlJDT7iMchyHjON0BMde8Sg9j+NJSQ2cgtq+RKW
 GtWC0aXPwH4JWFvGkbIDc22Kpnp3GPUUwn/X+y7MbUPXCMHqkJHXTM3sf3ePxCPgGQTR
 Ik6oOyIb8/35YREB7LMH6RLuFlRi5sjofcBUaHWl210Cqx59Cuy3psQwF5i939AWsCZH
 0eByhkqF2267VS9+c8UPrsMZ+4ehuzeqW4nIe7Lc0ETccrtY9ADYq8g6iQDQxz6qcAb9
 spxjGujEt8id50pXB71YFUjUEKKpzcUsz3+oVF3hJ6svSdLkNQjVZZEXy9sdSHInKJxt PQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2t9cyqxyj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 18:34:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5SIXcw7078820;
 Fri, 28 Jun 2019 18:34:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t9acdyec3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jun 2019 18:34:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5SIYdKa080557;
 Fri, 28 Jun 2019 18:34:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t9acdyebu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 18:34:49 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5SIYk5o021913;
 Fri, 28 Jun 2019 18:34:47 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 28 Jun 2019 11:34:46 -0700
Subject: [PATCH 1/4] mm/fs: don't allow writes to immutable files
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 darrick.wong@oracle.com, ard.biesheuvel@linaro.org,
 josef@toxicpanda.com, hch@infradead.org, clm@fb.com,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, jk@ozlabs.org
Date: Fri, 28 Jun 2019 11:34:43 -0700
Message-ID: <156174688345.1557469.793195935067841912.stgit@magnolia>
In-Reply-To: <156174687561.1557469.7505651950825460767.stgit@magnolia>
References: <156174687561.1557469.7505651950825460767.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9302
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=375 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906280210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_113505_109520_F72764C6 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Darrick J. Wong <darrick.wong@oracle.com>

The chattr manpage has this to say about immutable files:

"A file with the 'i' attribute cannot be modified: it cannot be deleted
or renamed, no link can be created to this file, most of the file's
metadata can not be modified, and the file can not be opened in write
mode."

Once the flag is set, it is enforced for quite a few file operations,
such as fallocate, fpunch, fzero, rm, touch, open, etc.  However, we
don't check for immutability when doing a write(), a PROT_WRITE mmap(),
a truncate(), or a write to a previously established mmap.

If a program has an open write fd to a file that the administrator
subsequently marks immutable, the program still can change the file
contents.  Weird!

The ability to write to an immutable file does not follow the manpage
promise that immutable files cannot be modified.  Worse yet it's
inconsistent with the behavior of other syscalls which don't allow
modifications of immutable files.

Therefore, add the necessary checks to make the write, mmap, and
truncate behavior consistent with what the manpage says and consistent
with other syscalls on filesystems which support IMMUTABLE.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/attr.c    |   13 ++++++-------
 mm/filemap.c |    3 +++
 mm/memory.c  |    4 ++++
 mm/mmap.c    |    8 ++++++--
 4 files changed, 19 insertions(+), 9 deletions(-)


diff --git a/fs/attr.c b/fs/attr.c
index d22e8187477f..1fcfdcc5b367 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -233,19 +233,18 @@ int notify_change(struct dentry * dentry, struct iattr * attr, struct inode **de
 
 	WARN_ON_ONCE(!inode_is_locked(inode));
 
-	if (ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) {
-		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
-			return -EPERM;
-	}
+	if (IS_IMMUTABLE(inode))
+		return -EPERM;
+
+	if ((ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) &&
+	    IS_APPEND(inode))
+		return -EPERM;
 
 	/*
 	 * If utimes(2) and friends are called with times == NULL (or both
 	 * times are UTIME_NOW), then we need to check for write permission
 	 */
 	if (ia_valid & ATTR_TOUCH) {
-		if (IS_IMMUTABLE(inode))
-			return -EPERM;
-
 		if (!inode_owner_or_capable(inode)) {
 			error = inode_permission(inode, MAY_WRITE);
 			if (error)
diff --git a/mm/filemap.c b/mm/filemap.c
index aac71aef4c61..dad85e10f5f8 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2935,6 +2935,9 @@ inline ssize_t generic_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	loff_t count;
 	int ret;
 
+	if (IS_IMMUTABLE(inode))
+		return -EPERM;
+
 	if (!iov_iter_count(from))
 		return 0;
 
diff --git a/mm/memory.c b/mm/memory.c
index ddf20bd0c317..abf795277f36 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2235,6 +2235,10 @@ static vm_fault_t do_page_mkwrite(struct vm_fault *vmf)
 
 	vmf->flags = FAULT_FLAG_WRITE|FAULT_FLAG_MKWRITE;
 
+	if (vmf->vma->vm_file &&
+	    IS_IMMUTABLE(vmf->vma->vm_file->f_mapping->host))
+		return VM_FAULT_SIGBUS;
+
 	ret = vmf->vma->vm_ops->page_mkwrite(vmf);
 	/* Restore original flags so that caller is not surprised */
 	vmf->flags = old_flags;
diff --git a/mm/mmap.c b/mm/mmap.c
index 7e8c3e8ae75f..b3ebca2702bf 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1483,8 +1483,12 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 		case MAP_SHARED_VALIDATE:
 			if (flags & ~flags_mask)
 				return -EOPNOTSUPP;
-			if ((prot&PROT_WRITE) && !(file->f_mode&FMODE_WRITE))
-				return -EACCES;
+			if (prot & PROT_WRITE) {
+				if (!(file->f_mode & FMODE_WRITE))
+					return -EACCES;
+				if (IS_IMMUTABLE(file->f_mapping->host))
+					return -EPERM;
+			}
 
 			/*
 			 * Make sure we don't allow writing to an append-only


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
