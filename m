Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D399BC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 23:49:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FB321B18
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 23:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXITrIFM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Al+VIW0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FB321B18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GaMvOG0KvfQlEnKknji+YOn3LBqkgW6EzpUSGwau5ao=; b=mXITrIFMhzYbz9
	C19EnkyeVyIYXoCpWYAM9mi8QZ0N4nFWSr6f6CbFWfN2wovkYVwCMqaz0xTmkwpWOgGBbNb+Qna5O
	3bbBEFAJlwk7510Hqz71uoRqNKZZPRkdphY91pV9HvCwMzTNeml9MMp6A2eT7Fn+m5Y27ZjTtBWTE
	prFRHNysJPbkj0NeVf/CfvPTsfoxVmf4YtQ8MVEYCeZfVtbtZChIqqvfjA1aD78jMmySSYIWuDa4N
	0rIdRSB0yiF1BCKNSlwnBXrqDJQXTdDZ1bxakd01pxnaPBUZ3nTEmbMrob5cxpp16/2+LkiXsUTWn
	4aNlOmvast/U6bjk4mOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guQlA-0002KA-Qk; Thu, 14 Feb 2019 23:49:40 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guQl8-0002Jm-81
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 23:49:40 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x1ENn4Y9057714;
 Thu, 14 Feb 2019 23:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=4zja+sZjQPQ9x+0uQqxzzTRDfja/Krlmvk/CVa3qdOQ=;
 b=Al+VIW0aOmLYcb8AiAaYdIODJ+7H86i4reDBAj6Kt/4tSrJBkU4C6TYO9C8uLXu4+25J
 jI3QQ20mmbVqKjbIa6w9s6yOBxoLsfUnSGTS+e8EJpXFDDCnx4j14dzb/jZ6dR54yg2j
 QIeNg79TQcbaxHg4ts/nXcZyrxvRDFq+7LJsR320+MgPuqWuz6vxddeXLb7jQIrXKcKV
 oPM2US56vRsXcx9efZlpeGouUPvWyzUBZsRXNGetHEdFnYmoGGe0vTCfL2FrXV0IM36K
 POa81aT9rPE4E3dYc5UPwblwaUETYsgw5vIZdSpR86SPc/FcwjFTX/PEOXZmUUwDxG8y pw== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
 by userp2120.oracle.com with ESMTP id 2qhreeb0h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Feb 2019 23:49:15 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x1ENnFfG022416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Feb 2019 23:49:15 GMT
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x1ENnBiV001587;
 Thu, 14 Feb 2019 23:49:11 GMT
Received: from localhost (/10.159.142.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Feb 2019 15:49:11 -0800
Date: Thu, 14 Feb 2019 15:49:08 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
 viro@zeniv.linux.org.uk, jack@suse.com, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, yuchao0@huawei.com,
 hughd@google.com, darrick.wong@oracle.com, hch@infradead.org
Subject: [PATCH] vfs: don't decrement i_nlink in d_tmpfile
Message-ID: <20190214234908.GA6474@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9167
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=866 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902140156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_154938_379683_1B698B3F 
X-CRM114-Status: GOOD (  23.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: dedekind1@gmail.com, richard@nod.at, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Darrick J. Wong <darrick.wong@oracle.com>

d_tmpfile was introduced to instantiate an inode in the dentry cache as
a temporary file.  This helper decrements the inode's nlink count and
dirties the inode, presumably so that filesystems could call new_inode
to create a new inode with nlink == 1 and then call d_tmpfile which will
decrement nlink.

However, this doesn't play well with XFS, which needs to allocate,
initialize, and insert a tempfile inode on its unlinked list in a single
transaction.  In order to maintain referential integrity of the XFS
metadata, we cannot have an inode on the unlinked list with nlink >= 1.

XFS and btrfs hack around d_tmpfile's behavior by creating the inode
with nlink == 0 and then incrementing it just prior to calling
d_tmpfile, anticipating that it will be reset to 0.

Everywhere else outside of d_tmpfile, it appears that nlink updates and
persistence is the responsibility of individual filesystems.  Therefore,
move the nlink decrement out of d_tmpfile into the callers, and require
that callers only pass in inodes with nlink already set to 0.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 fs/btrfs/inode.c  |    8 --------
 fs/dcache.c       |    8 ++++++--
 fs/ext2/namei.c   |    2 +-
 fs/ext4/namei.c   |    1 +
 fs/f2fs/namei.c   |    1 +
 fs/minix/namei.c  |    2 +-
 fs/ubifs/dir.c    |    1 +
 fs/udf/namei.c    |    2 +-
 fs/xfs/xfs_iops.c |   13 ++-----------
 mm/shmem.c        |    1 +
 10 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 5c349667c761..bd189fc50f83 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -10382,14 +10382,6 @@ static int btrfs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (ret)
 		goto out;
 
-	/*
-	 * We set number of links to 0 in btrfs_new_inode(), and here we set
-	 * it to 1 because d_tmpfile() will issue a warning if the count is 0,
-	 * through:
-	 *
-	 *    d_tmpfile() -> inode_dec_link_count() -> drop_nlink()
-	 */
-	set_nlink(inode, 1);
 	d_tmpfile(dentry, inode);
 	unlock_new_inode(inode);
 	mark_inode_dirty(inode);
diff --git a/fs/dcache.c b/fs/dcache.c
index aac41adf4743..5fb4ecce2589 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -3042,12 +3042,16 @@ void d_genocide(struct dentry *parent)
 
 EXPORT_SYMBOL(d_genocide);
 
+/*
+ * Instantiate an inode in the dentry cache as a temporary file.  Callers must
+ * ensure that @inode has a zero link count.
+ */
 void d_tmpfile(struct dentry *dentry, struct inode *inode)
 {
-	inode_dec_link_count(inode);
 	BUG_ON(dentry->d_name.name != dentry->d_iname ||
 		!hlist_unhashed(&dentry->d_u.d_alias) ||
-		!d_unlinked(dentry));
+		!d_unlinked(dentry) ||
+		inode->i_nlink != 0);
 	spin_lock(&dentry->d_parent->d_lock);
 	spin_lock_nested(&dentry->d_lock, DENTRY_D_LOCK_NESTED);
 	dentry->d_name.len = sprintf(dentry->d_iname, "#%llu",
diff --git a/fs/ext2/namei.c b/fs/ext2/namei.c
index 0c26dcc5d850..8542e9ce9677 100644
--- a/fs/ext2/namei.c
+++ b/fs/ext2/namei.c
@@ -117,7 +117,7 @@ static int ext2_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 		return PTR_ERR(inode);
 
 	ext2_set_file_ops(inode);
-	mark_inode_dirty(inode);
+	inode_dec_link_count(inode);
 	d_tmpfile(dentry, inode);
 	unlock_new_inode(inode);
 	return 0;
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 2b928eb07fa2..7502432f9816 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2517,6 +2517,7 @@ static int ext4_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 		inode->i_op = &ext4_file_inode_operations;
 		inode->i_fop = &ext4_file_operations;
 		ext4_set_aops(inode);
+		inode_dec_link_count(inode);
 		d_tmpfile(dentry, inode);
 		err = ext4_orphan_add(handle, inode);
 		if (err)
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 62d9829f3a6a..31a556af5f3a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -780,6 +780,7 @@ static int __f2fs_tmpfile(struct inode *dir, struct dentry *dentry,
 		f2fs_i_links_write(inode, false);
 		*whiteout = inode;
 	} else {
+		inode_dec_link_count(inode);
 		d_tmpfile(dentry, inode);
 	}
 	/* link_count was changed by d_tmpfile as well. */
diff --git a/fs/minix/namei.c b/fs/minix/namei.c
index 1a6084d2b02e..3249f86c476a 100644
--- a/fs/minix/namei.c
+++ b/fs/minix/namei.c
@@ -57,7 +57,7 @@ static int minix_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 	struct inode *inode = minix_new_inode(dir, mode, &error);
 	if (inode) {
 		minix_set_inode(inode, 0);
-		mark_inode_dirty(inode);
+		inode_dec_link_count(inode);
 		d_tmpfile(dentry, inode);
 	}
 	return error;
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5767b373a8ff..7187e4fd7561 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -419,6 +419,7 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 		drop_nlink(inode);
 		*whiteout = inode;
 	} else {
+		inode_dec_link_count(inode);
 		d_tmpfile(dentry, inode);
 	}
 	ubifs_assert(c, ui->dirty);
diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 58cc2414992b..38bd021f9673 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -652,7 +652,7 @@ static int udf_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 		inode->i_data.a_ops = &udf_aops;
 	inode->i_op = &udf_file_inode_operations;
 	inode->i_fop = &udf_file_operations;
-	mark_inode_dirty(inode);
+	inode_dec_link_count(inode);
 	d_tmpfile(dentry, inode);
 	unlock_new_inode(inode);
 	return 0;
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 1efef69a7f1c..f48ffd7a8d3e 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -191,18 +191,9 @@ xfs_generic_create(
 
 	xfs_setup_iops(ip);
 
-	if (tmpfile) {
-		/*
-		 * The VFS requires that any inode fed to d_tmpfile must have
-		 * nlink == 1 so that it can decrement the nlink in d_tmpfile.
-		 * However, we created the temp file with nlink == 0 because
-		 * we're not allowed to put an inode with nlink > 0 on the
-		 * unlinked list.  Therefore we have to set nlink to 1 so that
-		 * d_tmpfile can immediately set it back to zero.
-		 */
-		set_nlink(inode, 1);
+	if (tmpfile)
 		d_tmpfile(dentry, inode);
-	} else
+	else
 		d_instantiate(dentry, inode);
 
 	xfs_finish_inode_setup(ip);
diff --git a/mm/shmem.c b/mm/shmem.c
index 6ece1e2fe76e..4a7810093561 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2818,6 +2818,7 @@ shmem_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 		error = simple_acl_create(dir, inode);
 		if (error)
 			goto out_iput;
+		inode_dec_link_count(inode);
 		d_tmpfile(dentry, inode);
 	}
 	return error;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
