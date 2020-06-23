Return-Path: <SRS0=Ekuj=AE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE04C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2020 18:37:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E11A20781
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2020 18:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipxJ1yAe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yjdzEo+a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E11A20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FCR1RTKSgysZhKreeUMR7zhjO8zu4Ooj8gAQLFQmkIg=; b=ipxJ1yAeIVIF434ZjhZQ7Q0gE
	3r3sYSpkrclBgOErgryiTSFsq7dmbwcQC7imHIN00yEzb+y6MOubx8SYTw39PVv9sC6DQ2BGOPqcO
	abHkKPrzpSeb88dNipUteOqcLF2eDPC7d2ijWy8Xu/Ya+SVnyrhd8iotZc2QVLrmiIa9qiZgw5KmE
	HD9iLFpoNLUtlXty2PO7YpbuJE0rlMczDBMO0NoBk3JW9NKr4BtFa62jHENjNMqF6rA5GMNOwhcpC
	dtnjrgOWUHfQLqfrLE2+kGbIavvEoyLxyq5HGM7jARs+f0N5oLnRK6onVkhtGFPdNZOGBH98AUG9T
	okeT2+LkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnnmn-0004ok-WE; Tue, 23 Jun 2020 18:36:46 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnnhp-0001EW-Bz; Tue, 23 Jun 2020 18:31:38 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05NIVWB0046970;
 Tue, 23 Jun 2020 13:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592937092;
 bh=x4V4nT4Ljn5fI8ihOcptD057X9PN9/0Dd01/bQzGCUY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yjdzEo+aGGLkAqn02F4cGEldCr2YRPDEGpCSRirOGC6+jPHoMJn+p2EaBFHd+Ygv4
 X011W3kBQaPU64Ni0yxOQ0ZpxIBOQjfkBXarAMVJJnTLd8bGb/hIc/HDB8y8QmMTtn
 1iBwBzQ1X8TK34FE3uWdmLhYndTNbE8B0T5nkaxE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05NIVWcm050230
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jun 2020 13:31:32 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 13:31:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 13:31:32 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05NIUVJP000942;
 Tue, 23 Jun 2020 13:31:27 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v10 11/17] mtd: spi-nor: sfdp: do not make invalid quad enable
 fatal
Date: Wed, 24 Jun 2020 00:00:24 +0530
Message-ID: <20200623183030.26591-12-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200623183030.26591-1-p.yadav@ti.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Micron MT35XU512ABA flash does not support the quad enable bit. But
instead of programming the Quad Enable Require field to 000b ("Device
does not have a QE bit"), it is programmed to 111b ("Reserved").

While this is technically incorrect, it is not reason enough to abort
BFPT parsing. Instead, continue BFPT parsing and let flashes set it in
their fixup hooks.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/sfdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index d5a24e61813c..7983ff431346 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -612,7 +612,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 
 	default:
-		return -EINVAL;
+		dev_dbg(nor->dev, "BFPT QER reserved value used\n");
+		break;
 	}
 
 	/* Stop here if not JESD216 rev C or later. */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
