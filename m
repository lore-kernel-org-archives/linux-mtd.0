Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05024C001DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5m+kdlQXQIvYJGZcIk+S6OrSACdBsdfRoQa7Gouq1mg=; b=qroRYG7IJ4EMIM
	GEt+FdXE1y3Wbn1jK2LDvzU4buvWzayUi4V1oOxZry3TY9snoB2Bho0qoSpC9W3JX9nBTQOqTtj8z
	wIB/hVnnq8xjbKhXcH3lvTpgZ1spvTvkQJ5jhzWr8vKQ9jpddmCohGEozKdhM6qUDarqbv2cf+vsn
	pIEYSRQhbtd3vBqOjEYBWdfme9nqRDccLzuHO675CV4YqjYOrDyD9JhBVfcWK5j/ljUMux0Y5EU7d
	/NbAG3SV8ZcPE3sfcdr6l7Sz0nCY/JCEafXFJaQoSlLTibahPSe0DbBCyYWLSHzoaKCqgmCwQrr8S
	ZX0UrKYYUHmA5rd0TwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIW-00EP7p-1j;
	Sat, 05 Aug 2023 17:42:40 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIR-00EP2B-1H
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686e29b058cso2247338b3a.1
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257352; x=1691862152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ7ZrjoLTJ5efHJXOrPgGJNKRMjipI8+wvO528txH4s=;
        b=B7+DzBY2BMwN0TLLydmymYkwIsWR3JxW+iSLL/V0XXHiIcE3NOr18Mx0HwbSsKBhWO
         iSMn8u1sw5GfUeTPmKYFpey/hPwsfNH6CjWl5ihSCT5no007WqjK5pReXK+gZlb0WAY0
         KWbAiyuDbbu8HgDPCO7iP2Xtsrb4JM+LVllxFOk18UAS3QLkqjL99MFkl5burHWLq8Ir
         dd9XoQiNvoT4dchGITvTV03HB+KUPoGQOEGX1HBN8XR6LVkZ2PfQZpG5jXn0Bh5ciSIk
         BBuCkn1sWiwt9otxwf0K5C3sJ9ddgPDJt6mLgXI8STYQ1qbePkvSExEqvAz2MaeMIxs1
         Mrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257352; x=1691862152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ7ZrjoLTJ5efHJXOrPgGJNKRMjipI8+wvO528txH4s=;
        b=WxiYGJOCz8xaxVkbV0E0l8UNiC8H90Hyrmi+vPmdPG5jB7+fz29i9esbrrDG6y1pd5
         VmeNPbxCD8AiogOu0+zboDfdDC+3PJu6ccysg0mQIsY32dRrr8J8FhusXXzg40YVuSHb
         yXIeA9xKc05RG9q3IFS2XAsKQ1F8x4qc5WwogkappWgBCP5uLaCPuIMnjYr/cLRB8Nam
         1rYNfWB5dSYGnjgj0ctZ9Gdkc/BOR5dXk7tPsk8IxZ02R6vz/qZWN3oPN/QQn8ZXzfFP
         m0Xm/301e7bLf9tNEEm0R5xf2/z6ALQweWXaJk9TJ2QBqdaeHFae5mQLDuxtosNGHLCt
         0j0A==
X-Gm-Message-State: AOJu0YwDXX7eMSVBeUKoowTU7z2xHDXZ+cyJ47T9KssUbh67o2Pvzs9Q
	f5fcUdOmzNt4PB5Xpuax8ZIS
X-Google-Smtp-Source: AGHT+IFm4QL3fDeb80cVEsePvUuRS1mI1D46MeBn/d5FvxO7kyVdAKVt/ZJPShAB9Yhp4SDJY8pR7w==
X-Received: by 2002:a05:6a00:814:b0:687:78fc:e961 with SMTP id m20-20020a056a00081400b0068778fce961mr5558898pfk.22.1691257352461;
        Sat, 05 Aug 2023 10:42:32 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:32 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/10] mtd: rawnand: qcom: Do not override the error no of submit_descs()
Date: Sat,  5 Aug 2023 23:11:45 +0530
Message-Id: <20230805174146.57006-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104235_445771_85A2AD1E 
X-CRM114-Status: GOOD (  10.99  )
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

Just use the error no returned by submit_descs() instead of overriding it
with -EIO.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 6b81781aa3ad..0fbc6d1a558c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2140,7 +2140,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure to write oob\n");
-		return -EIO;
+		return ret;
 	}
 
 	return nand_prog_page_end_op(chip);
@@ -2216,7 +2216,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure to update BBM\n");
-		return -EIO;
+		return ret;
 	}
 
 	return nand_prog_page_end_op(chip);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
