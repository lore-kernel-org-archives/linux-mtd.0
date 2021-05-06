Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FDDC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:19:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C878D6113E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C878D6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=loOy5JmuMBAKMx/OSGjCiC3KxCGMcikF0ybsrTcLnvs=; b=HThzUp2Hv91uY/tnzDo9yTvWd
	JQGrrbdTkECjPwlsd90NJzYojH550rXYVbIzxGDjnu6cd2HVIDqmQt7/B1smm41CB4IF5VYL51Gz9
	3/XOrFvRi2BkMjExX6UV79BGj0NrLWfsNfY/eFiVMSTuQ5/EJqXvklAtbkkDZjLB7kDKg4Kbr8vob
	9h3JTZjiGPTgSrw2NIVEupwKqypIOeKfVWUldst9iTBJGkdZrkfcwtgCB9Fqo21lfu49lve0H15LH
	BRgV/wODOcCWiVEaXsXemk7QdUv+yWPrh7LeolXryEmi2BA34mnlm0L/4xhRytB09ARBp6AJaklo9
	9C+R/84aQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejWU-0057az-5i; Thu, 06 May 2021 19:18:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWK-0057ZS-RF
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 19:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=TFnKVuKDTO2GGB/wxF7cdWs6/1Bvz3DWxZTs5bMoFIY=; b=suMhi6+0ogUPghOjEQiv/7SI68
 WQ0rzYCU/BnRbbzJiH7VXR8ameKbuj+G13sotkoZpiNveCcLbNhDcc1fGQjTU2EQvExfXJeWpYosY
 aY1TLPxRV4eyrul4lf66S94KPTVCSgy0eCObFd4hB7RhynTKgXYk50jlfdqngy2He6HDjLnlYL/dp
 MPrhJcroWW6m5+mGv3qV/gzLrkAK+GSxVpI5SjUJkisOA7at1ML3i4A7+xwW7SIIJ8FryfbAGr7JN
 yAaN2UGZzkYgBcaCtCVzhyAwQdSSDm2vCEYoY63+nFaeT6Skupcdshl+YXLeZKG1Uotj+aZf8mGDM
 8g5frdww==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWI-006KhY-9O
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 19:18:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146JIbn9095390;
 Thu, 6 May 2021 14:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620328717;
 bh=TFnKVuKDTO2GGB/wxF7cdWs6/1Bvz3DWxZTs5bMoFIY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hOLWIynym8Jyu3M2Yf8x/UcU049qO5osg/1u9l1iAz3g9I63Mv3t7Vu0JhlmsO9yG
 QpoyNbmuIsT6OrvEjDZrF+kBlgv/HN5R4KG2xWnvL3PH58z7RvFw61ny/wyUkc+Zzx
 VK1+Rjqp7uyobsjfcfL1+jlfF2vzlY0ihR6mMk6Q=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146JIbPm097453
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 14:18:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 14:18:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 14:18:37 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146JIUND026052;
 Thu, 6 May 2021 14:18:34 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark
 Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 1/6] mtd: spi-nor: core: use 2 data bytes for template ops
Date: Fri, 7 May 2021 00:48:24 +0530
Message-ID: <20210506191829.8271-2-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210506191829.8271-1-p.yadav@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_121846_458256_15322F9A 
X-CRM114-Status: GOOD (  15.73  )
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

The template ops used in spi_nor_spimem_check_pp() and
spi_nor_spimem_check_readop() currently set the data phase to 1 byte
long. This is problematic for 8D-8D-8D protocol where odd length data
phase is invalid since one cycle transfers 2 bytes and odd number of
bytes would mean half a cycle is left over. This could result in a
controller rejecting the op as "not supported" even though it actually
supports the protocol.

Change the data length to 2 bytes in these templates. One might argue
that this should only be done for 8D-8D-8D operations but when talking
about these templates, there is no functional difference between one and
two bytes, even in STR modes.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bd2c7717eb10..5cc206b8bbf3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2143,7 +2143,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 0),
 					  SPI_MEM_OP_ADDR(3, 0, 0),
 					  SPI_MEM_OP_DUMMY(1, 0),
-					  SPI_MEM_OP_DATA_IN(1, NULL, 0));
+					  SPI_MEM_OP_DATA_IN(2, NULL, 0));
 
 	spi_nor_spimem_setup_op(nor, &op, read->proto);
 
@@ -2169,7 +2169,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(pp->opcode, 0),
 					  SPI_MEM_OP_ADDR(3, 0, 0),
 					  SPI_MEM_OP_NO_DUMMY,
-					  SPI_MEM_OP_DATA_OUT(1, NULL, 0));
+					  SPI_MEM_OP_DATA_OUT(2, NULL, 0));
 
 	spi_nor_spimem_setup_op(nor, &op, pp->proto);
 
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
