Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD59C61DB9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+S/27THCZ0k6esLVoWomHulwlgYd+tBtqKV8sQj0A60=; b=oR+CUrLOB/Vf2v
	OVawLMeAfRIEQKc8TPzb5/Ym00Jzkna4iKwQAWCBVLtyftwVIOdKqsPXL4DPl2/DgcJUqbqldXoEz
	Z1h8pgeY1CDUMIvCms8tU70wYip76UQGrdqSYCoyEzn16QLFHvioLicyjaL/ETCYncRoXgy+bPndi
	qsv5TSaCIWwUZ/6/YrKxsyTCCSHmWzp6QL5xcwXL9y448ztUiAPdLvtMRGrrlmwpwTIlrT+lfniOi
	pmzrKXzyBa3Mog31f5EhnHfXSncSy/X35q/xfZIJK5Tabuf0TCkIuKLz7DBRpY8+0kf6kIeHKSe+z
	auViEDEDqba0wBxDG/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzgh-00000001cn8-2fuc;
	Tue, 25 Aug 2026 22:32:11 +0000
Received: from mail-westeuropeazon11011069.outbound.protection.outlook.com ([52.101.70.69] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzge-00000001cmS-0l11
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 22:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAvMnoqk/NE6/9FmMBrQi8eB7idFeNtXBUa/TP74J4Ctlce1BHlABFQ93gBlTobx0SsatYGICg/JlbJmeYCPhQXJyf4MIEarQtOZ2hDwAWAQF/11LJ0FEkNSImdSjPyo5136Jmx6nDFBy/svQRH7eGNUD65dFQpYxe5D3rq6oX8vtopViPxAkr9LL7MPsLwS4/x+st8VcPM+AsfOCzx1/8/LTCNiGQeRR0pCv7j4EOh29Ggs/ZjX66SaHH/mBjXD0/rAVpyfq/Tg8fyp1OnX2OCWfq2eVlk6U/Y+/cvy+Dqe9AL1rJ/cRa6L2xJW9xkgJiJcMJjo7dYiV4XQZmSoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aA68o/34toAyW4c8YW0BuWQ1XQkrDBExOZQ8wkljDZY=;
 b=WfqW5I5/Hm58YMKJvgWt5KPJg0ts1Z4HkmV2f5e98MicedPsctJp772jShHz+8cthPSrU3GjNbzcnJT2pMFAuMqlK9Y7eMxM5cGSuXPIfo8qgD4KSFzJZL23kMQ7zIwOYdzruo6pWIYHzd3r5qWEUsL7MwGUhN1XEvQZ050+WCNN6o9eJqMOpuwQ81eQd+3Qs1BG+BZ1tP5vfna+7PBtEn2Po+1xQCmBdbsQcurRdNyw+OyS/dvf0maWJ1GELEwhC6Kz8KLPggSBY7HETndfZ0AMV3gab+tFKuioX8Lq5tq2DN3IKpcCBAtGKnO0EUmDA2at862n7QNjmQajwR0s8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aA68o/34toAyW4c8YW0BuWQ1XQkrDBExOZQ8wkljDZY=;
 b=dwwwKiRgUwyRcZ6kXSXosyfu6vbq3Xj4v8Q/2phHUhI8ajUax5zVnmI74GPs1nu1d6wzfK0+pxy5j0XRAtXV6CoOFDkDJAZxHUTJSZtw9BtNRkwY5vkgl0V4GqmfwEIJ5rWBqRiM3JbbyAyyod2ZTZ01+c6kBSTYdrFX6NnUcRM1IC4K/7ZYtBOrZLMWE4TQfgkh09wRKXZRxFoteoglsmH+s0OUEsWQXrJEtF9u+asthtvyLHHSoCwWoyUh79vMc6iHpr4xu2YK9f/y1Vs5FuLS2huoDIw7TU76guybRy4RTYXuPjEfqbk2lhtsvw9u4qwpqjN0QIiSqP8YMOajrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9088.eurprd04.prod.outlook.com (2603:10a6:150:23::20)
 by DU4PR04MB10837.eurprd04.prod.outlook.com (2603:10a6:10:58f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 22:32:01 +0000
Received: from GV1PR04MB9088.eurprd04.prod.outlook.com
 ([fe80::c401:89ab:8905:1abc]) by GV1PR04MB9088.eurprd04.prod.outlook.com
 ([fe80::c401:89ab:8905:1abc%5]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 22:32:01 +0000
From: han.xu@oss.nxp.com
Date: Tue, 25 Aug 2026 17:30:48 -0500
Subject: [PATCH] mtd: spinand: add support for ISSI SPI NAND flash
Message-Id: <20260825-spinand_issi-v1-1-d81bdd7c212d@nxp.com>
X-B4-Tracking: v=1; b=H4sIAJcXjmoC/yXMTQ5AMBBA4avIrDWpit+riEi1g7Eo6SAScXfF8
 lu8dwGjJ2Soows8HsS0uIAkjsBM2o0oyAaDkiqXpcoEr+S0sx0xk7DVUFRoZWpQQkhWjwOd365
 pf/Pez2i29wH3/QBfyjcIcAAAAA==
X-Change-ID: 20260825-spinand_issi-d9f79ed03ce0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Bill Lee <blee@issi.com>, Jeff Kim <jekim@issi.com>, 
 Han Xu <han.xu@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787697116; l=13266;
 i=han.xu@nxp.com; s=20240131; h=from:subject:message-id;
 bh=xygnEoQSwhPYAJvpHmZOui/6hO/e3x9YSWbUovI7lY8=;
 b=YOor9NhCOI/v6EX7W0fFdMEiMCK+F4DbjYPH0PYy+nRA8mrqRSV72HNMAV3ff8tvxpCMELfzT
 3tDZ6Hnpb4mA6n0NAKiHNJKVEjwaAAult7x7x8REn62qGmA3bl/Ww4A
X-Developer-Key: i=han.xu@nxp.com; a=ed25519;
 pk=XSryOlQ4EKXqt7ZHz2D+BcDu1AWYF0m5bX48xQOVF5A=
X-ClientProxiedBy: SA9P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::19) To GV1PR04MB9088.eurprd04.prod.outlook.com
 (2603:10a6:150:23::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9088:EE_|DU4PR04MB10837:EE_
X-MS-Office365-Filtering-Correlation-Id: f124bbc3-70a2-4a41-4a25-08df02f8ae5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: ShPa7rWwql+uwpfdtUUnKtzaRTPlYr3Fboit5IElesUQlsgsEa2FxCs7lW7kXpah8U+0laI3wUJyJXbQm/lk9i80uF7ajlZDq8MRQq3S6rmg4rFuPvAGub3dmcscit0XbG8mc1tNOSgDW78Jxx9iubtQ1Sxjg8TE/DFJG+/lNxgI0iwI8f60bRSHH/vjisMd5RUBupImIUHYrA7WOK3uS1g/jTOglcpCdvhII9cLjkneQqAiIhXFPgiHngodM2QBb+LbaJzg4W8imsaPerV9Ss1vgxLZ7k7qSSp+IIMzJE14YXL0ge9r6Ec6KsDeqY5yFxIvktiXFaBVwiFvLrD9Kwtwh6MZ4QcO70OLLD0U8erxU4GnKj1REILdsNDZwPE+HAWymzQX1I59gd+CDjQSW2bM7P/t22wIqOIff7zIPVyPKu7OIFpL999hSWxg3XMjbGIcNqyJ4C4MsWu3LZXunrT4meH7m3U4dGdLXEkrv9Rlq1HjLdgI4QmGN+ZGso9leUBrTRpunsAzQagGyxT2dDdeg1AI7s1Cuq1VPM3peuGi+EerBjHkTrYf6HniEC0DO0UHNiYZKfmoTnS3vc/fKJonqjgmzJ0Gf33Qc7lATFQtE8op0OPo5F+qbP0x5kx4PEv8kw++kRsm64ICPAvx4HGkDt4CFnKiashLHsBWR6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9088.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFduSUU1Zk5uc1Bqd2orZWxuUC9iOWJ4ZWRtOXI5NDF0aDl4eFJGL0tYclVM?=
 =?utf-8?B?TDlNY3dlbmFnYXdyKzlVdU1NbDVRd1RRKzBxNWU2aHNhVzhyUHhrUGU3QUdr?=
 =?utf-8?B?RFQ2QWxPMVVLejd1dWU1QmNtZDZyaEx4UGlFMUJyTW9uaUN3TVh5OWtoOS84?=
 =?utf-8?B?MmJTa2NXTS9iaDV2VHFkQnlUV3NMcGNWYWFaYmRFd3dSY2JCY3VpWHpjZGJv?=
 =?utf-8?B?Y1BqczNXY2tERXFSRUppZU5WWGRSSkNlUzc2Zjh4T2ozdndWR25STTNhay9U?=
 =?utf-8?B?ODFNcHVtZmlGVlRYdzdLbkE1bUZtaHJRdUwyb1k4N1dOQVNaV3I2VkZNTzZa?=
 =?utf-8?B?dk5ENksrKzFLR1NndXMxTk5VN0VNc0w1ZFkyTndwY3FuZE0xQmIya3NTUmxV?=
 =?utf-8?B?ZUkybC9jMVcvNkE1T1NiUnF4QnZRd2NFelZWWmVvYkNtdjRYcVZmcjlVb1RB?=
 =?utf-8?B?SjFuVDBEejk4S3BYdUJ1LzAxQ3c3aTUyeCtVQ3NFU0JySXRhQkpPOGhvWTJH?=
 =?utf-8?B?ZXhrWXNpaTQ3cnREVUt4TzVCQWJKZWtRMlRuQzUvSktJaU9tRFVLTVAzdjRu?=
 =?utf-8?B?TWt3V0FWbVJ4MGM1dHcxTThldWVFUXNzWENOZ05HbVJaY3pEd09aSkRVMTFY?=
 =?utf-8?B?emVNeStSYTFnUEJURXBiQ3pyK2YwZUE2VzNrdVgzQVJpTDhhMTJjQllsZFdh?=
 =?utf-8?B?YnVnRTh2NitZQnZ6d0RNTWdRTENQeFE5WVZEL1dMZXN6MXpsbUtTMlUzU1ZB?=
 =?utf-8?B?Z0trRHBYVjNIbXhCV0QxcW9YYjVKOCtBSWtWUWljZy9XQkdNaWd1eHgyYnJD?=
 =?utf-8?B?WjlOWVA4MG9xWElFa3hUYldEcG5vQjlsdkFXcUMrdkdudC9TQTIxSmNUeS9u?=
 =?utf-8?B?QkVoZnErMThCaWNncDJobTB2clZrVFNVL0dKN3lyQlNSSS8zMUdWVjA3YW4w?=
 =?utf-8?B?SVhINkdSb3lsYmhiR1I3Y2ZvMjJQSlM0TG1WTXh5V0F0Mnl2UjRNMFZTKy93?=
 =?utf-8?B?WEVUT0Q1NXdEdUNKd0hyM3B4MGt0cEt6eFhyK0VLd3E5Ly9qVG1QYmVzSnVl?=
 =?utf-8?B?cmsrRTdKa1JWWlFpRFovSmxuMEU5MTliMy9ybFJqWjlmc1V2VmpHQklmK2Z2?=
 =?utf-8?B?VytCZ0FaR0hPR1czdXpFSWdibGJzS1RXQ3NaNGVaY3paeHVTbWNHaVRvMDBM?=
 =?utf-8?B?VWdadzZqb0Q5Zm0vcFVRZWtobnMrTEo5QkR5aTh4ZGVoRlNibEJDbStneHJI?=
 =?utf-8?B?dGUzei9oV2ZQbzZvVlVqbG85UEhHaFJFMFV1UHRoa08vNWlHT3BBMUozc0RG?=
 =?utf-8?B?UG96eEo2UG5NdzlrMVJPdllZdDE2V0lpSnNsMDR2SEZGYmJtNXlid2VSWG8z?=
 =?utf-8?B?dTNHRUFmUE1PeU50U0RFZitDdW9kc0hKWVp1QzBydklqTUVsTnBPTmlBZlhO?=
 =?utf-8?B?UkhtemFqblhJTlFOeWNIQy9QRklkUkM0a2JCaXpVVTNtT3FwU0lrTTJ6c25R?=
 =?utf-8?B?TlhVaEFjVzBqWStqMFdlQTlUSjFnTDdxQm00R2tJMUtYL0dCWWNHUUY1S3Iy?=
 =?utf-8?B?dkg0ZlZGb0dqNWc1M2J2TzRreHhwOW1SNmZSKzY3SHgyQUJtZFUxLzBSSTJL?=
 =?utf-8?B?a3VINlBmZ2ZOMW9GWXlObjUrL3ZoTGhnbEpuaDNKZzh1R2NaRFp0emFZMGNW?=
 =?utf-8?B?Zk1sdUZIc3pKK3NYUFgwSWd2UWRCSjEwcDZnRytlRXpSWkxhUS9qQlR6Y2w4?=
 =?utf-8?B?bTR4dVR5alVhOVg0NVR0clNabWlFNkc1MDNEbGxUUzFRbFlYR00xaVRZUWI3?=
 =?utf-8?B?bUhWVzZTeVZncjJ6M0dhc3dESXpWZGJZTmxUd0VMcnUxd3d1WUU3WFI0UEZ0?=
 =?utf-8?B?TjlvRGpTa0R5eFJlQTRmU3VqWHAyVjlCQUtsajhJSW5zYkVxYWxERG9uL1lp?=
 =?utf-8?B?SDhVTWMxTXpHMmFSZ3V5V3ZvTnFpQmZ6U2U4SmQydmRFREpuZlk3NjlEM1Jn?=
 =?utf-8?B?SkpmYkZaek1wbUtjNTZJM2lncEdNQVV0M0syYmpzZnphMk9GUE0rQjFNR2xY?=
 =?utf-8?B?QTBNTGYybHNteENNUnd6QmVjV3JHNGhpZnZrS0hMZUZ6cXVxVDZ6Z0R0SzQ5?=
 =?utf-8?B?ZTNhTWt0bm1ZQmhwM1V2dWJEK2F6MjFEcHZ2TjFoUWhkYm1xRkxjSEFqV0J6?=
 =?utf-8?B?U0loVnZQMHd5SDNsNW5YQzFMNmx3ZGRhNW4zd3Bxb0lEY3NEcVBod2lWRVl3?=
 =?utf-8?B?L3VzQVNTc1M5Y2MvTU1OMUQ1K2R2K3ZnR1dIdS9kcEM3ZEZMVXE1RUo5cnBm?=
 =?utf-8?B?c1kwNEQ0dTRReFZHZU53cDBSRFFKY0lrM0cwc2JOaGVFVkhQWDlVWGtzZGh5?=
 =?utf-8?Q?5x49ZnSMSqFTYZTo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f124bbc3-70a2-4a41-4a25-08df02f8ae5e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9088.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 22:32:01.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8i6HnL1MQSmH6m7Ls0zAlgYKbDmtuQq0mex3xSv4q7ZlrE4qYAD2zJZv1wXxhx3UiQX/t1GCAQQxj+wliG4Vy723rJ3z7L73OPv7Pk5EGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_153208_380931_D5C52550 
X-CRM114-Status: GOOD (  19.31  )
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

From: Bill Lee <blee@issi.com>

Add a new manufacturer driver for ISSI SPI NAND devices (manufacturer
ID 0x9d). The driver supports the IS37/IS38SMW01/02G8B family (1Gb and
2Gb, 1.8V) including the 4Gb 2-die stacked variants.

Register the new driver by adding issi.o to the spinand Makefile,
declaring issi_spinand_manufacturer in spinand.h, and adding it to the
spinand_manufacturers[] table in core.c.

Signed-off-by: Bill Lee <blee@issi.com>
Signed-off-by: Jeff Kim <jekim@issi.com>
Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/spi/Makefile |   2 +-
 drivers/mtd/nand/spi/core.c   |   1 +
 drivers/mtd/nand/spi/issi.c   | 272 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   1 +
 4 files changed, 275 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index b5ccb44860df..f6b2a094fafc 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o otp.o
 spinand-objs += alliancememory.o ato.o dosilicon.o esmt.o fmsh.o foresee.o gigadevice.o heyangtek.o
-spinand-objs += macronix.o micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
+spinand-objs += issi.o macronix.o micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 35365b67dd8e..c11d74450257 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1360,6 +1360,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&foresee_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&heyangtek_spinand_manufacturer,
+	&issi_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/issi.c b/drivers/mtd/nand/spi/issi.c
new file mode 100644
index 000000000000..ddcbb6aae72e
--- /dev/null
+++ b/drivers/mtd/nand/spi/issi.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 ISSI
+ *
+ * Authors:
+ *	Bill Lee <blee@issi.com>
+ *	Jeff Kim <jekim@issi.com>
+ * Co-Author:
+ *	Han Xu <han.xu@nxp.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_ISSI 0x9d
+
+/*
+ * ___________________________________________________________________________________________
+ * |       ISSI SPI NAND Flash ECC Status Register Bit Descriptions(Refer status register)     |
+ * |------|------|------|----------------------------------------------------------------------|
+ * | Bit6 | Bit5 | Bit4 | ECC Status                                                           |
+ * |------|------|------|----------------------------------------------------------------------|
+ * | 0    | 0    | 0    | No bit error detected during the previous read algorithm.            |
+ * | 0    | 0    | 1    | 1-3 bit errors detected and corrected; no data refreshment required. |
+ * | 0    | 1    | 0    | >8 bit errors detected and NOT corrected.                            |
+ * | 0    | 1    | 1    | 4-6 bit errors detected and corrected; refresh recommended.          |
+ * | 1    | 0    | 0    | Reserved                                                             |
+ * | 1    | 0    | 1    | 7-8 bit errors detected and corrected; refresh must be done.         |
+ * | 1    | 1    | 0    | Reserved                                                             |
+ * | 1    | 1    | 1    | Invalid state                                                        |
+ * |------|------|------|----------------------------------------------------------------------|
+ */
+#define ISSI_STATUS_ECC_MASK GENMASK(6, 4)
+#define ISSI_STATUS_ECC_NO_BITFLIPS (0 << 4)
+#define ISSI_STATUS_ECC_1TO3_BITFLIPS (1 << 4)
+#define ISSI_STATUS_ECC_UNCOR_ERROR (2 << 4)
+#define ISSI_STATUS_ECC_4TO6_BITFLIPS (3 << 4)
+#define ISSI_STATUS_ECC_7TO8_BITFLIPS (5 << 4)
+
+/*
+ * As per datasheet, die selection is done by the 7th bit of Drive
+ * Strength Register (Address 0xD0).
+ */
+#define ISSI_DIE_SELECT_REG 0xD0
+#define ISSI_SELECT_DIE_MASK BIT(7)
+#define ISSI_SELECT_DIE(x) ((x) << 7)
+
+static SPINAND_OP_VARIANTS(
+	quadio_read_cache_variants,
+	SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+	SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+	SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+	SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
+static SPINAND_OP_VARIANTS(x4_write_cache_variants,
+			   SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL,
+							 0), // 0x32 quad io
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL,
+							 0)); // 0x02 single io
+
+static SPINAND_OP_VARIANTS(
+	x4_update_cache_variants,
+	SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0), // 0x34 random quad io
+	SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL,
+				      0)); // 0x84 random single io
+
+/*
+ * ISSI - 8 bit ECC per 544 - bytes Spare Area Mapping
+ *  ________________________________________________________________________
+ * |________________________________________________________________________|
+ * | Max Addr | Min Addr | ECC Prot | Area     | Description                |
+ * |----------|----------|----------|----------|----------------------------|
+ * | 0x01FF   | 0x0000   | Yes      | Main 0   | User data 0                |
+ * | 0x03FF   | 0x0200   | Yes      | Main 1   | User data 1                |
+ * | 0x05FF   | 0x0400   | Yes      | Main 2   | User data 2                |
+ * | 0x07FF   | 0x0600   | Yes      | Main 3   | User data 3                |
+ * -------------------------------------------------------------------------|
+ * | 0x080F   | 0x0800   | Yes      | Spare 0  | Spare 0                    |
+ * | 0x081F   | 0x0810   | Yes      | Spare 1  | Spare 1                    |
+ * | 0x082F   | 0x0820   | Yes      | Spare 2  | Spare 2                    |
+ * | 0x083F   | 0x0830   | Yes      | Spare 3  | Spare 3                    |
+ * -------------------------------------------------------------------------|
+ * | 0x084F   | 0x0840   | Yes      | Parity 0 | ECC for main/spare 0       |
+ * | 0x085F   | 0x0850   | Yes      | Parity 1 | ECC for main/spare 1       |
+ * | 0x086F   | 0x0860   | Yes      | Parity 2 | ECC for main/spare 2       |
+ * | 0x087F   | 0x0870   | Yes      | Parity 3 | ECC for main/spare 3       |
+ * |________________________________________________________________________|
+ */
+static int issi_8_ooblayout_ecc(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
+
+	return 0;
+}
+
+static int issi_8_ooblayout_free(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = (mtd->oobsize / 2) - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops issi_8_ooblayout = {
+	.ecc = issi_8_ooblayout_ecc,
+	.free = issi_8_ooblayout_free,
+};
+
+static int issi_select_target(struct spinand_device *spinand,
+			      unsigned int target)
+{
+	int ret;
+	u8 regval;
+
+	if (target > 1)
+		return -EINVAL;
+
+	/* Read the current value of the register */
+	ret = spinand_read_reg_op(spinand, ISSI_DIE_SELECT_REG, &regval);
+	if (ret)
+		return ret;
+
+	/* Update only the die select bit (bit 7) */
+	regval &= ~ISSI_SELECT_DIE_MASK;
+	regval |= ISSI_SELECT_DIE(target);
+
+	/* Write back the updated value */
+	return spinand_write_reg_op(spinand, ISSI_DIE_SELECT_REG, regval);
+}
+
+static int issi_8_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (status & ISSI_STATUS_ECC_MASK) {
+	case ISSI_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case ISSI_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case ISSI_STATUS_ECC_1TO3_BITFLIPS:
+		return 3;
+
+	case ISSI_STATUS_ECC_4TO6_BITFLIPS:
+		return 6;
+
+	case ISSI_STATUS_ECC_7TO8_BITFLIPS:
+		return 8;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info issi_spinand_table[] = {
+	/* IS37/38SMW01G8B 1Gb 1.8V */
+	SPINAND_INFO("IS37/38SMW01G8B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x15),
+		     /*
+		      * - Memory Cell: 1bit/Memory Cell
+		      * - Page Size: 2176 bytes (2048 + 128) bytes
+		      * - Block Size: 64 pages (128K + 8K) bytes
+		      * - Plane Size:
+		      *   1Gb: 1024 blocks per plane
+		      * - Device Size:
+		      *   1Gb: 1 plane = 1024 blocks
+		      */
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+
+	/* IS37/38SMW02G8B 2Gb 1.8V */
+	SPINAND_INFO("IS37/38SMW02G8B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
+		     /*
+		      * - Memory Cell: 1bit/Memory Cell
+		      * - Page Size: 2176 bytes (2048 + 128) bytes
+		      * - Block Size: 64 pages (128K + 8K) bytes
+		      * - Plane Size:
+		      *   2Gb: 2048 blocks per plane
+		      * - Device Size:
+		      *   2Gb: 1 plane = 2048 blocks
+		      */
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+
+	/* IS37/38SML04G8 4Gb 3.3V */
+	SPINAND_INFO("IS37/38SML04G8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x34),
+		     /*
+		      * Architecture
+		      * - Memory Cell: 1bit/Memory Cell
+		      * - Page Size: 2176 bytes (2048 + 128) bytes
+		      * - Block Size: 64 pages (128K + 8K) bytes
+		      * - Plane Size: 2048 blocks per plane
+		      * - Die Size: 2Gb with 2048 blocks
+		      * - Device Size: 4Gb with 2-die stacks
+		      */
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+
+	/* IS37/38SMW04G8B 4Gb 1.8V */
+	SPINAND_INFO("IS37/38SMW04G8B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
+		     /*
+		      * Architecture
+		      * - Memory Cell: 1bit/Memory Cell
+		      * - Page Size: 2176 bytes (2048 + 128) bytes
+		      * - Block Size: 64 pages (128K + 8K) bytes
+		      * - Plane Size: 2048 blocks per plane
+		      * - Die Size: 2Gb with 2048 blocks
+		      * - Device Size: 4Gb with 2-die stacks
+		      */
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+};
+
+static int issi_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * manufacturer specific initialization can be done here
+	 */
+
+	return 0;
+}
+
+static const struct spinand_manufacturer_ops issi_spinand_manuf_ops = {
+	.init = issi_spinand_init,
+};
+
+const struct spinand_manufacturer issi_spinand_manufacturer = {
+	.id = SPINAND_MFR_ISSI,
+	.name = "ISSI",
+	.chips = issi_spinand_table,
+	.nchips = ARRAY_SIZE(issi_spinand_table),
+	.ops = &issi_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..b42407b69db3 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -438,6 +438,7 @@ extern const struct spinand_manufacturer fmsh_spinand_manufacturer;
 extern const struct spinand_manufacturer foresee_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer heyangtek_spinand_manufacturer;
+extern const struct spinand_manufacturer issi_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;

---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260825-spinand_issi-d9f79ed03ce0

Best regards,
--  
Han Xu <han.xu@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
