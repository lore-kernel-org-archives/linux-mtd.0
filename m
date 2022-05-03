Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8164AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWPTdcjYNvsmv7VR3JGunZzi1Zh5EyCXwCDQMcFmY2Y=; b=lPgeOdizF/FPuA
	q51WugquEVjVt/QV+wAHUhXDzFuUzJkGCxuxmxIIsNczMa3qTun7kgkb8ni5dKLwE2Bvsqzvp1Blz
	rzTrx46YlZjr6BFDV3WR/n/IHmoug7eOsvKqIP6od63Bu033/K6AGqAjF0kfQMf2WrvAa70P9Bba5
	wlbIcWOuIlvskqaMSaPssI+MbtP26UEWm+znbz2LBEzc6Ae0Tk++ic6jRVADMv310pwYm4y1kabto
	geM8T/chFkdaaEhO8Jq1PkmElDdDOdWG0Hq+80n0IGKWWQgLhG0DVLuar3/P8Ye2aJ0TgFuI0qDkJ
	OuqdyFp2mCFZj8+ksi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlntG-004cp1-Gm; Tue, 03 May 2022 08:28:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlntA-004cnR-3c
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651566488; x=1683102488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UZh8DB2Q7cqurY1yQB7f9ryIjR3V/3pEgNQnSHMTjVM=;
 b=nELkJjWg04vXq9n7AF9dO9OnUhbfohfjujspZ8ZejEVl+LJMVOpb9plR
 2i+MqFShcTMFywCs0PVJ11mMnT/WxbE6be5dv87J3T6RXrUmxXCixlWd7
 0PjwtDmEEpnXpnaw9jzmlCC+AQnSkftyPKdkLCbKkrml5sx6YDrBR0ntv
 NhZx2WvaJX+IIQ26oE30In6JQHnbSOL0Ln2Gf6Q1diTL7/FRhl6xGVIly
 AbAnOmeYeI+68KS4PZCDMGPcgw7cQ1ehKiP0flHgGEHrCxremLdh1eNoX
 vot9/Zm3jPsSgyoSqeEXxxS/stI4j1lhqK1CKXm/Fg4F+3rh4hjk4dp3D g==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="162116947"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:28:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:28:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 3 May 2022 01:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2f7RtCMG6qFtYvWADLx8c4dUeDbn+Tx7GavT3YfD4opqQxyk3lgbew3ZIjuUl+I1w0EGqaJfRZvQ+O0lmkvOrtabJ8Wr4xaIqb5U+mmVBGY6eOipppPs+uY5S5/BV5EE/dJ56TzyBM9e0pdgvNjiddDSxj/Pb3sx4GwxYQXKmjcfbArLP26VIuCljULlDULI7XQTwe3KoXPeO3BLeJcjg+Pw9nSAopSlNaRjOQ6ZGLgC9JKFhjtS2O3A9IF6DELfW/nt9XOR9n8vccHz0ULHWv13VnqtSi1qYNYxMFiU5UTfhztFO39w3BJdLywcSGQbH1xc1wQtWwz8PeCgwTN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZh8DB2Q7cqurY1yQB7f9ryIjR3V/3pEgNQnSHMTjVM=;
 b=V7dU0kG9dG1CwcFk7yvykPyMFHW3q9L4TPUAocVdeB4I0AsRxeg9Gntpp7XAI/kJw8zk4NMVFDW9fVmlA7IB2DAgPX1y45qHynf0PvfhBOYfKy5i+6MzVW7T6YWlApxFMQwKMw6wfjvGU8dPCBsS7jboVbbeC7qND0KUd64rsryNcXiyWMyth+PsN11nlfrbaKGeP7hZIHd5hA02JFOf1rSk+dA8Pviwi9m0zVhWBNYguh2jkJtd45sgDN6ZjkvHIDamPhueTJiZJTBnumpbWTQ1vSSpNbkDWdo7L0kjJFXKsJtmETgAY6TrOzXBfPZSmrCQ+k6Unn3W9gvXvg2y8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZh8DB2Q7cqurY1yQB7f9ryIjR3V/3pEgNQnSHMTjVM=;
 b=JxkkAQQqPPS3CbyyyMJaZQXGQOil4wN64LSu9NhKSxzH0CVyYqqGBAOeaLWskyY2rOWjSjbnj8dBJXftasPyuayS406d5vlGnOFIt2FTosr6IlBa56rdt6YqYIQqQUZgF5XmiuPbSYs+UyUcJHAjSkUPYrVp5NHcqwk1Z7Oui6o=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB3799.namprd11.prod.outlook.com (2603:10b6:a03:fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Tue, 3 May
 2022 08:27:53 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%6]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:27:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v14 2/8] mtd: spi-nor: core: Shrink the storage size of
 the flash_info's addr_nbytes
Thread-Topic: [PATCH v14 2/8] mtd: spi-nor: core: Shrink the storage size of
 the flash_info's addr_nbytes
Thread-Index: AQHYXseuq3YSHHTCj06vQeNRyC7f8A==
Date: Tue, 3 May 2022 08:27:53 +0000
Message-ID: <b45a7071-ebe8-d910-32ad-bb5148a683ff@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <20220503081627.341870-3-tudor.ambarus@microchip.com>
In-Reply-To: <20220503081627.341870-3-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5cb3b8b-4f11-4e1e-e300-08da2cded169
x-ms-traffictypediagnostic: BYAPR11MB3799:EE_
x-microsoft-antispam-prvs: <BYAPR11MB37996123D6E2B255EE9D7431F0C09@BYAPR11MB3799.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nReioU3Wbsiawd0bEg8TOuV2JDbDxkvYYA7LL/x7UMH6BosalN17AcVJrta8yx2sk5CjNy40XloZKZVC19OPljFx8Dt82cUFg7Z2OVTcj8ICyieHLC8v08kCNA2R0Db4uyuMVHqj0BlASFhF5e9qGUCsM6RTcELwoTLv7JvgY+wClQV2gbnCEdGQ8AmgCzQRtTfSS79dpu5amGtqqortYEyq28nptIXf1tfH4XOVWl/SSdBqEE73EcX88iIzJuP8Suq0yetPOjQGNHll6J1A+60IDC9abt8sgI8Exut0eNX0DauAM7jtwFZO5g4VmrVwa2IUaiOXTiW7WfXAckmwhZ0brg/QC8mThiYOOvwg/EuF65EoF+C0wYM5QVYBzwjpaNWJEXS/3uaMH5NxYz9/r0iLBgg2WBqtibzRbUq9Ou9G8ZDTYy194T/ZWu4cS2vcDuD6Qae1aNKy6Sv5B1RUI76fw4XHNdbxmPVhQSrVrPD/Okh4SKYyxLx3eq0Omzo6TlyuZUK+JK1hzzJ+UUk2e/BhT83A6wuBKMRHaV7E3rRGZE1Iap8zZXmWRIKKE7gsvJwq45uXWr7o4LSIfDsYXxIpWSXVaJ2aSPVKOS13OJl8pz/mFGxU7mZGSdxUsI0aLF7CDskLyKQddSrqtV9ZiSISL9bhXzavqboIf/4i85LG7MM86hZn9SP/bCKlJbOrsXuOmAoJosXy6OT7oYda3xYrSiPSc5Xy3k7tgINAAKS7Scz/JtO4ASMLbRSP/JBSFCLAAOLZGD4NCx6BKLn4Zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(36756003)(186003)(4744005)(316002)(2616005)(38100700002)(38070700005)(2906002)(53546011)(6506007)(31686004)(508600001)(122000001)(64756008)(66476007)(66446008)(83380400001)(54906003)(6512007)(110136005)(4326008)(8676002)(5660300002)(6486002)(91956017)(66556008)(66946007)(76116006)(31696002)(71200400001)(8936002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjdrcktpYkpaSVdhWkdGZmZGY2puNXJlY25wYTlDZ285OHFDK0RJV2I3eFhC?=
 =?utf-8?B?aGZKL0VVRmtXZXZzK2R1SkZYN1RpSy94ZnRsU2RORHN0M3BKYzV4SE5RUXcv?=
 =?utf-8?B?SUN1UVhIZ2UxWWVGK1UwWG05cDRETGFCWUIxcGdhRjlsL0JYNzdLOFFhdlpQ?=
 =?utf-8?B?d1VZalplamNNR2NNT2cwMHJ5OXE3VjdEU0VhdkFNUzAwWjlUdVBmcWcyN0tj?=
 =?utf-8?B?U3Y4N1VkU1l1U0VrdE4yMktZL293cCsxWnVKbnI1aTBTaHFEbU54K1FrUEtB?=
 =?utf-8?B?TnJ3MEM0S2s5ZTlKdUpyaGpJcGozNVJ2Z2E4ZGJaRjc4QUh3MDZEYU1iMzI3?=
 =?utf-8?B?eDJPcWlPQVZnRTl5aUJsVkFDVzlNanRNOUFzcFQrYXhINXE1clJ4a3VoVWw0?=
 =?utf-8?B?WUpDanJtRUFTT3RwUFZOQWZEbjdIM0NxVVNxMG5qT0o1ZnM2aTFjYXlkOGhV?=
 =?utf-8?B?UnRlVCtHY3N6NzdTVC80UGMybjNHWGt2SlBBRk15WGord1dMUU9YUU9jRG1p?=
 =?utf-8?B?ZmpFSGc5MWU0azlOcXU2N3NBUXlCd1dFWHZpOGNBaTd1emk3eGdDTWh5cnc0?=
 =?utf-8?B?NC83KytFbmxQYkJwUTdJNE5YWDJzOURMVHdGVUtkYlRLRXhOT3pXUzA0Zjdk?=
 =?utf-8?B?MTlydDl2VjJFNHI3MXdzRWc5NDJoRW9BUlI0aXR6TE5BS0Qvb05YaHVSRkxl?=
 =?utf-8?B?cUZaNlBtOGtjeC9ITXhQWnN3b3JGV1VQd2M3QUZqN2UrUkRqclM5aEhSVXQv?=
 =?utf-8?B?T1ArOG1KcGFXWWVlVDdYVTVENjN3RXR4MkJYZVNhdVdSNFFUYkRibFhGWWs5?=
 =?utf-8?B?amg5cEt4dlp6bU1Ua2k4clUwTWlvY2t5aldvN1oySjZURGRhM04rUUd3a3pO?=
 =?utf-8?B?TDBJSWxWMjNEUXpONkhMNzcwN0NpVmU2emtIOVBhWTJ3bnhyVjNtWU0rU1Nv?=
 =?utf-8?B?cjE0RVJDZGxuTWVuVU9TQXVoMEJMbHA0QmpGbWlvNXE4YjhkV2ZQM3FCV3dC?=
 =?utf-8?B?bStLM2tyZXFUUzdiQ2hjRVZRNS93UDVLc1NQUTVsSHE3OUs5czBrUmN4T2Zw?=
 =?utf-8?B?TE9oUW9hWExzZFBteDhNZkd3L2ZyUnhTYnFPWUo5eGlHZjhOcWlabFJ3L2Fu?=
 =?utf-8?B?WGllRXNmTjJZOGdGaFlYQmlyK3JQSkd4eUJKQ2oydDZGYlBidUdoOVFEYS9G?=
 =?utf-8?B?a1JyZ20yVHJnMHNQMjBwOU9nS0xELzdzNXdqVi9nbkdLZlFGRDlaVUY4ajk1?=
 =?utf-8?B?TlFNdDh5UEsyVUpYZW1tZGxyQnZPT1kzMS9kTEhDUUJwQ1o0cDRWQXFRZG5V?=
 =?utf-8?B?cHZnME1RWU94bUxESkhDRWZXaFVwM1BsQzdoMktDRUxxWm15M3o3ZXo3UCtp?=
 =?utf-8?B?Rmd3dUlkbXVFYmFBYjRqQnhRWTZ0UWQ5QTFIQnYrc251MXRUSC85V21rWTFC?=
 =?utf-8?B?YU1pbWpCRmU2RXM2YmErRVVTcW5YNFRCYWVxeWVhcVRUU2c0K04yQmdFYkdo?=
 =?utf-8?B?ZEM3eVdZQVNFa3pXdnIxNEJxUEZrSStuLyt0SkRTWE9RY2JCMGNjQytKZWsz?=
 =?utf-8?B?WTQ0Q05KSUVma1FuQzdvTzBLeUM5Wkc4b3BTclY4emsyR2Z1S2MwcXp2NWhq?=
 =?utf-8?B?YncwdDNxVXFHZ21wWmpOWHA2cXFNc0lFOFZIbGJEQ0tBVndLdHRmclpRYTVI?=
 =?utf-8?B?bkJtc3lDcU9Bci9UeGFKRzVmZHo4VjFtYlVnUFpZR29ybmVNU0RXeXNOWTZm?=
 =?utf-8?B?aVpHYmpKZEdUUE1nS08yY3RXRXpnaXpkaEIzTmdnbFptM0VwZjBWQ2Myb3lu?=
 =?utf-8?B?RnpQZUhoamw3WWh1R05rK1JRRW5MQlBqTFpaRTR4Vmh3S2lTUUE5eFNYWjZj?=
 =?utf-8?B?bkY0cjU3a0I4STFCTmlwRmFsM0ltaWxiT1pGRE45TUtYeE5xY2VsZmxkZzN4?=
 =?utf-8?B?bVpJWmIxbE1LU3Q0MXVBV2hjSDNEaHlzNjBqVHg2OVdTb25KMHNUQnBVcitT?=
 =?utf-8?B?U3pLR0hlZjB3TVpjd0RSZGhNbmpsRzhaZDBIWllZMSthZ3lvOFk3THhpeWNP?=
 =?utf-8?B?dTMva2FBaFVRL05mMkpuNUo5eGVTaUVHMkZ5K082amoyN0tDMjVHUXV1VkY5?=
 =?utf-8?B?aS9aSWVGa1R0R0kyUG1id1I1ckdudkptUGVsdGw4Q3JjckM5NEtxK1A0WnBv?=
 =?utf-8?B?OU9SK296NFV0NFlwOXJJUUcyc25CdFJsdVVyRnR0bVV0bFArRnZINHk4M1J4?=
 =?utf-8?B?L2VnMmk1WCtKUFNZOEdSTlZLb3UyOGcrUmNRMEN3MTdvTmxTVzdtcWU5YWlM?=
 =?utf-8?B?TGlsbU41VUdPK21FUGU0RVQya0UyMllobW45RHdSeDhsdmxjcGR0RGNPeE85?=
 =?utf-8?Q?KsG9SQqit+1sopPc=3D?=
Content-ID: <3A3AE1CB59ED7744952B9553EFE9ED1B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cb3b8b-4f11-4e1e-e300-08da2cded169
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 08:27:53.3460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7uyaaI3Tbn7LaufqEvXDgWb7WEr2rsp6bAaJX7PlNEb3zPjT8znV/7RFjp5LVTyvmsIRFxgHovbLLdbaLRtVPx2Yz1fVwmqPZi2BRVisjH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_012808_388084_7A110A3B 
X-CRM114-Status: GOOD (  16.40  )
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

On 5/3/22 11:16, Tudor Ambarus wrote:
> The maximum number of address bytes in SPI NOR is 4. Shrink the storage
> size of the flash_info's addr_nbytes.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 5fc3d4a8add1..fe7683fe1b4d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -493,7 +493,7 @@ struct flash_info {
>  	unsigned sector_size;
>  	u16 n_sectors;
>  	u16 page_size;
> -	u16 addr_nbytes;
> +	u8 addr_nbytes;

I think we can remove the nor->info->addr_nbytes entirely if we choose
to add late_init hooks instead for those couple of flashes that use it.
This will shrink the size for the big array of patches that we have.
Opinions?

Thanks,
ta
>  
>  	bool parse_sfdp;
>  	u16 flags;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
