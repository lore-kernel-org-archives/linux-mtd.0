Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2756CA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 03:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qZp+WtT/+3CTBnok4dLkcJtOuhryvj+4mvvt2QnZ83Y=; b=iYzOP8tKAyM/10
	XzGl3184Ahj3PWhubsrewJdqK15wgpigtFSgrZ6UGXsTt2+IESSoj+tMG9fc5ksk1+/aMhIlXXsE9
	8+VwAnvqJIz+BpkYeECMJLgav38px48N7qF91q3ciPblX+vouNEmU8v9cXReYOC+md1gz6yHbaHAN
	s5G1Xt7B9Eg5NwG2506ZKgCvzatcYXuX4dH42L8rMxJ5X1frz9WV17aVADqs3/gWam6L/xrFnj79I
	wBd9lnkypEETJ6fwM23G69t9A0SFHK4LmIQPZq6i1tgXP3grQ9F6+Y3nBtJR7iDEx/viSWvWb4XEl
	4GPdDJaGiD/lc6snfRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgAV-00000009l1s-26ZJ;
	Tue, 12 Aug 2025 03:59:23 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgAS-00000009l1A-3p7V
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 03:59:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkjK1YO/H9E2L6lhgD6gITuAHCWvPeaDhIVnWptzWNbbcvUlcllmU983k2cKH4SHKpPgF4/3+10GNDG5uyB0IDrpdIcVVoh6/JOPL9dpj5UU6di+rrKqNtSb8ndgda3ZQStX3hwf+FeAZEb9lAVuAa7BFRgE5HrLKC6258v+3aAZJxANbwniUBEdjQ+/FPSt57dLdx2B3a1+bbyWyb4jSD+XSkBq71FG6TRj+N1QMNO7M4WHKWJCSDmThpgxqJ5a5NA5JwlHzlaqZUn/s0MeDfxzZxvEYD1OSVTzASv4dwDCFIieS/X5Ty3wuWTDFu527MLXo1q6XxCugz2iGwKh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1OxYSiujeSQ9lPV5XViwVpqPSXHpqJXFfu7KtpitqA=;
 b=T2Akk0KxQxOGx1vHVh4AaM5VjZcpSOSJXFvZ68aOP90kA9fM2U9wj2klKhR8P26iTYkOIaBlNCvV+/1UAdIn6tjjeCmBafpKnCKQnp1pgnMEaZB8tz4sM0GkwgeeLvD6QRyLDI85AyRc42xBvojDyzwm1yznSHjkkPzqFJueQShWNXnlgaGMYFfefxKT8v2WDYeT7NZ0lZBNq2cQKsQTLaHLvQVoCOK5ibqt5SkF70gXR8EJzY1+aA/KaUhmRFUqshL5rS2C06kJgb8fDIpnDAV1Oo4QMIkt32y4b0VGtcqzU5atX7dMIIhGKbR9GJQktw/aGugL3WTSgwGMaaaqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1OxYSiujeSQ9lPV5XViwVpqPSXHpqJXFfu7KtpitqA=;
 b=YRZw/kMnWEyt5LjksgVwcYBeJh2MeaHgCH90opATfiOrg/VhViPkKlMTNarfbA4L4de+NHlbGUSS1OccjTGnkzG2CamUAgaU8GeMyOEiOOCFd7rZGyFts0hkYzgIX1ppmHY8dlB6b5X4EK2UVT3slsrnv1GBjSblFRqxA3rbmRoHPVcjlUgAfJts5ItHLQxP9EB2wCjObxEhoa6JohuElXJH+ggs8ccuHFLOLJXy7LYk1N+qjeKXucUSLvt0Bdy1dJhWnRTWpNPx1veQZbH6mawv9CKHZHR4aE1ir+OhQWrF+blDmKiXTG5KJgVAgsjr1xDeUS5OuAUAnDKTFMcDyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB7327.apcprd06.prod.outlook.com (2603:1096:990:a5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.22; Tue, 12 Aug 2025 03:59:08 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:59:06 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	WangYuli <wangyuli@uniontech.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] mtd: use vmalloc_array and vcalloc to simplify code
Date: Tue, 12 Aug 2025 11:58:53 +0800
Message-Id: <20250812035856.501130-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9755c091-03e6-4ab9-239d-08ddd9549553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dYgbdZMwnK2ZY4cBMUVVRSO3gC6RjvSOCaWBlGixr5sa8Pbq3XXNBARaGxcp?=
 =?us-ascii?Q?lsUvsr/tAuCZ6aOUA5pIzDKhvK8jdZDmag58Rb+UyEpMSOjoiuAWqAmfzqrJ?=
 =?us-ascii?Q?Mo2zYRdPymn3jrbf3ZO2xsURCSs0sGbctFeJjjDItLWukq2AJX+5bM4hbKdy?=
 =?us-ascii?Q?La2Ro3jODhLtHnIsmV/iIlEszGeyfyMqJB0bv520EINfhtxNa41rizJFNivg?=
 =?us-ascii?Q?HM4l7qKXBQ3/qIpRpY3dktY/V6hhH+ZPdlYh4FqhY9HLZ+AmFIjrOL4+Oyfm?=
 =?us-ascii?Q?ZLjMZrtc1a1FEHJ4T46ByJfoSVNu742F2xMzUr/y9c4nl4UhmMmftuBQqbzt?=
 =?us-ascii?Q?qK3PFL505aN30gbDYOvfcITgge+MKlpa3EHarUaxrm2mQ+dgzT+05QaqoLDL?=
 =?us-ascii?Q?f0rfOlJBeREZdvqzgjC5Ol5CH4m0XJnomMKTFoH4EvsBC2/J1EMQ+P2C/pAo?=
 =?us-ascii?Q?ccB2by1K1FrpiXO2I7VBcaCHWQnYJFrU5WLOiZRdEv8mQSdFAJmePef3DuDZ?=
 =?us-ascii?Q?/oRYzeko2TmnW4n/+Y8r+h8mreG0ZB3LTxQPYBHMIM/bF558ZUGyfQ2knmzA?=
 =?us-ascii?Q?4Yh4HI/Z+wEw0lWOcJAWMq20mv10OKybMrUhKc2CGEnQcxYgVAhH4jRya4ac?=
 =?us-ascii?Q?SlaW56h+qV7E6OzoKypN1qc8yCLq46cveJNEkeVBs4WLhi90kZ/NuCjqAtnx?=
 =?us-ascii?Q?97Vcf2BvdnGY0JTo/Oj8R8yBlAC+iCs2qQ7MYpdamdHz+l6/WQPZXJHU+VBB?=
 =?us-ascii?Q?kZVKrGrh3h51n6T5llPiNbWFD5e3X2tQ/9XsJ1P3qz+oekAfNXGqgFM9BHN8?=
 =?us-ascii?Q?1sj/RnH2yXnN4voYn0NfpJ+i3eKsgPT8iCGwdIttUmBvJQ6LTJMDJ9dxJnAD?=
 =?us-ascii?Q?zhsZ8qzzUZ7jmuQv1VSpa6GdI47S2A/CZBhr8d3pmpE7LWvia/olDcojZ+5C?=
 =?us-ascii?Q?B4lCE0o+GVSZHtLyG1p6+QgT2wSsFjed0ph+qOzRIvaWrLe6J9y09If/0Zsv?=
 =?us-ascii?Q?kqNg6yotQHR98UFfb9819mGBS6Cm/+fmKZppjt9gcnUvbdMPXi8MRBmul8ZX?=
 =?us-ascii?Q?RTEFVOT6/cnsfTKtJcE14blG5e/06RZbSp4qiVAltXPzypts0TQffHv17i3i?=
 =?us-ascii?Q?ZLB1ltBJOtAXWUETsw7QrX84YwnHHsP8Zq16fSwDmDxffnK7G3KW0/Od8bRe?=
 =?us-ascii?Q?J3o8K2QPxtJx64YbM3WklraFBGmBFtqQq2tFQv9AWzLyCf/SZWeBTWB8zawj?=
 =?us-ascii?Q?+jguxCtqVU2GN2a2KhP6HagR4daTfwghbAH4BLFQ7XgAK4ZamqsaIHE4/bMI?=
 =?us-ascii?Q?Cs3JBYiTCCDNLQ3hJweEljxYZJqG+oV+Kza2dZh8h8H25VHTxVWw13LY9kYj?=
 =?us-ascii?Q?nMRoGeHR3BnBaW5ChX/NPm1hUYGMQKQ6IZK1vNTByiS7peGk8GaCnfxj9bfE?=
 =?us-ascii?Q?F1ndEXtu+UmpU7evTsGyTPqYQ2WcW0uj3bFaW6Mx7m9eotyWdzTwbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJyKvS6BwDJ1ydPxD4HTJmF7W/mw65mQCKSe6LkmnEury/CvaEWgPH3t2ara?=
 =?us-ascii?Q?RJY6uuErdbiZDgMWADQJ0i2qW0G48wAv5qhuYdVRDZrsZ5xZNjdfg6NswbZh?=
 =?us-ascii?Q?XfgoLO6WZLjFzUMOw3I4NINEmNGo6iEpT+oAxYmL8qiQNh/b6zAN7QvQ2azw?=
 =?us-ascii?Q?UWkBikvS5e101M4aABjJ7dFbPYsKRDNRnYJzs3XNfE03A5NUr46cAXnB9lTY?=
 =?us-ascii?Q?SL6zEaks2Uq5Q56jEhz2SElinQtfJ+OQB7JtyucucoDN4Tqylrif5ZldnsmU?=
 =?us-ascii?Q?UK9Km0PuMYQth8UuFAVsr+YxmJR1+rdcv4B3UOciabvaglrV6r79BoPph/Bj?=
 =?us-ascii?Q?82Esy5EOxr1oBBbD9Y03bbzd6Eict8WrMsd++Jqfdqz/nCYBXKOWkGpTdWmE?=
 =?us-ascii?Q?FkOG73EWK4p9p4kVH5f3aELQX/re+JRKDeOvCzfj1FSp11nx64nfJIl5tw+7?=
 =?us-ascii?Q?uLzIJbvgzUJ1zK5F1nb2F3BcXLomF9u89+o6ap3IaKJLUqAhhi84ytHzhWc0?=
 =?us-ascii?Q?2Rh3cfvM2dU5nWi+umLKuyexpq+rCMxrgKYZYaeZ+KfbLqu2L37jk0dS8Rnj?=
 =?us-ascii?Q?UsKUNgoS8BhMEmtdgd/R+8ZYus4t+VbBGXWGcLcqlog8uWyN7XUcu1o96Liv?=
 =?us-ascii?Q?oxtB5yrt3Ih1dNfpdpOXZd5DQS3m936ATcRxE7o/VCw+Ov7kjTiGQB67Uojn?=
 =?us-ascii?Q?szZZGWf7i7ACa9reiRapV5gnvAqCZ0ti26t/rJn+XJFEo8qpbQgWYcYtAfjH?=
 =?us-ascii?Q?77mB2lNaH1MVJVp1aRtPJvEHgZdQ7rKUePeF3G8AccPve2mhNj4W4IKnXKrX?=
 =?us-ascii?Q?Cr+4mwFIwpDWFkv2xgG47BMmnjOgfs0DnzAxvJLmRuJKcmecTQTCBi/3ISgY?=
 =?us-ascii?Q?xTyziK3P5i29JCHzuNBch970ZKGb6CaN8mJuiHrehyA6uoEqahgcesgCV+e4?=
 =?us-ascii?Q?snDHGbosAnEaTXfwz1ks2GG1+LD2/6dxCeQxqtpUyOW7hpalpfGV5sDjQTrP?=
 =?us-ascii?Q?/zJDGIDJs3PgjHZJB9EMmKmiPhbQqFTs000VzlymyWrR+ahQLE3JzCHM5MUB?=
 =?us-ascii?Q?qHqktYsVMj8Zc65io07CkhhuiuZTS9IyuipdNL3g6fq3I4UOHrr6rtnpHniw?=
 =?us-ascii?Q?xXAu27dk7Vf9S9YJSK7RQg+YdmtczUxzeg/tKpPHf/bcUWo468hCXSNVndMW?=
 =?us-ascii?Q?+olv+GK/IlWWxVfNCiu2fDOatyaH/RCnlNLNs+N2aO3zOYIR+tQraFzPV/vw?=
 =?us-ascii?Q?daqxuDiHXBbVezlSklPiwQ98M3do0+3FnrQVGSKIrRuVrMDrBalhYSYeB+Hb?=
 =?us-ascii?Q?Axf2aA+HBiGUgH3NFbmkB6RUkK31CdmC3nqL6tinmwlU5X7VHQ43PB5KazGo?=
 =?us-ascii?Q?N6qdkeR9ppAfgPxkMFEOUsfN7EKCzgYlzW20ZEZ9WrdXiU9yBS/oQoK29zc6?=
 =?us-ascii?Q?7IRdSHcMnCf9sa4DkPEx/bcGoLFGCAOp039JgKJoQmZ5DaQtByNUwGdZN/bm?=
 =?us-ascii?Q?biDFolURv4mQibnl2F7rzqIDR37A+t8SFDAW/W396mGPTOYyqjOsfrSRsFuQ?=
 =?us-ascii?Q?mkrYL4kTiM0k/DQiLmKfYFIrzBM8nO9nXMNOIZvx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9755c091-03e6-4ab9-239d-08ddd9549553
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:59:06.4305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxKntCyBdKk2c5iR1joHoVDHwAjlI7Tq4IUZM0Gr02cywu/vHWNY78iFJONNiZ054NrC2Z/XkgKmElDV4fBi/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_205920_998950_36B19A5A 
X-CRM114-Status: GOOD (  14.10  )
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

Remove array_size() calls and replace vmalloc(array_size()) with
vmalloc_array() and vzalloc(array_size()) with vcalloc() to simplify
the code.

Compile-tested only.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/mtd/ftl.c              | 2 +-
 drivers/mtd/mtdoops.c          | 5 ++---
 drivers/mtd/mtdswap.c          | 4 ++--
 drivers/mtd/nand/raw/nandsim.c | 7 +++----
 drivers/mtd/rfd_ftl.c          | 4 ++--
 5 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index f2bd1984609c..59a901549257 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -263,7 +263,7 @@ static int build_maps(partition_t *part)
 
     /* Set up virtual page map */
     blocks = le32_to_cpu(header.FormattedSize) >> header.BlockSize;
-    part->VirtualBlockMap = vmalloc(array_size(blocks, sizeof(uint32_t)));
+    part->VirtualBlockMap = vmalloc_array(blocks, sizeof(uint32_t));
     if (!part->VirtualBlockMap)
 	    goto out_XferInfo;
 
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 7bf3777e1f13..b88083751a0c 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -356,9 +356,8 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 
 	/* oops_page_used is a bit field */
 	cxt->oops_page_used =
-		vmalloc(array_size(sizeof(unsigned long),
-				   DIV_ROUND_UP(mtdoops_pages,
-						BITS_PER_LONG)));
+		vmalloc_array(DIV_ROUND_UP(mtdoops_pages, BITS_PER_LONG),
+			      sizeof(unsigned long));
 	if (!cxt->oops_page_used) {
 		pr_err("could not allocate page array\n");
 		return;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 680366616da2..d8f2e5be2d31 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1285,11 +1285,11 @@ static int mtdswap_init(struct mtdswap_dev *d, unsigned int eblocks,
 	for (i = 0; i < MTDSWAP_TREE_CNT; i++)
 		d->trees[i].root = RB_ROOT;
 
-	d->page_data = vmalloc(array_size(pages, sizeof(int)));
+	d->page_data = vmalloc_array(pages, sizeof(int));
 	if (!d->page_data)
 		goto page_data_fail;
 
-	d->revmap = vmalloc(array_size(blocks, sizeof(int)));
+	d->revmap = vmalloc_array(blocks, sizeof(int));
 	if (!d->revmap)
 		goto revmap_fail;
 
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index df48b7d01d16..84942e7e528f 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -552,9 +552,8 @@ static int __init ns_alloc_device(struct nandsim *ns)
 			err = -EINVAL;
 			goto err_close_filp;
 		}
-		ns->pages_written =
-			vzalloc(array_size(sizeof(unsigned long),
-					   BITS_TO_LONGS(ns->geom.pgnum)));
+		ns->pages_written = vcalloc(BITS_TO_LONGS(ns->geom.pgnum),
+					    sizeof(unsigned long));
 		if (!ns->pages_written) {
 			NS_ERR("alloc_device: unable to allocate pages written array\n");
 			err = -ENOMEM;
@@ -578,7 +577,7 @@ static int __init ns_alloc_device(struct nandsim *ns)
 		return err;
 	}
 
-	ns->pages = vmalloc(array_size(sizeof(union ns_mem), ns->geom.pgnum));
+	ns->pages = vmalloc_array(ns->geom.pgnum, sizeof(union ns_mem));
 	if (!ns->pages) {
 		NS_ERR("alloc_device: unable to allocate page array\n");
 		return -ENOMEM;
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index c546f8c5f24d..be26cc67a1c4 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -190,8 +190,8 @@ static int scan_header(struct partition *part)
 	if (!part->blocks)
 		goto err;
 
-	part->sector_map = vmalloc(array_size(sizeof(u_long),
-					      part->sector_count));
+	part->sector_map = vmalloc_array(part->sector_count,
+					 sizeof(u_long));
 	if (!part->sector_map)
 		goto err;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
