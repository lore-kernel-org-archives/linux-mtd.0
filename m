Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55374CCA479
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClnRHXf5tP/5g28Zps+bap+YgZErAtshr2k36RgVF04=; b=LUEYZFtkI/q+7V
	rMb2OOmUbQwigoaBt8kxxLOxXO0TdfzdvmYsa4yJWquaAGQCcR4lMvBpUcYz+hmx+nq4/ELcuclaH
	MgYT5QJICyQkV5LNUQDWJ99BXWsz9coaEDWs6xYr7Pilk8LymrvwhkkGjq9wst5m7qd+vFhImdVFn
	OP8p1VjJ4hJDQ36TJnztnSDo6RWVTDfzqHb7s0YrtPbOSsV499mSVuFqFnGKJ15Vq2/XpZ1wYS1o5
	Php28jklV4U2Y+Yj/8WE2xKTF2JXv2yRZdhv+SwWmR/AwNsADmu9GUAaRw9VYgz2Lr0Gslg4M25Xb
	ZRXLqPMA2YrV9XTuL1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OL-005vCK-T6; Tue, 28 Jun 2022 11:28:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OD-005v68-VY
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:19 +0000
Received: by mail-ej1-x633.google.com with SMTP id ge10so25096228ejb.7
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8kX3dUaWuulkCwAMYcRWq/5OXE7N5XumBNg6KTJej40=;
        b=XsIH+2HQO1P1rHXYTPerAkTGiIM2ijXN6e2a8nA1YzRXVJbepZFT2gr/QLqLOsdi+U
         R6G1p3JiVf6mXXRNy2NwloPk+XpjErzFnhr9+k90lHUa87Hw8EtMPJv2yTM0jvL5jxIy
         cg3XL87XUQuJOf2cG+9nqf5K1DHKQ+mKiVBvUSyODcI2i/WNvHG5edVqsGJ1J348XXk8
         J97p/fwJN94dnl6V9doQJxzxuZbfvkOO23QWSPDehyMLfsm/H33kznaTuk0VMa0a47k1
         4sGwUw1gascOFrbo6akRUDX+vbAX3Kwt74m+SlY72fmFvNUUh5mTVdylQ8v35dmhAqxx
         kUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8kX3dUaWuulkCwAMYcRWq/5OXE7N5XumBNg6KTJej40=;
        b=Q+mLt3uEXcEobrbzZhye830hV/+FzxRS9FNeLG7hrspgbLwc0nAANCpBicyJyepYx5
         8cXTpBJ33rB16ho+Gd/bb10f9XC33uLI39WCP/pl/n3ho3dXb0pvKCSITbbmxI8jBcsw
         aJ7lKEpDU65ee9c5gaHUA1c8RbLi5V9WVLWmY8WyybzJXPuyymwzSaD8AEKOghluO/fN
         GEJmqiDzi3k+9/9VWDgoBF3NW0rtgbuejK76zQxtlLLaX6ieFMXOrph8RDjDJ1jUQO6C
         BLBjpJJPHAz72XbjufwO5lLTp/FdHg/gvzvtWGswMkXcrfKwdcS6BkZnmTypcJylr96d
         qL6Q==
X-Gm-Message-State: AJIora8/Ie+7ISx/0gdYXDNlCe2L3ISWRrzLYXAaenCIiBSBN/P49Fny
	Vd6QpUdfie5eUlPVzpZXyyciePhYAzk=
X-Google-Smtp-Source: AGRyM1skiyvCQpAlrk4WuoP4RqWyZwZfLZtvvrUmns96lKuveEOF6JxVfQfbbceXtsM4XMNcuXhTAg==
X-Received: by 2002:a17:906:7315:b0:711:db45:af4c with SMTP id di21-20020a170906731500b00711db45af4cmr16554359ejc.412.1656415696584;
        Tue, 28 Jun 2022 04:28:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 6/8] mtd: rawnand: intel: Remove unused nand_pa member from ebu_nand_cs
Date: Tue, 28 Jun 2022 13:27:29 +0200
Message-Id: <20220628112731.2041976-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042818_036780_7CC949AD 
X-CRM114-Status: GOOD (  11.87  )
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

The nand_pa member from struct ebu_nand_cs is only written but never
read. Remove this unused and unneeded member.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 3df16d5ecae8..de4f85368988 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -106,7 +106,6 @@
 
 struct ebu_nand_cs {
 	void __iomem *chipaddr;
-	dma_addr_t nand_pa;
 	u32 addr_sel;
 };
 
@@ -626,7 +625,6 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->cs[cs].chipaddr = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ebu_host->cs[cs].chipaddr))
 		return PTR_ERR(ebu_host->cs[cs].chipaddr);
-	ebu_host->cs[cs].nand_pa = res->start;
 
 	ebu_host->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ebu_host->clk))
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
