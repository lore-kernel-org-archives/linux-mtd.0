Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4BCC433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 13:12:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0EEB613A9
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 13:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0EEB613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w3cTN6rf7ckUWlMU5jwePqKsoPJzm3LuWrusd6u8dCw=; b=c3qM/kW/HltdDgZlAlrTB68WI
	ggGBQhG6JwK31HVzG6HEOM23U/mec8ymJDVOMZ4aCJ9kCJVvyLJ+n/mtGxI5X7LynjosWVLy8gZ6n
	AexAxZYz4a5m1AouGFEL83mLku9EejxmPo+27ynXU7LUFIjvZXh6KZHn1cgwVRo785ZL5SQeLQWXD
	c75ZPxc7X9Jj979gJD1QAHcNQzIintTxQbkQYfALNBHV7Fi40cPUJjlaSbr4AfNth9LkrezOjy8MA
	NmH1TQm/kDvtbbREkeSt0MYjcVdRDLGu9ayK532pKBGdMb45kO96IrMYW/EM1prHa/kC+BPuoLV1K
	O0X8opM3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTP0r-00HITn-Oz; Mon, 05 Apr 2021 13:11:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTP0n-00HITK-3S
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 13:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617628285; x=1649164285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=K5CFAiTs4RVrOXw1u7PiwMZ/tjLo9CqprS5x5KEIX+Q=;
 b=bVFWEb6TA5Ww9FzfC6iifpCDI2aazjRs2rOe3REV5v3Gop77i/O8vij9
 pNsOcQqaI30dEeSKdrkKCPOFsDJb1tDeimefeuZD0gFMktUgPLXndDOOi
 qtzkwfdApfNptyiMJf/40M3z3bZ2sogaM5F5BoZTNT0wr3R2h5Ib5Bfvq
 7WERqvMgvEBiqs9L32xsixh8jWv0LfxzJDp71dOktPQkBFkLGOQ6uTcg4
 Vu8om4adsUd7udqfoRRsuuiHAc4qYolfz6jH07pLbel+y1g+1j4WLSSBm
 QsWtgGz4afdLggZC3lT3RMfnMDp4tLx61FqHN7UHEG4pLX2uba2hhlJuj Q==;
IronPort-SDR: CSNKNaAaqbzhX8eFaaegOHMEtBh+yOJ4UUiU7aXVUOycIseRnHEU+e07qbYGMtzE3CgUk/byoB
 XzWktjZt5S43CHIU4du1k0UGktQ1VItABAzeJpLqdB51/Mg6OHj2KUXJHOS8JKjQuQNt8fBTkq
 WkUcW+vXDwafZX6YE6Bh2Auk0sXgPpmQX4Uaq5uQuuBAY+QLj6ec+pq7fbTw+aw7JQTPtJkpHT
 9/NtGBO35wJo+4To9mLWIyn20UgzoNnHGN3DBRC1cZwcBrPydpYqbMvV15fzCb+ZdjXc2gTptz
 Zuw=
X-IronPort-AV: E=Sophos;i="5.81,306,1610434800"; d="scan'208";a="115320062"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Apr 2021 06:11:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 06:11:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 5 Apr 2021 06:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMTQ9t/2HOBHuWG6HNVnxf73V3riXimIzMXRBWjQ6h9Q/PD+Zl6RfZ59r/OD9dX6NSrbjbehU1s/2hUFrFSxArfTfirjHr3PsY5EYJs7YbY1ULpWv6Qax2T3FZJ0BjPmOfJBj1v5W5aN1BH+U0J+tgst3UZx6OWP8t4mexesVkTBbMOgEq7a1i716RY4imrx42bxNen/FCUHeoEuSHqsWpLwxOfUPs4OePagY1FIX7d6MWhbGja6vermHYYtWDmrE+rbqwMdX4HSHLMw0iv67b01qxWHFB/WMxAMQkXZtcZ/1qLPfPCG5C7CakSV1/k0iqi0wlNV6u1Seq5N2T02kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5CFAiTs4RVrOXw1u7PiwMZ/tjLo9CqprS5x5KEIX+Q=;
 b=G70qNSz4oexN6yTzKWykZ0vDA6Mlt0pN0JZ/Hplisb8ZDYacgE2JFlViyQd4/bKETNcyMV1GMSB72/Q4pvNOhukg93y28rr8EjylTUWeIN5nduyYVX9LBU5bBH11RmYc1C/U+H9XR1YdmmCPzwRC/R1zwdCymxNG3431BtBqM3TWIDLvM4WXYbjuKLB2K2P6GtQ/8M/HPllIm2tvddNKbXeDo44KMSlkqrAkVDK9bpSb6T16LEVddxel3ozOgmZbX38VuJ3+cYdLjEOb2CY7JEa3+Y0bQIcUBVRC+K8t8uIithyBSaVT4pyVw4F86T7U1jAXetf0iq4cABhZHo42/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5CFAiTs4RVrOXw1u7PiwMZ/tjLo9CqprS5x5KEIX+Q=;
 b=FXUIy6ECrQMOiko8CIOrze6AqLkZzpJlhpN2+4pSI9Yg4gd/a8b//rIH9dhSp5v1iCS65IUEOtW8DLhUrOLuPvWuzExQM8xuqGC9IkbHC6mt2Nh0L0jh6whvgFCBY0vHIlvJ9GbtV93LiXBmgkZBb3/mdGdPAbZalyrolyXowMk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Mon, 5 Apr
 2021 13:11:19 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 13:11:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
Thread-Topic: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
Thread-Index: AQHXKh0qsepR3n5rmUO9Y03pG1rHig==
Date: Mon, 5 Apr 2021 13:11:19 +0000
Message-ID: <e28e7cd3-9728-3428-1bae-9cda258174bc@microchip.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
In-Reply-To: <20210318092406.5340-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa0dc0da-1ee9-47a1-7530-08d8f8344d63
x-ms-traffictypediagnostic: SA2PR11MB4841:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4841D1886B628742E6A277F6F0779@SA2PR11MB4841.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /aD4glTCbqcHezO5Yw7aFhB5Ag1qqznTsG8Chod53QodUo4Yb4XIY8XHnl/piMnNCa9qzeFGm0x2pOLtOpYVVDfAnf/Ez/YcfZQF6JuatjC7Ufns1g6KRWQs1Rp+VNiVWdLKnLyCmIXUOvm6ibDVL91j8/Xmr7UtHF/Mm3DtWy9cLkI3YBag4B1YM4ScMo7GrRBcBq4TeiR873ep9jhLZaeqsWm5LTPeD5zjex4D+zdpsi4KeejJJNM+VI1IgNilSbt3MbUbYNe0kkaCiD2s/fZvnmKUMtlF9xzpZDF23iwzoEyPCiFvi+ScvqAQRrIbFoplSksUBJcuPMDPvn43H4l0SgOUg9iEFd+1MRA4Ibo0zPC2yO60HywgrTcwF8GPhOJw+Hx565UluIQdvMrKxanVOcaTHrdX1QOJ+e6fV/w7AJ2qn5pfB7Pg6zkm4D5ZztltoCW8ylDlfAaipEz7iQ0zkqQgv91GJcwuSa99LNGcdxDY0YfsDTX7M6fsvwp2HkXVYIav54Ghd7Iz0MlbN6N/wcHNA+G/6voam3ONg18oycpxs8gHHJqzW0I6lKthkB6uSL6p68I4Mgqag3ZUwlJXEi0TQ9RPWkl0a4YBJjtJWHcCT1AAZHxPyk7LcS22jNKMJqeqVzd2GcTVDVxniX9Kn7GqbD6LHHREawIskCFqibXTndPZAUxroUPGH8xa8f+64Ba2fMIrApAl5l99DoqgdPfHHsh41ZYBggV9V4k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(366004)(39860400002)(38100700001)(2906002)(54906003)(110136005)(26005)(8936002)(8676002)(2616005)(4326008)(316002)(6486002)(31686004)(76116006)(36756003)(53546011)(91956017)(6506007)(83380400001)(66556008)(64756008)(66446008)(478600001)(31696002)(66946007)(66476007)(71200400001)(5660300002)(6512007)(86362001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NDh4bHBlWGU1VGdHbFNxK21UMm5MNlhYa2w4SFhQajBNaGEya1dLK0RkMlBN?=
 =?utf-8?B?bVRFOVRTWmdlTzVNUnZ5UWJrY1NmYmZDcW9XakZiWXlTNUJPc3JwaExsWk55?=
 =?utf-8?B?S2FvcWtwUEltejAzMHZHd3RBbWtqRk1XTFphSkdDWVVkdENOUEVkU3piRHMy?=
 =?utf-8?B?VlB4bmpPdW9Bc0Z0OUEyL1NpVStBZG5oS2laVW5BaW5KWGp5OVdPb1Y3V0pu?=
 =?utf-8?B?QUVITy9IeEpWY2FrUXY2MjhXRGhRb091S0xXWU43Y2N6dlFjZkJvbVRNQkh6?=
 =?utf-8?B?UTdrM2IyZlE4bGdwVXZzOUFWdEVmNlhNOHdoelp0VTAvV1ZMNHhvRm9MeGli?=
 =?utf-8?B?T01YdnltUUN0QmRKU1RFMmViMU5yVWU0UnJuRjNrTURzN050ejUxVVN0UG9V?=
 =?utf-8?B?R05kU2RjS1ZyNHNRRGp5WHRHOHNVUWVLeEdzU1J1WnFEUC9jellKUnlWeXBC?=
 =?utf-8?B?b1B3SlpwTGtUYVZCbkdNaVRYU1haTFRLYTNsTmhIZ3lKM2dKNTRISjA0TmRD?=
 =?utf-8?B?SFBJUG9vOGdhT1Uzc3pGeFpTYU16Q0RYeXFid3EwK0hsUnd5c3FTS0pUZDZu?=
 =?utf-8?B?ckxVa2ROUW44VnYwdGFjbnRVU0oxUGIwWE9jUDlMcndPRnhDT1Q3cUVTTCsz?=
 =?utf-8?B?REsxUDMzSGZ2UHcyRk1hQTRBNGY0ZFRjRkxZMEJFcFFiQU5FT2Nta1JWTzhM?=
 =?utf-8?B?Wm1KS3VRTk96Y0FUVWJwZGZRNUF2eURtdExUSVQ0Z3l6OHNxUVZkVW82N2N6?=
 =?utf-8?B?S0Z1YjIrRFVGbUlTUnFlNkl3cjIwV2J0Ulh3a3hQSm95R1BIcWRvQVhqT2FE?=
 =?utf-8?B?ekZRa0FFenRyOElOYktQbmtNQmRRcTRVa3laNEZsTVRvNisvckVsRUFyV0F0?=
 =?utf-8?B?TlhqcCt0bXZmbE02cFlhY1V6eVlGRVE3N0tBay9vOEk5QzQ1SGdOcVZaU1NB?=
 =?utf-8?B?Zmdhbm9nRkNFVUdWUWcwMzRTVGVDVnhkRzBpWll4NFJpQUlWOFpXSDJLY2VY?=
 =?utf-8?B?TUU4MUZzVW5MNlAwRXBPeWNjOEZBaFNQYnB5bVhQQ2VNZS9BaEM3V1FCa0Uy?=
 =?utf-8?B?VzY3L0F1R0JyRXVqcitDSFE3SGx6RUg1b2hjUjZDc3FzK0xsQ0dTeUxCR200?=
 =?utf-8?B?Vml6RXpTWDdXUENVS3RFTDQ0aGdUMXdoT3NTdVhBYlVZV1dkTzM0RGgzTUY0?=
 =?utf-8?B?cVFXaEh1MDBmSkxzR3RNNHNqdmRnc2pnWVl4S3RBWU9abVZ2OG1jdGM1UXEw?=
 =?utf-8?B?dU04Z2ZodFlabG1BODI3ZGp0cFl1VWcvTWUxZVpSck9JUXJHT2JrNmdBT2Ew?=
 =?utf-8?B?VHNxdG5iSkJQSjNvRXgveFFiRFhkNUtkajdUMlhvVmpYRkNlZWlKYjQwRTJk?=
 =?utf-8?B?NWNvVVFMZFJBbWZPc0IwUmE3bGxsdFNmcDVWWWxTbG9RemdKSEU0QUhQNVpw?=
 =?utf-8?B?alRVeGFiUmsyQkliZnlkUVJRaTVad2Q2MVRrVTFSS2p0TzJkdXg5azcwbkNo?=
 =?utf-8?B?Uk80NVpWSzBqVjVqVUVlTkFZOXUwVFVmdXJMN0E2YnFsaWJxMUZqTUp2YnhF?=
 =?utf-8?B?SFNTdlljV1U5MGZmcjNxSDYrWm1QRGFaSlFsWFkrR1AveHF4bWtBRXFnUHB0?=
 =?utf-8?B?Q29OMENSdFR3YXdNRXVPWVNsVnpsZXFuUTBOM2E1ZU1oZDdWUGZKTzBRUkUv?=
 =?utf-8?B?Tys3cGUrVUJKQUZMZ2h6T0kwa2RJcjYwU1p4N3E4ZlcvOHpPTUNxbS9MY1F6?=
 =?utf-8?Q?UynUJTHOCqGYJVA/Ko=3D?=
Content-ID: <40E8581542BA8E43987077A24721F124@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0dc0da-1ee9-47a1-7530-08d8f8344d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 13:11:19.2619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzvVonprwas43O0g5ENTE/iGL6rhQqEU9l6F2O+eEZCAmE6yG/+Lw7zp9nmZCizFm8eLhsImaSp3955mg4tMBb2kfAcv1hwpDbxPH2HnZ1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_141125_850647_674B0A9F 
X-CRM114-Status: GOOD (  26.99  )
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

Hi,

On 3/18/21 11:24 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Due to possible mode switching to 8D-8D-8D, it might not be possible to
> read the SFDP after the initial probe. To be able to dump the SFDP via
> sysfs afterwards, make a complete copy of it.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.h  | 10 ++++++++
>  drivers/mtd/spi-nor/sfdp.c  | 49 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |  3 +++
>  3 files changed, 62 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..668f22011b1d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -407,6 +407,16 @@ struct spi_nor_manufacturer {
>         const struct spi_nor_fixups *fixups;
>  };
> 
> +/**
> + * struct sfdp - SFDP data
> + * @num_dwords: number of entries in the dwords array
> + * @dwords: array of double words of the SFDP data
> + */
> +struct sfdp {
> +       size_t  num_dwords;
> +       u32     *dwords;
> +};
> +
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
>  extern const struct spi_nor_manufacturer spi_nor_catalyst;
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 25142ec4737b..2b6c96e02532 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -16,6 +16,7 @@
>         (((p)->parameter_table_pointer[2] << 16) | \
>          ((p)->parameter_table_pointer[1] <<  8) | \
>          ((p)->parameter_table_pointer[0] <<  0))
> +#define SFDP_PARAM_HEADER_PARAM_LEN(p) ((p)->length * 4)
> 
>  #define SFDP_BFPT_ID           0xff00  /* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID     0xff81  /* Sector Map Table */
> @@ -1263,6 +1264,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>         struct sfdp_parameter_header *param_headers = NULL;
>         struct sfdp_header header;
>         struct device *dev = nor->dev;
> +       struct sfdp *sfdp;
> +       size_t sfdp_size;
>         size_t psize;
>         int i, err;
> 
> @@ -1285,6 +1288,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>             bfpt_header->major != SFDP_JESD216_MAJOR)
>                 return -EINVAL;
> 
> +       sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
> +                   SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
> +
>         /*
>          * Allocate memory then read all parameter headers with a single
>          * Read SFDP command. These parameter headers will actually be parsed
> @@ -1311,6 +1317,49 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>                 }
>         }
> 
> +       /*
> +        * Cache the complete SFDP data. It is not (easily) possible to fetch
> +        * SFDP after probe time and we need it for the sysfs access.
> +        */
> +       for (i = 0; i < header.nph; i++) {
> +               param_header = &param_headers[i];
> +               sfdp_size = max_t(size_t, sfdp_size,
> +                                 SFDP_PARAM_HEADER_PTP(param_header) +
> +                                 SFDP_PARAM_HEADER_PARAM_LEN(param_header));
> +       }

Michael, I like the idea of saving the SFDP data, but I think this can be
improved a little. For example, it is not mandatory for the tables to be
continuous in memory, there can be some gaps between BFPT and SMPT for example,
thus we can improve the memory allocation logic. Also, we can make the saved sfdp
data table-agnostic so that we don't duplicate the reads in parse_bfpt/smpt/4bait.
Are you willing to respin?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
