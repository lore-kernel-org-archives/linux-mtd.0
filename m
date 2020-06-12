Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D125EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 21:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A3B20663
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 21:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gUWsX8Zm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OplEkeIl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A3B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yJGQwfrs18iv/73n0dMUz1VGF65jSS8Chyy2ul+9p0U=; b=gUWsX8Zm1x9TeQ17/466bnlWz+
	jkTah6+GQiLlIo7QIjHP1jpTYpMjeYzuW89ZG7zBzlwJ6kM74RGlmFV1o7zqJQA5CH+JuNFfZBWef
	Bae6kCtzmcvRbkETYkUBbrUsjraGQyKEr186N3678OgOGONGQMg4h7PQ5cWxDfHvrzhoAb7Oqerul
	TdPmrizIhZuXkCBDULI2Ko0dYCuDzA8mZm3GKF3nXPvAcMYwAzyW0o2r/bylDopRif143Hnbflx6x
	jk0ZoMtBuuWhMqldLYy7LfXlS2GSiPjiK2eopi2pBYbkyXAjxbkTpbCMf6pfGPp+O4qbHV73cQCR3
	QuItHYZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjrFC-0006Kx-PY; Fri, 12 Jun 2020 21:29:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjrEu-00060F-VX
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 21:29:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id l17so9182449wmj.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2020 14:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t7sh6l2f+5trgFJapdjMKhKvmvODdJp1FD96Ciw8Ol4=;
 b=OplEkeIlZyuHSfz2NDZ2KGM+1Nyb99WWYVd73hiBSL3+vJD2Xn0C4WVNTyq+WNQh93
 QaHCI8OjUpCWhWDQyDAhbtZwAsjgjHgEzGaZn+sOlbFmkoZ6BXZwxt9N/sbpmCD8beZh
 CqhwVAK5KPdFJYP7t4eodQ18Dt3MqlnWcBg41BQFTLD+isWboFGXWhIh8WANF5SBB1Vf
 AgdodhXDa52etvebHhYCOLB9Y0d03kNpdVdeUMZgKFppNgH0RzY25moaK0lhHkruBNTR
 z8pTvAOt0twBNGtm7Q972mQULM/U/eQH+/gb/FA8d1AQN4YiMK33RLueAmgILSXzI7ob
 ezEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t7sh6l2f+5trgFJapdjMKhKvmvODdJp1FD96Ciw8Ol4=;
 b=qp8MUqoJrqVrZ/2g3yGPak40vFQo7gTzIDQk4GXfkjd4rmaLK25tTxPKWbAGJdwPla
 S1sWnJjc6W5RfyO8u7doPNT1xYZMYlW1tx4O8da0HLSLpsaUskm1OTcnqK4BxjSrH2og
 ohRXHPtoPd2dyHbfTLFYwp8YV3rumE/1uKWn0fM8vXgRjknosGye0ZQRnICq14Z86e4B
 KKqfErz59P7OsGErM0kiu3+/gkM/t0Dl92svMsLoMhqgzFr/iwdeX550kR1GKsbG+TEZ
 2Ux8o/E9mtkcRxJ8Wn0u9TBKksU28kP+7Exrh19jgT74YyEvbsAhOC/kBfHSHqVrC8MD
 P3VA==
X-Gm-Message-State: AOAM532V1fvOLWIsTg4kxh/OgWX7JN2RxCCYVGmmBYixKzAAOTGc17Xz
 xqeK49ou8dakvIUWjGk0ZDE=
X-Google-Smtp-Source: ABdhPJxQFwOtTuY9hFOELCASEz96m4UJNODfbkMBPykqB/GhLTej/gj4XR9KJ1Dmlglwp8YOjAfjCQ==
X-Received: by 2002:a1c:bd86:: with SMTP id n128mr895811wmf.5.1591997367305;
 Fri, 12 Jun 2020 14:29:27 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id n189sm10442048wmb.43.2020.06.12.14.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 14:29:26 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v2 2/2] mtd: rawnand: brcmnand: ECC error handling on EDU
 transfers
Date: Fri, 12 Jun 2020 17:29:02 -0400
Message-Id: <20200612212902.21347-3-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612212902.21347-1-kdasu.kdev@gmail.com>
References: <20200612212902.21347-1-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_142929_023890_20AA53F1 
X-CRM114-Status: GOOD (  12.94  )
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

Implement ECC correctable and uncorrectable error handling for EDU
reads. If ECC correctable bitflips are encountered on EDU transfer,
read page again using PIO. This is needed due to a NAND controller
limitation where corrected data is not transferred to the DMA buffer
on ECC error. This applies to ECC correctable errors that are reported
by the controller hardware based on set number of bitflips threshold in
the controller threshold register, bitflips below the threshold are
corrected silently and are not reported by the controller hardware.

Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0c1d6e543586..131d5d6e2626 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1855,6 +1855,22 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	edu_writel(ctrl, EDU_STOP, 0); /* force stop */
 	edu_readl(ctrl, EDU_STOP);
 
+	if (!ret && edu_cmd == EDU_CMD_READ) {
+		u64 err_addr = 0;
+
+		/*
+		 * check for ECC errors here, subpage ECC errors are
+		 * retained in ECC error address register
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
+	bool edu_err = false;
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2075,6 +2092,10 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			else
 				return -EIO;
 		}
+
+		if (has_edu(ctrl) && err_addr)
+			edu_err = true;
+
 	} else {
 		if (oob)
 			memset(oob, 0x99, mtd->oobsize);
@@ -2122,6 +2143,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	if (mtd_is_bitflip(err)) {
 		unsigned int corrected = brcmnand_count_corrected(ctrl);
 
+		/* in case of EDU correctable error we read again using PIO */
+		if (edu_err)
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
