Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A15CA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDqPKiDdwLGbFcJlyT1ovI7bexq/qplIw/mfWnrb93k=; b=Nwzpbuukemeu2G
	AipSMr5mEaV4VtiWylqTM8/vB+8K50zR3u2DFCMVp57Sce6SMRmWUaE+NQVKKCKdGsVwh/CjW7SCS
	hbkOE7s5poCAD3r2RYT3k8HrsxyyGFF+Px2PnK1apSYh+q1Sfv2BIHi8SISeTHubpVH+zs9/qnQwl
	gEIN3ZlaVcvf2MkpMMwflN7OnumtycKjLVefl9YS5EV1ud4dEQ6r0akz0829aLXLuh9Cpp10Wj2Nw
	GnlswxBmCQIZf9SXsZUSojhL3DKh4ifC9wDk9CO1idt8V12AoigTx9kLfO70KdOh2O/Jm6eOnGFd1
	iQX10qaoXNOayDqlL+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFbc-00000006S9T-3aff;
	Sun, 24 Aug 2025 18:38:16 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFJ8-00000006R1h-0GKt
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 18:19:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn9JbGfP8PYngYQAejV8Nemct1aTNrUsTXEZ5nk1sglPJFA6Sm2EH9YB9MaSPbjUUCuIib7qD6WH8gCbed/Ubh4bHi2pb06pEa8AeNT3qvEfduSetOxX++lOmbRUXkAT5V9jGOKvw6WJO5YrxyUz3EhawCxh0G53LbIGBcXHnW1Ru7mLNY3c5Mzwac+FsW/1ZH/8iBIsvWAsn5j4akDpRrc+8bcqq/0eJgkYYYCbdffvsL459iMKfQb1eh+psYgUFOZeZ2Q5rdt0VShPes0LZjAJISjv29c5b4eAZpJhu88U1kNpAYP4BonTFJg0hCvl1zptMPxy6ZRbExjJwlWGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR6JoplnyAX2vo1rvhniEmWzsZJodWPtn39FOP2MwHs=;
 b=hklJ9rOMsDs12UHVarapDeRrnEQ4TDuc6tQ5HQ6oTBRov6qKFwhR6HmwjTYWTfLGuYKJLIGR91nzQozOmOAVM9/fFR8mz/8DFIqpNtezSr3b2iziK5lOEpul9kYveA0GIFFQxqNhLLkKim936Ea6qqDpCpoaGHYebSJBKqz7R0oP+9Yd5GUFGXfc+ImuY7YCKv5m/jW2S82YDUaT0xaRV8g5eWiX81JyYwVJwr4wWCVwsEkUMaroKoxlocTzx8wRE/II6c/4TTz9Bw9BD+ig5LtoKNwN5mnzD1KjODs6z2AqmiS/beQJQPJcgs/TwqMzDWzO0yjgHU2pKiRW6zJ6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR6JoplnyAX2vo1rvhniEmWzsZJodWPtn39FOP2MwHs=;
 b=Iw06kT/MNG3ZJJEJsjvtfXW5FhvEdckO1BX5PbMkimoxjf39fs8Cs2K/957KRtUS4CfC2xjxDVnGE8r6cc5nIOCjx9yaahRUW+PpEXBEfPBfqUcAg0RPOP44koHbVb/396r/9jerlFmTRIcQO7ebNdGliRWdGuWYqkhAv8k68g4LY9IdullxzM0e+oK7BMKlzSewuNXHvBgKsU7hqao75EFIIlcCu7+RXzFc5P/v+CDSUlhf1nqJWpRhvgaF+UOOaRSPErCafj41SuhDANrv/wvF16sXBCxFV78uoA21+wmWixSxRokbQcgBuumj/vPbyuAb7rz40VEe7WcC9OjfxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB5810.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 18:19:01 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sun, 24 Aug 2025
 18:19:01 +0000
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
Subject: [PATCH v5 3/3] mtd: spinand: repeat reading in regular mode if continuous reading fails
Date: Sun, 24 Aug 2025 21:18:50 +0300
Message-ID: <20250824181850.3994184-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824181850.3994184-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250824171331.3964537-1-mikhail.kshevetskiy@iopsys.eu>
 <20250824181850.3994184-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: GVZP280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0c507e-2498-44eb-061a-08dde33ab33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1kWbuYaav/Gl/W3oR4MnHUIdnaG19+Y9xPhwQUiSVeDbs6JjETp9cI7hq05l?=
 =?us-ascii?Q?3RWXsdgth6Ufr2JENG0wQw7VbEZi6xyRl6CvQewZyqVbCpwTj4OSCC//n2u5?=
 =?us-ascii?Q?ryXOOdokRkuztp9eo5wCa2MLmsHFwjpPOoKBXLktg+kyTALmTIQrSmxksZzQ?=
 =?us-ascii?Q?SxmvwnKOXBVSX6DXmSdxLakk9ybp4R4bes8Y6zvsoLFgeFaNPiixuFjztBV6?=
 =?us-ascii?Q?28HhhFGMy574qVAGfoYF+Um4X6/uSFdTxFUX0hlfORlm3wWmCXUYz55sjc9T?=
 =?us-ascii?Q?6Fl24qhUJOxoLRVxAMvK8MoC38IbBHV3VUEO2f9hkNO7PDH94FanuxlxfeNS?=
 =?us-ascii?Q?JNhCFgD/lbai+Xc09lDSyPjOcOTBrdIdr/xyU8/jRYMqZD+tW+yz0V2p3P0o?=
 =?us-ascii?Q?Q3FJMfSAcMNXc4Cc5PlRokX+9ZqMQrT4YeD1Yu/fydTQOQRhTmKenjYqKSDh?=
 =?us-ascii?Q?/ygcaOY0xg0CRZvn+t3w8trTPwkbsIBNWQVuzQqFLq8yyUPBcefREgo+eDxs?=
 =?us-ascii?Q?6sfEjEmLf30a1vifG+E78fjGRVYaklfjXucMC84NMltxiA34ID2MhOsfRdCX?=
 =?us-ascii?Q?++NwJL5C5grd6kWiTDVKAPA+7j46hzYRlqJlj6Pix/QnfVjALPu2J1MoWz0E?=
 =?us-ascii?Q?vEUVZdXUR0LvNWAi21+suCoXc+oAdijYDDfSl/VdxeveyUWy4/KW1+f/RsSP?=
 =?us-ascii?Q?zugWQv3rsJhREVjH8hv+pKOWkn32r+5Jfy1YVCmflSjzLtfdNUYtUYXH5HA3?=
 =?us-ascii?Q?6vzOINyiKjXIkOgqzVqPgZDKJHkpt/JJ46dNm8vzbxgfH87Rf7bowM9tiv4o?=
 =?us-ascii?Q?jlm8KECYKts4tI4TPBq+4hk4xNYbwU0ETznQqitFBQ1UrTCwlorT8i20kR1E?=
 =?us-ascii?Q?acliipAHEU6YsK40DGBO6FroCfDSNw36DKkFAOpVLgWwXTWVsx8n2NPKBplB?=
 =?us-ascii?Q?0Q8TqIRu5DnvUPSs5vlXpssFng7bfCc7CI49mTloFU6pi7hEA9Llcrg51RnA?=
 =?us-ascii?Q?xmSF7vBPNn+2ejLhgNWldsGGA8h6+HhvtnhJETBIs6Dz4IPjPchGu+6zXr+A?=
 =?us-ascii?Q?ypIw1TqnjPAjPmf3D9y8FxZ41SOHXePWYmxLjYqiTJxAnELjExAcgxlHghHm?=
 =?us-ascii?Q?CWsKiNbHA8V1L/5tol/05HJB9u1HLrWi+wTUqJH0eQxWkKb5URTUCtqRYXXs?=
 =?us-ascii?Q?OHawkjygn2hXuHoLEMCGLbB6dY+ipnv90p/QvIVHRdORtO9FAPJ8v1LfG1/Y?=
 =?us-ascii?Q?mZ5iwtK0w9Wy5UqZ8sUvmGl7/9GcaXzrb7o7HIghtnCIDPL0kHIvdb+5+mxI?=
 =?us-ascii?Q?tX3AMVP6nr4Ke8QLiyme/jsmKuP+6AEE2NE40c9QtEs/Os2dqL8x0vJY/BXa?=
 =?us-ascii?Q?ogOP1z44jGXnkoDjqoitO/4fYfx2rCmGEQRHjDauIst/fXlmCZa829NjYzC1?=
 =?us-ascii?Q?gNdPw65+BBriPC/ahsP9Dv47/7+gChqmoheIhN+8jy/enAl7h4xbpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6B3HWOB/c7dm5VuKeYsToFtHpLIZRfYl5VvS6tbUjyiernyC7rq5MqXLUssJ?=
 =?us-ascii?Q?KJA8p/M3oKXeMz5Q++WprsHfoIebKUni2UVP8NcYj1bjhBByt+RkvGJXdzhz?=
 =?us-ascii?Q?nRIPu6uN+6Llxk21tuPN91O5ROx/Ut/5RbUBt7kl47DjbzxsB2YluFs56nEw?=
 =?us-ascii?Q?COyDjXZ5EZAhAWhIQCm+FobF0IsZrNmtroQaHIwk82kBDO+WA2zMGWbFLPp+?=
 =?us-ascii?Q?eBoa9Krjmh/C2t/bDB4E6ffgwPR7U4ESJGnoC7/zoobkFNiq78daeM06Vowz?=
 =?us-ascii?Q?7kjZlT7w88d9S/IazqPXrMOb6XDTyB5MnMvz89RdVuOfAJFY7/UNXVwqUoAZ?=
 =?us-ascii?Q?Bl9s7m7rZj6jIxZHF5g0N7rvHxABhT/vx8Tyj3IbTdGsx4eI5mNX0mQTiD9K?=
 =?us-ascii?Q?Da4P1yHkdSQAU9VvqU1g9iqed7VT5y2XxrOIAcCuh/tZeUAtr6x1UTqIlD8u?=
 =?us-ascii?Q?9Qm9LmBkzom3kIFOpzQo3wzgPNoNbZggEbn6ZO7EAgilOuOwxq4EnsSdJRkU?=
 =?us-ascii?Q?TW+jiaAGx//dTTNNsocCvajw8mSeCVH8P4gQxPi8OkL2ij97C3+EbrrZRHf+?=
 =?us-ascii?Q?Zp88FVsxmsFqEFnwjxvOzb+7XG/leijauB+LrMDE+RGWMAnD/rfVhDRlNAEX?=
 =?us-ascii?Q?+qaCZMlquJ4q5K70p/8QwTtY2GENIe8HVU/4X768txE7e5I4GeJHoehCApOD?=
 =?us-ascii?Q?N9YSL8wVu9qKQs0s1bOSPhrXvHHi7rdcr0l1TxE1HDWCJ35JbMDAqHvSsWTG?=
 =?us-ascii?Q?QzPvNydP0l7TviQkai9o0ResKt73WwxsR6/EBj681Wc55OswB6PMt3y0gdxM?=
 =?us-ascii?Q?s3HPw85aERdVkvME+m9T1rR8J4lowGqO6wJtUhQx5Kuk/4mmjjl039WYOwGK?=
 =?us-ascii?Q?oMtvVf9ynyf/IovbvyBI2xhGSOOBRLMG/2CubVexXVbtgZGoFcyaGNm580TU?=
 =?us-ascii?Q?RxUDmLYT67mUGR7mdlOImjltnWXTMjNjhXqk8Yn7vS5KhAM7APGKztlarMS7?=
 =?us-ascii?Q?xYVgQbeyQ9SnDaDI8kxNVkKT+UoAITj4qH/PkgT15WZPCIC2sYcZlDyDvgjO?=
 =?us-ascii?Q?5WHC5rhG7RbHAZPlgi8vPNa34XB+QZydY0Zphk+joZmRBRqQ+HxgjDaDiSW+?=
 =?us-ascii?Q?zgG2s3KN9oeI7IFJFM/28dLTFXQUK8UarN4lUuE/dbJPGAedQnKvQScRQJ1U?=
 =?us-ascii?Q?rZ0RnMZqB7OXoQHLKylT4YHq1Hqres2MGKVeNlR/fjYJ7WZGix1WyZ/HGKfm?=
 =?us-ascii?Q?GnlZqyFGkZ7WS1W6TojfZorzaQhne56cVtlaBmPSBkCY5qMjM/4GdM0OYNu2?=
 =?us-ascii?Q?Uue9n9/P273hiWpkw6Kz1ljkf3QvLpplttw01vA/NSt/f20oW50d0cRax8fo?=
 =?us-ascii?Q?sOViuYugXSjSNParJeMkLd2xKB6BL+zN7Gb87U96V0ffkHLuChcAZ4A9R1SL?=
 =?us-ascii?Q?PMaUk7HPcSnCurdKlaNREjcazkKiZL46i2dtDMPD9yqX0kzWExDTd+M+en5V?=
 =?us-ascii?Q?1GK38VNu2XVocJmWbcrfNn5PWdKyTyjr4xbBVqO7u1gnM0kqgPcjBK986S5u?=
 =?us-ascii?Q?bnNhnk45Gamt0ICqWS+cqvfjgN9hPjIsBewXIRbBq/8ZRgXgBIqIXJfJEoVu?=
 =?us-ascii?Q?1MIg6kMYLFeU1qRZ6Cbj0DU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0c507e-2498-44eb-061a-08dde33ab33f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 18:19:01.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzgRMjONxZG0wbREqFCizhCaDZ2Vs8liFFRYqtARYL6BsYeZbPrz5Go/tsSkzKTTn6MjUpppx1PUJZ1fkQv8w0krzy3r9HY0/61ZtpzQ1yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_111910_102265_8BE988E7 
X-CRM114-Status: GOOD (  12.42  )
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
operation. Unfortunately, not all spinand controllers support such
large reading. They will read less data. Unfortunately, the operation
can't be continued.

In this case:
 * disable continuous reading on this (not good enough) spi controller
 * repeat reading in regular mode.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 02e322490110..8bbcc80aede0 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -430,8 +430,16 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		 * Dirmap accesses are allowed to toggle the CS.
 		 * Toggling the CS during a continuous read is forbidden.
 		 */
-		if (nbytes && req->continuous)
-			return -EIO;
+		if (nbytes && req->continuous) {
+			/*
+			 * Spi controller with broken support of continuous
+			 * reading was detected. Disable future use of
+			 * continuous reading and return -EAGAIN to retry
+			 * reading within regular mode.
+			 */
+			spinand->cont_read_possible = false;
+			return -EAGAIN;
+		}
 	}
 
 	if (req->datalen)
@@ -899,10 +907,19 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	old_stats = mtd->ecc_stats;
 
-	if (spinand_use_cont_read(mtd, from, ops))
+	if (spinand_use_cont_read(mtd, from, ops)) {
 		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
-	else
+		if (ret == -EAGAIN && !spinand->cont_read_possible) {
+			/*
+			 * Spi controller with broken support of continuous
+			 * reading was detected (see spinand_read_from_cache_op()),
+			 * repeat reading in regular mode.
+			 */
+			ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
+		}
+	} else {
 		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
+	}
 
 	if (ops->stats) {
 		ops->stats->uncorrectable_errors +=
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
