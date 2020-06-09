Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE1EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 02:10:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BC80206D5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 02:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fTZ/GcQH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BC80206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuI0ueZaTL2N21vrd5T2vitNNl91ktuPR2Venyj9+EY=; b=fTZ/GcQHHu47iu
	FzpCZbdQtA7ewPcrjw4U3607W5wryMQ9dqjFTtA2pkBnLdizMgISxoLDmeFs7sAdveMaNDaXqxdyG
	0mJrZMHQqikrXMhr8P3BJGdzBTbZm1cXhkE/c6atb0sC9APw60yB159KmAM00bUxE7FjApkJ6ly+F
	KqKdHazhx1y1Xe7lopGAkin1m45fyE8FjYW/CNIPf9uNAU8uFOXTSIvay5kp1teX6BpeiVzI4DYxC
	idy0NIY5K+Mra0xN1pr1RHUdbplLX92Z8jBAg0qix21w4FXarZDEUeNBWUViae0u/ddx6hBwKlctY
	u3k5O3Wh9InpbAEIJEqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiTiB-0007Yr-0h; Tue, 09 Jun 2020 02:09:59 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiTi7-0007Xf-FD
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2020 02:09:57 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BE9B8658380F5715FC5F;
 Tue,  9 Jun 2020 10:09:35 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.2) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 9 Jun 2020 10:09:27 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <richard.weinberger@gmail.com>
Subject: [PATCH v3] jffs2: fix jffs2 mounting failure
Date: Tue, 9 Jun 2020 10:09:27 +0800
Message-ID: <20200609020927.68460-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <CAFLxGvzZequ2JtzaVOxSst_sH7PPWpWVF5nHv=B8oxLpy=wDjw@mail.gmail.com>
References: <CAFLxGvzZequ2JtzaVOxSst_sH7PPWpWVF5nHv=B8oxLpy=wDjw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.2]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_190955_677685_3F6EFD7E 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: lizhe67@huawei.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, wangfangpeng1@huawei.com, dwmw2@infradead.org,
 chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for the advice mentioned in the email.
This is my v3 patch for this problem.

Mounting jffs2 on nand flash will get message "failed: I/O error"
with the steps listed below.
1.umount jffs2
2.erase nand flash
3.mount jffs2 on it (this mounting operation will be successful)
4.do chown or chmod to the mount point directory
5.umount jffs2
6.mount jffs2 on nand flash
After step 6, we will get message "mount ... failed: I/O error".

Typical image of this problem is like:
Empty space found from 0x00000000 to 0x008a0000
Inode node at xx, totlen 0x00000044, #ino 1, version 1, isize 0...

The reason for this mounting failure is that at the end of function
jffs2_scan_medium(), jffs2 will check the used_size and some info
of nr_blocks.If conditions are met, it will return -EIO.

The detail is that, in the steps listed above, step 4 will write
jffs2_raw_inode into flash without jffs2_raw_dirent, which will
cause that there are some jffs2_raw_inode but no jffs2_raw_dirent
on flash. This will meet the condition at the end of function
jffs2_scan_medium() and return -EIO if we umount jffs2 and mount it
again.

We notice that jffs2 add the value of c->unchecked_size if we find
an inode node while mounting. And jffs2 will never add the value of
c->unchecked_size in other situations. So this patch add one more
condition about c->unchecked_size of the judgement to fix this problem.

Signed-off-by: Zhe Li <lizhe67@huawei.com>
---
 fs/jffs2/scan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 5f7e284..db72a9d 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -261,7 +261,8 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	}
 #endif
 	if (c->nr_erasing_blocks) {
-		if ( !c->used_size && ((c->nr_free_blocks+empty_blocks+bad_blocks)!= c->nr_blocks || bad_blocks == c->nr_blocks) ) {
+		if (!c->used_size && !c->unchecked_size &&
+			((c->nr_free_blocks+empty_blocks+bad_blocks) != c->nr_blocks || bad_blocks == c->nr_blocks)) {
 			pr_notice("Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes\n");
 			pr_notice("empty_blocks %d, bad_blocks %d, c->nr_blocks %d\n",
 				  empty_blocks, bad_blocks, c->nr_blocks);
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
