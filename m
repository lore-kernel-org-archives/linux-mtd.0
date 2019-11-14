Return-Path: <SRS0=UT8Q=ZG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D841FC432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 09:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF12120709
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 09:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b1Tsx02r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF12120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QvNgtCF0gMbsEL2+5B+yrPTqHsIBuKwGK7YlTI6BBVA=; b=b1Tsx02r25P3he
	V38LdvMFkYHjb9NY3Mm1n59f+QjX9HZlJfillGtzq4cZckmtuq62yI7NT79G3emMa3OCLCXs+iSet
	iqcrnLGCmAU2seYNmzAZx5c0PLmlfavXVrerGaBrVcVJ3pNKQixGQHAwQY75RX4auteO5oc/TiNH8
	Jmc0BTitZkzG5pBCFp5JRw/KQySxmzBLP3/Tv/8vK1nOxiwDlkf9f6BDtPNv/xGWo6Y785sP9gXdA
	wyp/IfUCu3SOetc7ksLX55TYBfuaL+sRQeVC92BWIo4ZkJF4EUdzUmeKU60VIvbRMv+z4chQGLdMK
	9w6Z15Zv8Do5h3YmHX9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVBeB-0001gG-G5; Thu, 14 Nov 2019 09:42:39 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVBe8-0001b4-HZ
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2019 09:42:37 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iVBdz-0002lV-0H; Thu, 14 Nov 2019 09:42:27 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: fix indentation issue
Date: Thu, 14 Nov 2019 09:42:26 +0000
Message-Id: <20191114094226.131317-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_014236_715530_6E14E551 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of debug statements that are indented
too deeply, remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/jffs2/nodemgmt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index a7bbe879cfc3..4699a4ab519f 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -624,8 +624,8 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 					  ref->flash_offset, jeb->used_size);
 			BUG();
 		})
-			jffs2_dbg(1, "Obsoleting previously unchecked node at 0x%08x of len %x\n",
-				  ref_offset(ref), freed_len);
+		jffs2_dbg(1, "Obsoleting previously unchecked node at 0x%08x of len %x\n",
+			  ref_offset(ref), freed_len);
 		jeb->unchecked_size -= freed_len;
 		c->unchecked_size -= freed_len;
 	} else {
@@ -635,8 +635,8 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 					  ref->flash_offset, jeb->used_size);
 			BUG();
 		})
-			jffs2_dbg(1, "Obsoleting node at 0x%08x of len %#x: ",
-				  ref_offset(ref), freed_len);
+		jffs2_dbg(1, "Obsoleting node at 0x%08x of len %#x: ",
+			  ref_offset(ref), freed_len);
 		jeb->used_size -= freed_len;
 		c->used_size -= freed_len;
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
