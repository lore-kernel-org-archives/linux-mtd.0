Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244E8C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6oeO0aFN1Sl55YTaWK3oyx50tLrVmYxqeMTXa2sQac=; b=J3bnEqsgL2+6fn
	AAU3st9HvzV7I3WBvpRraireuiavZoa/lNXKD190FkB5qh8b70pxCE1Qob1Znp7BIViJWbERPlLWK
	qvGuAk2txuq/rmpX9pSn++m9Ah4yxl3Bozhjgx22xTnQCIT0iLBNUCxwuPo2ZThVyG7kzS4hTl0Sk
	hcT+BvugrEu4Wru4Sy/9hqPGHdeDA8kK5MVXjTDGWhS/IpgQlmjG7Mc1wT+4zQUkR52fz+jJk/fht
	wxuGiKP2uhcLPLXfOhURgzzFmbai7Mo5weQru3ZCJSlWyHiSxxbuOZuhsdBZKMDFsNotMKnr1WBU/
	VQ78060GH6dvr/AxYf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5ji-001SKP-EM; Thu, 09 Feb 2023 12:09:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jc-001SH3-Ll
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 12:09:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id u9so2552009plr.9
        for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2023 04:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0We/d0AZn2JiqqrS3ogajJuTcMdhsIMmVbPovskn+4=;
        b=UUVa9yJkTB4QQ4LxL7dU4IQqRm0olS6IrTK6lm49/+l+VjTbRBwqm+8jnd77tbgh7b
         VIzarSvEMVCxFusq9iwDCAUY89apoZAV8WjL2+ENElKmNG9gUUATBnWxlnP6D9Itd+Ia
         c/QaRju/0bHZdcJ8YiozydzoGx1ouuYfuR6H6Tdlmm+E9uGiiTqewQWEoVrYTIwVs81u
         MiwpS/CHjSMlv8dzkfwAtO2WT/f/dAvmWAkhNVDmyJuY3GqRH4Umioo+rAvlzQjapIV5
         d8uuonFnDaD4BwfCbFCu0C0Z/+05PVlfiOnV+bfmY+u9ptGAGu3gB29cnntypyNVi1Xq
         bxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0We/d0AZn2JiqqrS3ogajJuTcMdhsIMmVbPovskn+4=;
        b=b03tVTu8hd2WtImpjXtpjZGVN+W+HvMF09nzsCFWD3sOrNh99YIKi2o2jHSZP6/hlP
         nRcqxSqnSIZwsIT8nqKjFsuGz8jujS1fRdvTVduWrCueo6n9yfy+FRLDX0bcEc3GlmfM
         YoIXpFoimBPTK/nVY9SAh7dSLwckRjecNIixbOB+0jTd/LVj74X7O+LiJwk9ZId7N7dr
         iZnnD5+uVlU0+9HXjaEpm/G77at64CpzpSQLAsDWQN6wucQM74rxBOhpD5PH7RIrMntS
         ea/XoVteKeIM8zszymO7LrTB8I5DlpjJcADouv4BbubFDkukJ/uqDTmSzMmgw662wVe1
         RjNw==
X-Gm-Message-State: AO0yUKWDaV2SnD1T26rbDX/Geklc1YJ+YFd3uEj0xeVXMOADij0ZXnH9
	W6/uXSjVEifa54sTnku6rmsnrfdUwuU=
X-Google-Smtp-Source: AK7set+Wq3VSlhRGb/hctoj8/Ty3iQMVX/wBbNBUTcDdjFRa7SC46oH5bz3wPrXGxqri62RKNtQGMA==
X-Received: by 2002:a17:90b:1d02:b0:22c:8e00:1222 with SMTP id on2-20020a17090b1d0200b0022c8e001222mr12392151pjb.23.1675944542731;
        Thu, 09 Feb 2023 04:09:02 -0800 (PST)
Received: from mp600-ThinkCentre-M710t.. ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id ms15-20020a17090b234f00b00233217fa85esm449746pjb.28.2023.02.09.04.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:09:02 -0800 (PST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com
Subject: [PATCH v2 1/4] mtd: spinand: Add support continuous read mode
Date: Thu,  9 Feb 2023 20:08:50 +0800
Message-Id: <20230209120853.660564-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
References: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_040904_726255_1E5ABF18 
X-CRM114-Status: UNSURE (   9.58  )
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

The patch supports setting the "CONT" bit of the configuration
register and create spinand_continuous_read_enable/disable functions.

Signed-off-by: Jaime Liao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 11 +++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index dacd9c0e8b20..c13374933372 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,17 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static int spinand_continuous_read_enable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
+			       CFG_CONT_READ_ENABLE);
+}
+
+static int spinand_continuous_read_disable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE, 0);
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6d3392a7edc6..e98d770173dc 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -154,6 +154,7 @@
 #define REG_CFG			0xb0
 #define CFG_OTP_ENABLE		BIT(6)
 #define CFG_ECC_ENABLE		BIT(4)
+#define CFG_CONT_READ_ENABLE	BIT(2)
 #define CFG_QUAD_ENABLE		BIT(0)
 
 /* status register */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
