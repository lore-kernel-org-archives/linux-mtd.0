Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01DEC33CAE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:40:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7991A2082E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 05:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u1VwrWaS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lUzyDbMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7991A2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oa244jfBp3Ervz6kPpoAfihhifNXb+Swspft/uiOSuo=; b=u1VwrWaSFIo032
	N4Waf+/UakjflOOqCpQjFeFEkx6Q+sLA4u2LMbtu78dVURm9MPZhy4JU15f9s3zqqYRStsvQcPB7c
	AV6gcdWUBzQgjx/6tc5LhWflbPcKfLX9T/FHFoXr5Y5UKCC/7kiwSqcKScTkIf9R6VyXVP4/1T/dz
	6QkjQlHa7juqh5dpx7BHWWzVCQnVjsXSm8mxwZT8IBtq+wyKZ2JWM0g5pgp5Rs90cjyI2rwPMBWxX
	d8+743DZ54w4df0re6s6m3iySl9HENuaAlGZVkyV2OPkLdqHPwQEu8gMBSZuBAoZuJEkRP9DjduvM
	prc0APFr47UalDuclBhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqsSE-0004hH-4Y; Mon, 13 Jan 2020 05:39:58 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqsQO-00030i-SO
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 05:38:07 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200113053801epoutp0192c28091c2cb854ae2148578e764435b~pW565JfiK0628106281epoutp01A
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 05:38:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200113053801epoutp0192c28091c2cb854ae2148578e764435b~pW565JfiK0628106281epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578893881;
 bh=0914/lakCPuDQu3lFskphT3EGx/iWTS07937cq5ljd4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lUzyDbMw7hLXwUSQjQO0bSTZJG8SCR0Zgn9DeCWJjG28UdNOwPivPAGU0iWEfDW9K
 oWzy/WQ5z0stTljuSorcFpyzs0Meygd4sHOTzrNMlAP3R0c2bVe09cBKgOjUm9hYQC
 W4D4/fwBSvMiWbEFfontaEkMXam9qFYKhc6nBoeo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200113053801epcas1p3306560f3ca66f8f9c74c7c179a1d051a~pW56gQGra3016630166epcas1p3G;
 Mon, 13 Jan 2020 05:38:01 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.163]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 47x2Rp1TFCzMqYkk; Mon, 13 Jan
 2020 05:37:58 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 A8.07.52419.5320C1E5; Mon, 13 Jan 2020 14:37:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200113053757epcas1p343bae16b96761ee4ead6bdfc6712ad68~pW520A7o_0245802458epcas1p3c;
 Mon, 13 Jan 2020 05:37:57 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200113053757epsmtrp1c07623cff1fa18776beb93711eaea594~pW52zV11q2845628456epsmtrp1u;
 Mon, 13 Jan 2020 05:37:57 +0000 (GMT)
X-AuditID: b6c32a37-5b7ff7000001ccc3-91-5e1c02359945
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 42.C3.06569.5320C1E5; Mon, 13 Jan 2020 14:37:57 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200113053757epsmtip14fd62c341b73101f37808edfd49935d7~pW52tEKO80156801568epsmtip1K;
 Mon, 13 Jan 2020 05:37:57 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com
Subject: [PATCH v2 3/3] mtd: spi-nor: support lock/unlock for a few Micron
 chips
Date: Mon, 13 Jan 2020 14:37:53 +0900
Message-Id: <20200113053753.8184-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113053753.8184-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0hTYRTGe3d33dWcXm5Wh1loN/qgNNtc0xkuxCxWSYl9M5pd3GUT94/d
 KSlEaiLT1LQIzLKyzCyLdI1yhqRWCEGWaGmgshVWi5Q0LMPEtl2jvj2c5/e853DeQ2DUKC4h
 8s121mZmjHRImPDh0ziZVCnYpJW1d25VLV+eFajev1vCVY/L20SqudY01crLb6I0XONumhRp
 HrSe0kws3kSaOtcdpBkcfyTIwnOMqQaW0bG2WNacZ9Hlm/Vq+uCR3D25yiSZXCpPUSXTsWbG
 xKrpjMws6b58o783HVvEGAv9pSyG4+gdu1NtlkI7G2uwcHY1zVp1RqtcZk3gGBNXaNYn5FlM
 u+QyWaLSTx43Gk73XxJYHZEnvB1dWCmaXluNQgkgd0JzvwurRmEERXYjmHHPigIGRc4jGH0e
 wxs/EPS0v8T+Jt6Mj+E81Iugwavhoe8I6hoag1AIGQ/jS048YESRNxDUzIyggLGOzIaRV2VB
 SEhuA0ePTxjQYlIFroUyxHeIgY7OviATSqbA9YmVkMBDQDpCwPf6qYCHMmD4We/qSOvgy6BL
 xGsJ+M5WrmoO3LcbRHy4AsH7W62rhgJmZ+75wwSBkXFwv2cHX94C7qXm4BAYGQGzCzV4AAFS
 DI5Kikdo+OqpEPIa4PWHWpzXGphvqhXxm6hB8LOtS1SPNjf963ANoTtoA2vlTHqWk1sV/3+T
 EwUvKj65G3UOZQ4gkkB0uLivJFpL4UwRV2waQEBgdJTYOSTRUmIdU1zC2iy5tkIjyw0gpX+V
 DZhkfZ7Ff59me65cmahQKFQ7k5KTlAp6o5hYHD5GkXrGzhawrJW1/c0JiFBJKaptqaqKSYpu
 mtLO17XaNfERnw0HvD5P5Av9ckfWGmnLFEVJtAvdZ/YtT/oqM+szxq5v16dnX1Sf/Nio0x89
 f2hvT7spfb/7KvnJcFhwLudAitebI7WODjp+T+OeKwlzFyfLPkV6wmuUv/Kmpte73j4pADpG
 feGDs01QoC+/66OFnIGRx2M2jvkDlKoXmGcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJTteUSSbO4P0tXou/c94xWTy6+ZvV
 YnfTMnaLj0scLP6f/cDuwOqxc9Zddo/NS+o97vxYyujRt2UVo8fxG9uZAlijuGxSUnMyy1KL
 9O0SuDKaD85mKujgr3i4eiNzA+NT7i5GTg4JAROJqzeus3YxcnEICexmlHh3ZCcTREJC4tHO
 LyxdjBxAtrDE4cPFEDUfGSX2TfnDDFLDJqAlceP3JrBmEYHljBLnf95lB2kQFgiQ2DM1D6SG
 RUBVomPXSxYQm1fAQmLL10ZGiPnyEqs3HACbwylgKbHozn82EFsIqObm95NsExh5FzAyrGKU
 TC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECA4jLa0djCdOxB9iFOBgVOLhPVAlHSfEmlhW
 XJl7iFGCg1lJhHfTOak4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzy+ccihQTSE0tSs1NTC1KL
 YLJMHJxSDYwqwl1dG8/reSg1hz7X85345djJtGd3Hwi8/bybef0DmxC2Kq+rDyp+iSuoKE/M
 fThXd4vrAc/I1I37jmzN/Ob82yyw631C/KH5As+S/ZgdjrTo3XOQnbZg0S1hweqbeqfMTb3t
 lLYU/Yx57sn342KX4Zs+1ZZ3yqHC5+xSnPdfyO+6uGbOA2klluKMREMt5qLiRADepre3HwIA
 AA==
X-CMS-MailID: 20200113053757epcas1p343bae16b96761ee4ead6bdfc6712ad68
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113053757epcas1p343bae16b96761ee4ead6bdfc6712ad68
References: <20200113053753.8184-1-js07.lee@samsung.com>
 <CGME20200113053757epcas1p343bae16b96761ee4ead6bdfc6712ad68@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_213805_170317_B2FB36FD 
X-CRM114-Status: GOOD (  16.37  )
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
index 76a3f0b9a7d6..7a83b1263be5 100644
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
