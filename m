Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87759C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jun 2022 01:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aB5wsb2IqUmttOO4qKZTYodiFs8ssDYWGlzGGKsOjr4=; b=MK+VnQZMhiqwGO
	uF+XoXIjAdrdwUjzc0woqbABnjzmQmOjwhc6+QfTKJppjVVfgxqEeUAXIaymC79s1Xy+K+Z5S3w03
	Ybj2aWIWjGP/kQGl6/pnUzfYdVSnCcN4JZ7TzsrvjWZJfFsIrolOj7gsEzQWMKssJnoMaswL38nA8
	liwVUI/Pt+cpksfORbOGPdHpR5XwAXhhNe/01Q8qlmOLmlLO3ijTh6nWOsSKWTW6khvIZX1nwR06E
	YdM24p36iEC0YatQZmxeTrEiykDetXtGnGH7lZdM4FRKVkrJ0fTp2cosxMM90DAVEBj62Gwv3bdms
	FVcUZDSrFLforASwZ18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3otk-007wxf-Pb; Wed, 22 Jun 2022 01:11:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3otf-007wth-Aa
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2022 01:11:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id r20so788484wra.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jun 2022 18:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zIg/BRRxdkYhUPWpTwl1+aMNGlh1YT/9AIwW2tFGVlk=;
        b=AXrxQDkmAUcOCh+UdnnNbIqZOiuzmon7wk7L3jQI2qCCZA8YVEcXCRkl6ttkGrC+uD
         1oZfkW48SVoSfGaftqyfa1tYqP/kAuYxDfxuL0aEGxXysRyavyrhehp174XmhMPMTFkl
         oFDJZWSoO+PmgKaEn1KCuJP1n8oeaEB75I6zvTSqmlKyVJCeXTI/1p3fdqUBJN/mDKsm
         AueMlVSrR4rqimpS6LVne+TzC1yGsf1Z/RM20Pp7utN889Niyi6efKIXQqYU5CxnNhyy
         T3k9UtoDMSAWLWjsinDxlci6KqXUVoTycCR1v3FKsCVh2QyqqJ4JCwBfG2tQo4JSqfiG
         Nrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zIg/BRRxdkYhUPWpTwl1+aMNGlh1YT/9AIwW2tFGVlk=;
        b=3GfQck5ZSGkvaqZegFoS5l2iB463g8lrn/aU8Y+rEOouu9vsQvVpWjmH6yMVtQT1Hb
         fmFHbov8hWzdjo4nJUxWFEfyme1G4aGp27Rnn7jTElTb7dgJ8Fb+5rXETTNyZ3KlxEiU
         BhaB++lyFJkPdtZXd69WtPoDdAYIM+I1YmwPzHXKR2z3NiXu8zyYyc7v93AWXPKu0984
         xWmIA6aJE5LR56Qf8ohb3Y999+i/+1hsclCBhW6khD4+oAXSeppKwVZR97UNJNd48uGh
         wRsj5zUcndOu5GZWFvOB2z516iiqu+5gsj2PxML0VaoB9B8V5Jb8RYzlCGmfkGviRL2c
         o5TA==
X-Gm-Message-State: AJIora8BZkdFX7Q3p2OggF5a3s2xeCgBzsqd2rlrppt0I9DVtuVvMic6
	GXHFaN8irmSanIgsHPRYltU=
X-Google-Smtp-Source: AGRyM1v/u5MWPXIFPc5OhGTADPYHN20NOfalAr5VlbRCN6NuUJstWYLreXzWuGpBBOaxhXwWMUMwHQ==
X-Received: by 2002:a05:6000:50:b0:21a:3d97:14fd with SMTP id k16-20020a056000005000b0021a3d9714fdmr618139wrx.685.1655860265052;
        Tue, 21 Jun 2022 18:11:05 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id x13-20020adfdd8d000000b0021b81855c1csm16560086wrl.27.2022.06.21.18.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 18:11:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] mtd: core: introduce of support for dynamic partitions
Date: Wed, 22 Jun 2022 03:06:28 +0200
Message-Id: <20220622010628.30414-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622010628.30414-1-ansuelsmth@gmail.com>
References: <20220622010628.30414-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_181107_420758_46B5E188 
X-CRM114-Status: GOOD (  20.81  )
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
parser. This is problematic for the NVMEM subsystem that requires an OF
node to detect NVMEM cells.

To fix this problem, introduce an additional logic that will try to
assign an OF node to the MTD if declared.

On MTD addition, it will be checked if the MTD has an OF node and if
not declared will check if a partition with the same label / node name is
declared in DTS. If an exact match is found, the partition dynamically
allocated by the parser will have a connected OF node.

The NVMEM subsystem will detect the OF node and register any NVMEM cells
declared statically in the DTS.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 61 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7731796024e0..e9d534b9971d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -546,6 +546,66 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	return 0;
 }
 
+static void mtd_check_of_node(struct mtd_info *mtd)
+{
+	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
+	const char *pname, *prefix = "partition-";
+	int plen, mtd_name_len, offset, prefix_len;
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
+	prefix_len = strlen(prefix);
+	mtd_name_len = strlen(mtd->name);
+
+	/* Search if a partition is defined with the same name */
+	for_each_child_of_node(partitions, mtd_dn) {
+		offset = 0;
+
+		/* Skip partition with no/wrong prefix */
+		if (!of_node_name_prefix(mtd_dn, "partition-"))
+			continue;
+
+		/* Label have priority. Check that first */
+		if (of_property_read_string(mtd_dn, "label", &pname)) {
+			of_property_read_string(mtd_dn, "name", &pname);
+			offset = prefix_len;
+		}
+
+		plen = strlen(pname) - offset;
+		if (plen == mtd_name_len &&
+		    !strncmp(mtd->name, pname + offset, plen)) {
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
@@ -651,6 +711,7 @@ int add_mtd_device(struct mtd_info *mtd)
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
