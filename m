Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CEBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1fOxzkJDBJcCHdwHUUAUeTjEnq2j4PE57QLRlOxxwc=; b=hNd4P3Ofo+NTJS
	5T09/qRSlGrGRelLWCn7BvCQZECVGym5+1CRv97fzma2SlH4ScjTjMCXQpgsHsodYG7tEl/nPW59D
	KTvewZzjZPIximxNPZYM9AEZtdxyijCxR04VXxkjkudmDOdoHVo4TV/Cpx1ZCAgDZjeX8gPf8wBQU
	FY/lLUHWS320c6F8P2PfxM4WFWaqUc+ij+WSVWPkwdD6YmS0fOswFmp1gHe1A2QfeWiDjrj4XkEaW
	538qEosIbx39gFjonjndc40YxRwA7YUETORIAcx4cUZzHP+mqbcvghZDCiAod2N9200ugqTnFQFio
	ykuQItCXsHIBq3yUcKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFvv-001GaU-77; Thu, 24 Feb 2022 15:21:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFvZ-001GWB-4G
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 15:21:10 +0000
Received: by mail-ej1-x62d.google.com with SMTP id d10so5049880eje.10
 for <linux-mtd@lists.infradead.org>; Thu, 24 Feb 2022 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZuVEAxmh+A8QIoKXF28VboWqjl4yi9SC0NLu7C8jv84=;
 b=n3Q06AMtyRcuxRSJyhB/yrIWuWgxAFi1LbplrUxmyQN/ZgfzcCKvSQHWSmQDJo55nP
 8Epr2RLKr0und+LLk1hXJ6zP96VRQsHUKNvtk/cDri3dxKGfBmB8boSYFDQf9nqQY2cm
 nyEyP6MzXEA1BKod3YjulPtpl+AFqx79fg6JDlUmJTUWetbjJneVGrbxbnCrA96tvvq/
 Px8XPs2Pm1iwicZxkoAdO0slJAmhzwIj6zFkOTeNM1Mg5EgUxwQNQps3ACEnpxAdRD6x
 jcrTeHWKzTtnj8e+QNuBbZ3OwowpwWvQmKPUrnsO2RYIjwqHXgsEpKtbiJM8MuHxjxYh
 S1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZuVEAxmh+A8QIoKXF28VboWqjl4yi9SC0NLu7C8jv84=;
 b=AfJz1nqpTXO7XoaRNjMFj5k/+Wab1RJbMLDuTynfI8K4MWH5NUd2l1YXKSbjUmDApb
 KtAf3AvMN+UXHugmuaB+aNjfFXgUWpskHk7cFtKbdGSoCEsBQLrcXK52QlEmrleNvQN8
 KlSb9crmpdPE4VNgx3ODLROgIlXuwBunyyNplLHNSfpP1HrkTauUWDSxdTX+oWaWGlQ1
 UsmNbPx3z8/YzEkR4j6Jb61bbqcLbj8AeK7S+AGJ/nBIGfd9lArqBdQj8s50JHosACip
 7ZcagjPmn4XumLnr/bMGkVNqlDmhyVNAjsp3UBbMoxxSoDxilK3oFeAVNr81tvxqIKkf
 zskA==
X-Gm-Message-State: AOAM53224vhtdI+gSNqldinn7aZVPWc6HlGa3iBl3sxKceDiYj72PxRN
 iC5KNDT9YcD95dNEAu3EIZA=
X-Google-Smtp-Source: ABdhPJzpI29HmPXQ5CbpYZFiGvhNQ9X+Dmm0glvUDWLbhPo43pUwG74L/Lqm4wzWja6thoIHtLgFKQ==
X-Received: by 2002:a17:906:360a:b0:6b9:1f8:9cdd with SMTP id
 q10-20020a170906360a00b006b901f89cddmr2733357ejb.461.1645716067180; 
 Thu, 24 Feb 2022 07:21:07 -0800 (PST)
Received: from Ansuel-xps.localdomain ([5.170.108.128])
 by smtp.googlemail.com with ESMTPSA id x12sm1501980edv.57.2022.02.24.07.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:21:06 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC RFT PATCH v3 2/2] mtd: core: introduce of support for dynamic
 partitions
Date: Thu, 24 Feb 2022 16:20:43 +0100
Message-Id: <20220224152043.27777-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224152043.27777-1-ansuelsmth@gmail.com>
References: <20220224152043.27777-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072109_204651_C164E58F 
X-CRM114-Status: GOOD (  18.60  )
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
index 9186268d361b..80e28a288f65 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -563,6 +563,61 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
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
@@ -668,6 +723,7 @@ int add_mtd_device(struct mtd_info *mtd)
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
