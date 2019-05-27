Return-Path: <SRS0=9XVy=T3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949BAC04AB3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:17:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697F220815
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxMThoaF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgGhYPxC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697F220815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=dgcf2n+3CJTBBVX/z+GnLvZY904/7GYHWh57Tsd62m4=; b=AxM
	ThoaF/YfFXqW4Kui9K7nFIKMD+n1u7PYHKJAPB8FTFcGCZn3G/frJ390tzcr7NIspXgN92uYoEt/T
	3kI1XZz0gfaseMNm06CHVO1T8aHDQCo/2mW6KWD26STMu7djPFHldSaS0VhGY4n0cRx2I1U1uy482
	Cjg9jVXJAUiBXEBih9VpWkc0bMkyJ9Yol+4skopmverK/fGhVQAHK/EVJ9dx8cbL5c652Lcufx3XL
	DFI8jgvUe8aaAYtcRBnuzWCKDILfwKbzeEyxLjwX/3dm/wrMAiBs7g9VmOIwxRo4QgUWtmto8LgHq
	6xncBdFy7DnvlKf3/7K4lVPIhwSD2sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEZG-0006vd-Q8; Mon, 27 May 2019 12:17:30 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEWt-00035J-Mn
 for linux-mtd@lists.infradead.org; Mon, 27 May 2019 12:15:13 +0000
Received: by mail-pg1-x542.google.com with SMTP id w34so4353070pga.12
 for <linux-mtd@lists.infradead.org>; Mon, 27 May 2019 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UgMa49/CXAIFVmKElCefxmiPU7Ly3jsRaFKqmaNzYxk=;
 b=dgGhYPxCcW3WWOSfXAK4cawTdNYAntuom/Q44qKYhoXSkArjRPj54mQFQf5VNb8ImT
 oLYMf+hlO3FaR3xqWS2NhU3UXe7+BpSpQzWWTWl5ku3nx/WI1vja5WxER0KxbFp+Bq0V
 VFE2Be9sIyNjEI2Z2TYE7rzNAyJyFGkcVgdqtLrpHdzXo/B//y4O4j0/oeE2XiOOkXjA
 5ItQSW504Fd3X0F9Oh/l9yj6E7ZhkFY4WAbX2HcbPVEeoJeVxF8eNhhMosChst3egUrY
 LlA39Sl7xP4d9CT96KFqxSanSqnOFiTXZVS1SZgwX4nWJHSWxJW1I8PoOS8TSWXvsl5L
 DKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UgMa49/CXAIFVmKElCefxmiPU7Ly3jsRaFKqmaNzYxk=;
 b=j1GwczEKLGui9qqmop78+lIlyz//KuOqDUwQ74zaUIrjqJzrdGBfhpaMQ/dUdepTgM
 pey4U4XcKOUzioSV6t48jm4sH3ByG1ExNdsq//zyMu4RVhyjTdj8tKBncTtYa8FK+RSY
 fQJypUeLAmYeK7GyOds3oZTBKWagGxlCopjtXk0ByGi1ZmcbcMpwAM31pca482qqy3HB
 +fqDV4CXtAE41B7d5ZMcyIBIBg6Lb9TJfz1/SmP9+qipVNE1bBwiMf1kTCavKSQiPy0H
 NFqJOU5qPzhm0M0PIrsBlM3bbJ0KZ5ms2IbJ7Ym6z3aaNRLPG7MBnEw4Ki+IbYx42SpR
 uGKg==
X-Gm-Message-State: APjAAAVN8DKZg1BSIHSbrStM/KLwNSQSZi+D7W5/SquqEnwJAKhmi34o
 w8PXVWs+NMpgRzIUPw+5uew=
X-Google-Smtp-Source: APXvYqxS2piUYDwcMVqQI47Y6BNpTk2A4nMwnH6IesVP9VwLN7wBTaTydMwaf4+U23IaB32BcCeb6g==
X-Received: by 2002:a17:90a:37ef:: with SMTP id
 v102mr31239181pjb.12.1558959302575; 
 Mon, 27 May 2019 05:15:02 -0700 (PDT)
Received: from localhost ([43.224.245.181])
 by smtp.gmail.com with ESMTPSA id r185sm13609106pfc.167.2019.05.27.05.15.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:15:01 -0700 (PDT)
From: Weitao Hou <houweitaoo@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH] mtd: remove unused value for mtdoops
Date: Mon, 27 May 2019 20:14:40 +0800
Message-Id: <20190527121440.19271-1-houweitaoo@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_051503_910485_7DDBF9D5 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: Weitao Hou <houweitaoo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

since hdr was never used, we need not reserve and init it

Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
---
 drivers/mtd/mtdoops.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index e078fc41aa61..6ae4b70ebdbb 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -191,14 +191,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
-	u32 *hdr;
 	int ret;
 
-	/* Add mtdoops header to the buffer */
-	hdr = cxt->oops_buf;
-	hdr[0] = cxt->nextcount;
-	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
-
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
 				      record_size, &retlen, cxt->oops_buf);
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
