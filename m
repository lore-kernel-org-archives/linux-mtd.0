Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0210C25B07
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Aug 2022 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K9GKLpfmYrGnWQDaNuAOt+nbz0z0hwhlSMUwDxcVo5g=; b=rRlwYnkg+m2pTi
	39SRnikJJ5H+YNst6DbahtWfz24WTESju1ciKL6sDjDLZob7JMy43vo7Ala0tbG5zLWzGaup+U3H+
	cdQzTK2lqH1DDqIqiLUmc5Yw/S6O6dkrwjJ8EKwttBP+FaaMYRhtaG3BaR7fCSB3QQLE/z0vY7s41
	ySCRi4CesMkSBON4u7HtwJWMCC4V+iqP52iZQTz7yecdINpUjgBBm9K6x9K6GUj0DqfMPIr+6Bvrz
	IogBNyYMIHQGQhMTgp4qgab9VQWb1/4JP0YqxMT1K8Sa7VWyKZGJxho42bfeXJZ0cc+pM3Gpbz9N3
	kVobGY2i0QbV6EofwZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1dW-00HHiv-T4; Fri, 05 Aug 2022 18:01:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1dS-00HHfM-IH
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2022 18:01:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id z12so4027828wrs.9
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 11:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Ox8BTswWjDA6tlpp8yUvWlHE29irGGE5vTqBdJh9t3Y=;
        b=Tiugjdva7px9jepzH69IdxO1DOxcplknDJyYK6EIFlkoeS+o0ZTNLVpfmPQ1Tipcuj
         hPKLJVdoWpjjujx6H+gM3OA0mjd/7BHrPIHnng7POpTTwSBgHAo0Wz44EA3XRduRNgme
         hkRn98n6wKon9jdnITZrYHkdM2ELdBuWeB5KdIWp/wut3rhuyPqLvKpTSe/tzw5ueuwS
         h1cv2KWU+ZyCvOwoHacDDZiW5gqq+wiWIdutZW2PWcKeFm/kibXOB6l/hCsaQ/FEc8Xw
         iu4HKShZWXRvWxRSKXr6XpiT2fw6Gbncu5wGDNJVStW4HOuJK8iT+GykkyvHZe8MDY3k
         MwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Ox8BTswWjDA6tlpp8yUvWlHE29irGGE5vTqBdJh9t3Y=;
        b=EUNaeTdPW9KbmDaYdxXarEV8XbS50VRS533ofA3Kvx6BKDsYC0mLrqWdbcpCA2P2Ys
         5i+RyrLm7Kqz4VpAqbhp6LRai/+8btOFRHAlQVsUWK4cWiPvvU5kaWi9IJkmqisK3RWG
         oV70aOx4ixidipgQ7UoYLMD5+rpmzsAEmT/IgT8pOr+HbywXJpOoPjmaL+9pcXyOhOuZ
         0q/ExKmfU2Z6uXhys6/ZSX93PdqScz3t6UryBvUu31jsZIc/BZZOp/BMDdwfHvBx24pE
         uH8Mn/3QPdRqBP0y8kCqmIeEgnUpl1g+m3QayLuHYQHeMvSOp4g1etuX8jCNtIvPgTxc
         i9/g==
X-Gm-Message-State: ACgBeo1kymr8Zz3mJtSk6I6ziyAbt4XffwcNrkRVAhtO2GpX+KQKihmx
	TVl24T0LFh9tXGaJ5C9iC4s=
X-Google-Smtp-Source: AA6agR7cEFeGrAg2BqNXxTWauwFFuVStXnv4Myk/bPJ+hVKzpy/pbAl/uDCLB3EXTjSUMrxkA0OXdQ==
X-Received: by 2002:adf:ef8b:0:b0:220:8235:124 with SMTP id d11-20020adfef8b000000b0022082350124mr4874983wro.628.1659722478247;
        Fri, 05 Aug 2022 11:01:18 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600001c900b0021eaf4138aesm5213673wrx.108.2022.08.05.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 11:01:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: cafe: Use correct function name in comment block
Date: Fri,  5 Aug 2022 19:01:17 +0100
Message-Id: <20220805180117.2375503-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_110122_623400_EFE663B4 
X-CRM114-Status: GOOD (  11.48  )
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

The incorrect function name is being used in the comment for function
cafe_nand_read_page. Correct it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index af119e376352..66385c4fb994 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -358,7 +358,7 @@ static int cafe_nand_read_oob(struct nand_chip *chip, int page)
 	return nand_read_oob_op(chip, page, 0, chip->oob_poi, mtd->oobsize);
 }
 /**
- * cafe_nand_read_page_syndrome - [REPLACEABLE] hardware ecc syndrome based page read
+ * cafe_nand_read_page - [REPLACEABLE] hardware ecc syndrome based page read
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
  * @oob_required:	caller expects OOB data read to chip->oob_poi
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
