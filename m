Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5655C47429
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:52:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B74223772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CHiLyhPZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tKir5D9m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B74223772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oPMPcYTPhgZHtFcjihs7KaAW6FXOqQvo5OnEmHAeoPI=; b=CHiLyhPZtG9arRyjrpcqH02PC
	YQk+1FdUN/Z9SGXynBaBhBZsbXuws7QToJthic2sigqV68yOPxYb794jV283iqE7hStsWNONtBTmo
	/iq096U25lRyFBNXORL92tu0xQIxiNIRqjby0V1PyF4/Nx8DzFhYlzAHhch6C83gjjvXaJgLpil0Z
	u3qQdIqif/poGQtjEzzExDDpZZCN91VRGwSFflFd+pnKCyqF89lZN4E4LwHpHkPRJrybRfHM1yxQp
	Z70RjHm1fbz/VJ1kc2eZNetllT8PZyo3iAT9f5pJrO0zQSHJpvtXJRKnc1xDeMJ6oUSlRX/u2+Jbe
	gwNt3aWgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLL6k-0004ob-UX; Thu, 24 Sep 2020 06:51:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6X-0004kr-Kw
 for linux-mtd@merlin.infradead.org; Thu, 24 Sep 2020 06:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+Llj/AmvV7mHR7T7gL/si/p73lK9Sq9nBxztkJ6FS3s=; b=tKir5D9mG/xQIv7GXHsh7cGgvx
 3y0D7EY/xxMVq0o00qzUZIykqJjNgrs/YlOajox62YL/Iqe1EYGLVGzG+9JBHp7et96FOLh238Hhx
 YlzCTDKvfJ8izWf1tp3jcCDTQrNbzpfQEdmv1OoIS7ecJ3BdKSSx7cr8eRSMRiNDo76JU+baIa100
 VFyFZ5UD7PdSLuwNzmfEXvOo1vGPKe0kwug7pVm0C48ljG+J0OOJy8PeZb/9gNVjhHzmwWcIBwwFF
 KlXPK6ixxl+tjcQ8r9oQC9V0kW8YWIzdUUgP4ynwziLtlB6+XId42Md/7Eg6wR86R1BKV04tFB9rK
 MW5QkZkQ==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6W-00019g-Dk; Thu, 24 Sep 2020 06:51:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/13] bcache: inherit the optimal I/O size
Date: Thu, 24 Sep 2020 08:51:30 +0200
Message-Id: <20200924065140.726436-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Justin Sanders <justin@coraid.com>, Jan Kara <jack@suse.cz>,
 Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Inherit the optimal I/O size setting just like the readahead window,
as any reason to do larger I/O does not apply to just readahead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Coly Li <colyli@suse.de>
---
 drivers/md/bcache/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 1bbdc410ee3c51..48113005ed86ad 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1430,6 +1430,8 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
 	dc->disk.disk->queue->backing_dev_info->ra_pages =
 		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
 		    q->backing_dev_info->ra_pages);
+	blk_queue_io_opt(dc->disk.disk->queue,
+		max(queue_io_opt(dc->disk.disk->queue), queue_io_opt(q)));
 
 	atomic_set(&dc->io_errors, 0);
 	dc->io_disable = false;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
