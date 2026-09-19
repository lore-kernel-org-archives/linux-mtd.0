Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14AEC982CC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WzjrjBTZJeT0FhK0HbrpYDekjuuPEmaKx+vx/9GWSfw=; b=RpjeyDe904Y7Ms
	5QqVp6KVhQjDpyJtC2pSTrJYsf79eiWC7nL4Xd4ZCkaGCE0UWsOPeRSDiBQh+GiJWd4rej2nTZ173
	vBtNYCNHLJdCEQCWOK30yp+aoluYHttITf5J8QspomRH+v80WpWmfNMqiA9sOt3SQhQ0zOUKBa1i2
	4ug/pu7F95FHAND9988fyfkaDCDXuP1yw7n19LoUCPyPzIKVQdZGSIiibOd1Akg0thwfujn1/apWm
	jMa3Tr4uOzKVHMEsZ0uLWd+6l1JKtE0aKcNjegvcPwNuqILKmoeT3yzZkJC3qeduSx7GNAA6nrpiW
	vHtcYJ70Aj6bQ9cblXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uqA-0000000GIyK-1udz;
	Sat, 19 Sep 2026 13:10:50 +0000
Received: from mail-northeuropeazon11011033.outbound.protection.outlook.com ([52.101.65.33] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uq7-0000000GIxk-0q8X
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 13:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMitY3NIYjCCPzjswJpHLeB+BMaBFL9ziFOotax17mc9VJZpdT/WDJpsMXXsmny0Tg0E65n+tC4eJcWL4msv2Le7Ywz4BmOmI7DcIyiS7c+3HDVtK25EnYJkoPi2gytuf8GyxHH6e9CsATHngXH3ivjhSvJHAk0oBClSFkP5WnKDW+AVB/L7PTwyUMxcTcKclWNYrzJB2DtglWS+kCN3bLuqIit912YXwMvmIB3fBQcTFzG3uBNxEi63cZ6l1HM+yHeT/wTxTiLQ/WjWcviX47mz4IdKQJfACQuRqTLXtv7ACDPPu3Hviyv7mxinYu9HRYZkX140n5wBeozpBnBP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gda15FrxNEoeHFP98UEZcxPTfhHnlH+cXH+acVu7fUU=;
 b=sDq7pV42rGhvHjZMJPjK4g4NRrKDNAklaotRoeI0fZoEO7AHz2dsOH4uAtGU3mTnGD3BTOhug3HGWcCdW99Gasufww94f4CCkH80RQFNJhKXHX+mKimYG/9tIJQoT/DvWoij9L4UVWkFmbLMxGJffWwyK6KJlm6t4DXPgHFNnmrUDgyxyS8Hk3ILqG6ZPjfGV+4ugom1Ba18L0DRTZxOXD4XJ1sOHROm5RK/yNeKLQPpktlFoYt16Z76Si6QtXIpHqSkDUzSTRMeehszhT54KCXGjcKqHQ4372K1oGTvKL58UUIFJdf/ekwlU/MHcgm7+17ap86f6qG2Dy0uV5a8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gda15FrxNEoeHFP98UEZcxPTfhHnlH+cXH+acVu7fUU=;
 b=NFYscxnw9SfUIoukKbaV5SRm8LywITnuUiFmOP76U81em7tCZQzM5XhsxRnogMvd42eNrdVhUQRxfbD+//be5U+2yCY5E9D6pspKAb8GZ4HVsM7rpM+aiuQaljHrIdVAN0Bxbqo0HVwx2wojgjQqGId9gaOZlHNuVO0/EKG6Om3Qgt3Jv6R0zZekgd0w5p+1exCMAjT5ZZzVnYWDBsZn1+QAAenmMUifCE5lYfpenDZ7SKb7fkq8nby3sOiVhtQzs9GO+xfrdhfzb7z3Xt99kKhGx/mo65WxKxUB/vvZ/QD6B+faLg28n6LPKDVED7rZintL/1m+NcpTOUu3lElMOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:10:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:10:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0001: use assign_bit() where applicable
Date: Sat, 19 Sep 2026 21:08:06 +0800
Message-ID: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: MA5PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 3328e025-9ea7-49c8-0ddb-08df164f6842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 5MoTFvWGbqThpNWc98g/ZzUOs4w66Vkc50y2+O8I9eoolAOXweCCuKcNCpfP3zO3qxDKLdgomJjrWEh13SAn5wMI83+tx/FuDCCrQIUQLST0JfN4x+riBEa/JPIuMbeNVQiygAzc1HCOHX8K3iRLAU3DrDacXiFWrEtUZ8Sq33kKTOYTw8qFgQn5YF3B26Lc9KcXM3V2WXoYoX89aKbFMtD5wKuPkrMdWCgLTfhFWWcZu0wbF7uP7PH0ucWkwD5U9Zqb/d20SflPWIQjTbVav5p6KiSN3lu6I1DNdY+VjDZKj1GTfZjxOvLFkgo6sMKo+DB8mxjgRR4iNq3fQM4CBKCVLUn7204cI0/QWXfrRnHxkSR5S8K9tLDe6pVm6NznyUOA8Q5PIkCeSFpQPGUSLiRFuU0bVLLocYIinj9TP43hFu7JiauzIz46WlmZQghfm5/7rSnfvtDk8Cr7w9kfe+T9SV3x1I8SckUrXZWlhcq6yh8VX6WEcZ7arBy5Ffjy8R9YvY07UAjo3N3mospNCRBlg8SJfmwD594/W0EDCqlAnmxZdbhV8skzh75BIra14owwmSdDS6VJR5l4KJ5rJDaCFyRrYVxo77d+698BqJ7axB8nFBc2ooqnvcDctLGBoIHrqCmiRuocUKWy9yEiGP/TWpAKNy0YO8ZTSwNGlWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1rVa9LKxdUA9iFfaxao+/4oTIbbJ6FRxtTp2pBhcal7LhKCizTwWxVrn+qz?=
 =?us-ascii?Q?hZiTyQvhh+QT3dW3dSBbTKuZzcW1ISz2CeTvdkR8fIGMGtzW3SrR8RG/ZWBp?=
 =?us-ascii?Q?kPGCdIEe+iOOYyV2ccrSayB+EfuiMmal6GyL++BSZpp5/w3lTGoY61fgt4qB?=
 =?us-ascii?Q?A6otXOlWJDHvxfmeXIqYyzZfXTfwVvjGx1l/dM/aasEbMfg0npNxoDjpSQkO?=
 =?us-ascii?Q?Phv2g9t2d7piNmAkeGEWvlCAQ98ay09GBXjY0XCWGRStlb/0yC7gbgzoiyqD?=
 =?us-ascii?Q?/0841494mv7S/bg9OWlOg40KQTt4NEWPO4dHxZ/khWRqSW/iYj0rKSqqIkCg?=
 =?us-ascii?Q?7EtxZOgy3TE95SBFGP7f4dpT0inbJXOuMVklhgNw4xbskbSPgX/h0Q8HJbE8?=
 =?us-ascii?Q?PeXZ9g/X5ZjFEZsPdddT5v+x374Ds3+/TFiXfOul0JD2evuxgwuzC+ceXH7U?=
 =?us-ascii?Q?jD+chJBunBilTzfft+FW2oCgYIWPjv/gPWAVOTNZycRF45zqqkvjsiz2OMgP?=
 =?us-ascii?Q?SNORdZJmdyPB6uvWv0yd1dPAfws/dDPqq/9zqb5S22Q6cNkqmfeUxbj+N4DF?=
 =?us-ascii?Q?FgTGm+fXLhx48UjDUyiuPaEc3SBOJemxzWmxfJg3Od+PKnZgYdI5ofLFnoPV?=
 =?us-ascii?Q?ft49tyuZzOMXedoVL8l4X7EkPT98bk4FRL11aycPGpo8TZuE1RRFAGstslU0?=
 =?us-ascii?Q?tg1TSs/DKNJj+vvBbSlSeZJ0AO3Yn1gfa3BEgCQqz9d3cKNff1H4kBlMz87v?=
 =?us-ascii?Q?KTBk78qFCQX2cNoPOybOYbvmkVuxlzVbEHqbRd0KWyruyYGrDErQuIuoETRe?=
 =?us-ascii?Q?/+Ml4SjFmGodeECjgPSeELZJ9ABm/NdVLO55bMfe1hbL759MDCVLiUC0gKgk?=
 =?us-ascii?Q?mUB8Y7nEe5ajWE0633JYTeG8WNdRwVulm/uGYwx/bbX/vSuQvbQhXbhb8/3Y?=
 =?us-ascii?Q?fRPif/NGoDEGwxm8es2HbSBM2a18Vby6pwJRjeLOMA5INdtDQ5uKd4p7gjU4?=
 =?us-ascii?Q?6rsbaMrbnhqGLq/FXpHLEexcQLyw+4dFI0vmIeHc6pUCNXt1g7Vg8vLhUZd5?=
 =?us-ascii?Q?J28sZJOKoakz5YXPFJmy0/3alDMDE8v/HXEdD1TrHe+nFl6mTGmcBJ22/QO/?=
 =?us-ascii?Q?loCj6Kqme8nBwGElaRvmsxDKiruDMUHF9x8jkUkIGWq4YzNrMTu2Dmte65Am?=
 =?us-ascii?Q?r4UTSxjpy/3AIbP1Yck0EF986mR27FPoS0KPuN+kfcPJ127nmjxhNnkbU5Hv?=
 =?us-ascii?Q?azzq/mYB+kopNxEl6VZ105g6KoafuiSq7n6n1PIW4yOrcxLXkf5Pz6dkJIeA?=
 =?us-ascii?Q?uKVYBvEZhWt6f1OgnTWx4de7plOapB2QgBqbEA8MJxTAuKbRcYe0XQu6pgwR?=
 =?us-ascii?Q?mm7A01gU5WpnfA9uWewXErxr9g7utcoM/Bev1X62mv6nEV0spUbpEPsBlzBe?=
 =?us-ascii?Q?MBve+MvTeM+j3C1Sz8UbL0OyaInoLmhPKYTGs5TK/7sBhn8GKNPZOc3l8Frd?=
 =?us-ascii?Q?A5xrKp9YpwFPdjIwae4kDUyA96RS3/RruTNWshdgaTggU85K2jUO2El7vlU0?=
 =?us-ascii?Q?hAsCmmX077s72Vvz/zt4D//8egWlY04SuEublGkGY+iA3zZ8AvgY7KLlCEG6?=
 =?us-ascii?Q?cc9HEYAUcDT/g28nf+yWiOHN3vxX8t2HwZ1XyoMTymIK3QRFtRl3vCtM8c8V?=
 =?us-ascii?Q?3gO3pVz8g1Pw6udAeUJvEwBBYQOxhlcwg7VcCetKIWd9Vs70grPfpHBYkRsa?=
 =?us-ascii?Q?KEfhAxoX7zY9CuXYjGwSNfFM13qiyuoZ2d/0m97nIFJVn4+TI3Ta?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3328e025-9ea7-49c8-0ddb-08df164f6842
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:10:41.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR/m6UCxlCP4iHWisiU4CMIycCpIlp1SQTmMcJeeGfFoSmlnP5C4jO2TBSyWB38Afkj0+Pr6NmwT8yphdAmxE93hCq3LqTElzrXKptpAlQUySufUrtO2Q7rhapSDgaWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_061047_266634_5A3F6A92 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 60d82a1acb01..e5805eebeed6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2520,10 +2520,7 @@ static void cfi_intelext_save_locks(struct mtd_info *mtd)
 
 			status = cfi_varsize_frob(mtd,
 					do_getlockstatus_oneblock, adr, len, NULL);
-			if (status)
-				set_bit(block, region->lockmap);
-			else
-				clear_bit(block, region->lockmap);
+			assign_bit(block, region->lockmap, status);
 		}
 	}
 }
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
