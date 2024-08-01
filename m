Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F105C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2024 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5Zr6ErMm60qy2I+J2oxekJDOZm/WQi+mpGdvv+4cvU=; b=y6RVsjQykFSZ8L
	+LXhcDiVUfOWJ47Edh+N86/j4sUrlxaUXN10101oYAG8X80sT/qeSW5nnsJ+tWnp1lKvwbXSlNw+C
	kA6ni5PiVkAgaYT0f3o94hhfqQgDm5TudtitmrY9iCeuGtraA+0SDGqhajwgeWMUOhXNHIuN4crBO
	pfE7ZrUFDfI7Zdfgx7TMk2IW7aKSj6O14UEv4WNXn7IR9r7v3m6ONVvBKQarNRNx+I8Cg58AuRqDF
	3penRR/Zz/ixXCvyuftFU85iIiwVrKMszVctFCsdvq0zflkH1w5XqV7HzAJ9CYa4Khdtg7Gpf7D9j
	5grJcwMB6T279lxxilEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPRQ-000000042AH-1XWJ;
	Thu, 01 Aug 2024 06:37:36 +0000
Received: from mail-mw2nam12on20631.outbound.protection.outlook.com ([2a01:111:f403:200a::631] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPRO-0000000429S-0PNA;
	Thu, 01 Aug 2024 06:37:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTe4qUAf5qiIBL09BcewcbpzQDMtUaK89NFesB7TaB7HlMfc0RDUdhcZeIrEvSkslzpl/HKaoTqIH2Q1B+i9W938FBlJTbgeNf0NpED3eHxgbgYCAbq7vns2HB95VL9B/w+k5iGirVhjZ3tc+LmDT5PjCXECkFDU++nGuIDy7x8242cjuciA9MJBWeDeDLbAtiJOWafly6wbsH7Xu/4bZOxbgQgS/bmuqUG0EStO9DRAWVugHsQasLIuhjddsEx1Q/KcmHSqrLkQPjDZZ3xU2sbha7/YNVQVopEOe5w855oAXxQZl8LMtp1fCOpc/DKrXhzHTOvxUAeNZZkClxEsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9F9UYzCTtG5EX5AieUq0hJRAmiLRG9x9ngo5NRePfw=;
 b=coHT3JIUcSxEMhP9CPUtUFaPO66y9p2QkuERVpGYI8UHimd7zW8w231Qpw5JQnzYvT9cS6RrIsUDOaNObR8EgYkUe2S6HgcMTZOaiEgP+8kh16qPZfetYAglcpL0cffj0JDbjzee3ZYRPreZ5aCiGUBCZip3g9+cK6oIBrVGyCMlH2EZ8sBOanD5607qXdxpBvAs9ghqibmT77Y2P2XYN1TvKrzU3F0ae49GxcThH0XK6ZUTo45JxR0XBWrXU4niQdO4wWLDWhB0jpAkCrhN7AmDQqSifv4uCUyr/llNnOu3wFOONkg0rat0cUXmVcdPozdjlytDAR5tv67oxn35FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9F9UYzCTtG5EX5AieUq0hJRAmiLRG9x9ngo5NRePfw=;
 b=4z1X+6zChqk8m74uTIe8ui0agi5PmuhRdhI1TsVZF7+qOfIzrQlzuW2MF2Ajp3nN7XBbJg/9TliRY2jYemw5G/3S1HDKz5obNJGKKUnHZ/CEzDS0rcZDoNjRR2vDczM7bDflcfoC8rRNMVY3p5SWpLWCBWaz5HvFUYIbnfbb5D0=
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7024.namprd12.prod.outlook.com (2603:10b6:806:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 06:37:22 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 06:37:22 +0000
From: "Frager, Neal" <neal.frager@amd.com>
To: "Simek, Michal" <michal.simek@amd.com>, Michael Walle <michael@walle.cc>,
	"Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>, Tudor Ambarus
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
Thread-Index: AQHa4yfe/U7Ow8+2J0mIWqJxfdRalrIQjwyAgABRsUmAAQ8wgIAAAQbw
Date: Thu, 1 Aug 2024 06:37:22 +0000
Message-ID: <CH2PR12MB50044242FE253D7B0E3425ABF0B22@CH2PR12MB5004.namprd12.prod.outlook.com>
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
In-Reply-To: <c01d048f-ad8b-417e-8ff0-96f9252c87f2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7024:EE_
x-ms-office365-filtering-correlation-id: 2282c68a-7317-45a3-c1a2-08dcb1f46620
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TXBXRUliOUsvUnlEUGJRdXVmWWtuYStDbkUwVXFsTmYxbW9zS1Z4SVpSOXJl?=
 =?utf-8?B?aTlTTVJQTVp5N3E5RHRRZmNtQU5NenlHSXBVQWdZYTRTZW9TYTA5dDNqc1ZD?=
 =?utf-8?B?d01ZQ0tzb2U2YytUTWo3ZXZ3QldTT1RaS0tKK3NsQUxJamxCOE90VkNidUFt?=
 =?utf-8?B?RUFZRkxhT3ZFRGtDS3V0TTVqcTZBWENFYjdxTElnWkZoazdJS21IcC8yM0pk?=
 =?utf-8?B?eWJmZDY0SmVjMHpSem0wSFNvZFYrbW90aEEyQ3VtbGhmQmVKQkJ6UHE4cFpp?=
 =?utf-8?B?cjVnOUx4VE05YVJmekM3UHA2RlRGWTVPeHBYemNIOEFueGRpclgxYjFJQVpv?=
 =?utf-8?B?K1ltYzc4dUpXdlVyZFBzZkpjVG1lZlJQZmJQY3ZxQUl3Uk9zUGIzTTlRMXI3?=
 =?utf-8?B?Q05HQWFuT0NYR3JEZTFiU2laMjBQMzBuOVY3NXlSVUV5WkNiMWdhSkNuOVAx?=
 =?utf-8?B?RzR0elIwYkdwaFpJamdGdDJWWXZva0ROUXpXNTFtTmdrRWdxNURLbzBmaVlt?=
 =?utf-8?B?NXVqSlBmM2l5VmdvMFFudElhMHRXN1FEZWtWSGtKK21WZ2d2Z3QyTVdwWkIw?=
 =?utf-8?B?YUN2cS9EOWo4Um01VytialdoVE9LQm5IR3l6ZzljWDgzSzBlVDVIMHhDcjhu?=
 =?utf-8?B?RGYyRXN4L0hlZnpPRWFIS2c1anU2R3RIR3Z6RFIvek40c3luSG9qVkw1Ynpo?=
 =?utf-8?B?UE5DNnlOSlVUeWhxZEVZQ1VrR1hIemluU0ptSnBLcjQ5cUdsSWlrMi9SQ1py?=
 =?utf-8?B?VGdJR2FmcWdGVWZ0cUtuYXVnWHk1dmQ3SHFSd2ZORFJnVGQ3eVpIZGxxQTFE?=
 =?utf-8?B?bGRTbHhZTDZ2MlM4akpGN2xUeWNkUXVqMHFVd0luVTAyZStrUitZU1poVHRi?=
 =?utf-8?B?eU5XTE1mcFpKUHdWd3dmQTRmTE1CL2RVRmlmdllxVXA4RTBWUXNvRnpUNE5S?=
 =?utf-8?B?Zitlb3YxNWYzOXE5N01EWTk4eGdWQW1vQUNibm5wZFVlK1FkSUliaGppRUxs?=
 =?utf-8?B?L1J3OUZHVnYxQTFYdHYxL1k3Z3NEbmhOTjA5RzdGUWU5QWxCeG9hdkE0a1Ba?=
 =?utf-8?B?eW9McTIvZmU0c2J5T2lpbWc4aUdNcHJoRDhTNnBIaU1vam9ocEdvZ3FPRC9s?=
 =?utf-8?B?YXgwWC9wb3JBeERxNjdxUFl4eE9zcmc1NWh4SW5Db3RaZ3ZOZkMwSk1TYkd3?=
 =?utf-8?B?dDhvbE4wSyt1R1ErakhLcEY4RUlvN1JmOE9oSkFjQis0TWhUYzVDejdEQlRz?=
 =?utf-8?B?YzRLM1NxYzZLL2x1cEo0cXk2U1pmTWRtUTh0MWVvTG1UeDBVdjNEOGVqam9C?=
 =?utf-8?B?L21VM1FCbExGS3g5M1ZzbTJvRFh0cjNsUzI3RTZpVDRYTkVTZk5rcm5BSU1m?=
 =?utf-8?B?WWwxYjFsa0NZb0UwYkFVK3FEbU5mR3JwdExoUjhkcHRWa2ZlOG16dy9jUUt2?=
 =?utf-8?B?UXNxbGRvdFVhQUtjRVhyMGYxV0Y5eGxHTG4ydGpYRjBENE0wakMvWkw3UGtI?=
 =?utf-8?B?Y29oUGJNQ2thT0IrSEFTUHRBQTJHK2t4WlhpcUNGTnl1NllmaVl6RnZwc1Nx?=
 =?utf-8?B?bGRjZnNhWVkwUHI5WVJnRmcwZldCbHRqZ2QzWTdwWHptM3pucURtVzFQaU9Z?=
 =?utf-8?B?Q0FpWXdseDhKbCthbXBjMjhBTTBLdmFrQzR6RGM0UFI5ZGJpbzJiZEdLYjJ3?=
 =?utf-8?B?NVJIWW9LbXo5OGh4WFNIUkw3QjNUMnB2b3B1MytsZ0RNVW10M2E5TGliVmJF?=
 =?utf-8?B?YngxZDZCNDRVTUNzN2NwcFlxMnRQYllrWUdwbk5Ob3ArazhXc0t0d3N6MHNx?=
 =?utf-8?B?ek9LeTVDMXVCb2kzcFF3OVpCSnVuYy92MjZwQjI3Sk9iR25NUkg0cTNxeXVr?=
 =?utf-8?B?WVpTOGNQUnEwRzUrZXpzclVXbWp3NHk2TUk5S01mZVRaTXJkNFhpNlIwQ0Uv?=
 =?utf-8?Q?WRKeZIiksjw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEQ2STd3czFORU50YWVSL01uU000NVNVaDg0VGJVc1ZWTHZKcVVSeStCcFRv?=
 =?utf-8?B?c2JiYkJWVTNCUUJ4d21ZTlBLUHR4eTNKYmRCNEt6Qm94SEhlTDRDWU9DUi9P?=
 =?utf-8?B?MFFPdUlsUkRXOW9nNWNmNTlFWjVYL2EwQmJxUkdJekRvQ3N2eUxDV0NLOWpk?=
 =?utf-8?B?Rm4zdThWRyt0ZlZwUmxTdEpDcklQUUlibmpVTW1vT1JFKzNjSkNlS2FtK3Ju?=
 =?utf-8?B?a1JrZ0tIc2krcFQyWXY1SjJYTjRoN3dsSW5FdUFGUHZFNGNHZ0hNSTRlalE4?=
 =?utf-8?B?eERUa3RJOUh0UWZFR2orYjJBTm9PbnFYbGFlRmFyN2dWSnR1bCtzZzc5bk83?=
 =?utf-8?B?bG1mVzZBUHJhLy95Y1UzSnFoTks2WE94T050Uy9EelVPUXk3aW9lODl1SlZr?=
 =?utf-8?B?aGxWNDRaTnIwWE44NGZuYnYyM3dzSUw2Q3Z5QWl5RkRyZE1qb2VDaWx2MHNo?=
 =?utf-8?B?T0VkbXB6T1JmbnVEbS9CYXdlc1F4cEdYNXAzWFlwWWd2VVo0Ym9Ua3hTak82?=
 =?utf-8?B?QmVaZjJPUTFwejR6R1FESFR3bWRPNTR4endlOW16TWVqKzlNaVBqa2pHd1RC?=
 =?utf-8?B?U3Zudm5iY0QyRExvNCtQN3dEcmVZeURmSWJmYk1CWTBVU0FHRU95aGxaUTcx?=
 =?utf-8?B?dWN6WXpPSGErUmsvNUp6Qkg5Zmh1cFZzeGtxcExvRVhyYk16SHl3a1dLeWd3?=
 =?utf-8?B?TDd2aHNCcjhLdTlObGZEQm9JeXlIZzd3QXhFNWxXYlN4U0ZpUXZBellGU2Q0?=
 =?utf-8?B?MytiT0c5SWVDeFk2WDJvTERKVTZDcEJudlpSbFU4SHBCRWtpZnZCV1ZuN3Mx?=
 =?utf-8?B?WkpqZDNGVXdVcHEwdC9kL1lGNDZ5dllHOUhxdTY1ZkhqV1B0c1Z0a0lHUUc4?=
 =?utf-8?B?NWhpV1ZhdTdtQmpoMVRkQzFFQmswS2h2TUwwT2pJVDl0M0dwZkhidm5pSUN2?=
 =?utf-8?B?NjhsZmZVRGl4NEV2dTMxK0RNelh6UENBdEx1L2h0TXZPR0pVUzhRRTlZMGov?=
 =?utf-8?B?NE51UDdnVVlTSmlubDZxL3VrTWdDZWVubnZwM0l5cVNvZytTTEV4dzQ0dGV0?=
 =?utf-8?B?SjkwWk9hellYNDZaTVE1aGovREFrQVdLY3ZJakNBWHQyT2J0eWwwcFpnQXNl?=
 =?utf-8?B?UVJjV1IxYys0UnJOQnJEZlBJbFcxcUxRYU1Mb29hUmdLWnhkY3pQcHhZb1l0?=
 =?utf-8?B?SitUbUhMUHVpOWh0UEM0RWlJWTRzSWNzd3llUzQwYlc5aGhSWDA1V2Y5a3Fj?=
 =?utf-8?B?ZWl1Ujl1R1d4ejQ4bHh5c2ViYWVuSU5pWktkT0VHNHQzWmtDNVNjWGxWOFZs?=
 =?utf-8?B?TmlHR1ZpMVRmN3NhM21OeUVzaHczdFlwakVnTUs5N0FUZkZaeCtVMVhjYzdH?=
 =?utf-8?B?TS82OXZDdHVER3FYVU1QcUR0WkIvMzk1dUhmQStrY1VQMnZDSGgwTmt5VER2?=
 =?utf-8?B?czF5Q2ZMUCtwUmk3NHpBa0JhZWZTMUh5T1l2cEUwRzdoTG01ellFaXltVFZ5?=
 =?utf-8?B?ZXcreVVrOEJLZmNKazB6N2lNZlV6cUR0dEl3WkZlV3A3bHd6WUYwMDN6b2xo?=
 =?utf-8?B?cG9kdENXN0J1NURLampqdldoR2FRZXFTYXNuVE1jT3FPbUg1Qm5aWk9pakdX?=
 =?utf-8?B?eW0xdzNEZk1YNnVVcm9GRC9uZUpSYzVZeE5tRStieDhPOFNUOHdBZ2l4NSto?=
 =?utf-8?B?bVpTaXNvQ3ArQU9hZEdsNDFDYm9NZEIwNVNPeW43bStNS3BQYWNSclpvNTZh?=
 =?utf-8?B?V0owcXZLUFFiaHYxM0N3ZFZFZUNkZitGZFhVaVVoUjQ1cWZ3UTM4b2RHQWF1?=
 =?utf-8?B?eml1OTBIQ0lnYmlCYjhhV2paUDBhdVhaZ2M5aHdlZnBOdkNFRFR0cnZCWlJp?=
 =?utf-8?B?TlBKY2NMNnZFQklhWE15U2hHWVhCMHpWVGRBVFNoTzg0VHZ2WmtFRmN6dWtu?=
 =?utf-8?B?aWprQk4xVk9XYVIwZE5iTEs4cFJYYkZmLyswZUk0TElLSzErT2twTnk2S0Zh?=
 =?utf-8?B?Uy92RzQ4T0piUjlzVTAyZEgvVWVqcS9ZaUJIMExyZm1RSlhCMEkyR2NjL09m?=
 =?utf-8?B?bmVreWx5ZkJwbFJWV0VRbU10TnBrSCszTnRXMjF6MVcvWnU2Y2gvSFNXeGpn?=
 =?utf-8?Q?OsDA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2282c68a-7317-45a3-c1a2-08dcb1f46620
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 06:37:22.2754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dB5oC58sMO1Xy1kg6kbsLSCltt27rRaqpaFOPE/Vt5Jh2UENhPx/OeCaNs97L4RU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_233734_207821_DB0E4508 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Michael,

>>> All I'm saying is that you shouldn't put burden on us (the SPI NOR
>>> maintainers) for what seems to me at least as a niche. Thus I was
>>> asking for performance numbers and users. Convince me that I'm
>>> wrong and that is worth our time.
>>
>> No. It is not really just feature of our evaluation boards. Customers are using
>> it. I was talking to one guy from field and he confirms me that these
>> configurations are used by his multiple customers in real products.
> 
> Which begs the question, do we really have to support every feature
> in the core (I'd like to hear Tudors and Pratyush opinion here).
> Honestly, this just looks like a concatenation of two QSPI
> controllers. 

> Based on my understanding for stacked yes. For parallel no.

> Why didn't you just use a normal octal controller which
> is a protocol also backed by the JEDEC standard. 

> On newer SOC octal IP core is used.
> Amit please comment.

> Is it any faster?

> Amit: please provide numbers.

> Do you get more capacity? Does anyone really use large SPI-NOR
> flashes? If so, why?

> You get twice more capacity based on that configuration. I can't answer the 
> second question because not working with field. But both of that configurations 
> are used by customers. Adding Neal if he wants to add something more to it.

Just to add a comment as I work directly with our customers.  The main reason
this support is important is for our older SoCs, zynq and zynqmp.

Most of our customers are using QSPI flash as the first boot memory to get
from the boot ROM to u-boot.  They then typically use other memories, such as
eMMC for the Linux kernel, OS and file system.

The issue we have on the zynq and zynqmp SoCs is that the boot ROM (code that
cannot be changed) will not boot from an OSPI flash.  It will only boot from a
QSPI flash.  This is what is forcing many of our customers down the QSPI path.
Since many of these customers are interested in additional speed and memory
size, they then end up using a parallel or stacked configuration because they
cannot use an OSPI with zynq or zynqmp.

All of our newer SoCs can boot from OSPI.  I agree with you that if someone
could choose OSPI for performance, they would, so I do not expect parallel or
stacked configurations with our newer SoCs.

I get why you see this configuration as a niche, but for us, it is a very
large niche because zynq and zynqmp are two of our most successful SoC
families.

> I mean you've put that controller on your SoC,
> you must have some convincing arguments why a customer should use
> it.

> I expect recommendation is to use single configuration but if you need bigger 
> space for your application the only way to extend it is to use stacked 
> configuration with two the same flashes next to each other.
> If you want to have bigger size and also be faster answer is parallel 
> configuration.


>>> The first round of patches were really invasive regarding the core
>>> code. So if there is a clean layering approach which can be enabled
>>> as a module and you are maintaining it I'm fine with that (even if
>>> the core code needs some changes then like hooks or so, not sure).
>>
>> That discussion started with Miquel some years ago when he was trying to to
>> solve description in DT which is merged for a while in the kernel.
> 
> What's your point here? From what I can tell the DT binding is wrong
> and needs to be reworked anyway.

> I am just saying that this is not any adhoc new feature but configuration which 
> has been already discussed and some steps made. If DT binding is wrong it can be 
> deprecated and use new one but for that it has be clear which way to go.


>> And Amit is trying to figure it out which way to go.
>> I don't want to predict where that code should be going or how it should look
>> like because don't have spi-nor experience. But I hope we finally move forward
>> on this topic to see the path how to upstream support for it.
> 
> You still didn't answer my initial question. Will AMD support and
> maintain that code? I was pushing you towards putting that code into
> your own driver because then that's up to you what you are doing
> there.

> Of course. We care about our code and about supporting our SOC and features 
> which are related to it. It means yes, we will be regularly testing it and 
> taking care about it.


> So how do we move forward? I'd like to see as little as core changes
> possible to get your dual flash setup working. I'm fine with having a
> layer in spi-nor/ (not sure that's how it will work with mtdcat
> which looks like it's similar as your stacked flash) as long as it
> can be a module (selected by the driver).

> ok.

Best regards,
Neal Frager
AMD
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
