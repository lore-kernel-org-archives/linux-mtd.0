Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EECEC07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 10:39:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4230361C60
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 10:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4230361C60
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:Date
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NArsytYeIqIpSpr/Yt6I064h5EA9FP1Iq9Lcydf1bmg=; b=g4R5vFyPSoXaqZ
	hcYraQXsCG/Pn1qnEP2wUeZdfnh9gDFnjDKXiqJTo7MRFC80sg6USzkav/6kt6gEOcs3LBPv4cxkv
	bsHgt3w2TxDxEhigFSqEbdW1R+voDfxnSH6+qvXkbZLFssJPPXvFa8rwRTkoOKLwwZLTbYK1/+CO8
	XS94LqaAMTQDJzklDkFdf4RowqTj6yxTKMkxh//Mx2iXTNAIzCIpC4F3Gs0r2mbo8hEqeUhI5cYJr
	6VseVdRvT8TMshXZxn3zpHQnJHoz+Jft/dqIugyrh9jfm1ckuAjbo7CIfBpa6WWXDlbyi8twJZTkx
	SVtlyDqgurkQflCDezHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m14wY-00EWF5-2X; Wed, 07 Jul 2021 10:38:14 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m14bZ-00ERXw-LC
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 10:16:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 37so1759280pgq.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jul 2021 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=bxwXK1JhMvhfFziMuDkIm/6Pgkc4I48pl3/wmyiO1HU=;
 b=Gt8bBMua7rTtklZ0VRRcAK7pOHejG8Bpg+Oe5uY6SdU/RH0+NjDYJVqyJ44BhtF+EK
 ZYL8qcelgHipZ6vgcH6Ilhrsq+40vixie3+Tai8xjV+b1nqtXr4gd59SgwQiSqP0JzEG
 hMHHW6SUzhufYFj5djbDQICOsxl2UOHlYGR0CIFDSyo6pwSpiySDehudOK7elCpHNVoO
 wHjXLbrwu5EcM2bd83Mtt7h8K7mYOTapcH5yKc73R2qR2uXw/NPdaDqhFV4FRIUER97r
 8Kz8wZ6BNxyroNsa4xP7gMM3SYO7kqSib6pkA/isgvFEt2s5CPsSeL3jSlXS/XVpjjL6
 OshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=bxwXK1JhMvhfFziMuDkIm/6Pgkc4I48pl3/wmyiO1HU=;
 b=POMz87dLqBrZ3gxnsGeM721kjebndbWKGDrktUUqb/xc3sdkgjF1ObdszyYxMUxhmW
 HaVvWfZ5zmHKgLoCtxcpSSrfHNPX8+4qlG6fy4HDsPbR4ZRNiGTSG9XXs7IH/Cu6bumg
 izvujrfUi89aB+c6jjqNy6D8NBgdlvQGAQaMCl6JIcKo/+lmA8Gkpz/DiuX3p4N2CtA5
 olFGc8fEyOe9mkE3twhBnpUWTETbUsfhhCfihKxO0ISAxoDr73yI58UdS34oQjd1UTQs
 ttrvdlF7LMZh7Yi90+LY6CwEFCTz7ES1TfPLqwzUuAG1+iJYHBNVQSwGCqMCGf0C7B3A
 zfgw==
X-Gm-Message-State: AOAM532IQXSW84de5ks38l4/9lNa9lDcWtLP3aZe8Qm9ANgAa2WctR0p
 DKx+MSvgScVObEQ6eK7VGjo=
X-Google-Smtp-Source: ABdhPJzX956HYYtupTL0hgHz+y3/uEBIxul319wDbl1MOUOejCkkbZnvxcJXzJX6srnd1YGEvKedEA==
X-Received: by 2002:a05:6a00:1508:b029:30a:2b2:b2ea with SMTP id
 q8-20020a056a001508b029030a02b2b2eamr25206318pfu.30.1625652991997; 
 Wed, 07 Jul 2021 03:16:31 -0700 (PDT)
Received: from pn10-Veriton-X4610 ([49.216.102.134])
 by smtp.gmail.com with ESMTPSA id 21sm17612139pfh.103.2021.07.07.03.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 03:16:31 -0700 (PDT)
From: Steam Lin <lstfazz@gmail.com>
X-Google-Original-From: Steam Lin <Stlin2@winbond.com>
Received: by pn10-Veriton-X4610 (Postfix, from userid 0)
 id D01AED21670; Wed,  7 Jul 2021 18:16:28 +0800 (CST)
Date: Wed, 7 Jul 2021 18:16:28 +0800
To: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd:spi-nor:Update Winbond SPI NOR Flash device ID
Message-ID: <20210707101628.GA27472@pn10-Veriton-X4610>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_031633_766572_7A26D334 
X-CRM114-Status: GOOD (  10.73  )
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

This patch is to update Winbond SPI NOR device
ID information.
Add new 3.3V and 1.8V device in the ID table.

Signed-off-by: Steam Lin <Stlin2@winbond.com>
---
 drivers/mtd/spi-nor/winbond.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9a81c67a60c6..01aa49954793 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -102,6 +102,20 @@ static const struct flash_info winbond_parts[] = {
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25h512jvm", INFO(0xef9020, 0, 64 * 1024, 1024,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q01jvq", INFO(0xef4021, 0, 64 * 1024, 2048,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q02jvq", INFO(0xef4022, 0, 64 * 1024, 4096,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25h01jvm", INFO(0xef9021, 0, 64 * 1024, 2048,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25h02jvm", INFO(0xef9022, 0, 64 * 1024, 4096,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q512nwq", INFO(0xef6020, 0, 64 * 1024, 1024,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
