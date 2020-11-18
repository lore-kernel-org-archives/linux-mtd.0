Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9EAC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB7D246AD
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wf/qJp0t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wCPYVYqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB7D246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rOYDcKkSCtBQTKzfXGB0D7N4P+Y2nuyumHs2EeogQH4=; b=wf/qJp0thSCaEFsl569DOWZJ/
	EPLXeiVK3dxPKgcIrX5qf+ZBr/1rLlSTrF4OowRqVvFvbFnNb9oli3rhR5CMu1XBlz2Mzyy3eN0qN
	AtsMqCZtmI9mZwS59UybIX4wsFDr9MH2UDMYSze3pANPaG2Wsd1vSQe5pmB/dcDBulg1X65QRHQPp
	ql7V/OQx/vhkBeguujn5xvNhHCfxuysxV9iQsf3wZq+XmNHsII7k5g6ZGhEtnwd/P/AAX/trfMozu
	Dtoe3YVErxOQ7bB8XGCD4XB7X3J5zfsmY+imxajSVBGOG4gL5waPnd6CaARole1xUbw0/gbS2Z4Vx
	lVDazTJIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfS8t-0000PC-Oo; Wed, 18 Nov 2020 18:25:19 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfS8n-0000O0-S5
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 18:25:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIPAFH061847;
 Wed, 18 Nov 2020 12:25:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605723910;
 bh=VMDpHDuHPUX4EoijpGw0JKzxHU0sVC2i8pdzEnHAua0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wCPYVYqrbqV6q/7jFNo6ewlsL06ToVHZCRZFV1y27gAiynQuSQN4wSUxOQL4mLwPT
 W78llMrmPlbagG60Or7Gttu/dshOWQLpeDmF6YmXv3wPF3H1BcDD5F2/Fw5+qnbZyZ
 hT0bPug8cPOLjSgMTYgbpBqWMPM0YU/FqIRCXLNg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIIPASM000901
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 12:25:10 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 12:25:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 12:25:10 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP0Dx022682;
 Wed, 18 Nov 2020 12:25:08 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] mtd: spi-nor: spansion: Set ECC block size
Date: Wed, 18 Nov 2020 23:54:59 +0530
Message-ID: <20201118182459.18197-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118182459.18197-1-p.yadav@ti.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_132514_000467_5795E694 
X-CRM114-Status: GOOD (  13.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The S28 flash family uses 2-bit ECC by default with each ECC block being
16 bytes. Under this scheme multi-pass programming to an ECC block is
not allowed. Set the writesize to make sure multi-pass programming is
not attempted on the flash.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

Notes:
    New in v2.

 drivers/mtd/spi-nor/spansion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index e487fd341a56..b0c5521c1e27 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -109,6 +109,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
 static void s28hs512t_default_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
+	nor->params->writesize = 16;
 }
 
 static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
