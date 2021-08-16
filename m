Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F05C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B783C61A2C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B783C61A2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fv0Q6dXG1y+H/zmLj3imY6LB39d0CJ1DOhHY6pkc9Lw=; b=P1rhmK3CYY+jDj
	Epp6UTZIlmKhTK0kMbYO9Qqmf/4rpiqmd7hL9NnnNNU5UL+xYfzh8bUDzOV4BdDGgCNDe8mnK1R3+
	ZdL0eNsdIdw1UO984oX17dfsGttQb5H8b2TDg94VME3+LtLw9dF4SUhMGzGrOubimAWC2OuCzDoWM
	mLF16gx1YEL+D3VWb1PRGYJzXQxBYm+z5CJP+0aQEaxz6huZOIDfBFJZc+Xgd0nvsZecKlBiPwR27
	qeNQitNCHO0D6QleVYdkLzs5vo+ngkN+cW2GNuYlWv8A/db+tmrpfSfULiz/0MduIHXjJG3SyuUAU
	4yeombi3QtFuvZ3M1siA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWzu-00GLfO-1o; Mon, 16 Aug 2021 07:25:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWzk-00GLes-Bc; Mon, 16 Aug 2021 07:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629098716; x=1660634716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xnILVyPj6dZ9LVrwYcTMuNUAj+0qvAjLqLDMg2fzX4E=;
 b=gn1LAi3OXvV7OCCSxmivZnQrENHO/nl91my5yvgVRxbKN7QbpZCJ3elh
 f+HUmD2S42IXW3oBzWwJpg7+eVHnBRB4jgASLGviyE+DxH8LUh4TN2F79
 /Q5jb0CoAvQ5B/Tz1VWaKytwDW7YK+pCXSA1lmuLAOo0hgyXFqFpEcU4f
 E6+OSNsCeh/f3QHiTELgYByRV83u5jFHjcjadb9TAtuYr7X+YjkD5g/MN
 BuGTEMju53uVV4cKKAaEgGzOpeY7Axtp9jAKc9D697e7paYUHcipUxab8
 E63k6e7YzDCeJEDE7GfDaMZ94BoXZWrKf55iktiMKtBfwnDKsYDZbheBD w==;
IronPort-SDR: 1R4F2V9h96vHrYXKemw58BbuBDD28VBXfGm4+qHrJEytoNt++ANKHqJF0U6agWwyJt5CjkKWWe
 Abw85Urb5les4p5N9gZcHdn/w+wbriPbplbOH2vJe1IyIIo2MPC22YzlboIi8h91fsj8pHBLPD
 S4VScggSHzQJJV1NDN1nVvvzpjfYAd4ZiAfA1g/i7koVRTq3090MNItvJGMNo/yPHCqiULLYif
 mYRKdCg9auO0auBRLCTMolUERQG625soU7elr0WcAjNChPiw4+fAPcKZvnc9fIOR1RdlFRQbHs
 mmfy7LKjxLjkvW1DZlw+xrvM
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="128387013"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2021 00:25:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 Aug 2021 00:25:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 16 Aug 2021 00:25:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN6/xEBQ4W1D8pbXDtpJm9DpNSLNfGMwJ3cnyXEbqyTpO8ZWOb3I71S4gaPKGkWmarO529BrKNfN3kcm0oA40L1sgNbpTSmxi3XP62n2NtHTG6I3QEFh/4TXMw3A4bgYwKvRYDohqcClycp1CZFFsqo+a8Kvv67/ZVCBLyOMunKwqkIKVxkj63t5l+bDN4YxOabpcWHRnhgCWN/ActTxVfviOVtlW3/8TOII1gBX4r5Gg45CmgHYEIQ4E3khODSDW6J2IhdFYYwAB3o5Q8ScoJS3UoKw/abgg3sSSzVl/NEr46nd1LjbNZ9Kth7oE6mrM3wCPGaCkh+OM5nKQDgYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnILVyPj6dZ9LVrwYcTMuNUAj+0qvAjLqLDMg2fzX4E=;
 b=cXWz0g6BiExH9jufB3dVttEUzc8nFcTCQDew0wdCn7XZZXSGtzNEsZTMPUqMJYRl/+2HRu/xNrwub5HsUrGrqXyUpGJZTu7EZhEo9GHL0UB+y7+DaTj0iPtc9odfwYsr6Y3x/Ru0eKRU8uompR2hYamvl5Wc1urYAxNU9+r5HHzw/MUlODiWmkFq1km83AVHecRvi+D1X2+IgFu9E1SexEJ0vkoG7nEXayfvp9hcP+ChXNoB2qS1gUvbl2/zG8UAprC6Fzv1frzlB0pL2h08gkegjJGXvPSf5f7NovfhsxzeOAh2dleqzLf0HEahToV/47fvfLBS7qsAFeCqBRptZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnILVyPj6dZ9LVrwYcTMuNUAj+0qvAjLqLDMg2fzX4E=;
 b=nBQ7kivQA6BZp1ggdhikV80LtJjQBbbYoimG40gw8EMxU18lSBqym4YfA+/Gif6sl4rp2f+oCTOPgIfd4cfkktlOIFmSSGprkxlH8hFpoOmTPLSCuZls4gdq7/02E+lxOP+DQ2DKlDxAiofwtFAd7Bo8gjHX64nynJgCaK1Kmnk=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR1101MB2176.namprd11.prod.outlook.com (2603:10b6:301:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 07:25:11 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::c884:8fdc:abbf:161d]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::c884:8fdc:abbf:161d%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:25:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 21/35] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Topic: [PATCH v2 21/35] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Index: AQHXkm/XrRaOgonMk0ahbSj5Bdh+jQ==
Date: Mon, 16 Aug 2021 07:25:10 +0000
Message-ID: <016230fa-b268-8102-b6d8-9d76ea232340@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-22-tudor.ambarus@microchip.com>
In-Reply-To: <20210727045222.905056-22-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b70873c7-961e-4fd0-778e-08d96086fb78
x-ms-traffictypediagnostic: MWHPR1101MB2176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2176C2157BBF58A8B51D5CAFF0FD9@MWHPR1101MB2176.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yP0gkBIw3HxSEaKoS0oVktGTl4Q/6cA4grAKv61/zx+CaRQ5d15QOMs3iwIrpI0klxoGgQNvvWRGftQWvwAZGq6ryFjg2Esw92C1rwB1HgrV8ldhFUFCkbXsJdWbCDA2y/f5sxidMxb1MAikdITEi3iDMulCKH5Nx4m7LH2y3KUKntfb9rTDdkUdPz9aepT8yMEYzmMyVnfspImi39OlHUmMXfwCHeOIYN2HFkQhJIv0oUwgvnAw6dgLGFcqZhSFGgT/1TGcoIjNbpRXXhRlxCRzHF9StMCMMDC6L2ldi1h4Nca5yDpyCTwTs94WgJvvwe9oeJXyB/Jf/hTOFyVu7XRu+FDY1qeOfZw/5pFPBzREVwG0Wc6bseZrd9WGVe0ELOVpnALbOYmil1Xb+5TeuO61nNPWVKTNtHYmBd9mVkbTm6h5Lle3IdjaSECq36dR88lAV8HLRanEb8+beU/1XYmqqY8H8abGLqwq6us8OibfmtdmGPknBr7OAv4Ry6isd58AkS8zxwm9TPA0035yR+Qc5tcf+wyr6k4ZkvaTS+YJNZFc8lc0WqNlYwCZ1jgwu5oVb7YkJqx2aHRasK+je4+sCxBLHArorjWVCLcRSO+oBkFkj23nFSieOy2t3WUeh10HW9xFGX0F/t//TeFjtXPWVKowpzA1IYU5bhYKN2ReLUZ3AGK7zNi6yDYEFyAj5hwsyGDWs4IioEIj7fOfZXUpSKanj7CIF1CuepFLSOeuz+yIejlOZH5U6EeGn0lkU5r1B8wyzLHAosI31IbQvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6486002)(26005)(53546011)(6506007)(2906002)(71200400001)(5660300002)(83380400001)(4326008)(122000001)(316002)(6512007)(66556008)(107886003)(64756008)(66446008)(2616005)(7416002)(31696002)(66946007)(38100700002)(38070700005)(508600001)(8936002)(54906003)(110136005)(76116006)(91956017)(31686004)(186003)(8676002)(36756003)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blk5STNPSHMxbXExcCtqZFVyaDhtaFpuWERJbTNFVFRNczN4MTdDTjNrakU3?=
 =?utf-8?B?bkcrV0czZ2JoZGtwTmpNWTZjVzNHNmFlOStvdW5hTCtmcEJibEEwdDRTaVdr?=
 =?utf-8?B?V2J1d2NwTnNyS1FKVDh6cUcyUEtBNVkvWTBidGNTK0ZTK213aU9yWFNQZytM?=
 =?utf-8?B?K1RCNy9ESGtHN3hxbzNLbzdpZGE3N2NLOU0zRUQ3TzdIVVp2aDhMQ0l0QVYr?=
 =?utf-8?B?UVRXUTUraWg4MngrOGk5WkZJTVNMY2NWUlJKbG1ObDVLd2NTM1daL0xhYm9W?=
 =?utf-8?B?UEV4UEtsaXA1eFBYeHBjcW1oMWZxMkF2RlJoUXFtMjJoVkFtcWVIaFYzcmdm?=
 =?utf-8?B?K1RPNWZoZjFGOEV1SDBkWkk4NFluTjM5bFptdmFFL3h1S2VWTHBJaTZMdHVz?=
 =?utf-8?B?d3B6c2kxZVoydERSZkJTK2I1K05yenpsKzREWGJaZFBqVUFCOWR5L3hTNGNP?=
 =?utf-8?B?UmdpT2Rydm5wRUVmVHJGc0k3VEQ5TmttTXB4d1EvaWxaUjUySEgxSDJzTjNI?=
 =?utf-8?B?bW0wV0E2V3ZLOURqR082Uyt0cUhTT3owTTErNUxaRW02Ykc1S2VRYUw3V0JQ?=
 =?utf-8?B?dXhOdXJ4L1V3MlhKcjArV2hKUUlqSk5VOHlHSHRHTlY3cUszRDcxeWY0TVFT?=
 =?utf-8?B?WG9SbEZBN1VsbC9RZk9nNWFkS09ZNnFyR2Erc1gzSlMvUW93VkRJS2xheU01?=
 =?utf-8?B?OXdiVCtUT1dpYkdYVlpnWTh1ZWhMbG9BTGpheVd3RFJQb2FiN1N0M3U1Nkdt?=
 =?utf-8?B?cWNkeW5pL2YrRHo4MTJSUXUvbWk5MFZJSGRxYkpvSFdCWlRqRWF6ZXNwSGtW?=
 =?utf-8?B?RTZndWx5R2pOUGFHaWk5RmFNQk4wNzJvZCtiZ3FhMnBhcWZNUWJoaHR2dUlI?=
 =?utf-8?B?SDZLY2NqVUs4SEFXOHREZ0lnZXp1SFFPNmNsOGVJdXY5RUpzeFc1M1B0TmV5?=
 =?utf-8?B?VDczWnFQMVZrc2lGQklzQ29TZ2RBZWpmd3E1amF4Y3pJb2VMaEFpK0tHYXdp?=
 =?utf-8?B?ZnNqTTFwTDBzOFRaaHZnSkJ5RDMzZnZsZmJoM1dQcTBZV1l1d3crRExyNXpJ?=
 =?utf-8?B?ZmJ0bEpTRHFINy9qUTF3WFBCNDhMamdoaVJIUXN3UzFxQm5TWkk1d1VJaWEz?=
 =?utf-8?B?dEtMdGJSeUFHTHIrV2hJeUZnWHNTTmJpSWFwd3ArZHJ5ZS9ETzhlZGw2ZXRw?=
 =?utf-8?B?V0xoMTBOVnRwaGd4V2FsbGI1TDN1cjJjS3ZZSXVjR1NKSVR3Y01MdjQxU04x?=
 =?utf-8?B?QTFBWTZDeG16aTZXVnJUdUVsUExXMHV0QUhFdGczVitPdTVwdVBaVzdETDJN?=
 =?utf-8?B?VUt2MVpmVzV3TVlla1dIbFNldndDMjNkdEowTjVlaWNnRE04dXFWWDd3S3I3?=
 =?utf-8?B?WXFyVGhUMUNKOWFzYWZWMkc2cEk2d0Fia3c5Q09YcWNMdFhaWS9Gd1hJQkZV?=
 =?utf-8?B?aXF5UjFHdGNWdDQvbHk5NHhLMTZEdkJnQjF2YUJqRGVSWTE4ZThYRWtXNWFs?=
 =?utf-8?B?UVo4WWsxbFFtYlRRK0Vyak50OFp1LzArdHhxQnUxbFI5RU9veFNlczF0d1p5?=
 =?utf-8?B?OGJLNWZBcUFIcEhTSFVLT3d6N3JZZUZOOGVvMTVIMWJFWXNRYVN2QkQ4b1gr?=
 =?utf-8?B?a0dmbTRlYXRabm1IMkt5b0M5ZDc1NzlTMzNHSkpWRkxOUGNvWGxIbVRpNG1S?=
 =?utf-8?B?dnV2b21VWWVqa2w5TURDUVhrM29LYVpyYmQxMFZ6bmZwT29LU25YRUtTNUlv?=
 =?utf-8?Q?hu2SbXyQBnSHJ1cq/Q=3D?=
Content-ID: <D7209A7F8AE5954DB0F385C0B1DFB2DD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70873c7-961e-4fd0-778e-08d96086fb78
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 07:25:10.8674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0raUEgr9jeBcXW60MZJ98YmqtsMLD2cMmP2SB84B4cgyv+8ZFxfZypnxk4KI26VbODMMquU0q3XX66iKVTl+uf9ILOo4e5tMgGZtEi4imak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_002517_663282_52FBF3B0 
X-CRM114-Status: GOOD (  16.58  )
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

On 7/27/21 7:52 AM, Tudor Ambarus wrote:
> Used to init all the mtd_info fields. Move the mtd_info init
> the last thing in the spi_nor_scan(), so that we avoid superfluous
> initialization of the mtd_info fields in case of errors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 55 +++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5c8cffb5e6f2..26acfc9901db 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3124,6 +3124,36 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  	return info;
>  }
>  
> +static void spi_nor_set_mtd_info(struct spi_nor *nor)
> +{
> +	struct mtd_info *mtd = &nor->mtd;
> +	struct device *dev = nor->dev;
> +
> +	spi_nor_register_locking_ops(nor);
> +
> +	/* Configure OTP parameters and ops */
> +	spi_nor_otp_init(nor);
> +
> +	mtd->dev.parent = dev;
> +	if (!mtd->name)
> +		mtd->name = dev_name(dev);
> +	mtd->priv = nor;

Rasmus sent me a heads up that I have a leftover here, probably from a rebase.
The priv assignment is no longer needed as per previous patch. Will update in v3.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
