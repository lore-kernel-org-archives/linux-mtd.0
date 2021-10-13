Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB06C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 05:55:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B5661039
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 05:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38B5661039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SCNj0m/HeKLT6dIxUNrpY5bVXxtCzlm0nQpDtwhhoI=; b=Z4y/TSWlgNR776
	XsjUImOhiekV004BVHRtw+IpYhZK9KwC7nuvM/OmQcJGt5kRks6y3CgmeGUAUtFBi+OGoRiNBAQvg
	3pHPx4KXQbAXidSu0Xer5kfDJ9Is7AVVtj4Su6q2ZWw8tikIw6CC70hREi/7KZ1u5TSCLsNqc758a
	Tox9MtG+Y7/ZzHJgzuiKiPh0/6agcA5Jk92G6mfSuP0RwYJj5s22qrrbqKxbsLI0Ln9o+t6rYiiks
	4YrvCHGjaSN8k/VoDCepH2Naj6psvLDQoGo7+jrQBDQQkd45AFd9d6+eRiYXbL2Am2NdTc6RbUtKS
	ZuqaASWlRQWml9pv341g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maXEc-00F2sk-FM; Wed, 13 Oct 2021 05:55:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWyt-00EzZj-IM; Wed, 13 Oct 2021 05:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Jn3vPWURqTLCTgey+1ZKUDn76o/D4LziuPXo21jTcNA=; b=hRwOIaUT4TV+iuM/Zg8w7n25xq
 4JP07oWgVj96DxAIyE5GugNAoImIQjt6YOnfusnDpQHqpMzsfUUyomS23Xdp6GlGxW3N9d9yv8zRS
 Hpba9F54jbcMwbBNW8QibfhbiimOvdOmbo+bN2OBMyd97mLTimJW2mXzi7iAyeKKMK46Qo3qyEEEa
 rak7t0pG0xoWK9og1uwIKQIsTozlfX1z449iRcMhaqjTRmWD/ItgnJgiWeePTgAAgRxi2mKfmIrf0
 aPWD/qlzTxrcJbhN3jtl/ZC96e/wuQfBrUM++RgMnBjSBr/PpZLjvhZ0imDh0CcCecmWUWPsOtrDH
 PvSE0SHg==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWxN-007832-Di; Wed, 13 Oct 2021 05:38:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, David Sterba <dsterba@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, "Theodore Ts'o" <tytso@mit.edu>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Dave Kleikamp <shaggy@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Kees Cook <keescook@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
Subject: [PATCH 23/29] block: use bdev_nr_sectors instead of open coding it in
 blkdev_fallocate
Date: Wed, 13 Oct 2021 07:10:36 +0200
Message-Id: <20211013051042.1065752-24-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013051042.1065752-1-hch@lst.de>
References: <20211013051042.1065752-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use the proper helper to read the block device size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index 7bb9581a146cf..6e27dd2748504 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -548,7 +548,7 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
 		return -EOPNOTSUPP;
 
 	/* Don't go off the end of the device. */
-	isize = i_size_read(bdev->bd_inode);
+	isize = bdev_nr_sectors(bdev) << SECTOR_SHIFT;
 	if (start >= isize)
 		return -EINVAL;
 	if (end >= isize) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
