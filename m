Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E174C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 23:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6b65WRzLAX3Nj66B9NJR8WONN6j0Bybd/BxLfSCZP4=; b=3z8s5j8ki50SMY
	gPPYzOsPEEF43OZGXggx9zjmRLi48OSLEp6lMd9x+z3qUJs8fZJZCXu8gBpPqrmnQ4oz8QbIlom8e
	CdKpL2oKfPJYMxuWGIVZGHkNu007dCoAqSYhcPX3QQIBD/rkuWZg3IAtcuNlNcaAHx57z0eMklYUp
	W1SA3lCCmHzZvZSlNPZXiZyXhzz+wKUV3iF9gaw8cXDP7nRAbT15kTdi5K/lw9xoviRE/hyiRSQv0
	dig6V9g/3rZ8Pl6CM5QMMlGKueuBtko43I+uWT8xqplKXOl0J7YxQMiZkDIBKhRiulbmUrUM0Go05
	tOZQ0UOK9nANENaBOedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrTAP-004I1I-EF; Wed, 18 May 2022 23:33:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrTAJ-004Hye-QD
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 23:33:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id j24so4809950wrb.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 16:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o3G9z8T78DTVnGIhhir4CiLyiUwFhPexNUSMPntUVWo=;
 b=cPyTooRLhSLuj4xtKEF+jqq05kUgSoP1/SoepWsIb42B23Nn+toWC9ie4Bhw5xdETM
 TGW6MNWUcosF15M5vEf9kh41fmBFqQC26h8O9sx18ZJ1tLbfLkVC1YKx4tDVRSNz0xD4
 ilIAwbgGThFwD2TGTVm6vA4nEJaXmteCdLoIj4Bpe52m6Y6YnJEKfhBZukrfrE6NJugE
 cfFLSwRHXDanuANwkl8jx+179uR0WEe7v+0LjYnFBl4uzDiNrS7kPQwk7JxDFSRPYVyS
 PeF2FPmB0VKNmau4XdHADfVmi7zY1ksyD53iYl4lETvmtpvOiMIC7Zqgi/gyGlDU4fnR
 TvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3G9z8T78DTVnGIhhir4CiLyiUwFhPexNUSMPntUVWo=;
 b=wbyGNiT9e55W90NZwHVd9ezSKmnWOKT0lZbs9S7efVOeOhm8KuhCFvvwYzk0+8VjLO
 dWzBpkDB+iVb1cnTJk03MUOppP08eaDWxH7FZ/wBSDV2BNoEu2qmn3tHDHcgNNeSKjAi
 Wc3fH/BPXRYO4eSvt12SD8OpgboYVdw3fAGNLZ2SuGdN+HXn1GKU9q1/NJLfrneqpeqt
 ikpPSiVT+1d7azqozbuUi4hehXGy4lzEr8yu7XyKKKBmiAWEBOOspYtB8vDSvt413Cj+
 wFAFbyzW/1jdDTDWutVFUIL+JcexnCLeTTOr+eDYxWhSUwmrfjlOydGm8MhpvDwT4oqf
 xhrg==
X-Gm-Message-State: AOAM5307P6ILdOGSayePMEmBYYve3LXeDAKram9x8cxfPqo5B/NYn/2x
 Shc7wn+o4l9bl0DYnyWsWI8=
X-Google-Smtp-Source: ABdhPJwyBZdPuWSVpQ3TXkUHx8UnAbrjTQmm5q5gHUpjnyDq+SevbOrKWD4RXJBrhJ0oQRGAhJVxnw==
X-Received: by 2002:a5d:6dab:0:b0:20c:84b1:5d4e with SMTP id
 u11-20020a5d6dab000000b0020c84b15d4emr1597515wrs.470.1652916793270; 
 Wed, 18 May 2022 16:33:13 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 j25-20020adfa799000000b0020d042efd11sm3217476wrc.61.2022.05.18.16.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 16:33:12 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] mtd: core: introduce of support for dynamic partitions
Date: Thu, 19 May 2022 01:32:58 +0200
Message-Id: <20220518233258.5483-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518233258.5483-1-ansuelsmth@gmail.com>
References: <20220518233258.5483-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_163315_884956_55EAB184 
X-CRM114-Status: GOOD (  19.61  )
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
