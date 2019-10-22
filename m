Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CFBCA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 17:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67372084B
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 17:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qOtUwA9E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC8hSdWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67372084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Of1HzkHsxMqtFZFQqiJHqbbidT1tniqTiEvPFPn9gIU=; b=qOtUwA9ECjAZAl
	cRiUR+BrpsaRI3v/rYhiP5lgd/eQy8xJrkhYYjAfkm1P/7uQnVuIxpGX5pDYbXmXKSL6ugm3xFOh9
	9mqPROwkf9m2ne0j5SUEkUAhDOwHxRNxW2TXEqbc63fb8e1/arEdD533Vt91CgO09XDlpmlNmzEo0
	af0vRiIBa6CZ10xWoiFk2os4INrSBwpFQHZp106vKDCjj92GV9RTYbmQ7KJn46nSUcOJU376hV79r
	bQ3RR+q7NLtkHWqe1QMK30TkycAc6+mgEGseGQ/rVqjQd1cI0HQtLl7qoN/WruFyjS8l6/yOwEzKJ
	2RZPH8yjXtaQj4M85cgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMxVf-0007wz-Gw; Tue, 22 Oct 2019 16:59:51 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMxVc-0007wh-Pl
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2019 16:59:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id 205so11024435pfw.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2019 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyEI3OybUe/JpB2nrAxqkGTP+L7IY1d3VPpJwIesjVU=;
 b=nC8hSdWR5KoFb74MZFxFkf/ZN0L6N+S1rmae0VvJtIC502lgwxitgx6r39yQyoethf
 ryMMHPgB/11XCgQtCaw/7VbXVbLhAZvMhir1lNnGUy5Vmt0knAFkagBS2DB7smoeO0RI
 ZQ+EHASuAK9egneWGur/dZaa7grAG3VP7QRf048SdQ9+C1qiydsLnMBeMPzm4kCWwISl
 hxeGT9F2kA190jDtX8MVV8FOSTU7fttg1jmKYSlCaPAYU2p6Pj9BOtcynBATMeqfO0O6
 u2M2gPLcVuvlSyo8PqpixS1757/4MlUUUlp159onoz4/WvvNg5Rv/of8jJQuSN8kOh9r
 A9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyEI3OybUe/JpB2nrAxqkGTP+L7IY1d3VPpJwIesjVU=;
 b=Rbj6gELu6VHuE9wwQm8W+8NHuiw+2AJO/ZH6VQ1HF/p+ry1KRtg5G6Cu/GaufjnkZY
 4C3jLqwlZ1yo/4xdpVHO3z2jwcRy37IbTZ+6mcRxANkylD+Libm1HlfFYn2PIHqVSC3l
 NWiacU+yX2ry8OLLV+y6BzLga71VeMPuFNqBd/lkDkaOAnj62yNBGYUmc33u+aAd8seE
 GMlL8cfmVS5jaQhJuZSO+2uiV6GDbncYXFhiB3tWEUGiTA3y8IuOe9UjgrBTI/OQFfB0
 qHUkroafHP36g1XMnhPzGZA6a3A1AmelABRuRFkOUIASAPICnMLhOhdtpZ2IPDoYodiY
 7gvw==
X-Gm-Message-State: APjAAAVi8hq8/BTbE/5kgKmd2Es/hXT+LJ7UMi1W6m8qPgdpIKyGWYQ2
 Ul/o0+9VHhl5LQMvIK8LXUTvs2GDU80=
X-Google-Smtp-Source: APXvYqwpG6PmYv4yagCc1C2Ajjch3IoICF0k2/aiw2aa72h7iSuaVbNMWgdQ0M7GF1/axh2GuTwhcw==
X-Received: by 2002:aa7:8a84:: with SMTP id a4mr3832271pfc.99.1571763587645;
 Tue, 22 Oct 2019 09:59:47 -0700 (PDT)
Received: from P65xSA.lan ([128.199.164.101])
 by smtp.gmail.com with ESMTPSA id k23sm19339058pgi.49.2019.10.22.09.59.45
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 09:59:46 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: add support for en25qh16
Date: Wed, 23 Oct 2019 00:59:39 +0800
Message-Id: <20191022165939.9116-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_095948_837812_90182B43 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested on HiWiFi C526A

Datasheet is available at:
http://www.xinyahong.com/upLoad/product/month_1411/201411201256018276.pdf

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1d8621d..887696e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2179,6 +2179,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
 	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16,
 			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "en25qh16",   INFO(0x1c7015, 0, 64 * 1024,   32,
+			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
 	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128,
 			SECT_4K | SPI_NOR_DUAL_READ) },
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
