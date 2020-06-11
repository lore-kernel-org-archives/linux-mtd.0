Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771AAC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 05:45:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F2A2074B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 05:45:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKE2xqs9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWnloVRp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F2A2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xmQ/GUtqpLaRrQwN+oxT8S5Tx+0Gv6DAMyAwzcXx86c=; b=hKE2xqs9m8urH89eOXnMMAJ5VF
	JrIq59cgIKIo1C5Pp9qq10mce+PhuzRWcN6sjfGwHro9kE/1wSYR9cQEvKzr3uc2hrld22nSDfiw6
	GgZ5MLT7mb3z8lCKLdDVYL7Nt6gCtK9DTDIMFKs/fBkW5YIL4fvM3nMceeOPa2WH2dTnVMgY5vUF2
	wp9Ulo3VHeGrX0gnsXEvX3gyvGk/OmjrEHJP+oT8nDQAwEHLFZ9hj0TA5pBwePpUwdxcOmRnW/BuD
	ks/aoxWEF/mE087dSzkSIJah3WmkF/tWSSE2c2LSefidnuBWU74IAgO/kaqzFy2u/XwQ++RmpVkKQ
	uTheXzOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjG1j-0004ko-6M; Thu, 11 Jun 2020 05:45:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjG1V-0003Vj-LV
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 05:45:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id r15so3782619wmh.5
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2020 22:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GM23ntmkLh0x0xXXUygYPBCzInm4vRrzUCKgyJBobDo=;
 b=sWnloVRpaRtwFyMx2PlMc7a0HO+ZIZPx3+KezHYtUT52Q+GxdjgnaWYUMmNJUW1vnZ
 mL1wNmIMZNqgjx3LmiLJ9gxU57rd4P7iNagScmoIKDQukYLXvHRZPzukqGpFyjHjCtji
 siXghYbLloNdrGjYl43pzeYxkp/3xX+MnvinPCtY3unSPyMfeabDHwumR8dCLa9JdxTu
 LgAa49PFT8YJTpHDEYXT2GPYzT+UgsOt3IwU9eRlIMnGpH5iW7UwjjnVp7K6Oh7gza4H
 PWXas0L4mxC9KiDqvXKLrLfVam69YUhCUZD46GRE7KqgNTOrA3+r4VPsl4GefKbQLbgO
 uYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GM23ntmkLh0x0xXXUygYPBCzInm4vRrzUCKgyJBobDo=;
 b=eXCxq4KOFCYvgER6UpHqiYJAQuMpkiPBPwIdXFvThNxF927Il7XAeZPlIgd2Fi8Qvs
 oqnbwO+rxZScCj8cy/5lJ45DR+orQiAdzOBkAMTRr+WOOqpQctmJVHQT1TRbFruroiXY
 MndE0Rn4WFU5vcN/QmKPss0+veHlYfJ8U+dRPVggJQp+e6mp+I48FrvCzMQGdAjzdSEd
 3wC6NRBRFzcnPvr+16xyQdka0ONCu8xXK9p0rhSgZViVm76b7pfUHhzvUPQ/B4+GrSbG
 tbKjvHywMuuWzB9ru6u/xQWfbETgysq6QtFJQHgqYRCnKbHQKq2RCFa6rwkQZifJQn8d
 DKuw==
X-Gm-Message-State: AOAM530IbVhLSqRfSvTAPTU6o1YtVut4EbUwGXzb8p7Zpmk0l2c/74Ux
 AD2j+9YPkv8WEOl0CzjI1Gg=
X-Google-Smtp-Source: ABdhPJw+yB26mkquyy1l1FAMcm4KoBgZN/P2q/14vQK7wDgd7NHbQczEHRUXWyCCLzDpNTTIr1OHoQ==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr6380413wma.54.1591854306435;
 Wed, 10 Jun 2020 22:45:06 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id j16sm3492724wre.21.2020.06.10.22.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 22:45:06 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] mtd: rawnand: brcmnand: Ecc error handling on EDU
 transfers
Date: Thu, 11 Jun 2020 01:44:54 -0400
Message-Id: <20200611054454.2547-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611054454.2547-1-kdasu.kdev@gmail.com>
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_224509_717246_01C92DB8 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implemented ECC correctable and uncorrectable error handling for EDU
reads. If ECC correctable bitflips are encountered  on EDU transfer,
read page again using pio, This is needed due to a controller lmitation
where read and corrected data is not transferred to the DMA buffer on ECC
errors. This holds true for ECC correctable errors beyond set threshold.

Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0c1d6e543586..d7daa83c8a58 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1855,6 +1855,22 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	edu_writel(ctrl, EDU_STOP, 0); /* force stop */
 	edu_readl(ctrl, EDU_STOP);
 
+	if (ret == 0 && edu_cmd == EDU_CMD_READ) {
+		u64 err_addr = 0;
+
+		/*
+		 * check for ecc errors here, subpage ecc erros are
+		 * retained in ecc error addr register
+		 */
+		err_addr = brcmnand_get_uncorrecc_addr(ctrl);
+		if (!err_addr) {
+			err_addr = brcmnand_get_correcc_addr(ctrl);
+			if (err_addr)
+				ret = -EUCLEAN;
+		} else
+			ret = -EBADMSG;
+	}
+
 	return ret;
 }
 
@@ -2058,6 +2074,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	u64 err_addr = 0;
 	int err;
 	bool retry = true;
+	bool edu_read = false;
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2075,6 +2092,10 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			else
 				return -EIO;
 		}
+
+		if (has_edu(ctrl))
+			edu_read = true;
+
 	} else {
 		if (oob)
 			memset(oob, 0x99, mtd->oobsize);
@@ -2122,6 +2143,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	if (mtd_is_bitflip(err)) {
 		unsigned int corrected = brcmnand_count_corrected(ctrl);
 
+		/* in case of edu correctable error we read again using pio */
+		if (edu_read)
+			err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
+						   oob, &err_addr);
+
 		dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
 			(unsigned long long)err_addr);
 		mtd->ecc_stats.corrected += corrected;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
