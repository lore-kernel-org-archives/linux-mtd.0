Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E657C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FB823600
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yq590UZT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wHvjeKux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FB823600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jxwL2OD3PEtAOAJRuVbd87HJVq8a8R/4vX0vBhRRRGw=; b=yq590UZTLecrJT30UA0zfmY8O
	JIZDZTSQtXx2/yBFkxlhI1fYTorXKxOlm/1kHBBOCeGp072Kan5noACaxk0gTbFQom7eWB4KkunAR
	eFVXHaiXgWKJJaAydoN1u66/s9lhy0+iQDsAMUnwxj5+w9RGwUDCrUchdZNrivTVVc6UUFW1seh4E
	mI9uLGwXPJo4kxG5HyxX54tLZwMnoopJJ802grWqhcd58fs4px6WqWIc2/srzyRHtnf+YTs1LX2JX
	pdIW+mbKifvXSOQnOPx3lL3n/ew1V54nkgx5HHw+UJWabgPVq8gRydnRFIKlVZZfzVyvKqs2jMA3Q
	CdtkgmMvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ6Bh-0000ju-CF; Fri, 18 Sep 2020 02:31:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5t4-0007WO-T6
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:12:39 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B159208E4;
 Fri, 18 Sep 2020 02:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395153;
 bh=tcuUKKILO72swrjqzzeVh0J2bi9hs49yfJ+0qZsSLU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wHvjeKuxarqd2iCxL860fYoNG7zjB/FpMo25ErnbjK5q4DavUUMW/mZAh5HH1AxfJ
 ZQgCRLGK0VhqLG66q0epRGLb4MWsQooaGmHDk+5LnIfuKK0g7T6SIFPs5wGLxvMfIR
 EuXlgt0bNODYhHyVxeh7hTJgenQDSkI6nywvwens=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 011/127] mtd: cfi_cmdset_0002: don't free
 cfi->cfiq in error path of cfi_amdstd_setup()
Date: Thu, 17 Sep 2020 22:10:24 -0400
Message-Id: <20200918021220.2066485-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021220.2066485-1-sashal@kernel.org>
References: <20200918021220.2066485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_221235_292334_7CBEE9FA 
X-CRM114-Status: GOOD (  12.22  )
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
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Hou Tao <houtao1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Hou Tao <houtao1@huawei.com>

[ Upstream commit 03976af89e3bd9489d542582a325892e6a8cacc0 ]

Else there may be a double-free problem, because cfi->cfiq will
be freed by mtd_do_chip_probe() if both the two invocations of
check_cmd_set() return failure.

Signed-off-by: Hou Tao <houtao1@huawei.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1f0d83086cb09..870d1f1331b18 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -726,7 +726,6 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	kfree(mtd->eraseregions);
 	kfree(mtd);
 	kfree(cfi->cmdset_priv);
-	kfree(cfi->cfiq);
 	return NULL;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
