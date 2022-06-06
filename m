Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D485C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/D0Sa/FbfcmRTHdK6a3lwRfSw60urhk3ydodxM++f8=; b=lMtp8FW8mAZJOX
	Y68p+3i4SKAeT/KtEyGdfFGKlDFbaeItAWoeeKFMTiP41tXMQvmIHICloKjrwBnNewm1I3pJ3hPjT
	ZfbilMjgCOORJwr6SIJmuRLaN+vj9nvn4t9VfLqRQkXwcEswkZvXfDSNasr0NXcIGJdGpMcVQ7OFJ
	kDRc4XWYb06CG+c+RQ2x1V7DjYa58stKzp78xVFd31Z649CfjdL62doO2Wmhfk3qceDfVsSo0pqod
	+3gJHIUD2iXw3xf6iHjTaeKAU7+4dOtUVDS2tlgR+4xqeUbaZLXMgrLSbA8XTmFXXsLNiR4EJw35o
	AjdjFpFp69msZiSb4XGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERX-001jjd-OP; Mon, 06 Jun 2022 15:14:59 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERL-001jdP-OM
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 15:14:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id bg6so9751747ejb.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GYSZo6XHpAMyhvRqkjuy1lYBsylet9wRGEIDu+7oMAg=;
        b=Sjpbo1f3mz+MDObOhOImNTpeNo2ne+Ui6zvvn7v/z35jvASMQcDf/nUUd0HRF/t/Ea
         4h8P2FFMK6drGKIuDe7GJdr4VJiUqql9Zkf5vd/qkcjzjYBEosbzEWuLOrLbtWtJTZSQ
         go1rdCHGLfc6Rtc6BxG+G5Motw9DHduYGE4PafmLUcSrSbFALoldaHcCiFu4vi+Mr2Sz
         dbKFzNplwkQu7TA9PrRtYSaK/hXBl8xLBphmb6NCeocwI6CMhlaBO8hk/x93chFTKKDY
         8kzV7kkTNyDaEkCVvOKZY3q6zuxOX2mlyAq41FsA19gzg7LN43M2Vp0WkKAaaEY0ZPwO
         +UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GYSZo6XHpAMyhvRqkjuy1lYBsylet9wRGEIDu+7oMAg=;
        b=h4s2uP1J9MwyfAKqSRlSNDSTnHnrSG5tDpWhZAbfSEZkAjpUV7IAfgHMixKawnAXVd
         aEMSrePYqd+X0yZ0dUlmNdv+zFabixYxKUmitLPuf5X9ElEjfCcGDVkdLPc/qfmmMSj9
         Y2HceSF//axqLoRhqb5xbPCRfZSnBn2wKhoTChnvCvQcbPtvKywcXGUjSApUhKrt28b+
         fgzK5PdTlaZmhOmA+CxGL3Hiq1WmStbAh5N0wH2HPkw9r3fzR5UmCyJG5KhFXFwEYj1v
         aWu6n5TExq/IBfqgES5/I9NwALsYFhfEg28775zGoIp3Z2eNhfvA77ZCIsEysKqU3o/t
         hWyw==
X-Gm-Message-State: AOAM530NGCG8pxRNkox2lQgURudnAl4E4Bn8K6rUfMEmaIR+Y3SMlcbZ
	38RWTGNw9iQuCsk8Z/ifp5Y=
X-Google-Smtp-Source: ABdhPJyUO4QhLpj5hQB1ExfVx6GyV11SpB7T0Mr7aQNaOcyQYh/tJ5wxoOy0jfL291yecIhfv8GacA==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id la17-20020a170907781100b006efa896b407mr21254860ejc.645.1654528484015;
        Mon, 06 Jun 2022 08:14:44 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id be5-20020a0564021a2500b0042e09f44f81sm7494001edb.38.2022.06.06.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:14:43 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] mtd: core: introduce of support for dynamic partitions
Date: Mon,  6 Jun 2022 17:14:17 +0200
Message-Id: <20220606151417.19227-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606151417.19227-1-ansuelsmth@gmail.com>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_081447_849631_C5F709D9 
X-CRM114-Status: GOOD (  19.90  )
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
not declared will check if a partition with the same label is
declared in DTS. If an exact match is found, the partition dynamically
allocated by the parser will have a connected OF node.

The NVMEM subsystem will detect the OF node and register any NVMEM cells
declared statically in the DTS.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 49 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7731796024e0..807194efb580 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -546,6 +546,54 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
+static void mtd_check_of_node(struct mtd_info *mtd)
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
+	partitions = of_get_child_by_name(parent_dn, "partitions");
+	if (!partitions)
+		goto exit_parent;
+
+	/* Search if a partition is defined with the same name */
+	for_each_child_of_node(partitions, mtd_dn) {
+		/* Skip partition with no label */
+		mtd_name = of_get_property(mtd_dn, "label", &plen);
+		if (!mtd_name)
+			continue;
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
@@ -651,6 +699,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->dev.devt = MTD_DEVT(i);
 	dev_set_name(&mtd->dev, "mtd%d", i);
 	dev_set_drvdata(&mtd->dev, mtd);
+	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error)
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
