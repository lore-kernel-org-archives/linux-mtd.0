Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CE0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705F661267
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 705F661267
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQZdOMB1Hh2zDNGPsj+YT64l00nKAVSTXkbSni0aHGY=; b=foHp3gXdI+ZPbv
	9mbCBvw4NV/o7ltMyD71AUtC7Qz7e6xsBsfnkMSDwFAMpIAt0h+VypBzckqMysbWRL8Qzd6fbvMBl
	KV8oNwvioHViMjHFHdGt7Uufr/BkW3jV7O4b99rDC0wK08p50mZ511Nt/E87H4BhSo5/4ifQU0DAP
	PYV+jh5p7ragFZZ/kwmpST3lzonh+6aG7IMwCKGvvyRv+aAUovOoDui9yHMaNgQHEO58a0hBMVFv4
	9NiqFT/yaLswu31Bk4AUX+FYBg0rGYOjdcMhJKKoWnEwvoaadilyo6rACckuW2XgyTXO40azV1dM5
	LKUaYFigXL6mlQP6fVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF66-00HIif-EG; Fri, 01 Oct 2021 09:44:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF60-00HIfJ-WE; Fri, 01 Oct 2021 09:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633081488; x=1664617488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IDRsTCrbUU/N8AyohnnmcvQVG411hHLNKQr2aJNNikU=;
 b=ZTjXM8y+daQ6SB9GzINglsDJnKFAsQeV327Uvycrlz/VBqwOCvlfowio
 Hg2IIsuFb3YAIXGQn8IX24caufYnFB2m2/cDusxotc09h4gfo3JrXpDEe
 R/0bWH+Xs6ivpwWC4QKOiP1lLcAQHg1HQ6WML6ACm5YIp0zkKSqLIoiRY
 F4xpcFokFcnTv2ky7YsP2WfSqEyjKvxD0mBzFs7HzARwY6KKYA0D5BP0k
 pEz6NSJpXZR63gOOXPpJgymMJh9zX/Je8XsON6n1QpKCggbQGaInp+0HT
 p1AhOVS0gIvNAS6jGWcoDCzBFEauapcbyKVaopUpgcdHEcRs6pNcOP1hb A==;
IronPort-SDR: HtxlmYauZJsDFEiDYLBHWa9M+qr8tzl+tuA8/AlNeJS9r85xz1rPq3B3SWI29iwWI4jXbwcuuc
 TvlJ1jqqAQs8FsYsgS5K3fzaD7APbiGCHSQlrLOXriBjQsmnqFOvubtwktLpPNbR1zORvn+9Gt
 i7kCnUkXBe7CwFqiGDTrZjkmNq7ZX8BWBCGL5Ujo5HkLuSa8gBCpyAuDo/xP0p1PkcUJOp7jZz
 dwAoBJ4aI/xrOUN+b18fX0VOX0SFr4NNfg1kv2kcDxBv//7DpRcD11dJlfoJrAbOpyy38bCacf
 xI54t62SBjxz41ClpIE/t9yJ
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="71352186"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 02:44:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 02:44:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 1 Oct 2021 02:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTGEHPE41S3sQpUD5rjDPUmO3CPd9IxDxwWp1sKXrACaYYgBlcVntXqHIIQDgt4Q0Tk2ub5kbkp+dTSP+jY8HDhZOmk3E1YumnA8hI6FNyfLoXhxKEpbjJCoMNjCpp3mJJrdtTxCQpdSadoIwyQ/txPTtRmO5fo9kF2LzkYs/xU4lamT7ANRcqdlAsPCWvP3mrCinku2C3hQIvQkTPpdkHmvwuctLHaW9jCEPEIsl7gZ3nQOGbz63LBTfSqvvA+30yoxZ9stmR/yaC6iPSRb3qLSBZoeCH/GNJIxqNyhlzHa2G3VQHC02jend1N/SzJMHxd3hOn4Q1GKFwg/lYrF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDRsTCrbUU/N8AyohnnmcvQVG411hHLNKQr2aJNNikU=;
 b=kSWVDih1qriguVb6HVsJH+IPaNDNbqGgm994U1piQLl81niue1Yvwe52bgIuZf72fsJUCc/2x/MzpETkodOHADO3CDeDExEcpjTOhjkfiC+tkdU+XqFCMdU3X0PyeX8o6ufv52fi+Qu29FoOVQUNNsaeweTS9rtx9xWDqghq20I21FwCpQpxuB1607bv++OMAYDs30fAEwcieo1gw0+pRTCEz8g699wXvVzYopmdiRQPW+dNjs+IWtgcpA5lZLAXmqbr2YCrF5u7GsIH/vnSzbslF2+hN1uGlxgzgOH1PU4GKxOhvEAKrZj6mOJ18y6IW0ADwuZukzTE6SU9ZG7t7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDRsTCrbUU/N8AyohnnmcvQVG411hHLNKQr2aJNNikU=;
 b=dieVPCLY62m9UcN8i1AiGhFaBq+A1nQgB9qJBWexBHiAUyOxpc8p1cUa89UJY3sZpEttnQL/7DiXK48a7IiHllXJMvz3fKJZl2Od/8cDjKR0YF4DK6scfU/1Jfo+vCJhptRW8bqsvyEQyytYhkSg6f5tmLKzBGtsfuADx9kmRc4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3199.namprd11.prod.outlook.com (2603:10b6:805:be::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 09:44:43 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 09:44:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
Thread-Topic: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init()
 hook
Thread-Index: AQHXtqj2LFn+s3h+z0OtnwZmbVbTvw==
Date: Fri, 1 Oct 2021 09:44:43 +0000
Message-ID: <a462e2aa-6998-afe3-bdf0-2f3bde8fdb5a@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-9-tudor.ambarus@microchip.com>
 <20210816185446.topxrgwmvpt6n4ct@ti.com>
 <1176aa457faf4ef5b60558a70c9b70b5@walle.cc>
In-Reply-To: <1176aa457faf4ef5b60558a70c9b70b5@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99ad7ea5-e3f2-4e8a-324f-08d984c01900
x-ms-traffictypediagnostic: SN6PR11MB3199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3199985A0E114C12A72ECCE1F0AB9@SN6PR11MB3199.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L2VeyolVk9E9SEnE8nUqicV364YzvV08Q9wPfwsgH31DXgPCON3DIKDsA3EL4qnn4dz5hchwStgpO0K8IgqnuY1yzFUj/vf5mSgkhcpKhgmy0UODpAZdwvxO0H1UQSBDWujal5aUTFws2ItsyhsnBGu7Tso+nw2WWhIRW/uO2eMzI84oUskopx9SD3hHsuF//Gas+/O9YhK0XtRCr4/Qld08hQgaGxySZVy7Nnn9WrrKkGNhncQ9bVGzp7Y73VPs2BrYqH83CuEVx7F72nBuXoU16g+wb1RlzHWYnBKfCkGEZmroymxyVH63ajdM7yfLRhdPt2t74wI3oSx/hMRBRkxeX+zUT5vEzKImwoXmsWTWcTht0M4BD5B+NaMOXLkyZmHQCN+3N02bfsMkWjbGUuuN5HG9hdD+NlXXPghhThUsRz4C90XYTdRDhsGfkv8h4zV99q0qiT7Ejs+a84hnnDuz1MvvDmqFEAUalp2CjV1ee12am7IEXv0TfNa+4BfHJBoVkHmnNd4xtS1UGU/I+Hg2b7v3N/j8UvE5M+98U9kOtrPLMDxsfYWksfggI8n1yB4B+7CzyQnfT4fqjg8mripESjRt0r8CZCZ5MBh0pXuCnyJXUBDJ7bqn/Z/RKX5k4zkQFRRDO9KnCn3LbtxgvblqEzo+GGGdHu9dl2Sh8lF8ZDQHYpPEIuThkVE6hnHNbWN0sQwD769yhE9F5nYAn6/tf+hAgFjY81Oah77uWejCaH2bxRv6nB7OX7ngxRGU7/0OfwWYShdjs19eK4O9fA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(2906002)(91956017)(2616005)(38070700005)(76116006)(26005)(66446008)(64756008)(66556008)(66476007)(7416002)(31686004)(86362001)(6512007)(107886003)(186003)(122000001)(38100700002)(4326008)(8676002)(6486002)(8936002)(508600001)(36756003)(5660300002)(71200400001)(316002)(83380400001)(54906003)(31696002)(6506007)(53546011)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXJnZ2FDaVhvWWhTMk9WeGxXY250MXVObzA3ZDJ3M1VLN0xVbExpTm5GdkFG?=
 =?utf-8?B?MW5ENWIrUCtVS2FjeGoyUm1obWd6d1hDUXdZbFdLS1pyZXV5ZVhTMmN0aU1a?=
 =?utf-8?B?Z05hSHNnS21xdUtqd3AzN1MxSGxMMFVySTlGSUNZdUt1bk8yanpYeE1LcGJG?=
 =?utf-8?B?RzJ5UytSc25iaW9PbEhGSE9Ydmlzb3JFVjM1RjNhQ0JlM3BSbUNRcDdXb0Mx?=
 =?utf-8?B?MXkvNHErY0VkT3BoM2dBa0hCcUN0d3Z6NHlNSTU0bXdJa3NyRDJPYlF6QXlh?=
 =?utf-8?B?cDdodXd0OTFoNEhEZUF4QjMwd0lCRkVLUmxSc0ZteFNlV0RkN3dOUkhLOXp5?=
 =?utf-8?B?Q2ZCc21KckJiMnpCWEkrMDZ1OStSaDFGdlJ6WnhscTNFdDdmcHNVVlhKelY4?=
 =?utf-8?B?N2ltYllFZ0JZbmloZVU0MFQwSlZlbkFydSt4UW9qTlFONGhFbm1jMFJieUVq?=
 =?utf-8?B?V1JDWDkrU2R6WFdUQmtIWVBzbjliQktqNE80L1U3SExXRVM4ODI3QTZ6bFNO?=
 =?utf-8?B?dytGUUJuN2JyRVpYbVlNNFJGVEhNaU9Fc3gyUzVLY25iaWdlSUllam5VOUlH?=
 =?utf-8?B?RTkvSmRFRW1GL3VTSVlNQ3AzZG9kb29CL1pXZmpDSHQ4TTNpWGFsL0VKT2FF?=
 =?utf-8?B?WWlxdU1qTnJlYUVmQ245bTRwL2I1ekdDcGxGdXJjSWVnM2t6UG56T1BMcjdx?=
 =?utf-8?B?ZlF2ajBTdmQ3ampHUDNBOTYyMGJDOEZGZ1FzTW9weHA3Q2dkc0ZTcjBUMEY0?=
 =?utf-8?B?eXJoYzI2VFRpNGs4UXZhQW1sSk5Cb1ptZUdLRWRCVmZJWTdERXBzd1B3K25h?=
 =?utf-8?B?UDhhMG1ZaS9taHFJWk1kVUc3Rm11SnNxb05wY1Ardld5MDBYYVJCMDJsMmNX?=
 =?utf-8?B?L000cUYrRVhkWEs2YTlnaW52ckY2K2Zyb0Nqa0JYY2RPZzBnQTg0SXlWVUt0?=
 =?utf-8?B?cXJLWktERjBLTjk3Y0pyY1h2QnVXejhybmx1dVo2bTYvWUNwOUdJUHVYM0g3?=
 =?utf-8?B?SzBEYmV4MHI5bXRtMEQ4bW0wdWxPN0I0Wlh6bE9ydXJuMkFWL0tNL0l1WlR0?=
 =?utf-8?B?VnFhcXdYZ1g5c0Nib3B0S1BzRkxiK0VpaEVBVTFuL21qZURjbHl0YmlGVHJz?=
 =?utf-8?B?NERyNWVzazZxbGlzajJUKzNBc04rNGkrUHlXaThFTEdMM1IzMWtFVCtXNlZo?=
 =?utf-8?B?SmUvS1BXcll6RFZUMEpJaG5aYmRhQXVKYThNdWozcWF0VWVMZkQyc0xTSHRJ?=
 =?utf-8?B?NVJtOVlBMWltZVROc2ZXYVFubnhvOUZPQ2ZhRjhlMUpNNDRyWjZ6NVRIUTNB?=
 =?utf-8?B?Q0ZoSW9CVXNEczg0M2cvd1Vha2EwYjNDZE41WU93QVpWOXlwVXJPdkJVOURt?=
 =?utf-8?B?eE9nTWYzRlZxVzRxbUptZkNzYmZ6U2VIY1NxSWFOT0gzUm5ZTEJNYjJRTWtY?=
 =?utf-8?B?OXhqTDI3R1FhcWFQQmlyenQ3bE53KytNd2tPYlA0bHQwc2FYelVTM212Wmwy?=
 =?utf-8?B?YjhicUUzMTFTUk4yNVF6MTMyY3ZCbUNOcXRxSHVEdDRScGdXR1RWYURjZVBl?=
 =?utf-8?B?aWZaNnd0bFBOK3dPRllxTCs0bVlWUk9kTU1MeGhZU2dMRlVIL1VzdEp2RnJY?=
 =?utf-8?B?Y0M5VDV2NUZCQzdqcS9pWGdoL1JGM1AvUyt2ZUhFaVMzOHpnUmdxSVBJdU1Y?=
 =?utf-8?B?cW9ZOXJsblNQc24zY1NwVkpERzdpRDN1N1dKanJKSnhSNW91Q0plRnh6WDNr?=
 =?utf-8?Q?5izwMzuyR9BtHo+Vn0=3D?=
Content-ID: <7662BCD8E7F4274690740058F87ACDB4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ad7ea5-e3f2-4e8a-324f-08d984c01900
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 09:44:43.6581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6egHGfVZVSN+U4aSXQSV3toHiwRJchf85SnsYd+0Kmr1WTNvUlBmVDF9kCkY+BLG+mFf9PsETW9tB+sf92OsE+piMKD4XhXkADVE/fZAlAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024449_247037_85006867 
X-CRM114-Status: GOOD (  23.92  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gOS8xMC8yMSAxMjo0MCBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTA4LTE2IDIwOjU0LCBzY2hyaWVi
IFByYXR5dXNoIFlhZGF2Og0KPj4gSGkgVHVkb3IsDQo+Pg0KPj4+IFN1YmplY3Q6IFtQQVRDSCB2
MiAwOC8zNV0gbXRkOiBzcGktbm9yOiBjb3JlOiBJbnRyb2R1Y2UgdGhlIGF0ZV9pbml0KCkNCj4+
PiBob29rDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXg0KPj4gWW91IGF0ZSB0aGUgJ2wnIDstKQ0KPj4N
Cj4+IE9uIDI3LzA3LzIxIDA3OjUxQU0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6DQo+Pj4gVGhlIGdv
YWwgaXMgdG8gZ2V0IHJpZCBvZiB0aGUgc3BhZ2hldHRpIHdheSBvZiBpbml0aWFsaXppbmcgdGhl
IGZsYXNoDQo+Pj4gcGFyYW1ldGVycyBhbmQgc2V0dGluZ3MuIGxhdGVfaW5pdCgpIGhvb2sgd2ls
bCBiZSB1c2VkIHRvIHR3ZWFrDQo+Pj4gdmFyaW91cw0KPj4+IHBhcmFtZXRlcnMgdGhhdCBhcmUg
bm90IGRlZmluZWQgYnkgdGhlIFNGRFAgc3RhbmRhcmQuIENhbiBiZSB1c2VkIGJ5DQo+Pj4gbm9u
IFNGRFAgY29tcGxpYW50IGZsYXNoZXMgaW4gb3JkZXIgdG8gdHdlYWsgZmxhc2ggcGFyYW1ldGVy
cyB0aGF0DQo+Pj4gYXJlIG5vdC9zaG91bGRuJ3QgYmUgaGFuZGxlZCBieSB0aGUgZmxhc2hfaW5m
byBmbGFncy4gV2lsbCByZXBsYWNlIHRoZQ0KPj4+IGRlZmF1bHRfaW5pdCgpIGhvb2suDQo+Pj4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hp
cC5jb20+DQo+Pj4gLS0tDQo+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDE1ICsr
KysrKysrKysrLS0tLQ0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggfMKgIDggKysr
KysrKysNCj4+PiDCoDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+Pj4gaW5kZXggZDMwYzhmMzUwZGMxLi4xNWNj
Yzk5OTQyMTUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+
PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPj4+IEBAIC0yNjY3LDExICsyNjY3
LDE4IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfcG9zdF9zZmRwX2ZpeHVwcyhzdHJ1Y3QNCj4+PiBz
cGlfbm9yICpub3IpDQo+Pj4gwqAgKiBzcGlfbm9yX2xhdGVfaW5pdF9wYXJhbXMoKSAtIExhdGUg
aW5pdGlhbGl6YXRpb24gb2YgZGVmYXVsdCBmbGFzaA0KPj4+IHBhcmFtZXRlcnMuDQo+Pj4gwqAg
KiBAbm9yOsKgwqDCoCBwb2ludGVyIHRvIGEgJ3N0cnVjdCBzcGlfbm9yJw0KPj4+IMKgICoNCj4+
PiAtICogVXNlZCB0byBzZXQgZGVmYXVsdCBmbGFzaCBwYXJhbWV0ZXJzIGFuZCBzZXR0aW5ncyB3
aGVuIHRoZQ0KPj4+IC0+ZGVmYXVsdF9pbml0KCkNCj4+PiAtICogaG9vayBvciB0aGUgU0ZEUCBw
YXJzZXIgbGV0IHZvaWRzLg0KPj4+ICsgKiBVc2VkIHRvIHR3ZWFrIHZhcmlvdXMgZmxhc2ggcGFy
YW1ldGVycyB0aGF0IGFyZSBub3QgZGVmaW5lZCBieSB0aGUNCj4+PiBTRkRQDQo+Pj4gKyAqIHN0
YW5kYXJkLiBDYW4gYmUgdXNlZCBieSBub24gU0ZEUCBjb21wbGlhbnQgZmxhc2hlcyBpbiBvcmRl
ciB0bw0KPj4+IHR3ZWVrIGZsYXNoDQo+Pj4gKyAqIHBhcmFtZXRlcnMgdGhhdCBhcmUgbm90IGhh
bmRsZWQgYnkgdGhlIGZsYXNoX2luZm8gZmxhZ3MuDQo+Pg0KPj4gV2hhdCBhYm91dCBmbGFzaGVz
IHRoYXQgZG8gaGF2ZSB0aGUgU0ZEUCB0YWJsZSwgYnV0IG5vdCBhbGwgb2YgdGhlbT8NCj4+IEZv
cg0KPj4gZXhhbXBsZSwgdGhlIE1pY3JvbiBNVDM1WFU1MTJBQkEgZmxhc2ggY3VycmVudGx5IHVz
ZXMgdGhlIHBvc3Rfc2ZkcCgpDQo+PiBob29rIHRvIHBvcHVsYXRlIDhELThELThEIGZhc3QgcmVh
ZCBzZXR0aW5ncywgY29tbWFuZCBleHRlbnNpb24gdHlwZSwNCj4+IGV0Yy4gVGhlc2UgYXJlIHN1
cHBvc2VkIHRvIGJlIG9idGFpbmVkIGZyb20gdGhlIHhTUEkgUHJvZmlsZSAxLjAgdGFibGUNCj4+
IChsaWtlIHdlIGRvIGZvciBTcGFuc2lvbi9DeXByZXNzIFMyOEhTNTEyVCkuIEJ1dCB0aGUgZmxh
c2ggZG9lcyBub3QNCj4+IHBvcHVsYXRlIHRoaXMgdGFibGUuIFNob3VsZCB0aGVzZSBnbyBpbnRv
IHRoZSBsYXRlX2luaXQoKSBob29rIG9yIHRoZQ0KPj4gcG9zdF9zZmRwKCkgaG9vaz8NCj4+DQo+
PiBGV0lXLCBJIHRoaW5rIGl0IHNob3VsZCBnbyBpbnRvIGxhdGVfaW5pdCgpLiBwb3N0X3NmZHAo
KSBzaG91bGQgb25seSBiZQ0KPj4gdXNlZCBmb3IgY29ycmVjdGluZyBpbmZvIG9idGFpbmVkIGZy
b20gdGhlIFNGRFAgdGFibGUuIEZvciBwb3B1bGF0aW5nDQo+PiB0aGUgaW5mbyBub3QgcHJlc2Vu
dCBpbiBTRkRQIGF0IGFsbCwgbGF0ZV9pbml0KCkgc2hvdWxkIGJlIHVzZWQuDQo+Pg0KPj4gVGhv
dWdodHM/DQo+IA0KPiBJcyB0aGVyZSBhbnkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZXNlPyBBY2Nv
cmRpbmcgdG8gdGhlIGRlc2NyaXB0aW9uDQo+IGluIHNwaV9ub3JfaW5pdF9wYXJhbXMoKSB5b3Vy
IGNhc2Ugc2hvdWxkIGdvIGludG8gcG9zdF9zZmRwKCkuIE1oDQoNCkkgdGhvdWdodCBJIG1hZGUg
aXQgY2xlYXJlciBpbiAxNS8zNS4gSSB3aWxsIHJldmlzaXQgdGhlIGRvY3VtZW50YXRpb24NCnVw
ZGF0ZXMgYW5kIHRyeSB0byBiZSBtb3JlIHByZWNpc2UuIE1heWJlIGl0IGlzIHdvcnRoIHRvIHJl
b3JkZXIgdGhlIHBhdGNoZXMNCnRvLCBJJ2xsIGRvIGl0IGlmIHRoZXJlIHdpbGwgbm90IGJlIGh1
Z2UgY29uZmxpY3RzLg0KDQpDaGVlcnMsDQp0YQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
