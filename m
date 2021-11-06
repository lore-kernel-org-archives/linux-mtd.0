Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AEEC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 09:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D46611EE
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 09:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7D46611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrsw60ztzsZLnTBv1IxDVlBVe7z0JBK2fFjABiM1sss=; b=x2pbpEmGfWvIyL
	feHwmrtDpbueTKvjFtYbiC0mpdD7SnVie2UsqKICSFOkwe6FuTbRlk74dWNorY0X6xLZktTkQ3ZUZ
	50UFfCxDzDPBE8SocmPeramsKVbzoBOj3CjmaonWizICWEND5l8GdUjUVxEr3zowL+/Hl/82DvWyD
	y3qu6Jt+1HhwaPdkghVtIjDph8qGbtRhIkm15RfGGn+KOOdhNvykRlPDLxf4DJOfsoOLMrKHVAT2x
	x9AKaqFPQIvfZINzeRgGarv2mzpxAaNQOp8A5Z79gKOOtvQC3KduSK3KNO4vER5gGW/He5x870SRv
	rQNz2oPaYxtzhvGlXk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjITQ-00CsWu-Jz; Sat, 06 Nov 2021 09:58:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjITN-00CsWD-Vx; Sat, 06 Nov 2021 09:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636192733; x=1667728733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G1y1CZqVdnVWZOxVMQaOYkUzOG7b2gzM2sSmhC1l1tA=;
 b=V+asVlFJzOp1wZQl7O8B+4ZIfG9fb73+D+DT7oeZAxPfofqhcUeaBzwu
 eVofqqKkK3TiO85fVq7l0IXcYfRyimUcyh9MJHC5IJM72f57gjmWyaIib
 N4QHgZ2oQYYBkzEPlElD1UKeFotuLYvXY/isFLITwSGq88Lb2OGVImeCp
 v+sSS88xUxVYa2QGBdm8v6NHeslWHBUc8AqMr15I4PZggJpC+wDoEtIci
 JMPdN5uFBsMtUCtXChYayECoeUowsayrcEbkmisT+sHbZDK6T4OiU6c07
 oT8rJSRBprINX0l8TLNqHP8q18HUakeKEAg2fJXHn3Qj7qa3ICIbNeQtA g==;
IronPort-SDR: TQpqVZn6+5EAeRs/cS9KK9CE8TzG2yjpigJiezYuQYcGKPsjYIM/6Q0ilE4WAXNQhaA1WJytPd
 T9rW3pnPTZK4PMIbTRl/nODcpsDvLExegwR5WGV0shcMBunqZUAbSQW2+pcinvTja89cvtlGwO
 QTPCX16efjKdVNP++qL+NPvWIaN0Mr6li5wItWWkrv9+vdnY79pnqXT+NQNu4ntGwoq30hn8yI
 vpKGfcSSuIOmv03w+5yW8t6L4+HFVMF7cBWdhRJKnA/4QPxSq0j/Nxq+2/w+4MIuPCR3Nb8sjl
 J5yCzT0KJfNcTUn+l7FhBQOe
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="135683871"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 02:58:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 02:58:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 02:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYaiRFtFqKok+GJ5+N7SVo922hlsDTwEBObwWgvY6eGPeQ4cWn1AmaZjF+lEmxFevW7oBhCb2kqASXYvCYv076RbLIqqoRBcjaEgTIVXnHbnKeVOsjZIHDv4kst5vFnd7bKu+iNbELs/ImbD3Ln6WllXXMaHEkq77IYeb/su/oZEaZfotG20I8B83BMwVRFWNhuN0WADQMsQTf3Dxm1gAioJ8OerJm+AgLdqDe4EyA7nmp9STfA5N9mTHyCbhBNuG43fAVdgmdWOsZf8CMCkm45vjMsi+R7I4xe9J+kdAgr1zw1W5J5W70vEAcbzL9X9VQPMWjZWqahSvmnEXhk3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1y1CZqVdnVWZOxVMQaOYkUzOG7b2gzM2sSmhC1l1tA=;
 b=Uf0DZdOrdIdupkD6lvxYJb27HKIWHFZeRDMIWpZP2AfXaEZuMKdZlvf/cm56140MwaZ9+2xvVenOk5yovbilNvsM6e4HfVb4DaHI2jZx+/yvsSyCVBjHQEFDWlwPe9kGqaTfCIIMwH2ebWOCACncfVYb+by33eT3AWv/GjRDkxnonalpaYrCTJjSh3K70LQnnvug/cJta4HtaPd7GB0mKVo6CFKPtptThI/soWI8qlCVpjpFvQ3btEF+zd28YpGAIgUeQX7Mra+y2ulqbzlgiEz7ciap2+wBe1br7NMhABeHxR5EqDSx7IX807HmBhbXC+6E7b+Sm1QTSO5g9r9Jfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1y1CZqVdnVWZOxVMQaOYkUzOG7b2gzM2sSmhC1l1tA=;
 b=A1AosUH7MCVXesyqb0545KLXLpW7+3QTGtrKFvufCqpBrZUXHiRiw5g8Wgo8YWbWvP3LyROVNuiITzRFm0sqmz2zeW71lhAZkrbHIzX6Hiyhnt9aTBiEQDw0HOrRR5qaZzZrxc5qX9y5zsB7EWdwZJmyk6eEKy8keLL/mg30jrA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Sat, 6 Nov
 2021 09:58:39 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4669.013; Sat, 6 Nov 2021
 09:58:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Thread-Topic: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Thread-Index: AQHX0vTem9E8rAgDnk2BIf71kqjibw==
Date: Sat, 6 Nov 2021 09:58:38 +0000
Message-ID: <c00725cf-038e-3e04-c38b-98d92457054d@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-6-tudor.ambarus@microchip.com>
 <9070118a2a8557a853f4c5e6a3dd4d58@walle.cc>
In-Reply-To: <9070118a2a8557a853f4c5e6a3dd4d58@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fd748f0-0adb-45a4-be59-08d9a10c01ac
x-ms-traffictypediagnostic: SA2PR11MB5113:
x-microsoft-antispam-prvs: <SA2PR11MB51134776B389C2C4B039E4FBF08F9@SA2PR11MB5113.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UzXtA4mYZqbwHyoRaDEFlK0g5nPxlCTf265zBVgg8+Fr+T4I7hgB0O3nr6L/BMCyDg4VVOBoCsb+4SXNNietYX6pNdCzUvkY89R3AWpKACRZffe1oqdu2Vas8WgjamAKQxsWcdZXo9gRJHJBQn6jDILUZ9XmaW8AWmTzOt/2RApkEiOBA9G1S4c1yhA9ZkOhLRvCKEARhH/RMFyIIlnkfGDVV22q4ADOCoxdMlhkb78LEqYcrZVAsKGZWwND8nF25/H1sx8BGDNV6FdYNoIDEc+hgvyI/3Gn7xnMYRozt2Pb6s579URAQ9wnLIa1YHlJKEX4L6A8yDlOM7sIyJ82M0QtFCc6faLB5Op0+gLEOHNF579g/55Jx0jVed+CmqZXaaJkFi7M0L4X7tICuiINUfpmVzs1N2Uvl8opRL3noGNYHJr4/TJbYGPx0gtRVb0jNekxdqAJLiueN0OqUTHXG8kKLMno9EuPSdD14JLljK7XXZgo7TOlYQWDOckG7I2BmjiwYajrGZWumWN925tmlI0D5/cg+/R8L4WGRsF+O1RzaofUf+tOBpB+XbyTxi00zQRMDe7ehv72aDKHtQpbslDODtb96RmejnoBRJkhrpUqq2k5CIGyyq9cJzGtd2CFjEWaYvfOraWTuFGa8RcDyn4LjislLoGpNZianc+hliv5l9gAE/KKuujkkFQLTJLJxbFEQOhDrQhjifTtrlM3MncgzjR9Omt+nsuW0uFZH0KEh35RRWEfBj/cyU7hJsVbhq9KvOUZvNPCjw+28k7ZsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(6486002)(76116006)(91956017)(64756008)(66556008)(8936002)(66446008)(53546011)(122000001)(2616005)(71200400001)(83380400001)(6512007)(7416002)(66946007)(66476007)(54906003)(316002)(6916009)(4326008)(5660300002)(31696002)(36756003)(26005)(508600001)(31686004)(86362001)(107886003)(186003)(38070700005)(6506007)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUtoT1FlanIzZmFEMlNUYXFjd2VkNG1MSmt4R1ovaURleU4zTmFZWTExUnZM?=
 =?utf-8?B?K2JMdUZMUm0vaER5QUxpTWVVbW5BV3ZvcUQ2UHJ6bmhmb0ZVQzY5Q0xhQ1Bu?=
 =?utf-8?B?dWwwTWY4bE11c0hGOWRxZXRiSWlHR0REWTg3b3dWVVFlUkhzMEt6N3ZCU3po?=
 =?utf-8?B?Qm5HTmFpTVNGcWtDU3Axd0MvcUZSdVl6c0htOWRGQkw1TkF5bTFYQUZnZERJ?=
 =?utf-8?B?UWtGcnBXeEFVVVpxUGRrNHErQWF1WDRzYWo1VFJTTEk5S2lOaDRXQXR3a25o?=
 =?utf-8?B?QkFxMjE1YlIvSEljZW9lQnlvTVpNWFB4U29SSFJzU3BZUm5ndlJoeEQ4L3Zi?=
 =?utf-8?B?bFJLUExWNmFqdVVZNEV4cnR1K09zTDNUS2VpZTJKU29VZkdPOVJLY08vWVkz?=
 =?utf-8?B?cFNDdDAxb3BtYjB5SzJjV0dzMlVGWTNoNFM3TmVsNjdGUmh0eGZQYjc0eFgy?=
 =?utf-8?B?bjV2a0s1NWFLODBuTEl2VDFvK21ObFhhM2M0L3FlSzdpMGMyZWhzcWhJSUhI?=
 =?utf-8?B?N082VDhCeEFvM0UxVlNGOURPajJPWXhFcEl0cm1QcjNDU1N3WHRIcFFuekkz?=
 =?utf-8?B?YVVTdFlILzdTU0QwaUhHazd2b0RYZ3dhaks3bjUyMngvc0ZQZlRiVnRYUnJp?=
 =?utf-8?B?U3lyOHZyak9ldk4yd2xOa1BTaFBxTWJWQmx6Szd2OFBUQ2EzcmpXRXFiQnZu?=
 =?utf-8?B?bFdvcnZManhBVTJEZ3FNUUswOHQ3bUt6OEVVOUgvTlcxSUhiZXAwemVwNk54?=
 =?utf-8?B?OGIwdU9WeTZyYWoveXE0Q0dDMEE2TG8zdVo1NTVtK3VGQVFWOUlJZklnMlB4?=
 =?utf-8?B?aEkwSzUxNTBVTjY4QWY0ZHRmM0xJWHIxRndZQmp3bW1kZGl2L0MyZW9nT3BM?=
 =?utf-8?B?YW1MeUxqU1JJQS9BWEozWlozcXM2b1FVSTEvbVJZeGVxemNyYVJzR1VnZHA0?=
 =?utf-8?B?d1RZRFNYUFVuZWZLaGVPQnZTVG5NbzBvSVkzV2VxOVUyaUZ6M0VwaTY1RExE?=
 =?utf-8?B?WFpSUVU3MEFHWnBaMFBxZWdxWW1Ub2l2OUJvZU1nN0dWSGNFNjNmM2s5SE1z?=
 =?utf-8?B?TzgwTElHbjJsM1poZzlmUWc0Y1gzSXEwNW5VZUhIREN1UCtHTjZlM2prZERl?=
 =?utf-8?B?dTJLK1hwSENWdTkvY1ZHNG5CbFdqdFhzdWJwc25CYzd0NGFxeEhkcisyMFhk?=
 =?utf-8?B?TzIyM2xMZk51cGhyNi9kMFQ4dERTTjJ5WTBFMllrVzlkaXlPRlFFZDVZbTYy?=
 =?utf-8?B?TnV3SXUwNHF3WmVvcVJhcVExL1FJWDJmTlJsNkNvTGtWRkRaV1FQb0FHcEY1?=
 =?utf-8?B?SE1oWGMwL0VsSmtzbVo1WnpvaitZcjZBL2dPeXBteGhRNjA0SGs4dFRJcVla?=
 =?utf-8?B?cnRMbGs3T2dCb3FpTXpJd1ZuU3JQeTlCUmFjSjNUbzNTYngvU1J0MnpQMGoz?=
 =?utf-8?B?cGk0YVdSb0tDUXlFc1ZCb0JmWjlyVUsxR2dEcDloWXBuYjJLemgya21Zb2Nu?=
 =?utf-8?B?VDlpaWg4MTZ3eEZucHlKdVcrdm1IeFpEQ3RER2VVS0VySDdhc3RoaVo3Tys3?=
 =?utf-8?B?TWNhamNkOXFsdndhRXJQd01kekNucUhqY1VxVCtwcmFIbFhXR0dxZEQ3WG42?=
 =?utf-8?B?RmhPOHVUait1ZGw3WnVGbFdnSUI2ZzRVVVRLY1p1bnR2d1cvK3g2N1J2eWR4?=
 =?utf-8?B?Z29xMHNjTkpUWWlnWkc1WjREYy9GOVZCZW9HbTRNT09xaGlrTDJwTVpBS2hZ?=
 =?utf-8?B?TEo2d0hzWkd5UDI3anJqNEpvbEpBQ2l1UXA2UU9LN1lwOTMvMGQvOHV6NCtW?=
 =?utf-8?B?N2hldm1uS1ZBMU9ETVhOUGdtM1JFK205a0FiT3NROXVsclFubGx0VWJGY3Zn?=
 =?utf-8?B?NDRyOXp4KytPYmtnSEhETUlnaXZYd1BidC9hTW0xeWlDb0Jhc25FZDRORW9o?=
 =?utf-8?B?Q3k5bHQrMjdDNE9naTIzZmhYQlcwQW5IY3R5NTZTT1JhSGk1Y3lZMGllZVRT?=
 =?utf-8?B?alQyQzdMR2EraSthVzh4ZXJzaG0zTjFHbjZZbTh4U3RJZldubk9FOUxuTTkw?=
 =?utf-8?B?UjhwNlFaanVmOHBzS2JpUHFjcFl3RG55R2kyeTRMdlVwdU5PODk0eTVVWjgx?=
 =?utf-8?B?YVd5TVQzQWpYejZHZURaL0IyUkN5T3N6VDArdlAvaWtTNXM4OGtWNkZpb2RB?=
 =?utf-8?B?TXdETjg5Tmh0ZVFnMG5nWHJJN2g2YmYyaHNFRlo4ckxPZHJ5OGJNWldwa2hU?=
 =?utf-8?B?MTlLVHg2QmozbDdXR2c3QlJMVlJ3PT0=?=
Content-ID: <C43BAFA346A3244B89965AD3C17D4D42@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd748f0-0adb-45a4-be59-08d9a10c01ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2021 09:58:38.8666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7089GrR6Ha6unBREso/SyCmt/RfNnDRFrQEFNwEGVXCBiv8klR3S30kgxBrHU6jNAIsHd1mTtmId6YBNeT/iGK836HkDf/HNO1ZjSoIFss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_025854_230593_8E6D859D 
X-CRM114-Status: GOOD (  17.71  )
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
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/24/21 8:44 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-07-27 06:51, schrieb Tudor Ambarus:
>> Some manufacturers completely ignore the manufacturer's identification
>> code
>> standard (JEP106) and do not define the manufacturer ID continuation
>> scheme. This will result in manufacturer ID collisions.
>>
>> An an example, JEP106BA requires Boya that it's manufacturer ID to be
>> preceded by 8 continuation codes. Boya's identification code must be:
>> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores
>> the
>> continuation scheme and its ID collides with the manufacturer defined
>> in
>> bank one: Convex Computer.
>>
>> Introduce the manuf-id-collisions driver in order to address ID
>> collisions
>> between manufacturers. flash_info entries will be added in a first
>> come,
>> first served manner. Differentiation between flashes will be done at
>> runtime if possible. Where runtime differentiation is not possible, new
>> compatibles will be introduced, but this will be done as a last resort.
>> Every new flash addition that define the SFDP tables, should dump its
>> SFDP
>> tables in the patch's comment section below the --- line, so that we
>> can
>> reference it in case of collisions.
> 
> Btw. how will this work in practice? Let's say we have a flash of a
> "bad" manufacturer B which is using the manufacturer id of another
> "good" manufacturer G. Now flashes of B are added to the kernel.
> 
> Some kernel versions later G releases a flash of which uses the exact
> same id. How can we now add support for this flash now? If we can
> differentiate at runtime, fine. But what if not? Will then
> the legitimate owner of the ID will need a new compatible string?
> 

Yes, in order to not break support for the first flash added.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
