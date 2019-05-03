Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08BBC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 20:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7EB2075E
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 20:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t8IEQ7C9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7EB2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bzYbnIV5h/8vaPACGPCzfqxZkodjNc4H8Ugx0++GeG0=; b=t8IEQ7C95zFrGgzJS4UuYXfxJw
	GEJYFX6yt1lhWeeDuLAESqtzO+JcEJRHUexVMJw3PYZg0/R4mgxBrz3Y7lKu1kCWTNOMPU8tQId9k
	DIrJiygnwt8vEPo1GNaoCyOidFOQMWoJXvfwxak/dN7HHv7zJeUjRbco834VXcg/gLQgaUvjRwTid
	AZRfgQ0o8l9BAZiRvp50OU9i8uYJGHCqnx2RiMlA0iISO1s5Js+Kvrd55EEQmPJFD9ye3xgV8NMnQ
	5jMKUuAIaZ3PB1DY1LhBXVAHZKunf9ef8NqMugz8L1EW/xA3sXfKHtOG7x5ND1h0Y2GxdcBimVXwJ
	HhEUaGWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMeZB-0003Mf-Kh; Fri, 03 May 2019 20:13:57 +0000
Received: from ch3vs04.rockwellcollins.com ([205.175.226.52])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMeZ4-0003Fm-PK
 for linux-mtd@lists.infradead.org; Fri, 03 May 2019 20:13:52 +0000
Received: from ofwch3n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.226.14])
 by ch3vs04.rockwellcollins.com with ESMTP; 03 May 2019 15:13:46 -0500
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com
 [192.168.141.218])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id E6F646023E;
 Fri,  3 May 2019 15:13:45 -0500 (CDT)
From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] jffs2: Add sync to underlying mtd device when file system
 is synced
Date: Fri,  3 May 2019 15:13:38 -0500
Message-Id: <1556914418-40288-2-git-send-email-clayton.shotwell@rockwellcollins.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556914418-40288-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1556914418-40288-1-git-send-email-clayton.shotwell@rockwellcollins.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_131350_921216_AA8E2762 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, brandon.maier@rockwellcollins.com,
 marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Need to ensure the underlying flash does not cache anything even though
the file system thinks it's synced back.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 fs/jffs2/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 05d892c..4341565 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -111,6 +111,7 @@ static int jffs2_sync_fs(struct super_block *sb, int wait)
 	mutex_lock(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
 	mutex_unlock(&c->alloc_sem);
+	mtd_sync(c->mtd);
 	return 0;
 }
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
