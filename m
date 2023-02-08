Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EA3C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zRcT2mvPsmF6xLzPureupl+3Q/s/j4XG5QaCjebxuI=; b=m22yo+yq/KAtv5
	9gBapE6dvIq3/TFUjMchnOpODgogAfvQEy07kGngXWZcn39fTeurd30bdItBctl6nPFbaa6MhJ2aS
	VOmLNzqsctWlsa5kSd5wtyqN5Dlh9J2FD1tJEgFkD3ag10sIw6qoIqckJpuRICt02wH/p1yb4uqyS
	r1F1l5tTg8mCOtU4P15kySG04Am/89q5xMxO363iyfwqEPfXpA+kj9TH7J2q/pODDdm4bSNnh1/QX
	hUa6vQXZtS1x8rfJU5NPFrIg/OBTh/uI6uNxVnsc9Qm8kbPQJvpMb37FMkRhcs/SDNaQ9zFEoV9PT
	Dz232aOhbKnSk6RyDIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPm-00EE1E-2f; Wed, 08 Feb 2023 05:54:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPj-00EDzV-JX
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id pj3so17368665pjb.1
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJvG5kOK+qu0av91FJ+Gb2HMbZOtiWaOJVL2LFZi8WI=;
        b=oKjRW9iogT9FoiH3W2XQS+0Zx20T+e6DLjo+rFADMh8FOqPeoIT5Dh7hADs1zTkQii
         3Ysj1Ht5c1oKEuOnOiNkRGTN32kp+jyNymLbZQJBmewNe+651rvsjZmFFFtxhQWdtdvD
         uEZxLPttDuLB2IrTnF9R70kloWh7VzDDjOvnWjsvOxZwcysHJyVeooFC3NaFTC72xiOL
         7aPRQIciLiz1PxxO9r6gbKezh9MN96mo2Mm5aORY8fXfxOuP7ammepYukp13z3iJX1HK
         MLUlEHYcExFflRuzii+h50b7zrj1JcSVnkoaREXpwzGgKGVxbwB4lGalNt+RBfDYy8NF
         ZIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJvG5kOK+qu0av91FJ+Gb2HMbZOtiWaOJVL2LFZi8WI=;
        b=l00o1kl++ybnbNuyATzjXinGKHWHQKbh+qdO9r82rHDoy4Tk5tbUo1CbjcwY9KE1pq
         2rLYb4avxgbDVMIy3O6gK4FgmbIdeGyuYW3DRfD1Q0lD3Nl09mAtneh1McqiZivX3veg
         h4HF91SvUQfT4NPFTS/SlpbbMgK9rnL2V189SSs2xlwCTZDwVpJOmTPX070AaNh28uR3
         mcFzpsDnX1xOQ9zdJDLzFzMA6rjKV8fe/9PO094o+D+G+2YAFxLdqcjg4b9v5BsYD4vl
         mMlNL2Tr273gEu5kV72g+t41vRU+zGMnQ2BK/F+t8o1B2XV7bgKn+A6b47/LWdbuMe87
         2AWg==
X-Gm-Message-State: AO0yUKU3UID4u0wGy+rKU6lo4L/2z+CfX9HVokwbpKNDpSxphQyl8jwq
	3CQREVq/aBCTejNnYnBmmlemOz4JPx0=
X-Google-Smtp-Source: AK7set++PqODExNwIzc/GNsXAI0JtGC+2McuQkZEnFLfXCM04xVu7SkCcxtQcCoXQEILzrJ8OsRX/Q==
X-Received: by 2002:a05:6a21:620f:b0:be:e43f:df97 with SMTP id wm15-20020a056a21620f00b000bee43fdf97mr4945098pzb.14.1675835674843;
        Tue, 07 Feb 2023 21:54:34 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:34 -0800 (PST)
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
Subject: [PATCH v2 2/8] mtd: spi-nor: sfdp: Extract volatile register offset from SCCR map
Date: Wed,  8 Feb 2023 14:53:39 +0900
Message-Id: <413aa6cf52699fd5813b7ba8bddf7eb910b91aee.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215439_664605_2CD22F3E 
X-CRM114-Status: GOOD (  12.45  )
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

The volatile register offset resides in the 1st DWORD of SCCR map. Allocate
the table and copy the offset value.

The table may be allocated when the SCCR map for multi-chip is parsed.
Since we cannot assume SCCR parse is always in ahead of SCCR multi-chip,
we need to check if the table is already allocated or not.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3acc01c3a900..e5b5776d8172 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1215,6 +1215,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 static int spi_nor_parse_sccr(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *sccr_header)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u32 *dwords, addr;
 	size_t len;
 	int ret;
@@ -1231,6 +1232,17 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
+	/* Address offset for volatile registers (die 0) */
+	if (!params->vreg_offset) {
+		params->vreg_offset = devm_kmalloc(nor->dev, sizeof(*dwords),
+						   GFP_KERNEL);
+		if (!params->vreg_offset) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+	params->vreg_offset[0] = dwords[0];
+
 	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
 		      dwords[SFDP_DWORD(22)]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
