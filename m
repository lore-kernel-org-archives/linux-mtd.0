Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1089C00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 04:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEmzSCMjMioRttxzzu360JQKi/UcNMiEPD7sDqY6gAk=; b=qASPb+uy72fHUp
	6xLbmC+gmYPXnlr1znvrLIWWTBCL+i0NTjR78ZvlluZsG0sdvxmOPoap+17gLYf86Jn/mphAgdvEu
	O9L/mUHDhdwbSKvkh3NgGG7YhwIDO+r12rFRam7jNK4s6/H5bkdzENWZ9dskN1vhskYxdKezxTNDa
	j801PFGah3C9dPnx21TN2fYF8GoCIQZw14OechacZbJCKY2iZRnZ+hj+B4GK7AWfGwE/Ad9DSA94g
	ZK/fKgTAoZTnvBsOYY7VZ5UnClgxIl/FQTU3mhVZuyF2ZIkOB0fRBEONuGPjFzPWia1bruD8VgCJp
	Q4kTYZYuGab9t0xtDM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKug7-009hbH-ED; Mon, 08 Aug 2022 04:47:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKug3-009hRF-V4
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 04:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659934064; x=1691470064;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Pb048QNDYd8kLqnaWLDWt3wfl8JGTznaQ+L3FtpdfFY=;
  b=tL+cKk5r9rqB/NNjJw/t95vIUnYMNGHzoXpdy4gT3SeQpoqStWdvCU8k
   3vskyRYyf8U670/HzvH9RrYPrL0vaFYFjOgZa1wdCqIvDDmKZEXRrmC/h
   UDWiq+tmzXaZtVpziA9kcIjCVQ/FDWriXW3JzKUziaEfgDQKmW0U2x2n3
   5uto+1digboFrFHg+GlGDW/z+uon7F6ImYSpFRHxaZUkIniQo8QMw4DA8
   ZdoDtlyXdPhO0m9/Y09u6IW/l8GSuys00a+FLZrX1kkCW11SqPQUP9q6Q
   NPLTjWvf7zNCQoVhNmt0Qi9/vhxFicx/DTfoTfhNEb8qfWwesxsQcuRXp
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="175301322"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Aug 2022 21:47:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 7 Aug 2022 21:47:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 7 Aug 2022 21:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCJz4Te0bihtbeepVYXMmmzcv+VKHRU4yMI7CkFb2YShO6trUiJNdE+/7QZIms9V//A0yarLiN7jcC7iEZ2zHXjneYpraQbWK/6SVRtgMfm5qHcZ4sLqfyAsuIn78AyfU/14M3SCI5pC+JAVsaWm6mDVTwyecyyLC6eYnLr9P9AO9iH2arKMYwQS+gJJtlSQnY3ECvcsUUBG0D6mbsrT+92HgxODwC28xc31pmkUULsrI/ftX6Y/F6uuE57a9SFJ2T5E/I7IwhaE8VXROWTChuE0wWsAfvX3QjBeuY7W0WRCAblBRt4Tzis/QDeKwrq9XTzYxDhD06ZNkoNk14JVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pb048QNDYd8kLqnaWLDWt3wfl8JGTznaQ+L3FtpdfFY=;
 b=mKX2CPMrHgQCh3ZsyAZ+OG2JSrzdMxFVQCSmFhFWnCdg6FYkG1SRBxABWkrpjQ1TxJN743NEB5ZNg2VDlXeA30ck+HOiEPmdMxql2xBFWIC3UFJq+3ckZFvCqaYSpQRek2oCQldusbkxp5HpEwJKYYvLzYbiT0e7+dopVPL7yIMtKv2boU1jo4XDo81tncIS23s58sWd616MTfA4POMslrntz5on+JS0yNLQragXW4fpVQ/HzVkJEU+w4JPL0q2U4EzIOE+WkNVyNwftTMtfG0dgZMAtSABW09HlGGWrx8dwtSOkNKsio0HUwS9jixvyVEk6wZeLN53SQgyi3W4R5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb048QNDYd8kLqnaWLDWt3wfl8JGTznaQ+L3FtpdfFY=;
 b=V1VydKsHni+xPX1S7SDnsURM9yCjzOFyqn3NCc6dBR+cQYFgTR8U8XpTRwgIhih2YApkVFQTCja5LU92DNN0SInAmkHIrjTSZdOcRFlFVb9m4UnYXEjZSAs+Ad69E+yLo1fsSO9pftkmKNLSAfQjVllf+kljXyDPEzNsxx7BI2g=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY4PR11MB1255.namprd11.prod.outlook.com (2603:10b6:903:30::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Mon, 8 Aug 2022 04:47:31 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 04:47:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Topic: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Index: AQHYquH3IGrZFUfrHU+ZRSwPyGM66g==
Date: Mon, 8 Aug 2022 04:47:31 +0000
Message-ID: <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d40ae7b-3b54-4687-bdef-08da78f91a74
x-ms-traffictypediagnostic: CY4PR11MB1255:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ezFQuAwKRhuEcFjJFD8JwLlObyjrdOItEVqN1Sz/T+AG02T1QuCOguEVWNEZVeBcjmkW4H5a/mx2fPJUUPKwLYkonTpLSsSVrNqQVJ59eH5q0XMYG2PQ+XgHdYl/e7uMMZvwnrAjCKwEoaIX2Tb4x8H4uHWwF1Z3HHqbKi7asysAt0XsjthXCyV0Pd57yxqii74fgfGm5SgCCytltI3073puWO3s8i2fTRULFCCCv6Q9jry3dPt5APIAzMeRJiW17XTnjvu/TYTrMXSl5xiBfZ4YMp85aokYnwcC5g4LdyjkvwVX3+KxRVIv1ZEKOANOpyEZajJCUp/D0klrYTD/cxEII4ILGeNh3JLLgZA6dGsW8qHfV0sMLWB6g816ipBfbdn9l9yuL0/8NE+F0WuOtaWKDUc8H0tK0rvT7M/cRm+3OlyXTj+BGgZLoh0Yi4IUW9pY5WwST7z1tkGZE/SlaiIOe3hCHewBOetDG4dGIgXv+bvcKnoPM7LE8NU/KUbpiMcApSaBZpjZuZK66dgj9GiutDmEGAhejmZOGJt3pzRgJ47e2DTY8bcy1ta5YzOar9J9CV5Op/pdAWn6oRYotgVimFcJ4ib4w6sMrI5NgXtcZwcZeq8jCYCkE15t2dx2AZvFfAEzIFyVV8P6loF7iaxWswE8wel80lWlbmLE4QslhCarTEzSD/cyq/DaQbcDuSvmTFvKJiU2gxunUyFiLJYpdiQiH7zuPXv5LbpRihBEkZsbnfvb7YoE+AndDETJOf7XxmNoKvIDMS8aIcffwH/nI0vJhlEWpxot0YMJukjduM2PAz/heo6Xf1/D+puD9eMXXf0yI9piVjkL4xZXR2KYpVs0HkuwrOu8AjqY6g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(366004)(396003)(346002)(38070700005)(2906002)(54906003)(122000001)(2616005)(110136005)(316002)(76116006)(91956017)(31686004)(186003)(8676002)(66446008)(66476007)(66556008)(64756008)(66946007)(8936002)(5660300002)(4744005)(4326008)(31696002)(478600001)(6486002)(41300700001)(71200400001)(26005)(6512007)(36756003)(38100700002)(6506007)(53546011)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW5BRWdjek12Sk1xRUpzTGh0MTRuYlRYTkpRcVowRE10RSt4cElsVy9rT1Bk?=
 =?utf-8?B?VFVnbU1URlUyRnltdFBoTFZuTnI0eDltRU5VaEQ4Vjk2Mi81d25GL3o0VDUx?=
 =?utf-8?B?RHduNXhYaUx5eWVsOHVJdm9sSXdhL2U4Vk56cy9WZGQvNDM5VityVEtHdVY3?=
 =?utf-8?B?eFU4QkZBeWtGV1cyQmRhc04wejFMS3gwdXIrQnpzSWZIeWhOLzg4c3d0Mk9n?=
 =?utf-8?B?ZE9UeWYwWFVtMEo5c2JxT0VIQ1IyVnhwdEpwT2gyV0lwK2kyRjdwZUQybG95?=
 =?utf-8?B?VjNCNkt4MXRwQUUvZ3ZmSUNxYzk4YzhpY1I0YWdzeHRzczZrYTFJM0VMM1g3?=
 =?utf-8?B?WHVlRXZDRnduUlJ1UzRyaDhsYnFTenpPS2JVbnNSNkJWdHdKYzY4VVRrY3Qy?=
 =?utf-8?B?Z3VIT0Ixd09CUDU5ZzNsNm4wL1A0c0tyeEFiZ243dldGbTRTTFo4SENVQ0cr?=
 =?utf-8?B?WXJMa0pvTHdQVlBwNjFGdW9JYU05WnlWT2lYY1dpNko2RGo0N1FoRkFpRDYy?=
 =?utf-8?B?bFNrTEk1Unlnemo5M1p2OStoUmJxZEo3b0ZlbmdDNlRJK01oUTNsUXIza2ZU?=
 =?utf-8?B?WTY0cnQwWnBzZjM3OE1uam9KcjlNOC9IZStQYTRYd204N2NWQ3hoVW9vZy9Q?=
 =?utf-8?B?OEFrSDJwK25wcVMwMThCd3JEbWxQVm5HbTRwNTE3cmdsNERSaUtxTkVGeVJH?=
 =?utf-8?B?ZDhYNXViQ3VCMjlRWjNHT2dKK3pOT01kb1lRSGRnckI5dzA1WFJZdUlucXVD?=
 =?utf-8?B?TG15SGFuQVpoT2tkbURFTkJEd3BtNk1FUWR5NXdmVzNlcmlObzlUblA4dGJy?=
 =?utf-8?B?TlNqWXBQN0F3SmM5L1prczVXb3lPY0xGb2RxZVZkUENKYUlkL21wQk1vNURn?=
 =?utf-8?B?MnBndVpHUlY5WUljci95elNwdXYrU25BazVPb1FreDZzaXdOMlpTcDNIWmt2?=
 =?utf-8?B?MXNnT010dFl4N0plOFJGZ3ovUmcwWXVOTVM1T2Q2Y2F0SVFHZGhweUF5WitS?=
 =?utf-8?B?VnptUnlQd3NXR0Q2ZWI1UGN5N2hJMUJjeFQ1RzNjRVBGd3Vxbkx0RFhVeUUx?=
 =?utf-8?B?clZzcW5Ndk0remRqTTJkWnIzcmZMWFRML1dCZnVsckczSEx5MFYxNTdrZUMr?=
 =?utf-8?B?amFRaDIwS2hQSEdUS0wwNkhIVWJqRkdBaVk1T0ZWZFpRUlphSy80T1VyRGFm?=
 =?utf-8?B?b20wS240enUvbHJpb2ptTFNuU1NPRGFBSHo4UGt2T1lORUQ2bVd4N3d4b0Zi?=
 =?utf-8?B?QnpwRGZZbkFaM3VRQUExd2NNNVQ5MG5XK29hUzhRdlRnSFBEZkRyNWxUaS9m?=
 =?utf-8?B?cExQNWZ0cmY3QmsvUi9OSm95OHdMUi9lejQralNrdVU2eHNCc3pkVE4ySE9y?=
 =?utf-8?B?QmtpWWo5b3lKYjFLWFZmRkxhSDR4SWt6dXJvRHYwY0lIS3NBd3hYZ2Q5NmNE?=
 =?utf-8?B?MEZDY0NlK08yR2pOZW1Kb094bGxJMEpCdGkrZG1NMTNGbFgxd2kwRXhIK0JR?=
 =?utf-8?B?ZUNta0pYUWFQb3V2L1RHcEpqOCt2eTBqZjJTMmVvNWpnak5LT3dTYS9jNHA5?=
 =?utf-8?B?SlJNOTI4U1YyUjgxbHVEandmOTRZSlQrem40MkQ4a1BrUnNWSk8xRFBjS05J?=
 =?utf-8?B?RHlFU3k5VFNiVmNOUzVxdytaUTZjZGl5MmYzVEVHUnQwbWFYU2NSWTF6R2JP?=
 =?utf-8?B?alBScU9yZnJGZGp2b1d5a3FBUE1UTGI2WC9VeXJmQS9oSU13cmtxZXlrQUx3?=
 =?utf-8?B?LzVjZkp0djBQTE8rWWgxd21pUVB5a09VbGdrbGxFa1NYTlZZNDcrbVpDaEdI?=
 =?utf-8?B?Vk16Y1BReVE0Y2Y2VTNoM3JVUnkwTEdZc3VNaitvTDNCMkJxbG1MdzBPTjhi?=
 =?utf-8?B?NU4wVWNhZEcrbTdkdndWTXZEVXhidGE4c1I5ZTZudnVtU2hKV0JXVjY5N2xy?=
 =?utf-8?B?T0RVUncvdGJBMk9HbHFIU3FXZmRDUXpkRG40NlFvYWhSL002VEdyTWU1dXJu?=
 =?utf-8?B?RDlpM0FMN2doU0h1YTZyb0NFR1lKbW9kRW5wZHBQaE1RMEJlWlpSRWJDdlgw?=
 =?utf-8?B?aE9Wc0RSanFET1piS21NcGFRMWJGYkphUEdMMUdnd2pyNnUzT3FxMmx4N0xv?=
 =?utf-8?B?TlRJR0ZxdWtXUXlleXVOajBPRlhQbExOekl1MVgrZUFhTTBLaEx3M0NPWVJC?=
 =?utf-8?B?Mnc9PQ==?=
Content-ID: <2A8C3FDC9467C94EA8841376AABE38AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d40ae7b-3b54-4687-bdef-08da78f91a74
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 04:47:31.1769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CqdJwAWW8MtDuG9ah6sCWYXixRkWD0wcqkmwRkdZwY9qG84KNJFc1gyaNrMyFQTRuJIm0QhjnlOVrYTIdqsZusndo5ClrWMfxkbKH/Kp1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_214744_327204_F0085016 
X-CRM114-Status: GOOD (  12.41  )
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

On 8/6/22 09:34, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Hi!

> 
> s25hl02gt and s25hs02gt
> 
> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
> These parts are
>   - Dual-die package parts
>   - Not support chip erase
>   - 4-byte addressing mode by default

CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
only the first 128 Mb of die 1 can be accessed."
So there are flashes of the same family that are by default in 3 byte address
mode. You added support just for a subset of them and used a generic name,
which is not accurate, right?

Can we instead make an algorithm to determine the current address mode?

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
