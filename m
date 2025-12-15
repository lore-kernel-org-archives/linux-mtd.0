Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1FAD59D99
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Dec 2025 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z9wdiDSb9qk/zuGQTPpNMQXRc/lDY/UY29MoYGEF8X8=; b=BFIpS1lIM2qw32
	fjyRxhAZf5kpofqlHI/SGuBeeokWlfkeqs8BU+i6oTl463ym/9VnAq53xQ2kK8iLWzsOYRNs7Amb8
	8DM/Kqfgo4DWFQIkhPPqaIbggNTo/WEQwn2e/2kt4262O56/DwMxx13QaQ3Pp8YwqK7Al0HqW+Ze2
	vnJzeXd31QWLzJgZVBZkFMpz/EAx0ZtG9Dw6BD6y1bt/8db3MRLDP76ue2lxwxNMs+TuUD+aJKhaQ
	Stm8aCgXqK2eCWxDHvqQyX4aiaFL4+4JjmYkxKY8Ju1oQW4GEParve7uVfSVJrE011RnnHCIqObgO
	PCHbYFUeXBThnqWnwv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5Qm-00000003Pww-27fm;
	Mon, 15 Dec 2025 10:03:52 +0000
Received: from mail-swedencentralazon11013034.outbound.protection.outlook.com ([52.101.83.34] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5Qi-00000003PwN-3fOE
	for linux-mtd@lists.infradead.org;
	Mon, 15 Dec 2025 10:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itxf4ggEBpnysCzBaHM80wu2uGl7lV5+IEVDbHgb2+kzcnZwbXSieLswM8ZaRyA//E+poz9QC2SQyD56esq1DoCr8KgZyL9sKKOLGwMfqNeNUqqy6HRpO9IBs5DOF9Hjmtb657ZVauBkTqb0f4y98lCZw0Xpbqe4UkxQcpM6dFiNayw6n3y30mtrgX6XN/KJgtdlP7ZVDzHStpCIB6D0am0j8PaNUe/rfCpiHQYR5KT7xtNuaCaTIGqT1dwQwVm8PdnayToj8IcNqWHEY8KofbxD/fzj784IOCDc7hhEgD2Cnf+vUvY1RkH+7e2kdGh6fXO4J9wFWTlnz8FV1NtP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tkok7/ELmYxZExaBtfTGDPz7QZkH8jW9tADWgpbMdY4=;
 b=Zf3OMwW5PUEMBgMLAAu8nWb8R1khi/Uoikcsp2hMUrBpfGBhzxnW2hYKwdubZBlNTZdmwb7sDz9CTJ1UaS0tmth2D4C0zyi1HUAJSbVpeIcFka+Tw9vRexA/7soN6M8tClCf9jVfpqpCZXEm6JXge8Fk2AXZz/+RD6n8UOG8mUBhJ9gRGdoXYcwTEX3fPJrI4z4dqGyGHkyXhGfE0gIxN94zEpdvSPVyeeQ9OeWD6jpAfafMMvx9s4eS8Gk4FGKlO+ZFhbWJWO4NLeWxpAfKrEGW8BMOFoHCLs8zmjtVSS8evEeIYQmcBzupf2iJJsL7mSG6sLsTj/FtCGYkq8J09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tkok7/ELmYxZExaBtfTGDPz7QZkH8jW9tADWgpbMdY4=;
 b=DWFYV0JPQA4l4ZuFF6CW5Z0Iy/mls/itNIwJ4ZdkPY50NwXq1eymiToLcVCyALe7XdukR+TjC4JQGT7vkXH3oNgllqTr4xfzb1F5WGUp1HUqzAZUmhBZ21cj0vLbIaFjqtsQGk0sE7DAcl/2pOBtbnfvNU5cxHUKRKthZs6vyOb56sTZQyN7QcY/SHwLQMtThJq2LdP3PcxbDA5bDixlcEDG7+5EC9P0F50vXixMN527k2dHi+qRNNNoapUEUHx1Vn00uPABWKMVW2hqvlFzZ4pUH9FsIYV8a9rQalU/kMfqdFFERUZDgFIoS2QlTPyoLt/jH4l/UXEeDmDNLJsePg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DB8PR04MB6891.eurprd04.prod.outlook.com (2603:10a6:10:112::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:03:42 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:03:42 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Mon, 15 Dec 2025 18:04:36 +0800
Subject: [PATCH v2] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR sfdp
 fixup for mt35xu512aba
Message-Id: <20251215-nor-v2-1-e75c0451e597@nxp.com>
X-B4-Tracking: v=1; b=H4sIADPdP2kC/1WMMQ6DMAxFr4I8NxU2QpROvUfFEAWneGiCnCqiQ
 rl7UzbG9/Xf2yGxCie4NzsoZ0kSQwW6NOAWG15sZK4M1FKPhGRCVEO+G5xHYnYW6nNV9rIdled
 UeZH0ifo9ohn/69nPaNBQa3vb3XAcRvcI23p18Q1TKeUHZsT3q5QAAAA=
X-Change-ID: 20251212-nor-2f37cf12eeca
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 han.xu@nxp.com, imx@lists.linux.dev, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765793099; l=12935;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=J+4OOrtj/eBLnnoPEM0ur3MxYZVMMwFm1ajVC3kZgMs=;
 b=3zDkFTmN2KYV0h5ba4S3PHaDU9SeyyBQDemfBZZtAsc1N/azS1eDedRof//0ucm5zhK5Nucbe
 4ZIYRMqJsxsAZ3TSjnPgeTBYQ3ZXBrtFJzS1PQR+H/ekP2dx25aaaTu
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DB8PR04MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 90113a59-236c-4caf-f3b5-08de3bc13909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJUNGFqeGdhTFRERk5CandKY0FuVlJnbTV3MTlQQnBmUFlwbFE3TWVxc0hQ?=
 =?utf-8?B?VVRSZU5IeDJib2k1N3M2V3NVTTRxVElrMk9HQ2dhNlVSa2EyREMzWkY2Q1ph?=
 =?utf-8?B?V3hLbmthaGVicEppM3lFY2VJUE4wSUlNVGtGNHBkcUZrckVGUExxbEJIOWFj?=
 =?utf-8?B?QzlJRE9mTUR5VHV0NkllWXVoTTBnMWIrOEhZcnFrQXhRLzJuQkVoSVFacHRq?=
 =?utf-8?B?NVNmT2hqNnZmVVFhb1FUVnNwOWFZZGI3VW5sZE5laXZJaDdFN3hUOUVYMmVE?=
 =?utf-8?B?UnJML2tzQlEvemRqbnQwVFhOMWZUV29KMmNuTE83aGJNMkVuUTkrYlBqeXVL?=
 =?utf-8?B?M2ZoRldmS09mOTZLcnZ5RDJwYnVIZGtQY0hFVUtVdWFsdm13MlhNSXFDMHhj?=
 =?utf-8?B?NEcvelVKZ2JkaVdQcFg4Rnp1MXphb285UU44eUxSSTJXMGswUlgySW9nODA1?=
 =?utf-8?B?T0Q1aUw5eVVDYkd6KzVSQXJPVnJnL1FUYUJ0aDVJRzBGcFV1K0VWcTJ0WkJI?=
 =?utf-8?B?RHgyeUg1emNRcUxUN0I4MlFYcDNFa1VwTFFjUitQSXB0SzYxUWt6TENLbFJ6?=
 =?utf-8?B?RE5jNldTMWUzRFZMMTg0ZWJFb2JqZmhyZ0dHVXFKSkRPVUVHMWhCMVVENzNE?=
 =?utf-8?B?b3FxZ1BtQzVjSXVSZEhsVTBsQW5YcDF3T0M1U2pZWjdqeG9zcm4rU0FpSzB0?=
 =?utf-8?B?aGwvbzhFZGVDeC96aGgwR3RrZFZKUk1sNTlHRUs3V0xTMzdvclNuemZ5ZUdy?=
 =?utf-8?B?ei8raEJIZGFzekMvRktaMEdjTkNUZVhqRURkNC9JMWtwU1ZJcE8yRzVlYk9O?=
 =?utf-8?B?ejJudDBlQUZaQTRaM0hOR3JhdmcvdUduTVJyTGdRazlScTBtUS9lOEJJa25J?=
 =?utf-8?B?N040SHhTajlKYk5Rd1RzaWtZOG5EK25QVzdFN1Z6U2tqWlQ5Wnk4bVN3L21O?=
 =?utf-8?B?MmFUT1BTbUV6S3JlclQ5RERYc1JOWkZMRGlTMExYMHVJM2doNHEwdThGYzA3?=
 =?utf-8?B?VHVTdmtLSWZsZnl3OTBySHFiTlhrWGNLcVkwYkVpeXFpc3BYM0FNM0JsUUJY?=
 =?utf-8?B?Y0dneUt4bFU1aGJVTjlIMndUOWExdjhwYTdocTZzNHJib29yWUpUVUFjUGZX?=
 =?utf-8?B?TmdkdUc3TC9iRUdydm9VWDhmdTJUN2FBQzlHeTQ1YTFQS3p2N1lhSVlKVnRn?=
 =?utf-8?B?VmxSRGVHMktkUkNobU93T0NoYUdYd3JUNklYemZieDF2ZFdMZEtnNnp1ZDB2?=
 =?utf-8?B?aXU5RmJIRFRCakljVnZXeU1vcElxNTlsTi8zOTArUll0Q0RmZjJOdzVKYlVK?=
 =?utf-8?B?dnhHelB2YnAzWXR6MVlhLzRtUm5tSkJHTkNqcElIU2Rma0haNlhpMXE1bnlj?=
 =?utf-8?B?RVJmekVhcHFQalpHRzFNOUZubys2RTRuZnp4dEF4eGxkZFVSRlduanNBNDRo?=
 =?utf-8?B?bzlFZFNKdm1mVlJhTWVrMFVmYTBHMnNxQWhoSWpJM3BMUW9uN29TMisyOEpt?=
 =?utf-8?B?L0ZRRE9ta3B0ZHNqV1EwNUhxMWtaamNhQ2VVKzAvNzVLZDE2YVRpVDl2WmZN?=
 =?utf-8?B?cVhnUnlUU0txV3VicTBuNDU5TGtaMnNodUVmMUpKbXFXM1ZQMmlaWXZaenNu?=
 =?utf-8?B?VEM3Sm16VGpHSUYxS216TlNzQjlyem5ET3lLcVdNMk9BRVF1SHBWNS9ITHpF?=
 =?utf-8?B?QTI5akU3dlczNVh2SS9pTWdQVFVZZWdzYmRxNjlzRzJNd05SNnJOMW9iQkNn?=
 =?utf-8?B?WDVjTm9UNjdGc2xQaEczdnVQSHcvVTJFcHlDNzJmZXBBQ2Y1UTArZE1NQitv?=
 =?utf-8?B?WWcwTG5XK1lSTTV5SlNlS3hOQXlaU3ZxYXBFRnV6eDlMYTI0SC9UVnJSMVVs?=
 =?utf-8?B?SUxMVUxjV0RaOTRhSkJpVUtMaHlMWDVFeVZXaVJweklQQzJEbUxjUE1GbDRu?=
 =?utf-8?B?bndhVEUzSVk4cUhhbXZ5NmJtVmIyRDEvcUlIZ0l4cEYzSnZ5emVxYXZlaWVN?=
 =?utf-8?B?Qy95SUZGcGJLemtCYTVJRFVGc1A2L0MzVlNyVHVuYXdzWHZCamxZbFhZaFFI?=
 =?utf-8?Q?M4ygG8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hjaVdHUHdHS2VxTllVRDF0c1l3SEZUZEh1YTE4UnlpQlo5elh1ekdweklV?=
 =?utf-8?B?WDJlOHpYOVZxNGU4TTVVaEJnYUxZaWFlQ2w0Qy9OMGY4QTlVQXRhNjVleVBE?=
 =?utf-8?B?UWNYN1paeG0rWkhHR01hendDSnVZbkYxSDlIZktJQ2dyRzVxWXJndEp4dUZB?=
 =?utf-8?B?U3ROWkhDd1k0RzJ6VFFpWHpRT2VpanlMT1BoWTJadlUxNWEzSW5qZEdGLy9l?=
 =?utf-8?B?bGNOazNJandIeTE2aHpuYjlPRzJCckpWTGZ3ZXhKREtSMldPdGhyMmVvd2Fq?=
 =?utf-8?B?Z3JPQVkva3czc1NEck41T3ZiQVlGNEEwWHBYQVp6ZnZaQzdPcTl0cHJpc1dY?=
 =?utf-8?B?YzJVS2RpRU1BY282UVJxZjMwQThiQ3EyTDdNNUJYSCtXZC9XZzRtNDcvSzJp?=
 =?utf-8?B?bW9xN1ZIeUFPMWdlVU5NbGtDWFE1WC9hVlpKY3RLeUhVT0J0TUhtSjJURGZH?=
 =?utf-8?B?bmRub3BWaVJETWJodW5BemdsdmFDeUw2MVAxTGpWNVZieFlMQnBVNDEyU3hE?=
 =?utf-8?B?Z1NwZWlRNDZwd3hKNTJjQlp4eUxYR3BwdllWbnBiNVUzKytsQk5vUFVtTUFQ?=
 =?utf-8?B?emNHMFYyZ3J0ZzZWbFRkL0hqMzZaY0haZ2ErMVB4SFczYVdIOWtYanFHcklP?=
 =?utf-8?B?WDZkUHFwMUZWYzVSNHFwdDJuZy9MSWNVa0cvamUvL2hIMVJQVWlLRHZORm0x?=
 =?utf-8?B?SVMyVGRJOFkrUFdFazRzOHBBUWloQ2Vzd3VYQU1OTHB0MmE5ZGRMYUxoQndE?=
 =?utf-8?B?VlFiVmRhRlZkQjkvajFDcEZ2WXl1NUJiQXZnR3doYjR2Ymt6ejhKcDUzMEVk?=
 =?utf-8?B?ZURUNGtJSVFDTmlMQWFJNzBUMllCTG9LdzlQWXVYZDdGbXBFdis1dWRkdUlI?=
 =?utf-8?B?ZmlxMUVRalJKaW1SWHlCZkJMVGt6eE02STBWKzFLVzJIa2g3ak1sY3ZoQlVU?=
 =?utf-8?B?VWxzVzRYaWN0Q3dDeGZqZGQ5U0VsQlRYcHNBVWVNaWdsb05XZTZpSkpmNVM5?=
 =?utf-8?B?eVlvTGVjV2QxckRYN25zUkVTM3I0N2lrS2tGSDRycE1WNEhwTWRaWXFJbHBh?=
 =?utf-8?B?MHFWUy9wUGxtN3lqSWlvd0Nla0pOR1Fwdjh4Q1VjUHRZTVJyS2pGUG9LNTZ4?=
 =?utf-8?B?cEd6Z05VT2ZqQ1FwMkN6V3BnNm9aNzNpbmNuU0JWb2x2MEpaZEtKcXpBdmtH?=
 =?utf-8?B?N1NON2pOZzRyVHcwSUZsODFSMXpRTDNRaXBvSVkza0lteThGQWZxZGk0M0pZ?=
 =?utf-8?B?UlRsYm1nd2F3T1FiMUJocm5XM0ZSdElQRjdhZmppRVFnRlBwYk5XLytyTHhS?=
 =?utf-8?B?Y1VtMkh5Mm5ldVVCdXNaZG5zVTJiL2R0Nm1ma0VRdFpTSk1OcUd0QU80dDN4?=
 =?utf-8?B?MlgyMjVZQ2g3OUZZeGYyLzA0eS93Zy95cHNzZHlTTFhqMFk5NFNsNC9uTlQ1?=
 =?utf-8?B?N0U4TE1yc3c5YmxubGhqTmNzd0hDek5iRzFPemZhWEJOTXZLM2VWQTd1ZWJJ?=
 =?utf-8?B?QlpZNzZyeEp2QnRFNmZFU0cwSkVlMUYxcFBmejAvcnN1cXhYQnJqSlg1NC9E?=
 =?utf-8?B?K2VkdmIxV0ZJVDNhcmpsY3RGejNUQWozMWNkdzRZRjlSNXRHeWJUc2tKTTFq?=
 =?utf-8?B?V1Ryb3Y5eWJ5RndxMzU2SUxkS3IxRHpMY25MS0pjVERpeDIycE1GSWlITk5m?=
 =?utf-8?B?eXJVMmNSTlROK2FKQnIrSFBMUzNwZUxJK3RBZVF2MnlkSVNUK0hwNnpDRStR?=
 =?utf-8?B?eE5JVHFZL3JicUZiK24zL0VKdDVQSFhPdmVxZStkL3JmZUxZaXpwTG5hNE5B?=
 =?utf-8?B?VFBoaHowdHFaMTRzSDhubzBpUThiSG1IY0J3di9OeVg0S1Q5R1dDRGt1Z2VU?=
 =?utf-8?B?anZvb1ZsVG1qSk12R1czUFZFc2RaYnAxc2pUeEdBY3NaQlJKRG1HeFgrNjZX?=
 =?utf-8?B?Q1pBWWN4aU51R1E5UUF4a0xnYkZpM3A3YU1vWDZFMVgySkFJcU44UjB0djZH?=
 =?utf-8?B?M0lyVThJRlN1Mlg3ajhsamU3SWpYZlQ3MFZ4RkV1MlFwZTBZV1d5cGhjNmhO?=
 =?utf-8?B?V3ArV1BOb2duQ2QyQ2ZwRU0rVUpvcXRzeFhRNDdDYUpHRjVXN1F1TDkyeHVx?=
 =?utf-8?Q?Jm8lsRCVesXIa5FLA+eHZfGOx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90113a59-236c-4caf-f3b5-08de3bc13909
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 10:03:42.0694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaI7RW6SatWp40NnomIHWX47UU76ZANmSCYX8mhakuabih9F2TNH73aUWcF88ZS5wHhfRpwRSLgBKTWwanNsgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_020349_114981_940FB91D 
X-CRM114-Status: GOOD (  11.33  )
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

Find two batches mt35xu512aba has different SFDP but with same
jedec ID. The batch which use the new version of SFDP contain
all the necessary information to support OCT DTR mode. The batch
with old version do not contain the OCT DTR command information,
but in fact it did support OCT DTR mode.

Current mt35xu512aba_post_sfdp_fixup() add some setting including
SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
issue on the batch mt35xu512aba with old SFDP version. Because no
SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.

Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- add 8D pp command in post sfdp fix up for the chip with old SFDP
- Link to v1: https://lore.kernel.org/r/20251212-nor-v1-1-20a5a381979c@nxp.com
---
first part: the batch mt35xu512aba with old version
1) This mt35xu512aba with label 0DA15 RW303 (old version) is populated on
   the imx8qm-mek board, was tested at 166MHz using nxp,imx8qxp-fspi SPI
   controller.
2) root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# ls
   jedec_id  manufacturer  sfdp
   root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat jedec_id
   2c5b1a
   root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat manufacturer
   micron
   root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# hexdump -Cv sfdp
   00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
   00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  |................|
   00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
   00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..............|
   00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
   00000050  0f 52 00 00 24 5a 99 00  8b 8e 03 e1 ac 01 27 38  |.R..$Z........'8|
   00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 b0 38 36  |zuzu...\..p...86|
   00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
   00000080  43 0e ff ff 21 dc 5c ff                           |C...!.\.|
   00000088
   root@imx8qmmek:~# sha256sum /sys/bus/spi/devices/spi4.0/spi-nor/sfdp
   a2e3b364108c4d8052b26d50f31e7dfac6e4ad96aa3994f19678125ebdf8fb81  /sys/bus/spi/devices/spi4.0/spi-nor/sfdp
3) root@imx8qmmek:~# cat /sys/kernel/debug/spi-nor/spi4.0/capabilities
   Supported read modes by the flash
    1S-1S-1S
     opcode        0x13
     mode cycles   0
     dummy cycles  0
    8D-8D-8D
     opcode        0xfd
     mode cycles   0
     dummy cycles  20

   Supported page program modes by the flash
    1S-1S-1S
     opcode        0x12
    8D-8D-8D
     opcode        0x12

   root@imx8qmmek:~# cat /sys/kernel/debug/spi-nor/spi4.0/params
   name            (null)
   id              2c 5b 1a 10 41 00
   size            64.0 MiB
   write size      1
   page size       256
   address nbytes  4
   flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | NO_READ_CR | IO_MODE_EN_VOLATILE | SOFT_RESET

   opcodes
    read           0xfd
      dummy cycles  20
    erase          0xdc
    program        0x12
    8D extension   repeat

   protocols
    read           8D-8D-8D
    write          8D-8D-8D
    register       8D-8D-8D

   erase commands
    21 (4.00 KiB) [1]
    5c (32.0 KiB) [2]
    dc (128 KiB) [3]
    c7 (64.0 MiB)

   sector map
    region (in hex)   | erase mask | overlaid
    ------------------+------------+----------
    00000000-03ffffff |     [   3] | no

4)root@imx8qmmek:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
  2+0 records in
  2+0 records out
  2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.317497 s, 6.6 MB/s
  root@imx8qmmek:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx8qmmek:~# sha256sum spi_read
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  root@imx8qmmek:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# sha256sum spi*
  16b3a0c63252b07501129a0e495e6c8cb8e40598e32bc9a9431838ba95266f3d  spi_read
  16b3a0c63252b07501129a0e495e6c8cb8e40598e32bc9a9431838ba95266f3d  spi_test
  root@imx8qmmek:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# sha256sum spi*
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  16b3a0c63252b07501129a0e495e6c8cb8e40598e32bc9a9431838ba95266f3d  spi_test
  root@imx8qmmek:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx8qmmek:~# mtd_debug info /dev/mtd0
  mtd.type = MTD_NORFLASH
  mtd.flags = MTD_CAP_NORFLASH
  mtd.size = 67108864 (64M)
  mtd.erasesize = 131072 (128K)
  mtd.writesize = 1
  mtd.oobsize = 0
  regions = 0
  root@imx8qmmek:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# hexdump spi_read -n 20
  0000000 b6e2 a2b3 1b76 9184 3ee1 02c7 bc1f 23c0
  0000010 475f 6526
  0000014
  root@imx8qmmek:~# flash_erase /dev/mtd0 0 0
  Erasing 65536 Kibyte @ 0 -- 100 % complete
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000

Second part: the batch mt35xu512aba with new version
1) This mt35xu512aba with label 4KA17 RW303 (new version) is populated on
   the imx943-evk board, was tested at 200MHz using nxp,imx94-xspi SPI
   controller.
2) root@imx943evk:~# cat /sys/bus/spi/devices/spi8.0/spi-nor/jedec_id
   2c5b1a
   root@imx943evk:~# cat /sys/bus/spi/devices/spi8.0/spi-nor/manufacturer
   micron
   root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# hexdump -Cv sfdp
   00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........0...|
   00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |................|
   00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |................|
   00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..............|
   00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
   00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a........'=|
   00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p..P..|
   00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.............|
   00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |................|
   00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.........|
   000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |................|
   000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |................|
   000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |................|
   000000d0
   root@imx943evk:~# sha256sum /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
   809cbdfc57ae56771e017ff7bfdae7122afcbcbb238f2502420cfe3b2fe20d11  /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
3) root@imx943evk:~# cat /sys/kernel/debug/spi-nor/spi8.0/capabilities
   Supported read modes by the flash
    1S-1S-1S
     opcode        0x13
     mode cycles   0
     dummy cycles  0
    1S-1S-8S
     opcode        0x7c
     mode cycles   1
     dummy cycles  7
    1S-8S-8S
     opcode        0xcc
     mode cycles   1
     dummy cycles  15
    8D-8D-8D
     opcode        0xfd
     mode cycles   0
     dummy cycles  20

   Supported page program modes by the flash
    1S-1S-1S
     opcode        0x12
    8D-8D-8D
     opcode        0x12

   root@imx943evk:~# cat /sys/kernel/debug/spi-nor/spi8.0/params
   name            (null)
   id              2c 5b 1a 10 41 00
   size            64.0 MiB
   write size      1
   page size       256
   address nbytes  4
   flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET

   opcodes
    read           0xfd
     dummy cycles  20
    erase          0xdc
    program        0x12
    8D extension   repeat

   protocols
    read           8D-8D-8D
    write          8D-8D-8D
    register       8D-8D-8D

   erase commands
    21 (4.00 KiB) [1]
    5c (32.0 KiB) [2]
    dc (128 KiB) [3]
    c7 (64.0 MiB)

   sector map
    region (in hex)   | erase mask | overlaid
    ------------------+------------+----------
    00000000-03ffffff |     [   3] | no

4) root@imx943evk:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
  2+0 records in
  2+0 records out
  2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0216668 s, 96.8 MB/s
  root@imx943evk:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx943evk:~# sha256sum spi_read
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  root@imx943evk:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# sha256sum spi_*
  8bf13c50e9f106d180e5657e803811e1721c0e092ff46281d5bf30d1b13ac368  spi_read
  8bf13c50e9f106d180e5657e803811e1721c0e092ff46281d5bf30d1b13ac368  spi_test
  root@imx943evk:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# sha256sum spi_*
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  8bf13c50e9f106d180e5657e803811e1721c0e092ff46281d5bf30d1b13ac368  spi_test
  root@imx943evk:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx943evk:~# mtd_debug info /dev/mtd0
  mtd.type = MTD_NORFLASH
  mtd.flags = MTD_CAP_NORFLASH
  mtd.size = 67108864 (64M)
  mtd.erasesize = 131072 (128K)
  mtd.writesize = 1
  mtd.oobsize = 0
  regions = 0

  root@imx943evk:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# hexdump spi_read -n 20
  0000000 998e 471b fae3 9269 ce52 c6e5 42ae 5143
  0000010 8f20 c41f
  0000014
  root@imx943evk:~# flash_erase /dev/mtd0 0 0
  Erasing 65536 Kibyte @ 0 -- 100 % complete
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
---
 drivers/mtd/spi-nor/micron-st.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 88033384a71e5d19f5a26ca91f56a49e3017183a..5797bb748be696b340ff1398155f5ac8b1f74055 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -167,6 +167,10 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 				  0, 20, SPINOR_OP_MT_DTR_RD,
 				  SNOR_PROTO_8_8_8_DTR);
 
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
+	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
+				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
+
 	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
 	nor->params->rdsr_dummy = 8;
 	nor->params->rdsr_addr_nbytes = 0;

---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251212-nor-2f37cf12eeca

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
