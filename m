Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6ECA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JPH84/SrP1MjqX8Z4kv1Cm1m8bpHr7jKY8nu/+HM9k=; b=uaoVkZTCpIyehh
	hUXAt16BWK4ZxmNFqvfYRoRpB1LKfvMX1eoNORdovqJozbDOmwrrPp2IaOLUYd0irJonukgqxcssE
	2C49/57dnDSrnoS1qBm7+11ownOEkq7HN1ulWMS+6BpWXW1pOBTbulCB9c81l96PMeOwHP/sH19EY
	r1eHYfF6cvGITsUwz6Cyl4ThLYl1PPMyLakZ2KM2vOy3vCGREtNwb2NOIIkUm4OjOgyFE5EVnZeXe
	xMPfQ5TGkVLff55HKRrIFzXMUui4XCpdUPJXAZxbhirppJ6QR0EgO0Rae8zh9E9DvkIMEPjfITKvh
	/ytjuX9u26oQbik/FW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqEHz-00000006Npn-1GDc;
	Sun, 24 Aug 2025 17:13:55 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqEHv-00000006Nns-1bF5
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 17:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amUQsgT1F3nS1uDkvsSNgMBaM3NL7ZDki67+NV8yutzvVJV4X0V8xaR/1/TSF3QWUUvK4X8zCUau+3s2e3UnNqXpeyFUjgdqeoPrV4jwJ0gkt1yYckXWYKCx3DP/yjQV6pOQOI40HGWWdsb7FoPbstpKf93Q4RbLTcX/h8Ei5xPAolvcDLIu8cJxT28hWcq+p3K05l3t+TlowtZulwcK5JjMcC0IaJpRPvzT8so5/Ac/hoC3X0R0BxYHD1Y9pmbAAGcZdPWgC9C7jx71fzJGJmxmTO6lL8GqJZjIsPwIXU3j/tPnrmxa6ZBggvenmkXhSkSb6vbF/PzmZiBg64eogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQATUBF0fnU0xBIpNZ0UIwL9CHxB3T/bvR2BEeSydgQ=;
 b=d6gkIgXtYHkglWUSEPVLJSsIGioiMEQwYstlHHXHEOHp3KQvLO2CYOWdrIlvPJaeB05Ct3Z8dM+zPAd8GJ0LxohaVGXTTrTSTlfNKmtMjcIDkEOJthS/K0cIhWd4/RRF3/7ThBNRhB3wvj+CGVl/En8jwu0jT9qhxMZRljz/rFhjJ7UFkHCv4SggAQVL0XKUtySlix3PKZFYUaxayvBrS9C2s2zpYJBiu1bjjNFYvg+PMfg49x3ZVJI/K4CUHO8HM0sX1qVDP1L+FLg938TvRtAWwfJIV/d2sW/UPo8JMxBseO0krL3q+lvTU42i0x3VLFLMppPZj5l7hyEpGLcbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQATUBF0fnU0xBIpNZ0UIwL9CHxB3T/bvR2BEeSydgQ=;
 b=PfeJNVxecKcd/q3dPk49XugPwQIgGsVFyQfFdF+fy20FVbQt+hbUVKQEZexImrQOA8ckWmr1Hph6aEo8PiJ8vNoCJN+OVh6zvn00xE4P/oF1jk3fxJOqRZJViROAzDdSNlO+OshmgTSiLNnlrl7M2OvUZ8Hu3DZJy4EHlE54bxJkXieAxgZVB1Ao2WO/bBaZ77JSrnHKw+w3iz8CWwKEqtFdfI3R4qVpRn2+Zsfkf9zyk1w27uPmub8synIAcBU+Ii33VXMlWNqX9GT4TnR7W2FO0d4m33ARZTDMOylIQ3b99NrDVdbb7N8jYPcmvPwbmBG4NWZy1zZwZiwr+OLD0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DU0PR08MB7908.eurprd08.prod.outlook.com (2603:10a6:10:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 17:13:42 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sun, 24 Aug 2025
 17:13:42 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 2/3] mtd: spinand: try a regular dirmap if creating a dirmap for continuous reading fails
Date: Sun, 24 Aug 2025 20:13:30 +0300
Message-ID: <20250824171331.3964537-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824171331.3964537-1-mikhail.kshevetskiy@iopsys.eu>
References: <87bjo4it13.fsf@bootlin.com>
 <20250824171331.3964537-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: GV2PEPF00004530.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::359) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DU0PR08MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: f3953b94-cdf0-4a31-3051-08dde3319387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y4vIua6XaxEdDKyFo0ibRvXGloJD2Hx5icoGtJtbauDp/G/oPXno5rOSpcBJ?=
 =?us-ascii?Q?w1pGddqH62mVZ9DueV45BvqPtw1D6oTFJC2P7mACx0txUV1W66lC+AOset0J?=
 =?us-ascii?Q?qLG0p5uHLz6ytr9+A+fUhrH3JFRTa/mDHc2dcs8E2G2yVQRogTgMXekxC5TW?=
 =?us-ascii?Q?tDDjuXqy2UqWJGF0UxMTPyLsGQg8xOMIcZvh59aCOZOckUe5WiNWr2tM50Q4?=
 =?us-ascii?Q?q0AKoG3rbgu6oMqOuY5KP8UyIHDZ2xF131B9KFk0pxcEa78NO6ry3HlyKx6Z?=
 =?us-ascii?Q?Wni275+ZbuNoZ6D366Mnl32OXRwf1/4EHHz6CHcv+/vwmOimlq5HOqfH+5Fy?=
 =?us-ascii?Q?5myRnHsxSfapnoJd7pDPdAUswdB/lPgjbtVD+B9Z+QZ6yr/aoOwv4tEQJz0U?=
 =?us-ascii?Q?PcHAwS61fFLXbya/qqB2MYnyQNWbDwJmmMZuruOchm4Iw2xlGOw5j9akeFek?=
 =?us-ascii?Q?fW2Jky3He5ldUrbsSQgm9IVoJU8oNv+R1Y1zR3y1V1sxi1cgpn4dwdAhXr91?=
 =?us-ascii?Q?MxU3xQ8izRc7dSXb7AXMkq8jvBBIGx2FXz6oRbV3xASpSnoiGQYMhLDY0GQT?=
 =?us-ascii?Q?BpvgNPDVhKYjaPJ/qXdxbKQXwKWohGZ30Km4gFGnOER9XwD6Yj99sMAnF6rH?=
 =?us-ascii?Q?YJE3XmzdDQvQKnvI3qZatxhSX/ZrFGudy+LJDXL0SJToHTPtFrLr96S942xt?=
 =?us-ascii?Q?K8QD+yEk4NnCqoQAkLuGB95oRdsRbRvSPhgk+ih/8XjlCUt9fDlPM3iTuHoU?=
 =?us-ascii?Q?8k130bEv29o0h0mKBgeEgv6NEyco1oMZKNPbn88LtGAn+NCqW3oP0e55eaxA?=
 =?us-ascii?Q?Qdwe6dCaQDIVoJPoUOQKlujLxel6aX3gkVjuhmb2YicyLf1T/IzlwmN1PTLT?=
 =?us-ascii?Q?66OHRMurwwd6MsbyMClpsRqaKni0V3nusOhLLjokOtfbu5AoJU9OlFO7CM+p?=
 =?us-ascii?Q?jacHIP6YT9qabMF364BxDxfyfU9buY1a5gWpfn2iAMALi+vjxv/LNaUgzJlu?=
 =?us-ascii?Q?dxb46PEambfVlABGKfa45ixtvs+WOULp2gXFyRnakeEoqErdcbuEWfsY7Zun?=
 =?us-ascii?Q?RBiiqtUpo7GnD3WhVXC8QO+l8luI11EMCNyhlGaMygcjCmrZ7DbzHS5INeVE?=
 =?us-ascii?Q?6z+k66/JzQPFamNRFBVfjQFl2dET9cqptfxCL07KyBHM/EarKY6+4ZGTySZW?=
 =?us-ascii?Q?0t86oEJngQbOo4DZ5roM88sdA5p/hE0xEYeFxxitdzSZN/O5VbBQOtCr150K?=
 =?us-ascii?Q?YRuMnMKy+7ZPLpqgiORZWdXYwgeOwW7075+xtGHejGqe4YZ5T9+tkzj0SQf0?=
 =?us-ascii?Q?mtdYDfx5WLn7FyIP3ZOMtc/E04bVPHyRyp7Q2rcy+B0ls4cZQ9IY27Ei8fYb?=
 =?us-ascii?Q?14I9eWmXp8k4aqhMNL7n+VDxiAsfH8Skhp15eOaSiOKmRo96XkOzKH/vi+nO?=
 =?us-ascii?Q?GH6WDMDHHoaCT3JZTkuenDKJhnLDh6JK3vCLsp9NPkzTAl3qbG1VJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kn8PgZdTiqF3gjH0aplHsNGnGQO3bQ56oBxPNUXlMglZVC+8It6ua6KbdoTu?=
 =?us-ascii?Q?rZuWlaU6XDqZVG1KKFvp3//CsXy63SwrL2X7kbmqliRuIv/MZoaa9wdkny+/?=
 =?us-ascii?Q?irSQRrp7CSYw6jTiAYKK6so3Wj1MP8SJSqoBXrqMR6B6YxeuC7C3WyZhVf/b?=
 =?us-ascii?Q?YQp28bZGB1fOHgaGom7xaIyxcfVN8Jc22PEwYpr/tFjpM68duUtp7aU090dp?=
 =?us-ascii?Q?BK8kgxx2Jw1EPatg0xqr+10clg7eKiXeFdpnE1yyd7KSrOKxRhCrkgR6wvUz?=
 =?us-ascii?Q?wGKAy0ddaPO845MR2Qb/GCmWOWq6eMTQuvl5TSmMwVEVb7qPuw9+1j/1Wtkz?=
 =?us-ascii?Q?OG/xcFXFRmrTMzPSQ8PDszfnuPzSiZWYLUYF42cpJ/dy7L1zO5gT9CTjamsB?=
 =?us-ascii?Q?wjSRMQRgABgp7YcVE2di1p89Bur55FuQlmv4lKszWzCfUzBoZsSfQKExkJaK?=
 =?us-ascii?Q?FVarYfEJ//PP2SBdTrZuYn1937p4l4VhXbvwciyDsylrOE9JkUg8MW+Ycva/?=
 =?us-ascii?Q?NtwwMKgP0ZN2y0Tjjma5VyKdzQR+xLgcgS4/s5u+ox3Y2CoS+6xvftDwJnOU?=
 =?us-ascii?Q?IfTiF7FbKAHA+U8fHmZS/aEU8XM5EWcaUtr+fKT3IteydytWKAR13nOfZBle?=
 =?us-ascii?Q?Cqp57upnPJkHm9oeEj7cnIX8CubIgA5mGG4mesQr89sFpHeXAo62vjNSf/ir?=
 =?us-ascii?Q?cex0oEOqyjlCceTx+bkcJBk9IOY5SI8aNVrC0eU21vKdHhNlr5QV/iXAb8iG?=
 =?us-ascii?Q?m7KM6IM+YjeYzQoZE2cYN0pv1ekjWpX+Vjk+wk6WHvLunwM0tx6/MqYCrXx+?=
 =?us-ascii?Q?GTHqXnuTT9Qu+EzGpRAbMZNp22hUZMObY8aJfjnj1SYchFTzDy9IiTvcWi3Q?=
 =?us-ascii?Q?o9WGn/jxc8lSgHZtueOuTLzI2+fHaghfz0hwMWuEXW3Mv+sMwjbIlJ9F6tH5?=
 =?us-ascii?Q?inWoj/T59phrrZEZgT3eUOZYeKvYpxjNp9s9986Vu6qVuX5q/UjEPAxMp6Nb?=
 =?us-ascii?Q?bqsVIGI+ZVJXfRgGDO9Hsyk+EyjcOWXP6Z0jPPSMpjHhSndcvsenTfswIGGm?=
 =?us-ascii?Q?vW7ghBjaZvOta09DX5NNeFvg5t9k91y2gX6Q63a9frH2T6LzISaHdG7br7P0?=
 =?us-ascii?Q?D+08fF3bwcliaqqMeHSiQn/SVrgcpVuGH3rGKwZpunQiDmuDIx5fCb8geb2u?=
 =?us-ascii?Q?spyMYm6eFGRouMVYhWjvfpjy22tcBaGoPS0Ai8WPtuYwqNyBTqSCrsfZ1VgA?=
 =?us-ascii?Q?T91lvfCwNkYL0BOJ7HNBELpFe51b9VFbhWQtNt6sXhgABfSKSnnFmdNy+0K6?=
 =?us-ascii?Q?PNM2NATyJTw+954+9KkMoSwkkftfEIrxrIzvYvVS+r5sBSnfGws6BCaMQQ/4?=
 =?us-ascii?Q?y19niKN0VCYNwnV2ym6uDqwQcqKyrurXoV6edHomXakxehis15qAhwx6yIf5?=
 =?us-ascii?Q?B28xKaFPjhVEXoRt0JOVbkScJtlxCOcjRwijLXFbAOoOeYoWI5xTOLdtOFzu?=
 =?us-ascii?Q?ClP88kSORzUN1vDjDL858WB9ciTky8uSyx2lXA+u6lpYWNBuxaXn1U1Zqt4Y?=
 =?us-ascii?Q?vkdVu9F/HaeuHCcERUHmDgpP2ER0kPPZ+2f/nx4Uy+fa6dUeo9M8pj4g6kgI?=
 =?us-ascii?Q?KCX1cYmjc9IwbNEe1uNt30A=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f3953b94-cdf0-4a31-3051-08dde3319387
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 17:13:42.6511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmeNQCxRI3jwDIXj3xJZuJHx3mDYAeY0ebFYY8LBP7qIiVHOEbj+7GvBN5bFDXZM6sM/DYgGZedUi6tHB9sGNBYlTia/jo2fhoFsCoT2UFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_101351_427374_A5C2E957 
X-CRM114-Status: GOOD (  15.00  )
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

Continuous reading may result in multiple flash pages reading in one
operation. Typically only one flash page has read/written (a little bit
more than 2-4 Kb), but continuous reading requires the spi controller
to read up to 512 Kb in one operation without toggling CS in beetween.

Roughly speaking spi controllers can be divided on 2 categories:
 * spi controllers without dirmap acceleration support
 * spi controllers with dirmap acceleration support

Usually, first of them have no issues with large reading support.
Second group often supports acceleration of single page only reading.
Thus enabling of continuous reading can break flash reading.

This patch tries to create dirmap for continuous reading first and
fallback to regular reading if spi controller refuses to create it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 43 ++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 09dd6e40e308..0f8636047365 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1093,6 +1093,39 @@ static int spinand_mtd_block_isreserved(struct mtd_info *mtd, loff_t offs)
 	return ret;
 }
 
+static struct spi_mem_dirmap_desc *spinand_create_rdesc_helper(
+					struct spinand_device *spinand,
+					struct spi_mem_dirmap_info *info)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct spi_mem_dirmap_desc *desc = NULL;
+
+	if (spinand->cont_read_possible) {
+		/*
+		 * spi controller may return an error if info->length is
+		 * too large
+		 */
+		info->length = nanddev_eraseblock_size(nand);
+		desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
+						  spinand->spimem, info);
+	}
+
+	if (IS_ERR_OR_NULL(desc)) {
+		/*
+		 * continuous reading is not supported by flash or
+		 * its spi controller, use regular reading
+		 */
+		spinand->cont_read_possible = false;
+
+		info->length = nanddev_page_size(nand) +
+			       nanddev_per_page_oobsize(nand);
+		desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
+						  spinand->spimem, info);
+	}
+
+	return desc;
+}
+
 static int spinand_create_dirmap(struct spinand_device *spinand,
 				 unsigned int plane)
 {
@@ -1112,11 +1145,8 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc = desc;
 
-	if (spinand->cont_read_possible)
-		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
-	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-					  spinand->spimem, &info);
+	desc = spinand_create_rdesc_helper(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
@@ -1139,12 +1169,9 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc_ecc = desc;
 
-	if (spinand->cont_read_possible)
-		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
 	info.op_tmpl.data.ecc = true;
-	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-					  spinand->spimem, &info);
+	desc = spinand_create_rdesc_helper(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
