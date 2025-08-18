Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45859CA0EE4
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3NejjmcEu8tQlEmDwskiaYieGJ6Xc9suJx1rY0tmAQ=; b=DZ3mQq/r187Ddc
	z+zC9s2Aoa+M+HkQVt/V6u19ei4KdFEJZ4FAPzQWYcfhcJ5CtLQ/4fmHNXFsO4PGS1CSdBTLIoNKY
	D/GXwOrPjArCA2qhcWPvdqS9rOva7vlLKEBy7/xQFHUsmFsrXzlNjS6hC1nHv1JjhoKR8s7pZiOgy
	qdIAsjpBcq3F5KfgO6Jqk/W+FM6KpMFC41639vpy7dEnMlybhJ66Td3909afn++FYDZhaXWuBC1Us
	FHe7vDfEpxCVOy+lfWQ31kjzwnv7MlzfTM4WnCyAnciHDkjFlSBaHf7777W8YVuPTmUMSYr6LwwLZ
	6/VOuhZBRwNoFj8erwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4uU-00000008P18-1Eyc;
	Mon, 18 Aug 2025 18:48:46 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3GK-000000085El-2ZmY
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 17:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiZIV3KxhTxv7U8ke05tm9yvrbyxXfgxpMKSMBntorxnmPItp7kp3aYdro8nJj0G3CEXtUPNgs0hJQ1mpfviVv4HiEaOLxXjWXmFDOvLUWrQU0kl6521j1fr0sCmMyzjvr2aavDLEpIIMqS01Lwz+qIWRMYqa94x3GrqIl2/fPdEm2JpgnaALX+xDf6fabasulQYyl2VJyzFRVsAMRXx/VswKGCYLYr0Zg9szfaSn6vlTKqBk3jyxyoWbkzDW5uH4GtukRJgnHXpCAtckZwAvkVWVveNA5tlGMvHImU+GrCrqTqJqfZ09WvrTdHfAB8GcdmHZV12QS12cAA3rMWyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuDGAB0nBFDVJioAbQaWAxY+e6GB9sqVKxaw8Ak9yqc=;
 b=Utg6iF+imernUTnsQzUppMVUjbYlkHM4S1D94A/Zb3CB2+AXVKT1NiF2J8CHXNEejoMbdtLQY1149ti6zJEgR9WqsYb5oavlxgzNQ4IYmOClMOuHLrfP4gc/g4ArhTaRjZT3TgAJsTxfyxXASRGXRhiTxTpIjeA3VRPgb5Gdr2XJImQS+RgLurrwqwl7HW7pGSPV9ZZLeunUhjnptiXTfhR71iE3z3mPUv8bnb5xaglftYByzP41pp3hQy+uM2cQiwLzLeGXIQNWHIXXZwanS9T7x9Jj+WkOLp8IPp0r3kN1ODcTgRd5RdARb/DcgcoKMWgbkv87cqqrP7yAbUaEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuDGAB0nBFDVJioAbQaWAxY+e6GB9sqVKxaw8Ak9yqc=;
 b=qLr+pNy6RaJJ7rNX5SuVGLpacezmUdanNQ8RI2wCrcSBb9dqsDJMhNktxzGhJ9AII50iNI5iTsU53mlACzr5O43eu20g7cItRhEjCWPNj1rBNjd4PjUxY+8X8NSd4JPKELGMAviNbrAixxcbXdo8vuMul1CQM/RDmZ3VhonrWds=
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by AM9PR03MB7932.eurprd03.prod.outlook.com (2603:10a6:20b:43b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 17:02:50 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::a1) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Mon,
 18 Aug 2025 17:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 17:02:50 +0000
Received: from n9w6sw14.localnet (192.168.54.13) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 18 Aug
 2025 19:02:49 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: mtd: rawnand: Inconsistent parameter page on Foresee FSNS8A002G ?
Date: Mon, 18 Aug 2025 19:02:49 +0200
Message-ID: <3542795.LZWGnKmheA@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.13]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|AM9PR03MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a372c2-295a-4585-4d01-08ddde79104f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qSRjZQxVMn7p1pQBgRBJgpTJbJunbdQv0BHImhx1jk+vKQ8TspdtxiKAcbKd?=
 =?us-ascii?Q?20Ng6ddGe86DA7uN+8ZZ80M3NNMqNyEXGmH/ZLyJtK0+t+nfFvZnzsYZ6V9X?=
 =?us-ascii?Q?hRqajF7xcGQhic2NfCzIwae/FWMFFSRHpH7Gp6BV6okAL/rK7KzJSsX/afYr?=
 =?us-ascii?Q?m1eqW2uzQevsEu8fZjH22tM67JQaQ5fa3lX/9f1AjCetLTzcd/C5tTwyh4Kp?=
 =?us-ascii?Q?GexFc68GaPkSWj1ocB/YvdB7HNerutFaf0e01dqTwqOvjpW5Qtnfylb7wJ5b?=
 =?us-ascii?Q?X+SAUWL3pcW3jf1SdMThE0QbHfpW5Nchp4hSGdBFU8GGK02XxQw6CzdI9ItT?=
 =?us-ascii?Q?lEnQjGS+Mq855xoiDCgtMX/P3apYCx7wc4Gof1pqJDmeLCnj4nhmIyxtfIF+?=
 =?us-ascii?Q?RSKYPGp72fF+vhxjjfMzHef/1Tos1KjBT48S+3z0sa9fxU6u2YKZ6y/4JNB7?=
 =?us-ascii?Q?u5QrYU/lbbmb601WEo/Qb/Q9qO2blXHEePzbNSi7dHv8b9pPkJWJy27/1qDX?=
 =?us-ascii?Q?t8HtTdzTXxC3WEH8ZkHLNlaYHsb9fGZMfZSpk6+uSPVNH5Lj2d9P6H48MYrX?=
 =?us-ascii?Q?AE0gcQYLh+jLAhyNnOURn4mQcLyn0zz6FLUnIikGJHEslVomY64WWww7+89B?=
 =?us-ascii?Q?eCSF8l920lhrIUgoGWN/mMIs6Mc6t9jUQgOaZxQWRArCfRX4S20lPEGp0prw?=
 =?us-ascii?Q?WujJgjMnslXfdS4ORKkMYqm8g8KmYEKmGmSCHwAvcQha6Q7ny9m/sCMSHsBM?=
 =?us-ascii?Q?mTCWYQXV8rJ0l1FUSsW6kmeWCPlBE68w31P2q4OYAQj8qeovToufqb8Iq83W?=
 =?us-ascii?Q?vZZwUbPx+aV4bcWb/ovGysFxvE6IsCFD+q/yLbFigOBGdRwk2hmdzQm9W20i?=
 =?us-ascii?Q?lTXkQYd6agVutINueJG+yuS4s/7K24W0j/IGC+NhAxG040EdP73rOrazxdew?=
 =?us-ascii?Q?tKH2l2mg5MNkv+Mw7Kbnmj66ubOnVhLHZHuWdv4wM7YlrPpoJ/Ed/R1xb40/?=
 =?us-ascii?Q?nJo1D57DzVHd+eyO3GQxV44I5ySJOQG2MJEGnbw3wyoNvR8wuFih9Axt/u15?=
 =?us-ascii?Q?FfDSWhhRgL7CgG8lSuktBSQob1cYyrrIe0L9aoiOsroGB9JlaaWoXkyhsNUp?=
 =?us-ascii?Q?kW+/d5NMduSOGc7QicOboMpNLfVUGIcax85DPTjeYr/8pmRtSNfP3uKis2t9?=
 =?us-ascii?Q?biAuye9HAkohRLNlFXTCUNFDSx347qWHb5nPL4WIQV9IaZmrp8ycg5CONQpu?=
 =?us-ascii?Q?bDEZ0a8C5D87VUWfJfInBVwYE1o70Q0Y5OQxeXLVquabS0OXpc/Vcvuoj34v?=
 =?us-ascii?Q?CO+i82XJsSkzPZZKC8DFe67sX5QAhz/qekSwLA71RMumoYEKceMqi3y59Yq3?=
 =?us-ascii?Q?Q37/gDYrSYzDRGFm063R/R1Pa/AuI2P1d5GmQJK8YAbUQIWmkYuOm3e8v6/x?=
 =?us-ascii?Q?n1ddEoprrIS0DesA+3zmCtQC1Z6NKE5pu7Zu09mci9vSvwlRvF6CvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 17:02:50.2076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a372c2-295a-4585-4d01-08ddde79104f
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7932
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_100312_980772_8F82FB55 
X-CRM114-Status: UNSURE (   8.26  )
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

I try to use a Foresee FSNS8A002G SLC flash chip on an i.MX6 GPMI controller:

https://www.lcsc.com/datasheet/C5126835.pdf

The kernel output looks promising, but one line looks suspicious:

...
nand: device found, Manufacturer ID: 0xcd, Chip ID: 0xda
nand: Foresee FSNS8A002G
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
nand: SDR timing mode 4 not acknowledged by the NAND chip
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
3 fixed-partitions partitions found on MTD device gpmi-nand
...

According to the documentation of "Read Parameter Page", byte 129-130, 
SDR modes 0 to 5 should be supported (page 19 on the data sheet).
But the documentation of the GET_FEATURE/SET_FEATURE operation misses
the "Timing mode" register (data sheet, page 24).

I saw that there is a quirk for some Macronix chips which also seem
not to support getting/setting the timing mode (but declaring them
in the parameter page).

My main question is whether this is "normal variation within the flash
market" or a serious issue. In contrast to another device I currently
use, the Foresee chip also doesn't support "cached" operations. Is there
much value writing a fix for Timing Mode issue, or should I better
use another flash device?

regards,
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
