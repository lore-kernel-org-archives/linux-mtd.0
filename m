Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A8FC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639992087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="colvsjSo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wwgnNdAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639992087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VPmFi9keU8XXLwJ1mHvrMWnqQc9Fy1yV2x++bxjPY7Q=; b=colvsjSoFsX38m+n/d5pr2JCy
	6vlRPoDtmbLVfsPpjo7Sg0Zl7Mt1kMdmpbTvTQIFaA1vnOdNGqXl9CKcP1NZow26o03/PJT6h732j
	lvOwTi70W1OcPAbxj3uYP3qW8ydtONYqP72OGu4l+DHxVaKb/kugFXSfCJwmiClXC7eYGQKm5KZSZ
	r62rujfmtGSKe4dF9AIA5OHc8KJHHqT/mkKU9TCEx1wKZU9i43GLwFdaOk5Pkur7rOkR8IGoDKdJj
	mv3W4+NEkfM6SJsr6TXMBwfDcuP5mnY5wksfNAU5+p/3ReZjXO3lffkGS/kQM5SsKX9XmA+Qy3uJe
	0IxL9i59A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9SB-0003mj-LX; Fri, 06 Nov 2020 21:39:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9QA-0002fg-Pq
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id v5so2819214wmh.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
 b=wwgnNdAOe+PD9Q3GFnTFboZRLNCbOK5iVRKNDH4UXAYgMLHljsAHyjvrv6vbTyOCZe
 dg/K1CprVU+/O4DDaVm1Q+Yl4MJCTCuT34V0Jt4cxix4CQacddo5nu1MYPQTNDC0iMYm
 AlHrtess6Cen09LCHigFMCj5/t/4j7v/Av4gBeejtdmnwI4q0Ebxs1Q4VHxWTZlcW4e7
 7NeObc0e0V9f7epYzSlrUje8JSJM/4bE/QQXHBdt2qQVEUZWORq5pWExrJPw9MpiTo2Y
 4Cnd3lzwwtYjdxZ9ZtI4OLosLvd7QDLk27k8xoQ9yHG8uWrozz7XOhHG7f2vEZo37d3L
 HCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
 b=HGUlg5LLOTzX0OP++hXaV0pJqR90zyBzmnzGlrdooljan1z1FTjBrmW2Bc3GcpGCVE
 36ge1Jfze/IstIQeMHKSTF2q0ubslNqmI4DmL08ZsZCwa5BdivHIYuqHVG6CtvQVq17J
 WTiQdP72RHFBVUCU0xzGEcqgj6VR2Fk9HtT1QhDedGXnVCzjR+BQY26XNP4qbZt3/EOB
 0eJf0IgbyypPPDLZTT+COF5G2dH+2jkhN29wifZILr1xu9H5VHP9cTXudOwKYc0lCnfE
 ks3u07Gb55/tsjKzjK6JErxY8qvs2d5TvZsbObA4o/Mbml6ZxDMKnvKNT6ByFM2YlPOS
 MzLw==
X-Gm-Message-State: AOAM530A6TNbIYR5d6KJ8p0Irl22UlUOHJpemsQ/6SWVHa8RUz0PQ6di
 Tpbdygbu6mwZQM8CPADDOafp7w==
X-Google-Smtp-Source: ABdhPJywbY9m/AfB8+o1a2jvP+ApAocKvACDEgH2J3sDHJEx/A+oIVBnlqIrqIacyAvInCsMahP8pA==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr1687461wmc.32.1604698641856; 
 Fri, 06 Nov 2020 13:37:21 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 17/23] mtd: nand: raw: s3c2410: Add documentation for 2
 missing struct members
Date: Fri,  6 Nov 2020 21:36:49 +0000
Message-Id: <20201106213655.1838861-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163722_972333_8C8B43E1 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: linux-samsung-soc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Ben Dooks <ben@simtec.co.uk>,
 Kukjin Kim <kgene@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Correct 'controller' typo while we're at it.

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index cb2d1b4e278cb..f0a4535c812aa 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -133,7 +133,8 @@ enum s3c_nand_clk_state {
 
 /**
  * struct s3c2410_nand_info - NAND controller state.
- * @mtds: An array of MTD instances on this controoler.
+ * @controller: Base controller structure.
+ * @mtds: An array of MTD instances on this controller.
  * @platform: The platform data for this board.
  * @device: The platform device we bound to.
  * @clk: The clock resource for this controller.
@@ -145,6 +146,7 @@ enum s3c_nand_clk_state {
  * @clk_rate: The clock rate from @clk.
  * @clk_state: The current clock state.
  * @cpu_type: The exact type of this controller.
+ * @freq_transition: CPUFreq notifier block
  */
 struct s3c2410_nand_info {
 	/* mtd info */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
