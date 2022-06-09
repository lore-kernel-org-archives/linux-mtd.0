Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D94C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovT45UMqBT01KZlf9R8hXIBB05umRB3GKFD9qYsVkMg=; b=D6LKYhF7DwRD3T
	e+4pO5stSDy5a+BrL5I/NBxpGNHBaIKmF1DpGvSVMnK38CRiWYLp+ayIJPQKIxAOl8ZiCt2F0WlNv
	GZrog5/CqVey3DeAa5jWr0CNiS8FVrbF8IqF2S3itJBt1yxBnNGIKa9MtIQmYnBIf6IKdX2sxSuNl
	LSkx9fae6ADxpvWvFN6h+Q817nMIMCy9v+0bY082y3zbi4FUF7m5nEtRAg+0BQ6OJlDaNAQDifYpV
	/mGm8Rc7VFIujvwN9gSgPo7iTJRPFT9q1eoxexY7tZobEdy0JbA7tN0YDjixnS3tuMfIKe2U4ciRi
	l5ZG7+JvONO8mxOFQKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI99-0027xo-Pq; Thu, 09 Jun 2022 13:24:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI95-0027u9-69
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:24:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id o7so14168263eja.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gIwvHle+n2X1mQu/sBa72r2guouaN1SD/l3le1h2rXk=;
        b=HRky5jZwzY5xTj4BXvqGmlXLwHXe0dloHZelSAteZl3sTquOX17mNHse8P9rcxPzQv
         9r07VrAkUjEj3fpb2sFor0XUAT5h85p8EEUkfH2it2ohwW12UznZfnef7Xj5fNJwxsvi
         I77N8yvszS/xopOrwJhK3vMKorVL5bTwIf/iBuxlSDge8Ag1qlQS1qEFnn+QK4Wy/xVI
         1fH4KiujZSVR4taMC+QPc3TecMhwYg/0ADG8VMl1V50vHtXQcrBWKaeWIN5nUQVE/12s
         UJBdHM5OmS/o4oK3qy5w9dmzeDiD++Gw5Hcw9KnAgtcH5KaBsDy16M0ec+ghp13Q+PXL
         TeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gIwvHle+n2X1mQu/sBa72r2guouaN1SD/l3le1h2rXk=;
        b=DZL+zjSi5jnOrKtYtO8Zgaok7w4+m4/lkab3OKV3sEgKAEPqVkCuPzVpWt53Ffrh17
         hs0gApoaZWrZcg0x+e1NrzMvgQ4BmPrffx/guvZwMLB9IBFt6agD1eZ8s7OCzyjEzNkc
         c5KZ0jQcE3vaf07rZgZwKz1IQJQRUTNVAOGIEhdVoQl36oTHdqgfFaaH6QALXSH4/zfO
         TcBnBzADzS5+8WLqXdUgyczaHdb/xPWM/P+oOEiYc4kg9/GB63OtAjBtg4/j+v6Ex/Fp
         bBS1RqlD6I7GQr0RWCKZZJOOO/aszX9lBv2mcKYvNsLwV0iv99zZVtWbdsU/JNsY4LhL
         sDnw==
X-Gm-Message-State: AOAM533hIm8rEJk/UqJrAHSpZNRUWifmRqb6msUU2EVMxU6knGoD9QrY
	mmpYKTOR4f6iRjFEwqgKFWU=
X-Google-Smtp-Source: ABdhPJzdi6Md0ie0GOTMZr35izgM3gdVIkqtDp5YdEOZQonq9YZhxo59/FPb4+1PCMB9SDDABsbx5g==
X-Received: by 2002:a17:906:414f:b0:711:ce99:69ec with SMTP id l15-20020a170906414f00b00711ce9969ecmr19398213ejk.724.1654781055196;
        Thu, 09 Jun 2022 06:24:15 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id i2-20020a056402054200b004315050d7dfsm8360263edx.81.2022.06.09.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:24:14 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v6 1/3] mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
Date: Thu,  9 Jun 2022 15:23:42 +0200
Message-Id: <20220609132344.17548-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609132344.17548-1-ansuelsmth@gmail.com>
References: <20220609132344.17548-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_062419_242467_C2D08AE5 
X-CRM114-Status: GOOD (  13.70  )
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

Reorder qcom_nand_host to save holes in the struct.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1a77542c6d67..7fbbd3e7784c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -431,11 +431,12 @@ struct qcom_nand_controller {
  *				and reserved bytes
  * @cw_data:			the number of bytes within a codeword protected
  *				by ECC
+ * @ecc_bytes_hw:		ECC bytes used by controller hardware for this
+ *				chip
+ *
  * @use_ecc:			request the controller to use ECC for the
  *				upcoming read/write
  * @bch_enabled:		flag to tell whether BCH ECC mode is used
- * @ecc_bytes_hw:		ECC bytes used by controller hardware for this
- *				chip
  * @status:			value to be returned if NAND_CMD_STATUS command
  *				is executed
  * @last_command:		keeps track of last command on this chip. used
@@ -452,11 +453,12 @@ struct qcom_nand_host {
 	int cs;
 	int cw_size;
 	int cw_data;
-	bool use_ecc;
-	bool bch_enabled;
 	int ecc_bytes_hw;
 	int spare_bytes;
 	int bbm_size;
+
+	bool use_ecc;
+	bool bch_enabled;
 	u8 status;
 	int last_command;
 
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
