Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E50C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8vEWkk9HHfaX94dU3TzqxVGA64t0sS0Ah4cSL9oSWQ=; b=PMouybpm/vxssx
	76jk80KHRH0MapqI9KwZlhvb8COKVnVWTCNnKWiM08TQqTh/KSuPH1RYGga2w0XwDfHOmCYDYUkBi
	mrHo4lPnewy60I3uFWCgzKEJPFeygHoRwLptNpEobv5m0mMTQ0zlspiDUvCq6UqihbfmkqBrpY+/j
	KPr3Bj7RNQLXCtSKbaO6UyKPt6Xjm4af6R9Y7GevkrQ09CmF3oFfs3Di41X1W9gAIZTctKNm+sb5Q
	BD31mdqf7mOsZ8rMvZ7CCej7Smj8Jt1DEYi5AVZof4Lni6v3fnqtZ4SNaVRK5I/+GVpXsTPbVZhcK
	y6+f517I/q5m29ux4dkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzyt-002P6M-TA; Thu, 10 Feb 2022 03:18:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzyq-002P5a-Pg
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644463128; x=1675999128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jV9rKbq8YzdYGyXAHMSoVnvUTIW0W3XGtDCh+N1q4J4=;
 b=fDpoJmTxErIj1SpTxBWNMD/msZsMv9sRuNYc6OQGiPqSCrSSQMv3vVyI
 thbtXt97Oo2wgaJxMlRYSrAJ4+X4/bwzhFqvuwpfkIcGmEAgpLa0wxXx1
 51Axv4MHIhNmYxE9nSWUQOwJ/Iz3Wvpflj5y2ta5tIW3nzZ9PF3u24DkG
 Hfr/vKqQfiFzful0qP7qnnzWao/tSbbKpQIXTVeho0chnoPkkEGr83T5V
 83TzqcD15/fWPRRjFowAMePkK4hwpDWHIPtBLxTjflbSRMDhpcgQT9tUE
 axX5oFN6ZF1Cc7naXMQOjsvRkhL7Ba1Z6Y7g+wXpTJv0a93FLs0gj1NYq g==;
IronPort-SDR: 1TlwECiV1VGOpea5GS/E/by1Zdcv20PP3mWFFot4cXuOhWnNAPI2Psmgvv9wPbOkXBqFr4W7cH
 ilDILtrT4F90rFvFaYWVoIm1HuyH+Kn6WbDcSn3avbxMa9SJN//u6Q6ouXAz0QRCSf36cVtsp2
 Ci+Drp+TWb+DwQ2aWDmovKudWBRN1lctL30ghMm5FVfwBuDEX6XwNCUn/lofLeMi3Oe/mv7Fv7
 nEL2U3gi1ns4tsplK3gQ3wIy9jEGFMQ1z/7Y7KWHQfZmYwPzXGwEj9HTUulajbTVewz+hYe6Ll
 +FiDTLhO4ww9cXVXsu/cX5f1
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="85253113"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:18:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:18:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsI2wtUz5fUuFC1sV0y5v79P6WabCYtJclBc9Yu8iqRfVoFKNdLH13kNGzgDdWAJ+s5fSoMcaCIpAR8K09hDDxjoOMwEI7VFTpSf0sjMvwaivKawGRbrxVfsgOd4FwRK+N0WC27iazVoyvSXvrPrSTg3kk3ncM0QujAF3Sr1A9Urhn1HhlatAV9rxnk1AqBxi1RYP2ZQTvDAS4iC0DL8oGiOXIOcl4QkVZxMCo5mqGa/q9gdSQ+Hn7/kgu6vyWkK6CRu3s5lFqvK7a6TlbpdWt8W9Bi+rZ4OihVdFjUrYYOgnNtI9TMuZknWXIoTgjKwe09h97q2077uFWMUZJjXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jV9rKbq8YzdYGyXAHMSoVnvUTIW0W3XGtDCh+N1q4J4=;
 b=kjURPObm8sqsbMlwrtIp6VNh9v5pw0NsPKRjx56nAbh3segP2kA3yiS6SWYGsIIqQXv/C11nSXFcOqlK6w+yqWOZ4pjmqrrlVS8J4lMXMPQtHkdN7FSuUuyZYVf83BfCpNfW37gqfCJ18N1KtcilckTYcZ/qdaMcwWpjVmVxkOkMn7GFUOwJDrcgoHCksqyANvlM1+miNYSWhdAXgW0uBuG9vBLl42D1zMJFZ9JS1FSvlhYXqJvovuHxhDhi1X3hWtmmWQZSq05zIJzS7rBihnYawOY2incI2LpDj2xecC+1a9n/GiJXvldTv8BkHoOsjn27wH7VfRP+/msgmRuVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV9rKbq8YzdYGyXAHMSoVnvUTIW0W3XGtDCh+N1q4J4=;
 b=abd7WGelQ9yM0GNEG1YUss+ixWyb8Rl1dJAHTR24tz9Ud4tAkumuv2y3fU2RGQ4sz2n6VHzMnj5yQn/ilCevrFtOmJe4VPkJSXbh3DWS2f2cD7G54UEu7DoxfzCDjkgIBqFY5SSBljBtjA7S2ycv/OLmY8v5rtpRtNXXOOQK//A=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB2035.namprd11.prod.outlook.com (2603:10b6:404:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:18:44 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:18:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 07/14] mtd: spi-nor: move all micron-st specifics into
 micron-st.c
Thread-Topic: [PATCH v1 07/14] mtd: spi-nor: move all micron-st specifics into
 micron-st.c
Thread-Index: AQHYHizofRVpxPiBR0GeGrEyfAg/qQ==
Date: Thu, 10 Feb 2022 03:18:44 +0000
Message-ID: <964f1f80-82f7-6a22-ec75-c4b0895455a5@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-8-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-8-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b72aa1f-0726-4ad9-fe9e-08d9ec440b51
x-ms-traffictypediagnostic: BN6PR11MB2035:EE_
x-microsoft-antispam-prvs: <BN6PR11MB2035ADC91B1711272BB85FC8F02F9@BN6PR11MB2035.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oBGM2T28D0g+AfbWq7znEHp77Q0LjUVs62TtRmJ75YYeUk/mb03R18SHZz66E+0jJojDECJK1WPr4ckkBCAkhZP+5QSgMargPmR0K8BW7Ssih/sDGbcuXM3ouaI1KqV5ABhdcrHA2q9SiAJVstoRLav2ch8c98WssLYEHvoRdcTaDkNvBsdN1E/1saVNyHbYKcQUOwtPkdvRZoYpp2JtO2rJzNJLzHTjlO2GATZ+ep/AGFKwU+fh5eNF6aoY2aq8pDc5qlmi5irrIs12BfclIEHzXDakKQseOrfyNG6fkUVF2OWu4PrylYtkEBwQW+lr8+WyBeraFluBCFyuTEcTNvkmaTiTrl1wYPf3f+1SQaCmGmkThPXHiejbkD1LBQ2qYasrjXVJLjlz5zCu4ifDNzkpJwYgXMslv6FPqsM9LG4+10SLR0WBFXsJUZ3k9CKkrct+RpdqsAxqvK7gs2Deqva2bkdNzbe2UCs86nSx8q3MFRvBM0aGFh/CE1BMXiEpwOagPG1sA3tG5ye1nhTHkgXwn+5GQW/CkIZ3QfgOqkYVLXXaPlO1qdFAI3e2pwgHoO6ILoL97K/a1gRLk6doDkn4L6EmWcTD5Rn+dBQJJjpgu+BZqrM6UBHbW8XCjZiPdn3qp5zWqEsV805CjsoBouSfe6P/IHIjbPLHgl6mxbrmIsjNiOjE9hqYlE0VlmkX6BM/6NSeOKjwsX8UrNJf3Pj/BHaEEdQL9YttcO9oP99Y50vCJbtwOcX92+AauSWo+yUSjWw1KAG7rN1xrgc7cw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(6486002)(71200400001)(38070700005)(508600001)(66446008)(64756008)(8676002)(86362001)(4326008)(8936002)(66556008)(110136005)(54906003)(66476007)(316002)(31696002)(91956017)(66946007)(76116006)(2616005)(122000001)(38100700002)(6512007)(83380400001)(26005)(186003)(2906002)(5660300002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGkyWkNGNlEvWElHYml2K20vVWN4WW14amZabXhHdzA4OXZXR2F0N1hReHJv?=
 =?utf-8?B?ZFJEZ2RXWTY3MU0wdy9JaFU4UUZHb2lhOXk1MFErai8rYUhPdEFsT3EwZU1t?=
 =?utf-8?B?RTNJM0ZFQjl3UHZDNFBYUlFPMFUwc3VuZmFtZTE3Tm8wRldDUDl1NzZPRU5M?=
 =?utf-8?B?emozNys3aW5xdGV4dGM5alNOaHNlTGMwK1F2TkZqWk5OQWUzR3BYU256eG82?=
 =?utf-8?B?OEFybks0S1JTOFcrK2Zvc1ltNGNxWHZHc3R5YVM1SmZIOTRsd3JXK2x2aWhQ?=
 =?utf-8?B?cnZ5UmRtREY2TGVBYk8wdmpvZXhKU09tNk5wZWZBS2ZTVVNiK1R4bEV2b2pr?=
 =?utf-8?B?VDdkM1JXUUtzSkd0Y3BQQWovZllobXJTbUFrTjB2VkpQRUZVNDZzeUNvK09z?=
 =?utf-8?B?dFg0QzNoRk13em1IYTE0Z0I3YUQ2dERDMlNmU0I5eUI2bDVjNEpVai92dnJ6?=
 =?utf-8?B?QS9pbmRETnltZ2k0ampQUDlsakdyRkNyRlBLTlBPNzNDemdONGtlbXArc1Vu?=
 =?utf-8?B?YmxqaVJ4QWFFTzByK0ZYVjZiYnl1cEJZeXk3cWxGcTltUzRzMDUrOWkzczR0?=
 =?utf-8?B?TTNzY1lIMWljTU9KYjBoaDhCd3gzZVRqOVUwZ05DVU9RbVloU1I2VFZ1VHFy?=
 =?utf-8?B?bTVBYVZaWEdVaVhzVFJiZGZDcjNGeDlUa1ZzS3k5bjljQkNPTWl5R2xOTjVV?=
 =?utf-8?B?dnI2V0RXbHRxbTFxdHg4VlJVYmlseVIxV043S2REaU82OG1LcDhmZys4RVY0?=
 =?utf-8?B?RzNWRzJ0MlJBMWt5OFpFd2ladlNVOFREMXVpaXRpM0d4R2RQTkZlRmtrcTlM?=
 =?utf-8?B?b3F4SkJNeElWUlg5bTVKRHpYeEtVMGNXV012TTJ2elBlOEdPK1JKNWRoMkZ3?=
 =?utf-8?B?UnJwY0E3NTlYbHo1MkI0ODFaWHRpL1l5NGI4d0pqc2E0eWhXQ1pNRDB6MXc2?=
 =?utf-8?B?Q3BPeWZ3NEtPZ042a0hKNXVqV2ZrNkxVOWZ6RHJXZ0RSWC9OTkxBR1pKOXJh?=
 =?utf-8?B?Yk5ZK0VYREUyTkhScVdsRlRPbmNScHRpZEpMNk9Da3FNZWNlREpPZithWjBy?=
 =?utf-8?B?T20vZTZZTkNhNUNkbDhWODgxeHlUWEtCNlRkcWxkdVczK0YwNHhrOVh6a2JI?=
 =?utf-8?B?aldBY2J4TXZ4SG5EbFkxQnZvSURkcEkxNWVyMnNMNG1pSGxBV3dpZktMc1p0?=
 =?utf-8?B?alVBWm1SdTRDWUtKQ1ZCc2prd0NmSUc5T3VCMTlBUjFwdmlaY2pSY3ZYQ2xH?=
 =?utf-8?B?NDRwOVpFTUErVHdKVW9MMVJBeEd0akNJcUtOOVB1TU0wVk80TWlmZXJLSEJX?=
 =?utf-8?B?T3pQcUdKTzM3cWJPWElwZTFzUXlPUFlpdGxidlVZbmVCSFViT0tuVE80OE5K?=
 =?utf-8?B?eG1zaXZ0dWRVemovejd3Y1RJU1ZGdTdMaUk0SGplZVpqVG9hbUZhUUR1cndm?=
 =?utf-8?B?bEZkSlNaVEZYYkNQYzdhSUhoVStuOHpqeWdLU2F1MTVxeHZlZnQ2dllJdlhP?=
 =?utf-8?B?bFNNaWVLOE5kMk5ObjNTQWQwOStwSWNScEdYbGZGZXE2TDMyZ3A1QVVzVW4x?=
 =?utf-8?B?V0tFZ3JoWnlxOXYyR09TWVE2MXJXdSt1UzIxV3lvYWFtd3d4L2RKN1ZHcS8y?=
 =?utf-8?B?RW9SaUhnU3J6bFhnNnBMeEQzUnhJYXAyWlNUNUtjcXYzdG1BNDVFTXc5ZDdu?=
 =?utf-8?B?dFRKUGZVWXhCVlJlRW5ocWxWTnFyZmZzQktDNnJObVpHcUlETFpoZ3d0enZK?=
 =?utf-8?B?WjFVWlBSRWppRU50dlBTMnZpNDlJdWlycGhmYmdwY1NkV0lUNGYyMlZhYU8x?=
 =?utf-8?B?aXg5eU9aTGNLc3p3U1RPSmpNTkpXam5CdzUyRDhBRWd6UFdDNlZlVGdaZUNh?=
 =?utf-8?B?T292QWJ0YXBXNnV6c2tQRU5SY2dRVU41RHVlQ2FTQ3dYRnhLT3gvc0d4V3Q2?=
 =?utf-8?B?ME8xOTV1ZzRSaEUwVkk2WlcvNyt0WjM4K0NDbEE0UC8yOFFJY0xlNUE3alJ3?=
 =?utf-8?B?RGR3UFIyeWgvR2RVanhaREU1U01QSnBvTnNkYXFDSURLNjAxcEZZc2dhcy9X?=
 =?utf-8?B?UVJJUFlGM0doeE13WGhGTFM4T0FYUGpOcU5DR1JaUmROZHoyQjl3MXlZRkZj?=
 =?utf-8?B?QnRoWk1MZGZiejRGS3RCSDVWMS9hOTl2TlpvL1RycmxIT1dSaFRuREdFZHIy?=
 =?utf-8?B?SUN0VC9ESkpqSlhncjNDTzRIQkwrdXNYRCtYVk5zd0FBNUxJUUVYakR0dUJF?=
 =?utf-8?B?K2pMMWdvT0tvUHd6NTJmblIwRzlnPT0=?=
Content-ID: <AE410057EAFF3345AA50487DFEACD87F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b72aa1f-0726-4ad9-fe9e-08d9ec440b51
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:18:44.0553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klApKbhByxB1sx9hkfYpu3zrt0thvN2L54ssM/EkOV22977AX8Jayj2/6yTD/NQTZ3jC/AenWK6+nik5jiDRAQculjX+9bD3j3gY4mC7KHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_191848_981428_1A373E54 
X-CRM114-Status: GOOD (  17.84  )
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

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The flag status register is only available on micron flashes. Move all
> the functions around that into the micron module.
> 
> This is almost a mechanical move except for the spi_nor_fsr_ready()
> which now also checks the normal status register. Previously, this was
> done in spi_nor_ready().
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c      | 123 +-----------------------------
>  drivers/mtd/spi-nor/micron-st.c | 129 ++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h     |   8 --
>  3 files changed, 130 insertions(+), 130 deletions(-)
> 

cut

> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index bb95b1aabf74..c66580e8aa00 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c

>  static void micron_st_default_init(struct spi_nor *nor)
>  {
>         nor->flags |= SNOR_F_HAS_LOCK;
>         nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>         nor->params->quad_enable = NULL;
>         nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
> +
> +       if (nor->flags & SNOR_F_USE_FSR)
> +               nor->params->ready = spi_nor_fsr_ready;

I would like to get rid of the default_init hooks. Can't we use late_init for
setting the ready method?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
