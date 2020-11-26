Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B13AC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:21:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B51D204FD
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eeirVMxi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lbuMqndr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B51D204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1sB1B43qjtRde7bMUKqYsNHHGmK5SqkmPayrOXSSHO0=; b=eeirVMxiBB9eRBsqbOKBV30Co
	0Cp6dGt0Gc7LfB2yJs1yj6Wx/l9evA6L4SfHf7jODgwH7+fxrcz8ZLHw+R5Zf52PAHAiBv/x007YJ
	cvNTwAIoMol2lkZP4CjJ877Lu4qoyVln3av8f7RaO9eFVFQ7ezHDaHfS6eg2u84iM+iTs2uarG/7+
	oiuEq++Hzwjni7/36vDIHRmE3jrhJMKrE7mzZ7sS3GOUxtuQ5IWUaBColSSQyOmszHu5+7U6bBZ5q
	2Z71VdXG+Tazs3gUI0ip57olx5B7SgELtVFlWZSWAVWyQnGPK3xbOHbZ3BDYI352r6loBGW1OjyrI
	qiIG1MlhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiHCV-0003tA-1I; Thu, 26 Nov 2020 13:20:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzo-0008LW-HC
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3s9ZV7/S/AMqijy+96nJeQSoiw9kLp/J9AYboOAYnhs=; b=lbuMqndrB4unGfBY2q8G5+moxM
 EuvFsvmmVuvx5mPiC+nnsGzQIcFdzQZi6ZsjodsHPBp7chjmprxWF707wat01mujb4rRcWkYVzfvJ
 xkcBoyNStiLpMrLVijQtl3GaDDdfzaLRmIQ4oVKAYpKq0DaqJcQ5JC+WwUL/Mgcst3eINsPBfyGRO
 c36pao99EtbARVjFs15yxmbrCl+aO/l1YeA9iQ7erqMEAllqKRsfSw0I8L0TUSp7OZzJ7+sx9bfcl
 WMhzpiY6mnI4jLPyIiCgWrzFmAUSNPMcmi1/TUxKLQ0+Bb42oiUEu3V3u861W9swvmCZiLxDAucig
 OsvEoqAg==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzm-0004Ci-Ls; Thu, 26 Nov 2020 13:07:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 42/44] f2fs: remove a few bd_part checks
Date: Thu, 26 Nov 2020 14:04:20 +0100
Message-Id: <20201126130422.92945-43-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126130422.92945-1-hch@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-bcache@vger.kernel.org, Chao Yu <yuchao0@huawei.com>,
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

bd_part is never NULL for a block device in use by a file system, so
remove the checks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c | 5 +----
 fs/f2fs/sysfs.c      | 9 ---------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 023462e80e58d5..54a1905af052cc 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1395,7 +1395,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	__u32 crc32 = 0;
 	int i;
 	int cp_payload_blks = __cp_payload(sbi);
-	struct super_block *sb = sbi->sb;
 	struct curseg_info *seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
 	u64 kbytes_written;
 	int err;
@@ -1489,9 +1488,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	start_blk += data_sum_blocks;
 
 	/* Record write statistics in the hot node summary */
-	kbytes_written = sbi->kbytes_written;
-	if (sb->s_bdev->bd_part)
-		kbytes_written += BD_PART_WRITTEN(sbi);
+	kbytes_written = sbi->kbytes_written + BD_PART_WRITTEN(sbi);
 
 	seg_i->journal->info.kbytes_written = cpu_to_le64(kbytes_written);
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index ec77ccfea923dc..24e876e849c512 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -90,11 +90,6 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	struct super_block *sb = sbi->sb;
-
-	if (!sb->s_bdev->bd_part)
-		return sprintf(buf, "0\n");
-
 	return sprintf(buf, "%llu\n",
 			(unsigned long long)(sbi->kbytes_written +
 			BD_PART_WRITTEN(sbi)));
@@ -103,12 +98,8 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	struct super_block *sb = sbi->sb;
 	int len = 0;
 
-	if (!sb->s_bdev->bd_part)
-		return sprintf(buf, "0\n");
-
 	if (f2fs_sb_has_encrypt(sbi))
 		len += scnprintf(buf, PAGE_SIZE - len, "%s",
 						"encryption");
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
