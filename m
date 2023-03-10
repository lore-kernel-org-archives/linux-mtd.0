Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC3DC64EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O9TsV5LSUPPCjiCgAS2q0SToRpttadDfzcxj+imTIOs=; b=Iju09vWtUTESOb
	RTTxV3eQXCxMIDOvjcT5b0grLTK6Sorfp/ZYtC/ylDAtVjHRNrq/XG3CPhx/bThbqnGOHOjeUgP//
	6YqUA3L9u+b+kQ+/477vgOEAq+POqyYOGTGrL2vfk5nmxLYgWUDb1JaMPchvAEtKXHphyapqrxF8D
	3cvNV6AMc6dSJyFBFQhQi8pPhCUw5rDvUfWDq0X7Oo9ldXoP5DVXEnMNAgfcEB2f483/YLEjh8HEH
	fm9E8yUFi/2HvPRFasehAhuJH/K8XKATn0j5Hndg5/aduGKDxM17IH7aBAFZ2+n/2EO3Gfg6ugJeR
	YEbHWjRkTQpEAt6Vg9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paewQ-00F3sC-4N; Fri, 10 Mar 2023 15:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paewP-00F3rb-BV
	for linux-mtd@bombadil.infradead.org; Fri, 10 Mar 2023 15:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cJLH54G0xZR2QPR83pgINzDI6/oeVXhYquad/wYfr3w=; b=LEgTrlMhdGQ0gaRIMXtosoFnIq
	80v2DQMmp2T/5PIEUQ/ZaKnePP6aQ037nH4h/EMpwHKBjfBgTy31QV78NSKY0zWsQkIxT7ofur3yh
	yzPRMoBSiIbW8Ngb1Yj60TXa5OagXabhZsSIDgURvSYVYjI1bbuBebaHqWIk66mVVmpSqEKLMQ42G
	vSWQC3nPY/wGOEsvWrvI/VgK05FJe8zhht0njYA/MKGo5MTXTVT/Va6aVyeeREDIvJJxE6pf6FYvk
	mrDrFJaWhZ5Tsi8s1EAFLcC3XknlRwe2QkeReVu2ZeP+ywZj2AEzz3ACrXd0J4SchswtaGyXm6M0J
	SzOR/U2w==;
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pae2O-000UU0-2Q
	for linux-mtd@lists.infradead.org;
	Fri, 10 Mar 2023 14:48:07 +0000
Received: by mail-ot1-f47.google.com with SMTP id r23-20020a05683001d700b00690eb18529fso3054114ota.1
        for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2023 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJLH54G0xZR2QPR83pgINzDI6/oeVXhYquad/wYfr3w=;
        b=SDPGMrylkTgT3XZTJXR5Y5wsvQTglBz/b8Oa+X9hn7D6QCGEulZblzdM92lr7Po1hj
         YSoYiFR8loyJLJ3RV0/9h/KY+KGc0VlY/ESsGIy/LiSNlr/xdseYzxefSclDn5CJHiU6
         slNjU7mnS/Ewn/shZKDorzwSX3oWyJ9eJJIHG45i4UnBhqBQjhkGqV+Nh1UCcXyJYRC2
         bMo64Kjq6yISwNsCbLswcb50Yfk1E7TyEbc2c3Q03oScMwaCZnedteRRxC5YOl1DQFed
         RLehOXDiNHjAIs28cyYu6byAL/5sCY5BvFO6LD9aMdpjCZ2qTNQ/55hoCj4C7F21TGA6
         HaSA==
X-Gm-Message-State: AO0yUKWaiW32B4pfn/yZZyB+Lmr4o+RMHJKgmttW6ZxXYLMKNTCMsbgO
	1/xuEdjF7oxGTuWSooXEIQ==
X-Google-Smtp-Source: AK7set8P94LdlHKjvd3L1aYb9KPxDTwPY3mkWNaqUX9P15sUo6JhvjleX1N3LSOHL7bRva2A7nLYBQ==
X-Received: by 2002:a9d:3e14:0:b0:68d:972c:478d with SMTP id a20-20020a9d3e14000000b0068d972c478dmr10205744otd.16.1678459684055;
        Fri, 10 Mar 2023 06:48:04 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e6-20020a9d4906000000b006884c42a38asm118555otf.41.2023.03.10.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:03 -0800 (PST)
Received: (nullmailer pid 1543952 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:15 -0000
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: qcom: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:15 -0600
Message-Id: <20230310144715.1543926-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_144805_457197_84320B7E 
X-CRM114-Status: GOOD (  12.80  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 198a44794d2d..6b52ed8c6178 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3054,7 +3054,7 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	struct device *dev = nandc->dev;
 	int partitions_count, i, j, ret;
 
-	if (!of_find_property(dn, "qcom,boot-partitions", NULL))
+	if (!of_property_present(dn, "qcom,boot-partitions"))
 		return 0;
 
 	partitions_count = of_property_count_u32_elems(dn, "qcom,boot-partitions");
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
