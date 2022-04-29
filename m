Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3072C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vF1+p8Ge57Xb8DuTuppifPBuSX1cy4gN0vwIzsV6ulE=; b=gSa79calCQkQFL
	cl1idv4+jTKfhvKDGxrA4DRSeU8Dm/xGpQv5dejVqCTQk4/1+nuU1iKzjJ8EcSX3t00z3VOngddek
	WSIqzoSouoAQ7LUxsEz3CY7STmO82SqCUFaHxuBB3VMr8LmY64F2gjkpvw9AW9mSWWrj/TIup8tyF
	I3B5Q9zRO58Wkr6qUhddSKr0YMQosr7cvU2xvpuCuH8DiZP7g1l4vGGS/iKoewiFfkMYPzyHbll2y
	RpFzcsYtJsJs73YuE7aK6+6WkMWcfJVC7MjzIfU/m6PBMKBDqiz4T0abeHO1RiwC8lT2Z2uC0X12p
	slfnzp+LQJFqG9cFF23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQ5g-00BFdF-17; Fri, 29 Apr 2022 12:51:20 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQ5U-00BFUB-KK
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 12:51:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id p4so9030314edx.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wYLNkQDRIReLtuo3nph35Lv13qW9BGvsKSf7RZPP9xg=;
 b=A62YDg43ZJFVz+Vc0gpIGYmqdZfuoXw19LxJxPOFelkvshyFVf7ot1cCaV2dhGMSOn
 mJJ53CdisMbvmESH3a1v/MpSU0FIMn3I5D9zlmrnNOGf+5Q91EdO7HdcQ9+ModUAEegb
 SgpzCXSfFCvsBnsPkrqHf6hOQ099ysfpwEAbbLXTK9hZbKufE4DAdkZ5osrU2CDfL6Qp
 yRnDXZZPkTSE51RRa7oA4hCk6H7RpI7qeY2FYPGNqEs6DP1NHVQz3tZOKPnuLUlqHrEv
 OtJxU5orp0zKXc4IlkPd/XWtw7jz4GQyRBENfOzGl82iilR4KYhJkIgEp47onw6Vyc4l
 44AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYLNkQDRIReLtuo3nph35Lv13qW9BGvsKSf7RZPP9xg=;
 b=X1LUuNzBhrtWuW1CIYWHzfWAwuvzi/utAPZlxtHssLpIv+V3RpAP8NUIQB7GOGoSxs
 ySJRG+h+shlsjeXzIvloWZSBUHYIqH1fFGzzLH/qHxJpZer3ID/gKJmYs0Yhiw3U/4Yl
 8lYxyW0ffFqU9V+HatsHrietDB/UOUi2+s5jvK+QjrYRRFx+zjkVHbPp9h77JFp+OUWe
 +LRqQmx5rr4G63rFmiGUyCaBxayEQh9K4lUUgWpnOEoGiIH3cf5eukxV4StuMwc66sGu
 Uz/yFFE6LrS2M+K7n0f+Cs5xOA909oJTRbLQXCwb70NkN7G/qee8Y1UyMOOAB0kDFeIE
 g4iQ==
X-Gm-Message-State: AOAM531V+vWEi3Iznt02p+U6uEyuLhOyhzw9+IgPhYM4QnKFpwvPRw7+
 DsewsuC+fYZJ4NWRh0G8Cdo=
X-Google-Smtp-Source: ABdhPJwD9ryKCvmVR5tY0PkuFcZhNw6EywaHCs5BHyiQ7YPCknGIaZbHuubrGmR+oMLbh9bnGyyLOQ==
X-Received: by 2002:a05:6402:3486:b0:425:f2c6:9695 with SMTP id
 v6-20020a056402348600b00425f2c69695mr24131738edc.2.1651236665223; 
 Fri, 29 Apr 2022 05:51:05 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006f3ef214e33sm615347ejc.153.2022.04.29.05.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 05:51:04 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 2/2] mtd: core: introduce of support for dynamic
 partitions
Date: Fri, 29 Apr 2022 14:48:25 +0200
Message-Id: <20220429124825.21477-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429124825.21477-1-ansuelsmth@gmail.com>
References: <20220429124825.21477-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_055108_696803_FFF433AE 
X-CRM114-Status: GOOD (  19.36  )
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

We have many parser that register mtd partitions at runtime. One example
is the cmdlinepart or the smem-part parser where the compatible is defined
in the dts and the partitions gets detected and registered by the
parser. This is problematic for the NVMEM subsystem that requires an OF node
to detect NVMEM cells.

To fix this problem, introduce an additional logic that will try to
assign an OF node to the MTD if declared.

On MTD addition, it will be checked if the MTD has an OF node and if
not declared will check if a partition with the same name / label is
declared in DTS. If an exact match is found, the partition dynamically
allocated by the parser will have a connected OF node.

The NVMEM subsystem will detect the OF node and register any NVMEM cells
declared statically in the DTS.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 56 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7731796024e0..ffca53fcc19a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -546,6 +546,61 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
+static void mtd_check_of_node(struct mtd_info *mtd)
+{
+	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
+	const char *mtd_name, *suffix = "-dynamic";
+	int plen, suffix_len = 8;
+	struct mtd_info *parent;
+	bool found = false;
+
+	/* Check if MTD already has a device node */
+	if (dev_of_node(&mtd->dev))
+		return;
+
+	/* Check if a partitions node exist */
+	parent = mtd->parent;
+	parent_dn = dev_of_node(&parent->dev);
+	if (!parent_dn)
+		return;
+
+	partitions = of_get_child_by_name(parent_dn, "partitions");
+	if (!partitions)
+		goto exit_parent;
+
+	/* Search if a partition is defined with the same name */
+	for_each_child_of_node(partitions, mtd_dn) {
+		mtd_name = of_get_property(mtd_dn, "label", &plen);
+		if (!mtd_name) {
+			mtd_name = of_get_property(mtd_dn, "name", &plen);
+
+			/* Check correct suffix */
+			if (plen <= suffix_len ||
+			    strncmp(mtd_name + plen - suffix_len, suffix, suffix_len))
+				continue;
+
+			plen = plen - suffix_len;
+		}
+
+		if (!strncmp(mtd->name, mtd_name, plen)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		goto exit_partitions;
+
+	/* Set of_node only for nvmem */
+	if (of_device_is_compatible(mtd_dn, "nvmem-cells"))
+		mtd_set_of_node(mtd, mtd_dn);
+
+exit_partitions:
+	of_node_put(partitions);
+exit_parent:
+	of_node_put(parent_dn);
+}
+
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -651,6 +706,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->dev.devt = MTD_DEVT(i);
 	dev_set_name(&mtd->dev, "mtd%d", i);
 	dev_set_drvdata(&mtd->dev, mtd);
+	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
