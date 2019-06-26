Return-Path: <SRS0=bYPC=UZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D7AC48BD6
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 02:35:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A72D20645
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 02:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Okt5wCw+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P4AM2r4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A72D20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISsbpKdjA0Qzsfk5aq2IQiGf7k1BmmHZuy0lRrEYTE0=; b=Okt5wCw+EMxX4o
	hne+B5tUDoABuaQA9ELqMMc76B+ntmBT4cso9l09hdW3rlCpaeecH+r4tJ/t5aX/VgRuXX9UDYYoR
	UU3+S3r1kKZg6t0Sf6HFcQQl71pSnxfT1LckYx7qbsmiTh2H5SOtbBZJwzWTWhjv1TmC3nVJ6N0gp
	9WPspsjxxI8oOEBUFph5D2q9Y0/trylVNoaVp6Ghj/R2jAT2agAslenBX+myo9G9RH+XbT9Y7/nb7
	YZbosjquy9kLWaYP2/aCBi26q1QM1lnWS6cXh5Lsn5GbdP3XRcU6WV9NiPx1SpDGhKrTsLMwCa/3T
	DPl4Ml5yRXLCO04PZRsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfxmW-00066d-Mf; Wed, 26 Jun 2019 02:35:32 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfxkT-00039a-3l
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2019 02:33:26 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5Q2TGdr026619;
 Wed, 26 Jun 2019 02:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=6o4YpGypPLzjpZ+ZkqPbxHMhFQ/fAokL7gT/kdrS3rU=;
 b=P4AM2r4O8nU7c0TP/3hgIM76kuCtB1+zo+JXjO4gCVkCBD/nNSLKwF4llit6BOzR/hos
 kVaWFauOSx3tSBZ1Kfb6P8sGvXDU1tR4q+dRkLjBcvlxDoQKuW0MY8FQgfsiNWesMYbB
 5DJY7OmafEjZr2+80d2LAaWYW0pablNO6XKlpNbkUaUh8WlCsd9N/VfCLktuqrcMlFTW
 TtZhGmSg7llHlD3X8jtnVZsfOw+KwiDhbGpoAqw8vbFJ+cYyOu68k7d3v5OVSQqBKdRy
 XGnhdj8YiQjBBP6DTCVfRzJ+Uo7uR4+2Zz+kccWNVWHDl6kE2dSLvbJXB+hR4M3omUGE wQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2t9c9pqjkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 02:33:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5Q2WjnS020557;
 Wed, 26 Jun 2019 02:33:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2t9p6uh2f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 02:33:13 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5Q2XD75021253;
 Wed, 26 Jun 2019 02:33:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t9p6uh2f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 02:33:13 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5Q2XBEe024251;
 Wed, 26 Jun 2019 02:33:11 GMT
Received: from localhost (/10.159.230.235)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 19:33:10 -0700
Subject: [PATCH 2/5] vfs: flush and wait for io when setting the immutable
 flag via SETFLAGS
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 darrick.wong@oracle.com, ard.biesheuvel@linaro.org,
 josef@toxicpanda.com, hch@infradead.org, clm@fb.com,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, jk@ozlabs.org
Date: Tue, 25 Jun 2019 19:33:08 -0700
Message-ID: <156151638826.2283603.17232416684567376466.stgit@magnolia>
In-Reply-To: <156151637248.2283603.8458727861336380714.stgit@magnolia>
References: <156151637248.2283603.8458727861336380714.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=777 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_193325_342375_AABEC3FA 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Darrick J. Wong <darrick.wong@oracle.com>

When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
need to ensure that userspace can't continue to write the file after the
file becomes immutable.  To make that happen, we have to flush all the
dirty pagecache pages to disk to ensure that we can fail a page fault on
a mmap'd region, wait for pending directio to complete, and hope the
caller locked out any new writes by holding the inode lock.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 fs/inode.c         |   21 +++++++++++++++++++--
 include/linux/fs.h |   11 +++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)


diff --git a/fs/inode.c b/fs/inode.c
index f08711b34341..65a412af3ffb 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2193,7 +2193,8 @@ EXPORT_SYMBOL(current_time);
 
 /*
  * Generic function to check FS_IOC_SETFLAGS values and reject any invalid
- * configurations.
+ * configurations.  Once we're done, prepare the inode for whatever changes
+ * are coming down the pipeline.
  *
  * Note: the caller should be holding i_mutex, or else be sure that they have
  * exclusive access to the inode structure.
@@ -2201,6 +2202,8 @@ EXPORT_SYMBOL(current_time);
 int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 			     unsigned int flags)
 {
+	int ret;
+
 	/*
 	 * The IMMUTABLE and APPEND_ONLY flags can only be changed by
 	 * the relevant capability.
@@ -2211,7 +2214,21 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
-	return 0;
+	/*
+	 * Now that we're done checking the new flags, flush all pending IO and
+	 * dirty mappings before setting S_IMMUTABLE on an inode via
+	 * FS_IOC_SETFLAGS.  If the flush fails we'll clear the flag before
+	 * returning error.
+	 */
+	if (!S_ISREG(inode->i_mode) || IS_IMMUTABLE(inode) ||
+	    !(flags & FS_IMMUTABLE_FL))
+		return 0;
+
+	inode_set_flags(inode, S_IMMUTABLE, S_IMMUTABLE);
+	ret = inode_drain_writes(inode);
+	if (ret)
+		inode_set_flags(inode, 0, S_IMMUTABLE);
+	return ret;
 }
 EXPORT_SYMBOL(vfs_ioc_setflags_prepare);
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 48322bfd7299..51266c9dbadc 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3561,4 +3561,15 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
 			     struct fsxattr *fa);
 
+/*
+ * Flush file data before changing attributes.  Caller must hold any locks
+ * required to prevent further writes to this file until we're done setting
+ * flags.
+ */
+static inline int inode_drain_writes(struct inode *inode)
+{
+	inode_dio_wait(inode);
+	return filemap_write_and_wait(inode->i_mapping);
+}
+
 #endif /* _LINUX_FS_H */


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
