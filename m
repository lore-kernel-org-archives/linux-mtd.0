Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D699C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+bgoG98zWj63G9ovJuro5coQb4lkPzOGrMa92/My8I=; b=nZkz/Ytm7FWIil
	ChHZRPaE5gOFFVWzj6y6wPa+yHeT/FPM9j10aa96fZRa1h2IbGDKTvoCIusqH1y3XN/6uX3EJVRP/
	b+Q1rRYQy0X0iOUPmbLuU4p3oVgazuL92l52Rbvdgr5fpJHruHXV5dVfYwdrqN8BBrcKZrE50C2bq
	ywaZWEoqnXFglM9gEns8BYcfQgDcfIWO2NsEnmmhQz5t9NMyQ10y9oMUKZqtxvARYHa5YcsY3Yb79
	uK7uXOaqsiI7QC/PbcfNDHeCfZghrstwdBjQ4YkmEYfGVAxKKCSny3GLr4bWu4l2YnXNH81yrnkQc
	6d/xwxLWtaYaPJm7wW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERET-002Hsq-KW; Thu, 21 Jul 2022 08:08:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEREQ-002Hpj-0M
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 08:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658390905; x=1689926905;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e4Q9C+V2cPMnMEOz9Ug+asGRao9QGNdATh0QD5oWwtw=;
  b=YdJ8nN/ifnE98DkuvPFppE62tC4s8n67MiGRCbtwJkzx6pR2aBjhvr06
   /GwJc0vOlHGJ2S1SgEEZsTofRNOZYgt9rxOAJA1YEaYnE7adkuN+k4r9+
   46EvqEKNvwEGluNbwuJtPMRsQ9EM/Kxf/zNVsN9FKroY1iOTuqbe+t3Ev
   BizFXwskOqlUVH7odb4F33JmHs+Tcb0FvGbZ/zQxu8D8Hq9U3bM1pX9EA
   VWbz0S0zPp4KoSMtMxOY7793plHdV9ccNfh2j41lvihW0TLb4bRYboX8q
   2TzfeXY9g6dAETj5R4a3BdU+/jEUmnB+iDZiYaubaSPkoeu6RsT6U/4xH
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="105477707"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 01:08:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 01:08:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 01:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HP8dfYCWvOByniem3Ae8eGF4VJKFbpYv2SRTzrKy0bi8133g0h9S0+Bqlb+hSHuC8cqi3y6EWAS+rrdGL9As/OhQipXJCIlIF0BnpOaN7GErpcTVaox9E3BuaikKJAz4sDhZCtr+NTmnv+FBcIL4PnsCB6sc9KauweNvr8zHJCwjLgz3bhL4BOMZ/E5rxyXZ20duuwFixBYQY46fBOXaYEEIxjWYXrXmIpWCEzEhiZFtg9S3z6z3FwzNEZex2kSj4ML9F2ATngkkPZbrMI6lY65Cx20HNXRyKDJnnwOrwi71KiyZcOKGeIKShU/Yk6wydwwVAJygsRMKDAs8mHvQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Q9C+V2cPMnMEOz9Ug+asGRao9QGNdATh0QD5oWwtw=;
 b=HlweWy6e1/RKNUjj22o6ySXXiW9674mkYguWsitjWn9TrK7Rly8Usw0lZr9Jn/dw/JWiCWUObPGO+j11MeBL5kjam4oYUGIx3m2wDoeZqi1ZcaZgOfSMLGH0ZY0B26A/MCARSRXWVA7ygUjZPnf2kLqmdgNt/xHmeAJnL6fTFexYMXOsxJ7eSddgrd+9jlNvy2SxiL80ZNFMCm2iKL6shfS6wCSTS0AcNPf/Uxw5XiearCUiPFGbS7aT2Hlqnkf9RLXrfvbm4MkuwX2XKeb9sCU+XE/mKP5P8Y4SN9maEe6Ez0CG57/v96+oWF0E/mpHSdoK6k9bLqQq0tzYBXbqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Q9C+V2cPMnMEOz9Ug+asGRao9QGNdATh0QD5oWwtw=;
 b=AMvAXbwCiPdNb/BFrlAfA2sWF9NAw+u3ZUPt5SwEOv91GKkft+9PfpeI7+k4lQIvsxxS6toMW81PwXzmlbn7nB+hunb7QgEnw3V2UHPw+zSSATUdTjTGKoB7P60nJFHk1mcJpSusdj2WXArOz34S5ljGFzBlqfFm3ED5uIw2Dg0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY4PR11MB1525.namprd11.prod.outlook.com (2603:10b6:910:9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.15; Thu, 21 Jul 2022 08:08:20 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 08:08:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tom@tom-fitzhenry.me.uk>, <p.yadav@ti.com>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: siliconkaiser: add support for sk25lp128
Thread-Topic: [PATCH v2] mtd: spi-nor: siliconkaiser: add support for
 sk25lp128
Thread-Index: AQHYnNkKComMZVmO40SH149hyPIBfg==
Date: Thu, 21 Jul 2022 08:08:19 +0000
Message-ID: <dd516981-4d1b-acdc-c468-cbb14d34f68c@microchip.com>
References: <20220603141603.145777-1-tom@tom-fitzhenry.me.uk>
In-Reply-To: <20220603141603.145777-1-tom@tom-fitzhenry.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b519d0e5-44e0-4507-2a56-08da6af02c8e
x-ms-traffictypediagnostic: CY4PR11MB1525:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?b2tPTTh1VVkvRUtmclllTHRETmtlUWh1b3MyUi9sMzhEclF3S1JoMHNBMERC?=
 =?utf-8?B?N3BFeE8wdGw3Q1RwL0hicjBZYldhYWQ3RlI1dGdmb29CUmlheFh4OE9iUjlr?=
 =?utf-8?B?RHdSZUpEanU3RUZKaTh2MTZ4RHBUdExrY3dDLy9hKzFaeVcyWU5DcElrWSt1?=
 =?utf-8?B?OWsxL2lDUDBwUDRMdEx4UGVVeEdlNGJZZFZDbXNNWEJ6ZVNMQjBBREx2OEJv?=
 =?utf-8?B?NkpWTUdSYWFiT3JIV2pOMGQrYkllZjNMZCtDSWRoZ2ZKN0tjYkxxTG4xSTRR?=
 =?utf-8?B?VmJDbmE2Wm90d2RjWGpwK0U5MzNqR0xYZ3J4S3NXc24zWEhNNVpUYUtTc2J5?=
 =?utf-8?B?MVM1Y2J3bTVMOVNEY2gzaU14dFZ3ZVZTMDRpNnN1elZHaWplbzlYNEN3UTZx?=
 =?utf-8?B?WVlUL3pBYXQyalBsNWdKT0dhTEFkZWFDWHJzYXZPS2srUkRuSXpQRmdSNnU4?=
 =?utf-8?B?ZmFSeThQcUtPMmRRQ1cxenNyb3ErdG5QQ3lLZStwTWtwSVJRc0M3MzBpM2xL?=
 =?utf-8?B?Unc1Vk9aTlFUSklJUGtKUFVOakltNmt2S2tORUVydHdVU21QNlloZ0FoL2RF?=
 =?utf-8?B?SkxjQlJQKzZpaUQ3RCtrVnVCTzcxQ0owZmFOTDNoVnRkeGtYUEI0TlFVejJT?=
 =?utf-8?B?OC9PREU0YW9IM25ybVBuQkRFeE5tSVZhU1hFSnhFQmJ1Q09QL2lUbzV4WFZ6?=
 =?utf-8?B?S0hpc2pNU1Q0eDIrWUw0MERrSUVLdHVZeWVRcFJuVDRFVVYxWGhGbzFaeUhn?=
 =?utf-8?B?bTl6aVVVRWZ6Skh4VE9KdGN1ZjBURVhpdVE3STVaNHA1cUI3WHlLdmRtT21r?=
 =?utf-8?B?RlVNTnN2ZDZGbC9tc2pNV1BwZlJXa3RBR3c3TGxFQndMMFAyWm9EdGR5T0li?=
 =?utf-8?B?U2pyVzBiTEZUclJVT3MxT0h1NVkrM241OXhJWGJyTlZjdk9yeGdaVHllMWdR?=
 =?utf-8?B?N0tld3lHeTFqU1Rxc1V0Wk4vRlRLWWszWCtjOXFYdzg4NkJINzVCcXVBTVpv?=
 =?utf-8?B?SGhqZXlsdFZnYXNoNXZGanZVUVpMd1JnSm8yZEF2dk5TL0RsRCtENFZJVGlx?=
 =?utf-8?B?bUNrYnFsQ0oybSsyZzhraG9mNWMzZnRXeTJqS3BSSkRDditpcUxBaFJpTVNE?=
 =?utf-8?B?dTQ1Q1hZT2dKOGJHMURkakFxWmVsRnViWlBiMnFQdU81NXJJNERYZXFuWTU0?=
 =?utf-8?B?L1ZsdWV4dUdIVk9aMWFDQktCcUo4VDJuVDJPSmJBOUNCVXJKb0NGUGMwQUFN?=
 =?utf-8?B?NG5POCsxc3c1ank5c0lNN1oxN0sxYTN3SzJpREZFTERXcVFjQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(39860400002)(376002)(136003)(66446008)(5660300002)(66556008)(966005)(53546011)(4326008)(64756008)(2906002)(86362001)(41300700001)(31696002)(91956017)(76116006)(6512007)(8676002)(26005)(66946007)(122000001)(6486002)(8936002)(478600001)(71200400001)(66476007)(6506007)(38100700002)(54906003)(36756003)(316002)(2616005)(110136005)(186003)(83380400001)(38070700005)(31686004)(138113003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWpKQVlKTjdHdXZZMkRtUEZqaWtpTGx6NFN5dkVUTXdsUXk3cDdLU3haMEFn?=
 =?utf-8?B?eWpDV1lEYU1nUU40NmVpNDNIK0Nob002Y0lLcGJoNmVGRm0yWDQ5ZGZtUklT?=
 =?utf-8?B?SHJaWjVIL1IzSVlxTUVQT3VjaStOM1VMbXJYNnV4MkNFdUdQSDdPdXNSV2RI?=
 =?utf-8?B?alg4YkcwYk9xOTlDWXZOMzRMem96Rk9ONHJoM2hoL2x2UjRuSkk2SzVlMzJC?=
 =?utf-8?B?TGt6ekZKVEhYTEpKUXZzREg2RFNlNHJkajkzdlREbUVxK1Exdk5TY1lOQlU3?=
 =?utf-8?B?YUF5Qk9GZGQ4bUNidE96VWV0SUVkRTJwOWJsNk1mY0M5TFkwbkNNUHB6cGMz?=
 =?utf-8?B?cTBjdTFoaVZybFFtVThlcER0UVp2di8xdXlQR0hBd0M3MjhkTDY0LzltSHVl?=
 =?utf-8?B?KytlS0tBVUhtVXZyTXBYbncwemFiUEwvbTY2RVc5QVFSQ3Arbzlpcm0yV1FI?=
 =?utf-8?B?ZG5WUGZyNUNNZVVzbWxmWnJ5aHVwa0p4ajhZeXpIOGthajlsaWRWQ216N2hs?=
 =?utf-8?B?dUZWVWFid2hiR1BqYmFvcjVFNnFtczQ2ZEwzc0lkVWlCTVJ1cGRmbXVOVFRU?=
 =?utf-8?B?UG82eTNNVXc5MTdxc1dsWndaZE0rVWg4bjl5akpmdUU2TzFMcmZ4RlRlenJj?=
 =?utf-8?B?VG5tekk3RVJNZTVOdzNYckM1S2g0WTAwTks3M1BGY3pYc1dGdmlEMnVmck9D?=
 =?utf-8?B?Zk1GSk9MVGhVVEZaWEZnWTVTVml1SUx5MVFyOEg0MzQ4V1ZtRGFKSjFwNG1r?=
 =?utf-8?B?cUVFeUlYUTUxRXQwdkZEWitBdU9FNkR2N2Z5OVo0ZW83ZElQTXBmcXRtY0RS?=
 =?utf-8?B?Nkd1M1dXTGNPbTNOUWNSRzA1UHpXMjJzUmlEeEQ1RVpQWWVTd05wZGdmTnp5?=
 =?utf-8?B?RnVDbDJmbzRnZ1BjVVB0SW5sREZ6SE8zVzFIcWZUZVRlU1pFcHFZQThQSVBN?=
 =?utf-8?B?R1lmWFdVd2c5TDNUaW5UWGUzMGF6Mmp6bWF6bW13ZXpodHJTcC9CaGdjeHp0?=
 =?utf-8?B?eXpZZjhwaXZzczJLOUxNK3ZYU2FLV1RwWFJ0cEdIVU9CU09MbVNUVXBraFhM?=
 =?utf-8?B?UER5Zk5ybHM5b1FWcW52QWluYW03OENENlY5UVVxdlhDRzJFZlNZR2t6bjVI?=
 =?utf-8?B?TkNVZkRESnFnR3RZOS90K0Rqa3JtU1BTU0liWkVuQ1lQdENqbzBuMVFkZ3NK?=
 =?utf-8?B?VS8xVm9aT0NtZXBoUEpQQWkzN0NoWkhmMzNmTll3SkdVUFpaMnVBdnNFcFZi?=
 =?utf-8?B?a3JONW0rcGZTSnRIMTdodFk5R2lzdzNJWjU0a1NBVmM5eTdNRm9iSjMxcVF1?=
 =?utf-8?B?Z0MxRjIwQUtJNWc0azVGbCtMakVDbWYwc0NxVkk1MW1ySEIyVTBUcEZKanNJ?=
 =?utf-8?B?ZlZXWjVMUjd3QXY3czE5ZmJBZDE4Y01hWW1KOUNXR01WRzFENUlnQWwvMmxL?=
 =?utf-8?B?TldzQnRWbTgzSzU5cE1JOE4vWWNOOGJ3U2MwNTJyNjd5UG5OZDBpZ0dtWXpm?=
 =?utf-8?B?NlZUdFdhckZuM2lFa3paRzdlWDBMVjZvVlBpRndwNFM5VmRJTmpKdHlXcGNl?=
 =?utf-8?B?eFMxbWFybmhSYTFvTWt0b3pmMFdJVm1hQ2lyMGJsbUx4VGVIaC9BNVlReHVL?=
 =?utf-8?B?VGpSQVYwNmlIc0dId3NvQTlaMzI0UGduWEc1SW90MmVrZXZSUjEzemZQTXlN?=
 =?utf-8?B?b2VPcDdLWXZOUmY4REhjMUxJNnhKbzlHM0pSb2pqZVJiRjg5UVBEQlgwUzRV?=
 =?utf-8?B?UW5XcURpNmZyWVhUd25YK09BZ2JFNlREbDFwakp3RUlkR1VzdFRpQkdDT3FF?=
 =?utf-8?B?TGVySG1ZdnJwN213K1o5T2lraE12SFd4bXBwMU1nUXdldU5EU1A0b0cxN01C?=
 =?utf-8?B?VjFMbStJdVZxT01Baklhc2VCQXFwb3dkY0tBemd6L2ZhNEV5M3FqbXJvZVBC?=
 =?utf-8?B?akllMEdFYnIrYW5RYW4vbHVSTnNIenA2Ly95UHN2SmFTYndYYWJRZW5icEpN?=
 =?utf-8?B?REF3QktYdXNiZUZMRE1TdTExZm5vVTcwZ1BPTUZEajJlVEtZK1ArbkhOTHVS?=
 =?utf-8?B?a2FibFg0aDBCakZvdWVkUkJaZTZ6d0pXSHA2alJsa25qSXZ6RXBLdUJGdEhH?=
 =?utf-8?B?b3p4aVZxdUVPUDY4dDFLUzlnSy9jOWkxcUl1VlFQcDI0U2g0WStOOVdMYXdE?=
 =?utf-8?B?Z0E9PQ==?=
Content-ID: <8E53B523630CC04DA793C216BCADE628@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b519d0e5-44e0-4507-2a56-08da6af02c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:08:19.7931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+YtU7hPCoFtvBX0AVcHcePVxq6mP7CUc/MhPwQTWSUJgFXWdaGyJVXE8TN0m47+BFcP1+eYgBat44nHUNNsFFvnOnTH67SoJvgQtHHsIYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1525
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_010826_168691_841F3DBC 
X-CRM114-Status: GOOD (  22.62  )
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

On 6/3/22 17:16, Tom Fitzhenry wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for the siliconkaiser sk25lp128 chip.
> 
> This is the flash chip used in the PinePhone Pro[0], found by physical
> inspection of the board.[1]
> 
> I cannot find a datasheet, but this chip supports SFDP.
> 
> This patch depends on SNOR_ID3().[2]
> 
> Tested done: checked that the Pinephone Pro boots when a ROM is written to
> /dev/mtdblock0.
> 
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060101ff00060110300000ff9d05010380000002ffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f9ffffffff0744eb086b
> 083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
> 11c7cccd68467a757a75f7a2d55c4a422cfff030c080ffffffffffffffff
> ffffffffffffffff501950169cf9c0648fecffff
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> de4d6be54e479d60859b0ca8a0ee9216
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 257018
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> sk25lp128
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> siliconkaiser
> 
> 0. https://wiki.pine64.org/wiki/PinePhone_Pro#Specifications
> 1. Thanks to https://github.com/Biktorgj for finding that.
> 2. https://lore.kernel.org/all/20220510140232.3519184-1-michael@walle.cc/
> 
> Link: https://lore.kernel.org/all/28d3925a-983a-fcb8-19af-6e6baf892d53@tom-fitzhenry.me.uk/
> Signed-off-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
> ---
>  drivers/mtd/spi-nor/Makefile        |  1 +
>  drivers/mtd/spi-nor/core.c          |  1 +
>  drivers/mtd/spi-nor/core.h          |  1 +
>  drivers/mtd/spi-nor/siliconkaiser.c | 15 +++++++++++++++
>  4 files changed, 18 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/siliconkaiser.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index e347b435a038..314ac7773369 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -12,6 +12,7 @@ spi-nor-objs                  += intel.o
>  spi-nor-objs                   += issi.o
>  spi-nor-objs                   += macronix.o
>  spi-nor-objs                   += micron-st.o
> +spi-nor-objs                   += siliconkaiser.o
>  spi-nor-objs                   += spansion.o
>  spi-nor-objs                   += sst.o
>  spi-nor-objs                   += winbond.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index fdde80d9f388..e542d3009915 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1624,6 +1624,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>         &spi_nor_issi,
>         &spi_nor_macronix,
>         &spi_nor_micron,
> +       &spi_nor_siliconkaiser,
>         &spi_nor_st,
>         &spi_nor_spansion,
>         &spi_nor_sst,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 87183cff3251..8997099f6c5e 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -625,6 +625,7 @@ extern const struct spi_nor_manufacturer spi_nor_intel;
>  extern const struct spi_nor_manufacturer spi_nor_issi;
>  extern const struct spi_nor_manufacturer spi_nor_macronix;
>  extern const struct spi_nor_manufacturer spi_nor_micron;
> +extern const struct spi_nor_manufacturer spi_nor_siliconkaiser;
>  extern const struct spi_nor_manufacturer spi_nor_st;
>  extern const struct spi_nor_manufacturer spi_nor_spansion;
>  extern const struct spi_nor_manufacturer spi_nor_sst;
> diff --git a/drivers/mtd/spi-nor/siliconkaiser.c b/drivers/mtd/spi-nor/siliconkaiser.c
> new file mode 100644
> index 000000000000..c3ca157244b8
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/siliconkaiser.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info siliconkaiser_nor_parts[] = {
> +       { "sk25lp128", SNOR_ID3(0x257018) },

Does this flash implement the manufacturer ID continuation codes?
Can you read more bytes of manufacturer ID and dump them?

This manufacturer ID collides with Tristar manufacturer ID from bank 1.
Check JEP106 standard please.
If the flash does not define the continuation codes, we'll need to
add this flash in a ID collisions driver.

ta

> +};
> +
> +const struct spi_nor_manufacturer spi_nor_siliconkaiser = {
> +       .name = "siliconkaiser",
> +       .parts = siliconkaiser_nor_parts,
> +       .nparts = ARRAY_SIZE(siliconkaiser_nor_parts),
> +};
> --
> 2.36.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
