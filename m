Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E603AFCA17B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdyFdXSUgtxVTsOlNL6hklxFHZpwK9I45hwSXwHh/AM=; b=ZHHVLsKkwZzF6S
	xQq64tefdu+rmclmNjR5ic2oRvOM3zo12mUeb8VZsNrGBRaYdzEqDLucMxAoDXQdBhfjZ2ngv1HhY
	tRzf/g/4zvsC1lltP+gM7v66DG5VuCEEpwL2XDjLvAMqCBo9WyiSb47Jxp/wL+Et+t8A9qgA8RMHv
	tcehHUjLP6ms+CMrYGWCkv5CDXFjasZcYJh3w+nMJ6cujoOUUw2dqv/Fa66Sicf+pPm3xgrXkvLpj
	EdXwbc2VjvDLZZXCH5EB6nh0hWcu8xKyPWoUi473zXGCGlRPhw5T+9MPog4xQQGMMt/fbCV/8IX7S
	B1Qlz5ye62gURtMY2ajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgqL-000000086HE-2NTm;
	Mon, 09 Mar 2026 20:04:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgqJ-000000086GP-1up9;
	Mon, 09 Mar 2026 20:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xLz+JdaK1h7LNsrboNwLyQvHuNruttFneXvlMhaazd4=; b=Ac8Edr1Gf1zNjz5nWCSfk4jw+o
	dUgBk9A0x9/8DIsxQcVV8Yu/XLiW/K7QtWA1Ii8bMn+GpC1tMQvDhhu9qnxU4yoz39Z0oXPtTIIKt
	C8KkFWvV0pUbQUzvpL4DbviQxO03OUXMZoM+g4gIHtYJFf29PvTmvL0mAPEqZxuFdPqWkP6oS4neX
	ZuP171J1phEjLrd1zVFgmX+CQNEYT+Z6Xmu1mFPUH5DqNhysqa+R/Tu7DeYEDLFY5Y1/xMKZnWLrh
	smdSm1VjD7IKOvYc4aYxqxNVyzureGwv26ZSaxRBz2+C3FynzO6gTdGSF7e0AMTcHvglQHSRBLi0d
	EJc6QDOA==;
Received: from mail-westeuropeazon11010069.outbound.protection.outlook.com ([52.101.69.69] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgqF-0000000D9mb-00vp;
	Mon, 09 Mar 2026 20:04:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4fMgWLqsKJOKHNhR+Goz+7Y1dEINpK86+S76Ctc6IowSb0uPbsT1y5CKHayAwMm0LoKsgg8P1Y7wJfMFQSjqpcP+Y5y5AWa7UncZ1zrY34QaWloUxZVXiqrVb/6HErepAU74Nj3VvNJ+nCpCf66EAPbwOufgkmH0NWt2uMT+SczoGHw4J4qKZn09VIr3CBKiaQPQ/h1DrOLfNvD0AGBKrVAMsIepeIHcV5zbuCH0xS0BW5yZ95ISxpOjBY3PtvvDcoBzowPa3apfPVXbnhpF/RbdG65UreJc/qDR+ufi67IEIQZCgIg7I4kU+sRL9yV8cj/TiobvqKJBOEtRZU4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLz+JdaK1h7LNsrboNwLyQvHuNruttFneXvlMhaazd4=;
 b=q9N9tj2bKBxLUOVO5GdBciuSPaw9+HU/ya2tRrkoVK6JIXfNPR9JQYBdm658S/mYrh+LekZaiZaLgONTgn1QlktiJGg0hOZlBqveSEKByNC1U7grEHB8Qx9DMrdz+XeHUobuL47mxQRQQ8g2uKcW9rfyinXkKsFpVU8FtebID+x4PWNzFoTr35UZqpELwEdMUt8jDUydg89dZQihy29XII0rvvGzmPO6fGPRY4Ua/pVe9f6pH9Y2mU37gQKTnyxQCJM4i9dTQxOnfCedx1J3VW5l6uSE2RH5PAuf96RhW6Kq1X3N7RGy4fR6PUM7M1Qr+Ruhvpckiyvx5gEKDdJxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLz+JdaK1h7LNsrboNwLyQvHuNruttFneXvlMhaazd4=;
 b=elb5z1ex1+O+TADDqmI3ZL44GlT65gNEeI7KKE0z9zgIqv0j3Da5EwU7BKCLSJ09vb1IiWNwXORJVBn382CVaI697k6MTm4pl3A/km1zWmhBNA6t3SoCGea5s9Ng0fa92W8vR1nc2P/RE+oc58qGGcnf7bJP1sIEjKnET98/ycq0uuxi+eWmtuFOGYwG6bbCSXwCVqnBN3gZtZWow80IqvMJILLPKhx7fCqhwcGmmGRSiFDx+ZRHqM2YMjsf5J4Nh2Jq3cQswJw0YUfZksUPoh3IZn8M9b3x/ulyUv6m+ykK2l/dH7IDpAgvBcCHc6980Ba7ZCA7luaq37MFHr5gxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB11934.eurprd04.prod.outlook.com (2603:10a6:150:2f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 20:04:36 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 20:04:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 3/3] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
Date: Mon,  9 Mar 2026 16:03:44 -0400
Message-ID: <20260309200351.1791162-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309200351.1791162-1-Frank.Li@nxp.com>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: 086bab13-b7f8-47c1-dec4-08de7e17164c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: pNoDnaB3f/6HnHQNryQqqVkm039X/Ar9MI8xriNyfdDyG3daLsNVz+wbu0A7Rlbhpx0x8skLsKzIfjRNDvi7N97yqY5Y8wiPQp7fm7PYHy83jC7c1/fGPkneN51E+dCY6FfmtiU8veZrEgannHlZE/IZTh9JF4DAsLjzd6etBLzcN/XWXkBkMIFcK/z/B0Srmw6HpI+6zTHi+xgMmJzoXbmTtZrNrkqkG70rusWHmrIvTAid46Neg/X+w9CEm3BIAm4cOOdST16z7fFqQf4oPKIlVqUboM8g01diwPu6Y85Gk7CsrxpE0ta2Kh08Cv6gPBn2JPaCnGWFOeTNZ/nJJ5TdkyEy1FiFw1iAGVev9AI4XL+gHwtG38czV4jM5W8u8wAXwjW3FenYuNxbLgiNrULFAUGFGBS8sgH/h/x73DC4+3CIt28pleNAND8Sy4tu7LvAlNVkGnCi7Ao4m9a2TZWK9JrW9ppzTNwaQfnxLDjqPh09C2STU5EYqU405FKjHBi2qp+nAfuYKk0s1ymojCUB5oNvTT9snCUQ9v/OCxMkKF5FARaWOEnWLp/ZuHxVsM3HE3EbIHCdd74ppCEA/OD6agG/JotnrbbOtBS92KC+sb096krsLQhhnGadNCTs0A9YKoEsAE1DWkV6AqF9YDB1H9hnpB+13g/9PkmYt8Sw5OOuq9CRtsIfioKgC79pMVtvFQwezwWoZ7FIzd0dkkdCqqm3rBUnxYzpg8TbI9QE9+cHjdeE/C01XTD8eLoaAYistEPTPIyJIH/hcbHOeTxm9IlG72Zg6n+lpQj0hIrDnj/6OoYBMH4mxOgUn10A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklLajV3MnowWTRHWFA3OEthem90WVNWL0JOb0VNRmtXaWVUVU9RS2VSdTk4?=
 =?utf-8?B?bnpxSGpxU3RFTVB3NlhGTE5GVFBpUVR6Ny9EY2UzcFEzaDJjYjYrTW9LcmFR?=
 =?utf-8?B?MFpDUlQxQUR3Nk9iZWZFclBrRWtQQUFac1Y5RXdDa1FOSUo0ZFRyU3lVbEtU?=
 =?utf-8?B?MkJzWk8rYytBeXpOazR0Zk1ObEI0dmk3Z3U3TVQ4a1d1ditPL3dDSjFQaXJS?=
 =?utf-8?B?ZHVIQWJRUVdnWWxqRStMM3R1aFdCVFp0cHdDbEY3OWxSaUZCc3NsNHFUOEFF?=
 =?utf-8?B?QVRLaXlIeEhiS1BlaEhYTWJsMXJhZ0ZoUGhLaWlxaE9rc0ZjNnBycUFIa2g0?=
 =?utf-8?B?aXFFaDdjeFNOblB0QUNldG1WbEFQUktCZ0pFYStDK3BhVzM1akl3Q3JQblMx?=
 =?utf-8?B?dWdEOXpMcFFyeStVanprRWpldVJET1RTQXJ1ZWRiVjl6VUJxeVJqZlE3OUpV?=
 =?utf-8?B?aGxXZ09DT2g5OVB3eHZsbG0zVUh4UHU5SENQc3lsTndsckNSVjlIZ0c0Y3Zz?=
 =?utf-8?B?b1FhZG5wWW9RNFZaUENGUEJPOEdnb3VhSGZySXc3U1diYUFpdUpYRy9wUmha?=
 =?utf-8?B?d2svTXRGbE1xT0FqdHdvSE5Lcm5LOUhmcDVtZnlrcHUrUkpoQnFFQkVVQzl2?=
 =?utf-8?B?Rm15cThzakpWOVBQQ2FyY1lsK2VVYnNxRGFncUVyRTNkSzE4WG5ib1VtVHZq?=
 =?utf-8?B?L3JuV3dKUVdYUXNVbW1SamVGUHcrcCtmd284NE9CR1N0OXVnUFl1eG1vb2JN?=
 =?utf-8?B?YUZDMXAwSG1Obm1GRlVlNXFINzM3NFdBTVoxa3ZYTXRDblJjSlVvYVR4a2U4?=
 =?utf-8?B?azZmNUdXazdZcFlrWXg1OFBReWpWS3pMRlM0Y0hBNXhlVVZzWmMvcDNIZjRw?=
 =?utf-8?B?a05qME9HbWkzMkJVUXBoSHdqelMrVDNwOEFVUnA5NnpJTWJkSU5xUVB0bERX?=
 =?utf-8?B?aVUyaUVzUTU3YzBOeWthQXk0ZmVMZFBZVFUrWEJzdWZNdlZFSjI2czByTHp1?=
 =?utf-8?B?aW5oWUJmZ0c5TkZmMUJlVUtHcGtrWktkTXIvZS90SWQwU3psb0ZnSkpjdmo3?=
 =?utf-8?B?R1h0cTRxWWVjWUdEcm9FWHpRSWpVeWllWEt2ZnlhWEpEZGM0b0ptbG1MZit6?=
 =?utf-8?B?SFNKZ1Z6U0VjbGdJejEzSklsVFIvVnR4eWN0OVhHNzBSRjEvbGp6K3ZUaW5u?=
 =?utf-8?B?eGp0OUo3K2dqa29UdkNQd25kejIxN3dkSUE5UzZYclAxRS90MDlPSW5wNUlm?=
 =?utf-8?B?WkdXWTE5SU1MbXhOZEwxck41WnRrS29FUDJmd2Iva2dlTlZyb0Mzc2JXMUNt?=
 =?utf-8?B?UkNMeVRUVWVWRVo5WmNsTkZ5YTNndVo1NTBiS2F1Z1RXVGVEcGlNK2hCbkJB?=
 =?utf-8?B?QXVIRHNzZ3ZMU0ZmU3BvMnI4UUU1VFB0NC90UFhaREtjc3NFY2RhejIvaXNU?=
 =?utf-8?B?cGNQVFVkNVdkdVp5cDZNdzRHc1YvMFlmSU1tODlKN0ZtYlhyTEtKY3NMSjFL?=
 =?utf-8?B?dEdvVXczbklpNUlOZTBwaUlxNWhzdHYxUGFRSnFncVFNaUtkVnQ2UlFxb08w?=
 =?utf-8?B?alNibG4rZktvYisycVJkZWpCekI3NVhwR21kRFlWc1FWam1EdGNUTS94OVVm?=
 =?utf-8?B?SCtKeFIvcHh6N3l5N3doSmdtcE1aWUJGZnNTMzhuVW1zem5JUFQrQVhGN0JG?=
 =?utf-8?B?UUd4UDlKNDc2cGhlZEc3SjZndklHK1pyMUFDbk00L09RQ2J4M0N3dThZSGVy?=
 =?utf-8?B?SmFaOGVEbWNCWFZzRms4Ui9BVEFSVnJjejRwbkc2RnBwWS9PRWQ4QTkrdEsw?=
 =?utf-8?B?YzN6L2hxeVZjclVxajZMVDRrSlZTWUR6L25WNW9Zb0tkTSt3bW5MbkpmdE4w?=
 =?utf-8?B?d0N4WTR0YXQzczV4dkExY3dBT1JJak52WHJXaXBLdTZ3eFVzeDV6WjRTeEJ6?=
 =?utf-8?B?SkdqZXMzVUdNWnZyckZLSE95YUxHbjR6TzdBUHkreFdLQUJuTkdaME4ydWhR?=
 =?utf-8?B?MDR0NFN1NFZFZkNVMWEvcDZhcWxtVThsL3FONHEzbE9CWDYwQkoyR09uRjNm?=
 =?utf-8?B?eXh4OGpUbThoN051T2dYRExudUI5Vy9YeEJ6akc4Z2R3dThBWEJNUmMwakNJ?=
 =?utf-8?B?QTM2ODl3WkFGM1B2RFp3bFlQd2tsSlJtZ1ZNS1d1K1d0QTlNZDUxQ0M4d1Qz?=
 =?utf-8?B?anh5Mzg1dXYyM1NZK0UxL3lDTUVXSHpZT2szQndBMXV0NndlMTNuVXlSTXpm?=
 =?utf-8?B?dXZmbzRtUlFIdGFOMm43M0hTUUZ6bm1JRnJwVGdLcGc4WGZJMDR6VitGZkJ6?=
 =?utf-8?B?Z1NBRTJ5bjMrOEhCWUJwWnZaQWdEN05WT2hMUHFFWnBzV2Fzb3ZyUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086bab13-b7f8-47c1-dec4-08de7e17164c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:04:32.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0LXa6BbsFaMUKoCF4zlP4uXcWyg9Yj/h3mgV8WCiBf8jOGt2S4EXIoZtZL52pVnF2Kq+fnOI9GLNZYx6gUx1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_200439_815448_83E27758 
X-CRM114-Status: GOOD (  11.96  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkIGNvbXBhdGlibGUgc3RyaW5nIGZzbCxpbXg1MS1uYW5kLCBmc2wsaW14NTMtbmFuZCBhbmQg
ZnNsLGlteDM1LW5hbmQuCgpBZGQgbWlzc2luZ2UgcHJvcGVydGllcyBkbWFzIGFuZCBkbWEtbmFt
ZXMuCgpDaGFuZ2UgcmVnJ3MgbWF4SXRlbXMgdG8gMiBiZWNhdXNlIGkuTVg1MyBoYXZlIGFkZGl0
aW9uIE5BTkQgZmxhc2ggaW50ZXJuYWwKYnVmZmVyIHNwYWNlLgoKQ2hhbmdlIHJlZiB0byBuYW5k
LWNvbnRyb2xsZXItbGVnYWN5LnlhbWwgYWxsb3cgbGVnYWN5IERUIGxheW91dC4KClNpZ25lZC1v
ZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSB1
c2UgaXRlbXMgZm9yIHJlZ3MuCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL214Yy1u
YW5kLnlhbWwgICAgIHwgMjAgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFuZC55YW1sCmluZGV4IDQzM2FlNTcyN2FkODUu
LmZiYWZmN2QzZWRhODUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbXhjLW5hbmQueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL214Yy1uYW5kLnlhbWwKQEAgLTEwLDcgKzEwLDcgQEAgbWFpbnRhaW5lcnM6CiAg
IC0gVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KIAog
YWxsT2Y6Ci0gIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlhbWwKKyAgLSAkcmVmOiBuYW5kLWNv
bnRyb2xsZXItbGVnYWN5LnlhbWwKIAogcHJvcGVydGllczoKICAgY29tcGF0aWJsZToKQEAgLTE4
LDEyICsxOCwyMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBlbnVtOgogICAgICAgICAgIC0gZnNs
LGlteDI1LW5hbmQKICAgICAgICAgICAtIGZzbCxpbXgyNy1uYW5kCisgICAgICAgICAgLSBmc2ws
aW14NTEtbmFuZAorICAgICAgICAgIC0gZnNsLGlteDUzLW5hbmQKKyAgICAgIC0gaXRlbXM6Cisg
ICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGZzbCxpbXgzNS1uYW5kCisgICAgICAg
ICAgLSBjb25zdDogZnNsLGlteDI1LW5hbmQKICAgICAgIC0gaXRlbXM6CiAgICAgICAgICAgLSBl
bnVtOgogICAgICAgICAgICAgICAtIGZzbCxpbXgzMS1uYW5kCiAgICAgICAgICAgLSBjb25zdDog
ZnNsLGlteDI3LW5hbmQKICAgcmVnOgotICAgIG1heEl0ZW1zOiAxCisgICAgbWluSXRlbXM6IDEK
KyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IElQIHJlZ2lzdGVyIHNwYWNlCisgICAg
ICAtIGRlc2NyaXB0aW9uOiBOYW5kIGZsYXNoIGludGVybmFsIGJ1ZmZlciBzcGFjZQogCiAgIGlu
dGVycnVwdHM6CiAgICAgbWF4SXRlbXM6IDEKQEAgLTMxLDYgKzQwLDEzIEBAIHByb3BlcnRpZXM6
CiAgIGNsb2NrczoKICAgICBtYXhJdGVtczogMQogCisgIGRtYXM6CisgICAgbWF4SXRlbXM6IDEK
KworICBkbWEtbmFtZXM6CisgICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiByeC10eAorCiByZXF1
aXJlZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVnCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
