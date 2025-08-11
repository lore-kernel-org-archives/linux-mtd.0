Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48063C87FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bf5SLX23mqZpmsxid2mib5QjrNIzSqFSY/3ApKHTnMU=; b=iClyeCPvbIATmM
	+X4T2YbuLbGZDHiMk/cWft+vhpvuYMBPTB2etbGUK3ESlU+LRx1HFrNOLTPnxrOdOcQxz8ciO7Ox5
	aT+qSI/4ApG7rUlyrFDQ6KcYEf5PfeCzmgAfVSZw3Fc+uhtBRrh3NnjKTs1Q+n3PsiI6vXK3Tnp+n
	MjcwMsaPxqnLV4LDBJp3Sgc0zINDU6yfw1d5gQ6VGJznI/mCqfOW6vXbnt/lECnUAiI38UZD2XEHH
	rCoh6U5N+9ko6Utv12iUB/wAmzi16+ZFdrY0n77I5gna4DiWdrXZtveyU1gGya/+5uWQGE6sVUd/L
	ZpYF/sjBRYjGQnio+lOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPVm-00000007Hg1-1NLW;
	Mon, 11 Aug 2025 10:12:14 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPTx-00000007HPc-30sf
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 10:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrNtSMB2A4Udg+6F1hnDh1ydmKSFgPGyCe23KZFwuAm1tg3gMML4NVUchmaYj1ywo8dCDcp56S9+tDiGUGJwC2u0z3do9AP0kClPkUsQMZkvYUdi+rCVJNOR7M5oQEOTIyY1pIS1bwKu8Kz/1eWA9rSI+RFnejYGl0B+9LXpWsZCThvahC8Wtrca/fu+N1InaDTpGkKRCr9O+W667QPxxKqEq/tqP2RnhLbYPu5jhtStG6eopBuojE9C0NC2P8RYZnepHrgmqrdDS+ZErgog1lqf/5gVCkbNqDCNbPOH+BrZpYgE2E5vZHFqgKEm2ooG+MBfrd5lhkYBDiP12oDD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WlcsjEYHIyI/tDrUurI3aPG/UqD9v/d/lDSY4lEfm8=;
 b=yafTR2DVelaRTx1JfgNXmGzrSQdx7taql8wASwGQvJxrbgC6iHhVUzH70x+TmQs0AbcnD+zr0kBYkb+nO4Lc/O4nzOnxx0VKn4hKXT0QfU3LEVYz7/PGn3SN2YuJ8+0wNCwPAyBXe0/+vc0z5Fiu1dvyftMZeDw6kIP/EHS6WHVOPpRcYyhZf1ROo8WIvuWh2Je3BUReNII8dhcylzL2xQkYL4ziycbNQq0Nc8q+LBrq8h8RPZX3hVi6COC+fd8C1t+xZmUqln4p0prIEX6Ho3kk882OElKezkaHwdgo5MI2gG4O9RPluLln2r93Ifw+06tHWSCJmbo8H+cLPulCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WlcsjEYHIyI/tDrUurI3aPG/UqD9v/d/lDSY4lEfm8=;
 b=mI+cRi4kraq7a1WOTWgREgYnO/6MYgwCjbEQAfIf2C0LXsJHgd3/NGK6rsJeWMoabs05Tb6l16XaZqzlfQ0w3d+GW+S6EqKfKCHUWHnDUCG1AwHzDuA6Woz28ogNFnCQWZqeSoxoKIbRZEnWIaso56sjnCoUkkS7WjqyUGgFkX3CENKb+M2+CSdozpqSMPnNQF/UVwlLnvEbcgdNUsdWQUBGBqtWIO/hKQknXrZ4QvSip4HGfpOc2ywkPLfgeEimz3/uyq1NB430jTD9UnEOM2Gd9t6rzUqAqu1jx865v2Hsk6zKOQgnd6O1Kf4rGtqlF6GYptwS/dyT1RjWkrYqvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TY0PR06MB5102.apcprd06.prod.outlook.com (2603:1096:400:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 10:09:58 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:09:58 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] ubifs: Remove unnecessary variable assignments
Date: Mon, 11 Aug 2025 18:09:49 +0800
Message-Id: <20250811100949.431764-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TY0PR06MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7e2bb0-f5c8-44e8-a9a8-08ddd8bf3a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qjG2lfGpoBT09Ks7Ff1LG3YlP5JOo8NMcPjAIPt1f8Not+kMA3vFGqf5dbaa?=
 =?us-ascii?Q?jRWTDwOPdY8pRlipGIrrV2OtzifBlqw88OjV63VWbOlOXXX/j8t5TKm9yH+S?=
 =?us-ascii?Q?vFfHJa6qMVUv+vSx2ghDBWlpm/WhhgilTzsKkDuupJ0VqI0reMYW12ySCFpZ?=
 =?us-ascii?Q?cEbe1hXZ+GwSP4m+6v8tco+vDmt6PU40akPXGsgZU4OMiN/X+2Hy/1nd0XhK?=
 =?us-ascii?Q?SfYyvf7HbqoLIALBAh0+HldA4c88frMGTyIjfkN4lko9On9I7uFWXYzZQVR8?=
 =?us-ascii?Q?UZ1mnHlJNudMBSQz0f4DAA93bcHUNenhOtENa4FCP4/QiD5+h6JQaHc2MLLo?=
 =?us-ascii?Q?hUapaRa61hCoZMKvfe2Kbq5qC1TPfiM+oQjboBzEPZqOfQAD5V4bha0Ve2fd?=
 =?us-ascii?Q?4K0BU1AdPqy8xTn1VA1TqTlraWVv7KGynVZd8iz0FOHBYrPvsppkxEsOzVV6?=
 =?us-ascii?Q?TTTbTjyh3cU+UK4CjKGBwkvGHMZD+VfIQYWlVV4Zt79nzjL8Kg8lA7Qfqyeg?=
 =?us-ascii?Q?aQZVlqPamjUJeLTyq/gsHe4bGciuc6bScKSUx3sGthQEaR1W5QUNZO7mtN2w?=
 =?us-ascii?Q?YCSQoyBb8+S1fKSfNm38IBMWYeMqnfyBoDy5MwKhBHpEjIIQVMhr+EWkC+pz?=
 =?us-ascii?Q?uVyYzdW/p/5mZTEsaFhUN1T5LSbfAP8gWoWPciqxL1lHkU3jhQVGVaaCs7vC?=
 =?us-ascii?Q?PDR24HKVGDJhe8je1EbzdL0iQJygDTJzBpXv7VG5JNCIoogsSo/Z7ToC1yji?=
 =?us-ascii?Q?FKKUUnfPR4ueJgmGy4JN17T+rFJP4i2Y4Ta+qkVltVpSyhAm6+I4Ry5OsBRY?=
 =?us-ascii?Q?4apoUcgXHNT/bLYoATOZgvC0MxIdFvRqYyslTa84YZmcrsVAP+KFClasiI+P?=
 =?us-ascii?Q?zAzA1tu8HjKKDHLpUAhmVzbjTIy7gNPy6vjkFUICMGayRkzbRhj/+6xRX9rw?=
 =?us-ascii?Q?v+Zya2/5bHw8ryfFnDohRj4xO7nCsNT2ORHHAqHodf5XsW/Q9XaWgN8WEK5L?=
 =?us-ascii?Q?AZloHXrD/zq+HfoovjVe2gqUKS+821GDQo+thI3xBQO4xsdgXkhfWP6mzz3w?=
 =?us-ascii?Q?kIuCJOJ44cKg/dlzH0ujrb7CQ0IyYHh0Jd0NISpMbHDEG9D64p7wRGo+Np6S?=
 =?us-ascii?Q?FmhE2+/BN6cfd03ZKOp5MMVSC3d21bJ8bftJkA80VfnWFWWW1WD+Zx104Z66?=
 =?us-ascii?Q?xs5hsQtI3zgJd0ERuM6SCkesdotWXmjcMc+fvSusUCKDFFf4ck6BYelcaeSt?=
 =?us-ascii?Q?0Hwj8X/a+Rddl7PR7u/kyyiChKAZzmNtuvFhMAFLcX/TuIJOGfzy+vlXtVGw?=
 =?us-ascii?Q?Yrcm8oTJSCm9Lu/927Ui31NDnGK53P20ZIpNoaAu9+xofGcbYJ0lA97d0Cf0?=
 =?us-ascii?Q?eQrYWuA4QGTjRd7fza+j7JY+g9wkjHQsL/I9expyxclkR6SCDDvcXnEiGiYp?=
 =?us-ascii?Q?An+GRX/8hL0qmEZ+wAEmUzWCgpyISnIRQCadhQD1vHOCMk+mt+aHpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fsGFeix0Xb3bMMWnkn3VoaDkiuTecITWtEoEvyDRrS3z04kCmm8asusg0tKc?=
 =?us-ascii?Q?S6iPhdnvfIvaSGZkQjH59Q5+74JEOWnGt+rlR6JQDY1bqUKMiMKNZ2y+g+le?=
 =?us-ascii?Q?IU5bvoxx7JFG6fi9T3U8zfI2hS2MCFDVELnR2tvZCAHEt9zLTfeh3I4bsYpZ?=
 =?us-ascii?Q?FMvTSszjCrVwJ9ZrtokypsJrV7PwLD76geafAfdsTMe4FfsGNTn0+uh7U70H?=
 =?us-ascii?Q?6Mm6s+tYGk6QZ6UK7zaefQEq4Ymc0YAGOgfn5LUl9gya0L6Ml6tUP88r7crK?=
 =?us-ascii?Q?n8naVuv+Z80uxdXNlRNfuT4coHyG+JWFJ+fJOG5cgBtyAqXRTcOZCQHwgkm+?=
 =?us-ascii?Q?6MH1vVPowaQpBocW/5Ppy8HYwAxhFQjOrIGGaX9m+V3OqegokcYX6tNfcC1I?=
 =?us-ascii?Q?ENZWpERQg9tXO9bziiRe3okezGrc//2onKvOviaR5Q9oCTyTRiQTw1MFtvsD?=
 =?us-ascii?Q?1wLPCm0Z1Iomk6fR/h9H7/CGqAS2ZrpKcfdIS+aHWMgKK2WciQoW9hNz61iL?=
 =?us-ascii?Q?g0+hTtvG/aox+TDQZ9JbqC/0lANKQr6ISfOmq/DMmVxeql9em7m+7hPW+EEU?=
 =?us-ascii?Q?+mBeQFnTUSH64dpSvUEchwN4sPrXuDiZev0oBTu5teyJPMmePEUT7UG4wbGP?=
 =?us-ascii?Q?1blz5aDr65m4NEdKkAZ/gCRPuygxn+nlSl0pnnc4ZVn5eX6jeqMjJ7Zemjxs?=
 =?us-ascii?Q?Cl2dfoBUjKYDl3jkSX/1z6lLSjMaPQ24ArFZ8zpUeNWJpxHqDaS1mmD6FQaY?=
 =?us-ascii?Q?jE7PiOM2Zgql3C3lrZYRK8sQy0pO2nhv728T/v9SqGQwfsZqbj3UcfKoKH0z?=
 =?us-ascii?Q?uvqK58CQoMxbNqrPPFQq7kRYU2d5oRzoo6SNhHm04cHW58QFo09UbMA61/9X?=
 =?us-ascii?Q?674Wsj4JoirClqFmquxULAEmtKziyyJHB9oF4Du3Js88jM+PzpdG+lFwNI1n?=
 =?us-ascii?Q?6zXHH0JPHygdnwOe8/n9DZwsiCsQz2bm6ZHssSxppVkDcRh6UVOFqLzoSPk/?=
 =?us-ascii?Q?VcQaBq1esBt81lzM+RC2BmKv2nYDDiAjgVan0xrCblphfD9i3Atiw0QIHYNs?=
 =?us-ascii?Q?M/hS24/FFB3+xpUHiKz+w8UAncDTTGnRcdrCZXpSrN3YSZ/gmGwJDgPGdGhE?=
 =?us-ascii?Q?sDncR/viROmcNqf+r4raQLjB7SBRWMWEb6quW19itAYavXO7cnTTDp8aoGRK?=
 =?us-ascii?Q?R6BJIb62eziL+6tXSj8Fk1IANHw+oZI9PXQhEYNOiuV6Dffj23bdaMA0eBdI?=
 =?us-ascii?Q?n8bGX+59RnM2u1VzthSUk4iN5wcHLGBB0/gaceBgo+JPe4ArjT+OR9APDVG3?=
 =?us-ascii?Q?1gpgEu9mbs8rbmLNIeUazQLq5PaxcoALauupeB5ywxUy/6mOTK0G/tfFmxY8?=
 =?us-ascii?Q?6YfYnNFlO0cwrr1DN1oTlYrHxbnq6X0GuXFVreWX/lMO3tlQ1mLMkif/RwES?=
 =?us-ascii?Q?SUQbSCoHt9gOa0Xs6CpuItpZip2xhO39qUlwOevZaTjRjEFbxNzDEszBUcFU?=
 =?us-ascii?Q?/SbA07BZzi3TVUhN4IF5kJeUsnHf1aNxl8zmEuOqZEs+vkC8b+/7+4uxaXCK?=
 =?us-ascii?Q?0AYMyXZxSLlYcrYV6CYj7lSDvUNvor6S79dSXafk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7e2bb0-f5c8-44e8-a9a8-08ddd8bf3a1e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 10:09:58.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmnYEIcjrKQT0kDWK+0+Z5XizUlufllrP9pSuockbt6q1h4E4lchFBdZM5/pAA4P2jbJr5PP04vjx2jT1nxQwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031021_754763_64E4185F 
X-CRM114-Status: GOOD (  11.07  )
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

When an error occurs, ubifs_err is used to directly print the error,
and different errors have different formats for printing. Therefore,
it's not necessary to use 'err' to locate the error occurrence.
Thus, remove the relevant assignments to 'err'.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 fs/ubifs/tnc_misc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index d3f8a6aa1f49..10b222dc6a53 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -321,7 +321,6 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 			  c->fanout, znode->child_cnt);
 		ubifs_err(c, "max levels %d, znode level %d",
 			  UBIFS_MAX_LEVELS, znode->level);
-		err = 1;
 		goto out_dump;
 	}
 
@@ -342,7 +341,6 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 		    zbr->lnum >= c->leb_cnt || zbr->offs < 0 ||
 		    zbr->offs + zbr->len > c->leb_size || zbr->offs & 7) {
 			ubifs_err(c, "bad branch %d", i);
-			err = 2;
 			goto out_dump;
 		}
 
@@ -355,7 +353,6 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 		default:
 			ubifs_err(c, "bad key type at slot %d: %d",
 				  i, key_type(c, &zbr->key));
-			err = 3;
 			goto out_dump;
 		}
 
@@ -368,7 +365,6 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 				ubifs_err(c, "bad target node (type %d) length (%d)",
 					  type, zbr->len);
 				ubifs_err(c, "have to be %d", c->ranges[type].len);
-				err = 4;
 				goto out_dump;
 			}
 		} else if (zbr->len < c->ranges[type].min_len ||
@@ -378,7 +374,6 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 			ubifs_err(c, "have to be in range of %d-%d",
 				  c->ranges[type].min_len,
 				  c->ranges[type].max_len);
-			err = 5;
 			goto out_dump;
 		}
 	}
@@ -396,13 +391,11 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 		cmp = keys_cmp(c, key1, key2);
 		if (cmp > 0) {
 			ubifs_err(c, "bad key order (keys %d and %d)", i, i + 1);
-			err = 6;
 			goto out_dump;
 		} else if (cmp == 0 && !is_hash_key(c, key1)) {
 			/* These can only be keys with colliding hash */
 			ubifs_err(c, "keys %d and %d are not hashed but equivalent",
 				  i, i + 1);
-			err = 7;
 			goto out_dump;
 		}
 	}
@@ -411,7 +404,7 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 	return 0;
 
 out_dump:
-	ubifs_err(c, "bad indexing node at LEB %d:%d, error %d", lnum, offs, err);
+	ubifs_err(c, "bad indexing node at LEB %d:%d", lnum, offs);
 	ubifs_dump_node(c, idx, c->max_idx_node_sz);
 	kfree(idx);
 	return -EINVAL;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
