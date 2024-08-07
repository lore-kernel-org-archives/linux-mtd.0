Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04811C3DA7F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2024 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgOMbHcnvUkhns5Vgq61sQqA2JYoDFCTgvrXFbV3eI4=; b=c0dltJHVmnLVM7
	3ej+Kw+NJ7FvEaz5A9U6q6491Q3G6egng7KZXLunQiMruv3vC5zCqNdy3F6dVyboPscgtuSdfWASv
	F02eONJqNRuRPRmlnc+oDXmsmMKpbPgSizQ6f6XxsOr1As6BO/9BC0kCVyZ/cfrgdDdbqlYOELml1
	90Fs/TLUWK1mmW1WEQUxNE8UTFkr+eYi9h43v1vD0I27a6nrVz+UsJz3PKe4ZoAUlRHVrhQnECzUG
	zgJcPO6dg4UdFgLapn4ZocbpyLOLYyaR7BZ9HvC4jBg6zbeQnVPbcfTkOuU1lyFjmKEzAl8nuFR07
	9k7hC6FhKHu1Feh98/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgbo-000000057Zv-4BSt;
	Wed, 07 Aug 2024 13:21:45 +0000
Received: from mail-bn1nam02on20605.outbound.protection.outlook.com ([2a01:111:f403:2407::605] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgbM-000000057PJ-0FaK;
	Wed, 07 Aug 2024 13:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHIiaKVwfiFyjAxzAfGRWK+hJuj8qWbSp7EGr4+BDCedORzLTqmXyuH1opqfwvyxDoKBPP5RbFeX0gY2VVVqtoPC1D0Ok9/6C5m2fFMRr374yj+D5LrRLQCUjXwV6aYFp9ESNkkgsgEw+xGY0L84wnr2KwWJ2ekvKSKBmWS5d3i0G5BnS7IfTuKRaXPj8Gdyf0ivfgUgT1EusctFXdVLcyhWbDT44eUXLcd2a/4GdMODRKT03hNWiOPLEZnoYQ/QCaCTzw/5MVpNifO6DKqrNMv+rk8DLyjDxmXOeFpeUYd7+5jTNo5Hkto/m/fPTG9u/y7Uh5U4yM2KmN31N3ue5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRmsd9Bx1AkjAQh/zysJO/ZaX6TOC6wjtp+ypOB8BvE=;
 b=HIBmwF0wMbna2j6JpkslRJe7ZeOpsEHCqmE928ZKNrhNrrPosu92HA5GhGZKfijOconuf9OMf/KBJKM6+4F3wnUU+FNqzFLXKgWzie8eMNpccgEsS+dS1HDmOr9NBNY1n/fCr1zpEPce84H8YKtCFQDHfHsEaLPafse9bla1iSkELL0XLXsNnDkvJevcxSTUw9ektJKVqJVWegBA4vWIV/oGYYQUtPs5dJPttbSFgI/qpImUQ0B8T0fH4/cbHIq/wX019bX61VBUOxBz3wSXUj671PuiYQoP1Ma2+MbdPS+2qSLCEwwUGHb92IEpOgOzgvQpKAxWHGFdI24pLmAT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRmsd9Bx1AkjAQh/zysJO/ZaX6TOC6wjtp+ypOB8BvE=;
 b=wSAYTvyWkBimVfkqJFarSxHSjCGtLyhHqqEOFk/AXOuMHVYwEddT2qbDaqiYCxdt0V+gPEgrOUDkN3C/vKLa8o7nO5g9ldDHsFhF3wk6LVLvbUDeNLah6ch52aonyJOC0A9ivqZyqwaXCNuP2S9J0h80RtOyUH1sJ3qvdGYf4fY=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 7 Aug
 2024 13:21:09 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%2]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 13:21:09 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: "Simek, Michal" <michal.simek@amd.com>, Michael Walle <michael@walle.cc>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
	"lee@kernel.org" <lee@kernel.org>, "james.schulman@cirrus.com"
	<james.schulman@cirrus.com>, "david.rhodes@cirrus.com"
	<david.rhodes@cirrus.com>, "rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "Frager, Neal" <neal.frager@amd.com>
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
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAEJ+aCABhoaAIAAMcLwgAAzdICAADdZAIABtmWAgAQ4ECCAAAuVAIAAD5dQgAAYdQCAAAF/8IAGJHEAgAFe7KCAUIcDAIAAVewAgDPXogCA08cW0IAAMZYQgAeZXQCAAAXAgIAASRyAgAAIfoCAAQ9HgIAGbHuAgAAqsgCAAXoMUA==
Date: Wed, 7 Aug 2024 13:21:09 +0000
Message-ID: <IA0PR12MB7699E1DA855A3C15F2749109DCB82@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
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
 <D37U3QPX0J5J.21CTXMW2KC72G@walle.cc>
 <1b726ef7-e25c-4a19-aaa8-77fdbdd8bcca@amd.com>
In-Reply-To: <1b726ef7-e25c-4a19-aaa8-77fdbdd8bcca@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|LV3PR12MB9214:EE_
x-ms-office365-filtering-correlation-id: d0b96c74-78dc-41d8-bb3d-08dcb6e3cce3
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?OGlpblZlMytYcTNOaUgwWjZvaFY4bEJNcWQ2K2F0bmNTM09PQXVzUEZ6N0lh?=
 =?utf-8?B?Y0xpZzR3NjRWdVJrTy9JdHBqSzVBTTdEN21wcE9tVzBCeDZYbXgxUGM1UjFr?=
 =?utf-8?B?ZEJ6VUowNlgvN1dmaUxhYUlZT3JxV1h5Vk1ja05aWGxwTlZwL3hkRVR0OVNi?=
 =?utf-8?B?eFNSQldtVVNhcHhFSm53UUoyNmFFY3dlSVJKK3lUbzlCd0NNTDZlcnc5NXBZ?=
 =?utf-8?B?YkxhK1lEd1BHWk1kUG5hb1FMbFNhY1g3VHZEblR1MkI1c01kNUJtR0RzdnlB?=
 =?utf-8?B?RStIT3hUWHdKd21zUFdxWFV0Ukg4cCs0MXM1Z08yR1Y4cktweENZZ0VXUUk0?=
 =?utf-8?B?cThGMVVMRWdYZTRzL3Y1Rkt6UklBZWdCTXhaQzIxNnRwVVJPZE5QZ1BtZEhL?=
 =?utf-8?B?OFpYVXo4Z0VKajg1VjVhZnJSYU1yNXJKU1lvcWpKRVFuS25rL3FTbjFCdlky?=
 =?utf-8?B?WUJpbjZUQVhUWXBsQUVPWmZHRWVKZ3JqV1EvQ2VzN0ExS1RiR2UyRG9UcmRU?=
 =?utf-8?B?TmhQeVdNdkw4ZzNOSlZSamJybEYxZXlmUFp3aHB3YXpBZ05Cd1RtbGM5WVNm?=
 =?utf-8?B?RXpkWnBIRFlrdS90a0xWb2R0eEZlZjMyUjNhSk5Oc1Z5NnUvVDBlZ2ZGbmth?=
 =?utf-8?B?Z1czS01VaHhjYzBpSHF2REtyYjhnWTArMUZZZlpoNDZ4K3ZTKzFRa2FMN29X?=
 =?utf-8?B?WmxLNW1sZi9JTFhadVk3aGVIZG0vUy8zNXhBYTdVL1NMdkdOdzM1MlMrQVpW?=
 =?utf-8?B?SlJuRGlpWHIvVGZ3MkU0NlZvTGZQTk0wbVQrUTIrMkhqb0x6dnBjN3BoYkVX?=
 =?utf-8?B?NE5jLysyMUVzd0ZwSzJ0UXdJSENzRk5KYSs5UDdPcHI2TVdPN2YwZGlsV3ky?=
 =?utf-8?B?dHJCaStQZ2sxd3ZHa3lQa0ZRcUdwYVNhVERwZ1h0RG1wZlc4UmFjZ2YxcHc1?=
 =?utf-8?B?ZEZmTCsyZFNqeFhYbnlaSHRxbEtlSHVNc2cxUnU2ZDBab2lnMW5sWjRSRGtq?=
 =?utf-8?B?RzgxUGpxVW1BWXFTeW1RbU1wK0JleStCTFpPKytZYVV2Vnk1SlEvMHpGdmI3?=
 =?utf-8?B?SHhZWUZoSnZnN3lnQmtHK21ma0dDV2pmaS9jMlArL1JDRjNjQTZ0eDl3Yld0?=
 =?utf-8?B?WGs5a3hHTlRMQnlCaFdnOWxGTExNWmk4cTZ6OWo2L0t0aGxNUUhrVzhsejF4?=
 =?utf-8?B?VCt1ZDdxeHBnOEh2eU1zUEVrK2xGT0JyUDVMVE0vY1dvSzY5VUwybkFiZEha?=
 =?utf-8?B?SllWcFd3RXV2RDlyUVdCQW02V3dVN0hubnZKc3pldnFEWDRvN2hjb3BCNmZN?=
 =?utf-8?B?Y2w2WUlBOE96cFRFN2crWUlod0NpZXloZE1zaVBvcEIyRUVUSXkzaVhMTXFi?=
 =?utf-8?B?aE5TMFpNVXB3ditPaUVSMzNWVkwwVHZrY3Bta1E2Z0cvUTJ4WHRCOGk0d043?=
 =?utf-8?B?V25JQ3dZM2VMWXFaZmNNelppVmtzcHJ3MEt1QXNmeURaWmRxSTdLZ2FPcGlv?=
 =?utf-8?B?ZThxdG8xL0Jld01qeHdtNkgwRUs5WC9nSjQ4QTc0UHN1VlNsaHN6ZEJyblp2?=
 =?utf-8?B?VW02M2JMekExSDFuQmdiR0NtZXI5bkx1eDlmZ1NscG5jWDArL3ppcDc2WkFE?=
 =?utf-8?B?MG9ET1NMdWpRTXVoY1lOQlJnZXIxMUxnSFRjT1I3UjJIU2luS3N2ZlNGSTFr?=
 =?utf-8?B?bnhBUUZIQjh1cTVaSFNYRkJXWjkxRGdzTEduUHRSYUJrbU0xa3ZtTDBTV0pC?=
 =?utf-8?B?SnpXRnhSUVgrSUtRWlRKVGx5UStnRkhVc3ZpWldzdHpvSlg4TXVrUitaa3JX?=
 =?utf-8?B?Wk1YNVo2QjlaYm1USjFBU0tlL2RjL3UxT1V2ZHFpZnE1OU9MN3ZSdU1kU3d3?=
 =?utf-8?Q?bE0WL8bgZTs4A?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dU1zdk1lcVVWMExlN3Z1WGEwUFlFd0Z4aHNPOFplaHJWNUJqUjVSNzZXelJ3?=
 =?utf-8?B?cUpyRTRtU2NSZGJYKzAxdVhyVVZIdURMZytLbTZmRWN1amp1ZW90SFZCdkVk?=
 =?utf-8?B?MlBsNUJxSkpmSFVmYWdiVXNIUkFiekdZWSs3eUhuSTluNTVwRGRvUUxGa2di?=
 =?utf-8?B?dU14Z1hoT0FPbFcwTnEvWEZDdHdyb1oySThKSDNueUF6S2haQkVoNE5CeUJU?=
 =?utf-8?B?RTlnQlNlclZOdm5VUC9tM0ZLeWJreXN2YUU3OSs0YVVPdkRyRkJpMlAzdVJJ?=
 =?utf-8?B?ODNFNVF0ZU1aK1BPenErazByWU44TUFWWVdXNC9OaGJ3b01tby9oaVZ3bHpX?=
 =?utf-8?B?bS9CVVdQWmxpOHhMMnpFdm00V2M0NlpIaXZ1Wi96NmlKL1lNOW9pZEF6N2I1?=
 =?utf-8?B?SG9rcWxUMTRmY0hscWJzZUpRTERLT1BOeHJSUzVGcytiZXlmWVR2WTU3ejdp?=
 =?utf-8?B?ZjlLSzRCTUVDYVRPN2M2NXRKcXp6ZVN3c0FyU3MwNkl1alB2OHJTL2ZoL1Ro?=
 =?utf-8?B?LzVRck1ucmVPWXZJNXJHblExYS9WelFBUHI3eXZsSmloMmNZdVlxUlJiRzM5?=
 =?utf-8?B?WVZKMUtOU2owVlIxL0pVNUxNMXVKMlZzOU0vTzYwYzFtVEtWK2FOMnZFazQ5?=
 =?utf-8?B?bUpPNGxuTmc2Sy8vK2U2dmVnbk1CdUxaZ21rbHAxUng0UHF5cDV3VStrZ3l0?=
 =?utf-8?B?T1JySDdoYkRwNnl5SUZqWTgxYzNuK2k5Z09YRE1HU1oxTi9DWnJnY0ZrM2p4?=
 =?utf-8?B?OTk2cU9hQjdPdzRnUFVaL0Q4TVJEQy9tSm95bm45aUtZT0o4VTNibklTaDJ4?=
 =?utf-8?B?V2ZEUlR3elR4dUw1SE43L29ja0MwcUpza1puT0tTUEd6MjFXbmxmV1NRNDh4?=
 =?utf-8?B?Ty9EZ2FkclhoRkFXNTJWWUFGbVUzRW1hZ2gwenpNNnNKQ0xzVUo2OUtpUmlF?=
 =?utf-8?B?ekhmRGx1TjBBY0tMSG11Vy9wbDkxanlBazIrVU8vcWpUalNINkcxSmRzMUZ6?=
 =?utf-8?B?YS92N1RvR3FIUUVWQmlJbWl1M0hHOXFxNU9udVpXdzFQN29yRS9NYWd4QzR2?=
 =?utf-8?B?MGNwdGwyRitjYXJaMWJWQmlSRlpXRzhMZmRpR0FZMm9yaXFxUXY0N0E4a1Mw?=
 =?utf-8?B?aG14T1E3ZUVmVTJNUVkzN051NURVdEl0LzNBaDRLcFpxb1FkTjBQR1hNTnJM?=
 =?utf-8?B?VWw2QzJNTkNrR1J4ZHY3Ym5EL3ozUXdRNzhwUUJLK1E1dDdLVStDQUxGUklw?=
 =?utf-8?B?bUFGaWp1Zi8weXdrTHBoMkdFY3BPaSt4NW8rUEo2Q3JEQjFzcGFuc0NtN3Mv?=
 =?utf-8?B?aC9HRGliOXNiajlhVXdEUHkrR1B2SnFncGFCVHNsVlNvNWtLR2JZc3dWdVNY?=
 =?utf-8?B?Sld2TW5hVlZCa21HR0FzOUNTUEVJV0tWcHNTTlBZWFQwbnk1QUEvdldoNzJQ?=
 =?utf-8?B?aFVVL2E0VWFsenIwUUlIMWgzdDNSaXlQMHNDV0x1aDVkRjJKdjF3SVJILzU3?=
 =?utf-8?B?WnAxVEp4dis5dFM4RklvZHZBVTJycW5GL2lUcWxwbXpQSDdSR2JMTEhWYmRh?=
 =?utf-8?B?MnFLeVhNVnBicTVteXFPa0YyL1krcU5GSlVLeXNZR1BPQ25kRGhSUXF1b2c1?=
 =?utf-8?B?R2RQcUVzK1lLVmZ2QmhLYjNQUUZkT0xXL2Z5L2VSMDl2UVc0MUw1Q09Ib2Fm?=
 =?utf-8?B?cWlicjhRQlA3RzViZGtXR2ZWVXVsTXl6QXdveWdTQUtUNXZHSEZCUS9ueFpQ?=
 =?utf-8?B?YWtNN1RUY1RobEkrczdBU291ZFhvek10cjJqSGh0V2FXWEdQZkV3WWJWbURP?=
 =?utf-8?B?blhpL2R0UlEzc2x6ZGgvM2RSKzBQNi9mcUVHblJvQ2RyaVNUamxsREhTTlZm?=
 =?utf-8?B?MkRlcnUvZStaZWVFc2RNOUFrSU1JelUzNlJUT2ozdEpWV3VzVmp4Qm9rV3FQ?=
 =?utf-8?B?VU1jN1pMaWdMejB1WDZSTERIbUs3MHdJajdEZHRtc0NaVzVrdFhZZjVpZnVE?=
 =?utf-8?B?M3l6YS8yZUljcnhNUkh1c0RoQ0gzd1JTbDE5eUdNcDFiSzVqYk5XN2g4cUZN?=
 =?utf-8?B?KzJaV0hRU3VoNjFhY1FkOGM4M09PM1EzYXRuMXIxTlk2dks1ZEp2bldwcUg3?=
 =?utf-8?Q?XJ3g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b96c74-78dc-41d8-bb3d-08dcb6e3cce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 13:21:09.0907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jtp78Dg1njnobzyoZxhbMs4qCJkjgTK0kzGYRm+qVVvpcvm00Vgi52hi1XwVWCCl1C1pBW/Mo1NvET6T3Q1v3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_062116_290152_72D6209F 
X-CRM114-Status: GOOD (  29.34  )
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

Hello Michael,

> On 8/5/24 10:27, Michael Walle wrote:
> > Hi,
> >
> >>>>> All I'm saying is that you shouldn't put burden on us (the SPI NOR
> >>>>> maintainers) for what seems to me at least as a niche. Thus I was
> >>>>> asking for performance numbers and users. Convince me that I'm
> >>>>> wrong and that is worth our time.
> >>>>
> >>>> No. It is not really just feature of our evaluation boards.
> >>>> Customers are using it. I was talking to one guy from field and he
> >>>> confirms me that these configurations are used by his multiple
> customers in real products.
> >>>
> >>> Which begs the question, do we really have to support every feature
> >>> in the core (I'd like to hear Tudors and Pratyush opinion here).
> >>> Honestly, this just looks like a concatenation of two QSPI
> >>> controllers.
> >>
> >> Based on my understanding for stacked yes. For parallel no.
> >
> > See below.
> >
> >>> Why didn't you just use a normal octal controller which is a
> >>> protocol also backed by the JEDEC standard.
> >>
> >> On newer SOC octal IP core is used.
> >> Amit please comment.
> >>
> >>> Is it any faster?
> >>
> >> Amit: please provide numbers.
> >>
> >>> Do you get more capacity? Does anyone really use large SPI-NOR
> >>> flashes? If so, why?
> >>
> >> You get twice more capacity based on that configuration. I can't
> >> answer the second question because not working with field. But both
> >> of that configurations are used by customers. Adding Neal if he wants to
> add something more to it.
> >>
> >>> I mean you've put that controller on your SoC, you must have some
> >>> convincing arguments why a customer should use it.
> >>
> >> I expect recommendation is to use single configuration but if you
> >> need bigger space for your application the only way to extend it is
> >> to use stacked configuration with two the same flashes next to each other.
> >> If you want to have bigger size and also be faster answer is parallel
> >> configuration.
> >
> > But who is using expensive NOR flash for bulk storage anyway?
> 
> I expect you understand that even if I know companies which does it I am not
> allow to share their names.
> 
> But customers don't need to have other free pins to connect for example
> emmc.
> That's why adding one more "expensive flash" can be for them only one
> option.
> 
> Also I bet that price for one more qspi flash is nothing compare to chip itself
> and other related expenses for low volume production.
> 
> > You're
> > only mentioning parallel mode. Also the performance numbers were just
> > about the parallel mode. What about stacked mode? Because there's a
> > chance that parallel mode works without modification of the core (?).
> 
> I will let Amit to comment it.

The performance of the stacked configuration will be the same as that of 
the single mode. As Michal mentioned earlier, stacked mode is used for 
scenarios where the customer requires larger flash space while maintaining 
the same performance.

I want to provide some background on why I choose to handle stacked and 
parallel modes through an additional layer or file, such as 
/mtd/spi-nor/stacked.c, rather than mtd-concat. Initially, when Miquel 
began upstreaming stacked support by extending the mtd-concat driver, 
the DT binding was not accepted. He proposed a couple of DT bindings 
[1] & [2] to support stacking through mtd-concat, but none were accepted. 
Additionally, after reviewing the MTD core code, he found that adding 
stacked support through mtd-concat could be complicated and involve many 
corner cases, which he mentioned in his RFC [3]. He then suggested 
concatenating the flashes instead of the mtd partitions, and eventually, 
the current DT bindings were added. This is why I propose handling the 
stacked and parallel configurations through an additional layer or file, 
as the mtd-concat approach was already discussed and rejected.

[1] https://lore.kernel.org/all/20191113171505.26128-4-miquel.raynal@bootlin.com/
[2] https://lore.kernel.org/all/20191127105522.31445-5-miquel.raynal@bootlin.com/
[3]https://lore.kernel.org/all/20211112152411.818321-1-miquel.raynal@bootlin.com/

Regards,
Amit

> 
> 
> >
> >>>>> The first round of patches were really invasive regarding the core
> >>>>> code. So if there is a clean layering approach which can be
> >>>>> enabled as a module and you are maintaining it I'm fine with that
> >>>>> (even if the core code needs some changes then like hooks or so, not
> sure).
> >>>>
> >>>> That discussion started with Miquel some years ago when he was
> >>>> trying to to solve description in DT which is merged for a while in the
> kernel.
> >>>
> >>> What's your point here? From what I can tell the DT binding is wrong
> >>> and needs to be reworked anyway.
> >>
> >> I am just saying that this is not any adhoc new feature but
> >> configuration which has been already discussed and some steps made.
> >> If DT binding is wrong it can be deprecated and use new one but for that it
> has be clear which way to go.
> >
> > Well, AMD could have side stepped all this if they had just integrated
> > a normal OSPI flash controller, which would have the same requirements
> > regarding the pins (if not even less) and it would have been *easy* to
> > integrate it into the already available ecosystem.
> > That was what my initial question was about. Why did you choose two
> > QSPI ports instead of one OSPI port.
> 
> Keep in your mind that ZynqMP is 9years old SoC. Zynq 12+ years with a lot of
> internal development happening before. Not sure if ospi even exists at that
> time. Also if any IP was available for the price which they were targeting.
> I don't think make sense to discuss OSPI in this context because that's not in
> these SoCs.
> I have never worked with spi that's why don't know historical context to
> provide more details.
> 
> Thanks,
> Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
