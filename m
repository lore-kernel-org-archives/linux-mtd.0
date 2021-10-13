Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2D6C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 05:19:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5117260E8B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 05:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5117260E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J60s14BmwHnWl2ARgn0tEqT7zOE/VagoXCxbi4qx5V0=; b=1IuaAZSmJ0C0B9
	ztQP/3n9982z6MskiPoSwiXj1tQZmu/WRPBiaziLGbw3GsNaquZlTvbQIu06n0s4UUJ3LHF3ta6xQ
	9iIIrEZwBT9Qr64+W9wlMl4vFfEdO/r4mI4wkU7q/j5acx/7CDKczBiqV7UIGwmFvOQf+/kfCKwl0
	cD+g9HRr8uSpJ4VGDN/kzTUdnmOaNrmjLJveTX0sNy4JI5MfCknXcThAU0xUgKP790yvQrWX+c8DC
	lkPpvh24Flj7EOm7MWbh+89mCqHjI2BhkVtG8Da07P2dBV7fwaHgQmbLoj4rwbiiPKUn1AyDJmP3/
	VkYqoVWC6mw8Z0XtoZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWes-00Euzl-PJ; Wed, 13 Oct 2021 05:18:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWel-00Euwy-17; Wed, 13 Oct 2021 05:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2DQz2WV/6nrwiR72242gRkqq8vUi4whhUhfjcP1bIOA=; b=Xa7GvbJUMqzfvYueWwVUK3Ux0y
 yeuPdYMbBAsv9epgGKu1vVzGX5AB9rd3WONNmNoS6gf48CEj/PVW94BBUJX37asekH4NgbraHAxgt
 WFbcI0BRgTaJDdjCqpms7HMs5C8IrEAXCvDE3EtdqraUh37FzwbfyoXL8GMrpEuNmvxXHABcddDQj
 moa/NVUObti9FIhR2tmwTqQ9CsQE6vspnROJ/w7q712HU1YfTb1JyVgsUDPAlJjCQuTqpVjblOKfa
 d1LJSuZJXvLyYiS+rDzxGbQbtLoGp+8OE0X2NKJLWnwHbMtue0DP5hxKAu9iTrDO6aiD7Uy0tXmC+
 90afCgmw==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWdg-0076G9-GA; Wed, 13 Oct 2021 05:17:32 +0000
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
Subject: [PATCH 07/29] target/iblock: use bdev_nr_sectors instead of open
 coding it
Date: Wed, 13 Oct 2021 07:10:20 +0200
Message-Id: <20211013051042.1065752-8-hch@lst.de>
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
 drivers/target/target_core_iblock.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 31df20abe141f..ab7f5678ebc44 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -232,8 +232,9 @@ static unsigned long long iblock_emulate_read_cap_with_block_size(
 	struct block_device *bd,
 	struct request_queue *q)
 {
-	unsigned long long blocks_long = (div_u64(i_size_read(bd->bd_inode),
-					bdev_logical_block_size(bd)) - 1);
+	loff_t size = bdev_nr_sectors(bd) << SECTOR_SHIFT;
+	unsigned long long blocks_long =
+		div_u64(size, bdev_logical_block_size(bd)) - 1;
 	u32 block_size = bdev_logical_block_size(bd);
 
 	if (block_size == dev->dev_attrib.block_size)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
