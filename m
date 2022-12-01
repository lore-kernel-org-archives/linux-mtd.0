Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F87DC43217
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t46uJX3U+dVLOlrY2anOSIn5g77znAiI0ttd72sw0D4=; b=qeIVnf7zwT4rO0
	dCauR2ayDqONXO1oI8noxAsK2xmLWZvdbdGhWg2diNFWm3ilAsmYU9Lvy/ZTDR/ehoTGH58PfS3jN
	GEXVtm5KLyp8msLnahKxE6b4iCIIBf4hxFmNmwiSInWY5StO+b69dcjWkMFI1bxekjBVz9BY4PraW
	IaH4DLaERtRg1YUxkIBxbFSs4cBivgiPDnUssZghGbz/9WcHjJ7kXgZSPgysCrL11E2uNjy+eLeeB
	cfWnHAgC7DHQb/Smso1/sIV3fLeC2niB50MwWZqFnPWNxb5LByB2T5zromLiZonvei5GTN4nLifxD
	6rD0IPnsu66S0zdBO/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o7a-009YQW-3e; Thu, 01 Dec 2022 18:17:18 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0o68-009XL0-Vc
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 18:15:51 +0000
Received: by mail-qv1-xf35.google.com with SMTP id s14so1864513qvo.11
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 10:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=5PgqwlpfigOiJb+R6DBfN2Y+9M3plGn2cvcFk1q1idotxQqKkOrHK0SkEt2LX5Shny
         dg2FU1+jL3L44XsAU66mjo5stS3NmB9Iwpkkuk79rEdcNYkTIHAz++0JNbHh2CpdJTln
         mC2cKv7jG0a+94XWljJkftKcT5bYlaISFmWePF1nPtobCPxD2qpIvWx+sQYrBgk8nHFH
         pYPgp4IUNehXtKWkTOFTu9HpVjFWj4Gx6m3WWGcaEdBrnMRmysCSJZkbGlKUgyV/V4Ct
         LOHU63gedLyv18jT7qn/ArIda/DjU96SEZfNMkgnd3KY5PCVrH4i5PWQK2tNNnUY/GCv
         0LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=opKuoaim1jhE12AyxwLZLlSSUNp6X015LM9SO54I+wToDM7y5vR0BzZdb56r7m8D0l
         KlbwY6gfu90tajuNxy7UyTBbi0ZH5ILr/sgP0NN/QMc1qPGRiCxq+K9gZ7yaqhdh/Iss
         0hkQq7cQSJMmHZlQeTjk2CE6rX6fYB37PmKMHkRoeGgI9hmroW7AILnqHkJI3wpOqwuT
         mGXjUZIiADV2tfpMIy5GETv+3WcMlSvEget2JGlHCwMwMfGbd5I0XfClsGf6LJMoognu
         KtJLyYn4r+Ym3GHoSK5Z3Mh0aNfhilo4ITtFq5/vI3wttBPPeNHMh0tCuQQkplPth5ID
         WZGg==
X-Gm-Message-State: ANoB5plBQuVNS3I/uYhrNIwuGExlWdfDm11fpflrG1TYmAszl9IfzJg3
	mmAf4APwaKU0DXrdSBvaF44tOw==
X-Google-Smtp-Source: AA0mqf4RRVlUXmmFLCa0Fz6p7Ui5DTW9XDLrG2IJ35rybH3l1vfNXfWV+0JDCVGQqW36DNkNulQwxA==
X-Received: by 2002:a05:6214:3113:b0:4bb:7436:49de with SMTP id ks19-20020a056214311300b004bb743649demr42952713qvb.27.1669918544609;
        Thu, 01 Dec 2022 10:15:44 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8464c000000b003a55fe9f352sm2908912qto.64.2022.12.01.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:15:44 -0800 (PST)
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
Subject: [PATCH 1/3] mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with new octal modes as per JEDEC JESD216F
Date: Thu,  1 Dec 2022 13:15:30 -0500
Message-Id: <20221201181532.255449-2-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201181532.255449-1-nathan.morrison@timesys.com>
References: <20221201181532.255449-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_101549_253869_8CE3B1BC 
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
