Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B61C46CD4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjh4RsMGacOjfXFQeFB87EhpAreKhbhVfRKVILbViL0=; b=bc29L1HVdC9CVu
	Jz6TNoYiHfy5a5QZOWs6u9eVlW7WnjFaFKXktJE0n95QKMNtsdMUdPd7CCaHFNKTH2n/3dhgy9MDi
	PNHBCgKYwE+mCX5fbcMFOZ+sabK9oYpRKrvr0KulzvOyGAhF88T7w4F6tsN8zvJ1tOIDqVyJ6GxgE
	AKP2fA+6SNKkin/BSj6VTsaSk+rYKtkd1/0GdGQca0M53jR92HmlZFAvpFx0vN2M86KgfjR695tTV
	3wlgg/ijgGFeQFdFJGsYZL7/HpSulfO0/U+tAMOrRByR0QQKxJscDNrURicaPgDjTsgiatbuQuxcG
	kKOEFEEvkjCDP3OsUOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEv6-00289b-2U;
	Thu, 21 Dec 2023 09:00:44 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEv3-00286Y-0D
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:00:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Swkss1cTSz4f3lVM
	for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 17:00:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 747831A0180
	for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 17:00:38 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDX2Q+0_oNldxrvEA--.33944S4;
	Thu, 21 Dec 2023 17:00:38 +0800 (CST)
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
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	hare@suse.de,
	p.raghav@samsung.com
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
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v3 for-6.8/block 12/17] nilfs2: use bdev api in nilfs_attach_log_writer()
Date: Thu, 21 Dec 2023 16:58:39 +0800
Message-Id: <20231221085839.1768763-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDX2Q+0_oNldxrvEA--.33944S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1xCF4xArWfGFy7ArW3Awb_yoW3Gwc_Xr
	n5JrykWrWYqFZ3uw4DurZ0yryrA3W8Ka18Jry0kFyrGF4IyFZ5Cr1qvr45tayUursrXwn3
	W3ZrWrZ8tr1UXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j
	6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUoL
	0eDUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010041_503793_3BC2410A 
X-CRM114-Status: UNSURE (   8.06  )
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
block_device.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/nilfs2/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 55e31cc903d1..a1130e384937 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2823,7 +2823,7 @@ int nilfs_attach_log_writer(struct super_block *sb, struct nilfs_root *root)
 	if (!nilfs->ns_writer)
 		return -ENOMEM;
 
-	inode_attach_wb(nilfs->ns_bdev->bd_inode, NULL);
+	bdev_attach_wb(nilfs->ns_bdev);
 
 	err = nilfs_segctor_start_thread(nilfs->ns_writer);
 	if (unlikely(err))
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
