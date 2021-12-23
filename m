Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDD3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhTNEcJg499J35YBAqr1LL5t6Gn4jYduxGDMZu+FtUc=; b=eu/yO9LB0bU1EY
	/Jqv8wyGY+X52naSEBf1niYaJ882QTspV5BSpyvxPoF9slUvr8uNknRln89SJeEO+K6Pg4DV8KYFT
	K7IUDiGdrRBSPQXE0sCJhBhjlRwEKRB4jm1Y645PjxzQ9w0PlTRlRsEqvL334e0fd1mkX6ovwFGtg
	p3yV4uvCzrptW/WoWtJsXezwL6JlIaLhhQLuqLcI3cduaY19XS/bQp6fGNjnJ/CPYOrjz51KD0sa9
	RZpshG3TYhdDnVWKa82LJ9DpStuyF44KeIq/zVFHSyF8lrZeePQfyPeT8VtycVcmLocYY3fXHc+AX
	gCdWzyznzuBhhLVC4yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0NQt-00CiSh-N9; Thu, 23 Dec 2021 12:42:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0NQn-00CiRv-VO
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 12:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640263369; x=1671799369;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=CnkJqZNVjeyp+BTIqhDny/cSYfZJ2DWn/0JpXuN0gcU=;
 b=ZfqyBMjXuDE3xRneIahWXSA+0EeN0lqAWTHbQNj4UW4+ji/qzJ7lQcZI
 40SxWd6ujsm+/pdIFpl+ccflAY1M0+xdpVfxElOgaxqxPfvdTK5CN3eu6
 uXqoMlOrwmXHqXuLgPjA/QnyjZ8Wc2wtB75ZB1TdwG2HMBsMGLSHFqHgB
 KvyrmxZyIYbQC40yjqu8J8/tFGOpNk8bWdL33/7MJGrV1IAajWxEO6Pzf
 hQRwelPvC7OnpVOEp3laOeDQ/K8IuXkdfKlimZOLpeddw9BuQvD1oCUdH
 peKN0KHpBvLM9kXtVnYliqXV8hDOuzcmzvcbMutqINp4ZGaC3wyHIrsxt Q==;
IronPort-SDR: 41JYEg6JjqfwrLJNM85ohYvRIvF0eQNRBtmjiP97PW6b9u8MFtJinh9AKsZDTswTuNcAtJEK85
 CGsfRFneR1jVHOfkFX4Dbow04XrRfzJ6YpUIGWqo0dAEcyQwX3SrjJ27HKKwAUbKfTVXLoz0Ht
 9xUzEXCX7kRy887UEbI917JtFEBAOmBQh9xEzAeAvJr9JYUFBDYvlgdt/hum9KMK9wS6pAhVsn
 6E0W7tTkOKyr0hP3sLZ7Lj7MMeoE1JGGKfv7X0jBGVj57GAdWrvkdzz8bKnSufZEjL1qYgbROq
 nD08Ul1FZpUIzznry7Bb4zxS
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="140708543"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 05:42:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 05:42:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 23 Dec 2021 05:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QezJAttiA6pgGtuBNPPubSFid3viL9YWmJBB0Tl6IksY5aj4HgqEL3PHuqlXDUoLMc9dIWlBTHqYdTD4XOICp8XvQnmAZf1Uu/Uvb3w+k4iiStmeu+oByIuxpjuLhQUnpHBA2b7tlkogPS0Ssq0fH5vrqjxG9H8cAodbXdUHaGQbe/YACQIb6/76jw5IQxkqzipbeK2hfpaH5vrUVCrgfDo/N2HMOKauObdLxgwDqKPZNi0Zodv7uiFgkZR83YXdw28XcCboA/Oy1M07SMxODVhtGuo+Dti8dpHgTM/k077bgPeAE4JOoUbow3i8uuvq+ouhyFg7vkbphckzpMHLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnkJqZNVjeyp+BTIqhDny/cSYfZJ2DWn/0JpXuN0gcU=;
 b=Y/YGNwDMIlNq/yCJnPERcfm/pD213ygYt9/bqVzIkPdyCaFrFQN90hOWySgnfGj9ozPWor8pqG1B9exKLoHxNNvkBSyUhVKyh+BizemjwhMnnpUBoAGWzewvZ+3wEcz6GVW4rFllhRbNzqDDN+ZbSt31o8zSMzNX9kXHy0hUxpDiemV1QTsBPhwklEg4Z48SSmkE/vQuQucLWJy5mcxGaWY8mhqraV0YXpW6ap0VgyuHEIlFDPpugo2EIsXBC+x19r65FKAD95m3UnY0tlfaEjsDQxB0S9GWex/Ol1pHNxVpNouD35zNIY/9WgoF3eGM5LololOYl40kk2zgKhWGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnkJqZNVjeyp+BTIqhDny/cSYfZJ2DWn/0JpXuN0gcU=;
 b=hU+h5/yHCyCihoRfiJdEcPQuT4vuZ+Yz7D75Nbqn5KdsEtMcfkzcdl+u/VTrdsuP3/J7Lc34kc91rIPePBGxO0pNgJIX55YiXFeeyJUZDby0OBdnY5pkCOXjjb4lt9pP89xNK/c6BtLT23j5cGFZFswluT816mKf57ECOIGD2h4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 12:42:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 12:42:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: core: avoid odd length/address reads
 on 8D-8D-8D mode
Thread-Topic: [PATCH v2 5/6] mtd: spi-nor: core: avoid odd length/address
 reads on 8D-8D-8D mode
Thread-Index: AQHX9/qMFRZUiMjnQEWnEwx8WAKUuQ==
Date: Thu, 23 Dec 2021 12:42:30 +0000
Message-ID: <86f5c01f-6901-1995-d8ad-a1e6580f5e5e@microchip.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-6-p.yadav@ti.com>
In-Reply-To: <20210531181757.19458-6-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82fcc1ef-8ee4-45cf-5f18-08d9c611aefc
x-ms-traffictypediagnostic: SA0PR11MB4623:EE_
x-microsoft-antispam-prvs: <SA0PR11MB462330C2BEC3E81A9BA6B72BF07E9@SA0PR11MB4623.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jYIaMMMPCdIAYoxXzWnKdDDibSB/T894nEsGXGY4CzVwnPYhysl7R5q5Ta79k6q4rI8MANa5A/E0bjpIFrlZ703UDELxzdf1mEgQtOT2fWVHBGviHGoJS2HVEfiDhLpu+9RinL4GBmeXCxTykeOdzVHIE3+QPWPFprdVfZ5TJ1ktzbHlwAytG4ymtFBLomrpJz20kjFwlT3ZDzRp3w/Bp5b8vWAc0r+LW2pD46mtkLkMPYcmidJee9tZmqTszBR2Phiimz8h8YZXnHHZdZWU385LyO2wze7IEDp0YGtXYb5KVzxZ4f4P10KUxCFRvMgycFyzGuC9xqJr4gAaI+SNMpk0xkBNI3nDm5X1G6kVmkAB4ObReE6Aiznj8PLHp8e+HCrDlfoy/PyAFQ4N88Mnkc+fhcgBgk6O04HOWz00yXZ090VvRqFQIPzjEOB1KLXzFc83rjLuJQmTMtcuQuosKgXfKJhT4CYQ24FzcgSJ4m6XHZXauuW5DVWjSBlvQV/Hyn4LubfhHcwMp3OuSkfC020sDfsSZ+cXty03hPu0Gn7jobjI9YZyTJnzkq1nqV5Nn4dVbW4BJ6FNQ03CCCmipg4Sqtd20olI9lVagOT63fcaFJquaTs3SyULbBRvfIVhgtO1Dz9PGxcN2xYJCPx23Dd8ZbmVSaGwMYhBnHnA2Hq8ziEyczU2YFkQOuxktId6UtywXsY72NLpESlaz0oJ2IW/fRX9VqqW2OVn7SAjlxk2TRpdTpHnja/aEiJmM0yfeJhjEXXjCgOEycVOgpSqZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(31696002)(6512007)(6506007)(5660300002)(76116006)(66556008)(26005)(71200400001)(31686004)(66476007)(53546011)(64756008)(8676002)(186003)(2906002)(66946007)(8936002)(6486002)(110136005)(2616005)(86362001)(316002)(122000001)(38100700002)(66446008)(38070700005)(91956017)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVQrRWlVWTlqZEZnaFZUYTY0VXBFVitReWo1c214YWYvY200bnQ2a01GUVE2?=
 =?utf-8?B?cmI0OHN5UTVRejBFRWdMOHNWejRabEZoaEhjREVOZE5YeHJwM0h1YUZtOWdz?=
 =?utf-8?B?Tmx4OEtHdmdMZzU2U1NxY1lnT3lDeCtubkZqZElBWWdkNVBKR2c4dndGSXZn?=
 =?utf-8?B?ZXdpa0pUZVF0Nmwzcmpla2I1VVJWeUQ3bEVvSUdld3grVlV2c2hJZ3lqaUY0?=
 =?utf-8?B?ajBVWGJkSHprNmpNSjhaYzUweUg2NnhnTkx6OXREVUJrY0FuVlFGeHdvZUxt?=
 =?utf-8?B?bjB4Um5tVDVOc1BrUGlyZnNKK2pIWjFheG4xQTBjVXNhYkhOSnhXSWJCUGJ0?=
 =?utf-8?B?Z2VmWldOUmVaSmx0S2NicTU2YjhmTGJ1ZlZ4S2ZvdEtzT2tXNEZIMUZtV0lC?=
 =?utf-8?B?UXNiVE1EM3pCMVVjK0FLbHlLNEx0MGt6ZzNQaFo1SzhqeEhVd0YrTkFPSDEr?=
 =?utf-8?B?SWJKaGdMeUhrR3Z6cERTWVlYeEhUWE1TMFp3cjMvVE5tZWN3RCtQOHVTZnZZ?=
 =?utf-8?B?ZjU3eDNkM01sVmN1c0JxSmFNYXVlRlRmdmRjQUxXb1VTcDZnanhWOFlicExO?=
 =?utf-8?B?ZnRacTBveWk3TzBGaEpaRHNMZkRmYzF5TDErUW9yS20zK2FFbEZsU2taOTVq?=
 =?utf-8?B?azZ0aGFEcGJuTTdCR0FmRklPMGZRbUpxajlMeDVaUWl2bDdHMitHUEVOdGg3?=
 =?utf-8?B?TjlLOGcvVWdBYzl3aHg5QVRodElmbnhIU202OFNRVzJ6WlhORmZLei9lUXFR?=
 =?utf-8?B?Zk9QaWVqbGJnMVVWSWRDL0p1VzdrY3N6YzQwRElVcXdwbTE0M0hheDY2eGxp?=
 =?utf-8?B?a0JzZGsrZUZPelJkT2huQm9aSXlvTzdMQ01walAwSTcwNGdpU0hFbDViaWhl?=
 =?utf-8?B?cUdtb1dqZW40VDYxdFp6Zm1MUnlsMmtsMlBLYy81ZUU4eWN5QmIxNGtNazR1?=
 =?utf-8?B?cW92bjVIYnNEM1MvQjdONUs4SnNtZnNSL2ZVaTZlMm5iQnV0cyszUkZqTXVS?=
 =?utf-8?B?VDdEMEpISGd0Wk9LTlo3a2pTK2hwRkdyS2V4SlE4alV4ZHpaNURCaWx1aXpL?=
 =?utf-8?B?ajVQVy9JTHRwMzlNd1o2RmxGKzd5UWdKZ3RUenp5YVZGTXRPOXdCUElHcmFn?=
 =?utf-8?B?RnRpTjkxOTNsVjhlcTdMK1RtYW15VGRzZ0xVWTFQL1FLdkpzaGlNY0JOWVVz?=
 =?utf-8?B?N1NjemRkaG5Nejk3NGJucnk3ZFBoTGN5SXFPQXYwajhJUDErV3lzei90ZnpF?=
 =?utf-8?B?THNHY2dJSVUrKzhVdEpNNjFYU2dzSy83ekNmUW1idGppREVCWDlRNGJyOW94?=
 =?utf-8?B?V2hCdUJXR1Zha0pOZXpHbjRZeHFJUHJ1Tm9CdStucEdnbkhnZjNSNE5qT3Ew?=
 =?utf-8?B?VTJ4aSttbXZlOE5zZFN2WFhQcnJjeXVnZXQvSlBsMGhKNnhyZ3NpMitFdDBi?=
 =?utf-8?B?enBzSHUva2h6Z2k4K29EZHo1WFF4Y2FQQkttN24rdlAzL0xCZ3o2UXhXYnFE?=
 =?utf-8?B?TTVaV21FQW9ScnlzM3liVzBnN051WTJBbzUwMFVVZ2tIQ2xqS2RKeUFDakNs?=
 =?utf-8?B?VHBuanJPRXVaQzZ4YXo1ZmQyVUI1ZHplc3RidXRxVGxQNEdBQjU4LzJXczl0?=
 =?utf-8?B?dHA4cDM4bDR6dFBuTjZWRWJOUDJQV3pVc2VlQnRONGE0ZTVnbnkyK1FHS01H?=
 =?utf-8?B?UXhvYVdpcW9LRUNlT1gxTDZSSFc2SmloL3NPbkFQTEtxckRHMkNWYUZ5MUwy?=
 =?utf-8?B?SWNVcm1vNllDcEh0T0ZiQVRGNllhcUg5L3NaQ0g4OFJ4Sm1NaUV2S1hDVHZW?=
 =?utf-8?B?TFRyS095aURRdUx1amJlbmVxN3pWMFFjYzlDd1dmYU1KZlFzeGNLcUxWVkYx?=
 =?utf-8?B?NmRwYU5KWFRnMkUrTW4xSmVxR0hEMDhuaFFFMVJFR0wvZWhkV21ZTmJRcWs4?=
 =?utf-8?B?OHlIY05vT3BWNUF6SlY2NTRIdFp4NGZiK2p2YXdZQkJYZlRTelFvbEtCcFl5?=
 =?utf-8?B?L3JZUE9kVjZ0c0RCNHZvbTVQTEJLUEdHWm14UjVXT3hVWmRlV1FDck4rNzV5?=
 =?utf-8?B?TU1Qck9wUW44UDN0VUErR1Z6U3hiOTMwSXI3MklaNk9CM0tUUC8yd1FrUTNM?=
 =?utf-8?B?ZGRSUU9rNkVYbFJEaHY4K0Fadk1NdjE4bytNUDRJaXdrcHRpWTdPY2orWTAx?=
 =?utf-8?B?M3EwS1VybHJBRWdqcDJuTlpFSkdld0ppOHBqOXUzNUMyOTlUby9PMWNGNm1U?=
 =?utf-8?B?S09EaVVxVnlUc3MycWo0aEJnN0JBPT0=?=
Content-ID: <DEAB3427B950DF468E416FFC81F80B76@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fcc1ef-8ee4-45cf-5f18-08d9c611aefc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 12:42:30.0880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oG8Hosf9jQmuFM4vIQudYNCvxFWBBJwVmKQB/wCK8AMTceokN0wXhGbBI7cC5FHy1PKbzBr+YSnyfWP7ia/JdBvNw6/+wbKx2I4sblQlsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_044250_139676_907CDB4E 
X-CRM114-Status: GOOD (  33.79  )
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

On 5/31/21 9:17 PM, Pratyush Yadav wrote:

Hi!

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Octal DTR capable flashes like Micron Xcella reads cannot start or
> end at an odd address in Octal DTR mode. Extra bytes need to be read at
> the start or end to make sure both the start address and length remain
> even.
> 
> To avoid allocating too much extra memory, thereby putting unnecessary
> memory pressure on the system, the temporary buffer containing the extra
> padding bytes is capped at PAGE_SIZE bytes. The rest of the 2-byte
> aligned part should be read directly in the main buffer.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> ---
> 
> Changes in v2:
> - Replace semicolon in subject with colon.
> - Add a comment that ret < 0 after adjusting for extra bytes is not
>   possible, and add a WARN_ON() on the condition to make sure it gets
>   spotted quickly when some change triggers this bug.
> - Add Michael's R-by.
> 
>  drivers/mtd/spi-nor/core.c | 82 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d521ca577884..a696af6a1b71 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1904,6 +1904,83 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>         return ERR_PTR(-ENODEV);
>  }
> 
> +/*
> + * On Octal DTR capable flashes like Micron Xcella reads cannot start or
> + * end at an odd address in Octal DTR mode. Extra bytes need to be read
> + * at the start or end to make sure both the start address and length
> + * remain even.
> + */
> +static int spi_nor_octal_dtr_read(struct spi_nor *nor, loff_t from, size_t len,
> +                                 u_char *buf)
> +{
> +       u_char *tmp_buf;
> +       size_t tmp_len;
> +       loff_t start, end;
> +       int ret, bytes_read;
> +
> +       if (IS_ALIGNED(from, 2) && IS_ALIGNED(len, 2))
> +               return spi_nor_read_data(nor, from, len, buf);
> +       else if (IS_ALIGNED(from, 2) && len > PAGE_SIZE)
> +               return spi_nor_read_data(nor, from, round_down(len, PAGE_SIZE),
> +                                        buf);
> +
> +       tmp_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +       if (!tmp_buf)
> +               return -ENOMEM;
> +
> +       start = round_down(from, 2);
> +       end = round_up(from + len, 2);
> +
> +       /*
> +        * Avoid allocating too much memory. The requested read length might be
> +        * quite large. Allocating a buffer just as large (slightly bigger, in
> +        * fact) would put unnecessary memory pressure on the system.
> +        *
> +        * For example if the read is from 3 to 1M, then this will read from 2
> +        * to 4098. The reads from 4098 to 1M will then not need a temporary
> +        * buffer so they can proceed as normal.
> +        */
> +       tmp_len = min_t(size_t, end - start, PAGE_SIZE);
> +
> +       ret = spi_nor_read_data(nor, start, tmp_len, tmp_buf);
> +       if (ret == 0) {
> +               ret = -EIO;
> +               goto out;
> +       }
> +       if (ret < 0)
> +               goto out;
> +
> +       /*
> +        * More bytes are read than actually requested, but that number can't be
> +        * reported to the calling function or it will confuse its calculations.
> +        * Calculate how many of the _requested_ bytes were read.
> +        */
> +       bytes_read = ret;
> +
> +       if (from != start)
> +               ret -= from - start;
> +
> +       /*
> +        * Only account for extra bytes at the end if they were actually read.
> +        * For example, if the total length was truncated because of temporary
> +        * buffer size limit then the adjustment for the extra bytes at the end
> +        * is not needed.
> +        */
> +       if (start + bytes_read == end)
> +               ret -= end - (from + len);
> +
> +       /* Should not be possible. */
> +       if (WARN_ON(ret < 0)) {
> +               ret = -EIO;
> +               goto out;
> +       }

then why do we keep it? What are the cases in which ret < 0?

Cheers,
ta

> +
> +       memcpy(buf, tmp_buf + (from - start), ret);
> +out:
> +       kfree(tmp_buf);
> +       return ret;
> +}
> +
>  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>                         size_t *retlen, u_char *buf)
>  {
> @@ -1921,7 +1998,10 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
> 
>                 addr = spi_nor_convert_addr(nor, addr);
> 
> -               ret = spi_nor_read_data(nor, addr, len, buf);
> +               if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)
> +                       ret = spi_nor_octal_dtr_read(nor, addr, len, buf);
> +               else
> +                       ret = spi_nor_read_data(nor, addr, len, buf);
>                 if (ret == 0) {
>                         /* We shouldn't see 0-length reads */
>                         ret = -EIO;
> --
> 2.30.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
