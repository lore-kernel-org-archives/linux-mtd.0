Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533EAC001DE
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQzqp8RqaZVUFFNTYFChjiJaqXcTot4167dYOrMXRUE=; b=uFJ+p4hvLvg5gN
	ruux8mrwkrVREq4yeMkbRNAGJXh/RiZfEPB0nlKbM9jzrbNbF03eKxW93vjN2fQevh/N25/XWrIMT
	VeAB/kFEnww/jl9qZWMoRF8DZKX+yq8c3huhCpHdo4rCOo75cQtN40fqA+9dSZVFRZeqBlbfdjB7D
	brNd+fRyRJ9WR6N7H+5bWWHsP2cnYgFdsJnClRdBA9qweEcJrWo13BRFgaovzsUWT0wrbuGOyCiSD
	tL4CUm4L2xiHY0F+KrtRn01Un2Xzc7UZNVxlKrYeWao7BqHZqYoaklrj+pjFMMwI7zAPKqJtWaNTY
	jEK0FS8acdFSdsvKV9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLII-00EOya-36;
	Sat, 05 Aug 2023 17:42:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIH-00EOwo-0U
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:26 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68730bafa6bso2826573b3a.1
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257343; x=1691862143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Sk0pPWqBxPd0LZRhqUZVkkGQlVge4WAhNj/aqE/s4Y=;
        b=r3e0kB4hxBfTtxIB0onMjnTolvvCfOWZ6jFqGifW4WvCZljrocy7UTblzz5SgbZSMV
         Tsg6Grb5tNsecdh7a3xvki0xfGCzsjstt2awTgo5qChvIy5eZZHhzs3p9ax0WcWC3Tei
         tgcyE9SjI8JNLSsZz7XZn+YlxNV9B7RczmluWvy6OA5QTxU+XnstbRxTykip1aunBR+w
         wvO3V5k/mzf7dNLhvllWENRiaYAON41uRSDRlsd3pI4/QUAx8NVDMFoRJUe9M331xiDK
         WRxJ80B9Pix7WXIMMX/Eh7wTIMNZMUz6ESVIzmjKRIGxflRDWv8dy9e9WDLjaLBsQmj/
         CLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257343; x=1691862143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Sk0pPWqBxPd0LZRhqUZVkkGQlVge4WAhNj/aqE/s4Y=;
        b=gHZuLf8OepemQFPlGTzSWQelb4uQhQObPImbSii9RcA4t9RAbl7Lq1hruJoyOQdR7u
         a2+2YxHMIWr9j2Hxy0Xm41iIGV5Jh9Ki3axRsOJ9Q5qNauaiQOFiCUJf0VQVgeA7Havc
         nAp/3MIhmUGtKx2VbHKyFGUjrezRGeSzpgn6d7XqBqs2LSug71hfNYc2uXDnPrfecHm+
         VM7kamCKzN7UJlc1p9lcmkYwk7C4NIVci55ZfuRFq2ZAzQBwAcMUZQOAXeWIVo6n929z
         OPaz8m7PsQF5vFYXIDmbiYq21N5zDIrgrO9wSLlnFUMzUTidKpiZIS5ki5A9DqShZ7oQ
         F4hw==
X-Gm-Message-State: AOJu0YzsEQzyuBqSRXRx3nF9I39TOoxJeJ0Tu7KQUEjSZXaFbAhZOxCm
	6FiVDK0/JY/U7G0nIjwRd8kh
X-Google-Smtp-Source: AGHT+IGfVwqNV2yZu3HBwsINeFiBqSoo6eDBh4XGHw3BY2S/rCtcxHL+55POlo+nJk6aFa9hHqDL5A==
X-Received: by 2002:a05:6a20:12c2:b0:12e:caac:f263 with SMTP id v2-20020a056a2012c200b0012ecaacf263mr3443189pzg.20.1691257343130;
        Sat, 05 Aug 2023 10:42:23 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:22 -0700 (PDT)
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
Subject: [PATCH 06/10] mtd: rawnand: qcom: Wrap qcom_nand_exec_op() to 80 columns
Date: Sat,  5 Aug 2023 23:11:42 +0530
Message-Id: <20230805174146.57006-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104225_187359_DE9F6D09 
X-CRM114-Status: UNSURE (   9.92  )
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

Both the function arguments and the definition could be wrapped to 80
columns to save line space.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a7a9421ef003..4f38579ae03e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3051,14 +3051,12 @@ static int qcom_check_op(struct nand_chip *chip,
 }
 
 static int qcom_nand_exec_op(struct nand_chip *chip,
-			     const struct nand_operation *op,
-			bool check_only)
+			     const struct nand_operation *op, bool check_only)
 {
 	if (check_only)
 		return qcom_check_op(chip, op);
 
-	return nand_op_parser_exec_op(chip, &qcom_op_parser,
-			op, check_only);
+	return nand_op_parser_exec_op(chip, &qcom_op_parser, op, check_only);
 }
 
 static const struct nand_controller_ops qcom_nandc_ops = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
