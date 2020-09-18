Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A65C43465
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:16:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9DE2399A
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+vLu4Nb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xdAjwns8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9DE2399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fD2awzv1rZWuXYv9FBHUbbGdU0+NYpeo3HOSa+UcjCY=; b=u+vLu4NbWnxNLP76JkQN9a1W5
	QoOlaHGMf1CGSJMlwO9a6cl10tUdlXeXGlZP5pd5SY6L764Ba5Zaj4iG08x2kSXvquUTIuuS6vrrb
	ALrA9RBJKQXECttASh0fKoLHob5RtOZ6g1r/PSqkw9lKO+6O51ODhFJI4gBuACGI3GJ/3b7CjJEhR
	aMhmyniE9s1mVtLhHbvLN4uAyu+vZKtBgvCvxvfssB8cnFaWNjNIzJ3PSIItEFBI1ptUUEKKq+Gb/
	W6E0RUlrrsiJCF3hGUvSnqBXbcEW0mijbJ8YqZCpKoSYMLxNIWVmBm8Z66PvN0spkSWCbyGNIGzAM
	GCMDWZj8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5uk-0008Oz-0W; Fri, 18 Sep 2020 02:14:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5mM-0003mp-NR
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:05:39 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08419238A0;
 Fri, 18 Sep 2020 02:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394737;
 bh=P1Nxwkmp1ODADvpVBMOspS3S8Fm6UaImrkwa3DwaVEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xdAjwns8md8HN8OSUDMaETtqOk2/eVc9UTnTfSNMUW7/Bi3rtQdXsBP9e5KdLWP5S
 EETQhwAsk8IW/jTBvG/tHhym7UWWDStSlLBWCH/7K/6w5hhqRRXJn7NkmwDzZPRjVC
 DNKPxn0T36b+at1pSN3WtCyNVoaLRa1sc9SDaxpU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 218/330] ubifs: ubifs_add_orphan: Fix a memory
 leak bug
Date: Thu, 17 Sep 2020 21:59:18 -0400
Message-Id: <20200918020110.2063155-218-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220538_859601_000CAE9F 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Zhihao Cheng <chengzhihao1@huawei.com>

[ Upstream commit 927cc5cec35f01fe4f8af0ba80830a90b0533983 ]

Memory leak occurs when files with extended attributes are added to
orphan list.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Fixes: 988bec41318f3fa897e2f8 ("ubifs: orphan: Handle xattrs like files")
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ubifs/orphan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 7dd740e3692da..283f9eb48410d 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -157,7 +157,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 	int err = 0;
 	ino_t xattr_inum;
 	union ubifs_key key;
-	struct ubifs_dent_node *xent;
+	struct ubifs_dent_node *xent, *pxent = NULL;
 	struct fscrypt_name nm = {0};
 	struct ubifs_orphan *xattr_orphan;
 	struct ubifs_orphan *orphan;
@@ -181,11 +181,16 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 		xattr_inum = le64_to_cpu(xent->inum);
 
 		xattr_orphan = orphan_add(c, xattr_inum, orphan);
-		if (IS_ERR(xattr_orphan))
+		if (IS_ERR(xattr_orphan)) {
+			kfree(xent);
 			return PTR_ERR(xattr_orphan);
+		}
 
+		kfree(pxent);
+		pxent = xent;
 		key_read(c, &xent->key, &key);
 	}
+	kfree(pxent);
 
 	return 0;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
