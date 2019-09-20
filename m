Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC909C49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 06:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967D12067B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 06:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kvnxjwbU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967D12067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjmwUyzrGeQQ91LHAZWVVllGk0kQZjgE2IcXCAoSw3E=; b=kvnxjwbUgGdcKP
	nJDWIiFSu8e5Oql0eTobCD8dlVRn1SrINEDldFV7mD6sjQ+oMH4Hhj8Qmw4+A0PJTSLuIbxd5Yn5k
	Uf8XLNXPgnqpdfsYE/sg/AN5FQfMFBzfOH9+Hp8qj9JTNsb7jkvY5dpM+xXUG4GHuO7AGjly4lT8s
	KWPpuPhrRaFxiuUOiGeX3WB8bB1WtJ67vWjAcICWnVK/4h21HR9UliQC1AnY35OUA+BwyXUD2aRiq
	fpKeGS4tSjmMniwUKNsIVNPtZn+I6txbt35IPmXhrIM5J8/rAhny25344Z/2BTmo4PvyOty7Lxys0
	cMPktfk14GK9KYTgD58A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBCop-00029U-Pb; Fri, 20 Sep 2019 06:55:03 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBCom-0001jT-CW
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 06:55:01 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E8F15104D6EE93A55342;
 Fri, 20 Sep 2019 14:54:50 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 20 Sep 2019 14:54:42 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <dwmw2@infradead.org>, <dilinger@queued.net>, <richard@nod.at>,
 <houtao1@huawei.com>, <viro@zeniv.linux.org.uk>, <bbrezillon@kernel.org>,
 <daniel.santos@pobox.com>
Subject: [PATCH] jffs2:freely allocate memory when parameters are invalid
Date: Fri, 20 Sep 2019 14:54:38 +0800
Message-ID: <1568962478-126260-1-git-send-email-nixiaoming@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_235500_592360_DAD6E641 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: nixiaoming@huawei.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use kzalloc() to allocate memory in jffs2_fill_super().
Freeing memory when jffs2_parse_options() fails will cause
use-after-free and double-free in jffs2_kill_sb()

Reference: commit 92e2921f7eee6345 ("jffs2: free jffs2_sb_info through
 jffs2_kill_sb()")

This makes the code difficult to understand
the code path between memory allocation and free is too long

The reason for this problem is:
Before the jffs2_parse_options() check,
"sb->s_fs_info = c;" has been executed,
so jffs2_sb_info has been assigned to super_block.

we can move "sb->s_fs_info = c;" to the success branch of the
function jffs2_parse_options() and free jffs2_sb_info in the failure branch
make the code easier to understand.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 fs/jffs2/super.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index af4aa65..bbdae72 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -280,11 +280,13 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 
 	c->mtd = sb->s_mtd;
 	c->os_priv = sb;
-	sb->s_fs_info = c;
 
 	ret = jffs2_parse_options(c, data);
-	if (ret)
+	if (ret) {
+		kfree(c);
 		return -EINVAL;
+	}
+	sb->s_fs_info = c;
 
 	/* Initialize JFFS2 superblock locks, the further initialization will
 	 * be done later */
-- 
1.8.5.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
