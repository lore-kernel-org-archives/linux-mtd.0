Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D94C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:20:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5FA161107
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5FA161107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OwFm7sxKaywkFxGVBx7X0LGlhkOCCJJobqiCuFBCF+8=; b=BEiQU73X8oooKVNbdESj2PTb8
	2Zo/h4/7k0KfvF4k2YkW5/MYlzkgIoyol8ubc6QH/Owa12LjQ5VEgZENlcLM08SaK8p2hFFIkkK2f
	3HuGv8xdh+Z6DZ+VF6X3wCgs67X8qAI8rR/GOvzDTcYWFD148EyGzpup5Vs78MezZaRADYDTsDOfT
	5dxAE6ls1h4tqgalippRTBjnlXy02k17b92OKUAG9M8WAdV2k6kT1wFDBv8Ki67+jeW2Aor+01AK5
	LutoQVpoMNmKmsCnLEg6UtAB39QSVy6lavqwMmEv851pDjRyal6y4tvdCG4LRJbddRhm5IzHexFbX
	E93dGjqOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejWi-0057dV-6D; Thu, 06 May 2021 19:19:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWK-0057ZT-SV
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 19:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=IiRBqB2ToyGAi8YKG7SNA23XBwysyJKFHiYBnMNbNv8=; b=kzNHmnkrJyWk4Rbjxyt7qnAC3h
 ZXCAqRkhWIwm65B6va7ioOKhw94QPolqkbs8aWb6MbyTIromh37jhyL3sS3T8Pcwnvrv0IynDi417
 TOzQVXUBy/V2WCN2u1eYVQIm5w8vy4mtvYWnFFrISBQ4gFYXkVtNAQvqAATeCnRblXI134Ckqco+m
 Ifx+ZGIHP0+0t//fzBdBvjCLA91uWzaKzKN0KI7buQWOvH96WDDcfIU+W/4qxhiYgy/0ZAxuHTFMg
 Y9eTSmOYWBjcWGinSzi7jwO47cJEKIEkSW/T2+fstKNhpT1VwvpDbpuOy23nIBl2y5pkGHYFMtZCs
 /4JiaDyQ==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWI-006Khb-9N
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 19:18:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146JIfJW095409;
 Thu, 6 May 2021 14:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620328721;
 bh=IiRBqB2ToyGAi8YKG7SNA23XBwysyJKFHiYBnMNbNv8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=lH+f0ybvm8Yl0uNS+pMn+aGhmn5K0Q5Os19Kqxyg17bBirL+b+Yf3d4mLk3DdgGYw
 rsfLxygDABFDORL+M4QQU9fQWOWiF/sGig/UHX+Wj6ekKew82FKsQwYJOj8X9DR97i
 s/l1kd3yyj8X/YMZ336tDakp6E6FOORxOvu8kA8c=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146JIeHj122839
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 14:18:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 14:18:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 14:18:40 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146JIUNE026052;
 Thu, 6 May 2021 14:18:37 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark
 Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 2/6] mtd: spi-nor: spansion: write 2 bytes when disabling
 Octal DTR mode
Date: Fri, 7 May 2021 00:48:25 +0530
Message-ID: <20210506191829.8271-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210506191829.8271-1-p.yadav@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_121846_455525_AD44AE20 
X-CRM114-Status: GOOD (  14.26  )
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

The Octal DTR configuration is stored in the CFR5V register. This
register is 1 byte wide. But 1 byte long transactions are not allowed in
8D-8D-8D mode. Since the next byte address does not contain any
register, it is safe to write any value to it. Write a 0 to it.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

 drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ee82dcd75310..e6bf5c9eee6a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -65,10 +65,18 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	if (enable)
-		*buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
-	else
-		*buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
+	if (enable) {
+		buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. Since there is no register at the
+		 * next location, just initialize the value to 0 and let the
+		 * transaction go on.
+		 */
+		buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
+		buf[1] = 0;
+	}
 
 	op = (struct spi_mem_op)
 		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
@@ -76,7 +84,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
 					   SPINOR_REG_CYPRESS_CFR5V,
 					   1),
 			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
 
 	if (!enable)
 		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
