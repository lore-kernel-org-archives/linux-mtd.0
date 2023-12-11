Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADE8C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiUmaHJejgDduRZOIeQcm+whdI+Yfq2dtAgmqrztIKA=; b=ljRrBuClNbFXbX
	6Bj8GwvkQ2tQUGSOQ5a9GHtcCXymh+gEG0wq5JKBUtpYaJTa5cl+ZdyVyTp3abDDQWwzlh+b7n7Tg
	P2QVda3Tw/1ewjzPwZFO+8ldjyS+2zimEtIIiC4j9DJyNnZrQubOqdGn9wP3pe1cIxlmI7xS4ldFm
	cQrT/kOLABFsTcqtEqpSif1S2Y7xfxepqctiJnchUvZTAM68otOXcoiBgEsDBM1yQ9Uj1hBPAAnQZ
	hemqpBOp7CQFP3eg7BK62ZnRKU0UK/jr8+ghK15cgED7PPU9JgSAdXFsv6dPPNY0TpVrsgAkwGQ9X
	yyQa8BYYCDxgzi0dnW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi0S-005M1b-2R;
	Mon, 11 Dec 2023 15:15:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgxy-0056bE-1S
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Dec 2023 14:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t+SoySiW1C40bC54rtYkpxfM3XsnS15z/LdIRjIQnjA=; b=jiCxkwN9GTvIRNHxQb7+kvveK+
	Lc3sGALQRxzjzPkcsmohUFMJy3BQpzCgM3K7VQD9DYnAWFoWznl9QCi6doaXD+9IKaC6OGnwbu9Gc
	b0hZBmcTDcjfZOGqfTlAV8tJ5wVFXzZk+kiCKyD5qvtQIs2T97de/Y1iqcOcsvJZsg5S15ydjL7PS
	AsdduD7lTqIphjm+8oAqa8DR5mfxaqNDmGdofSnX7qDhvjidlgxXIschzyOHlmdV4H3hlhSj2yK2P
	pAp/XvmW2RJyoUF+fWL0LL/hWXcGcxYhjEzDQjsrtgDcU5iM4cntDu/EYqAnCpfo/Q0QIYOQdXSPR
	vXfIIsug==;
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgxu-0086gf-1m
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 14:09:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SpkB83XNRz4f3lVt
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:08:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 641651A0895
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:08:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDX2xHyF3dl1JtxDQ--.35010S4;
	Mon, 11 Dec 2023 22:08:52 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	sth@linux.ibm.com,
	hoeppner@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	p.raghav@samsung.com,
	hare@suse.de
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v2 for-6.8/block 12/18] gfs2: use bdev api
Date: Mon, 11 Dec 2023 22:07:28 +0800
Message-Id: <20231211140728.974887-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211140552.973290-1-yukuai1@huaweicloud.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDX2xHyF3dl1JtxDQ--.35010S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyUZFWfCw1DKw45ZF1fZwb_yoW8Jw45pr
	yDAF1akF4kWrnIgaykZF4rt3WUWay8G3yxAr95Aw1YvrZrW3Wag392kF4UJF45Ja97JwsI
	ga1ayw4akr1agrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1U
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26F4UJVW0owCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUb
	Mq2tUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_140859_277846_FCD84690 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

From: Yu Kuai <yukuai3@huawei.com>

Avoid to access bd_inode directly, prepare to remove bd_inode from
block_devcie.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/gfs2/glock.c      | 2 +-
 fs/gfs2/ops_fstype.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d6bf1f8c25dc..4128a5bc4bb6 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1210,7 +1210,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 	mapping = gfs2_glock2aspace(gl);
 	if (mapping) {
                 mapping->a_ops = &gfs2_meta_aops;
-		mapping->host = s->s_bdev->bd_inode;
+		bdev_associated_mapping(s->s_bdev, mapping);
 		mapping->flags = 0;
 		mapping_set_gfp_mask(mapping, GFP_NOFS);
 		mapping->private_data = NULL;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index b108c5d26839..56ae8959b55a 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -114,7 +114,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	address_space_init_once(mapping);
 	mapping->a_ops = &gfs2_rgrp_aops;
-	mapping->host = sb->s_bdev->bd_inode;
+	bdev_associated_mapping(sb->s_bdev, mapping);
 	mapping->flags = 0;
 	mapping_set_gfp_mask(mapping, GFP_NOFS);
 	mapping->private_data = NULL;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
