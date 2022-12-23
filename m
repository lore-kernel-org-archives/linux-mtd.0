Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6D6C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3dLnpefD3aL6CJFzKf43qrnSuZnn1KppbOQKpsxC8g=; b=VpUP22mbd/LROe
	hcUdURJ/qb82CGMHEnQm3EKLtSkeaI/pTWnFtGMzQUpkdaTYEzARIl8Og4sXU6N64nrC6RmA++cLj
	Dnl1a7I1Kr2EriTNG+cuF5d9nwZ73EK5jS9MAgFXb6JhOxl0/Lbm3cQQBN+4Pf4Rnct2CW24K/rm7
	BTJUdo2H5IboJDvjg7uvZQ/c+dEvsCWETPkADOuPR6bfENE5ebKREcNEqJhRJDcacdOdUVjhBEo6N
	Oci6BaduJQJ+7v5/CSslEV6gRJaNTPrSViUB6u1uxPjm2OxMrOK2XLe0E7oLmduNxGn9UpjWGmmdR
	5Y7tFWEh8AQBZ6S9GRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNr-004jZZ-SG; Fri, 23 Dec 2022 07:22:24 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNh-004jTD-Am
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:22:14 +0000
Received: by mail-pg1-x52c.google.com with SMTP id b12so2816807pgj.6
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3T3VH8+RiQzqCwP+wL4AxdIJ6QFJSqoiV6duekIP6Y=;
        b=H5G0XBl0XAZm0/xnVqrC/TiU4T7PiNtj+WJeui5FLUJ4qBrq+Hqwu3K51sfSLbl7HT
         Ya8SgFajtjyK9+fzm0CBCm5731zfdkpf332NH81nEMIe88KmpM4S6f9/HLQCQxL4tdGE
         g0Pfma2hkjHd8WOR/bLAkKai1Nq7Hzg5b/8DyCOt6jCkTEdyAbYa/3/DYMFglz56roYC
         s2vOOjzgxMO+YwuaojfcbSr0LlO1gO0lhTcuyMIoveu/Iz4Q3cEYjGtKFE80N03Z+aD/
         uJ4APkIyy7VR4D4tZ37zAKqGoij2xfXP8d3znUM2N7HH//ZcSTv4qDmGF+bXD/DvfcbO
         kQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3T3VH8+RiQzqCwP+wL4AxdIJ6QFJSqoiV6duekIP6Y=;
        b=eU7HwIK87hbwjaybHT02gliGL35S51lrUdn9bPkIHzAiWH+tkR0u5UyxLwqsHsp+WV
         A2vlFFwHmpxvvQE9wcp8PEKtCAzqAC0v8eHUb4ra7KtiqX67u6th9WyzxXIo33xN+S+t
         uJdXcXIx9ZZt4saFSt6vSx+Z0BJqEG6WHpLq6cuhei5JCj1KRqlPgZnm2l0gLJ4S16pw
         1qa90hAkY1bictTKw5yrk5CwEgWJEmY3TTZGRJp9tnItRA44UfF78bFcXucp2XB8FeDc
         Wqx577+TvvlhQRdfwRmzlCKpsechcYjEuQG4DL1TNSzUJLeeYSbG9EHpZgQQXpBskcAN
         ZUrw==
X-Gm-Message-State: AFqh2ko/i8ItuHlOdJ2TzHCpEPKb+st0fOVhqD1gbIGS793V3cVLUEU/
	lDHozt/uPBwJLDjieltdrF7CvmYrPv8=
X-Google-Smtp-Source: AMrXdXt9HGwVCi30wGqm9OCs79tWt5IyqnmESTsc35GPzFiIoOftYDcWBYmqs/KEe5hFOzLp2kkWKQ==
X-Received: by 2002:a62:6483:0:b0:577:7cfb:a896 with SMTP id y125-20020a626483000000b005777cfba896mr7526861pfb.31.1671780130403;
        Thu, 22 Dec 2022 23:22:10 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a24-20020aa795b8000000b00576ce9ed31csm1848146pfk.56.2022.12.22.23.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 23:22:09 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 1/3] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Date: Fri, 23 Dec 2022 16:21:39 +0900
Message-Id: <d73012e2a3185d96b8a9fcd9523af54867d50e89.1671684805.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
References: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_232213_429267_38DD640A 
X-CRM114-Status: GOOD (  10.31  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Array index for SCCR 22th DOWRD should be 21.

Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 8434f654eca1..5df2fcba5483 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1228,7 +1228,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
-	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
