Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCADBC04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ydXiK3wZW3taR7ahG5YmAUMQmX5Rbaw9fayPifL/KY=; b=UIpr6NvAOlTRoy
	A1Jq688babitxydXn/zm8LxYFjT67ZWyptxdr5bOlXiHaitF7aR7KXrL/dsnK6xdcgyDcCn7Ub1Dn
	8NasJOorDKv3xMnM6qDKOfmOjn7eeXp8CvrkjY7C3/+9Apt0shf6raf57CpDp9hhO/gvSzJiIxfAC
	3/2TKEPR93gVvTXRkNjkdH8DYgdBTD8LtTPlAETpndUhljHmF9ExnWU/uFaR+BBxka/WSKMjbH9XQ
	xZzTqENRxPntm942s3vXcSxI3S1nlD86G6j3Ays8T1UbIFoiXHCPrjbBeTRcjy2SIZagqTERu78H+
	buO+tfYVjzSFBLvXJvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6Wp-007qRA-2A;
	Thu, 10 Aug 2023 14:20:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6Wm-007qPu-1M
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 14:20:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B849965D87;
	Thu, 10 Aug 2023 14:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C10FC433C9;
	Thu, 10 Aug 2023 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691677239;
	bh=8zFFozZqwHjDHxSeDLIPA6Rg04SxjAKI0J794c4W9/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rR+PmONwXVxISTA+O63YKwhBGOYwh5OPz78zISGZDuab6xF6eHSAL+F22MIYdArvw
	 qQoV2aV6XaSBVR9iUw1QknspPIZwgFMTWLwnhA7+maILnEQA+61h3WbCHR6FZs+9Xs
	 uQH2kl7R/Mfh7MQZR41pvdCq9cUQo1CAW3GR21jXjlomutG5k4mob8wvd8ocSxHlPy
	 ZWonHu6Ad3ixk1TvPTohlX8sGNP2Wh7z8wVwdSQVfbq0iBAZJQ22yMmAoweeck07X9
	 Id/vADSfk5+cI90SFFFLkutV43A4bCkouEvAdsF4oO4dMpUPKHsmVOv62c1BY+byQY
	 fmeA/4lyT4a8A==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 01/17] [RESEND] jffs2: mark __jffs2_dbg_superblock_counts() static
Date: Thu, 10 Aug 2023 16:19:19 +0200
Message-Id: <20230810141947.1236730-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810141947.1236730-1-arnd@kernel.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_072040_502946_112182D2 
X-CRM114-Status: GOOD (  12.94  )
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

From: Arnd Bergmann <arnd@arndb.de>

This function is only called locally and does not need to be
global. Since there is no external prototype, gcc warns about
the non-static definition:

fs/jffs2/debug.c:160:6: error: no previous prototype for '__jffs2_dbg_superblock_counts' [-Werror=missing-prototypes]

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jffs2/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 9d26b1b9fc014..0925caab23c4b 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -157,7 +157,7 @@ __jffs2_dbg_prewrite_paranoia_check(struct jffs2_sb_info *c,
 	kfree(buf);
 }
 
-void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
+static void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
 {
 	struct jffs2_eraseblock *jeb;
 	uint32_t free = 0, dirty = 0, used = 0, wasted = 0,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
