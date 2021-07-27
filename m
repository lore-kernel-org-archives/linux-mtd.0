Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F4CC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE5D611C5
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CE5D611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBvHR+WE9HJW3bOpbE4GnVTRv+Sm9tD8xyvOfRFpLcQ=; b=yF31xO404k9FlU
	YoSwAN7TTch3oixBOHgIsrjHHV4L9kS3xRykh4lFSvY+c1GMxvEz14x4HUzo2EHgkJaSOPnepD5VI
	eEy9Qk1oQdhI7dmxtuLFPspEsAfUzV3wAgfMOB2ud8st7vUoF9FkS19nG8Qv499L8MQVGpNMpEnNW
	0F1oDqpgaF+QqAu8mGjUzKywHWzGl0iEGPzgKQIelbJlKkV84yoeWYQf5mnk9EpW4O5FYBXOqwddj
	YeXAdOHWPl2H/hQmzeSTN3+zA6BuECZDRP7YTf369h63bWrQEkTKgwb59J0uebFs0T7zHWXYGABl8
	SR6ipnQuEWq/9p5DmYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Ha9-00Dr2I-Ny; Tue, 27 Jul 2021 07:32:54 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8GaN-00Dcpe-Fv
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 06:29:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id mt6so16384888pjb.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Jul 2021 23:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7gbIhgZL1GB7+CVzKz4WvNGA6a2yfgt3NnYEFDZ3OA=;
 b=ddSxW+BF6bMPFIS3LGwe/J3xhVpC83qkgDnt5dwEygoPvNeYihLmgqgwrPBB/WtjCR
 Jz/15O6yuD10YFbiponmOZW9UrhrubeE6/Ba9XH6mR3heqlyqaPeHIlEQk7+D2LkiwUf
 g4NzpLdDxYQY3Xg3d2RrlNPGNtoKK9OXCySPcnumxPhWSLDAb190lsFhQvS4SPUvayz0
 atcKkrG57Lxlm0CCjjEz94GYYmDUtZg4hjEItpxD3jUUjuDl78KYkNtVRtpalvmTwmXL
 0ffCP8+P0qxnK00iybgFPgenhnuaeITfQnJKW64/aIpYNKeYr8exZTo35Y95HHnJuUwZ
 5C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7gbIhgZL1GB7+CVzKz4WvNGA6a2yfgt3NnYEFDZ3OA=;
 b=DRG7FtLrQJ4eQP+sYuqsWyCkwaHnE4qsaXNins52NbQ3Fc/9JPnzW5rENGyxsIKA1i
 abXtyXJuGQyvB1I/QmKKVIH1itzD+cK8LQAvoFuSB3861hySumXZFqENLzE3RuDdUrGy
 Fur2y5DaMMHGO/qMjIoEtLKHYrPeJcbQtgtw/fNf0hSUNq9o73g3Zei3+v13/CQDIbq2
 KrxVX2ueB727aqf/rVGCGdtnyeKFryScZ/MUlYkDHWNF7d8dDPAzK60iboMfn2T5HNq5
 dZkyvWqWT3xFYTELGyo9aXMOfp2WtalTThwP8Da3xK1rrPJWMH8/vqb80AZMAPlMZiEj
 fCzw==
X-Gm-Message-State: AOAM533Hw/ttwP7uN3AhIS4IG7plQFVm5Aw+4yX3YBEAJbDDyFXMPLCc
 vmrPVraj0hv2MbJOG8N9vnXi
X-Google-Smtp-Source: ABdhPJwOxewXlQs+hfNI+t3UdmSQFBWp/cZFvddejI5BsF8JNQNf2AicgvXY6VziMptXGG8v7NhzLw==
X-Received: by 2002:a17:90a:c24b:: with SMTP id
 d11mr2731017pjx.91.1627367341536; 
 Mon, 26 Jul 2021 23:29:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:404:9e26:4427:70e5:216c:501f])
 by smtp.gmail.com with ESMTPSA id g3sm2107960pfi.197.2021.07.26.23.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 23:29:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.carpenter@oracle.com, martin@kaiser.cx,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] mtd: rawnand: Fix probe failure due to
 of_get_nand_secure_regions()
Date: Tue, 27 Jul 2021 11:58:13 +0530
Message-Id: <20210727062813.32619-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_232903_595959_18EDCEC7 
X-CRM114-Status: GOOD (  14.63  )
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

Due to 14f97f0b8e2b, the rawnand platforms without "secure-regions"
property defined in DT fails to probe. The issue is,
of_get_nand_secure_regions() errors out if
of_property_count_elems_of_size() returns a negative error code.

If the "secure-regions" property is not present in DT, then also we'll
get -EINVAL from of_property_count_elems_of_size() but it should not
be treated as an error for platforms not declaring "secure-regions"
in DT.

So fix this behaviour by checking for the existence of that property in
DT and return 0 if it is not present.

Fixes: 14f97f0b8e2b ("mtd: rawnand: Add a check in of_get_nand_secure_regions()")
Reported-by: Martin Kaiser <martin@kaiser.cx>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/nand_base.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index cbba46432e39..3d6c6e880520 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5228,8 +5228,14 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 static int of_get_nand_secure_regions(struct nand_chip *chip)
 {
 	struct device_node *dn = nand_get_flash_node(chip);
+	struct property *prop;
 	int nr_elem, i, j;
 
+	/* Only proceed if the "secure-regions" property is present in DT */
+	prop = of_find_property(dn, "secure-regions", NULL);
+	if (!prop)
+		return 0;
+
 	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
 	if (nr_elem <= 0)
 		return nr_elem;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
