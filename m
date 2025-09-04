Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03169CA1013
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wb3m7Y6vcmxinozd74eJAP1aW3/vW4HgJn+HuwldsYQ=; b=pMUMPnwIs1BrW9
	clGkOYEWBWI4q6v761QnKFe4VxGzvoNGSeQWHBmfbDSohTehbOHShLY0Fm9IkII4u8DcJzec19xTJ
	UYPaQSeaoj2yLV1mi+l2/4HS7typhPwbAhivptv9BRHTn3CUi3qjTu2FoXPoP6aVP4+pAOfnA4CoO
	jXgJqJ909RWuDBu0hrkkWL69verv7I7/9H4iHkiQfuJ9igXR3bHCeon0VDlHIF9VJO754PNXOB2zi
	bgWS7Lf97d1Vlmbr0LevIXilCboS/e6uUMNwQQQlyk2R/UhKU5ST4vHjY6QvVTBmx9ACRAdFI9+9d
	6HN/NWPZxHeczbMyHwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEm4-0000000Dd07-2Vsy;
	Thu, 04 Sep 2025 18:33:32 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAnC-0000000C9gR-0hSW
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 14:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sc8u8wgsLRCSAUCd+WlPkOrPdVB3uhEMAIAvOgKVr5PYsCVz6vS/4kgFKkXP87tX2ciUuMILzauhIewS3zEAWKXDyvi/nY0v4NYzl6MNok0snQd7CUtRNKCx5RY8k8elQxcY4wrn0Zg+d+voWFi8MFcnMAanS5yTKZPsIpRebeE24lMGaj6hd9e4ooChJ5anNkM1YvZq8JlvniBIbRZtn9gQV57WcmEP5JvlioHe305qhSjimbI5h/t4YtZa+lenM6lr/Wqj8uJ3kayrOmliVFfeXIDgXJ0Tjc6PRv7R7APR/vPqD4mzdcVbIN0xTxV93CQMLiKwP+WZ2+cnJ1F+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnRNLT3alan4vw5AJNHLBKDFk6JCmdf7FdVd/NAaEns=;
 b=gKLphz/r3OrqipgfJkK1EwOIhRuxrmcG1tm+X6alXdjlJ8GMQ2g7ARu6pGbE5y5En5R4ufVYXaVU9IK7lekCZsjrSyli0zOAwbBqaamNu1hGLVXqgy9JMDFaykArfUEbpEztsBhadV4vXVHY9yVYQ6VhAKqVrHvz1lRYs7GqpWOPk33euCnV+vxSECGYBCSjl3Y6yfXmVXA1S37BPy9Hu/DoK9WOMvRIODn+Iux+q8qS9RcaHIShrAVZa22JOM8+R2xs3zo2/SH3mGE55gWGO7ARxRdCWNkGjqaNZi4UicGsG/3S/E5FdF7KP+vfDJ2C1jFdoFZCELTlRVF/tV3tkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnRNLT3alan4vw5AJNHLBKDFk6JCmdf7FdVd/NAaEns=;
 b=qi+JHY7FEvTR486JXHyhMUlwzmOOVu7t4R0Y8NVw9aOyVWbUiv4S7C9MXuFcHYAMsFiJ93Bhtj2N/uEzd0UvnAZMY70jYfDk4Il0X1JWchodxfzivN3xOqR8qBK9PqqmXHpP8x53b/JWT78dzgVAdD3HfcxFGmkvXr//BePjWrA+wzPIChnF8LZlFKrOm7y3ojDmCpyQqn3pMRdVDPtiNBQV1kRA4vU30y+4hY2DwjgXp/88/fk4+YNa+qNjqev4DvweeYn7daT81WbTS9v7pMNulWoVa25vACxWj6dmy8IRRVla2eWma/wPGfL8HZUp8wCWpe01ybO3JYCfeheUng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV1PR08MB7875.eurprd08.prod.outlook.com (2603:10a6:150:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:18:13 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:18:13 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v5 0/3] mtd: spinand: fix continuous reading mode support
Date: Thu,  4 Sep 2025 17:18:01 +0300
Message-ID: <20250904141804.655608-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
X-ClientProxiedBy: FR4P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::13) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV1PR08MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da3865a-121e-4ad5-dce7-08ddebbde1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rhEi5uo8/wid2I90OLTQPKFOJ77jzdIOFVmJ7y2SZkq8JD+6AQ8SyhQk+rrW?=
 =?us-ascii?Q?8ErvvduhU3hLI2nkUhels1hRhyqkr1PgQ2S4EUiiZ2mloLSy1IMF5yBYJPm4?=
 =?us-ascii?Q?7Ls7EmZ/dJOjwcMCZydrdPFS6osv15bLmqEgyyMdkbblr56eSPF1kEa4iab4?=
 =?us-ascii?Q?Pz3hB0r0eEGmh0vZeKvm4goJqX89a4zSEkMmn9KzGcaOA1vP7VYZeaHAtD7v?=
 =?us-ascii?Q?9KpOChm4nDLcOU0uwqx/HEdov9MgTrUyTchByGzsAS2wNBKOzcoKxHEmIeRh?=
 =?us-ascii?Q?Z1DI/fGQA95rYWqq9dq+VOClWRjxoB7X24/X3BxGZfUdyPjzQLMTJJbMA3ux?=
 =?us-ascii?Q?NjWaKzcesbARoP47dF4h+sznqM0WeO6WdR2z9i+a+wA+viufqmFFiExOa1Uk?=
 =?us-ascii?Q?4jH+eQs8lfa3W9WAOZ3e5qaRiy5GHWdq4thLibQ/ZiAN+FAXcLcDpXDkSvnY?=
 =?us-ascii?Q?hsmHAKHrweFJh4aumNQKLhI4Zl1B/O3bXee+zpvDs2llP81RcfU9uzQMMM7Q?=
 =?us-ascii?Q?Oxv/zAfKOGu4DEsP9U+GXTEWNe5kxIolZugfjtKMWQWPBoASBpIrRmj2lk1p?=
 =?us-ascii?Q?PGJEOY2BVMo253nRMJIhmy0HzeuTszX4d5oV8bTUdFB2X7L0A2faJHUXLOWm?=
 =?us-ascii?Q?6vhKQ7HjE2W0+E4PLXjdv92u2mkaKYkCPDadfLGKfSx0udrcfKEjT1VRHAZJ?=
 =?us-ascii?Q?RUyWr5DZDxZEYkUoShERl4B7ysRdtwhJxKOsPemICDL2B9L8+6GUl/N2981y?=
 =?us-ascii?Q?DMTn7Hu56Y2f62GnULViX4fpH7opudnFIQ7v+oC68Wf6b+5jrBATLzxfWAfO?=
 =?us-ascii?Q?BQbiLp6vguaPTx2WnIOYkCDK3ppzPiH55XUJPucFqJkEx2KEuvMn8byq4lLd?=
 =?us-ascii?Q?mHthr903vSE+Lr475EvE/r4IYdWqvXX/mkD77GClceg2uEiFtaff+0iJqTHX?=
 =?us-ascii?Q?9aGvB3F2zomSx+uBWCh3vZwA5CP21w6+1GiTeIBiuGaTz6bXZMO/MorCQmdk?=
 =?us-ascii?Q?IT4P+D3EXFAEq5Jh2nzs7FqX5iST85HPkLOC043HAJzukA2tB3tsceumt0Vx?=
 =?us-ascii?Q?dCSpjmaxdkMo7TYp9H1wiBeSwxw9omOxBenBzKRF2KV2nj+9luPU90UA8v3s?=
 =?us-ascii?Q?IdKFNS73dzjn4y7xiXEY8YGa44C8Om/NoxWxTJ9ACm7jMKVh+oY4s3Gg7wjN?=
 =?us-ascii?Q?Q+1cahCmN7YctZFDq/aVrryRQsho3UCE1HXCik6bdNcOl+BJdTZ9/OCLpav9?=
 =?us-ascii?Q?AJZU0E/+OfDUTgwbjv/KXPpS2G5h6xLuDoLnQlSBr1BMwPsLZDZ34+EQfOiT?=
 =?us-ascii?Q?5irveA7QL3PHGO8rY7hxZrU4Zq1AKjILiIIMYcLWCHtgQ5O2OgCgQEoCaWxc?=
 =?us-ascii?Q?/IQ2fMqKRsv2/capd0KTHWRzx1vcMBgllW77DkiuOva5f3XiZz4A1iVvMWb+?=
 =?us-ascii?Q?jiqDzQ4gVzdsP5p1XVdJxx3zSwCB+6UBEeYAnYFvT7MlVNPuNz2F1448ieCj?=
 =?us-ascii?Q?T7LvuOynMTfmsE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aEML54hNVSsDk3j+t5M0CW1T6ItXLcrfJAJH6+6m+NDQI498zyxSeJwlvIZi?=
 =?us-ascii?Q?nsrd8uanJ+w7EohH6CEmM8giypby0UFHgC/Sw5TEeyR4+yIR6m3sItPXUwSw?=
 =?us-ascii?Q?dfwQs/dDgLpEetkbrh1wZCSurxBASHB7JbzJnBmbg+ruvL0Yt2kpB/M8Hoiw?=
 =?us-ascii?Q?0RmWqprH181Ubm4/gkuJi/TlP6aOaV1Q1VZQiwxBxxZYHjSTWfm0Kc2yaVBi?=
 =?us-ascii?Q?ZzQtM6yAkpP73fyVsCJ99+DAwJpt6lzu5W3Yz/rEAFWSVvXdBI2osSAsUScG?=
 =?us-ascii?Q?SqAWnSZgE/vGXQJfo+gjSQQHScSGX2WLmzKWJinPnDZBwNYse9FPLyZarOwi?=
 =?us-ascii?Q?I1QaG56JOShRl9V9di+5FzUrioTJ0T4fr+4wYP6CKpWDUMApg5jjBW8Zm4s/?=
 =?us-ascii?Q?svqPcdrDigXIQV0hjAeei+5l5QetMsgPpwy8337T3gXLnv+XzaRYIcDFvblr?=
 =?us-ascii?Q?gZ2oEDTnEJkMkqUCQhvrA88sMC0z3rVBCX6QbQJrJezLo/i9ugNHV8WZSNuX?=
 =?us-ascii?Q?OJUV8OPaVAFoy7D3qDwTV/CAv79NhPemXOos3HI8A8ex6Y4BekcB4MZzpywK?=
 =?us-ascii?Q?wEwMNbLphJRN68wpeI+qtD/h5EaUx8l77wcJ0DDB3bdngiwStBO4+k+3h3l9?=
 =?us-ascii?Q?JjthfMBAb+HoRru/yaEObfKyU//Oj5yuUE/lqyMjZtKWyTEXMndc+TUM+Q7g?=
 =?us-ascii?Q?Y39szyF20W9LdqtIeNW3MhlgHD+jS9wPqhVCgh9N38J/l3BL583ERXpTXs4V?=
 =?us-ascii?Q?Msq2jKropw5X5o1qgA7x5ty6w0JHrH3Ewf9dwQMA7MvgA0jK+m+kGtVGm/BW?=
 =?us-ascii?Q?zoy4/qWWarj4WaY9DLTjdO8W1VxT9VG6FsoUdai53JOfqDyqRvZ2Z5KKvcHP?=
 =?us-ascii?Q?JVh4INUBeIEPgtbWdRNm31CebvRqWhCUQEBc3qmcUejCSERqfoBw8yIeyOtI?=
 =?us-ascii?Q?od8n8PSvKTLLvGTLP+9nzFfB9hkaemSPax1QhWPHYevyIkFcI+uZ3mEjKKRd?=
 =?us-ascii?Q?nO9oqR+t7wFlhK0Vo3ehcpa3ircqd3OfJZzuHBXZpwNKzB75vo+Z8yf/WvUF?=
 =?us-ascii?Q?DHGbB30GlFS6RBOCfAxaKlSX84a5EjsBWqC5aJyXcaCqLXCjFQ3JfNuhwoje?=
 =?us-ascii?Q?S/Gz7Q5NnBbxrg/E6NNsvvvIV5Ur97aB6JZhyqgTCDWdg69WsnST9MnA6duI?=
 =?us-ascii?Q?scYNEqX9dcWMaRQcNtUOudM0/EVbHvMIoTwjKjZyiOaeGsVlyKmb6mi7mZ+v?=
 =?us-ascii?Q?QskXsWZ4SkEWSplDBKK7kRJOXzsQ/VQoKC3dIlrS4zqA76eyc+JOy0yzS+Hf?=
 =?us-ascii?Q?A8Qm1raVLk1GusT8Izxxa5szfQJZIDt1OuIJSIMYRodBt47/CdqQKrsirMrJ?=
 =?us-ascii?Q?pjp8KgLbKz2wli4t1w6fYk00obvWMR+Hg/LXbRxC1wkCW90uVONnYRjCVuxI?=
 =?us-ascii?Q?1kKCBCdRXCtzFucujK7ic7KlyMV3UARVNMyPTozUkqm6JPommsBVz4hqEg2q?=
 =?us-ascii?Q?z/1zL9V9ITUoJUi88dbKzEhvULBvQt8RY73wxh1K/TXqmtMxFaoOvYTfWsL4?=
 =?us-ascii?Q?ExvyxB8Cn3lwQtnz3qoaZ+eZjKF/6jBu1Xumv0epIGvizxrMQwj3Vgn1qMO8?=
 =?us-ascii?Q?UrRbnvzM9JMEBkWvUaAh5fU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da3865a-121e-4ad5-dce7-08ddebbde1a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:18:12.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqMPQAltKxd3EiAEJuL8X6ExJTW8RjGCW7f3I/8JKW9vfCMQO90I9LXMkPrz8ChNlQMB9+d1tfuJt3t4+zO74y90uV0R7sPCRgE6an3jMX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_071826_207796_3C05E4FE 
X-CRM114-Status: GOOD (  11.80  )
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

Continuous reading mode is broken for some spi controllers. There are two
possible bug scenarios:

1) "continuous mode" flash and spi controller without dirmap support,
   but with restriction on transfer length in adjust_op_size()

2) "continuous mode" flash and spi controller with dirmap support for a
   single flash page

In the first case, any read that exceeds the limit specified in adjust_op_size()
will result in an EIO error. The limit may even be less than a size of a single
flash page. In this case, any read will result in an error.

In the second case, any read larger than flash page size will result in an EIO
error or spinand driver spoofing (because the spi controller driver returns
more bytes than were actually read).

This patch series tries to fix continuous reading (spinand driver side).
Unfortunately these fixes can't resolve "spinand driver spoofing" case.
Spi controller drivers might need fixes as well.

Changes v2:
 * added helper to create reading dirmap descriptor
 * fix spelling
 * error code is not used for regular reading fallback anymore
 * it's possible (but very unlucky) that someone will do raw reading
   of the flash in continuous mode (i.e. without OOB), so fix dirmap
   creation for that case as well.

Changes v3:
 * improve description
 * move airoha spi controller driver fix to a separate airoha spi fix series

Changes v4:
 * the period '.' at the end of the commit title was removed

Changes v5:
 * rename spinand_create_rdesc_helper() to spinand_create_rdesc()
 * get rid of controller_is_buggy boolean

Mikhail Kshevetskiy (3):
  mtd: spinand: fix direct mapping creation sizes
  mtd: spinand: try a regular dirmap if creating a dirmap for continuous
    reading fails
  mtd: spinand: repeat reading in regular mode if continuous reading
    fails

 drivers/mtd/nand/spi/core.c | 74 +++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
