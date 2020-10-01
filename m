Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA530C4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 20:22:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442932074B
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 20:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6iO35zK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZMaPxH2X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442932074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/682Hk1Kek9HCGY4yb0L8W5FUoLeui8c86rVVt1lfgc=; b=B6iO35zKAoY43k0iQs4cOOJhr
	9vvtt5i/9Xl1x6+9Z4HfW98TMXWMHzy2iDPKVuI8CUg41Z+bxcy2iZq8GOoQsnRCnC152dNTMioRs
	SxM8llTSWnhR5UliAxCDymrTv+Y/O9mOSHE9THAUMYEYZnf9wZ/tXMJsn1akPi1O/yGVJpG1zAYKp
	p/nF16KjYpLTRoCc6EFaKIMz36Bvg+nWfo/QF2AZ9lZGrGECLpCiWffC3xjz6MYUVpwsOQdK9D8+w
	OoEdRiqQ6huQLUExaBi+6ZPG1hhv7FmbQ7VOIU19WgFqx7Vtl0aKdGlNqkHozTliTBl6E5kFx8RT5
	0VRxxcLIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO54Z-0008QR-MF; Thu, 01 Oct 2020 20:21:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO54U-0008Oq-1f
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 20:21:01 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091KKrCg064297;
 Thu, 1 Oct 2020 15:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601583653;
 bh=dgLCDmGqqsDBbyMIliBwVzUNzePc3HpV7xTby1yCRi8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZMaPxH2XfI3jlhW/QznOBUhrHYMS17ENc5o1aX7a00jatmfho+STsTp4k65c9oZNo
 PJUj+yG84uMc8nZwtXtKsPb1C/QhR2+WXVbZ2hacjRDTKt7CSOczWW9uPXITP21Ogi
 rl+GcGC/n3IIx3LzaJ3ETu4tPtupz7T8UucPpJ44=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091KKrsN125930
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 15:20:53 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 15:20:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 15:20:52 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091KKkcG123930;
 Thu, 1 Oct 2020 15:20:50 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Date: Fri, 2 Oct 2020 01:50:31 +0530
Message-ID: <20201001202045.21499-2-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001202045.21499-1-p.yadav@ti.com>
References: <20201001202045.21499-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_162058_175533_671CEFC3 
X-CRM114-Status: GOOD (  14.80  )
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

ENOTSUPP is not a SUSV4 error code. Using EOPNOTSUPP is preferred
in its stead.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0369d98b2d12..4d0f8d165544 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2281,7 +2281,7 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
  *@nor:        pointer to a 'struct spi_nor'
  *@op:         pointer to op template to be checked
  *
- * Returns 0 if operation is supported, -ENOTSUPP otherwise.
+ * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
  */
 static int spi_nor_spimem_check_op(struct spi_nor *nor,
 				   struct spi_mem_op *op)
@@ -2295,12 +2295,12 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 	op->addr.nbytes = 4;
 	if (!spi_mem_supports_op(nor->spimem, op)) {
 		if (nor->mtd.size > SZ_16M)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		/* If flash size <= 16MB, 3 address bytes are sufficient */
 		op->addr.nbytes = 3;
 		if (!spi_mem_supports_op(nor->spimem, op))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -2312,7 +2312,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
  *@nor:         pointer to a 'struct spi_nor'
  *@read:        pointer to op template to be checked
  *
- * Returns 0 if operation is supported, -ENOTSUPP otherwise.
+ * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
  */
 static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 				       const struct spi_nor_read_command *read)
@@ -2338,7 +2338,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
  *@nor:         pointer to a 'struct spi_nor'
  *@pp:          pointer to op template to be checked
  *
- * Returns 0 if operation is supported, -ENOTSUPP otherwise.
+ * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
  */
 static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 				   const struct spi_nor_pp_command *pp)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
