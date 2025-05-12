Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F968C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 11:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZLSgmK2K16uT6miSFxqHEOarP1RLeQzDWc4eBB3328=; b=d8e0dvgLw4T3lX
	Kv1XTMS6OovupAHaL3zxb1J69Hu6YDTJ2Nrn0X1CgjyFnq9Bv12uSxoTsb+HA+LXJTHYVaWiqE6cK
	MdwWxyHaZQ/bpFDvBArrf9lXJXnrJyoJDyt3zezy0i4+7/rMLtPqPgmDCWP2CEgOFliF9O7Fzj41t
	ixqLKrw6bDqkrZ7s6KOaQJDLXhjdwJi975BK63Zi+eak9qnt1NyD7oNycrHukAM3gANWvIDfoR540
	ZZmHqhRZbdeHHPHWtJDzn29rYffDcRJ7/TXgdMj1w+Kuh5USqDhzW5SNUVOWCh245gN9XFxm2lXo2
	zYlKBCjrxbjd5LKeT2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERHh-00000009FRi-41it;
	Mon, 12 May 2025 11:25:25 +0000
Received: from mail-am6eur05on20618.outbound.protection.outlook.com ([2a01:111:f403:2612::618] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uER2r-00000009D7f-2IEY
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 11:10:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/QQwjf2kn92Yr3lY66fP42mGHHdmpm8NquSgkuVoBrACVStii3rIYSL/mlVZEVRXmFkzj/tiyAnJGynjafrygtjS1rwl0mm65VB3gNtOgTCWQsw7DSxCZRs64Qn7x7GcKBm29YGN0tYs/2Ot4a8BFhrhWwLrwEEnzveX3IFjrHkQaxN17NM+bHAi1RlusHF9ct8LjAs0QND3MtNJ9Wqk/mtuPAaKCPR91SnzXv0FDiirWqupgxQqEEBvy5vvYEI/LUcxpvPMTckQE0Yj9kx0VZIfNZV1Y/yLVU5yw4WzE/x00B2QMTEikn2yshLisT2jzK2ks/ouXBqkPiDdZgcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt+Sl81B0Nu4wqEcXqAuYJG1STxfAEr+Gszw7NpmSls=;
 b=tYBduGBmU6qywGFEcHX4X4cF4viMegqsbNQd4Oonptpzulc6SxZ69dbchBhmx92tnBY1YVowcYp8MHcMbKZORzG0M6gRnZmK3fipsYfIGb/mBTs0RypKIydnxee55dCKwGwEuSFKydyHDxdavV5IUoCCqW6nSGwB+CJXDqFpVwPDXgqC/zMoDeVMX9Khrw7N1wkMwt1T+o3ccstz6bzWUxQlHzqgI0bVF1rdNwMGAkoq/VaPyt4ygQR4jN0kPXjfeDgPoLusHpP/S0Pqp4wE8Nw05DbWVvooadQMNg1EP9gO3xyIbqMAC1dyUjyj7YjIp1XjN0ijQGE47+heK2LDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt+Sl81B0Nu4wqEcXqAuYJG1STxfAEr+Gszw7NpmSls=;
 b=kB9mZgVHudNbrbeOJSfllLwvwmFdvuK7VrRcAWtz/O19rVeOolMbLzSF4w8UjUTiRBoMyo7/SjvsmXsqv4G7zw42AsoIzil1xXbmLE3gRNNyybAeUp3QFnaKO7+vz21Qfw6AsEQE1n46nrL8MB3Ry4SZ7/M8Img+mmU9lmE5sw5xRUeMs/uKN1SQmBBtxYy4e+Gojhu1BsNWcAngGO2SQGcEVyIYyWND/UQQTB9IWfUYVAODSWCZ92s4dp6hr9u6DbdQBC8zb670ffrTN4kA3EwlNqrMW2yJ1y+oTb16NsGiyj4HsCUJJnN5dVW5d6xMvYCx6E0q9MoTWw4RDpMILg==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 11:09:57 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 11:09:57 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, Luke Wang
	<ziniu.wang_1@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "michael@walle.cc"
	<michael@walle.cc>, "p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Han Xu
	<han.xu@nxp.com>
Subject: RE: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
Thread-Topic: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
Thread-Index: AQHbuOhFdXcNiHAEPkKtP9IZKZSLZbPG9ySAgAe+FJCAABsogIAAGjIg
Date: Mon, 12 May 2025 11:09:56 +0000
Message-ID: <DU0PR04MB9496B734F6BA84ABAE051D439097A@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
	<10b40148-b949-442d-9d43-0db09517269a@linaro.org>
	<mafs0zffo3gea.fsf@kernel.org> <87cycep8go.fsf@bootlin.com>
 <mafs0wmam6ukq.fsf@kernel.org>
In-Reply-To: <mafs0wmam6ukq.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PAXPR04MB8473:EE_
x-ms-office365-filtering-correlation-id: 0a4a135a-1137-4c40-c9d4-08dd9145879e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?gb2312?B?Z2hISVZkTUxMdm5HQUZZNlVwWi9mZStuOUZtbnpjeGVvTWJoMklHdE1VeDJk?=
 =?gb2312?B?bnZUVnNKN1VyREU2dStDLzJveUlMOFBVMk1EZG1WYmdVMHhjQll0KzBrSGtS?=
 =?gb2312?B?ZnZBdE9PcnVLRHNaME9QMVNNditsSmlnQURzS25kcUpWZTVkOW9oMTIrWGk4?=
 =?gb2312?B?QTNDT2JPTU84NUExeEc5c0hmanNDU0d6NHlpSGQ0MVAvUmswei9lL0RvdjZ1?=
 =?gb2312?B?bWlISWlSSGh2bFlGQ0lBRHFYT0JsWFUrOUw1eTMyNTg4MWdFM0dCOGpVbFpC?=
 =?gb2312?B?RUJYNlkxa1BIMFI3UXhOcjhMc3R5WXJaUG1aZ2ZvOHY1QWlMRWZCbmZFMmRG?=
 =?gb2312?B?UTZrWXZ3SGhRZHpVNGp4MjVCcXF4eG11T0FhQUMrbU9rQ3d1UEhZK3lNRm02?=
 =?gb2312?B?dUNSbnFaYkw0a21zcmhKTEJEaFR2ZVBjSExqeS9BM282RHhET0tDdVVOcmFW?=
 =?gb2312?B?WVd5ekxTYnFiY01wZDdqTU92WUZwdVlRbzR0SVJlWFhpbkpZTWJNZUN4MFh3?=
 =?gb2312?B?NUZ0SWpCVlVTb2hsVWJTR3V4S0xmWEs3czJMazBLam9NelBZMGFNLzM3RC9Y?=
 =?gb2312?B?akc4RW1NZG8rYUxXMWhab20vek5hUG8xNkVIbHdXb1BmTHBZZEt2QlZXRzlG?=
 =?gb2312?B?SWRBblJ6Vm5Lck8zeGJta0VPalJwWjYyOW16UlRlOWtQUDZKUVNsRjZvd0M5?=
 =?gb2312?B?SVZRb3dGRlgxcUk1VFFjdWx4U3J0ZHBhYkRHU3VHVVRvQVhyUlZYS3JnM1ov?=
 =?gb2312?B?ajRzZE9lemFvSXc1cWZ3emRpZ29hcXFaYStUeEZHYk1VTWJNbE9LaklPeDNL?=
 =?gb2312?B?NHZ5eUZaOEdMMVBZc1ZwSXVMbDNLZGxUUjJJZWpZYWVIVHNhQVBlODlmNEU1?=
 =?gb2312?B?eFRjTUwwUEltb0NGQWR6NTI2U3lDSGdnTC90TmRnRDlRVlkzL0dmNVl3bDNR?=
 =?gb2312?B?VmpLUCtuSFlta2FGVm50d3dKZDJnTGg3MXp0V1JCR1liTlZwVDBENWwzS09u?=
 =?gb2312?B?TEdkbXY3ald1cjJTNWJ1UFJJNFo1TU9ES3ZSVkNsSVlKQm1sczl0YlI0STZJ?=
 =?gb2312?B?ZjlSbzEyTTNkZVVYQ3psL0ZSVTRMQjRZUlNhOUdsN29ERDVSZGdFOU5MVUdK?=
 =?gb2312?B?OHVxdlR5azFEQ1lIWDM1b0V6dnJhM0V4eWdaWHRxKy9tcGZJcUUvdVlLU0k3?=
 =?gb2312?B?Uk16UkVFamJacXFBU1B3UzdkV3g5aHh5cW8wdjk0V0ZMaGJuaGxnQ0FKdVpj?=
 =?gb2312?B?cGJIeXpJZDFHV3crZ3lkRWJwVDgwMmRpMHVVRWdMM0lXVmRrdHhLRDlPMGNI?=
 =?gb2312?B?T2IwRXJmcmhsSUhkUXR4MzNmMmhGWVlNU01hdFNUUGkzMkZoRUd3MG5TaGdn?=
 =?gb2312?B?YkFpbFp3em80NEQwUXd4bkhJTlphUkYya1pmQ1JIei9DMTJYTVNsZWpRbWtq?=
 =?gb2312?B?NG41R3BKbHRrcGdCOUJEaFk0Z1AwcUxpZUd6NldiakQ1MXJjaUNYUkNvb1RC?=
 =?gb2312?B?MTJHUVRyLzdtUXVzK3c1cGc3UFJ3dXVldjhPOEpieGI2em14NkpoT1NqcGkx?=
 =?gb2312?B?aWY5SDdSZ29mRmprUFF5TFp6emlSUzMrd3lPZXhwOTZxZ3B1Z2tMb0t5cCs2?=
 =?gb2312?B?QzRZd3hOdkJ2MDNXYWhYQUI4WHNxWG91SG1vYXU5dFNOTm00YmJvZUdRSm9Z?=
 =?gb2312?B?c1B5bmtGbmo1N3BVN2lPcDlOVGE4WkpmSStZWGdiUVQvdVVha04raGJwdEpw?=
 =?gb2312?B?TzhMNmhZY3BrVjhyZ2ZMV056eDFwZlJqcWdFaU1GZ3NCUlc0QUZUWU1sRTRE?=
 =?gb2312?B?QWdTeGxWTUtiQzVhT2ZjRHRGLzljOC9kRFdNTDZNb3N1aTlPZ2tOYkVodmtK?=
 =?gb2312?B?SW16OXdqazZwTEJPRGZDbW5HaTBxK1JXTmJuVG9ldVVqenJXaHpycmtEcEFB?=
 =?gb2312?B?ZFptTEd4ekFtWW1VNFA1L1luQkpFUUlNVWYzTXltTGJ1bFFVY3RYUDJueGZj?=
 =?gb2312?Q?BTv5RAyHcf/wuwbV975y59zZzqSMsk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dUt6TVVLWWpHSWZuc0lFSThnNlVFYVRLZWhwS3oyM0ZBTXBleEg2V0NqMVZR?=
 =?gb2312?B?T0RaRmZJUEdYZ2J1QWFuT0c1amRCbDVUU2wvYWl6MkNIdFFRcU9pMm5sRW5y?=
 =?gb2312?B?Z3p6eFlTeTZlV0VVaElVbVR3dXY4dGtseU9qblF3alJEK0ZqS010Tzl6STQv?=
 =?gb2312?B?eDJveWIyYWF5SXZ2cUJERS95QkU1SGpiZEJObnk0Wm1uMVhOTmFiVjA1eEZS?=
 =?gb2312?B?UWpFNVlZWG81T0pVN3FMcjRmNHdqMEt3VUlCWmRXbzBMRWQyY0FXRjBUWDFQ?=
 =?gb2312?B?Z3RiV2FHdXRlRGVqSjhqVkhUbFplQmNhbXNIYmNCTnVOTlE5NlA4NjV0d1Ni?=
 =?gb2312?B?d05mV2RwYTNtU21hdm5DbEFVMUZIWHM5NEtxcDZLMTFLMEZ4M3NLdFRSRkxp?=
 =?gb2312?B?eW9vUVpQSFFKYlV1ZUdZYWNGdkw2Y3VLNzVCU3FCVmdiaStMMW94Yy9JTHBX?=
 =?gb2312?B?Q2t3TXdiS3gvbEFqOXdSWm5pK0xJK2hIclh1UHlRZUZ6WnR4ck96UXlUZW9o?=
 =?gb2312?B?VVQ5Vnp2TDR0VXhVcmk0blBJWm1BbTFTQ01FWlVCMzlEVCtkbWtsSUQ5UTNB?=
 =?gb2312?B?bTRiSENkd1d3WCtzTmgvMXNmRS9keTVaTCsvaE84TlhTVnpMUjFTTithVHU1?=
 =?gb2312?B?Mmc3ektYTktES0o0UFF4NkNPbUhjQUVtLzB0NDZKNU5tbjRzL0ZpZE1WaGRO?=
 =?gb2312?B?c003azBCVExkNG9OeHlkbDdrRkxxYk05RlFJSTlVZ0ViL0ZMKzYxdGE2QmdL?=
 =?gb2312?B?ZnVZK0NpZndCdEV2T3VCWXNVcnU1ZUx0NmxBdWtLMHo4cWFpOVlwMzI5YTVB?=
 =?gb2312?B?YUpBV2RmRU1nREpKZTJWYjJ4Skg2OFRGSk8vMVhYWDB1N01MN3NoajkrSTVx?=
 =?gb2312?B?Mk5yZzE2WkkwNXdZWDZLaldHTmZ3ZHI0R2RXR1BoRFRQQ2c4M051dHlTRk83?=
 =?gb2312?B?c042SnkxRDJ5c0MwRm1xKzRja2dtUDU0YkZuaDlWc1dJZy9JY0xrTHZhdC9l?=
 =?gb2312?B?WTEvOVVoR2RWQmYzOHk4SkpOYXlhOGlVcU1jZGxGbUxmKzdrQjkvVUdwOWEz?=
 =?gb2312?B?dUFEV29Pd3ExbUlvSlFBTzRaN256RkhxbXR4MFN4aVMzSndyU3VRUC9SWFlG?=
 =?gb2312?B?Y3NqK2ZMRWJ4RzNocmFuakhUSlpYaDBCZXlab1gxRUwwaTFlWlFsYUR5aDdk?=
 =?gb2312?B?SWpBQWhyeXJGY3p0cmcwR055QlB2WktYM1BaY1RNWER2TGU1ZnpGZkhWL1ZK?=
 =?gb2312?B?cXo2R3JzcXl6MUlENkNPZXhtUzJnbkNqUEl0MG1GalBSMVA0ZDBFRFY2NVBp?=
 =?gb2312?B?RGFTTzBmS1NFRWg3VnVtYVFVRGpNQnYrWUx0cGdlTWRRMk1VWU55ckYyNzNC?=
 =?gb2312?B?NHRDYzhXRWsvMGVuWWdHcjNHaXYzcDZoZTBwQ0Flb3RPT2MvNE1WMGtuSWt5?=
 =?gb2312?B?VkZFMU9EV2d2TmszVk9oeFEvTVQ0MG5aVzMxUy9hR2FsQm9Hby80UGMvTVVH?=
 =?gb2312?B?Qjl2dG9kZHo2TmZuS201RVB0NDNTUHMzbEt5Q2cxT2Z5ZXJHZmVDcXI5VHhS?=
 =?gb2312?B?MHdHSXRDZC92K0VFaUpUS0xNa00zYVppL2hJMUZkckh6TUViSzFlZTI2V2JO?=
 =?gb2312?B?VHBxb3JNTE9yRXZWTU1OcFhSWVByd0ViKzMwL3NMUEdtVjZ2K3o3OURkS0kz?=
 =?gb2312?B?eWhVbXFab1hDWm9EeUtHeEtxZUxUbkhlTytEL3dGSHZMT0ZxVjF0RkhkTXZY?=
 =?gb2312?B?a05nNFZLT3UwV0I5ejlkSVF6ZEF6Y3RWc0p5VDJCMi9vaTdPTGNzL1ptOVBx?=
 =?gb2312?B?OXcyWDNqUGNsZngveUx5UGJyd2t6aXNZcFpidmdJOTA5NmZzNDJLZzdMNGJt?=
 =?gb2312?B?UlBxYkxsa2dYQzUxVkNHWWVkTCtiL3M0c1BvZUY3TkVhOUFpR2Rrblh4cGZx?=
 =?gb2312?B?cGtOOFNLS2Jjc1NVYjhMWnBtWXNJSGtyYzZWZFBYSlprMndIUWdjclZUem95?=
 =?gb2312?B?TnF4emRVSWlwZWRZWEx0VmdqRWY0OWN3aXNlNWhJYVpab3ZXZmNXTnV3RUVh?=
 =?gb2312?B?YjNtZmtYcjZrWkpJbFJWTEltU2U2Zm0vQk43WFVLNG4ycWh2amY2NTVJQklK?=
 =?gb2312?Q?Eaj8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4a135a-1137-4c40-c9d4-08dd9145879e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 11:09:57.0201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGO3cz7UjhyA4Mcq0RcCfxwWnE+7kNjMO8uCwpzuItN3/nlW5fCq38J4Ep8jqt/XqBwcUiCmjXpe6xzXJEwBYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_041005_615641_55BAF175 
X-CRM114-Status: GOOD (  33.57  )
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQcmF0eXVzaCBZYWRhdiA8cHJh
dHl1c2hAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyNcTqNdTCMTLI1SAxNzozNQ0KPiBUbzogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4gQ2M6IFByYXR5dXNoIFlh
ZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPjsgVHVkb3IgQW1iYXJ1cw0KPiA8dHVkb3IuYW1iYXJ1
c0BsaW5hcm8ub3JnPjsgTHVrZSBXYW5nIDx6aW5pdS53YW5nXzFAbnhwLmNvbT47DQo+IGJyb29u
aWVAa2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtbXRk
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmc7IG1pY2hhZWxA
d2FsbGUuY2M7DQo+IHAueWFkYXZAdGkuY29tOyByaWNoYXJkQG5vZC5hdDsgdmlnbmVzaHJAdGku
Y29tOyBCb3VnaCBDaGVuDQo+IDxoYWliby5jaGVuQG54cC5jb20+OyBIYW4gWHUgPGhhbi54dUBu
eHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDYvNl0gbXRkOiBzcGktbm9yOiBjb3Jl
OiBhdm9pZCBvZGQgbGVuZ3RoL2FkZHJlc3Mgd3JpdGVzDQo+IGluIDhELThELThEIG1vZGUNCj4g
DQo+IFtTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdl
dCBlbWFpbCBmcm9tDQo+IHByYXR5dXNoQGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGlt
cG9ydGFudCBhdA0KPiBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRp
b24gXQ0KPiANCj4gT24gTW9uLCBNYXkgMTIgMjAyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToNCj4g
DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBPbiAwNy8wNS8yMDI1IGF0IDA5OjQzOjI1IEdNVCwgUHJh
dHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4+IEhp
IEx1a2UsDQo+ID4+DQo+ID4+IE9uIFR1ZSwgQXByIDI5IDIwMjUsIFR1ZG9yIEFtYmFydXMgd3Jv
dGU6DQo+ID4+DQo+ID4+PiBPbiA0LzI5LzI1IDEwOjAzIEFNLCBMdWtlIFdhbmcgd3JvdGU6DQo+
ID4+Pj4gSGkgUHJhdHl1c2gsDQo+ID4+Pj4NCj4gPj4+PiBJJ20gZm9sbG93aW5nIHVwIG9uIHRo
aXMgcGF0Y2ggc2VyaWVzIFsxXSBBdm9pZCBvZGQgbGVuZ3RoL2FkZHJlc3MNCj4gPj4+PiByZWFk
LyB3cml0ZXMgaW4gOEQtOEQtOEQgbW9kZS4gV2hpbGUgc29tZSBvZiB0aGUgc2VyaWVzIGhhcyBi
ZWVuDQo+ID4+Pj4gbWVyZ2VkLCB0aGUgcGF0Y2ggNC02IHJlbWFpbnMgdW5tZXJnZWQuDQo+ID4+
Pj4NCj4gPj4+PiBJbiBmYWN0LCB3ZSBhbHNvIGVuY291bnRlcmVkIHNpbWlsYXIgcmVhZC93cml0
ZSBpc3N1ZSBvZiBvZGQNCj4gPj4+PiBhZGRyZXNzLyBsZW5ndGggd2l0aCBOWFAgRlNQSSBjb250
cm9sbGVyIChzcGktbnhwLWZzcGkuYykuDQo+ID4+Pj4gQ3VycmVudGx5LCB3ZSBoYW5kbGVkIHRo
ZSBvZGQgYWRkcmVzcy9sZW5ndGggaW4gdGhlIGNvbnRyb2xsZXINCj4gPj4+PiBkcml2ZXIsIGJ1
dCBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGEgY29tbW9uIGlzc3VlIGluIHRoZSBvY3RhbCBkdHIN
Cj4gPj4+PiBtb2RlLiBXYXMgdGhlcmUgYSB0ZWNobmljYWwgcmVhc29uIGZvciBub3QgbWVyZ2lu
ZyB0aGUgY29yZSBsYXllcg0KPiBzb2x1dGlvbj8NCj4gPj4+DQo+ID4+PiBJIGd1ZXNzIEkgc3R1
bWJsZWQgb24gdGhvc2Ugc21hbGwgY29tbWVudHMgYW5kIGRpZCBub3QgY29uc2lkZXIgdGhlDQo+
ID4+PiBncmVhdGVyIGJlbmVmaXQgb2YgdGFraW5nIHRoZSBwYXRjaGVzLiBObyBvbmUgY2FyZWQg
YW5kIHdlIGZvcmdvdA0KPiA+Pj4gYWJvdXQgaXQuIFBsZWFzZSBhZGRyZXNzIHRoZSBjb21tZW50
cyBhbmQgcmVzdWJtaXQuDQo+ID4+DQo+ID4+IFllcywgaXQgc2hvdWxkIGhhdmUgYmVlbiBhIHNp
bXBsZSBuZXh0IHJldmlzaW9uIGZyb20gbWUgYnV0DQo+ID4+IGFwcGFyZW50bHkgaXQgZmVsbCB0
aHJvdWdoIHRoZSBjcmFja3MuIEkgZG8gc3Ryb25nbHkgYWdyZWUgdGhhdCB0aGlzDQo+ID4+IHNo
b3VsZCBiZSBkb25lIGluIFNQSSBOT1IsIGFuZCBub3QgaW4gY29udHJvbGxlciBkcml2ZXJzLiBT
byBpdCB3b3VsZA0KPiA+PiBiZSBncmVhdCBpZiB5b3UgY2FuIHJlc3BpbiB0aGUgcmVtYWluaW5n
IHBhdGNoZXMgb2YgdGhlIHNlcmllcy4NCj4gPg0KPiA+IFRoZSBmYWN0IGlzIHRoYXQgd2Ugd2ls
bCBoYXZlIG9jdGFsIERUUiBzdXBwb3J0IGluIFNQSSBOQU5EIGFzIHdlbGwgYXQNCj4gPiBzb21l
IHBvaW50LCBoZW5jZSBhIGNvbW1vbiBzb2x1dGlvbiB3b3VsZCBiZSB3ZWxjb21lIGFzIHdlIHdp
bGwgbGlrZWx5DQo+ID4gZmFjZSBzaW1pbGFyIHByb2JsZW1zIHdoZW4gcGVyZm9ybWluZyB0aGVz
ZSB1bmFsaWduZWQgYWNjZXNzZXMuIEkNCj4gPiBkb24ndCBrbm93IGhvdyBmZWFzaWJsZSBpdCBp
cyB5ZXQsIGJ1dCBpZiB3ZSBoYXZlIGEgZml4IGZvciBTUEkgTk9SLA0KPiA+IHdlIHdpbGwgbmVl
ZCBzb21ldGhpbmcgc2ltaWxhciBmb3IgU1BJIE5BTkQuDQo+IA0KPiBUaGUgY29tbW9uIHNvbHV0
aW9uIHdvdWxkIHRoZW4gcHJvYmFibHkgYmUgaW4gU1BJIE1FTT8gU2luY2UgeW91IG5lZWQgdG8N
Cj4gbWFrZSBzdXJlIHlvdSBkb24ndCBkbyBhbiBvdXQgb2YgYm91bmRzIHJlYWQsIHlvdSBuZWVk
IHRvIGtub3cgdGhlIHNpemUgb2YgdGhlDQo+IGZsYXNoIGF0IGxlYXN0LiBUaGF0IGlzIHJlY29y
ZGVkIGluIHRoZSBkaXJtYXAgb3BlcmF0aW9ucywgc28gcGVyaGFwcyB3ZSBjYW4gaGF2ZQ0KPiB0
aGlzIGxvZ2ljIGluIHNwaV9tZW1fZGlybWFwX3tyZWFkLHdyaXRlfSgpPyBIYXZlbid0IHRob3Vn
aHQgdG9vIGRlZXBseSBzbyBub3QNCj4gc3VyZSBpZiBpdCB3b3VsZCBlbmQgdXAgYmVpbmcgYSBn
b29kIGlkZWEuDQoNClNlZW1zIHJlYXNvbmFibGUsIEkgd2lsbCBoYXZlIGEgdHJ5Lg0KDQpSZWdh
cmRzDQpIYWlibyBDaGVuDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiBQcmF0eXVzaCBZYWRhdg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
