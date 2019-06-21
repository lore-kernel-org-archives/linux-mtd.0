Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04653C48BE3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 23:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57D5206B6
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 23:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6qoebVk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cMahPU3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B57D5206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ni8mZGad1Z8qp9NClR4LjWDg025CFbFWRb4grqGczrM=; b=A6qoebVk5E+ZWZ
	tHTEf8AuBppjqB8rz5WNsJMcSoNSQ89Gxb0JrFYVzNhf45KtNbPX2r/MSvPD3yNG1kz4gHWQFb81g
	ructo//yNXETmDwG3hqF27xP2vFNTcBArozgs1kB8cPNhEZGd6EwYKf+xS8wRMc7Xq2mbm0XgRZwk
	qdWJaZVLx+7lbYrArhmwrQnKaAHrfHOQZh5MQSw5HH3ELnMC37KjBqO7k5ZxBGeTNiLsvfS8EZWEU
	MlTr37IHs6cCWPeoPhxZvcyKWmyHlP/HMrmWcOHbLt6KLjj7z6b3S2mQDPROI1DzXQr+fLwauZgiq
	YzwwFViNx1CFlic22wOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heTP6-0005iw-V9; Fri, 21 Jun 2019 23:57:12 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heTOl-0005Mn-8l
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 23:56:53 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LNsGrY052403;
 Fri, 21 Jun 2019 23:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=78mpo7nmf/TzCxYm+FvueiHl24evXjLjlQCOrNx2ii0=;
 b=cMahPU3h3WDq3o77oZm0v0l4eAWtZqs/z8B7QgP9dV/rx4C/edHv9TeXRO0Fb9skdbZX
 MvIT1UKbFMUxTjPGF5ctb5YT/ptXqzjRKe0bEjHJXNIBDIlXoPkxy/IlasQSuXSlqiRp
 +esjhsZV2vt0hmx2CeWgITQXAWJndNzDgtadN5Vi/Wy2Rzss4rCWUAaq9ufIuoJg4pO0
 CXx8gFyk5qVEqBeqSdIBJjxjiyzTW1lPMf8roTQv35mwvkXROxRUuqe0PXhUo23jlqfq
 jo0DSSQMXqiYBxvFatD6UltM7XnOs51r/G+gZfd9hhdvvu+ronRsSfFchGKQK7ximVP5 Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t7809rsw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 23:56:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LNtNrf168098;
 Fri, 21 Jun 2019 23:56:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t7rdy05x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Jun 2019 23:56:43 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5LNuhUu170079;
 Fri, 21 Jun 2019 23:56:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2t7rdy05wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 23:56:43 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5LNue9m031369;
 Fri, 21 Jun 2019 23:56:40 GMT
Received: from localhost (/10.159.131.214)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Jun 2019 16:56:40 -0700
Subject: [PATCH 3/4] fs: teach vfs_ioc_fssetxattr_check to check project id
 info
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 darrick.wong@oracle.com, shaggy@kernel.org, ard.biesheuvel@linaro.org,
 josef@toxicpanda.com, clm@fb.com, adilger.kernel@dilger.ca,
 jk@ozlabs.org, jack@suse.com, dsterba@suse.com, jaegeuk@kernel.org,
 viro@zeniv.linux.org.uk
Date: Fri, 21 Jun 2019 16:56:37 -0700
Message-ID: <156116139763.1664814.8565619516886294289.stgit@magnolia>
In-Reply-To: <156116136742.1664814.17093419199766834123.stgit@magnolia>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_165651_362480_C54DBDB0 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-nilfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Darrick J. Wong <darrick.wong@oracle.com>

Standardize the project id checks for FSSETXATTR.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/ext4/ioctl.c    |   27 ---------------------------
 fs/f2fs/file.c     |   27 ---------------------------
 fs/inode.c         |   13 +++++++++++++
 fs/xfs/xfs_ioctl.c |   15 ---------------
 4 files changed, 13 insertions(+), 69 deletions(-)


diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index c2f48c90ca45..6aa1df1918f7 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -697,30 +697,6 @@ static long ext4_ioctl_group_add(struct file *file,
 	return err;
 }
 
-static int ext4_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
-{
-	/*
-	 * Project Quota ID state is only allowed to change from within the init
-	 * namespace. Enforce that restriction only if we are trying to change
-	 * the quota ID state. Everything else is allowed in user namespaces.
-	 */
-	if (current_user_ns() == &init_user_ns)
-		return 0;
-
-	if (__kprojid_val(EXT4_I(inode)->i_projid) != fa->fsx_projid)
-		return -EINVAL;
-
-	if (ext4_test_inode_flag(inode, EXT4_INODE_PROJINHERIT)) {
-		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
-			return -EINVAL;
-	} else {
-		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 static void ext4_fsgetxattr(struct inode *inode, struct fsxattr *fa)
 {
 	struct ext4_inode_info *ei = EXT4_I(inode);
@@ -1135,9 +1111,6 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 		inode_lock(inode);
 		ext4_fsgetxattr(inode, &old_fa);
-		err = ext4_ioctl_check_project(inode, &fa);
-		if (err)
-			goto out;
 		err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
 		if (err)
 			goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f707de6bd4a8..183ed1ac60e1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2799,30 +2799,6 @@ static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
 	return 0;
 }
 
-static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
-{
-	/*
-	 * Project Quota ID state is only allowed to change from within the init
-	 * namespace. Enforce that restriction only if we are trying to change
-	 * the quota ID state. Everything else is allowed in user namespaces.
-	 */
-	if (current_user_ns() == &init_user_ns)
-		return 0;
-
-	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
-		return -EINVAL;
-
-	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
-		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
-			return -EINVAL;
-	} else {
-		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -2850,9 +2826,6 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 		return err;
 
 	inode_lock(inode);
-	err = f2fs_ioctl_check_project(inode, &fa);
-	if (err)
-		goto out;
 
 	__f2fs_ioc_fsgetxattr(inode, &old_fa);
 	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
diff --git a/fs/inode.c b/fs/inode.c
index ddfe60679b53..f1ffa9605078 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2221,6 +2221,19 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
+	/*
+	 * Project Quota ID state is only allowed to change from within the init
+	 * namespace. Enforce that restriction only if we are trying to change
+	 * the quota ID state. Everything else is allowed in user namespaces.
+	 */
+	if (current_user_ns() != &init_user_ns) {
+		if (old_fa->fsx_projid != fa->fsx_projid)
+			return -EINVAL;
+		if ((old_fa->fsx_xflags ^ fa->fsx_xflags) &
+				FS_XFLAG_PROJINHERIT)
+			return -EINVAL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 08c24f2f55c3..82961de98900 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -1299,21 +1299,6 @@ xfs_ioctl_setattr_check_projid(
 	if (fa->fsx_projid > (uint16_t)-1 &&
 	    !xfs_sb_version_hasprojid32bit(&ip->i_mount->m_sb))
 		return -EINVAL;
-
-	/*
-	 * Project Quota ID state is only allowed to change from within the init
-	 * namespace. Enforce that restriction only if we are trying to change
-	 * the quota ID state. Everything else is allowed in user namespaces.
-	 */
-	if (current_user_ns() == &init_user_ns)
-		return 0;
-
-	if (xfs_get_projid(ip) != fa->fsx_projid)
-		return -EINVAL;
-	if ((fa->fsx_xflags & FS_XFLAG_PROJINHERIT) !=
-	    (ip->i_d.di_flags & XFS_DIFLAG_PROJINHERIT))
-		return -EINVAL;
-
 	return 0;
 }
 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
