Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320D3C83038
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6T5ZLj8tPTPiuN9W9Ri/G7Q+OYUSqJdlS80r2fRcps=; b=JSH5pA+jvIRmYp
	6pdO1Aw10FqcIv2RVadOuem+isS2RZ6Txn1Rh/DRnk6kOKNO3iZOh3zX0Vpb7ozWzxaKx+5JI/j5y
	opmiCbdSVuCx2BsyepM+HQRRT/AVBmKej7Y7OC4RnThzqhxYRWBRn5nCmEAcnddS157QPo+0SsDv0
	QKQWErX7AGmrNMw45ur68lLy3vDLN0Zp2feAR+U6r9LY0TxVuSAdWDRHjlJbApt/yzlB6a1f83jYv
	3rY/l1L8D6EB7kelDC2nQlIFGoQOVzLypRPjOf9UU/TsnMNO09A5hj2X8CcKc1BzCwHNYVFIyFgPo
	eHZ+KgykYZE8wxqssRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVs4-00000004LVV-1lRN;
	Tue, 01 Jul 2025 07:57:40 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWViI-00000004JNg-3fMZ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Jul 2025 07:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E95w5lgo/z5DJ2d4ZW772fS8IQOspXzzKl4V9KDXcq+uZP4ZDyy6lS6T5ZjIZQFg1qzDc44luPH3SWLFELi3en6//mzZjzBilJ9zlVeYnAfSr0xIZEu89DN9+oFC2h9i+ANlHEVzVCYkg0HTkdFEhqTJEVquPxW1uw9H98i1HkDzAYlBzGqkW8LI8zCi2DBS5eY5sTIFnkmsfEOhb4gaebboCN+OCY4hwPEPBRKMtwS0uMkuUl/h7w/I2LDT0D1mZY4K2K9zrJSUW717XzjFWV0cO7rVz/iUyUKk2jFbc9Yg35Pvlh6dtc3+UxAgfkJTRiPv9BzkJB0hOyPorljFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPguFGq/zQM8VkjCYlHxBWvZJAOspjpKQG6qVitFaRM=;
 b=XoYJD6dnJNtKDjlCtoEqOr7bbcjaK1ukqVo+jat+x2R20TrfV8W8XJcr7Qoxz3FqMl6ZvHDNhJoR8+DNnBkDCa6og30GfhNvjuDrZGw5KVyNdS9uUdDwo4uiE5NVB4bs80PCVSimG2oGY0l90M7uDoSoV8WtEjZUXmSDbqteGQcgv3vq0BvLT/+HmtOWnPdddZe12LjmmwH3HMHEMvxz9kGvZ7HZbOVgq0Ij9zytChYuxvwMk/9C2Y4vXXni0rn6iFk+SeUmSPSEAveRdbUS3SJziFsicibXK7BDQtCH0qzWrc5VTd/YiaHHdKdHzWREhuUyWGlAsB1UreiGyN6sNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPguFGq/zQM8VkjCYlHxBWvZJAOspjpKQG6qVitFaRM=;
 b=XkQ9pB6nyXB3J64+xPGKmZtdYXufuPg5eRThb0GzhuYjZN4pWEQZByHamstEezibYDQMU6G20aLTkcf54RPR58kjwAUyPBrrn06Fhc/FqkCRvhIm9zGNmUIBHtnm+f2pQXMTAq2u1LQqNoNLkCfklbHbrQulDmt+ZF84My9DR4vLA+prjIYxnacb4obw6RFSNOXbWIBwd0aW42gCu2Ss+K2TmnKiwaXZGb4jT3gDgAxbQ5s8UZnh7/I8WeV2MNrOgi6kDcfOZtFzsZDMMfFbdRp6kK5VZJqXJlDDC8qyKrqdKXyA/JFYioRDD0UkZRQwgUaw4dBfMAeNTL0xF7EQiA==
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by AS8PR04MB8198.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 07:47:27 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::4db:3dc0:c292:493a]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::4db:3dc0:c292:493a%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:47:27 +0000
From: Luke Wang <ziniu.wang_1@nxp.com>
To: Bough Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "michael@walle.cc" <michael@walle.cc>,
	"p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, Han Xu <han.xu@nxp.com>
Subject: RE: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
Thread-Topic: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
Thread-Index: AQHbwy5mvui/ziUulEqwZziZN8AwGrQdKY1A
Date: Tue, 1 Jul 2025 07:47:27 +0000
Message-ID: <DU2PR04MB8567950B89B1F4F1F97FCD43ED41A@DU2PR04MB8567.eurprd04.prod.outlook.com>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
	<10b40148-b949-442d-9d43-0db09517269a@linaro.org>
	<mafs0zffo3gea.fsf@kernel.org> <87cycep8go.fsf@bootlin.com>
 <mafs0wmam6ukq.fsf@kernel.org>
 <DU0PR04MB9496B734F6BA84ABAE051D439097A@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9496B734F6BA84ABAE051D439097A@DU0PR04MB9496.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8567:EE_|AS8PR04MB8198:EE_
x-ms-office365-filtering-correlation-id: b2ac6c87-e924-45d0-a535-08ddb87386a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?U3o2T0d3eXhBWXlIa3pBWkp1THdkTWhBdDhHL1c1eGVGb3BDWjdTVXZs?=
 =?iso-2022-jp?B?cUpGR3R5ZngzYW5vSVhNTmRWemVodG9WVGs0K3VmL09nTFlZM0JZWlZV?=
 =?iso-2022-jp?B?YkkwYkJHQ2dMQnhoUnVLb28yVnFOQlNEcWloeUtUNW5qWkwzVGdUM1FJ?=
 =?iso-2022-jp?B?eXRpeUFOeHJibnlQb090Q2dNNkdXV3Y5NjdCR0NVMzNnaHZpbXNiMXdZ?=
 =?iso-2022-jp?B?aklZb1VDMlB0UnBobnJ4Y25ObTBYa0JYUW9wT0ZkZVVBWm1ialJzVUR1?=
 =?iso-2022-jp?B?SW9odVJPSXpyd1VpaVE2TVFWUnVZTUhOdUgyS1hSamRHNVFiTXVScVdR?=
 =?iso-2022-jp?B?Y0lCYVVWQWM0TmRTUlc3MnYyU2VCbW9lWk9wdHgwRUxGVHpTVC81Q2F6?=
 =?iso-2022-jp?B?WXc3MTNkNGp6TXhZbHkwYTgzTmNKT3VOcTBKbmZKR1Z5dllFcjZkWEJm?=
 =?iso-2022-jp?B?OU5ja3dJRWpaMlZrd2dCYlRGU2laQ0RBKzFNd0FyK25kc3pKU3FuVDZB?=
 =?iso-2022-jp?B?c00vMit1K1hPNmI0NUE2WnM3N3M4UkVVeEVRd2hMM2EwWEJKajl2bnd4?=
 =?iso-2022-jp?B?ZlVMNXYyY0NSOWp5bU15cklVaTFOSDZqaGdHMW03TGE5RUZ2a3JoZmVw?=
 =?iso-2022-jp?B?WlBsL1ZsQmxnb0hEZ00ycStLcEFQckdwV3hFUzlQZUxNeWlhT21CaDJJ?=
 =?iso-2022-jp?B?a1FaaUkrZGNyeXRIbXl1YVVuT1UxZ1R0Z1pPWk9Ldmh3VmkxQXlKMTJ1?=
 =?iso-2022-jp?B?T2VlM0h0TFo2WklidE1YUUJmeUpKQ2VpRk9IZzR4UWFreVZSUkZJNm9i?=
 =?iso-2022-jp?B?VlFyeEV5aEkySFZBNnJHVmdsT04yd2wvZXkyYlhVMFJrazhBRkVzTTNv?=
 =?iso-2022-jp?B?YWZEcEZPcHcxdVJoY2V3aEFhUjJFNFh4WW1lRjZwbTBoSG5UdGZCWmw4?=
 =?iso-2022-jp?B?SmN5R1pWK2p2QjQ4OEJuTVhxRVhNNWk0VFgyc1UvVXBJeGlYOThiUWg1?=
 =?iso-2022-jp?B?R1EwS0lTeFNpSHNPNmVNcUxEMEVFeDZXLyt0L1NsazdwRzI4eVpaYmxo?=
 =?iso-2022-jp?B?YlIwSlpHbk1KOGVZSGxqMDFzVjRySTZPMTJEQ0xqRlplWncvdjA3ektz?=
 =?iso-2022-jp?B?N0x2WVQ3Tzk5STQ3NGVobGdSTGNRWlpyVDZ6QWNtbm1xZWhOTXArMHB5?=
 =?iso-2022-jp?B?SThreDZhWkZIT0VzNzFubGJXTCthLzdjeFpDVzhONkFIMFlkdFA3UVgv?=
 =?iso-2022-jp?B?ZW4rb094T1NKMFNrR0NBTWwyTmlRMWYzODFReUcwNjBRakMreTNxeE9F?=
 =?iso-2022-jp?B?N0xNVVJDVnlFZDhkb1VaWloyR1c3RVQ4bnVEUGlrTXRQVUI0dmhKb0dx?=
 =?iso-2022-jp?B?TGxlK0pzNjVZNE1VdUFkTWY3VGlDOEhJeVE1dEZacGViUnM2elowTXNX?=
 =?iso-2022-jp?B?dkxqdjErL3pTRlJ2cFp0cFNYdkhUbXVtb0FWZ01GWGtEQXRicmF1Unpy?=
 =?iso-2022-jp?B?TndtQjh4ejFGcU1PT1pubWdZN0F1VnI0NXM0YU5zS1FtYzBQRldOdU93?=
 =?iso-2022-jp?B?OUI4enhCNk5iem9OWkEvalQvWm1IbkxGZTVqTDZSRjlwZmlXOEJvOHlw?=
 =?iso-2022-jp?B?L2NFQ0pBbDhhN2g1TTFTa3c2UXdEWHdRUHo3NFlYVmd5czBQR29ObWww?=
 =?iso-2022-jp?B?UWYrZjQweXd3YjZzTUhMbUZuc2VWTVpSUExGdnZlenlaa3MwUTI3STF6?=
 =?iso-2022-jp?B?ZU1Wc1owN1FTcmw3eFVaRG04VXVaU3kwbnRPTENZMVA0NHlmM1ZrM3pX?=
 =?iso-2022-jp?B?TlR6bWdJWFBIUTBoNGxVdXBxWGxPdFlEVzFmTWJMMi8rZkpXUGVYN3Bu?=
 =?iso-2022-jp?B?RElpWU1Dcm1uVUNRa001U0FsRjhWSWpualB3dEpGa2lDWkVYeER1djFS?=
 =?iso-2022-jp?B?Sm1WdkxFb3BmUkl1T2l2UG9TMC9lK1REVVJxTlN3UFUyaUxsb1ZHWTBh?=
 =?iso-2022-jp?B?ZnIyWmZVMUpKWVN0SG5aMzBSdWZ1aWJtZGxOamF0d1M3cG5PZUJQZVVB?=
 =?iso-2022-jp?B?RnlvS1pUNndrQ0trNEVDRlVENmRGMGphcXJDL0QzSlhkaDdaekh3MnBP?=
 =?iso-2022-jp?B?QzhETmd1cWtheGR1N1o3aE9IcW85VFJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?MmlPYUpHZG42eEkwdFp2L3BPZzk4cGpNRlBvMkJPUTh6eGNiNlJQMU5K?=
 =?iso-2022-jp?B?eEM2SFY1RVpDVkkvWmpiYWRLSi9zbUJsUW5aaEJRemc3Nlp1TGZmZ3oy?=
 =?iso-2022-jp?B?bEk1dFBDVWU5cUtxYll0b3dOOFlIOVdoL2N0M05USXdCZU45bk1aUlRJ?=
 =?iso-2022-jp?B?bzdJNmg2dXlIU09jOGl6MkE2bmdIYmhUak1pS0s2L3dwdzZLbVd2dWJC?=
 =?iso-2022-jp?B?dVFqQVBVOEZVT0plMVpmcXpLMmg0ZDVkZExSQkJBNll1NUJZc3o0UGlz?=
 =?iso-2022-jp?B?aXhTeFBxNlVMeU4vZXN1WlJIMVFaL1hCbS9yNm00aHg2UjFKOVR2bUph?=
 =?iso-2022-jp?B?b3lMK2M2UjN3dSs5cHoxMFBVL2hlUVhLT3hacnVEL1QwNUF4VXQyZ3pr?=
 =?iso-2022-jp?B?Tng0KzhtcmVZYkxNSEg3Si9HVWQxcVg2WGtoYXBQUEVOMzBQZWRuaFBv?=
 =?iso-2022-jp?B?QkJ5OXBWUzZtZlhJZUE1Qlc4UmdRM2toYzhBOHJlVk1iZmVhUG1GU0xv?=
 =?iso-2022-jp?B?K0E5bms5TTNMR0YxUzFrZS8rRlVBNVAweHl0b1pTeDBIdjEwUmp2cVJy?=
 =?iso-2022-jp?B?SmpRWHVoU2o3MDRDM21vN2RIa2t4V3ZIRHh6bG5udzRqditCcmR1aGZn?=
 =?iso-2022-jp?B?aFVlK3J3U0E1Y041VmRZWTRlTG5idUhmaWdnODhqNkNKTHdzc3BBRk1E?=
 =?iso-2022-jp?B?QUxFTGRkTUd4QWZWRVZ6bEMzMW55bmx5RGIzazBmNDdBSTJiVFEwWVpw?=
 =?iso-2022-jp?B?TUFZU1ZoTVpvUkY3WWtBQnV0SlJNeVRDUWhNSmRqRGFoQ2kxNWtVTm56?=
 =?iso-2022-jp?B?WTB1Z0RQNW8wbVZEWlpBSUJZMnBNWmxBakkxMWRjTVFJN1B5ZnNrdG01?=
 =?iso-2022-jp?B?cnFhNWVQNXhSdlFNS0ZIU1dEZFhQK0xNcE84T2tRc09iTDhScmdLL1B0?=
 =?iso-2022-jp?B?UTNXcld6UmlhYnlIbXdxdEk5TXBKSHh2VXlla1EzZHFJT3V6RkdHSDdm?=
 =?iso-2022-jp?B?RmUrTnArakN3bS9LTmJKczdPTUVZNjFacTZGcTk4K01oQitRaHpHTlNL?=
 =?iso-2022-jp?B?cU52NlhIV0tYSGxXOWF3SUxRU3NOdll0WVJSQ1ZuU01EeTZJdmd5SW40?=
 =?iso-2022-jp?B?WG1DTHplRGVtQnhXdU1yKzRwU2FRRHIyNzB4bjMyQzJPUVpQYzk0QlpP?=
 =?iso-2022-jp?B?ZVJNd3l3bXBTZSt3WEhGVVQwdlBDOHg3em5IRjRlNWNPWWwrdCtaZ1Q4?=
 =?iso-2022-jp?B?L0dSalFKSWtzbEM5bHV2a1FkQjhjNU9RMlUxbHMwK3JaaTdCb3NCbFdT?=
 =?iso-2022-jp?B?NFovclZuVFI0a0JNUGU5eE9ETm54aE1KcXdtVjh5SnBvR2dobWtuRWdm?=
 =?iso-2022-jp?B?K3hhUTBWZFZRVzZVdURCbC9VN1Z6bDJiSXNVakNLRHNOdzVrbnFoNUU3?=
 =?iso-2022-jp?B?R2NIT0xXbktCSE9WQit3RkxnZTQ4ZDNDL3lJSnlhVDhjaGIwTTg1enZR?=
 =?iso-2022-jp?B?c0xrcmpLeGxWbHo3S2dNdGJqbEpsZ3ZpZk9NQU9Da2xEa2tYYzF4c21D?=
 =?iso-2022-jp?B?RndyKzZRN1ZwbVlSdzRSd2U0aGhQWU1hbWpxUjhhd3V6cXZ6L2RMOXUw?=
 =?iso-2022-jp?B?V2xqR0ZKY0ZOMjUyclh0b0Nnb0EvdUlta3hVbzVQVGZPcjBFTUNtdVZj?=
 =?iso-2022-jp?B?dUZ1R3psUEdaN05MbzJoMHFrTHZ1eWlYMG1jWWdxSFlnMy9tcStvT28w?=
 =?iso-2022-jp?B?alJJVzZWa0JKTkdCcHgwamsyS2tYT2xURzQ1MG94a3FzNmtQbXNQeUNW?=
 =?iso-2022-jp?B?Q0JCWUYwVEEzNHJnaXhrb3laRkd6L3JNS2czc0JJWUJIVmhyWUtPanZ2?=
 =?iso-2022-jp?B?d1dWNHpTNzRoakgydkRCWXdXS3RtUTNBZVlMc3pJbUtkeGI1aHEydTdN?=
 =?iso-2022-jp?B?N0xydzhrQWUwS3RtUXYreVphOHdJZHFHcFFCZkNVQXFES3ZsYU1zUURI?=
 =?iso-2022-jp?B?ZDh2UGx5b3FHcDMwTEtQSGo5M3lJSGNjQVNnZ2ovLzkrYXArNnhtUkV6?=
 =?iso-2022-jp?B?ZHhkOHk3ckdTS2FqUjBVMWI3aXBNaGMxbjN0OHdZTk0wOTBQTnJBY1Yr?=
 =?iso-2022-jp?B?NVdObnNmRTZvSmVHZUEveGlHdkVDcUN2eGxNaUQyQWY3cHpocnBFVlJo?=
 =?iso-2022-jp?B?ejBHamdHOVJLakZGcStKbWtEWU04YkoyZi8wZVZZTW1FT1Y5Y3BmNlow?=
 =?iso-2022-jp?B?SWFlZmxzdWVSbXZZeFhERTBNblR4ZUNxeHlKeWdVN0ExRVQvVE1tNW5h?=
 =?iso-2022-jp?B?YzFxSg==?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ac6c87-e924-45d0-a535-08ddb87386a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 07:47:27.5837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+2NVUp9QAZ4SOzHHNlL434JjdAcy3QAItgZDeDGy2nFsp64sKuPiYGBQsSFWxI3OM0Qwt949UoZ2zQs1HmoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_004735_067471_2FA0EC01 
X-CRM114-Status: GOOD (  39.71  )
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Bough Chen <haibo.chen@nxp.com>
> Sent: Monday, May 12, 2025 7:10 PM
> To: Pratyush Yadav <pratyush@kernel.org>; Miquel Raynal
> <miquel.raynal@bootlin.com>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>; Luke Wang
> <ziniu.wang_1@nxp.com>; broonie@kernel.org; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> spi@vger.kernel.org; michael@walle.cc; p.yadav@ti.com; richard@nod.at;
> vigneshr@ti.com; Han Xu <han.xu@nxp.com>
> Subject: RE: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
> writes in 8D-8D-8D mode
> 
> > -----Original Message-----
> > From: Pratyush Yadav <pratyush@kernel.org>
> > Sent: 2025年5月12日 17:35
> > To: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Pratyush Yadav <pratyush@kernel.org>; Tudor Ambarus
> > <tudor.ambarus@linaro.org>; Luke Wang <ziniu.wang_1@nxp.com>;
> > broonie@kernel.org; linux-kernel@vger.kernel.org;
> > linux-mtd@lists.infradead.org; linux-spi@vger.kernel.org; michael@walle.cc;
> > p.yadav@ti.com; richard@nod.at; vigneshr@ti.com; Bough Chen
> > <haibo.chen@nxp.com>; Han Xu <han.xu@nxp.com>
> > Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
> writes
> > in 8D-8D-8D mode
> >
> > [Some people who received this message don't often get email from
> > pratyush@kernel.org. Learn why this is important at
> > https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Mon, May 12 2025, Miquel Raynal wrote:
> >
> > > Hello,
> > >
> > > On 07/05/2025 at 09:43:25 GMT, Pratyush Yadav <pratyush@kernel.org>
> > wrote:
> > >
> > >> Hi Luke,
> > >>
> > >> On Tue, Apr 29 2025, Tudor Ambarus wrote:
> > >>
> > >>> On 4/29/25 10:03 AM, Luke Wang wrote:
> > >>>> Hi Pratyush,
> > >>>>
> > >>>> I'm following up on this patch series [1] Avoid odd length/address
> > >>>> read/ writes in 8D-8D-8D mode. While some of the series has been
> > >>>> merged, the patch 4-6 remains unmerged.
> > >>>>
> > >>>> In fact, we also encountered similar read/write issue of odd
> > >>>> address/ length with NXP FSPI controller (spi-nxp-fspi.c).
> > >>>> Currently, we handled the odd address/length in the controller
> > >>>> driver, but I think this should be a common issue in the octal dtr
> > >>>> mode. Was there a technical reason for not merging the core layer
> > solution?
> > >>>
> > >>> I guess I stumbled on those small comments and did not consider the
> > >>> greater benefit of taking the patches. No one cared and we forgot
> > >>> about it. Please address the comments and resubmit.
> > >>
> > >> Yes, it should have been a simple next revision from me but
> > >> apparently it fell through the cracks. I do strongly agree that this
> > >> should be done in SPI NOR, and not in controller drivers. So it would
> > >> be great if you can respin the remaining patches of the series.
> > >
> > > The fact is that we will have octal DTR support in SPI NAND as well at
> > > some point, hence a common solution would be welcome as we will likely
> > > face similar problems when performing these unaligned accesses. I
> > > don't know how feasible it is yet, but if we have a fix for SPI NOR,
> > > we will need something similar for SPI NAND.
> >
> > The common solution would then probably be in SPI MEM? Since you need
> to
> > make sure you don't do an out of bounds read, you need to know the size
> of the
> > flash at least. That is recorded in the dirmap operations, so perhaps we can
> have
> > this logic in spi_mem_dirmap_{read,write}()? Haven't thought too deeply so
> not
> > sure if it would end up being a good idea.
> 
> Seems reasonable, I will have a try.
> 

Sorry for delayed response.

After reviewing the SPI NAND driver, I noticed that the addr and len alignment has already been implemented in spinand_read_from_cache_op() and spinand_write_to_cache_op() functions.

Additionally, using 0xff padding in spi_mem_dirmap_write() might not be suitable for non-flash memory devices.

I can respin the remaining patches of the series if you agree.

Regards,
Luke Wang

> Regards
> Haibo Chen
> >
> > --
> > Regards,
> > Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
