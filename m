Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B854EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nYXgiQwAaAp/RdWpE2Y09yj+hi5o3rJQVwNrHr9h8cg=; b=Y8fFK7RtpXXcsG
	B0Ln7pwXnp2bCcLmb/53mavmkwHzekR7GRUtkbkaraoG6WGt0FNpFolnuqlw/HQ/XaBPlXa/GycUd
	QPT5lmjkg7deCGCj07Qsz2aR0Nf26P2/2hXuH8cq0TXG9bByY7c9XtSpV1VGAg3r0VrKf+8LIG0Ur
	js401cNvPR+q6NDKLwN0bTXO9rJp+oqRLtJ6SQCZtZBaM6cCPG3ZEXcgsh5Cec2tBliaHAWdg7+nN
	+hChS9clXwmBceZgnmgb8ih3pnpc7t5KcbWEmZu+B3mJzklCwqOqmB3UvjPijFfEbhnk/d2NP4xLf
	3h6zMES6ohE4a6507Blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6eW-00BLS5-ED; Tue, 12 Apr 2022 02:53:12 +0000
Received: from mail-am6eur05on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::607]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6eU-00BLRL-A9
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6y2igkJZHnM1lfmOIsn/fl2nmvMxQLSyb5uevh3GJRgauczmI76hPnK7YtgIY+syD8Wn/hJtz1PduydlDV/h5pqq6wXAUQu78DpRssdGfm7BZgMgRb4Qpn4C7g5EhYIoqYW/tIK+mOB0p9y9hLP7e3AJMW123VkK915Lfj3C6hyipwvguOM1oTYXPEACkUd2esuKqkyJT8iMzABGZvd6qoinxAtoYKPrO8AlginigqkyRrTG5lsQ8TslWgrg+0PpOmGCSpXuavVHg67SOx1FCWBrmdec9B7ZFvkzlxSmmI3XrKLsNDMvo4dwToDesLpb68U62iwCGf8OfLKoZ3Itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF86hspVsI+uruDEJl4kwDevzKPn2Y6AtICu8Fme6mQ=;
 b=Oj3VukzRQDDbWmKwc+mCocLIn6SW1RqMpk3GJ6tqd/RkF4bNXX6FZUJaTL9GGyhdjhFNQRnuYD7sXS6rwpHhw3qXtlU86STV1458d70oZ9H9j8mOgMNFGTR2z1xp8FsKqyMjAChuWqw6oj+vv7uO/3SAQD/tbLzg5b3OZun38yC2QRhJrTExr/etdUXuiJiQFxtMT5qmHnWumDBbA7cihm8n6YIWBqH5r4IbAspXSEsbNV5dQD4DhqncVi7mRpytVjZrzWmjO4oQDdHRSvyU2qP4F2wWEiNTR1J8JoFFamSB+zm2/X1Z8Rk+5ADuYhoEfriyi5Mfp8ej1VrUw8+ylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF86hspVsI+uruDEJl4kwDevzKPn2Y6AtICu8Fme6mQ=;
 b=A1ADoEytTwdmyaXgKOyb4vL/a7ENvfpGc+sYQiyI+v6H3pLohiCbV6e34WMXuS1btwoSqynYvF3rgMR1zobZIjvPrZNz/f2uQEAsNGiSJR1rLMgpp73sP7YC5z3sXYllfD+tliSyKouAe96fNbJHni03ke8yj8heB1EPaj0q5tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI1PR04MB3229.eurprd04.prod.outlook.com (2603:10a6:802:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 02:53:04 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 02:53:04 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 0/5] Refactor bch settings and support large oob NAND
Date: Mon, 11 Apr 2022 21:52:41 -0500
Message-Id: <20220412025246.24269-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e060c5-87a1-4bca-602d-08da1c2f907a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3229:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB3229DB74894DD93E200918CE97ED9@VI1PR04MB3229.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpkEAckEMtPonsJb0BeptFLkCGup2cgAS9Mfxq4zFwlF3t1GKbOVWSRhr4i42vkKVCcM7/XtoP9oLk+KkVBweh9KjpCQn/nhM9tF3OE/vZ3nkTXAxn0iesbfYbvNazQRxaeNV/h34hSl0qxgeN3NvurwGVihiwM+wsqaG+F5i4NlzjXRTHNQs3CujQJhSUfxfiyaAnet1kAXu5z5zArJSbEuU6SAzwiTLn9w7NXKUT/6Z8GwcLm+LePRcY4QVe6diRtCMZvf7bJO3t7cVyc/5mmQff4Nj0ccejfO0uuodM8pJO8m14lUiCkawpwJ3FACtyWRf2eeNbdcVgmg3O5kvX1w8yzSnbCZdDSWW58DW9fCsaQjwsQMCHxIbxzq5X5oNTVwdezX5p26W7GRBs7mTtBE1eiqPCiT1ZfptDfmA/UyjhT9Ctxvfdgfq5YtEXzPRxzi47GDvraT1LRmhvVgLtha1vZjK/g8wGoX0lNnZRH69/XdcsXS6JxQnAO0UivlaWNAWTU3SbxJTw9GGl/PXjSVkXEa5/5OhmZGXSj2dFNWF5criEHdFdFMmbjMp0HSxvhNPzAhd9CXg7/OEfbTB7eCbBgJCZ8ztw1RIwHvwc1YslbKmZQMfhhlk603EG7hOyqU9IA2lzztAm434YyN9M/x2423rTLHPtRp3PzkUHNPi6aU7SQOysEL5JKi2mHlanbRw59gl5ISe2ZJat1OMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(6666004)(2906002)(5660300002)(6512007)(44832011)(316002)(2616005)(66476007)(66946007)(6506007)(66556008)(8676002)(6486002)(8936002)(1076003)(4326008)(38100700002)(38350700002)(36756003)(52116002)(83380400001)(508600001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/aOUHclbyrtgtR3vEKgJYPXMS5nbIW2mLTFxJ3tXLIYXMlylAP0F2rmxOzMu?=
 =?us-ascii?Q?g0qk6Iy+2G23jSORNLQMqgm7+kA5DXNS+Pf7gpMqyJSohRCZuONHuAogORKf?=
 =?us-ascii?Q?uOlD6uT4gIoxNdgiszVQFVlxS7DtUZ1EIEs29BUpLbiL6TO/pfY09dmjNM+X?=
 =?us-ascii?Q?HjkUUK3TcwMav8phNyzHjWf0YV9XxHy2rUCA2MEPMaWmfawSqJ55qPEqUM03?=
 =?us-ascii?Q?X81DQHNcVJ3H2ncLL0MxLf1KEawFfLkqUQpyJU+p+qpRVlop1eDVCYLY2vbK?=
 =?us-ascii?Q?wpe7o3NnrZ5oFZxOIF/neJu3yMn+JzX6QAuXkKpmLPid/knXGM/wUYTswrLS?=
 =?us-ascii?Q?StSe3O7ey0+hcPAJ+1GcaG9NPmwAsLhE3IsSByKGdmnykewIBvnMcJo3vi/L?=
 =?us-ascii?Q?8aAY95uhAc86Kv1/IGz7IjFXT6/dhW/0M/5ev/EQ2MFQKvizTr2QbbqNJpkB?=
 =?us-ascii?Q?FBqZyy7yzecSr0cv1b0HCuX/i9V9pwenKnXuCXshytLAYN5tuaGoRo+0Bch2?=
 =?us-ascii?Q?aZRKeDeR8Ny/+Tj+bTdLzpoQv7xNdjouaVjek0XIwgJcRRpOr6+325SGkdrz?=
 =?us-ascii?Q?8gC+91I0+UV27oJRGkp3ySToa+MSEo2LHPzJrR4o3kjL6cAzhcnIhOt0MAjY?=
 =?us-ascii?Q?HObdotQNsaXqolEehE2l7rTAPobQtW2G4CjD3pWwX+DQeQ70PdLEI1WIaJNN?=
 =?us-ascii?Q?xwxixBZt1SXIOtirU7oDbKmfKAJYlPCppy7KH6Ctg3sJUeXl23epWyM11LRo?=
 =?us-ascii?Q?DFWMJiame6dQIpXweZzpcGRAK4yxsANroYN+dMJvjSX4ZKm6SGWtxRGNtfTV?=
 =?us-ascii?Q?oOvxtYVpCMxnnq7GclCOof2d4Rb9FIVajrPTouToS6+CPr+pGMO/OnIhKaN3?=
 =?us-ascii?Q?G8woNm3xbxT8GX83TnNaBBaM6R4rEWe/tNUpDqAd1mLJNhHGCTRCQIC6G1Xv?=
 =?us-ascii?Q?8CJIowRd1EZ0UIdOxN/Lu2SZqZuJR9Y2euLz58fUQ/Xbl8d561zBfMqhDBSa?=
 =?us-ascii?Q?x6jasf+gpUJE9cJMaqYEqgK40kggd733DyI/aCxwOKMkvlnhC9hV961ldZFE?=
 =?us-ascii?Q?BtXcXxlE7lHYKbCJYKP8ag4mEUbC0Hu1S5367HAWtIgA+EVe9c4Nm+dEZYhh?=
 =?us-ascii?Q?7rZlyySIagVoY48i3aoQCyHkThRarNzWA3ofpAgT48GufLPFn3l7AYH1qaa4?=
 =?us-ascii?Q?XJU36dlq9Lwvtd+GC7ClUyQmGK945huzZ/Vld+k/Ty0HQ2zoSSkvqXV5ZaBa?=
 =?us-ascii?Q?ZnBHuy56pCs+xNG1p23Lk79erBHBdgpJYgfbTEVMG35wXtiG77Zje3EaYUGs?=
 =?us-ascii?Q?/pCxRzWbtOTfM0WCAH9gOcnICfL3SWnOf/+bI5ZY4ik2h6hvT4dVz+MjGcKS?=
 =?us-ascii?Q?TE+Ol/xXNY1OaZEzKLPgA4UczkRf9VG+YgD+9HXem8Jk6ckD4wioAuud9DdF?=
 =?us-ascii?Q?1p/0YfmcHnhc7mtLyYUXDT9p7FSPkxFL8O5VouVwoeU7iuGkpRzQzmhIkvqU?=
 =?us-ascii?Q?jX4757tc4f6XSlf+FneAYygUOShvjX4MWG9892nwdxvdTFB2/rEqM0whtKrG?=
 =?us-ascii?Q?sAPBDx9UlKdVGA631kJxxSGXvXH4jVHsasaVY+HxzB5ySZgSIy3lP+f1w1lq?=
 =?us-ascii?Q?XAxS2ookOEkwLkjc65nAHeRc7RHJ25+QNpnOKWslnL3dWpcqm4WsuYP8Fs7d?=
 =?us-ascii?Q?HoOECpI9GM6rZO7drFDcaXSBXd0x5cwEgkYqnajc4zi/vn4FW+xCW0y+jm02?=
 =?us-ascii?Q?swjZO31NQA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e060c5-87a1-4bca-602d-08da1c2f907a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 02:53:04.2931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAFuzLQohIsZe9JK3TxOFJnQWHpSeCA5QYa+suPGmAJA4Oml1w+pZOPhMAZHO8O7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195310_395638_5736A516 
X-CRM114-Status: UNSURE (   8.72  )
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

These series of patches refactor the gpmi bch setting function and
introduce a new way to set bch for large oob(oobsize > 1KB) NAND.

Code changes don't affect the default bch behavior but users may add DT
flag to use NAND chips required minimum ecc strength. More strict ecc
strength check added to make sure ecc strength is strong enough. For
some NAND chips that oobsize larger than 1KB, a new way to set bch was
introduced, which may use a separate ecc for meta. In this case, the
data0_size in BCH_FLASH0LAYOUT0 and datan_size in BCH_FLASH0LAYOUT1 need
to be presented in dedicate variables.

Han Xu (5):
  mtd: rawnand: gpmi: Refactor bch geometry settings function
  mtd: rawnand: gpmi: Add strict ecc strength check
  mtd: rawnand: gpmi: Uninline the gpmi_check_ecc function
  mtd: rawnand: gpmi: Rename the variable ecc_chunk_size
  mtd: rawnand: gpmi: Add large oob bch setting support

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 296 ++++++++++++++++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  12 +-
 2 files changed, 264 insertions(+), 44 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
