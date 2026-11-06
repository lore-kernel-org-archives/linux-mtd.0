Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086E606A32F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YhuT4hTg;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=Gedp/X2F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PYC0FaK95qeS6+2cQ7q3YUeu95bpj1i2enjWkqbK04Y=; b=YhuT4hTgkgzRZc8FcXjsHgvTfa
	TGq5999JqOWkmhjqGJv0ZWiTqf8EOmABwF9Qe8IBm4yHXqrZ2KSr2qV/DiMR/Wk4wyj8kxDZXuQP3
	3EUepe1Q1UmUT07p7DV37yw1JFipEhrb/ano1CkdajUi13ot+70gujIrgNwKMlxJRUwnY2oJC8RF6
	xJMWsf2b38/PJjlrPpkqwfaQJz+mLETf/bUlwge4RV4Q87YCi40NocsvUam8y9FvSr9qhKpd/Pral
	H+cMrb1BCBGIpf+WBVzN1MeElFDsoiXU2r4pbGRKwUzrK14045900KZsChs0+wWY/FdigTb4IqYmG
	LM0Um2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP95K-0000000B0mv-1cb3;
	Fri, 06 Nov 2026 01:49:42 +0000
Received: from out28-145.mail.aliyun.com ([115.124.28.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP95F-0000000B0mX-3c74
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 01:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793929770; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=obWEFYHxqQD8Gd1XcASfPfqXODJZ6EymLi6RVwWdKYg=;
	b=Gedp/X2FQC+skmb+8LrSDkz5GOwbaP+c2C9I+n4SNXHbSRVjGR7BCFbmfoMPMCNzwxpwaewU5gZp5dnJz401sOUHTHkZodFo26g2ycG1+HBrbcVwveIBitZD0wLV32cGSFm314CA6pdvD3/iCrHDXODwKVC0iUdKutpLSWCTmz4=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07813765|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00538106-0.00124658-0.993372;FP=11962638910552167427|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023087102;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.jxtOOy9_1793929768;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jxtOOy9_1793929768 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 09:49:29 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: lantiq-flash: Fix NULL pointer dereference in probe
Date: Fri,  6 Nov 2026 09:49:28 +0800
Message-ID: <20261106014928.4126855-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_174938_392100_B1603B6E 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ltq_mtd_probe() dereferences ltq_mtd->map->virt before the map_info
structure is allocated: the map pointer itself is still NULL when
ltq_mtd->map->virt is assigned, because the structure is allocated a
few lines below. Any device with a "lantiq,nor" compatible therefore
crashes the kernel with a NULL pointer dereference during probe.

Assign the mapping after the map_info allocation instead.

Fixes: 6145e07e9c77 ("mtd: lantiq-flash: Use devm_platform_get_and_ioremap_resource()")
Cc: stable@vger.kernel.org
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
 drivers/mtd/maps/lantiq-flash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 80d467eba..5c2ace302 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -118,15 +118,15 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ltq_mtd);
 
-	ltq_mtd->map->virt = devm_platform_get_and_ioremap_resource(pdev, 0, &ltq_mtd->res);
-	if (IS_ERR(ltq_mtd->map->virt))
-		return PTR_ERR(ltq_mtd->map->virt);
-
 	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
 				    GFP_KERNEL);
 	if (!ltq_mtd->map)
 		return -ENOMEM;
 
+	ltq_mtd->map->virt = devm_platform_get_and_ioremap_resource(pdev, 0, &ltq_mtd->res);
+	if (IS_ERR(ltq_mtd->map->virt))
+		return PTR_ERR(ltq_mtd->map->virt);
+
 	ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
 
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
