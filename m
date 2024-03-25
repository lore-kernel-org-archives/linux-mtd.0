Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91225C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp8iasjix8wNi8bM7VSt7pYJqr+XvjY6gaAHPzS/mkA=; b=hr6ahs3Pd7cBOf
	azC1VFyXD4aM5aJA+6lSPxaiC3GDGluyllw/5hE5cCebt7wIu//3XK4931ht940RaMV9cpAcRl1jo
	HqFIoMUH6NQheTjNGz5pmXVTWTcykm06tHjJgZVbRor6Af9ddEQdWILUyX0Q1xIqGG8wbVAE5tF+E
	1MeG+f0NdhzfbQMk7cN1pOmJy5g4KKZs3DU4spvgX8Xu97zHfb++e2vydmf4Fb+BmbEBy8WQpppuS
	Lr1dFj7O4dVrr2jUVfJPhjL62PwgnuR10m1hgvZOKYoIKWQIbno4RxwjDC3SPIz+TXzyOxc8lMAnC
	T7hekPFEaidjbBXTSM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohc1-0000000GlMf-2DBI;
	Mon, 25 Mar 2024 10:31:29 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohbo-0000000GlH3-06Ur
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:31:27 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d46dd5f222so51823671fa.1
        for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2024 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711362672; x=1711967472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITuIJ48ycyvFs85EZCOH/esp3dFgohObI9gAbMbkThw=;
        b=HGPZhd0vpYgwYX6CNxD0BsewFj6qXwhIOD8x+Qi84SZ/TQadBDIBv1rjGSpkgDTFFK
         yUCsJ+R7hAW86qHrbO1qm3IU5Voj/sNrnM4oFNpg1aoU0knff4tVQiHMbYMg2WLt9Xx6
         SeMZ6c21KMdrqH/6xW9EY/seLYijfSKJcrBxwZwrgzEVL//MmuH2Nq8FeuED1jqOCr8U
         BDFDIght6hND672GjFGMXk5ROfqExeF8wLkF/xDe7SX50IhEwNM7RIOlTzX/wy5J3Brk
         vvK7Nb55VuTb0mDyRIc661nVEXVkTk0Da/juCVzlwLvWLMAPov4NDUhKpXU3QbvfpxqO
         XG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362672; x=1711967472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITuIJ48ycyvFs85EZCOH/esp3dFgohObI9gAbMbkThw=;
        b=YzncpLESu5BEre5LBEW6WJrmi1jeY0i9npUBiPAMlLhC8nRoVBxGhjB66s7+Ymf1Wj
         dfP1Jp3nrzRHcEYqT7IRDP0W+GblRa9bRKWqYInLPn/gUZe3BAw0SO2uq0eErFMKHpPT
         wnoRHBAbx+9xqhFIXqxNcT98ddl9C7kb3jCuG/sUjbQnRSTXAkU4JiozbF+poriKiIW2
         qsgfLwKCaF3kuLvybPUDUSgYfaqTEEzCD5YXY1SV2jzITEeR7VXSFBNnr/bMrRShpL8Y
         d8GQu/nh10Y/c4cPrEtpWPXwc9yGN8+y5evMAtw1ZFUjG7l0bQTzvd61YHQ4WfV14k+v
         gYLw==
X-Forwarded-Encrypted: i=1; AJvYcCWYgL73hI9ZZxDFIJxFeXOXNEz5vWRlw5iWa7qdhvVvgbnuNTiATufv8plIykBw0DBZ0i7cijuP1UC8NII+vNbgNjW0bQaLB9TYpRsqJw==
X-Gm-Message-State: AOJu0YwMK6SGg1GbdWJ/tEf/KR50guY/9LO0p+YdrdAIDydW/QYQi9s4
	QA78YlH31bfluIXN6P7ULw6XJTmr6c8dmmgEVgILpDzxztWjG6S/
X-Google-Smtp-Source: AGHT+IHbEvUfaHQnzm6ZbUyi1TE0Z3wDxGxFHJpDIwcA/5e6DTkA5nfqau/NqIPKGSOLrgKUIQmStA==
X-Received: by 2002:a2e:994e:0:b0:2d4:2958:6daf with SMTP id r14-20020a2e994e000000b002d429586dafmr4358600ljj.20.1711362671784;
        Mon, 25 Mar 2024 03:31:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id be3-20020a05600c1e8300b004140e701884sm8063878wmb.22.2024.03.25.03.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:31:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: rawnand: qcom: Fix broken reset in misc_cmd_type in exec_op
Date: Mon, 25 Mar 2024 11:30:48 +0100
Message-ID: <20240325103053.24408-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325103053.24408-1-ansuelsmth@gmail.com>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_033116_105043_99D7193B 
X-CRM114-Status: GOOD (  15.25  )
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

misc_cmd_type in exec_op have multiple problems. With commit a82990c8a409
("mtd: rawnand: qcom: Add read/read_start ops in exec_op path") it was
reworked and generalized but actually dropped the handling of the
RESET_DEVICE command.

The rework itself was correct with supporting case where a single misc
command is handled, but became problematic by the addition of exiting
early if we didn't had an ERASE or an OP_PROGRAM_PAGE operation.

Add additional logic to handle the reset command and return early only
if we don't have handling for the requested command.

Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add this patch

 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 19d76e345a49..b8cff9240b28 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2815,7 +2815,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 			      host->cfg0_raw & ~(7 << CW_PER_PAGE));
 		nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
 		instrs = 3;
-	} else {
+	} else if (q_op.cmd_reg != OP_RESET_DEVICE) {
 		return 0;
 	}
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
