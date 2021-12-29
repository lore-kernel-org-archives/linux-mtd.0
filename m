Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gpxFZBBmOWd9kjdE64OJiH5Fq0ivb/gPCYxg7pKGHu4=; b=W8Zmo3kLraqOfG
	Qe4rlQinA9wlWOyR0qqrfieLAd0tgEfDbYry6DwRoUKHIhOyjWVMIM292nLYFYqVgS6LZcIOrRfIF
	KFrg7mXWZjel7v7aFH8HX4IFUw3XfyhBqnu/kyiHEEeFtIIyySoJZFrD3EbRYogWKqH2XG1qNjeFy
	gJiRV+9Q8mcu9vKfGBbrcfBoP98EMuwGJ3jFKyUR9yMMqXlMxiVCz2aK8Erd3eJJkJd3S8BElWTUC
	Ap6ttIIzogsoau1JjKR45pXYw80PWDIFdiUttM9kn8vy8tbMaSsJrhnnoQaVAIdxSF6IWPaDQ8G0f
	/E6zgvhHTWAmDKO8I0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2V7K-002X4l-Ht; Wed, 29 Dec 2021 09:19:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2V7H-002X4G-1O
 for linux-mtd@lists.infradead.org; Wed, 29 Dec 2021 09:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640769567; x=1672305567;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=B6WnlS/XMJMuZVK+zOHVd3PKB5MVH3ZrTncaZWEvj7g=;
 b=jTkHhAuLzUo17eQjRmUz202QVntkG3onR40u01k8+YP/abVkgwSBRpBc
 NJh2p/x83v4fSg0y3kFp+bFKRMdgfPuu3VetAYcwonipV18EXySHKug9Y
 +t8egxsZcHcYJSqHC97WHcoKmJ9W4uDRDNRUNhMi6MFrGLuz9J1nJeEMz
 vCXFaViBp82lpb0Nii+h0LcOkTHrUjBYHdSxgBxVFbukfn3BFLstEOFS6
 PBHB5RPVHiwHbYcwFOXJ1OUTdcw+Y+f+DsZL1y0LqfCxFEg25Iq5n5LAd
 LVcQr4eBvbVUfB9B1pfQZqlDcD1cQASI05nbJMleRKQFqFP5KADCKELKq Q==;
IronPort-SDR: X/Tx+9IzVBgsRfde17NyYeggRRYOwSST+daEFDQ263ANUcmSd7a9jk01nM5YzVsps3H+peLJdm
 vBk5TOuP2b7Zg+536kFMreXlc2kesd9Y4vsGSTG//pzcZhdgFuNxyjfGyapeQptzSJfCbOXyY6
 SqNu9csTdAkDqwx7VCup+QeA3SfWeJQAkbk++9IkXSVM2+afz/yliL94xpNN/d7BJlvN31ImMi
 2WSDfr2OFJVO4HtqfUP/VknHYyqee6Xf1EdfFv2ME3fYOta4uk5SE+y7i3QkE71GPIFBlMkBGb
 WQdIGeP12EeUSeSSEsNmYvKA
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; d="scan'208";a="143791212"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Dec 2021 02:19:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Dec 2021 02:19:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 29 Dec 2021 02:19:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odljBkWIWsLpV1ydr9zK0WVVBir94dI8dGlR26G17fJjgl5I0PU33loYpyGnWagQJDVRgn87ou4fn9szIHA0tk7NwjiCeMJL95OSncT+YhYdkgXB0Nm36VdinXQ/wFE/uubh4MIabseNedzcjbPaULsRbQWW66yAvCwmti3W1Al9CbfikeMJ3YvV32TKvIdGJ6lGJ3l5vCKhnMGtNhCBpedJ6d/l4ikWtR+4LX3ZnMuOdGLQeADhVLukPRPn3qU+dXtD0lAkWCjmkeJdZBZchF7zerq/buhMHFHpm5n7Rg9r3lH5eMq4TatCEeeHGVXBVrshblwHdCnGx5lzfXN8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6WnlS/XMJMuZVK+zOHVd3PKB5MVH3ZrTncaZWEvj7g=;
 b=XEnT86sRZfqR6g7QGAaAZDn+duN9WCqSWYIVtX6QGjiyUlHi+sbT8QmwBxQ8k5HyK4YoAM96o/UMqYOivIDZrp/yRZJN3V+qLeAKZUr0JzNKQx66jWSpDqkd8KXOxG/1xlQK7Jb8jrMrJP9yQRHloI2ewgC09d0fj2dSUO+dHqkFIzL4nHXKEt+twhdD5BP7gwfPzlIasf/eaz08K/I73TyTktG1f6KAloYLffgugPS2Wt/KHal8I1dzZUQrYUPx0XrvGTVSzB5t7jmgRcCg4IFjKka/N3TfBIKBG8qbfg2gw2z3pSL9SntA+M2MhvelQglYKavYNeuTg9dMbPPmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6WnlS/XMJMuZVK+zOHVd3PKB5MVH3ZrTncaZWEvj7g=;
 b=jEIl+Hqc2HV3eXlSEpQClUXIc//9hjQoMF4l/OzqBfPbA+V5FAvMTn4n9CLZ4rlJwLTv+do0gK8PHH0qG+vjKAGSC4apliBlJ6bvPKsKrG1Fl3SgZ1vs83Iez5qlz06CS8YDr+Z4T1W9q0BUlFebYon+ycDHGUE/NAifwYQhsdM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2733.namprd11.prod.outlook.com (2603:10b6:805:58::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 09:19:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 09:19:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <p.yadav@ti.com>,
 <michael@walle.cc>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.17
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.17
Thread-Index: AQHX/JUqKl6JlDrSqkKqgRlOhYx6hQ==
Date: Wed, 29 Dec 2021 09:19:22 +0000
Message-ID: <3644f2a5-1f46-58a0-1175-454f241c4785@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 388912e6-b4d3-45e1-b3ab-08d9caac4d17
x-ms-traffictypediagnostic: SN6PR11MB2733:EE_
x-microsoft-antispam-prvs: <SN6PR11MB273387A5B83BFD749D9DA2CAF0449@SN6PR11MB2733.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:337;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ttrHP7rLekT+C1IDb5yRVAJ5zKjkqxdwDK4HzMZLEkUa/zG2v71yAf7BPg2eLPGO9codH2ABLYSdfCNaeM0The4ZJmj7PNU4KuB8LtQKypZ+evKyw5KxTtbSV8xRVbLJ3qyHLZpsu/gVk3VB4xNWxPyYTzPBAtfPkJG9XzkncCtXvCF63zH8BycnB1efiLAVY2xN0K9C7VR5jp7jhCfBBA+zhMrDE8WKNns1ZqvsNXx213+6sDBp2wLNrybzxHrNkehmr8T//qBUKBE3U0lAgHmrNQb0QWauxuq7diuojGGCCYJ6NSYmlaMaw3jFrjz5zGNOMoYgfeJ/NF3kFf2RFwvFxxObwoQ5qeaH0Bn9CILMWALgAkzmd/vrsI4R22jD5Gm/datWcWN/PrLGMyMeEchdqXyrvhYIHNsGqFNwCWryJ2lAL+ApXn890z4mXMfjZHJcIPwPOoSPuBII9C+zSxTxMGoJbVbGviSWVMc3+jfifiBCKt1jcHnS2TRMecybOL4q64rGpb6xy5enKRoZBRBYJ14SFpoeVF8MCWJCBldwPfNhhVDq60ipZcqiTWwF5SRXW29Y0h3inyz3U0uTCJulmxH0iMBwlPFpQozlHrpx0yC+Ljmn74I3De3ekVbuWddMU/kCRQqtw39WgN5YtVUpm2gWz8AxEjsQ39K03QnWChHtwZxjntCxLS5FxWSejCCpCqzWOs88x7FZ52f7bR6Cff3S3HCMWO9disZaZkcDZrdV0iqHJ11oprVJZLfPywET8iv5QFn8GL8RldXAzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(122000001)(6486002)(316002)(186003)(38070700005)(4001150100001)(31696002)(6512007)(5660300002)(26005)(110136005)(38100700002)(31686004)(8676002)(508600001)(76116006)(86362001)(66946007)(6506007)(36756003)(2906002)(8936002)(66446008)(64756008)(66556008)(66476007)(83380400001)(71200400001)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NSsza0JEcXlEUnV0Qi9OQ0FJQlpYU0cxUFM0SFpoT1o3TSsxTzc4TEFYNkJT?=
 =?utf-8?B?NkI5S3dHaEltejNWdzVxMnI1UDdHb1VjeUdoNml2UG9LL1FHTFZzcGpid2lG?=
 =?utf-8?B?Wjc0MUVlRjhFbEtVa3crZ0VXSjFKb05VbXI4dTM0S3pDYi8vQVYvMnJ5OGJa?=
 =?utf-8?B?V1pUdUpCcC82MjU1NzFxS0JOYTRGNFQ0dXBRR0xMSC80dlRORVZQMmRMRU42?=
 =?utf-8?B?aUl5Y3dYT3poVUhaSFhaanowbis2d2JwM3FaYWtSKzQxTVZBNXp0OHB1K0Fu?=
 =?utf-8?B?SDlqbFMwRWZ1NnViWDcreGFQakZlbTRUWTdhZEROZDloZ1p6S3BSMTVHVHNV?=
 =?utf-8?B?SjFLTHRrYnIrRS9oV2VJVm5lNTJiNlNQQXFRQ3J0NFBOQ1FVUkZTV29nUHUx?=
 =?utf-8?B?Zks3b2RHR3JDYjZjRzNOeG5oVjhRVDZES0h1S0JUZGx6WCtIUitleTZCRzRJ?=
 =?utf-8?B?R3FCMitMK25rL1NxM05YRDhKOElwQlJEL0V0eGFLZ3VGODJvZGVhSUdWTFRM?=
 =?utf-8?B?RWY4UlpwL25TaVpJb2F4UkViUm5NWVlJRjdLcUNCOHU2VjZzbmpNUld4U0ky?=
 =?utf-8?B?V3VYajZ4ZE5IbDloVnJWaEtyTEo1WlFGODVNeDh0Qm1oSi9hREc1Z2RKczVM?=
 =?utf-8?B?Z21NcFhSeVB4UXVNdnQvejZZWVVoKzZKdGtlUzJMbG0weDRrVVFobHVlanNy?=
 =?utf-8?B?ZWYwVzBxdlMrOHhVNWxiQnlaY094MXFmYUJuWFBGdjIvYUdkS0k3T0psdXFH?=
 =?utf-8?B?N29oRy9EZWtJK3IxTFpCM0Z5YUJwbHp5c3RYL2lacUFaaWZZem1JYy96OW02?=
 =?utf-8?B?aDhhTXVUSEVWQ2t4ZklEMGFScnduL0pKTnF5bWp3UmtoYUNEZTA5MW44d1Fl?=
 =?utf-8?B?WXkxcmlDN2pZZWRjcDYxai9jNU9DYldJYXFkaVVSTEJaUzc5OFplSFBrNnIw?=
 =?utf-8?B?MS9IOUZoRGhkWnJVUlhmYXk3Mmk5c2JESkdxemlkNmFka2hCSEZnT1VnSjdL?=
 =?utf-8?B?V3Vhd2xOSzZwb3U4U3lFRFV0OThFV1hpbDFodkhJckViQkdQb1p4UkZZMDli?=
 =?utf-8?B?ZGRkcWtUamhPaWN5UGR3cWxkZllmeWtnVThxNkpNNHZPYkRtSHdYOEV2eVQ1?=
 =?utf-8?B?Rk9EcDhIS0hRWFAxL2VUb3RqZHBGLy84VWY4OW9lOCtiVVh4SjF0eGF2cWYx?=
 =?utf-8?B?QmdtTGFLSGNzODFjK2sySDVwNGgwN2twNENOUVBlczBKWVpJcTZmWnIzaGU3?=
 =?utf-8?B?VWdEeW9RRmhxbFBGN3FrRXNXWHpiTWlFc1RkajI5UWdZbDJVNVBINVJwdWRZ?=
 =?utf-8?B?L2VlSDdaZ3lESE1uQ21ST0xTWWdTR0dXK0xFQmFPRXc1VE8yYjdSamhHZm51?=
 =?utf-8?B?VWVmdDNqNEpzVXRwMHlXQWFPVWFocG5URDBERmRpeUhlN0VhcTlmajdFMEdu?=
 =?utf-8?B?TDBoT0c1TlZzWTlQUmRNZ1gweHc4aHZvT29xSTRpb0R2UnJwOVdsUmNBME5z?=
 =?utf-8?B?VE1aWC9uS25MZk14VU5pc0RhMmhPdEFDNVhpRnhoK2MzMVEyeThta2M1WTVu?=
 =?utf-8?B?dzlmeGtldzVyTjBvK2JRYmIvbDV3Y0pGWkNsS2lZOVBLVjBDc2tuZXlXb0dX?=
 =?utf-8?B?RzVCNEVicENwc29mb1BSazlrU09waktSUFYrS2hFMmZkdlVzZHlTaVNmSlhY?=
 =?utf-8?B?U2FZTG1oa1JMWEtJY0hxUndxOVVoc1Mya0FxYTVaVDRMay9mT05tMHZwZzRL?=
 =?utf-8?B?YUI2RTF6VzBSL28ySUFCQmdhcTQwUms4TTZwdGFmbkd4MFp6VmN6dHhpZzZz?=
 =?utf-8?B?d0NaLzE3UC8weU43bm9qcjV4b1BmS0hpNnkraWMrcXFmajZkSmIzQy9WYTR4?=
 =?utf-8?B?UWlvanNKU2MrSUExVDJhakdjcTAzd2NNVjhERk9ybnJBR0gxUGFxMElRSE9v?=
 =?utf-8?B?TGw3cUtBYkQzN1c2eUVMVjNmTHkzZG9lUWhaY0I3SllkSXoxS2pQdzhxeVRx?=
 =?utf-8?B?OEhTbmZ2b1dYWGlodU9FNVdlTzBHMkZROGFlU2Rrc1Z3ZU9La3lEN0dsY2hN?=
 =?utf-8?B?NWNYdUI2M1l2UjJlL2xjRCt4Sm5yQmJyZUVYcmJRRHZGMVViL2NaNUNkM2Fz?=
 =?utf-8?B?aHFwTCtzelRZZVVoNUliYVg2ZzhqdE8wTW1QVHZBTVBMaGVVRmcwU0VMU3Y3?=
 =?utf-8?B?cUhCS2pQalFma3Iydmh3VUNQMGI1R1Fnd25aUEFVYzhHaFJTVVQ4NndiakVy?=
 =?utf-8?B?QklteHA3NFZBNm1oaksyYjJ4V053PT0=?=
Content-ID: <3A8B6C5B65816D4EB843326239C051DD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388912e6-b4d3-45e1-b3ab-08d9caac4d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 09:19:22.5314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KWTGqRCamnsmE/fvnkNHzYLq9hQXpeSHj5YC+9Cn+e6n8vuLAN7frZD3XvwobelbuVqnUB3UvDKP7seSl8nrzkihnQ3dXVN7IND+HGEP78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_011927_268589_C1AA70A2 
X-CRM114-Status: GOOD (  11.00  )
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

This is the SPI NOR PR for 5.17.

Cheers,
ta

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.17

for you to fetch changes up to 5f340402bbfc1ee75e7b62b98f6ad85e14ce587c:

  mtd: spi-nor: Remove debugfs entries that duplicate sysfs entries (2021-12-29 10:22:14 +0200)

----------------------------------------------------------------
SPI NOR core changes:
- Add Pratyush as SPI NOR co-maintainer.
- Flash parameters initialization was done in a spaghetti way. Clean
  flash parameters initialization.
- Rework the flash_info flags and clarify where one should be used.
- Initialize all flash parameters based on JESD216 SFDP where possible.
  Flash parameters and settings that are SFDP discoverable should not be
  duplicated via flash_info flags at flash declaration.
- Remove debugfs entries that duplicate sysfs entries.

SPI NOR manufacturer drivers changes:
- Use late_init() hook in various drivers to make it clear that those
  flash parameters are either not declared in the JESD216 SFDP standard,
  or the SFDP tables which define those flash parameters are not defined
  by the flash.
- Fix mtd size for s3an flashes.
- Write 2 bytes when disabling Octal DTR mode: 1 byte long transactions are
  not allowed in 8D-8D-8D mode.

----------------------------------------------------------------
Flavio Suligoi (1):
      mtd: spi-nor: core: Remove reference to spi-nor.c

Pratyush Yadav (4):
      MAINTAINERS: Add myself as SPI NOR co-maintainer
      mtd: spi-nor: core: use 2 data bytes for template ops
      mtd: spi-nor: spansion: write 2 bytes when disabling Octal DTR mode
      mtd: spi-nor: micron-st: write 2 bytes when disabling Octal DTR mode

Tudor Ambarus (26):
      mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
      mtd: spi-nor: core: Use container_of to get the pointer to struct spi_nor
      mtd: spi-nor: Get rid of nor->page_size
      mtd: spi-nor: core: Introduce the late_init() hook
      mtd: spi-nor: atmel: Use flash late_init() for locking
      mtd: spi-nor: sst: Use flash late_init() for locking
      mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
      mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
      mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
      mtd: spi-nor: spansion: Use manufacturer late_init()
      mtd: spi-nor: Fix mtd size for s3an flashes
      mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of calls
      mtd: spi-nor: Introduce spi_nor_set_mtd_info()
      mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is defined
      mtd: spi-nor: core: Introduce flash_info mfr_flags
      mtd: spi-nor: Rework the flash_info flags
      mtd: spi-nor: Introduce spi_nor_init_flags()
      mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
      mtd: spi-nor: core: Init all flash parameters based on SFDP where possible
      mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
      mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
      mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
      mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
      mtd: spi-nor: issi: is25lp256: Init flash based on SFDP
      mtd: spi-nor: Constify part specific fixup hooks
      mtd: spi-nor: Remove debugfs entries that duplicate sysfs entries

 MAINTAINERS                      |   2 +-
 drivers/mtd/spi-nor/atmel.c      |  79 +++++----
 drivers/mtd/spi-nor/catalyst.c   |  15 +-
 drivers/mtd/spi-nor/core.c       | 556 ++++++++++++++++++++++++++++++++++-----------------------------
 drivers/mtd/spi-nor/core.h       | 217 +++++++++++++++----------
 drivers/mtd/spi-nor/eon.c        |  33 ++--
 drivers/mtd/spi-nor/esmt.c       |  15 +-
 drivers/mtd/spi-nor/everspin.c   |  12 +-
 drivers/mtd/spi-nor/fujitsu.c    |   3 +-
 drivers/mtd/spi-nor/gigadevice.c |  59 ++++---
 drivers/mtd/spi-nor/intel.c      |  12 +-
 drivers/mtd/spi-nor/issi.c       |  62 +++----
 drivers/mtd/spi-nor/macronix.c   | 107 ++++++------
 drivers/mtd/spi-nor/micron-st.c  | 234 +++++++++++++++------------
 drivers/mtd/spi-nor/otp.c        |   2 +-
 drivers/mtd/spi-nor/sfdp.c       |  20 +++
 drivers/mtd/spi-nor/spansion.c   | 184 +++++++++++----------
 drivers/mtd/spi-nor/sst.c        |  96 +++++++----
 drivers/mtd/spi-nor/swp.c        |   2 +-
 drivers/mtd/spi-nor/winbond.c    | 168 +++++++++++--------
 drivers/mtd/spi-nor/xilinx.c     |  21 +--
 drivers/mtd/spi-nor/xmc.c        |  10 +-
 include/linux/mtd/spi-nor.h      |   2 -
 23 files changed, 1081 insertions(+), 830 deletions(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
