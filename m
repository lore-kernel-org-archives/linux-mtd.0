Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA38C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 19:14:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E23864EE9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 19:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E23864EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WkcV4UgzEgaqamSkIshGK2HFZtzZ01fCpg+ZvwZ6t6w=; b=lBAAbtUJgT9rv5iw9/IHnYU3b
	agazJXztzs95H8zcPwiZQf5JY8OhzrllAq1fMxiCLetXQYRwikr1Ustd+/pJzYRkYXOsZknHhVbdB
	bzuU3NUmNukUXcdAGy6OkAhv7w60w2AgRSXJs3g3ORy+NFd9J2E/pO3KWrcRklj9KcYnWxgxQpuFe
	6w318wkJ4S/EBQi2PbtLlFVlNFS3lGMDa23gAnB4qgqZJutto8d1EaN/ZVKDB7j5sn/IcLQp0s8VS
	oUttDWOkdjXlAqqdwSgLOJAzh6E/FBRN1I4WVQTz/v4TqzUXeytInymQ9SF0NliMTsdQMzwSyCQLQ
	+b1VKjhaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKQkr-009x12-DF; Thu, 11 Mar 2021 19:13:53 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKQjf-009wif-KV; Thu, 11 Mar 2021 19:12:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12BJCanU072953;
 Thu, 11 Mar 2021 13:12:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615489956;
 bh=n3DRjCff2C4yzirXTzPuZEGe7eZhKiV8GXaya6kJgQM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=b5kYp6YSfZpL/Ff+Z70SDQnez/A3FB8SSfTxS0cqixG2nzCWjraR+Btzj1a7B7m9V
 WvAflg74iWVQhjGQLXFA1IhaT3XT1o8HOdWeqqCwA/mFZavToyue+bBayuh1cgbsNU
 BfrQEdYAThM7P2qi7edmn0cztlpke12CwcNMW550=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12BJCaog113136
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Mar 2021 13:12:36 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 11
 Mar 2021 13:12:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 11 Mar 2021 13:12:35 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12BJCHvU080816;
 Thu, 11 Mar 2021 13:12:31 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [RFC PATCH 3/6] mtd: spi-nor: core: run calibration when
 initialization is done
Date: Fri, 12 Mar 2021 00:42:13 +0530
Message-ID: <20210311191216.7363-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311191216.7363-1-p.yadav@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_191240_069744_3EB33222 
X-CRM114-Status: GOOD (  12.45  )
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

Once the flash is initialized tell the controller it can run
calibration procedures if needed. This can be useful when calibration is
needed to run at higher clock speeds.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 88888df009f0..e0cbcaf1be89 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3650,6 +3650,7 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 * checking what's really supported using spi_mem_supports_op().
 	 */
 	const struct spi_nor_hwcaps hwcaps = { .mask = SNOR_HWCAPS_ALL };
+	struct spi_mem_op op;
 	char *flash_name;
 	int ret;
 
@@ -3709,8 +3710,15 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
-	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
-				   data ? data->nr_parts : 0);
+	ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
+	if (ret)
+		return ret;
+
+	op = spi_nor_spimem_get_read_op(nor);
+	spi_mem_do_calibration(nor->spimem, &op);
+
+	return 0;
 }
 
 static int spi_nor_remove(struct spi_mem *spimem)
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
