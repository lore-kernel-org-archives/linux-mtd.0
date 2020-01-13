Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4207CC33CAE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:59:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165C6214D8
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gNN44Lsy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="un9r1I31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 165C6214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QU1CiKem6kyO/ubpyMaGtrTBuL91rkKKvYbVmppX0fk=; b=gNN44LsynvR4y4
	g8kZpQiNcJCMMNGYBH7I05sOrGvx2uzpWF6SSwF8/AiFWj7wN012STOwc3jN/AtGg1CuYfmZ/fip7
	xCav0/awgShzZ61p9Bws1Gd3uRzDaZ+cY7t+a7b5jKlA42xNfzkPkL4e1TLn6Ao0CeyC1TctyZcbM
	+2s0D2bkgb36aTfa0e6IPY173rGQlWRQafyAbUFcgl2Ros1KdfuumGR379vI7t+9PxvHMbH+zrAeX
	iu5r2pv4xreDnMQ1E8bmSgp6KgkPffr6MXzO23ve3T0eRGmtWwM/H9rzsgRbyHrK5Q8nweiabnXrL
	nRr8phxvBYA8vo9K5xtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqslH-0004Tu-9i; Mon, 13 Jan 2020 05:59:39 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqsku-00044d-1F
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 05:59:18 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200113055913epoutp03f81248aa10ff7e7d34e9ee4d38b75896~pXMbHf89B3238132381epoutp03v
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 05:59:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200113055913epoutp03f81248aa10ff7e7d34e9ee4d38b75896~pXMbHf89B3238132381epoutp03v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578895153;
 bh=WSJXXhDS0f5hqCWNQP3H+qBaWeMlj4xegivOg2KpPqI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=un9r1I31kw21dFyVhKm2JyBQfbXsdcKo4X/mobc3eelYmIRRWFbDqxIqcXLgs6yjG
 RIe1f1raeTbGGOKyiCbS9/WADQc9MQFqtFKnjTr4ME7QsRCJBgAGdmcX6GnG2UKJXm
 5I27EzKlG4M1RGn8ThW5YQ9EZ+TqBy/ttYpejwKY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200113055912epcas1p4c2a6615c31136d9defb67fbff428996a~pXMa5idcT2759727597epcas1p4S;
 Mon, 13 Jan 2020 05:59:12 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.159]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47x2wG6DHLzMqYl3; Mon, 13 Jan
 2020 05:59:10 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.54.51241.E270C1E5; Mon, 13 Jan 2020 14:59:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200113055910epcas1p384c04182e7c643163d659d42fafd01b3~pXMYlMmjJ1866218662epcas1p3E;
 Mon, 13 Jan 2020 05:59:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200113055910epsmtrp2caa8be325eefa7b8c6ba5a81a1b2590c~pXMYkhjSD1687916879epsmtrp2R;
 Mon, 13 Jan 2020 05:59:10 +0000 (GMT)
X-AuditID: b6c32a39-163ff7000001c829-37-5e1c072e5d2e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5E.44.10238.E270C1E5; Mon, 13 Jan 2020 14:59:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200113055910epsmtip1b7ead90b28abc897528143855357be5c~pXMYcrp761200912009epsmtip1h;
 Mon, 13 Jan 2020 05:59:10 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com
Subject: [PATCH v3 3/3] mtd: spi-nor: support lock/unlock for a few Micron
 chips
Date: Mon, 13 Jan 2020 14:59:07 +0900
Message-Id: <20200113055907.9029-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113055907.9029-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTu3XZ3r+Xqsq06rrJ1K0FJ3ZybM1okSQ00WAn9CHJe3GUT98Xu
 JiVEJVEqJhUhJfZFlqWpY610hiWrlAItkdA+DNGCjFwrKUYite0u6t9zzvt8HM57CL74FSYj
 KuxuxmWnrZRwqeD+4/SszCx8bami7lq2drElxNNOv17AtA9qbuLab607tL+Hw/gOTB9onsT1
 d1uP6t9FbiB9o78d6YcmengG7IB1m4WhTYxLztjLHaYKu1lHFZUYdxrVGoUyU5mvzaPkdtrG
 6KjCYkPmrgprNJuSV9FWT7RloFmWyt6+zeXwuBm5xcG6dRTjNFmdSoUzi6VtrMduzip32LYq
 FYocdZRZZrXcuvABOWtXHPJ21aFj6OOyepREAJkLo+MvsHq0lBCTvQiCA98SxXcE78+3CLji
 J4K6qQD6K/E31SLuoR/BYEcnzhXzCIa7OvgxlpDMgIkFX9xLSl5H0DA3FpdLyH1w8ZFXEMMC
 cjOMfH2Ox7CI1ELfswYhF7EeOrwDUSOCSCLz4cvltJgPkMeFEGhqwTlOIbT7mhNYAp+H/Aks
 g/lQf8KHhcDtszgnPoFguq01QVJBaK4zHsAn06G7L5trb4DAwqX4nHxyOYR+NGAxCpAiqD0p
 5igUfJk6IeAwwMuZ0xiH9dAYOZVYVwOCK2M1wjNoXfO/hKsItaNVjJO1mRlW6VT//08+FD+p
 jPxeNDhSHEQkgahk0UD1mlIxRlexh21BBASfkop8I7JSschEH65mXA6jy2Nl2CBSRzd5li9b
 We6IHqjdbVSqc1QqlTZXk6dRq6jVIiIyelBMmmk3U8kwTsb1V8cjkmTHUJvvsSY31RBZPl1y
 ir6i65+/Lxhan8M7kiLcb89Tprytql/Eku+1exdPFzytmaz+VbvlACHxD/ubl2ielJ3/1L2v
 t2fTXJu0yZz0OTzbGN4T3jslnb33KLixJM3tMUkLJ2bKA791lalvipJTssclMw+7MncXpJSF
 9T0z+J2KczxKwFpoZQbfxdJ/ABtx1LpoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42LZdlhJTlePXSbO4MVVSYu/c94xWTy6+ZvV
 YnfTMnaLj0scLP6f/cDuwOqxc9Zddo/NS+o97vxYyujRt2UVo8fxG9uZAlijuGxSUnMyy1KL
 9O0SuDJWzHjCWNDBX7FhXSdjA+NT7i5GTg4JAROJLdM6GEFsIYHdjBLLV8dBxCUkHu38wtLF
 yAFkC0scPlzcxcgFVPKRUaJv9X52kBo2AS2JG783sYIkRASWM0qc/3kXLCEsECDx68NMFhCb
 RUBV4tz7U2BxXgELiV0ne9ggFshLrN5wgBlkAaeApcSbeWoQN1hILNh8gnkCI+8CRoZVjJKp
 BcW56bnFhgWGeanlesWJucWleel6yfm5mxjBQaSluYPx8pL4Q4wCHIxKPLwStdJxQqyJZcWV
 uYcYJTiYlUR4N52TihPiTUmsrEotyo8vKs1JLT7EKM3BoiTO+zTvWKSQQHpiSWp2ampBahFM
 lomDU6qBkema1/LNR3OWBDefCr2uuOPis6wGKf20BOeg6Yo7DzTK33GKn9lwvd7g6KSTVfpH
 9YVuZmla3zFTbLlacuz6klJl8fqmTdmmk/5uFp6ourLT8p1q4cbVMWbfbho3Wzx8pVS4eEpJ
 Q9W1O8+5z3N09j+WYD1RtuOy31G+iUvWXznpxqVoPmnNEyWW4oxEQy3mouJEAOD8494eAgAA
X-CMS-MailID: 20200113055910epcas1p384c04182e7c643163d659d42fafd01b3
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113055910epcas1p384c04182e7c643163d659d42fafd01b3
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p384c04182e7c643163d659d42fafd01b3@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_215916_421824_30E7ED7B 
X-CRM114-Status: GOOD (  14.54  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some Micron models are known to have lock/unlock support,
and that also support 4bit block protection (bp0-3).

This patch support lock/unlock feature on the flashes.

Tested on w25q512ax3. The Other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7e8af6c4fdfa..97a027c38d66 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2583,12 +2583,17 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
-			      USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
+			       SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
