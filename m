Return-Path: <SRS0=UES7=CM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15D4C43461
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 17:14:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C005620775
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 17:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jNR5GlLv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Oe7zV9Hf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C005620775
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gn/dR46TV8C6PmNUp1925qsgnB+pzs+zqyOjndmg3XE=; b=jNR5GlLv554efCs0D8Ze7MtJf
	Rf4LFzYcRvfMbXH25w4xRrnZ/hl0jv7YlStYMU7QZdnq4H1Tm7OseI6dEhgFGWOZpVQFlSO9H5fzL
	1xSvtigoVPpqwTlfFMukejtQmYsLNz9Wn22glYU47SSJLaeSRt3FUBrgLtuUXHgnPa2J7DCI/mwg6
	t+kdGlkTgpXC2CP8Ye2GJXKJd0e4Q8s4F1xbhShJud+ikclD22cvAi7LJQIK/jP9Ckd5t0txMxkIo
	QLg4GhtQuFp0vCU43TFTb+N/kIK4iS1sdwSrZpPzHRa51s+VaPFXHfHvl3whXnGyvpbm8jCZuh0qJ
	S2dPQx+kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDsny-0006UO-1p; Thu, 03 Sep 2020 17:13:46 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDsnr-0006S2-Kw
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2020 17:13:40 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 083HDZ2g042702;
 Thu, 3 Sep 2020 12:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599153215;
 bh=jl5p9NaQfiK1KsSpbwz5yJOxJcmZ0xvUVn0bSWjVkKI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Oe7zV9Hf6r2+HwefP5Ul9tUfyEjwwbAfVfx78bhHFNWBxA/cQ8eskFvCt+23i4X0M
 y9aM2QI+YUgQhIcv3MGL1FYgXRdFzUjpFvcB9soE1iWQQG3C/e2wHKjQFwNKJsWGR3
 muHj8G1psXmQiXWqi1ZAcYL4pOIXI3cLH5nXOKwQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 083HDZXm089676
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Sep 2020 12:13:35 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Sep
 2020 12:13:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Sep 2020 12:13:35 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 083HDDQ1088669;
 Thu, 3 Sep 2020 12:13:32 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 06/14] mtd: spi-nor: core: use dummy cycle and address
 width info from SFDP
Date: Thu, 3 Sep 2020 22:43:05 +0530
Message-ID: <20200903171313.18741-7-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200903171313.18741-1-p.yadav@ti.com>
References: <20200903171313.18741-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_131339_801870_CE266AAD 
X-CRM114-Status: GOOD (  10.80  )
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

The xSPI Profile 1.0 table specifies how many dummy cycles and address
bytes are needed for the Read Status Register command in octal DTR mode.
Use that information to send the correct Read SR command.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d9186f64bc96..83ad58508855 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -379,6 +379,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, sr, 1));
 
+		if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
+			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
+			op.dummy.nbytes = nor->params->rdsr_dummy;
+		}
+
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
@@ -410,6 +415,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, fsr, 1));
 
+		if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
+			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
+			op.dummy.nbytes = nor->params->rdsr_dummy;
+		}
+
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
