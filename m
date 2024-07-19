Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37353C3DA5D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jul 2024 07:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQypFqMxr50V/3moV1KATOtMwTE+MFueMuaf8oN9bAQ=; b=iCAp4Y9etRjzc/
	+7yBK72XAVuXOtKi0kkhArzqS8ceuhQsFMhXrRxi0KarTSGIVBR+jQeLhDu6CPSQSeRuDgKRshkcW
	+L/xPti3F0nC7coMckc9b4Ul+ZgkYlziEfvJGDFcggF/SaicseYloSKm5pYohJDdfZh5nwdOe8Xit
	qzOY4tW5UkgEV8gD5629cXtPcl4YJA9ytnAonPitgsH5DGlXyll3NkaDI3/iyOeusYYLByyuI7qF7
	8sk4qxWAgNWU2DILvJXjS6VbSv4qqmFr4R/KOq7CPPiJMY/QOYNk4Oqivu94IQfGMY3VJo2AJJVTp
	eBBKWs0s3trPATOtPrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiD5-00000001wOD-2IUT;
	Fri, 19 Jul 2024 07:39:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiD2-00000001wN4-2duC
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jul 2024 07:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E350ACE1B02;
	Fri, 19 Jul 2024 07:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D358C4AF0D;
	Fri, 19 Jul 2024 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721374758;
	bh=tSlyB/cO6NE7Wr22LWyuh0vigIs77ob5HEn6B1Bv6Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=BY90NcYaqUeqX2OWpwxWjM0UK3u8wuMbSl6dHERabgv00qkUKUd8JydFFGYR23oAR
	 lZtbHju4x2Y8hnWtmixVSQ1eZr5f5Mm+Q/kB+IAkbj0/D9xPJZzmjCIGcK5YpV/uWy
	 M6eUXC9qiJvHP5B9wr9b6weGTsSlpgA2zwR0zm+dOzwV3tceSxpkjYg9G669hjbOrX
	 5cG/fuJQL2yuwhzqXM3N8X5AY+SeOoKrKK6pQQs1+60lGjVnW3V/yyYTR9So9romRn
	 d0iSgnweeRnHbcvlR7pDPmEHZTXkrJZ8I/RaQStqAju9yH4I6hZHCN/Eut1p6W8MyQ
	 K8eVSwVbw9FFg==
From: Arnd Bergmann <arnd@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ben Hutchings <ben.hutchings@mind.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Li Nan <linan122@huawei.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Jens Axboe <axboe@kernel.dk>,
	ZhaoLong Wang <wangzhaolong1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: remove __exit annotation on ubiblock_exit
Date: Fri, 19 Jul 2024 09:39:06 +0200
Message-Id: <20240719073912.2743171-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_003920_867122_8BE63E92 
X-CRM114-Status: GOOD (  11.08  )
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

Calling an __exit function from an __init function leads to undefined behavior
when the drier is built-in and the __exit functions are dropped from the
object:

WARNING: modpost: drivers/mtd/ubi/ubi: section mismatch in reference: ubi_init+0xbe (section: .init.text) -> ubiblock_exit (section: .exit.text)
ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.

Remove the now incorrect annotation.

Fixes: 72f3d3daddd7 ("mtd: ubi: Restore missing cleanup on ubi_init() failure path")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index bf7308e8ec2f..60d0155be869 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -670,7 +670,7 @@ int __init ubiblock_init(void)
 	return ret;
 }
 
-void __exit ubiblock_exit(void)
+void ubiblock_exit(void)
 {
 	ubi_unregister_volume_notifier(&ubiblock_notifier);
 	ubiblock_remove_all();
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
