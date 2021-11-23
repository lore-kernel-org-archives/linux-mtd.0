Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F0BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebYUYRGEo7xCmjT3eIp+dWfgo0cLtXJPoD6kbnCxlvA=; b=P8hDWlEUz73NOa
	P3j0266N0SSRnh0fdo6kY5C2K9SQxK/baMPLb545J4Ji3bCu35UWL4vJyr4bEq6kimC9XhWVWM/iK
	WvKVBMNeJmomEEnplXbHq9G13Hhbg7sfyrqUn+NEKQmdAqG/PQ+Q+kTe5fAbsVjCswvRlpWgMyPQN
	179QQcafBJb0qGQkHLHVZksTcZyYQF1ZEp2CwgpK/LPRtXv6X3ke5cJMKIleaE7dqcIBvzR8rzExx
	gLTnflFmQ8RBUxCrUMwZ8A7LX+KAY1LNaBtEYevCegvgAGy4Sy5h5QfKcVme2E8WIpTK/Lr2bq8E1
	3kocWVRGmYhhCykU6aFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpPXC-0010nF-0N; Tue, 23 Nov 2021 06:44:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpPX9-0010ml-EJ; Tue, 23 Nov 2021 06:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637649844; x=1669185844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qhO7gqcOkb5LBYrklJtwajGbOtRJ0sTCrmqjpGjWd6o=;
 b=E5hwQzinZcVhjJNjAewST6+5ZFk+mU2eRkYLKEaRDp3oZGf8R1eNOuCS
 d7vCQMtPgytSvDY0p3obWXcwrg/OIpj+oGWtCCwhBmFWMHEdSotXgNpJB
 BmvoXXXwrnwPoImlgFpxOPmcB9Lweail1pcgtN93rYDevmW62WhGvuYy3
 tCLo9XcHdV+LSjljXt+Ka1zIf5UZSwRWFFo3W/CLKEnMZDwxLJySONa2x
 klHhLoJKCM/03hDDr8Wfy6jZa2EuM6lw0v+smf/VPrvHmuq99RXbgesq9
 PEmy4xh796XqNQHxGz2w1ykRIEDX5c8TVqo7/4U/Ua8Yisf+3AG5v3J71 Q==;
IronPort-SDR: F9N63qKAboZXOWLVR08W/GWEkxaVnmbY0atk/XtY64V42ibYmawDOeRhTbg6rWVUWmGuy7AFrP
 Sr3WTpn3ERboCdjLyGHnsBwOuYWZjzFfpiYXJTJ+EhhtqmrDamEdCnnE1ntaOnUzvVqdlH3U0W
 qm7T4HJY/aJiHYH+PZdqUdLYfcgICqI0x+aa43e5iIgcwuNDx/GUeMbg+excOVxcn4LkFbZ3iS
 fe5JEO/BkAQA0DCF2xRHjSzwo+mIRvB8ZqMZQ6DEULxzXZRz6gP6Bbs90OVHLAbg21IW5IW7HG
 3euJAerPY1Wh+KH/0DjrMXkR
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="144253166"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 23:44:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 23:44:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 23:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKOeo/P2E7HUjMYyuCFmtNspGm6tYTNOWDQ/5xGddsn12mKn/mMm6/eSKmKn+A4EHeKo7NlFe5zqh1/DYz7qdGJRMsoYHNfRDhitbgVlq2y14/eeqSqKX+DVfrqVn7nbhf/2Ef/JLSLrQvNbdyjTzv0AvuYxFy/klyE0IfVI3IWv5mYAlGqot9Oux57D7d14K5kNHAUh+kl9vNVTR/wKGrH0tqRixAg+A3nZ7OTdZEh6jk9McuzTEES4+k60YTs9crgIsaITgLAE4GZNG4WNp1emx8J3GqeYjp7RVZVpWvSHsxeiSeiRMzIeRDdrHbZhlIHw2sNA7hCQtTyaUpelmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhO7gqcOkb5LBYrklJtwajGbOtRJ0sTCrmqjpGjWd6o=;
 b=DNY3G1eP1BnIEzI6TrlUXmHbaDUekpOWCUtdiNWASUDyFkwcFYnzTu/bZHQ93N0JfNw408Tt7KUoE6dMC/boycdjJvEoViEhnKa0/gYSCo+4rVPFmYyGI82Xp8ieNB8+JeXiQ+B+1HC3Dkm7S9SQPANPWok3OiOJceKLyUO0DYmvtmpt1FPOz650qm4+S/9uof9nwofHZzzPT+liA3jQnWSlsO6QXNg9DJhhvGSmVeUGWcCSj5ziTrmnmxpp+iUMFx3CH6azbsRctQNydZVmbNh72jBicn5I9rqFsueXKohp9FBliDSptANJBM0HP0hMUOMsn7nu4PtNfc7IjKy6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhO7gqcOkb5LBYrklJtwajGbOtRJ0sTCrmqjpGjWd6o=;
 b=teXk/mrD5/pN+UP+Vf4k6VpxD9IY4vORl/FWNe4B053f2Uoi/Wfb+MK6EZBdxvO0DBANWWum+XgVz8Bm2BkU0BI6n8Iqz2iBepQIWPHX9KB8hwqGUJFSyTGGgjClQjYBLy9mZFbEXgOgnfeQmLRlYm5vD5OAXHwIv/tCnKX9zqU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2877.namprd11.prod.outlook.com (2603:10b6:805:5b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 23 Nov
 2021 06:43:51 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4713.022; Tue, 23 Nov 2021
 06:43:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 04/13] mtd: spi-nor: core: Introduce flash_info
 mfr_flags
Thread-Topic: [PATCH v4 04/13] mtd: spi-nor: core: Introduce flash_info
 mfr_flags
Thread-Index: AQHX4DV5vplr4bNazEStHmuo1gNReA==
Date: Tue, 23 Nov 2021 06:43:50 +0000
Message-ID: <04f85c19-9fa9-c6d0-08a1-ada3e29bed61@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-5-tudor.ambarus@microchip.com>
 <8cd44e0b20170a4ad53d9d75a7d01446@walle.cc>
In-Reply-To: <8cd44e0b20170a4ad53d9d75a7d01446@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cec944e-9af3-43ff-b4ba-08d9ae4c9c24
x-ms-traffictypediagnostic: SN6PR11MB2877:
x-microsoft-antispam-prvs: <SN6PR11MB287748B4EAE82DD6E2E1B0A0F0609@SN6PR11MB2877.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LwHu/LeeWO/qw8HA7nddygS6I7JIF2Q3GSyRckbWJGCvgYlLSU4okZh4ACfzWUiueoLWs5sugkvwKcSaq+atmNWryH/b3Rb1vxx84Il8kr4C/3Nzcgfz168s3YIK4cmNv+MFFwLzpltr0uUuQzJ3cKwNMw6rTJPdm9Av1Gi/NTbk0r57ybVxmARJpTBb0PklXqYlbEw/Pb8jBqgth2ZFA3PGhlAtica2SeAJl8v8M64n740iwG3fbDJsJm/CGs0DV3KCht+9CCzVygKyslmCKHSXtcZzty+GNrXT+r2anbJSJKuU2pnjDYyYcxOc6X4YA4h6iptR6eJhddHS1k89kCfEEn6EI6zRzzJurzIFTG5kKcFiao6Jq3eQ0LYssLdhgrFkkKsYZYqfNuQkD8VRtCZLzGD3b+Cn2uGmXx5fgpe/MLHmRBJn6q6Ov/cyN6iQf2syx0NL3r0i8mmUQaA31TKaj/fpKwJir1sXDrUPi1Rb6ShlCcXBqJfh+WHml1kTsRnkWXt6cd7sPqBlFBOBMzmyvB+pRYd3E2pow+lA1NLq+w66PS33yJz/jVur2p2+cYTy9sSUHyacEbvUrQLlTWqfuxYsxiZiuxNSgUSji8YVCN7jg7jvZZ64dVjuL9HhBJUenWot3ttqIxKju0MZxya6PU2qH4JbzfBFc9DF+XkQX3e8WO04mSd8Jb5fBbAYOrZJJKlKtzzQPJkvxQDANVCD486PzT51bqM0DadrNI4VBRrsYAmgENJiLnpVTQHMPzXVduxW4c/AETR93W5S6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(66556008)(91956017)(66946007)(26005)(2906002)(76116006)(4326008)(6916009)(53546011)(64756008)(31696002)(36756003)(7416002)(6486002)(66476007)(4001150100001)(107886003)(316002)(66446008)(86362001)(38100700002)(6506007)(122000001)(5660300002)(31686004)(6512007)(8676002)(83380400001)(71200400001)(38070700005)(186003)(2616005)(8936002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akE1OFQ0djJiSXl3Wlg4bkc2dVpleElFUzM0bm9ZeWxVZEUvVnI4U0tDbjJU?=
 =?utf-8?B?bTVwN3RPN1plR1dzaWsvSW1BbSt0WVQ3cS9nYmE2TGlVKyt2aTl4MzZjUDZR?=
 =?utf-8?B?ZGlDZjNrV3FIZlVUNEZRSCs2WVZOMERiNVhrSGs4SUdkVlI4QnVSSmZxc2Nt?=
 =?utf-8?B?dFBHS2krT0FkNjF2aGhBTWRSYnF2OUJRancwaXRzVXhWc0lkNjdUcFdML2Jp?=
 =?utf-8?B?NlVOelo1WW1rbkdib05QcGpUZmluQnIzYytmck1ka3JJNFlEWks1SElXNUpn?=
 =?utf-8?B?eUJrSHFSYWJJWHFoUng0U2hNV0M4dG81Y1dDaGkzYUZxdi9CRitCVWdYZitO?=
 =?utf-8?B?THRFV2ZveVVtYUdxVFZJTjladTRzTm5ic3hPZ05udVo0UTlQWno4WE8wd3lz?=
 =?utf-8?B?MlN0dkE0NnN1bXdrM2pyc2QvM0NlaldacmlKSTE3R3BkMU0rZThJVUF6d0NF?=
 =?utf-8?B?eS9ScmRYclpvSFVJZHhpTC9XNkdjaXpFcWIvRDFSMzUvQytDNzNJSlR6MFcr?=
 =?utf-8?B?Z3Z6QkVHOVhnOWdCbjRWOTZML0pKekt0Q2hRV3hxeU1LRzF4S3hVNnU1d2k5?=
 =?utf-8?B?ajRiZnVkUTkyOW11YkJpQWFvQk5XNzhzSWhTclBXYTdCOGNKZHlNRTRmNlor?=
 =?utf-8?B?ZTNqTjhzMTlQOFBseTZtWlp0ZHphWDZlWGdVd0ZPbmsxNnN3REoyd3BhbzE5?=
 =?utf-8?B?cXRyNDNjK050K3Y4ekRMMXduRit4QWdvRFkxNHcxelZxYnIzdkhuUWN5SFBM?=
 =?utf-8?B?emFWMk10NVEwWUNZeHpaam9XQ2paYlA2alZKbUdDVWx6Y0MxS0hrVEdRcytN?=
 =?utf-8?B?d2I3b0dtQm1OOE9hZmJONWdMbVhQRHhEbU5kb1NrbCt5TU1oQ05zUXNPNHQw?=
 =?utf-8?B?NlI3WEg4MVNaWlNMYVVJQ3BYQnV6eXVNNktuZHpaU3BwdTJOYlhsTmxmMnlX?=
 =?utf-8?B?ZzZOV1ArNUhhbWxmSWdEUUF5WStSVzBxaGhJMzlrK2dOb1lvUlZaT3F2dy9D?=
 =?utf-8?B?dUtrVHo3MnpPN3pLQXgrM0ZBQWxlVDB5bk1ocXhHSHhCbWx2QXBUbFRrQ0FB?=
 =?utf-8?B?U2VJUXNvR2pGWGZJQkVYSXM4azNVSVJrdm51c1gzejROc3lSRlYrcDRVclgw?=
 =?utf-8?B?cjhlOG9yczVIcFcrU0J4U3hLYmJMbHl6dmJrY2I4aVpKMzZqVHF3WjRUYkNO?=
 =?utf-8?B?VjNESGVCTFY0VVdKN1RTRUY5c1JmUDE5Sk5XSzFWa2hVbmx1cCs4SXBSTzYx?=
 =?utf-8?B?cWdWVlA4L2IzM0pkL29RTDhNSnpra2YvaU4yaE5VTncyazhjSFQ4VDE4SnBp?=
 =?utf-8?B?cFZTNmNucWMzVUZBOTVmbDBpYmJEc05nOG1PRW1QeGNFZDFMU1J4N2s1anMx?=
 =?utf-8?B?ZU1TVE1ZZWZVc0FQdXJ0M1F2NDNrUW94VmJsSlNZTTl0eCtGV2lEai9ualpV?=
 =?utf-8?B?RHAweEsxNkd4cHMyNzJjNGNKc1pSN0ptMzZITmhDY0tWcDFwOHBFWGRRYVAy?=
 =?utf-8?B?NWJQT0FQdlRaakY4djNyWWlNN05xRENoWmpjTHhFZjhYbTkwK0hiZ3l2L2t2?=
 =?utf-8?B?dHNObWZ4TkQ1bEg2MVZSOUFPTnRFTHRaTEppM1d6bEdKb2sxL1A2NloyTGFU?=
 =?utf-8?B?aGFjR0w5OFFYZ1h0RUJOVEgzVEI5cUZEeXh4VXNuL2I0ZEU3djRkaEdSMU43?=
 =?utf-8?B?bHdkMUszY3ZybFhDWXZhRktHSzhqMkdDRHp5c25yTmFWMHpHWHhld3N4SHp5?=
 =?utf-8?B?VXVIUVVWYkNvRjZYeFNrdmV1RGc3OVFFUHRScUpwZlVtekVXV2dTdlVVdzI4?=
 =?utf-8?B?SFYvVTFKK2hIeXdJUnJsOUJ3NDVoUVNDc0xaZ2FXYmV2RjREaFU0cE5sbGsy?=
 =?utf-8?B?L2phdDAyWnMycTdQTDVFRXJTdXR0eWtzaTJGbUdDeFNGSFNrNXI5Rko0N21D?=
 =?utf-8?B?eitxSlpuZ2wxRGVwS3ZwV2FISDN4NE1hVWl2MmhWeUQyUTduRFprNWNrMjVa?=
 =?utf-8?B?WFJTSTlMVHpneEUxR282K1RCdnUzYURzWGhwL0VFUlRNa0t4Y2NQYmZ5K1Vs?=
 =?utf-8?B?YWV4Wk9pWlMrS3RrRkxaZXU0NkE3bVFESWFLVmFFWWhIR2ZSQ2RVUk52NWpL?=
 =?utf-8?B?UVJ5VmxBVnFlY2NIbVAyZHlsYS94eDFQMGtXaDV2a3ZESElkR2EzeGxmRzYy?=
 =?utf-8?B?Z2p4aUJsb2ttdSt4V0ZmUEtqWS9GTFpvT1h4OTNra3UvVCtlV29PTWRyemIx?=
 =?utf-8?B?cUdsbDZGMkhTMm5WUll5bWZ0VzF3PT0=?=
Content-ID: <572B9D50EBBCDA4B82CB5B6A2C9262E1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cec944e-9af3-43ff-b4ba-08d9ae4c9c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 06:43:50.8959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSF0x9hC0s9SU+7tNptWtOIM0FzqY6nXT09yFRy/dfnmFYo0JRA9xAXS9zeU+0cEHBZfuXLwO/cdQJV2hKLPDTboQZn5vpCQnhuoYI5A9ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2877
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_224403_614154_7776D205 
X-CRM114-Status: GOOD (  14.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMjIvMjEgODozNCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTExLTIyIDEwOjUwLCBzY2hyaWVi
IFR1ZG9yIEFtYmFydXM6DQo+PiBVc2VkIGluIHRoZSBtYW51ZmFjdHVyZXIgZml4dXAgaG9va3Mg
dG8gZGlmZmVyZW50aWF0ZSBzdXBwb3J0DQo+PiBiZXR3ZWVuIGZsYXNoZXMgb2YgdGhlIHNhbWUg
bWFudWZhY3R1cmVyLiBOb3QgdXNlZCBpbiB0aGUNCj4+IFNQSSBOT1IgY29yZS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+
DQo+IA0KPiBOaWNlIQ0KPiBSZXZpZXdlZC1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxs
ZS5jYz4NCj4gDQo+PiBAQCAtNTgsMjggKzYxLDQ2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
X25vcl9maXh1cHMgc3N0MjZ2Zl9maXh1cHMgPQ0KPj4gew0KPj4gwqBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8gc3N0X3BhcnRzW10gPSB7DQo+PiDCoMKgwqDCoMKgIC8qIFNTVCAtLSBs
YXJnZSBlcmFzZSBzaXplcyBhcmUgIm92ZXJsYXlzIiwgInNlY3RvcnMiIGFyZSA0SyAqLw0KPj4g
wqDCoMKgwqDCoCB7ICJzc3QyNXZmMDQwYiIsIElORk8oMHhiZjI1OGQsIDAsIDY0ICogMTAyNCzC
oCA4LA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU0VDVF80SyB8IFNTVF9XUklURSB8IFNQSV9OT1JfSEFTX0xPQ0sgfA0KPj4gU1BJX05P
Ul9TV1BfSVNfVk9MQVRJTEUpIH0sDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9IQVNfTE9DSyB8DQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElf
Tk9SX1NXUF9JU19WT0xBVElMRSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUZSX0ZM
QUdTKFNTVF9XUklURSkgfSwNCj4gDQo+IExvb2tzIGEgYml0IG9kZCwgYnV0IEknbSBmaW5lIHdp
dGggdGhhdC4gRG9lcyBjaGVja3BhdGNoLnBsIGNvbXBsYWluLA0KPiB0aG91Z2g/DQo+IA0KDQpJ
J3ZlIHJ1biBjaGVja3BhdGNoIC0tc3RyaWN0IGZvciB0aGUgc2VyaWVzLCBubyBjb21wbGFpbnQg
Zm9yIHRoaW5ncyBpbnRyb2R1Y2VkDQpieSBtZS4gTm9uZSBoZXJlLiBDaGVjayBwYXRjaCA1LzEz
IHRvIHNlZSBob3cgYWxsIHRoZSBmbGFncyB3aWxsIGxvb2sgbGlrZS4NCg0KVGhhbmtzLA0KdGEN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
