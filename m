Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4598ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 00:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Guop5hRdMw8QnhGGKP1G/8EUEUl4hQMHlVaxbGKyOfk=; b=aUKo+Rgrfd13CQ
	u7ttEhv40ah5sYzzJzsjw9UFCgNMvSq/u1zJiBnFnmjn/Jr/08kf4H+A+KenwbL6RcVSzQsRBr7tG
	FIO1jsywMau3iq/Ezah2E6PuaNuMm+yP2PpRnJNU6IsHauxfH6oSmNikWcDrrFupQdAI+qvT26lP7
	75+kYJP4+FVBNgFK3Q33nzxPHSCHCge+aUS1aaIpLzCJLuIk7kvvZ+G2xISY6jXke8rjZqivCWmgt
	NBtvsfKcJgY/2KMhNsM0JaSspzdfFvpGOaYG+H+KKOI8dY5r293VATQkQl2vyx66Fg7fHZjEQs+E2
	TlbZPffbsaxLgfkH3apQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYywe-002pkf-NZ; Fri, 16 Sep 2022 00:11:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYywb-002ph4-IU
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2022 00:10:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bq9so33420907wrb.4
        for <linux-mtd@lists.infradead.org>; Thu, 15 Sep 2022 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3woIDE7yBUh/b9Nv8vLk6hJiU8oDnZbYkk/eVuZfaH8=;
        b=JC4H5My6AlEVhR7CTGxSOndCE1Qp6gSYfTQ+dq+sPchd1dbbxSEVyUzL31fRXjif8T
         UyQzXQ9K8ZAeDdt69Wv8IOxAGmhYP1otJGia1U8kmzIF4oYoZnRdg3TaoHRq9b7YjOd8
         vGfWyLMJlLpW0N0voALnKn3eiCM+hHiSuAPAbPIZn9BT8v6lneYM5Ilz8/YZ9+TZGNid
         NrgGez7AzkLA9QCSCrJ+IHYaryGG+heW2DKiKAA8xMO265rSggdZTbCaeMi58MQwxbez
         /Q7SGrdiKLUEE9De5rjk3a8ejyRNDno6RJ6p7+7Z6P/lMaw03Mj1MszhEEnJ6c9k9u1L
         S/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3woIDE7yBUh/b9Nv8vLk6hJiU8oDnZbYkk/eVuZfaH8=;
        b=gH6FpKae7YtrVig0xNwhql0lVyBfuy+auECw/fVP6D5SvgabcZ8zTflAZ5CLwxdLGO
         1h3QxQbCMfOuNwfbTRFwsTtXS8BTjeAePi1TFu3G5/Kyij8K2OykjWPuvsydcfRUt2mq
         ae19kPLy66FzSvoUsOEge0/7FjvhvJMb1wMSfGeK2X4DdOxNfCgiPBBGzeWTPm15a9Ks
         9zWxcefnZArGXF6WuR0R3eM0NBqE1tg7T10CGzBKiInwQFFJzInfkKKCjn+KoNfcPPAs
         AWE3MpD20Xi3f0d6wKQD+5IBrUdtXVXlFAKPYh35sRsVY/guwdWC1WyVtWJM75eeSF4t
         dhgQ==
X-Gm-Message-State: ACrzQf2mZnzmp2QhGPE5UuuQ+rvz1iDkviFZ8SPld0lhwndatf80DIYr
	bHrsh2KsQfEmOk44l46/MLg=
X-Google-Smtp-Source: AMsMyM5byb8GS5ejazAxASqEwMhbEIC+bYI91ag1jKB+w4/P/le0oFvlmLB78VPGSK1zU9BtcPyJ+A==
X-Received: by 2002:a5d:608d:0:b0:228:d095:4a15 with SMTP id w13-20020a5d608d000000b00228d0954a15mr1235995wrt.499.1663287052713;
        Thu, 15 Sep 2022 17:10:52 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-134.ip85.fastwebnet.it. [93.42.70.134])
        by smtp.googlemail.com with ESMTPSA id c9-20020adffb49000000b00228dbf15072sm3780686wrs.62.2022.09.15.17.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 17:10:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vinod Koul <vkoul@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: nand: raw: qcom_nandc: handle error pointer from adm prep_slave_sg
Date: Fri, 16 Sep 2022 02:10:38 +0200
Message-Id: <20220916001038.11147-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_171057_676132_B9B5BE9E 
X-CRM114-Status: GOOD (  14.07  )
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

ADM dma engine has changed to also provide error pointer instaed of
plain NULL pointer on invalid configuration of prep_slave_sg function.
Currently this is not handled and an error pointer is detected as a
valid dma_desc. This cause kernel panic as the driver doesn't fail
with an invalid dma engine configuration.

Correctly handle this case by checking if dma_desc is NULL or IS_ERR.

Fixes: 03de6b273805 ("dmaengine: qcom-adm: stop abusing slave_id config")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org # v5.17+
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 8f80019a9f01..d7eac196dde0 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1054,7 +1054,7 @@ static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
 	}
 
 	dma_desc = dmaengine_prep_slave_sg(nandc->chan, sgl, 1, dir_eng, 0);
-	if (!dma_desc) {
+	if (IS_ERR_OR_NULL(dma_desc)) {
 		dev_err(nandc->dev, "failed to prepare desc\n");
 		ret = -EINVAL;
 		goto err;
-- 
2.37.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
