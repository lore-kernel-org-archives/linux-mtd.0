Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DA0C47088
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t46uJX3U+dVLOlrY2anOSIn5g77znAiI0ttd72sw0D4=; b=PSipS1RC1EF56U
	7fqW2aRL3gRDmOD2tv2fdQb8juvuVAneguyWrwsBwX+1IaNhCO9UxaiXk8nUXVIZA/7SnyLcUwQDd
	6ASx1IVrCuBQs99U3VysSDLJiEuz6+zS/S3wlDQYFDN6/wMijI5OjF2qT3jaZMEWXelw3IWK/5Ofs
	OFJoyVw9nMYXjEn/Q+QGovAnHaBww+7JHpocmkFg93MqbdX4xcPFjByLSHTbggUnXm4eb+6rep9UB
	XbSlkvxd0sZ6kXj/hPjL6zXmv6FtSweNCUgm75v1j1Hb0+R79XYJkJwwoGxEgK2C2BONEVPMLa/Rk
	JRPGR6UCQBxvf/UjqcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r9G-00B99f-Hf; Thu, 01 Dec 2022 21:31:14 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r63-00B8gE-MU
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 21:27:56 +0000
Received: by mail-qt1-x82a.google.com with SMTP id l15so2669508qtv.4
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=3CXh/w9VqvcrpteYx9ZB6drtCGMaYRyRN3VkzHIHJUjgctE/YIBhqFIb1Q8LDz2obG
         03sUPuMoq04AewWPt24FcyfTfGVob9U1O5iUUfZXHA+VJQ76jR3N2w7aERMHjFA3PMw3
         bwA5ZBI30wBg4Vvgz3HKRXFYqWdXRnK/17ml4D7Oa344Tvlrd73XcEaLHszpAOkw4KWJ
         waTX2CZoNpddDf02/2M4qEcqBrCFxf6a0YiQcq1ZXuRcSqRAQqkyW66jyw3NgqdprRi5
         nQ+dGC9UwbsUp0bnoliqhRM7jD5JzprvH4CIN8ixgoiw6sArPUNONhgXPNAgXhSSbQtk
         lpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=LY7gQ1mcd94o+QNbv5mX7WB1fW5nMAxbgZd1bS2dQAKfROsoKESHVBYM0t1QOzr9Ck
         tYADuPF6G6QGjUp5EpI6YZiR/qJzMM91RnnwwBF1e7fT+fuiK/8AOGvGovYBamudSGkE
         orbB3I/ikMQl3pyG48KDBieowaBfyBUAdTg5WC3jd4EPefPoEU6tJA7Lm4B55tB2Wt/z
         ZAF99xfU9wqQlindlhiRv3erGPtsGV8moIGO5VbB1jHVgpdq0cCRiDGoNFMxTUrJKrOx
         uo9L/DNbeCBpJXWKiuIeC41Z4GX6mSWbjN2TK3A4of/D56yfbU5U/2VB77nSw6xzAEd4
         kIGw==
X-Gm-Message-State: ANoB5pmuUvK4u53bFPW1ckleKFtxOq8aTlxcrZNVVXaG93i1SOTMQqMM
	0mCANb2VdP/SMA/aTWj+8NVtbg==
X-Google-Smtp-Source: AA0mqf6szy4I7PVwPg1bZSQuN0IPneSUTPM6WK5Q36vfQp5jcMHNA+3GVZJuPY4CohsqFf7kF3h+Pg==
X-Received: by 2002:a37:6d7:0:b0:6fc:a68a:64b8 with SMTP id 206-20020a3706d7000000b006fca68a64b8mr3852069qkg.341.1669930074446;
        Thu, 01 Dec 2022 13:27:54 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id l15-20020a37f90f000000b006fc447eebe5sm4071321qkj.27.2022.12.01.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:27:54 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/3] mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with new octal modes as per JEDEC JESD216F
Date: Thu,  1 Dec 2022 16:27:48 -0500
Message-Id: <20221201212750.267721-2-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201212750.267721-1-nathan.morrison@timesys.com>
References: <20221201212750.267721-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_132755_738311_E15D4BD1 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

This adds the new bit fields for
reading: 1S-1S-8S, 1S-8S-8S, 1D-8D-8D
programming: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/sfdp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..e4e87815ba94 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -953,11 +953,16 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
 		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
 		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
+		{ SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
+		{ SNOR_HWCAPS_READ_1_8_8,       BIT(21) },
+		{ SNOR_HWCAPS_READ_1_8_8_DTR,   BIT(22) },
 	};
 	static const struct sfdp_4bait programs[] = {
 		{ SNOR_HWCAPS_PP,		BIT(6) },
 		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
 		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
+		{ SNOR_HWCAPS_PP_1_1_8,         BIT(23) },
+		{ SNOR_HWCAPS_PP_1_8_8,         BIT(24) },
 	};
 	static const struct sfdp_4bait erases[SNOR_ERASE_TYPE_MAX] = {
 		{ 0u /* not used */,		BIT(9) },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
