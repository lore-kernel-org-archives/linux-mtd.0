Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BEC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Feb 2022 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd8A1XcvAK/iv3X1roVYCC6f8cccrjuUXxJkmr+7I0I=; b=mtdxApmEqCebo4
	UPVzMt3FAameC1T0gNUCCwxfp4l/8QCxcH8SlatcIwIfdQvnTj6qaPK9Vrp4b0bgIFAQB44lXvBFP
	P1IjewTGLWrgLA9dIrGgjxGeKbMgN1YZbpGFDLzuNZ8PUyj/9Ac44cBdK8G+9N1NqiA8PEiHE2f7f
	+BTetDIu83PZQuNj+WZr00b/3pEyy9CZRrxAoNw32tb68kG1nVaCJpgmQnScjAlclDvEXNEC1i9qx
	KwS7trOfxnlyK3D8u+W6xIQA+XVBsVi8aQ2sD6VITaxjct0WlEMDyxS4iPhXRWPAJgM2Dky4v3yXW
	l66F2KiHz0mvucgYBIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLqBs-00202m-Tk; Sun, 20 Feb 2022 17:40:08 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLqBS-001ztF-V6
 for linux-mtd@lists.infradead.org; Sun, 20 Feb 2022 17:39:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id z22so24844483edd.1
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 09:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GWlVA6bqW04iyoIdnqOqg4FogTrKkslVGuWpN+mp7C4=;
 b=ZXPrnn5JakCpGzz+pLKO/QmYkH5Yq5OFtJpqO6BeL+Q4kbvp/64UYovG1W52RYi4fn
 eDpCk4TLyfZNORnwDqQKy2G7iB9t9veUMYYzGxfVJko/3liND8EHG36bWIADM63Tg+Cr
 4YjcguJ9Sq00cEQaKOZRfukTM/eMF8O0WeBxdWNvXT/zN8nRqWSQMV7u3IYCk1mzaH4e
 g6R4+frRdiJh9VHcL3jZrVAXCTkInUWEAupqN1nNdKrBRr+f43X3AmmXSijGYLQ7dO1b
 5t6+1dYcTWN+V4bZS1RTIvqVln13kAhW2VHiGKuBVD4W+BZgc+EBGOvT0z5SFA0BqR2m
 PCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWlVA6bqW04iyoIdnqOqg4FogTrKkslVGuWpN+mp7C4=;
 b=3P1J6+VKP9zhv2zknW9CHoJI+IDAFNkk8LcORDyzPjGiYsLUmpHEmHR8sdk2mMcSvg
 ptNrQC7ZsQNta+wsuK9RxR6Rco89J1w5gyq/yjiFORhQs0fWGh3Jbyo//+3gPzvUBc+Q
 mJCfO5UeIrisK25lK7PjYeqwe+6GYxa5E7zYOeH+pV6gyueQwQNYWdQCBb5rqzurm3TH
 5JjKr8C0DOx0HOSOx7M6vEWrdj9TLGcKpWHtTQIq0knGZpsWaJVXQfc/XFakoNTmeTnh
 AO5JINPhTdaxn7nBrW62bzbkTPgvwPL3XLAZHmqclIA8ZOmR5VydgU2yHj85Ophho5Ci
 yAuw==
X-Gm-Message-State: AOAM533sY7Ysl5rrsJGu4HkINZk69jpxpkMEbnao3S+XTTejkRw8bNBi
 ws+sraJD1MiOBCvNO75HNZE=
X-Google-Smtp-Source: ABdhPJzToGjW+8krUy2PN6oNNb9xwnTzztrk8RzYmAacrb6WIpKb8jN+PL3FBq9ejq7tL7A2N2dtoQ==
X-Received: by 2002:a50:e187:0:b0:406:fb92:80ce with SMTP id
 k7-20020a50e187000000b00406fb9280cemr17539249edl.164.1645378781006; 
 Sun, 20 Feb 2022 09:39:41 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id i5sm4416721ejo.188.2022.02.20.09.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 09:39:40 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC RFT PATCH v2 2/2] mtd: core: introduce of support for dynamic
 partitions
Date: Sun, 20 Feb 2022 18:39:05 +0100
Message-Id: <20220220173905.14165-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220173905.14165-1-ansuelsmth@gmail.com>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_093943_028333_B4900605 
X-CRM114-Status: GOOD (  17.72  )
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
 drivers/mtd/mtdcore.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9186268d361b..636b0a02f6cf 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -563,6 +563,50 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
+void mtd_check_of_node(struct mtd_info *mtd)
+{
+	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
+	struct mtd_info *parent;
+	const char *mtd_name;
+	bool found = false;
+	int plen;
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
+	partitions = of_get_compatible_child(parent_dn, "partitions");
+	if (!partitions)
+		goto exit_parent;
+
+	/* Search if a partition is defined with the same name */
+	for_each_child_of_node(partitions, mtd_dn) {
+		mtd_name = of_get_property(mtd_dn, "label", &plen);
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
@@ -668,6 +712,7 @@ int add_mtd_device(struct mtd_info *mtd)
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
