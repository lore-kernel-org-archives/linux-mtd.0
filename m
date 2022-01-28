Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q24V0EmGNY8xk8heMzqo9hCi28BDhV80f/XSKaQXssQ=; b=C3NUtKEaQIKYaf
	ZhphCKZgpDDaoLwxk7umF2Dwj+iOL0++jkDwDOxwgbZRBt2qiOI4WdNTrZxGCFEOsGEibipk1e6zt
	kUqskSMa3BBZe5HdOvXAeYdSvWrDyJ3aNh7ifeyogiaEDtXeMh+Mc1ZKBkvpUTg0l4pLr0CdnXyiA
	WeTAWa99JLo8vSpf7M3YPOJHQzeaBy9ibhHqnH3VbniibEpUOnJxfScgwxeefl4E0vy29gEupeFb5
	ugM6oEEUlLsawA9hSgNkaAlGE8U/vY6VMa+PM+C1cNzdD4MMDIoAXzq3ks3mYQNTSoojhYifRFZHH
	cJZX705hG6Xm2gwujwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNne-001Ii6-Tm; Fri, 28 Jan 2022 09:44:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNnX-001IgV-7O
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 09:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643363043; x=1674899043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kUYbjIrHifyFhAnpsUAMfgjcbBOrG+qy32iDGHH3teM=;
 b=OxW+w7wqWA0//y3DgvLhDEfRzRiV18pB5Mw52bfc++1e4ji96G8hCe99
 0Z7Lt/NPzzTsVn2jPG8YcGAlSChtWRzGjkRKZ6vesv/MeKjnB/bb1Zwe5
 wyqwJmJCB8D1Fc9WvupL/O7V1ZzPpkmeFvkDl//dl9qLWWNY47PcKfwYH
 EXU4bXS/CBxvhiVDZ+AMUvKTwKmue0BfiXrcoMw7kn0an37V+K8metsox
 59fjY9ysCOjxM0Om9X2q1H3o5/tizgpp1urtVdb1S5ofOWp2iIs2waU6D
 /DEghPoi1YwZUFFtAMqcnG1Fc23jN75nAeuBKwG55McHZ1ZQEICtd0AP3 g==;
IronPort-SDR: DE229p5UvPCyBYkXOtROkeNNVHa2L8RRvIeJXxm8xGzpBuOCgUjz3I14bX+Mi7NT6lWl7z5dti
 rxlmNUifyOdVHucSMZGi7dXDXRnB9ib53wLFcSxw/uLloYCwFNrq2PBG6TyLW5nESh6R6n3t5A
 OGo+x3hIdapi5GpqXkJtDUSvGRls5xB7dOYlC84G/2Y/148SDnD5W2AW8jwnXudES6C0H9Cerz
 J9IfPe1gk7CLwBl4zGlTPdfxVRucd1wwGNtnLLhLRDy440KC+FCxPLgEj9x9VfHeuPgrVPdVuJ
 h+AoBzJ7fZwd8znSMyJMiQtM
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="151760918"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jan 2022 02:44:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 28 Jan 2022 02:44:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 28 Jan 2022 02:44:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAdh2V9BEQJ2Jl7dzPeHPfm+W7Zp8AHKulphy1y2fhQjFd9PIHaKHWufTPjTyeBcRJU6dg28j+j5d3WihE59rXVSWyWi1ekyI/OQPf9y0krwA4LjcXLKnfNT4N7xG45HvZUP3qZ0ujc9mnZJ06PM0tvPgrOHkOG44ZNcfSJYsiQ1JCUyoF4QNdWtcKsnhKQCpyerLs+7WNb2xFgvQMcnB+ILLgdBmzhSrW06bGvkqg5QiRzzoifhPJYzK8NqRJ4HU6WHwaI+K9Nk+v6Z5vMJjBGcdywGQj9rh7JaiduKBIRlaPUbJCf/GgNW0Nzwto4lW/HMr3uav9OFvNP9YTgqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUYbjIrHifyFhAnpsUAMfgjcbBOrG+qy32iDGHH3teM=;
 b=D4grM4Jo29E5fcjs14tkoPov1NiRdjyWZrM0AUPH4FW+XFwKNYX0QXFFaYHRcSSWcx1ZdSoaaT8hLVx11wjYAyvO9UFqwZdXiKrv9BS182TdEsz9EA0kzECIo/LsRbq76xeO2JCHkj1C2riUC75D7b5cn/UtjaqWaEbLq3QwKvTjojgg0yMuzpO3THr1WiCZQQ68CanUteGFgkWrqvhLRROklMncKG1JtvbAGrwEso1R4TucaJTx34Pf3Z7wwNMTDrCnm6PTpqN28ipHZlFJGQSQFPCKHa74vvOeBgLPpsCsThfS5vqc6wVR2dMV9OivQEq1YnLs0fuh9g1o+7V2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUYbjIrHifyFhAnpsUAMfgjcbBOrG+qy32iDGHH3teM=;
 b=h9XyrVVtsU4bCxRepK+4kifKyIiPnMdwYlAceuxg4o6lLYg61T8bYLLV7Saw/kidJ8+uSHeqbmN+HLXjA3sG9/56aTndrW7cSVB4AT9sN/yzKX7g/8tcMUlF5BINpohyr5trJxaRp3jLILsuCGm5qctBxCoakttezRFJmRkxrZY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB2778.namprd11.prod.outlook.com (2603:10b6:5:c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 09:43:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 09:43:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
Thread-Topic: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Thread-Index: AQHYFCuR+A5oVBDUhUqz+UBnUsWCgA==
Date: Fri, 28 Jan 2022 09:43:56 +0000
Message-ID: <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3106f22b-6104-490f-e40c-08d9e242b444
x-ms-traffictypediagnostic: DM6PR11MB2778:EE_
x-microsoft-antispam-prvs: <DM6PR11MB277880C295EFBB6A27A47F29F0229@DM6PR11MB2778.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: boHsZ94pOeXyn5y4kqyUbla6H9eQDCf77/mDgTbUgNSaSEnZshJq0kIaq7trG9DFmntRXfyNbitjRQB5DTH/UQnXrIfkdITZOlj9K7NCD6mEGSE/rpMcs363aX2qr2WrmKAows7Rdx/OokgltKw78wKCMOjFxFTkseBX63R0GNbqhZOyOFxaMdru9zZjupd1zmqJ+0P3e+nFYrz0Xi1E8Mb+ollnUcDMBjHPlTsio7bu/QN1+8pdkPKWkoHBT3TIiVNOjgYka14TtpyGjkZjQhqagKx4+FOtwHB2hOLAZUdeHuQhUEvQ18169Jo6xZmtvSeo7P33QUKLwL61hIKzIQJ3yZBxJyaDpb0YF9p2AgLsEtXK4VxUBtiPTvf2aMJdVeSiLqnfDDCr0n8N6+gObqgOwWGE8w0CgA1quBoZKhI+ijE6N3dk7oz7GE4ah6bE/TSRwuwpDe0FqiTqE+cTxiA8E/KXmrIH+UGP5FRMVqIuZzFQSDyUK3YsmvS6fRpN8AI/oDffBixcPHDYXPs/szKk2crwhZYlv2Ng2qWF48PfcH3pBvW3RSKy5IRaxn66G8jGnvsYiGd32Bgm6phdV5ryzwYAxitRyluU0QJS1xVQsxeFQuEjY1pCAyph/0e7ftGU+g8S3SpS98gHfBERaGPHgTJScfhuL4Q+1Y80AehJii0RWhSEgdrjCG0q2tJk6gy5rbWj/f/8WsQ6jzrZiu4K6r9+3Hj6RFtCCgQNqVlDYqHW68gXkt2xczKiRYlbyefqvK9ABsy8GdFN2eHyrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(31686004)(53546011)(508600001)(54906003)(122000001)(38070700005)(38100700002)(6486002)(316002)(8936002)(8676002)(66476007)(66446008)(64756008)(66946007)(66556008)(31696002)(76116006)(91956017)(86362001)(83380400001)(2616005)(186003)(6512007)(71200400001)(4326008)(36756003)(2906002)(5660300002)(26005)(6506007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akh5eCtjRXVWejZzUXBzUDFtdWNZc0NEc2dveCtOUk1tNXlWdHVnRWtYVXNT?=
 =?utf-8?B?MUxKWHJONnlVbzVxUWMzZktPQ0h4VHhiclZoenlOZFdSVi8wQWsxZHl1Zlh1?=
 =?utf-8?B?ZW1xY043NDh1NFN2RTlDTERHUjVnVWdxSk9VbCtNYy8yRlVoKzZrVWs1VFVU?=
 =?utf-8?B?UDBpMkZCR3pVMGZpUzVyWFlNOXZLYnl4UytROVlWWDJzK0l2ckpsTStSK3Vj?=
 =?utf-8?B?bzJFWU9DdkljdXFCdHRDRFR4eUE1ajNrZm9aV3hqRm4yK05hQXBUSHlNbG1Q?=
 =?utf-8?B?emhnRy9qTVBCTFJXTTBGZEloa3loQTkrREpTaW1DVy9BVE9vZUNXblN1TGd5?=
 =?utf-8?B?QnMxc0NyMVB4aHNnT3FQU051aHdpcitxOUpOUVhWdUxWL0pFRjk0RWlkRW9F?=
 =?utf-8?B?bDVQcDAzWkdMTk9mbXkrWjR1Y3hJVGNtS3VuelRKVXdxMVFBUUFNWThrcm9Q?=
 =?utf-8?B?RWUvRnFYeFIvUW4wQ2tGczFLbHBTOGorQWR1aXJ1bXBmZEtmNzRVeHlVNks4?=
 =?utf-8?B?VFFNaUtzV05hYTkzcko0K3Jzc0k5R3VaakZCQU1NSGNOYndwbjkxOUdXZHJX?=
 =?utf-8?B?NUpBVlpWT3g4UmV6RXU5M0d6aEtLcmRuNnFKbVdUMCtkV2tJZEJGNU1SQkFE?=
 =?utf-8?B?V090K3F0WEFiQzdweXNCRDIwbEtnUU5QdWR6KytMTmpGbFB2cFk0MkFlNjBT?=
 =?utf-8?B?SmZJMkFvY3lJclo0ZVBkKzQxdnVRVlZOSFh2aDFEQ0hLWktmNm90cEtKTm8x?=
 =?utf-8?B?dXlKQ0ZnRTYzbWxFd2RRKy9paUwvbGNCVUtWcXBybG1VZU5NMThhbXVaUUs4?=
 =?utf-8?B?eG41Y1JVaXpTQUhQemFwcys5azd4eEEwZEk4NmlUWHRWYzlYajJXYUk0R2k3?=
 =?utf-8?B?RjNtVmZpM0NPNU1TMm1adkdRUDIwNFhaWFJUTitUQm5venhsNFNWM2g0cXZW?=
 =?utf-8?B?Q21iaFZENGI3Sm5pNkRmenIrSjMvWlJmUnRYbzY4aXBHQWxrM01WZ0VOZEN1?=
 =?utf-8?B?N0JxZVlJTldXd05Tb3U1WFdIMWp3UkZrM2p0OGtPaGZOVkFUbFRPTWwrWUNh?=
 =?utf-8?B?eloza29pWlJ5R3hPK0JoQVh1SDFXQzFSVXFWRUZ0L2FyeWtxRmZFNmMvNnU3?=
 =?utf-8?B?ekZteVFJMlRveHNLSElyZkcvaGNZUmM1R0Y3QXhQU2tCMlJza1c5d0d3bnZU?=
 =?utf-8?B?TXN6cWNMaW84cEQrenBRalF2b3dUczhNWm96eGtmRE5aQnNuV2tVblg4bXBV?=
 =?utf-8?B?d2lpWlZnc0dQMy8vNTBJOFYyNzlmYXZMczZxemswcFJUczhQZ3VtR01uWUFX?=
 =?utf-8?B?ZG9xTzEvdTdPeXpPUjFQYU5pM0NVOUd2L2ZMT29waVp3MG85R2NsQXRZSmlo?=
 =?utf-8?B?OHUrdjk0Y3lHczFEcGlORUVTRzJ0blFCRlRFZjBIcjZoK01nQTM1amRzMk96?=
 =?utf-8?B?L1J0elJKamhkMzJCa2xBb0p0aDJwVy9PTm9hOGxBM20zenNVZWpJcVBET3VQ?=
 =?utf-8?B?bkJybkwzTW5BRWdCbFk1NzBWOFZYTVppUnlLZnlIY3NZdnk4TFUyWmRJdzN4?=
 =?utf-8?B?c0tPTTNOUGRIaklkSisya1NSbjU3RmdGMGw0QXRjYjkxODE3bDZWakI2R0Vp?=
 =?utf-8?B?Z0VxMk9JRjZ3VnhUbTA4RkhVc3Q4N1JONXhodTVBUlpSa0JFU2lpcjgxNUJJ?=
 =?utf-8?B?SUlLeklRMTZYQ1M4dXRoUmZuQ2ZGMlVMdE5MajhRdWxUTUFMVmxzekdjbzI2?=
 =?utf-8?B?RngrRHQxa1NhWEdsZE1URmZaRFRoV1BwL0VhOEdURVJwdmh6OTZ3U3lxSWx2?=
 =?utf-8?B?TlMwYWtrNnFxVmZaYWdOL0UrT0EwWlJoT1VHcEZybkU0T0RPak5wdGN4bExq?=
 =?utf-8?B?Sk5FanJSbm13elg3dHJhZ3Y1QjU4Yi9TZGYydnBBSzdoOTlSTllsWS8ybDZ1?=
 =?utf-8?B?cWFkelZOZHRCd2g5cTVYenRTL1RwN25tRGh2SDZyRDBDSSswRGYwcWYvOEda?=
 =?utf-8?B?Ung0aHpGUkZUMW1GY0VjS3FUK3JHN1U3eXByWlRCN0swbTdEUkJ4OWJhOXY4?=
 =?utf-8?B?NEVwaWl0anY2SzhnYjk2eXY0bzhWWUh0bjdadkI2OEY1WnJrZndWTWNNUElH?=
 =?utf-8?B?NVVEaVdNa0RmQk54SUhXV3JOZE9rMVlqeCsvd1NYL3RvMEtDcXFrdmxWSTRV?=
 =?utf-8?B?NHFjWlpKTG5YckhmUWg5SlI0YURNMytqbnJlMXZ3TGV6bDkzb0d2Q3plVG1t?=
 =?utf-8?B?ekdBTzYzOVhZN0Z3Z1g5V1VFeFh3PT0=?=
Content-ID: <09E5978E213F1A4DB723029CA3DD5191@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3106f22b-6104-490f-e40c-08d9e242b444
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 09:43:56.8830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OvMxnevEW8zQk1S95zxicfnSzkkcbIwQmCu5QVCUhcHqzZCQ5gQXZPkF2n0XxKRGMY5PL8/EBbOJQfZVJQhgDbWHO2ZrFXZT1fRFI8oG7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_014403_415103_166BDC79 
X-CRM114-Status: GOOD (  23.46  )
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

On 7/19/21 11:03, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Spansion/Cypress chips support Read/Write Any Register commands.
> These commands are mainly used to write volatile registers.
> 
> The Read Any Register instruction (65h) is followed by register address
> and dummy cycles, then the selected register byte is returned.
> 
> The Write Any Register instruction (71h) is followed by register address
> and register byte to write.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v7:
>   - No change
> 
> Changes in v6:
>   - Add helper functions for controller_ops
>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>     function header comment
> 
> Changes in v5:
>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
> 
> Changes in v4:
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
> 
> Changes in v3:
>   - Cleanup implementation
> 
>  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index ee82dcd75310..5e7e62704e11 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -19,6 +19,148 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
> 
> +/**
> + * controller_ops_read_any_reg() - Read Any Register using controller_ops.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @reg_addr:          register address
> + * @reg_addr_width:    number of address bytes
> + * @reg_dummy:         number of dummy cycles for register read
> + * @reg_val:           pointer to a buffer where the register value is copied
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int controller_ops_read_any_reg(struct spi_nor *nor, u32 reg_addr,
> +                                      u8 reg_addr_width, u8 reg_dummy,
> +                                      u8 *reg_val)
> +{
> +       ssize_t ret;
> +       enum spi_nor_protocol proto = nor->read_proto;
> +       u8 opcode = nor->read_opcode;
> +       u8 dummy = nor->read_dummy;
> +       u8 addr_width = nor->addr_width;
> +
> +       nor->read_opcode = SPINOR_OP_RD_ANY_REG;
> +       nor->read_dummy = reg_dummy;
> +       nor->read_proto = nor->reg_proto;
> +       nor->addr_width = reg_addr_width;
> +
> +       ret = nor->controller_ops->read(nor, reg_addr, 1, reg_val);
> +
> +       nor->read_opcode = opcode;
> +       nor->read_dummy = dummy;
> +       nor->read_proto = proto;
> +       nor->addr_width = addr_width;
> +
> +       if (ret < 0)
> +               return ret;
> +       if (ret != 1)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +/**
> + * controller_ops_write_any_reg() - Write Any Register using controller_ops.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @reg_addr:          register address
> + * @reg_addr_width:    number of address bytes
> + * @reg_val:           register value to be written
> + * *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int controller_ops_write_any_reg(struct spi_nor *nor, u32 reg_addr,
> +                                       u8 reg_addr_width, u8 reg_val)
> +{
> +       ssize_t ret;
> +       enum spi_nor_protocol proto = nor->write_proto;
> +       u8 opcode = nor->program_opcode;
> +       u8 addr_width = nor->addr_width;
> +
> +       nor->program_opcode = SPINOR_OP_WR_ANY_REG;
> +       nor->write_proto = nor->reg_proto;
> +       nor->addr_width = reg_addr_width;
> +
> +       ret = nor->controller_ops->write(nor, reg_addr, 1, &reg_val);
> +
> +       nor->program_opcode = opcode;
> +       nor->write_proto = proto;
> +       nor->addr_width = addr_width;
> +
> +       if (ret < 0)
> +               return ret;
> +       if (ret != 1)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +/**
> + * spansion_read_any_reg() - Read Any Register.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @reg_addr:          register address
> + * @reg_addr_width:    number of address bytes
> + * @reg_dummy:         number of dummy cycles for register read
> + * @reg_val:           pointer to a buffer where the register value is copied
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
> +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)

how about making this a generic core method? I'm sure there are other SPI NOR
vendors that use registers indexed by address. How about introducing:

struct spi_nor_reg {
	u32 addr;
	u8 addr_width;
	u8 dummy;
	u8 opcode;
	u8 val;
};

and passing a pointer to this struct as argument.

> +{
> +       if (nor->spimem) {
> +               struct spi_mem_op op =
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
> +                                  SPI_MEM_OP_ADDR(reg_addr_width, reg_addr, 0),
> +                                  SPI_MEM_OP_DUMMY(reg_dummy, 0),
> +                                  SPI_MEM_OP_DATA_IN(1, reg_val, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +               /* convert the dummy cycles to the number of bytes */
> +               op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +                       op.dummy.nbytes *= 2;
> +
> +               return spi_mem_exec_op(nor->spimem, &op);
> +       }
> +
else
	return -EOPNOTSUPP;

we'd like to move all the SPI NOR controller drivers under SPI MEM, let's
not add support for them.

> +       return controller_ops_read_any_reg(nor, reg_addr, reg_addr_width,
> +                                          reg_dummy, reg_val);
> +}
> +
> +/**
> + * spansion_write_any_reg() - Write Any Register.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @reg_addr:          register address
> + * @reg_addr_width:    number of address bytes
> + * @reg_val:           register value to be written
> + *
> + * spi_nor_write_enable() and spi_nor_write_disable() need to be called before
> + * and after this function. Caller also need to poll status for non-volatile
> + * register. No need to poll status for volatile registers since volatile
> + * register write will be effective immediately after the operation.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
> +                                 u8 reg_addr_width, u8 reg_val)
> +{
> +       if (nor->spimem) {
> +               struct spi_mem_op op =
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),
> +                                  SPI_MEM_OP_ADDR(reg_addr_width, reg_addr, 0),
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_DATA_OUT(1, &reg_val, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +               return spi_mem_exec_op(nor->spimem, &op);
> +       }
> +
> +       return controller_ops_write_any_reg(nor, reg_addr, reg_addr_width,
> +                                           reg_val);
> +}
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
