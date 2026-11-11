Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D76606A895
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UagGSQrK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=RV65refd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Py1DVua5Qra5fIUK4hMIzTB/WyFxTThWfJrGGO34PeU=; b=UagGSQrKDj5CeuEgSmu0mknz+2
	qmSbgBRuHPxuOWMCIfLhZRwY0JAQM7X0AYIvq3R6P/n/54txHMR5XuCfpGwfrJVVcvWRdRGjparJ7
	Fa/kkf45EIdOMTSyrIh/uwuoS/MKQIaNFkMA/CMgbsdfDovJO5JPYMgm6h3AIemxA9AcOO3A0vQIm
	g/DVhNWKZ1+km2eOv5+ljsLrowE8bJfatTf/OvjuxIH/70TU2B83qVjX6yb+NxzFvn7R+pWlOUqjR
	gc58t0xITjfMGQxU5xuAZDyB8bIuXlJiKzlKGZOHXwrhSf4QKjKHj10mWj8CMdomjK6drEQPfuK/w
	+clBjI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ML-00000006f1k-29I0;
	Wed, 11 Nov 2026 12:23:25 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7MG-00000006eyG-0Gyp
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 12:23:24 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54502a173;
	Wed, 11 Nov 2026 20:23:13 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: inftl: Fix potential table leaks on mount failure
Date: Wed, 11 Nov 2026 20:23:12 +0800
Message-ID: <20261111-e5624093d6-mtd-inftl@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1ca8ff1d503a1kunm6946a0161b3668
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkMeVkIYT0MZHUhIHxhLGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=RV65refdndSdhSEzTv7hYXy4L0j59TCf18ZI7dDtW+KvpIySD0peJU9EVNfemYBjUcQGALnm45PQ9yrpZbj3ygrR/q+IHLZgqxJnJhJCwj1BeXLizhDTmV1fZqMZnCcvsg88FvJAOFpGPZz87cpOqNIIY5VhwrqRDZ8rUJCmdxQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Pcsg21/z16a9PyRylDK6hOxXDdF3iHDp63YP8jpsiko=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_042321_006333_F1568194 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the temporary ANAC table allocation fails, the unit tables allocated
by find_boot_record() are left behind when the caller frees the INFTL
record. Free both tables before returning the error.

This issue was found by our static analysis tool under development.

Fixes: 8766af935f3f ("[PATCH] check for failed kmalloc in inftlmount.c")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/mtd/inftlmount.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 87e246a6f488..841ae05bca7b 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -551,8 +551,11 @@ int INFTL_mount(struct INFTLrecord *s)
 
 	/* Temporary buffer to store ANAC numbers. */
 	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
-	if (!ANACtable)
+	if (!ANACtable) {
+		kfree(s->PUtable);
+		kfree(s->VUtable);
 		return -ENOMEM;
+	}
 
 	/*
 	 * First pass is to explore each physical unit, and construct the

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
