Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BEDC8303D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jul 2025 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t1/o/4a/s7Dz0ltKRnsjxS2ZdIyOiVglIh36+7JEsJk=; b=FrDSBX/egdPDA1
	6b+399Iwiaish8+c+OwVZwgAMAl1XPGGKVOuxFsNW8eqDjVpGGCY6zZghE6iIOA/ZlMDq5QUXuMuf
	33rAKbqKII81TUl0TRAyLYgG6HxP1srbddsHf3XkSRYM2hTJXkg9AkEJFFWH47bPh9Ei+7OYzqvlf
	TI/588PT2Yhj69+adpwgkek232kMuir9FdtBcH4oKESYttbegHTqXXIo2X+AWfbKN0o7rCkeAC8rt
	Lj+LKFRTb31BImaTxQ0vm3nVEXP7Abt+1LxDpHBznVaVxz8RZ4+MVKQKRHcWKdmlocnUVTkRkcok/
	iAiboqPbZi8AGPNNBpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXe4A-0000000E87k-3ldD;
	Fri, 04 Jul 2025 10:54:50 +0000
Received: from outbound-ip8a.ess.barracuda.com ([209.222.82.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcwV-0000000DxZX-1OFC
	for linux-mtd@lists.infradead.org;
	Fri, 04 Jul 2025 09:42:52 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75]) by mx-outbound14-236.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 04 Jul 2025 09:42:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGw+5kvWLBtUpGI2Cc7WsMc4oB04bHzUUHzoQFL8vABO8xxEIfXMl0T5lNm0MwQvNYRbYqKyyar9kAmrUdnsAfO1424sdmqYCwj9PFS6IvlfGZ/w7kkVxBFEF4bzlA9RIgXD1KaDPcVSm3nvq/IJVqAu+S67OV8JOFqcUEnpJomhyoS3pyGu3Ry1kil/S1NpZrdXb3hFCcTLzzgAGyuEJpHOC/tYbt3cDJ52VAOOcA/2FJPmbD+7PBVGiGcgdHkMbOfhvrBsAjxkMDmRaPAXbgzqLlyItek9tWLdQaVxv2nT4aAxa0VkbxGXXIGH4tGChMwGeh7Kg+SM/vYHeh/AQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8ZNk+vSfbqt7ZiljARVGEx2xO+d9U9SQSCX5AfrP0g=;
 b=IhxFoc49wqOPAnqFDQS0K0iizu3REHuiV2+6bUT5dxFZ6y5Hr5A2XLTI/m9UVilYtnvYdHhNHaJ70xK2PCxoHwVCG4GFfaJgnHE9ac3Ac0D1TsfVnOOhpYgoxpNTLpbHnIovQTTapHjy9iemd26ih0rs+dDgapkPBwo9F+qjF/GDcDXtcCucPCLi4aSukCRZzUkzMianj2kjzAk5ekvyJy3OLCT6hjf+OUTIW+ma0W8UsoXALwtXhl0dY1Wtrb0uXc6vb8dWBSbC8Z4bqIfACyvH4/rI9EIJDX2PDjt3hFvOki0F1a9LqBGqdHRGKOa0rQ2EQDYur4Y52qzXk+5tDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8ZNk+vSfbqt7ZiljARVGEx2xO+d9U9SQSCX5AfrP0g=;
 b=TnRs2xDIywfwb+vNKhi7iMZMumsoqYuK4ONp5qPBySL+vWqcL/a991aFiWZX/Gz2pPpaIdrOJBEmOH3w1R0vjtO2o6YZDZCBG7ETw6oiaPfArKzNA4MJFiwQkXjQpWUxqWEeV/5kEXBtn63Pr7jC1i9L/9hKIJxfnZmCJ6M723Yh4cnDzvuLEY0IDXNfO9kPBCx8eEXcRCO+upVVkox//12gRbKJn8vVGPLImRRIWTXpgfVArfY5/wwx2HIRr0dfRze+vtrx8uGLURv1FD4XTY9HYFH0NnocAoQ8eaVTx5GGwJvqCwpKVBvmO8yU0QjDrCUeFJ0lhB9F8WJh7N02PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6702.namprd10.prod.outlook.com (2603:10b6:8:132::6) by
 CH0PR10MB4905.namprd10.prod.outlook.com (2603:10b6:610:ca::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.22; Fri, 4 Jul 2025 09:42:29 +0000
Received: from DS0PR10MB6702.namprd10.prod.outlook.com
 ([fe80::2639:a683:c082:a361]) by DS0PR10MB6702.namprd10.prod.outlook.com
 ([fe80::2639:a683:c082:a361%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:42:29 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: bbrezillon@kernel.org
Cc: korotkov.maxim.s@gmail.com,
	miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hector.palacios@digi.com
Subject: [PATCH] mtd: rawnand: hynix: don't try read-retry on SLC NANDs
Date: Fri,  4 Jul 2025 11:41:09 +0200
Message-Id: <20250704094109.3646314-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: CH5PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::8) To DS0PR10MB6702.namprd10.prod.outlook.com
 (2603:10b6:8:132::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6702:EE_|CH0PR10MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd6b694-b1f0-48a1-e746-08ddbadf1776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bsq3/6GB3H7cunLkzGQJs3IdWbBxAgKrAeMBS/PNI1swe8hNEbLjUcYaOdxd?=
 =?us-ascii?Q?nNMGeuvF9bkE1DiMYt21TMddCggV/696IaGrLUn3/2y6RV3ZgGQE5tJWgm86?=
 =?us-ascii?Q?yiF/sYaT83UvUw6LMDszDoN65wi9Jopzcoc9OHaiRT4y6HgpubAHQlepSC3t?=
 =?us-ascii?Q?ugf/KIryOe9XJ1HMk7cIJUMIe/xtAtkWBdvQGO+owh948WPhBQMCOJWh8eO2?=
 =?us-ascii?Q?ttvzLXNqKjs7bx3wtvR3cKm0M0gnRFQBGWHYCOdpBv3O/OsnYL9YLRnCWNsd?=
 =?us-ascii?Q?WBgF0KxnOcEm0EKZ91UNl6TUVnGwCCa9K5thIWUz9wnCaB4XIf1DVJkFbs8F?=
 =?us-ascii?Q?2dme5rnoCYxFf/wVKikE62WdO+daTnMoBTzt2LrMY3/Nz36e5bSb14VDFRPw?=
 =?us-ascii?Q?CbGw2zBylVPrTyz4OT2VmZf0sNNsdlQ7UQi9VJh9eJMpKvLl7gVqnHJN30yd?=
 =?us-ascii?Q?BsymJMlua3IIrI/IYGf6aun0fYB6+Jg+L6TcBH5/tUrlsOCwcQMuS0S2iAu8?=
 =?us-ascii?Q?MarKcVufwG2LQ3ZSzcFZL7JFKamgakI4IZwAaORa8LPj8/zvQmz94QUKVsPl?=
 =?us-ascii?Q?/W0+KaHb+qov/AtpNv/Zf/ZQVVvZ7jt9WF+CjZSfuZY5UxxgFHGnj0hXAwKX?=
 =?us-ascii?Q?0PcdldzBDEKL6G0/wFTLjmVhEh8plkkxLDkQkOFwdCn9liF8DKgHHGwvDTnY?=
 =?us-ascii?Q?cOupO5LQbdQNiW8CPZv7K4N6T2wLfQ76hhK0P+N9fXQLMb9a4qaz9Iu3+odH?=
 =?us-ascii?Q?xHoN92o/QFPvVYbSB86VzhNsEXUZc6Ba+PB+FcE2QFh6+VqesJ9wLQiUk+KD?=
 =?us-ascii?Q?e7SfIMpv7isrk71RZKoKQqAIPzs3+YWBpwtFO/wTI9bXJqAcQ5KvNSlwBVAG?=
 =?us-ascii?Q?dEUXyTu7mIAQpri7f6kYYHOrf5BQQUlqZbY32p2RVgvUZZBen9uO07Nt7Liy?=
 =?us-ascii?Q?imhvXNVwdoY10cdpiKFamCX9aWB7WxM2Pb+q5s3sFiDbiyZ5DRpW+t8TXa5Z?=
 =?us-ascii?Q?wdpUjetwGGSUMkbRppGc2lYCWH1WwI7+5KnijrNP3mQsc2FpqBl8NSOdkGql?=
 =?us-ascii?Q?V+IOO1Bys0kh6RYl5CJ+Wtp2ZBKEH2tSpTHYfaeq0DcUNMftFbbzubdWYaRM?=
 =?us-ascii?Q?h+zeHUhUbT8pU8fZu6T0V4rEzIgtcL6XN/2Xhr6UOObAkQK2ZDtKJh3DjYqO?=
 =?us-ascii?Q?U2vayoUq443tVerRVDtXXUNP/jUZXLwCSMBMQoUrkjBLhXpZHiKBvUu+HlTd?=
 =?us-ascii?Q?EvCl8Cb6ckkTgAqaEZvJ50BSP1ucl7djibybMOtx0+HY7Ucc8rfC0sih+erb?=
 =?us-ascii?Q?D2xcvTbGu07ZA9MAF6G8LHadnGU+f5foZVMHKgOqIsw/BT9ZmzrDBmVLx+Z4?=
 =?us-ascii?Q?9S8a9WTZTE7C/q52YyD2sFQs6DXwfv6180XW560Vrwih+h8qnocpIeIt44/1?=
 =?us-ascii?Q?87ugNNmnX3KehiLDiFA3W7+LWGuhE0JoifCh0m1MEkcbUvWqg3Uaew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6702.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6tMq3i7n4japdu9uFKexu+qUWdNaA/p14mmQ6swEAqmYl6nb28Cav8VmT1N?=
 =?us-ascii?Q?y49+/9bIu3JFZII/HHsXktIq0rlkH6qEokNkkVdX4oXMnrWzNj2nZR90sNcX?=
 =?us-ascii?Q?VwkZVsnpiEk856W3HYRQFRVDK3rHyepwHPLhuDbwhJYu34R7idGdZKL0HZjC?=
 =?us-ascii?Q?zfpWgRf3IKFed4VPNfJvg4bEI72frtzLskdjPs9dnEHzfPIb/LPThtSxH+zp?=
 =?us-ascii?Q?zZW8XliLtGDmz4RMaYogDpkhkCnhbJbYKNWtXeq7zeLgQlVRW/Gb0lBuPGyy?=
 =?us-ascii?Q?5L0ltpLtD69RhcyQA3fJ8To068PuU1OitOsuGzY8HkTG6ZKFWsu4FMJlfuS4?=
 =?us-ascii?Q?C15ePpZepmnC6EgZsmVrLMvsgAnXzinKifyV2qKezEQ4tFKXqR1tJFk4YRM9?=
 =?us-ascii?Q?g+UDxc+Shn5ElvL8DiE9Sz/uuXwt13M+0QsmBQTlb7XczMKuWQVAtMSFICBD?=
 =?us-ascii?Q?/Fa1rWAl8RCDsyXP2Zt8iNwXsMDE2usjTHpmhIvk2Rezp8uvaiZ2s9PMaUMZ?=
 =?us-ascii?Q?LLTSNtRak2PUIawcmeYup9MCIiM0v9VURzzjoBId4rRvva1e/CBzzomRXvdy?=
 =?us-ascii?Q?G4RIqEiVzYv1TeUYiiqBIc5LmLeoHn4ZTo9ld/PFbZe3VPZmHiDH6U0mD+Mf?=
 =?us-ascii?Q?QhUqWIekY9vjfbqKz7XN94L35dPpbwruZ8yS9zSdtyGi4rK9Q1TFX7pL3OBV?=
 =?us-ascii?Q?Umigw3iuGMrvO1r/cZv4sraEd4pCdnDKhe1uh5AxweLpbsl+yIZWNAbVzBLp?=
 =?us-ascii?Q?8pSCraqgUTfXdZy3SDAiww4zgbM3wVDMO+DCl8fBYWPswTMM+pRQvUkfxscH?=
 =?us-ascii?Q?rOxZwA2Csp1xrl80YFxObXFq6veOdbj4pcqzrhv1Rte/TyEkEdP6eCmUlnDj?=
 =?us-ascii?Q?Bgo6xnxXLKJRfb8ES4PO7eTA5OpCSuyZXTo61L26nBnDNlKXrtlEgjGlD5mF?=
 =?us-ascii?Q?YdnM69jk7OPBlAsneRZOB8FRd3dKeuCSMHq8+uQIVmT+dfzCAGo3zWmEpaiU?=
 =?us-ascii?Q?srNze5GmxIpnwCghl+end+W9dPDUrHIGi4EkLPSUoNZgU5A/8ehCqDWc79RG?=
 =?us-ascii?Q?W+AYsOwB50ifuQ+6dtVBNQmu2eR+IbmKBsgmZbuOwUde6/TZbQwilNOp60wy?=
 =?us-ascii?Q?vb9kPJhQ9BcBuVhGwqs3gqmjzaTX6/gGqmsWqe7+p4yQszenXQswsJHLRIuS?=
 =?us-ascii?Q?dadZwtzPB7T/VvzC7MkrJrHJGHeFvwlu1L8xTVYgFspa3kgBWLBDaybWkVgY?=
 =?us-ascii?Q?aSGfm9DY4QVr/8+td5UxIUjom++84zGYcWhOvUEvENlTXyoLJN3+0IG7OEgb?=
 =?us-ascii?Q?ZGOR2Qs/6zWZA5QwWr4dml5mngIPw1pCaiPgwWVfk/GiyRzx2zdskVwxlb5i?=
 =?us-ascii?Q?YUGEB1713chWdvnxsveGTXzEVHnAhBTNbsngpqmLqfHzvNn8jcT8pnptk1EY?=
 =?us-ascii?Q?FMt6odexXLUQ+DcbfXRp984gjcF3a0MSvmwuc77+UYhBlsnMbHIHuD2uYx/X?=
 =?us-ascii?Q?SOl7PWmZc+ZRl3hfK1F/YoCCDNsuwVztXBqzDXAhjSDN42cUlfwl5OnL7Edp?=
 =?us-ascii?Q?ycTEbU3lU6bHUM8EW+Tqyl+UTMOzp9KNs8bOWcUM?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd6b694-b1f0-48a1-e746-08ddbadf1776
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6702.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:42:29.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYZL4gGrOppMaD/vsVOFCKGxKFCyo8jlYgzcSHD9ovOLOV1+uSmcXjmsMZ4Ev6bFC/P4TBhPp3ipqeuXZaM1VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4905
X-BESS-ID: 1751622153-103820-5679-115560-1
X-BESS-VER: 2019.1_20250703.1506
X-BESS-Apparent-Source-IP: 40.107.95.75
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVpbmZkBGBlAszdgkzdI0zdgsxc
	Lc2MjSxCQpLdHCONXMItnSJMUg1VypNhYASIEFvkAAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.265799 [from 
	cloudscan9-47.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_024251_450263_19E58FF3 
X-CRM114-Status: GOOD (  12.94  )
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

Some SLC NANDs like H27U4G8F2D expose a valid JEDEC ID yet they don't
support the read-retry mechanism, and fail.
Since SLC NANDs don't require read-retry, continue only if the bits per
cell is bigger than 1.

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
 drivers/mtd/nand/raw/nand_hynix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index c02e50608816..b663659b2f49 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -377,9 +377,9 @@ static int hynix_nand_rr_init(struct nand_chip *chip)
 
 	/*
 	 * We only support read-retry for 1xnm NANDs, and those NANDs all
-	 * expose a valid JEDEC ID.
+	 * expose a valid JEDEC ID. SLC NANDs don't require read-retry.
 	 */
-	if (valid_jedecid) {
+	if (valid_jedecid && nanddev_bits_per_cell(&chip->base) > 1) {
 		u8 nand_tech = chip->id.data[5] >> 4;
 
 		/* 1xnm technology */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
