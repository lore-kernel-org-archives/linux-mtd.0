Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F38ED73EB9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jan 2026 05:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dVEL+qQV80uZUFViAU3jLnSYa+IsZqO0XXkkYXJ7Kp8=; b=CzpfkSCb+M7XBc
	VINVs6zAQAOArgq6dm8/WS3jnRlxzQskMtnz4WXI154Ez/NY/bF9w6RpVZnFIuLYMzwpgad+V1sXJ
	DDEfISLZvpdUERHZLO/C/2m3f3JONblxvygVY4LPIDfxzgKqphfVk1J8IDGHHBTdjScF+3wi3IdjV
	IagP2RJ02wB/Whbvkx5mhN+2r6gearnGA88+8LdGuafdaqEZ8i0kdwW7h58Dh+4HBazPIYnVJTuZ+
	aLLB2eg1pNe2WS8Lf4mHZHFH3NPykwwXuJEY+jaqVogjhjFRBdA6hPSaT9kbsUtJNKfSAnNVeZ13h
	n8ywxRWqrtkJkWgFulEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm3WZ-00000002KbM-2cr2;
	Sat, 31 Jan 2026 05:27:59 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm3WW-00000002Kb3-3c5b
	for linux-mtd@lists.infradead.org;
	Sat, 31 Jan 2026 05:27:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=som2kOcoA0yH67zeTi1Tj6BWHcf2Sz8Iy3eedKD+gPKedbdB6OBe5S9fMk7WQxtyvLbZEW27rmaJpoVRlejVB+RJZlb2jxFqhCa6SsFj3DeTiBar1mzHJt2dCYtnnW7dA6h7LsbVJhWQiuGwTLpwUmInzkKUl2XazkO1QiMjUDk3pzt1aJgzL/eFXAsO2XmLFSA7KVy3h2EDwcyOBaNVd0gHYweAv7Lj4t8iv7tJvywdvRUS2J0v5MBA+1Xw7l92zy9Apn8EN1lKEUK51cAjV2l/gbgCWVo9BIA0vU1FFv/oApA0JnHr1TtxuoGlYU+k0NUAsuGqY/XCaGHD0DjVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZKzypaS8efQVMwRJrOqsm94Cz7p8QWiGnQWHoLsekk=;
 b=xIRi3yTyKVXe63owJn4DhaAu44jVI4AMz8OwnZos1LnB5Hqw/eZK7mZJx2jTXkOZzLV7riSmt61G+a0yp9Yt8lANbgG7OxUi28GqcOEwCDrwpWXP4vQGdJtiPr0l2ha/X4SqcJw6ZeN4X1AXwq3+jro3Kuj0K2+pPfGoqxHjDM/lhrBJE2BDmpVLa1zAerM46HH2Z+wjf7joGCsECQlXM8G7cn+VGl5M8JwvBL3hc8BJNZuimi88MAhXdoDye9Tox7NSwJEYvkPQRaOE2DPotSzf0/UyLviUm1SSj38fbdOJ6j5UJrXdGROP8yWPIKuDofmMmHsjhTsNXaMavyZyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZKzypaS8efQVMwRJrOqsm94Cz7p8QWiGnQWHoLsekk=;
 b=S8CyzbD8r6s/ayDsApj6WN4CsBJt/lx7EfZ4sRZkql3OZe12nauZINtz99/fDZUsMM+0yD75NBXWpubalW/1CJwAYVO8wCd0blQ0caolWRQOYWMLzNxcOjSbXqrTVMTbpC9Gt5jonZzZkP8bCdNY72KcsILUG6gqREBql4ZDjOElw0w1ojvwPotJ041iBklRDSADV6uXBMeH13XGdZdRtwjAfnPIREqfWgojgwuPnBpLxMhExG232n73GHT4tF4reP1XxK7BsN5VI6gJ3L1iw0Q7dSPXvxK38YDjgIkaHkkiHCUW6U5LVh3n0oaNlUoStiQ/vb+JKkuxllR6LSj3Ow==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by TYWPR01MB10256.jpnprd01.prod.outlook.com (2603:1096:400:1e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Sat, 31 Jan
 2026 05:27:49 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::18f0:95b7:632f:9ce6]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::18f0:95b7:632f:9ce6%5]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 05:27:49 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nick Hainke <vincent@systemli.org>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] mtd: spi-nor: macronix: locking support for MX25L6405D
Date: Sat, 31 Jan 2026 13:27:29 +0800
Message-ID: <OS7PR01MB13602AEB5907C4B1B85767DA8BC9CA@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To OS7PR01MB13602.jpnprd01.prod.outlook.com
 (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID: <20260131052729.1381-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|TYWPR01MB10256:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9a2dfc-06c6-41ac-ec82-08de60897957
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/B2Tj1Eeq2vIa6eWx3Y+H4QLNCE2LsgEQ70ctjZ6H1q3HI5KTC5Y2Lwb07bqoR3dVjnkOiumE/LpmL8srv5Z2Xlx1xpRO6gq2zuNZ5z29zNyu71e+dTx6UjS75BC2XoqSnuWo+wHWCSEFvJcXjve1zajHIDK52lGqB4aNrOD9rvHnO+fnU0Z+JEDUcfPfUEwDIjN26H7Tp/5NuW85Hdp/muAUNLg1XJ46C13y/5xSIMSStd2LPfK0cSdxK3vKrkE/9NhMZM8FpPLqa8H0viFno1BL5JhXqEU4g20duz8Ungv1T872DolDXYEtGVs3JDQ1Qqk6dhP9QjG2ukisfNOEtqiolm1K0toIObU/HKO755drVjvMNrDr3O847J+qY+wpywM5PPGIl+UdXeMGhg8bCM/uTzEGYgVCdptozn2ElgsZ9vHW0cLu34JncPwivAd4fNLuIOdsGNVCQHqYshAOHE/DdxQ6JYasd+EkcKpGvCt9g6qNTbePDKPyAQEXGCGTjkYC5PQ2e10tLmWBWtENM7u/Kj8fVzF94c4ZW3EHzxSlDz7RCd4Zst6kVblqzo79JACac01SJApZO59dRUv6z+PuZhXzyN0/VArjnDpcFye9qiUIhgUX8DIe/8insUjx1QaAidWI+prQrS3aLfQRu6H41qz7Gs06VgxAUqFvQhNRXFOXODQO2ZK/u8sOnG/oqOXXNlZ5JR+cIci9p+jLt9qb6sR6gvhMJ689QToK+limvL1xPrEAa3A/sVrWtUlxo7IiIgLkTQA=
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|15080799012|23021999003|461199028|8060799015|19110799012|51005399006|5072599009|5062599005|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z0tjdhlmS0REGkfAY9ZyzGbHbIZ0Hxu+spvpu4hrtrGc1ayPGKvADYDK6sdF?=
 =?us-ascii?Q?o0UzdpATKRo27zS9M7B1GzCaaacgeuKP1Nul0C8crii37CXWepPoVMNq0Emm?=
 =?us-ascii?Q?PJKHse7vhm9j5BkLX3CZj+CfeD4O1TNdHfhGmB1YAoheAPjg3cpmYAD3SpQn?=
 =?us-ascii?Q?pea7I+fC5gXS3wgofuqcUFwGBc/V5JtPFofEg7e1JE95tNNVfsAtWp2/lkUl?=
 =?us-ascii?Q?GbQyHgtTkv2cdOKWKtl0h/wXZS6i/HK8iq+8+CGazZtoYUDjv1NQ/f9dnYuV?=
 =?us-ascii?Q?zzmafuqFyvpWEkhK8G30TRHGvncrc4BLJI4VPFw9BXS63oRtcPU5RcElCe1S?=
 =?us-ascii?Q?8x8WpFLWxf2I5Zp2wLhcPGzotFWy8d0Ywr9Qz/YhPgHJ1cH1RsgxwoEQ/YtW?=
 =?us-ascii?Q?q2JcX7Xg0G0rs29F6gOfVyskdF1y5eokAcCPc+AYq7KTKf3GE/DbFqKZJ6eV?=
 =?us-ascii?Q?+RrVaWxkz9NXSfnOXKVLCL+5WIjAFdtDAtdw5IYxv59EBtQGNQG5s+e3q8fF?=
 =?us-ascii?Q?5yURoj8AczNo4Dwr4LMxQR+M/muq0EVj+2fPPL5E4biqvhSiDM2OXZYoCuSP?=
 =?us-ascii?Q?OaPExyiQuugXE0/lmw8D/7BjPswi9NT3Dwu2tIZs8X2nbfzREtMQaDJP4MtP?=
 =?us-ascii?Q?pPb4j7RzYwQDGyQpNVoApNY8R/8L5qvCoBZnkr83WRjgBqQly367DXl+sjMS?=
 =?us-ascii?Q?dye39UPQC1unLDzLY4Umsn98AbQbUO0Uc8YreHPbEo4DUcOKNIWOM9ZFilsP?=
 =?us-ascii?Q?vOham79uwrtTY55IzQbEBzFv1KrLakrhucmW+vPeZ3Z4SqqvQtTBXTwPNGbi?=
 =?us-ascii?Q?O4T9ePhrF93+D850rZIEgMNKZgLyz5Tbk0H1X9p9sMh+eDFHKXr85WBxKnR5?=
 =?us-ascii?Q?GnhVhHKHopEERYadDWcAYdn7pkoVZLTU/MVx8N3WLEkekYaUvmXD72icbVNp?=
 =?us-ascii?Q?vmDt4Ie494q15VVq3i+SYx1GAyIbwatmg1qrTOIML9+5NiKs06Zrb6C+Yzxu?=
 =?us-ascii?Q?et4P6TEAIHtf+UnAgbopCz3bAbqCRlooXAvjVe5UAj1xmKs8TddszAo2FVm7?=
 =?us-ascii?Q?WqM/dhkC8DpAc0hq56XKqQZcs8ZDYNZ1i3pkrNICyAnesxjWDukb6sIAcr+A?=
 =?us-ascii?Q?VMR78VlWXOTdqCMf0lGaFJwO26v7UtWMtm5MKvORsPRMNHy4IPONCSR88BHR?=
 =?us-ascii?Q?/Q7U4SqL/QOwAKgwEdJSuXFTXAMsi2hWvqU0kaLowx/+u89eBDKoumVk9Kyl?=
 =?us-ascii?Q?QzNOZmYca9zE2RGqgKtrBNq6sAlJSiGwpa6ScqWvUg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2UiTGWr78F+8R/cxhRSaxDbrZhF+K79E3BEU2LwTzAgXRM73W0/Zj7bs3tnD?=
 =?us-ascii?Q?Bg/tWI9CMe40Fgz2+QHDNM6u07TIzONlT3VBOFdAe9hsWgpD5MRysm3Qb6Wc?=
 =?us-ascii?Q?I0rLi1KkAI0Zx0VbZS7fJG9f0pxDMhXc5sA4YrOK+58lwInheeY/UtdfEzuF?=
 =?us-ascii?Q?lJaxVA+p66H5+EFd8RFqrxZXMbgaE5dBql0vejeSuaKzplnoDmhGdjetM2hX?=
 =?us-ascii?Q?Mcai4T0PJM9WbjkPyFTiJT2oOMD/XfM4nX6VNjpbYBJAUu0FNJi2kYjmrONE?=
 =?us-ascii?Q?KxXyx72rUb9xG60EsDxTeAwA4x0tIEdQP1+6nLnP41pHZV6GXhtSLywj4inQ?=
 =?us-ascii?Q?FtdoK9LClvXiaZLKYaIlJoqkI6NQC/Eo3cp990QVHyKqw4MYPJenCnioFbIq?=
 =?us-ascii?Q?tLlg34iKhbg9IW2N/4kHWeVDGLtDRFM/xkJrfoDJyG3pXIzg2XbnDb6WKj8q?=
 =?us-ascii?Q?YrAVdHsn45kwpdhT/r61kI+OF9CB+WHnkwEo3JvKOR8bg+pOkyhYydKy7S2p?=
 =?us-ascii?Q?3b1yNq0lggRDiq0ClR6FPEy8VdLrmxGqk0f0Pg5NdOMt8U0c0LVTBWmTbGgC?=
 =?us-ascii?Q?1/F/l9/BbOWuGB8hHVC3zWXi14GJvJRK/7YDkpNMv2kuhS+ipU3j3dDvgipn?=
 =?us-ascii?Q?Xg5kmDOmnJM7T2EHZM4+Yq+jrjJpybbFGEdu3jwpkzKPktopoui98x7lT8ln?=
 =?us-ascii?Q?u0LzL9FBjSumDkJPC5FEemvYlC5nS9IELHYDGNskaRhSh3tMyZPzVMHNzUjP?=
 =?us-ascii?Q?LAvZvJbyPPRR8/b09Etx2ayGTJdeujboZgZERjoNE7g4h1eYgptnddzkKXnm?=
 =?us-ascii?Q?Z94stVMb6cl9uT8uTXTct/NBiSbM9kTPwUT/4ZItVHdihgvkut2tA80N7Gkp?=
 =?us-ascii?Q?N0l/ow2rUJkgG9UWbwJWWd5WJzuisLlogTyesscaRb2mfePfcZbR7m4chkie?=
 =?us-ascii?Q?J4OB5aijNoT2CqZ0MfNOnKs8SiBvC+XFRIYNFB1hMHMWvnHpz+46RZ7ftO8y?=
 =?us-ascii?Q?jzsmWfy/gDA+FS8nugDi5mD4Zt0acAI764HZ37vWPjvLEbVchiwu+2ByxZHg?=
 =?us-ascii?Q?tz9LVrKeZDBSQrkARyFzBz8v35xTP4MC0lDMezRy4N05bE5qixk1f6Xf3fue?=
 =?us-ascii?Q?kOQS89JLdFLeiKwBbd3wqK1UW0aDeCNPyx27MVrdAC+J4u7LeLhtmEdj16vh?=
 =?us-ascii?Q?dr6eW3Cnp5SHjN2Dl/IX/o48ruHCmPooCDGiFyH5Ihrfhii0ZDBjOzDqCQPl?=
 =?us-ascii?Q?lZLLn1CruKEC8Hk36iFcmLXSRE6NbbHY67REl8fPZCNWbm9C3G9JBii50LvY?=
 =?us-ascii?Q?954UgteSsb7Yf/PRNwLwWyg3oEgBtjb6mhWJVuWkypsdhZi6vbQkflo68Gxk?=
 =?us-ascii?Q?Mv3IM3eLkOCDkjxfDJbQJz8fGZmG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9a2dfc-06c6-41ac-ec82-08de60897957
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 05:27:49.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_212756_913580_1332C607 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

Macronix MX25L6405D supports locking with four block-protection bits.
The old revision chips only have status register 1. Hence we also have
to clear the 16BIT_SR flag so that the SR1 can be updated correctly.

Co-authored-by: Nick Hainke <vincent@systemli.org>
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/mtd/spi-nor/macronix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,11 @@
 		   SPI_MEM_OP_NO_DUMMY,				\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+static void macronix_no_16bit_sr_default_init(struct spi_nor *nor)
+{
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+}
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -28,6 +33,10 @@ mx25l25635_post_bfpt_fixups(struct spi_n
 	return 0;
 }
 
+static const struct spi_nor_fixups mx25l64_fixups = {
+	.default_init = macronix_no_16bit_sr_default_init,
+};
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -66,7 +75,9 @@ static const struct flash_info macronix_
 		.id = SNOR_ID(0xc2, 0x20, 0x17),
 		.name = "mx25l6405d",
 		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K,
+		.fixups = &mx25l64_fixups,
 	}, {
 		/* MX25L12805D */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
