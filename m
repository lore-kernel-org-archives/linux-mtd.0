Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A00C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2024 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzzZ6smeFf7qg6GUQZroc8htXp0eXEjvYOzrr+Koo0g=; b=wmEoXlG7uI29d5
	XGjTSuz74nTSY2cae39b0YI6M7aC/T0v+7AMTmMEtLql9papVOt1+tqVrRhLzZBTLpWJ0D31nRahn
	g1iKqc/pDDz3Zvh1Q8EN9w7N8p7zDKaD65/BRq5kiFza3g5537JksiJGr7+I4ftMrPk2CW/5D8j35
	pJxDAz4pOL+IJp5O3/2xOT5U+RzFdNPZxvN0MXX9Alq87+0aRoTdZUiltuqVFDpgUZeECYKL358Tr
	j4/8hS+nKDJchLYvJzFUEDV8VZk1zd6CSn5HKnsYuefXhI8VMmqMGLBXwwynh1PSuZ74U7pxw0i+C
	sUL40V199gB1kFsF0+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZS7P-00000004ZZ5-1Nb7;
	Thu, 01 Aug 2024 09:29:07 +0000
Received: from mail-mw2nam12on20615.outbound.protection.outlook.com ([2a01:111:f403:200a::615] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZS7M-00000004ZXH-0R7d;
	Thu, 01 Aug 2024 09:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gxr9bufmguws7N32hTNnZY/GV8EAKqJxHoaS8dELEhaxzsaD9B48gjysmKHNKQVJSiwoYTiXKfYxWY8igdCuEl/WD/SIaWiDX6RFpT+RgYpl33IszH5AidvKpKNy+hcIRBIfIeYGyZfqwq+NwGlq+cEz2bcfhLD2ISqKRu7YCO8jsqwnI23P/51eUf12NQGhJLRpJ6jV3Tf5DquWSyslIqtdzK0qi+98S3RbVlhdUrVx91OkVceGDhA9stXPcBcb5z3Hbu9qiNx4aUn2ARjWF7dqAQryG06S1gdRpZ18ygZUD8HZ2UI2usKY0k6jWx9wNOO43v8OiFYOi38uOx1fbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yTwxZjqqKCwVAhfoxzraX2VmtjsROdKY8j4yd0IydY=;
 b=lBqQzkqkSdIBGfJeeCSR3UImhLJU1lj8kgdP8pHe7RyPb/sk22jfjOyPkiSCOMNIpF9ZrCdFMHeuCi+CaFNBcd4dE3QNWDtB6Fk4KFyvwdXGbsyL6nBAxdl58v7VQOa4Pmy/GaHS3M+KTB5ND9jc/m/cbPwRqqjx/IeqLRFIBPjZdyAKSw3WPmpCuoBqL2wJB9CfGjYH+VIORVAwUt4MmrK4iUJA9RY7LYYobRfQe8FiV6MbGI6rONpmxYsHsKVz+GD3IbRTZe3HzgPrHA8gChuozykpgpY9GfhcheZaMJNv9IiZqXsLJE7hYUxsPs8gM+w6wp6MU9V7y+o5XWBrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yTwxZjqqKCwVAhfoxzraX2VmtjsROdKY8j4yd0IydY=;
 b=wf9hDHpo4cNL/0Pp6Sh3zb1sRbPCVACCqyUd5bTXfQicMyk9UAOTmg1sn2RMqszVVe5rjFA5MR48vV+BLUJ8AaSgDHx9D7falLp2QChu0tolAJHEzogXxSy6jAD2bXaXsokqWCWYk1dVE0ceyah6pvOUKoPKn5PPWkAzBy94yPA=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:28:54 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%2]) with mapi id 15.20.7784.029; Thu, 1 Aug 2024
 09:28:54 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: "Frager, Neal" <neal.frager@amd.com>, "Simek, Michal"
	<michal.simek@amd.com>, Michael Walle <michael@walle.cc>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
	<sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
	"james.schulman@cirrus.com" <james.schulman@cirrus.com>,
	"david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
	<conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: RE: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Thread-Topic: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAEJ+aCABhoaAIAAMcLwgAAzdICAADdZAIABtmWAgAQ4ECCAAAuVAIAAD5dQgAAYdQCAAAF/8IAGJHEAgAFe7KCAUIcDAIAAVewAgDPXogCA08cW0IAAMZYQgAeZXQCAAAXAgIAASRyAgAAIfoCAAQ9HgIAABEkAgAAvb2A=
Date: Thu, 1 Aug 2024 09:28:54 +0000
Message-ID: <IA0PR12MB7699BCDB5538F659F7D12CF9DCB22@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
 <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
 <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
 <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
 <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
 <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
 <e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
 <D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc>
 <9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com>
 <D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc>
 <c01d048f-ad8b-417e-8ff0-96f9252c87f2@amd.com>
 <CH2PR12MB50044242FE253D7B0E3425ABF0B22@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50044242FE253D7B0E3425ABF0B22@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|SA1PR12MB7245:EE_
x-ms-office365-filtering-correlation-id: 76c42393-6f04-4b37-3a22-08dcb20c5cd9
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OWF3RGdJa2FOS1E0VzcwM3cyMitHN0xoSC95a21nV3Zqb2w0L28wZFNBUWpT?=
 =?utf-8?B?YVc2WUJXMklNOXhqNi9jZDZwYU1ZZzlFV242enFUeVB2VWlCSzlDTm84VFA1?=
 =?utf-8?B?SkdZQ2FGMXNoU3kxVGFZMGFBL3IyMVlidjVlTlBXNjRDY1BVb2pKazg5UXVs?=
 =?utf-8?B?TGkwNHZtdHgwanhLQ2pra1dtMW0xYWYwbzZUa1BGTC9DKzZmQ2pZWXkydDVv?=
 =?utf-8?B?bUdkTGkwN1lVeWxHWW8vcVlaSTNaaTBidFdoZ1dLRktTWmdIQkdnMTJqbDVS?=
 =?utf-8?B?Tzl4dmVJQ3R2aWlITGljMGsrbG1OTnQ0VG51RWYwTmZtdm9WSVRmdXRUNlpD?=
 =?utf-8?B?djFiWXVoTzVtR2VxcFQ0ZU5WY3kvRSt5ajhRYTUwNi9vQnk3dXkwMVRueWNr?=
 =?utf-8?B?WXVrNW1jeG51SkJCWmlTdEFiRG1YTGFpWE4yTjVGTVIrd2svTDBYbisrSVZI?=
 =?utf-8?B?Y2Jod3BFSVVSZG9Fa3Z6dXRoeFlIcDNTVkU4eW1wMTZpazhUOW5TMHV2L2Nv?=
 =?utf-8?B?eWFtV2ZCOHlpUTFPTVBpK01ucGwxSlFrbnhsZDl6czI1dXA1YmdFdXREcWcx?=
 =?utf-8?B?OGk2blNaZDl2TkxxZU1KRCsxOUd4Q0dzQkhWWVBPRXhmbnNWdUxlQnJ0VXYz?=
 =?utf-8?B?RExodWQ1aVNOOWkydlJNUGNJQVpSK1FERTR5bjd5OHRjU1dHeU1nWEsxaVpp?=
 =?utf-8?B?cjI2aWxSV0hWcWhEeUcvOXBtMTIvVSt3WjdMWWR0dEI2Snh6M050VkVKSVU5?=
 =?utf-8?B?cDRQK3laTXEvSm1oSWYwaDQ5cnJKQllBY0lOcUd2ckR6eWxqbjZwbVBuY2Mv?=
 =?utf-8?B?R2p1N2s4Y0ZnWHZTSGRBRFk5NDVuRnU1dkNQMmRkd1RDVzVudGdXV053U2JF?=
 =?utf-8?B?VWFmVXpGTjJQY1JNdXdoWUxOOHVqSWdQa3Rqb3p6RUdiYWxUVmZ3aC83TFAv?=
 =?utf-8?B?cjhQUEM4ZTVuQ3puUE1PM2IvWXNtd2lkNmRmbXNSL3FqRUd0Nnh3OGFTSGcx?=
 =?utf-8?B?bHpWSmJpUmVFVzl4OFd1ZWVrYXV2RExDTy9zbm8rZXBPMERiclNCOGFDUnhT?=
 =?utf-8?B?TEZwVWZwcmpOVEs4TW5EeGlEdGdlaTV0dXdpTElSeWxIMnFxcTZRWjFGcTk4?=
 =?utf-8?B?ZER5bTFsZ3VsWmZjUDFYSzhnaU9oZm5ua1VLbHNpdXFvZGdOSTRPb05Xd0sr?=
 =?utf-8?B?d3p3TnFzczZwRk4zWjB2OUt1bEFHODZpVktZVS8zY2NVd1Z4VDgxdFBIblEx?=
 =?utf-8?B?Z1daOWpFOHJnaUdGYStYbFY0NG43cjNlaFYxVDYzaks4eHMxTWhBaURwZ0dR?=
 =?utf-8?B?eS9XLzRXR2ZIZ3RjQm1ldXh2RjlkL0trRkluSnVGMWNqS2RaNVpHdlhrSW5y?=
 =?utf-8?B?L083UEdmN2JvS21lSW54NDl0a0JYQVdIOWdpaklVS0NXeG5Sd05nbTdkSUZ6?=
 =?utf-8?B?SytDUlpVY0lEU2JlQ0x6WEp0K1FUUXdSYmF1MVlMMHR3SUNudU9aU2xGOXpv?=
 =?utf-8?B?Um91VCtwaEpvUFhDNjJsSUhhWi9rRjVCMGNKUENvZmhtY3ovT29qYkpFM3NL?=
 =?utf-8?B?em5sSXRoSWFtRStzazBDdDNSYkw5Umtrb3lzSmpuUWJoakRjdnRiRlJGZG5q?=
 =?utf-8?B?bjMzaEJMY1hxemRwUjdEWGZ3QTZIQUNDcEtVN05TdFBpOEEvQWZwb0RFNTBv?=
 =?utf-8?B?TnNOWE1KdU93aVdBbExtZ3BsWk91MXVaQzUweHhoSk8yZWIxUmEzVzNIdnR5?=
 =?utf-8?B?Wlh0TUZDZnZiZjFyc0ViekhGYm9Kc0Q2WkNGOGozWXRsSmxJSmIvc3Q1R3Vk?=
 =?utf-8?B?bFlHVm1FVTBVcE9qcGNSWXhpMWM0eVJjdTU0NTk5NDdjelY5YVJsNHM4ZGsw?=
 =?utf-8?B?R0NtVlltTmZVTFVnZ1pUTkNHbmErR2grY20vWmR6N3JvRk9venVwc3BaSTFU?=
 =?utf-8?Q?fv/CKlf0mZ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHJ2bzJYQlhXN05HQ1N6SXYrbENZK3JwVXU4MytyMEszNWRYSWpIMk9EQTdz?=
 =?utf-8?B?bDhKZG9xNzFrU2pVTGlGdkNSN0FBdDM0K3VQN3BkN3NuNFVxVk0zYWIvUFI4?=
 =?utf-8?B?elZrMFp4dTBPUjJRdVZ2Tll0S1dkYVhRbURDaDVUcUJQV2ZUQWJTbTdmZm4z?=
 =?utf-8?B?Vk1Wa3ZZM3F0TUtCalRBWWFpVUdBU2U0dldkVHRET1NTUlVOSEVIZGIvYkEr?=
 =?utf-8?B?QW81STEycDNYM3kxYlVCRDNKTGloSStlOWt5VytFWWRiODA4cHhhSXcrRW5y?=
 =?utf-8?B?QmttM2xjeFdSRWdxTHJWeWhTdFJaS2YycC9FY05FSHZiNzVWS2hhejVSdmNB?=
 =?utf-8?B?WURwOVp4dEpma0RsbTFUb3pRQlYvbG9JcXo1czc4dlp1SXNrTHBOZTFaY1R1?=
 =?utf-8?B?eE5MT0U1OHpwZ2pUUXNKRDB3NndzOFlIcWdlNGw2Q3haMUFMcWtkelNjTTcx?=
 =?utf-8?B?Y3hmakxVOHpGRFRnemQ2bDhIOWlmV01VZW0zZkRXdXpWR2tKaWNiNkVGU1hG?=
 =?utf-8?B?NmtlN2lJbTNVdU16RFEvb3gwZUhUSzdYa09JdzJTV0FnV3dUd1MwSXZreHJv?=
 =?utf-8?B?REowTmtST1haL0dOcVhDTE5RTWhlUi9vZG1iNXpLL3QySWRRN0l5c1JWd2dj?=
 =?utf-8?B?N0QzYjRDOEJpZFh3TnYxenNjQklsT2IxSHlEL29KUm1ObUNacU9PUzc4bHly?=
 =?utf-8?B?OWRpNmRmeEhsdlRrR2gxOHFRandQZmNFTUQ3T2E3dU81dlJyM2lhRC9XMnpU?=
 =?utf-8?B?U0ZFWmlmMEIvUXVGcW9qN3c3SEZJMmhnRWhmS3gvSnZyMXVOcXBhdWpseE1H?=
 =?utf-8?B?UHBINzRmb2dLdFl4cjJmclBGbnJBbkt1dHYwdE8wZEtIZUtVSmoycGtYYzhM?=
 =?utf-8?B?OGUxRWhxd1BUenhlRmFUS2tZZ0FxZHkybFhnK05oRW84T1Fqa3RCZEI1OE82?=
 =?utf-8?B?OEs3NEVSUi9LQ3J2VjFCZGhKMk1oZ25pSUNTVkl0NHRHYXlRcG5EUUFSN0Fx?=
 =?utf-8?B?eW9CRVhmeHFzbURpVEZrZXUraVA2b1Rib2hJRU5SZFZEeDB5OUgyU2dXd2ZG?=
 =?utf-8?B?c05EZjBvclJUelRIaWNXR2FTV0duQloyQ1Z6b2FhaDFKMGp2aUxZL1dGQUxP?=
 =?utf-8?B?RTlLcHRBSGlyWXFGZlBGeUZxWmozWHZhUDQrMm1mU3dUejR5NWRib0dXSkow?=
 =?utf-8?B?UldtUGNSU2FhNzZpSjVyM3Z5VkNVaE1SVC9MZ1dkMS85c25ITEs3VFFFMEZR?=
 =?utf-8?B?TXEra0hRc0w4RUhudThCdU8zMGIvd1Fvd2dYMUdMV2g1Si9TNDIxQ0U4RjhN?=
 =?utf-8?B?SG5wc0RZZXdrbkRYam1PSU5hR1lVTEw1dk1PWC9XaWxNYXUrU3J6eVhkd2My?=
 =?utf-8?B?WWpIcDlvaDlCRWNEZXU3d1FzSzA1NGhXRU9qK0xtWW9DTEVpMWU1R3JjK0N3?=
 =?utf-8?B?RDVtaFgrSWdBbjJURlpENUlrSDlCUDFFU2N3T1BwZjZMbUE3YVNvSkFYYW5v?=
 =?utf-8?B?Q2VIVzdYcWlkeTRPWVU2cVlPZkx6Z09kSHNXQlRDYmh1QUY4Qzg0NWprcGM5?=
 =?utf-8?B?NEtCNTA4eE1aQnY0MTdMNXZqK2hvNForQWxsTE4xc3NPZ1lPK3FCYkV0eGo0?=
 =?utf-8?B?eTZxeERCRklSdHVYNmErQjQrZ21JdEY4TUVPKzlWYjRpYUxObWFUcjhZTERX?=
 =?utf-8?B?S0s2RWZjOW0vMGNUTnJiZ1RFbVFvWmZZckhxc3ZPaTlTWWhYeFVtOGFBWlV5?=
 =?utf-8?B?cHpPRG9iTGVVL1hEc1ZBSGtwWFE0K2RKUDBJZUxFT2gvRWc1RzFtQVg5NGVP?=
 =?utf-8?B?K0RjQ2crVlJyTC9QaWNxa2liYU9DZTd6VFJGdGFBbHhmbG40cEp1TkdwdlJU?=
 =?utf-8?B?aG9TWmFORXpaNXcrL2J0STNUdkJiNy9OMk5qb3d0SlF2UWNtcTNZa0J0SVJ2?=
 =?utf-8?B?RGdPbnZlUlUyd2w3WlVJeUFIWWdkMkM2WEhSbE9PZzFOelFLdktiV1lpMHE0?=
 =?utf-8?B?dlR6a3VYb3BpQUl1S2RsZVQ0ajVqdTUya21yNEp5MTkyZmJEVXFpcVdNNnh6?=
 =?utf-8?B?SStSNTc2UWdmU1dWOVJ6VjQ3anFXMTJzTlRRc0VMTXdVdUVwMVdjSnU3T3Rj?=
 =?utf-8?Q?zFj8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c42393-6f04-4b37-3a22-08dcb20c5cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:28:54.6819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GC4VMxc35i7OkVpeBqpY4LmeA5N1R9QDmtuUHlvqrntmaNweWC1alr1RiB5unkvt+QXgviqRK+xIXGfJedhuQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_022904_212918_976B17CB 
X-CRM114-Status: GOOD (  20.26  )
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

Hello,


> -----Original Message-----
> From: Frager, Neal <neal.frager@amd.com>
> Sent: Thursday, August 1, 2024 12:07 PM
> To: Simek, Michal <michal.simek@amd.com>; Michael Walle
> <michael@walle.cc>; Mahapatra, Amit Kumar <amit.kumar-
> mahapatra@amd.com>; Tudor Ambarus <tudor.ambarus@linaro.org>;
> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> mtd@lists.infradead.org; nicolas.ferre@microchip.com;
> alexandre.belloni@bootlin.com; claudiu.beznea@tuxon.dev; linux-arm-
> kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com; Conor Dooley
> <conor.dooley@microchip.com>; beanhuo@micron.com
> Subject: RE: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
> in spi-nor
> 
> Hi Michael,
> 
> >>> All I'm saying is that you shouldn't put burden on us (the SPI NOR
> >>> maintainers) for what seems to me at least as a niche. Thus I was
> >>> asking for performance numbers and users. Convince me that I'm wrong
> >>> and that is worth our time.
> >>
> >> No. It is not really just feature of our evaluation boards. Customers
> >> are using it. I was talking to one guy from field and he confirms me
> >> that these configurations are used by his multiple customers in real
> products.
> >
> > Which begs the question, do we really have to support every feature in
> > the core (I'd like to hear Tudors and Pratyush opinion here).
> > Honestly, this just looks like a concatenation of two QSPI
> > controllers.
> 
> > Based on my understanding for stacked yes. For parallel no.
> 
> > Why didn't you just use a normal octal controller which is a protocol
> > also backed by the JEDEC standard.
> 
> > On newer SOC octal IP core is used.
> > Amit please comment.
> 
> > Is it any faster?
> 
> > Amit: please provide numbers.
> 
Here are some QSPI performance numbers comparing a single flash mode and 
two flashes connected in parallel mode. I ran the test on a VCK190 Eval 
Board https://www.xilinx.com/products/boards-and-kits/vck190.html, 
measuring the timing for mtd_debug erase, write, and read operations. 
The QSPI bus clock was set to 150MHz, and the data size was 32MB, 
comparing a single flash setup with a two-flash parallel mode setup.

Single Flash mode:

xilinx-vck190-20242:/home/petalinux# time mtd_debug erase /dev/mtd2 0x00 0x1e00000
Erased 31457280 bytes from address 0x00000000 in flash

real	0m54.713s
user	0m0.000s
sys	0m32.639s
xilinx-vck190-20242:/home/petalinux# time mtd_debug write /dev/mtd2 0x00 0x1e00000 test.bin
Copied 31457280 bytes from test.bin to address 0x00000000 in flash

real	0m30.187s
user	0m0.000s
sys	0m16.359s
xilinx-vck190-20242:/home/petalinux# time mtd_debug read /dev/mtd2 0x00 0x1e00000 test-read.bin
Copied 31457280 bytes from address 0x00000000 in flash to test-read.bin

real	0m0.472s
user	0m0.001s
sys	0m0.040s

Two flashes connected in parallel mode:

xilinx-vck190-20242:/home/petalinux# time mtd_debug erase /dev/mtd2 0x00 0x1e00000
Erased 31457280 bytes from address 0x00000000 in flash

real	0m27.727s
user	0m0.004s
sys	0m14.923s
xilinx-vck190-20242:/home/petalinux# time mtd_debug write /dev/mtd2 0x00 0x1e00000 test.bin
Copied 31457280 bytes from test.bin to address 0x00000000 in flash

real	0m16.538s
user	0m0.000s
sys	0m8.512s
xilinx-vck190-20242:/home/petalinux# time mtd_debug read /dev/mtd2 0x00 0x1e00000 test-read.bin
Copied 31457280 bytes from address 0x00000000 in flash to test-read.bin

real	0m0.263s
user	0m0.000s
sys	0m0.044s

Regards,
Amit

> > Do you get more capacity? Does anyone really use large SPI-NOR
> > flashes? If so, why?
> 
> > You get twice more capacity based on that configuration. I can't
> > answer the second question because not working with field. But both of
> > that configurations are used by customers. Adding Neal if he wants to add
> something more to it.
> 
> Just to add a comment as I work directly with our customers.  The main
> reason this support is important is for our older SoCs, zynq and zynqmp.
> 
> Most of our customers are using QSPI flash as the first boot memory to get
> from the boot ROM to u-boot.  They then typically use other memories, such
> as eMMC for the Linux kernel, OS and file system.
> 
> The issue we have on the zynq and zynqmp SoCs is that the boot ROM (code
> that cannot be changed) will not boot from an OSPI flash.  It will only boot
> from a QSPI flash.  This is what is forcing many of our customers down the
> QSPI path.
> Since many of these customers are interested in additional speed and
> memory size, they then end up using a parallel or stacked configuration
> because they cannot use an OSPI with zynq or zynqmp.
> 
> All of our newer SoCs can boot from OSPI.  I agree with you that if someone
> could choose OSPI for performance, they would, so I do not expect parallel or
> stacked configurations with our newer SoCs.
> 
> I get why you see this configuration as a niche, but for us, it is a very large
> niche because zynq and zynqmp are two of our most successful SoC families.
> 
> > I mean you've put that controller on your SoC, you must have some
> > convincing arguments why a customer should use it.
> 
> > I expect recommendation is to use single configuration but if you need
> > bigger space for your application the only way to extend it is to use
> > stacked configuration with two the same flashes next to each other.
> > If you want to have bigger size and also be faster answer is parallel
> > configuration.
> 
> 
> >>> The first round of patches were really invasive regarding the core
> >>> code. So if there is a clean layering approach which can be enabled
> >>> as a module and you are maintaining it I'm fine with that (even if
> >>> the core code needs some changes then like hooks or so, not sure).
> >>
> >> That discussion started with Miquel some years ago when he was trying
> >> to to solve description in DT which is merged for a while in the kernel.
> >
> > What's your point here? From what I can tell the DT binding is wrong
> > and needs to be reworked anyway.
> 
> > I am just saying that this is not any adhoc new feature but
> > configuration which has been already discussed and some steps made. If
> > DT binding is wrong it can be deprecated and use new one but for that it
> has be clear which way to go.
> 
> 
> >> And Amit is trying to figure it out which way to go.
> >> I don't want to predict where that code should be going or how it
> >> should look like because don't have spi-nor experience. But I hope we
> >> finally move forward on this topic to see the path how to upstream
> support for it.
> >
> > You still didn't answer my initial question. Will AMD support and
> > maintain that code? I was pushing you towards putting that code into
> > your own driver because then that's up to you what you are doing
> > there.
> 
> > Of course. We care about our code and about supporting our SOC and
> > features which are related to it. It means yes, we will be regularly
> > testing it and taking care about it.
> 
> 
> > So how do we move forward? I'd like to see as little as core changes
> > possible to get your dual flash setup working. I'm fine with having a
> > layer in spi-nor/ (not sure that's how it will work with mtdcat which
> > looks like it's similar as your stacked flash) as long as it can be a
> > module (selected by the driver).
> 
> > ok.
> 
> Best regards,
> Neal Frager
> AMD
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
