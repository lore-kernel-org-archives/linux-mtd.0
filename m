Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62B2C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A89DF22CE3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehcR+4Gt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mcp5F8oO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A89DF22CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bALsiqZ/fxFtlNkQRxTX/41pszuqgxVqIZxTVbBbn+k=; b=ehcR+4GtZedkcu
	INouNjkMoFospDem13Ec4j2nIJA+jiiHdfYeboUSx3hdkA6dR6Kw4zuLhUVmWwCFs9nBEP2FktV+l
	vDLjvDxlSfSeMty+cSMOMmq5lXXNdKvepr87hYXZrZ7CDxDcfn6s/soog9a3j1lRpxIr5fDbZgvmL
	kAO5Isrg8qTmyhd5vIInznTkEis5cr4wFq1VY1COPiJJOBtNr/n0hR6+mv3JUUS+MVkp0Yc+7QvQv
	3N1RIL5uq14uu+tuKNg/KzSun9QWGLcv2vJGtZfgAIDozjJ3CgVo3ZgUkSr3537CmL0rMhDC9eGa4
	spoS0+yZi0uQbWTAyjwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Izi-0004Cp-KV; Wed, 21 Aug 2019 05:17:14 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0IzD-0003jn-0E
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 05:16:45 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190821051640epoutp040e0d0fac1c222def062e9ea3e50acc76~82E4EqufA2482624826epoutp049
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2019 05:16:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190821051640epoutp040e0d0fac1c222def062e9ea3e50acc76~82E4EqufA2482624826epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566364600;
 bh=FKLcGf85U0Nf86li2MDZ3zxsF8yMujzHdVm+IyMrbRk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mcp5F8oOvtjWcOrt4Syo4ASwvB9mrQ95JYBvuBXXncWbSdsNn4ifpT1oshcSOG4QU
 GRxlXHnZE92k9Og5sJkABjk86fvyv5FMPLKspsOB9/C/vYKzzN3aYARMoG3Cqf2/P3
 RUTaIHDTkP1KNbtUvFs8V84fAL+yJ9Jq7Vnku/14=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190821051639epcas1p10b2f071144a5098f82126cdff7413bd2~82E3j_SeO1562015620epcas1p17;
 Wed, 21 Aug 2019 05:16:39 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.165]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 46Cwr60llMzMqYlv; Wed, 21 Aug
 2019 05:16:38 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C8.9C.04075.6B3DC5D5; Wed, 21 Aug 2019 14:16:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epcas1p33cf6cdcfe470bc2bab971ba3695b7b98~82E2AHzxe2420324203epcas1p38;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190821051637epsmtrp187410d3aafce88b04c2565da11072e51~82E1-XGws0203902039epsmtrp1i;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
X-AuditID: b6c32a36-fb2cc9c000000feb-e4-5d5cd3b604d2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 40.7B.03706.5B3DC5D5; Wed, 21 Aug 2019 14:16:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epsmtip20f6f9a21ecbe9a54e94affa32630e54e~82E11Hm2C0489204892epsmtip2P;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v5 5/5] mtd: spi-nor: support lock/unlock for a few Micron
 chips
Date: Wed, 21 Aug 2019 14:15:41 +0900
Message-Id: <20190821051541.6083-5-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821051541.6083-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXd2Oc5NDtPySYj0QB8U1M01PZZGkMip/CAFQZdhBz1N6ezi
 zjRdWFFjml3MrAy7adhFYxVTwpUbZjeCKKELaipeirJ0o2KhidHmUerb733+/+fC8z44ppqV
 xOElJhtrNTEcKZWL7z9OTE2+/2a3Xv37qpi67WhE1JM+F0bVtzVg1Pwlv4gaH5iTUA+P3JBR
 T7tHMKrBM4Wo760bqA/1DWiDnPY0DcvojltJtLv9mJTuaD1ED81cR/TAlVK6bl5Nn+psR/n4
 Ti6rmGWKWGs8ayo0F5WYDNnklm0FGwt06WpNsiaTyiDjTYyRzSZz8vKTc0u40IBkfDnDlYVC
 +QzPk6nrs6zmMhsbX2zmbdkkayniLBq1JYVnjHyZyZBSaDau1ajVabqQcw9XXBcYlVlcURW+
 MT92GL2PrEUROBBrYNx7BIVZRXQhcDxaKfAPBL5qvBbJQ/wLQZuzGi0lzPp6kCB4EdQEXkiF
 x08EZ74NSsMuKZEE/XNuSViIIb6IYNp3URIWoomtMB1wLZQSE6uhtc+7wEqCgmlv82KLVXD7
 Xg8W5ggiE05P/RSFCwHRLYVP70YwwZQDTd3PRAJHw9fnnTKB42CyzrnIPHja6mVCsgPB+M3W
 RUEL/mlXqBCOY0Qi3H2QKoQTwDN3eWEIjIgCf/CEJGwBQgk1TpVgIWFq1CEWGKBv4qREYBou
 XKteXMsJBPPBEew0Wtn0r0MzQu1oOWvhjQaW11jS/v8mN1o4u6T0LnTtVV4vInBEKpRdA7v0
 KglTzlcaexHgGBmjrLi0U69SFjGVdtZqLrCWcSzfi3ShVdZjccsKzaEjNtkKNLo0rVZLrUnP
 SNdpyVhlywylVxEGxsbuY1kLa13KE+ERcYeRyBPhK+3/8b7lzgiuMGm3H2/pkSuuGqrOukl7
 oCqr1qkJTiS77M+chcP5du2uoVz35rEbuz8Onh917FgX9ecmp5iU7A2m9OijDhyVJyYoXx98
 +7J2v7eDC3bqJqPx9qlMOakwB3JFt5pyM0ZjN/W/FUf6G1X2c5+vxMj3rNCSYr6Y0SRhVp75
 C386/jmMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWy7bCSvO7WyzGxBosv61isbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHFJdNSmpOZllqkb5dAldG//sH7AVr+Sr2
 PXzH3MB4jbuLkZNDQsBE4ue+A4xdjFwcQgK7GSVO7ZjLDJGQkHi08wtLFyMHkC0scfhwMUTN
 R0aJq0veMYHUsAloSdz4vYkVJCEi8IFJ4vKkUywgCWGBAIlrDTvYQGwWAVWJJRf2MoLYvAIW
 Em/3LmCEWCAvsXrDAbBlnAKWEhPefAYbKgRUs2xxI8sERt4FjAyrGCVTC4pz03OLDQsM81LL
 9YoTc4tL89L1kvNzNzGCQ1JLcwfj5SXxhxgFOBiVeHh33IyOFWJNLCuuzD3EKMHBrCTCWzEn
 KlaINyWxsiq1KD++qDQntfgQozQHi5I479O8Y5FCAumJJanZqakFqUUwWSYOTqkGxppXj9m/
 fJXy0FQU0byWzyu3ayPPxU8B/85KVfvYKxtMd9F43Wr2zf5Ppapw7c2qr3bdx1sm7k8IK115
 9JHEHDtj4cB1kznPibks0+7mX8gdm8a4S3U/r7WG976qdx9+cLIsME8UZTORPpNQctdH2K67
 xkZSwH6+8sZg2/7YuXMOKbt9Zk9SYinOSDTUYi4qTgQArkIMlkUCAAA=
X-CMS-MailID: 20190821051637epcas1p33cf6cdcfe470bc2bab971ba3695b7b98
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821051637epcas1p33cf6cdcfe470bc2bab971ba3695b7b98
References: <20190821051541.6083-1-js07.lee@samsung.com>
 <CGME20190821051637epcas1p33cf6cdcfe470bc2bab971ba3695b7b98@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_221643_292254_52ED44A6 
X-CRM114-Status: GOOD (  15.72  )
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
and that also support 4bit block protection bit (bp0-3).

This patch support lock/unlock feature on the flash.

Tested on w25q512ax3. The Other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
v5:
 - remake patch based on latest spi-nor/next tree

 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5cb1a6ba2c53..93ca624b2a6a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2431,8 +2431,16 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{
+		"n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
+			SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3)
+	},
+	{
+		"n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
+			SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3)
+	},
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
