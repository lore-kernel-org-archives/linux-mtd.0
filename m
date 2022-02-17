Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA03BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ls6+pH8h6dxmjzlJAlYhjpQ7Rc1Ev1l7Fzr7ngEaG6U=; b=OgCKpO+hNU0nnW
	pXEMmgUBJ9z+ABPEYb+Mb13lrNzBC5p2qGFGOBCvIUa6L+GtO144VbiWk0yLXVZ/Ho6UpmnfSNLxr
	6r013gyuqLIrnOdOyeP+jGEJzpjAdyziWjyyC0c9M497Lhk2uD8PD2ZqfhyL9BxP7OuXZHpHloxTS
	7GsX8MjTcIIKuAvpkvSE7TAaMy4BhQZQY6JKorh1ZyLeWdfwcu1XCm9dvY9Z+O17i7Ef5Nu1Mlm2N
	CJXs3bSgU2zjN9R0yrAF1QjasbH7TWv8mC9sSulKPV/tW8O9APC5DpMrHsC6XnwOAbs4SmpNtoguX
	HRwHMdBjYehPRoc5cMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbGB-009ELv-5p; Thu, 17 Feb 2022 07:31:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbG8-009ELX-1J
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 07:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645083083; x=1676619083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LYvdI/bbIJQA7ZuMdEk4g9nvrhmLAlyCzyzM2sHxOHA=;
 b=czQ1xg22T+DZy+Nr/S+bzp01HVfEiBYEEXdQt3gS9xYeS5415E991C4m
 VnCj3WctdUy+85uLkZzNBDT4diEAgCPOXAP9WjS3ZPAAGacAVlWUaYuAp
 QNL6SF17zNjzbDW3/Rzt4mFflWTWC3iqLxDvaAoh6uh0weWMWbv/PqDHY
 Qo3OKU89rdt/vO1eHPec7p3MQK+nNNKP4KBNvHHU5o2uShC19bV1avOJ5
 IS3tK9xJsyzZB6IiZJd6suHsam0wvp0HqjjJr3mHBNWkXhvlIB3a6TuZp
 qpkMq/bviySiUXWenfi5gihoQS6Jd54Efq/NXRNpnBq3X7emwcJfDSiFw A==;
IronPort-SDR: KYtF9ZRSQj2UPVDnFr9fMYSjTEbhwdaeHeHdeVPAQb46eZDM/zmGmQIPru4eqfYANMaRvtppY2
 kPXlP36bZ5AfNuH6Qlwxjizat1a5QArKCtppABgjw6sBiGNdfPbxC40yWzd9wv0TtGSBi039qu
 NTLY8GSQQ4mxaciKiXMy4xSfWrAnMkGrG2ncNawjthLhbGgb5DPBDwqZ/+q+7YYhazghceon0R
 sdeGSO8GDQXBrkIET0gdvc+ecJu6Hw8HzsZ80X+U17u4yUAOsMtbZo+/dqt15CId4RwdzyuWaP
 bR4ot2klnsEk6AEzzD4uG1HB
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="153901979"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Feb 2022 00:31:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 17 Feb 2022 00:31:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 17 Feb 2022 00:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+8o8iMkdjOov+qPHpZ+KInpM4HM0PbOIPI950qaheiBVkM4DPZ39Ai1iGimsmHBjQwTy0uB2jWU0vodHUzcjiUUDS3C7giGGwlKHifsSxovDaR9SbJRFpcHonVbMQUeQ1OBLZIDPADezJSluatjpg/H8JQymNLHP+3aOTr2HkXdQZDzsfAa2fswoWUi6I/DlPKDtDrUSlIQYWZ9HxwtYnP3oGforknNa0cJJOSgWDgLZf5nHgYJoew72mFLZjSHxcE/3/iLzqX7WfVsdq3hVcrs6JT2RM+PmG5A+WP4rfF1S/JowUhQZJy3S76GdLBNGKAim/AZI2w/k2BbjdatWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYvdI/bbIJQA7ZuMdEk4g9nvrhmLAlyCzyzM2sHxOHA=;
 b=VSDRoKOVVGVTDiuPuO0ZNogRC+Lg2BcKukGnRYQTorK0Rnkg63KMh+K0BAFZX6/MeYx8pzJg7Fpv7mI8MvgT9BXjbNXjxpdsL2kOA+yiqTcUbZX1uApfeVnwlh7qNvzkOsyqBfQv/xWCg/0sbRPN2lE7/Z7UUnias2hzD9gUU2QB7nIMhRJp2v5pch7T0Eq+MySmmitkqWvHGCZyALPidKaLzkvLU/6+f6Cokexp1XeId4yfgUc/gLQksjcjW+oLg+pZmS6HUGlKFFsXwxPz9JVi8aVQApq47U7GPWysEAsIaWCuwYHCuLccs7g04OZBXseqKiAL6+h4L/vlsK+zFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYvdI/bbIJQA7ZuMdEk4g9nvrhmLAlyCzyzM2sHxOHA=;
 b=o46ib37Tkk70Oy1O6QHOY5ajE9HSPnEDj8uyrR7BuCelboAj3tbuRdwXBinaZgYwnn3vNp6kUnQhr9I4waMPgdB+66C3z1ujetUsKijhSgoZNLQyykAWtbUz4HWzcQLBP9bIHzY/VRUF16Dv16uzjTV2T0ctb8qkACmoulD14Cw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB3740.namprd11.prod.outlook.com (2603:10b6:5:140::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:31:16 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 07:31:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <yaliang.wang@windriver.com>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 00/14] mtd: spi-nor: move vendor specific code into
 vendor modules
Thread-Topic: [PATCH v1 00/14] mtd: spi-nor: move vendor specific code into
 vendor modules
Thread-Index: AQHYI9BYRn0sp/gsuUe9nTLTR7wB3w==
Date: Thu, 17 Feb 2022 07:31:16 +0000
Message-ID: <f7b01151-5d25-661b-6eca-5f18aa81ce73@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0145153-b13f-4ff6-af95-08d9f1e77ba6
x-ms-traffictypediagnostic: DM6PR11MB3740:EE_
x-microsoft-antispam-prvs: <DM6PR11MB374060954A8432E379C367DBF0369@DM6PR11MB3740.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1S+xr8ASXOYFZLvsdf///nEMDe5NnJsFctf2JRBEu+Zhf/F/XBFpa570gvkgO0+YxmoOADLuJO/4ClRGtFgVH4PwU0iJyP5ursOKAsRK/5AlheQRsWa+dRML2l3Mx+1mkxS4W6BZial/eX6dKpQQsTA+CsOPiKCKZniN54irdIrx6TExmnSRazrxZ7nLMUkIkG8LT7bzBfTR/tUqWnELoP6o+UXLpNc8rnH07ptpcR10qcJ5TIajObfIWmLsfBB9/KqMA+bur7BTUeHidAGJja5Nnmg13LzJyA1lLhdBaRJ+//fjqQkRdGXsJ3HUxXn/I/CYH801Ksg+ZB9jWDIePkT1WaSbhzSIXowT/ebvC7/YszuUme9nJ9VKs2USVUL9+GO2PMAp86tbIcXW0huPvgA3PGBRwb+N42Hay0FhSSE8KIYJR2lcDaziYIacOTZZZuCDJb+MRWmvdiLXK8m+9xLU1MfS3d+ucGXUafZLm+QHAG8j+Iav/t+o4BNZW5GCLwyCHE8sLyZOiLChkq451cEuaj/YPLZq4tAFMoWw5wccoKH2FXJCzp7wXKmGTjhCw4BLUapam6Dc4Y08Sjc6IZwT/AuxGEkwZPbWEuiPXQJ3JM4COX+0ser4dp+ZRPLVkGbgizcU83bmu/MQxLTRnkxKdlxv330J9IVH9FUgkieJ2Ey+2MEb/eA2n3vdBGpP5tcZrempD2w3oint2gKhx+V8OfmzY4IebFCxq80OG2FX6/Ske0aLSLIJRinBEguhxSLEPv98kUCCI/j6GKYJQpWrqbC4TLGxUuzQ1fsuU9GvxCjMlGiaVhdx5vY+UkpB9xj86YF0gzQr/IiORRuwmXmhkfFMN4ArTZlh5MG2GA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(508600001)(6512007)(5660300002)(91956017)(66446008)(4326008)(66946007)(6486002)(122000001)(186003)(66556008)(64756008)(83380400001)(966005)(53546011)(8676002)(316002)(26005)(31686004)(36756003)(66476007)(38100700002)(38070700005)(71200400001)(31696002)(8936002)(86362001)(54906003)(110136005)(2616005)(6506007)(76116006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGFrUXJLYkE2bmtqWFlwMDRrR0hLZUxueDllZ2R3STdXUXFzL09vTDMrQytr?=
 =?utf-8?B?c01HaWR4K3dsaFA0TXowMHFoMmNWV3I4cDdscFNyUEhTRXJ2Z09icjlxdEtn?=
 =?utf-8?B?ajk1TEhZRjgrZkZSL3VYQ0txeEZFVlc2aHFyVis4N1dQcmFrZkhaM3NZNjNB?=
 =?utf-8?B?QUU1clp4TFNyeWZOZ3JMOWRZd1dYUFVkWXBXVVNnc1ZrMkJKeEtJSkdCbDNX?=
 =?utf-8?B?NkQvNXdvQ1lLbUdJNGQ4cHZBMWFHMUFjVXlqMlh3eW56SXJZeEg2eEVDdURp?=
 =?utf-8?B?R05OTHlwdjExb2pRWnZlMGpBc3J0cW5BVG5JdnBDR2ZCOUE4YmdKeUhJQjVw?=
 =?utf-8?B?WnF3bVZ3NTVDSXhiOHlZRXU1V1pnYVBSRHdVUnRXdUpPTnRKdFhHajFWUU02?=
 =?utf-8?B?TVpZZ3lKckY4aVVwMVFVQ254dG9Ybm1zV1kvMDJNUGgwRXFjbEJ3YmZwTzNS?=
 =?utf-8?B?czVGUEx1MmVzMVZQbDVEOVRhNnhKK1pFNFRwd1J2TGJoOVRtNDBJWnQ3TzZo?=
 =?utf-8?B?NXZRWkkxcnI1aU1rTUhtSVZ4NmVZR0hTQWh4eFgyZFJ1aFp4MUdLN0djWHIx?=
 =?utf-8?B?OWNnUm9nMVpSSkNCcVhkblNFcEtRYWxvRllzS3l3NHJJeW16b0JUYjBuWmFH?=
 =?utf-8?B?OE5WZjdKdzZOUXlwUk0wbzdpQ1FIeFBQOUxtVXh3UUU2YitUVEVicTRuNEto?=
 =?utf-8?B?TlR3WWxYbmF4YUdqMmtZZ0k2SUNINzhsUzJ5OW9XR3RrRjNSdUJqU2xVaVBj?=
 =?utf-8?B?TVZmeTF6aFRIc1BuNW0rb214dTlZcXlkZ2pnU0dJZWdKQmZSZlhiK3dtdmZr?=
 =?utf-8?B?VkF0SjJKWkRDYnJyTlVoNlEvdGNYS1JocU5HN09sbkFrYkd0a2xJYktHNzRa?=
 =?utf-8?B?V3lvZS9mYytyNzIyNE1Ga2d5RHdNKzdaWjJ2SUE3dExBOVpVMExKYy90Nkwz?=
 =?utf-8?B?aXhEc0pHcWVFM1AvY0YrdnhtOVdCZjBVN1lnYUhXQWhEeXdzWGFBeHVsRU5j?=
 =?utf-8?B?eUR6T2pMbzlHMzNnTWcyeFpVa1hUNnNVT3V3SVV6VFltakFGY0RIcFBqWWVu?=
 =?utf-8?B?TkRwMXJkVmZLcllkK2dOL2MrVjN2TFY4bENpSFhGYzN3M1NGQThyWDRzNjZq?=
 =?utf-8?B?eTVJdTRtSmlvU2REeHh5MHZyNGpPcWJ6ZnJYaWwxQXRacG5WNVBvWS9mcC9r?=
 =?utf-8?B?SS8vcGRaRmI1ZU45c0gvbHZVOWM0UXJES1g2V3VCSGErV0tXaXBSYXhkdTk5?=
 =?utf-8?B?YXdPMXltUGs5VEJIRW1wNW5aMjBoOGNnK1NTcWdOcjNLeitZcWF5VVJHK21K?=
 =?utf-8?B?OC9BVXA4bkRKSUUydDRiYm9EUnBtdnNvS3RuNU5xRk5uRDYxK2VqWmFubk9V?=
 =?utf-8?B?ZENJUzNnSjNTQit6YUt5NkxhemwxR0NTYllmcGxPYmJmZHZPS0RjZ1hEMlE5?=
 =?utf-8?B?WjNmOEFjMmw2VjFDKysvZklKdFdEZDZ5MjFIZzhEMFVWa1FPbHJwcUpMelJu?=
 =?utf-8?B?UmlrSGJKdmM4UGoveG1EL0hQTVZLZnJNWkk5cDhzYnJIRnFsd2x1TkxkRDBa?=
 =?utf-8?B?b0FjL2REUUx4K00wUG9MeGhRWW5yRUhEdVV1M1pERk56bXd4WXJuLy9vOVFQ?=
 =?utf-8?B?WU8vQTBVUm14MUJGRVJhWEZDRlM5WFFUdDQ2TzNsbW5mcTdCdW5FeVZkOEN0?=
 =?utf-8?B?WkNvb1VUNGFSZzRtV2c5MDlZQ0FtK3ZBUlB0WjkvbTdwZ3hUQ2JMSUkyTXQr?=
 =?utf-8?B?MStXVk1KeEF5dGJ1cEJPQ0ZVelJsWlRCWXo3d0FwK0pMNUs4YWoxdjRSbkQ5?=
 =?utf-8?B?NG83dlpDK2ZESjlSZlUrOWdGUmZiNnlKZVRkbVBjL3J0RXp6SUU4NFplc1BW?=
 =?utf-8?B?Y0pLME9BdVBDb3BsUVYyKytDR3RhWDFaS2doVG0vUnZpTUhBemtyQ2htTFM2?=
 =?utf-8?B?VXByOHlaQjNWcmxZTS9KckdoUjd2UWladTFnQjZJdHBXS0FQZ1BqMFpMZjc5?=
 =?utf-8?B?L05DenZqa3RjN2NxYUJ3eFNFenFQS1hiWGFNaDdMMGpodi9FVnpZbWFXbTdy?=
 =?utf-8?B?ZEFMeHkxN3I1NmFTR2s0M1BuWjB2NEhmaFM0b1BVT3RrVVA4cHlod1VvQmlz?=
 =?utf-8?B?Z2w2QWV5ektsVFZyTm9hTXpiZDVzVjNtRU1LbWNmekNNY01Ca2tYM2V5RDBv?=
 =?utf-8?B?NG9jUVFORUFsSnZlNm5RNlc1N1Y2WVhaenBmY21aRDlxT1lQdjZRT3NmYzl6?=
 =?utf-8?B?SDZPakpsK2NqUTU4QzFQMm01MnpBPT0=?=
Content-ID: <9A8FA1935D3A8D49AC769911DB68776E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0145153-b13f-4ff6-af95-08d9f1e77ba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 07:31:16.3271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4vVCxF9W5dlZF2V6gJB2GfKwnGSzm9DBtt8Q+IJetIQQ0X+2ZOVBqCoNwhcoK5UGUHvx1OqwwaKVNxfwILWZ5YSm79JUiAZKlJnVQ+ug0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_233124_222521_7F925B8D 
X-CRM114-Status: GOOD (  18.84  )
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

+ Yaliang,

might be interested in reviewing/testing this, as there were some similar
patches submitted a while ago:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=237043

Cheers,
ta

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It turns out that most of the special status register handling is
> specific for a particular vendor. I.e. Xilinx has some different
> opcodes for the status register read, Micron has an additional FSR
> register and Spansion has these flags integrated into the SR.
> 
> Create a callback to ready() where a flash chip can register its
> own function. This will let us move all the vendor specific stuff
> out of the core into the vendor modules.
> 
> Please note that this is only compile-time tested.
> 
> For sake of consistency and better readability of the code flow,
> I also converted the setup() callback to be optional.
> 
> Michael Walle (14):
>   mtd: spi-nor: export more function to be used in vendor modules
>   mtd: spi-nor: slightly refactor the spi_nor_setup()
>   mtd: spi-nor: allow a flash to define its own ready() function
>   mtd: spi-nor: move all xilinx specifics into xilinx.c
>   mtd: spi-nor: xilinx: rename vendor specific functions and defines
>   mtd: spi-nor: xilinx: correct the debug message
>   mtd: spi-nor: move all micron-st specifics into micron-st.c
>   mtd: spi-nor: micron-st: convert USE_FSR to a manufacturer flag
>   mtd: spi-nor: micron-st: fix micron_st prefix
>   mtd: spi-nor: micron-st: rename vendor specific functions and defines
>   mtd: spi-nor: spansion: slightly rework control flow in late_init()
>   mtd: spi-nor: move all spansion specifics into spansion.c
>   mtd: spi-nor: spansion: convert USE_CLSR to a manufacturer flag
>   mtd: spi-nor: renumber flags
> 
>  drivers/mtd/spi-nor/core.c      | 265 ++------------------------------
>  drivers/mtd/spi-nor/core.h      |  70 ++++-----
>  drivers/mtd/spi-nor/micron-st.c | 225 ++++++++++++++++++++++-----
>  drivers/mtd/spi-nor/spansion.c  | 133 ++++++++++++----
>  drivers/mtd/spi-nor/xilinx.c    |  79 +++++++++-
>  include/linux/mtd/spi-nor.h     |  18 ---
>  6 files changed, 417 insertions(+), 373 deletions(-)
> 
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
