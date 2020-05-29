Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9275C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 03:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD03220721
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 03:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PjaastUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD03220721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1+RU0XDLrIfBs3HM51qucK7JEgwrDWfubXQimNJxb7o=; b=PjaastUN+gJesH
	hQc6xZmfyvBST1aEeybBz7AGx0S04k9G7qu40+gYtb9oa2diwuDKZHMrY7agGNB1+ko0mE/PQDzR3
	fEGhUxyP9T4A90gBA1m2f8jVb9SDaVLORuPlpXEhtFjwRxVotLTwYaB46vBMYuDq3TOEK8S7F1mPW
	kWef+RQ3yxRFherRTTYdfb7znX9tgcC9A9Q0glJYm6MuH/ah3Jxo3eO5WF9fc4DbmzPIWWxGUpWYX
	4Jp+bntrG5VPITgmGzPvJkTZEd7OqNczlTr8FS4sKvNJz72/IfOImhuGrmlWk1Xurcdy80hhY0GRr
	siMBP1CyDwiHl3ahYFUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeVpv-0006ls-Ri; Fri, 29 May 2020 03:37:35 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeVpr-0006eA-Mz
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 03:37:33 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9DBEF28C4CD8D514F742;
 Fri, 29 May 2020 11:37:17 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.2) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 29 May 2020 11:37:13 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] jffs2: fix GC exit abnormally
Date: Fri, 29 May 2020 11:37:11 +0800
Message-ID: <20200529033711.79180-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.2]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_203731_907550_DED86F7B 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The log of this problem is:
jffs2: Error garbage collecting node at 0x***!
jffs2: No space for garbage collection. Aborting GC thread

This is because GC believe that it do nothing, so it abort.

After going over the image of jffs2, I find a scene that
can trigger this problem stably.
The scene is: there is a normal dirent node at summary-area,
but abnormal at corresponding not-summary-area with error
name_crc.

The reason that GC exit abnormally is because it find that
abnormal dirent node to GC, but when it goes to function
jffs2_add_fd_to_list, it cannot meet the condition listed
below:

if ((*prev)->nhash == new->nhash && !strcmp((*prev)->name, new->name))

So no node is marked obsolete, statistical information of
erase_block do not change, which cause GC exit abnormally.

The root cause of this problem is: we do not check the
name_crc of the abnormal dirent node with summary is enabled.

Noticed that in function jffs2_scan_dirent_node, we use
function jffs2_scan_dirty_space to deal with the dirent
node with error name_crc. So this patch add a checking
code in function read_direntry to ensure the correctness
of dirent node. If checked failed, the dirent node will
be marked obsolete so GC will pass this node and this
problem will be fixed.

Signed-off-by: Zhe Li <lizhe67@huawei.com>
---
 fs/jffs2/readinode.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index bccfc40b..d19483f 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -672,6 +672,22 @@ static inline int read_direntry(struct jffs2_sb_info *c, struct jffs2_raw_node_r
 			jffs2_free_full_dirent(fd);
 			return -EIO;
 		}
+
+#ifdef CONFIG_JFFS2_SUMMARY
+		/*
+		 * we use CONFIG_JFFS2_SUMMARY because without it, we
+		 * have checked it while mounting
+		 */
+		crc = crc32(0, fd->name, rd->nsize);
+		if (unlikely(crc != je32_to_cpu(rd->name_crc))) {
+			JFFS2_NOTICE("name CRC failed on dirent node at"
+			   "%#08x: read %#08x,calculated %#08x\n",
+			   ref_offset(ref), je32_to_cpu(rd->node_crc), crc);
+			jffs2_mark_node_obsolete(c, ref);
+			jffs2_free_full_dirent(fd);
+			return 0;
+		}
+#endif
 	}
 
 	fd->nhash = full_name_hash(NULL, fd->name, rd->nsize);
-- 
2.7.4



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
