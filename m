Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF78EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3sRhK2KN3f1i0MRQANPuFgNpI9TCcBXki+lYA4qNLSA=; b=neXWpvQJ7GioWf
	K2eCVgBhpbMvNQvudxiIph7jk7R2lgcsZotOvfTyrptYkt5q5YL/FMfXJeNrlpvJA3pYLEtGQfVwM
	FKE7yK+S3BPNEDDAdef3gPmevxcNPdAXoqIkSV1qWMZh34GHaumJovy5EqsiDqItAm94OxZa9Pvs8
	ldbX/u4snOajkefWI+SKVZTwBblPEgGf6nUzxwWVsNUKdJMoE8gxFh1hzZBqKwtARyVHhUIS38ynw
	iiQMMp2X/WdNMk+hysZT1ftI4E+9MZ9AeC6KDGz4hpE8hZuuK9ihXbFpULjnSLi83w7c8IczLSpt+
	jXVVEOaKgjG4isIBBEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImba-00AuFB-2e;
	Mon, 10 Jul 2023 08:50:50 +0000
Received: from mail-tyzapc01on2071b.outbound.protection.outlook.com ([2a01:111:f403:704b::71b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImbV-00AuDP-30
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jul 2023 08:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnQemr3Hoykb6Ne+yFL8j5qbxb2DpCNkbMM3s4yFP0EZALOQvSs3c46EMMYgs9uZoXU6Viny8lQSe7gXX7jcSvxFCXfcNlkPmSVJ1CoOfp1+HASVXy3MQqIF1K7Me2LfxvkUzLtEJ4pHvGm9XJWHIobsXBsDAXRQteS+IRVcYd8eJ57HsniAMsoMyzG54tKO+K0QKxBZbXPKMesoXme3nH88tWiGwclXToWeoNeaSCdu1hHTHuvhbBhI8Z5rzhf915/WU+p2j+3JzPjFMGomIAeVtBbmLOjc9aEKYQmTCxH7CKNZlG6aVx6JsUVYHBjN2uFlO4pPqZkTIPkTs1pylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjVNJrcsNCFRfffGFEI/+Amh52PIERUfXqKt2As7HS0=;
 b=MX1X9ZLcrc24cxrq7WWHAW5nhdHAVGa5tQClkrO05TlplxIUgwKtLfyL9Y7ukQjk9VLKdvIy4hyku2Ic0dsB6tgyNSRJ7NxvvjsEjHPYXt1mXjZGiXhMgmQxJ5uGdIJ4hv69z0mGGM21cHs0yQhYFwxhcnSzzK0j7V7jc68CrOoH+aK7B5XJzS2Lbp/bICrFuhJX6TUM1MF4dWIhF+d/B3ekQ4A6LN46JiZgZgNrMKNYS+iq5uXU4SgusJw8Sp8WMxFvH/osnSWOF1LVM/j6bCSI8Kk5drh8KIWbmwDzr2fScB8A/1mac9yKK8Li3eMlNaMgLrMbxS/9kuP9p9rNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjVNJrcsNCFRfffGFEI/+Amh52PIERUfXqKt2As7HS0=;
 b=WOEPxOqNmfAOWX9U4YQtb/YVKG829dSX0zKS4nUIBASTMSIlqY/6A0CgNZ7zlqhq3CpMu2eFd4dd6JwQ4FjEAOOIAYeAaq69r5l2UXdt4AcjfJ2agXCrbJO4bAwDrZb2JyO8reahxWS7TLwvy2JlWJAO6OlWOxPTGHvhaOGbNQ9tWZojgY/kn5XqLBEbjkO4IcwVRj/lSVYvH5iU0lOAdRUykRa1+qLVKjbyGFd2iLeHmZHjPFdL/JYZJyAOUVhmDWMwRlhTljz0tgBDJP0h5gPvYs8bQTmfTkcsTGfq7ZDf++sljr43FcQdbXOIty41rxTQE7cDuYLhmUzlRJdMUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB6615.apcprd06.prod.outlook.com (2603:1096:101:172::11)
 by PUZPR06MB6006.apcprd06.prod.outlook.com (2603:1096:301:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 08:50:28 +0000
Received: from SEYPR06MB6615.apcprd06.prod.outlook.com
 ([fe80::c817:d237:dc0d:576]) by SEYPR06MB6615.apcprd06.prod.outlook.com
 ([fe80::c817:d237:dc0d:576%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 08:50:28 +0000
From: Yang Rong <yangrong@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	luhongfei@vivo.com,
	Yang Rong <yangrong@vivo.com>
Subject: [PATCH v2] mtd: Fix resource leaks in for_each_child_of_node() loops
Date: Mon, 10 Jul 2023 14:10:04 +0800
Message-ID: <20230710061412.2272-1-yangrong@vivo.com>
X-Mailer: git-send-email 2.41.0.windows.1
X-ClientProxiedBy: TYWPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::22) To SEYPR06MB6615.apcprd06.prod.outlook.com
 (2603:1096:101:172::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6615:EE_|PUZPR06MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 064799a5-aa81-4a22-c024-08db8122b564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2Tqaw8imPmtfn+Mw0GL3zeT85Rp3idA54WSqfca8wD4a+DPODBN+MH5N4Fa/nc7Orfp7AW4P8wWCH5IOtlZlw4C4+r7VCNBbOd/04I4iAXRRDSNufNj8o7YoDUH9Lzb5YIsPDt3he8wJTUKik0+9xfj9FjssQOS9+tD4F+Z83QVqYeyMIEH3HuzMYg0t2xnrJFuQsrXDawamMB3kR288FAAXfWr0aTCI/ryNVFmic5lTppHN5+bNJqL3UxugwTHxiC4RqEjqtXkCVFpcD0SUjDKuD4alREkqaUFpvC39r2er5snbo1LNgqM6KgTxgsUYPpB3WFddfu0xFjMCTv7mWgEWO16vnGYjs3agf9Z7THUY62Kg6FHiMo9x/ljFSApW/ktbQNjaDAet0Ek2N49kaqR7H25husnE2ufNoB/aLi2E7ZICpiYLPwM7C8/ifTWSACiVK5V8XKXjKHSMIdov1UA1suWbXxC55aYZFjf7vGN+MSdkTJvv6LlXyvRrQ98pv9FdN3KxPJwW3jj3HHRk3gUdjBnoODBF2GGKy+z4qKfs0EHqg9ZSGMjWnTMd1neuyLCpQ+orh0nmB7A4z8pcN8mnftUQTYZ7mnA186aU0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6615.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(86362001)(38100700002)(38350700002)(36756003)(6666004)(52116002)(110136005)(6486002)(107886003)(6506007)(186003)(26005)(966005)(6512007)(2616005)(1076003)(66556008)(316002)(2906002)(478600001)(66946007)(8676002)(8936002)(66476007)(5660300002)(4744005)(83380400001)(4326008)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ByzJ1ct2EGwgeAVarXLmwteIthmUcuL8xgHZPP7ata+NNB3OntsCxkSGcJuw?=
 =?us-ascii?Q?ufuKvTtEZHWTvkgJdiry/mwPp92uHd2/gYd41993rT6UD/JC1Qbihu4anOo0?=
 =?us-ascii?Q?s99zS7PPCQP2TI1WL4/EoMJbUbwJFr+qSpyiHIT7MQr9y0RNECQAFKzk4RNP?=
 =?us-ascii?Q?KaTlS2mDFpWEXvhDwk0j4WdKkq4TCOMILbEGgVETtXe+z6KrRPT6M7/zgO9Z?=
 =?us-ascii?Q?JcAU2MbEvolLa9n/AU7lMvPVrDinthwFXlGzK3ovCJgR8lAK+Wx+vSTHpS7T?=
 =?us-ascii?Q?BXiiCFTp5Y2QNi83UnD/TVGFz90+fEi5Ay6Cjbyv3AVGrxnU3yX8rsMo0fYC?=
 =?us-ascii?Q?YDW+8/4+hrkDYSfmXMzoGAbctfuar96zRLpFmk/v3bC1WDwKUKF5jLloM0qV?=
 =?us-ascii?Q?a6Xs09DbvgqIefxa8YmhzX59coaviIFB3IUmLdyECNwFx2LAxxGCl5XuCkrA?=
 =?us-ascii?Q?hXroDjX+G57Bt2eyGnRR23htRmSGlqRjWVSrjYqZPrxUonrrFjfqSzVhnitB?=
 =?us-ascii?Q?0isSUo+TW3ZUazEyNpSVpOigVdobRZOWS7iyFgQeopj+Ch+TUiLF6IAezrr8?=
 =?us-ascii?Q?XEAfsk3I2qN65eoxTZMkAyf4thE1qgKcu8zP3xxbYDPQmJH+vEWfWkGIqX0O?=
 =?us-ascii?Q?zxlwDNWyhJOHAwIzCwIRlFUxFLQ6GTg9z5BBumSwILfU2RY/xSdQpnjrviiK?=
 =?us-ascii?Q?wrAF4LRAd1vFcVIqOdnmkY5C9IkUwRUJ1GgOJTMizZWyeS9SQsrBm9T+SzOv?=
 =?us-ascii?Q?S8rohEtgApgONo2snRwptPV6Pox/rcQtC532+51o2wdff9rUsIZ/Gr/QlHIT?=
 =?us-ascii?Q?a84LV53/dJ0VjVhKyoGyMsfvysVsv198jFAQfururOWpndtUeUF31t+unzdD?=
 =?us-ascii?Q?YeXEs6JWlnMUA6xlhUfVUnMZ9HA0sXAQgNroOWZaQ/XpZTd36HhIAwo1JRIi?=
 =?us-ascii?Q?9b0Ij8T9Ax1Fz5VZxPRhP4LLySsEPDV3700lOEbzQfq+49wJXTDhW8pWGji8?=
 =?us-ascii?Q?Lr66LevHY/x0F+lB9q2gFgSYpKTsLG6PP9AGIgbcUJr1MT+VluTMBc0bwDV/?=
 =?us-ascii?Q?K1lVgWnXZYJcXdEhPORoOlBQ43g+e+eXPF3CF/5XCOB0c+apeFACYcqXBcOP?=
 =?us-ascii?Q?VupfM6WYh7Wj2BEhMusR8bCoOGkEOU0RT7fgY+pZ1QQhMllAxxdCnQn/mwNI?=
 =?us-ascii?Q?j63dHfgxD3+cHXaX8e0UEBKd3MEEoeyfrgpHAEYbnX+lsT5oAGQT496rRGUj?=
 =?us-ascii?Q?Jd+H/aI6UjZYQWFJxQWuIxnAU1VUxEcmRqyV1ss0WBIwynVm3IjmUr24ZLDx?=
 =?us-ascii?Q?b5chG944UhD9sWQUbXzRVKJAnbIBZKzXAJRvpGxSR4WRbLZho+WmHPug5zxv?=
 =?us-ascii?Q?hZ2aYkIbfaf+74nFvafnEpJ3nUMsJmywf1hMU8t3lzxp8hTvbGAuGpmHy5YM?=
 =?us-ascii?Q?XWEEhg3PN0EIXoDFCqXW6ZGKw9ag2aJWyvXNeOXwEPvrsNjIdzEJvrMRyn/2?=
 =?us-ascii?Q?DGUQnGLSs6KZ8o7ly9IQtW8fXgniA9tNhuGefWHQlm1EDHCHgKf6y/tyyh/J?=
 =?us-ascii?Q?JjJNCnwPu/LE1bNoHzCxDIzgzHoOhy+GdqpP/nZF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064799a5-aa81-4a22-c024-08db8122b564
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6615.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:50:27.9440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNAqSMdR8PTTCThKEBxBpkfxMJWAYG7HmCJ4ZNjS2qBOegYWLu9dqJ2MiS90qcnnHwIJHOD1jGMrge6mKTg93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_015046_001560_A055CC07 
X-CRM114-Status: UNSURE (   7.66  )
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

Ensure child node references are decremented properly in the error path.

Signed-off-by: Yang Rong <yangrong@vivo.com>
---
v1: https://lore.kernel.org/all/20230621024517.1155-1-yangrong@vivo.com/
The modifications made copared to the previous version are as follows:
1.I have changed the Subject to provide a clearer description of the issue.
2.I have simplified the commit message.

 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)
 mode change 100644 => 100755 drivers/mtd/mtdcore.c

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e00b12aa5ec9..b02cb8b1a38d
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -591,6 +591,7 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 		if (plen == mtd_name_len &&
 		    !strncmp(mtd->name, pname + offset, plen)) {
 			mtd_set_of_node(mtd, mtd_dn);
+			of_node_put(mtd_dn);
 			break;
 		}
 	}
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
