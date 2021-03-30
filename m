Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D967AC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 13:48:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A3061994
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 13:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A3061994
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnGB5+QW4Dy8aXNGHIeWuRLWdlVP1NYgWjEOCJNjn9Q=; b=TSq7s/kIAcHlg3B82O8L82L/k7
	mfmgXAl8gZcCNLi6sPMkIgtcKAh3n4uX4ZxyNlNWeBY1SvIn6M8rPO74mBZz5axrnPa5lmogjoA0Y
	EzSszc722WBipMbYAF886ldCg76CoZVMglBnKUlMN8xgS+ckPPr3+UGkQKeHjFMWCog1Du8GLBFT3
	enRQyOblAv30qY2RUixgDCZvPWjwZDgf8PEEYOYYp9xzYgUYDFNjXU2aDLUPfALYRR6TewE4maPeD
	tYhoeoyVxfT4fesKBMzewKJ465mV98V53kya0LXBDBipmxQ/5yO9SLY1RbCbvPlz1h+C1mGAOWcFS
	PfnI33ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lREix-003rb7-MA; Tue, 30 Mar 2021 13:48:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lREgw-003rKp-K4
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 13:48:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id f17so6193773plr.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 Mar 2021 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8c5509vV/LgWSAQV021ydpvF5jynvLy8ktsJyCm1QGg=;
 b=YtGQ65HJmwMcsoK2FQ3uwftOrZ8tOMHCD7th69JjUf7giIY7ec4GxAJM07/XUJIwJF
 EKAPhSn5NktRq+fBDANX5b1uCH9GqUpfq/ZQK5du9hdSAnrcbH2675KQaJ0UZ2olRp+g
 CmiYyVAh3ivxbGyMWqqpc/LN80DBzHSLHcis8NXx6Y3IBKwl5ZIuk2olQX3dW/TpXcNg
 1sJv6/nwl5FBir5bBrna2Y/gJ5dG8Q1vwTh9lkzbgc5bmyRMpv61tXpx3fRT7C5Idmz+
 711NHnl0eEO04IWfihtIVA2G7e8rObbyNRaVE0AAeEqGa/NdNshTf89tdeOOQWqOudkT
 WKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8c5509vV/LgWSAQV021ydpvF5jynvLy8ktsJyCm1QGg=;
 b=tQ+4xwSZOgZ990bTu4YkRkIgETXJLv6DtjYLuFwH5eI0oCYkORmluUFvTHGAapaYXP
 0B24V6+8zrrwm69BZIwn1z3eZUmYJzd9NasaTB3oE/2Xx2boaxse6d5jE9iKaIPP7ePP
 eWLvQSsLc5HxWzf0iQLc/DSj2de2Snn4GX+p3yXP8vAQ0y9tpiLO7a6yz9ZbyRjX/LyH
 Q6+RNUHleGfMPWG2Elh3RrWL3mfRr83paWNAB2sX0IfagFrCeOckzNdKFhwEOAp3xCc/
 kDz9khCIs7MUdeui6cLEtBkkwhnXwHpZwR/U1DX7N1CK6xefu5uukkogkosKSf4pCOaL
 PSeA==
X-Gm-Message-State: AOAM531oEs6hGTh7NvFLPRJwzqOphQ6J1csBfV7bkSRF7RGO3AffrlrN
 o/sZbnVeBRq5oQCdjDusXbA=
X-Google-Smtp-Source: ABdhPJwWDH3BQkfqOeU9t1w+ZAk375K8y/vuSEtzyEjTZ07vw37wh7R1AVhW922MDYuotjeu33+uZw==
X-Received: by 2002:a17:90a:c289:: with SMTP id
 f9mr4432939pjt.105.1617111956260; 
 Tue, 30 Mar 2021 06:45:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mr5sm2918531pjb.53.2021.03.30.06.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:45:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <keescook@chromium.org>,
 Christoph Hellwig <hch@lst.de>
Cc: "William A . Kennington III" <wak@google.com>,
 Lei YU <mine260309@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: Hook up splice_write callback
Date: Wed, 31 Mar 2021 00:15:37 +1030
Message-Id: <20210330134537.423447-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_144759_013578_CD1BCC42 
X-CRM114-Status: GOOD (  13.60  )
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

overlayfs using jffs2 as the upper filesystem would fail in some cases
since moving to v5.10. The test case used was to run 'touch' on a file
that exists in the lower fs, causing the modification time to be
updated. It returns EINVAL when the bug is triggered.

A bisection showed this was introduced in v5.9-rc1, with commit
36e2c7421f02 ("fs: don't allow splice read/write without explicit ops").
Reverting that commit restores the expected behaviour.

Some digging showed that this was due to jffs2 lacking an implementation
of splice_write. (For unknown reasons the warn_unsupported that should
trigger was not displaying any output).

Adding this patch resolved the issue and the test now passes.

Fixes: 36e2c7421f02 ("fs: don't allow splice read/write without explicit ops")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 fs/jffs2/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f8fb89b10227..4fc8cd698d1a 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -57,6 +57,7 @@ const struct file_operations jffs2_file_operations =
 	.mmap =		generic_file_readonly_mmap,
 	.fsync =	jffs2_fsync,
 	.splice_read =	generic_file_splice_read,
+	.splice_write = iter_file_splice_write,
 };
 
 /* jffs2_file_inode_operations */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
