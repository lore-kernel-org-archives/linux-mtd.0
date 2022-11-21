Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E42C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtilD4oNKAmYuyOy9ViN99/CEmgRsS67eyp5KGFPK20=; b=amvi7jee3ARwdL
	Wu81VoQ+CbF9zYqgP3XnZsD0aZ63E2e3Qm+wVKznji3up1qO4Qla+LQqXsbm3k9QSBEVzM+fAEV8h
	eEhhsUcU9XlkIIxzxdgFO1xYyrBRuPdF9LLVqD6q5ZL1ZY+4EDcPlHu7+u2kdWRCQnFBIaquqe9EF
	VNHvFnzO4LahPz9l//cWvDJNuBweZLHN34bCZ6dFVC6LZBVF/pt/reSLsT/aDhQwNhjlYUcPzNVRd
	ED4YfHFrRBJqLpSwaCfaBEnKZTNl4q6nFMbTs5NrENFkele1nMQTGT0JbQamL1C6Tcgn+oA7cir+1
	6QP5jVlfARQ/W8zGqYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7CV-00E6si-NG; Mon, 21 Nov 2022 13:51:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7CP-00E6ph-BK
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 13:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669038662; x=1700574662;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oD7jQSUn6iQTweDFGXJ3+xK0Slbw04eh0Yc42V08hMM=;
  b=oy4iSs1dGu6WZ8SLa5VkJ+aIXnBN3XoMFabD4R9PxbWBQcR0wewB4s7Z
   vmpF8axTilP7slLINpP2hSMeQmKG2CI8wKcwtYruF0To0X60P2uSpB4Rj
   cX6K0xJMzE91F2t7LEFmrzEH829CYRlsu8RjP/1gHBT/tqwZvZw5QyoV6
   kjZSwR91ZrhgENvfpyjAXvs0bmZ8o5Tu7T010UrH88cfkuuA0btGyIG+Z
   75soPma1s0pBYdYKYX6yDSpqgXjyPSULSH08dYdMDaR86jSqnCVWjTozt
   ms7C/sUH04rErbCQ/s740EYLXKU4KSTOy8Z0M/N9S1n7nf30kYQoO6VpC
   A==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184484810"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 06:51:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 06:50:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 06:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkkAhMeaUp2iRv6QhDqt59tDTNF2vXwjD4p8b+938HeRRWB4G+DfGGc0TTFzUODhJWp1WOpDkOG5tdSBf5228bex4dOUKgl+Guqn6zYI6RaxMLkRkh6j3uB5Abo0aUKJ1AnBs2fXX+2/l5EpB8lEKKH3j/nr6Em4p1nyTFS2QSARHLU51VQxH9DZmmZDCa2DF1YytB2gtgFrcvZY526CxnvjPqYcubW8/2m8ILH6NPu1CitY0QAsIADQe/TKf5wzfXX+EhEKWo6DUe3ud1kHTEwp60nuljyRnpqlRfFWYo7B1UhZxQOns0OHl1NunIFR+KQcAdkq6M41doD7Zzdomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD7jQSUn6iQTweDFGXJ3+xK0Slbw04eh0Yc42V08hMM=;
 b=eF24r6Joqm/FJB6aR9Nr7dBWYpM1AZhApUqr/M4gi5aFarse7zy6slNk0PLGqcBL/yImOCe1rxnuXci/8aZZccLPGzHwdqTLtBCWTupmNnRzRX9sWrvHPU/SG6SvndOh/KylwgO2WDUYqyr4oOqyjgN/1U5wlLsGeZwkuhOB0BJIVeYCoLAMkwxSwFe/UqZrPOzrb1GksjTA5CkDZ9aTd2su4zIS4SbD6UUGvQzNkkeYJToFV5nE9iHdkQURakWpV/rJ9RKytcxvyNYz94nzP5R0DiRdk5wfyPg9/BtBOP4Mba21TQ+YGqwlRt1OXj0gRuZpLGpCCzpalMKHaBBBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD7jQSUn6iQTweDFGXJ3+xK0Slbw04eh0Yc42V08hMM=;
 b=E1JpvxKW1Y3M77mxtkCVwahtDD3vNeCkp9WeiI9JD7nXMiRYCMhB0T9Ted8ZEx9S2rLWZjqZ415XGWR/o/dWGJIcb2tcTG035yrxdxMCVB8DYQa3OOS1DLYDVOWgEba0ncBEeX8svuWJ6yml2u/Fkcv3MToQWc6aX2RfBDCOxNI=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 13:50:50 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%5]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 13:50:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <potin.lai.pt@gmail.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<patrick@stwcx.xyz>, <potin.lai@quantatw.com>
Subject: Re: [RESEND PATCH v4 1/1] mtd: spi-nor: winbond: Add support for
 w25q01jvq
Thread-Topic: [RESEND PATCH v4 1/1] mtd: spi-nor: winbond: Add support for
 w25q01jvq
Thread-Index: AQHY/bBDkvNhDvCA9kGXcdF6je3OVQ==
Date: Mon, 21 Nov 2022 13:50:50 +0000
Message-ID: <4817515e-2833-6d39-03c3-30470344ac3a@microchip.com>
References: <20221111060530.2201084-1-potin.lai.pt@gmail.com>
In-Reply-To: <20221111060530.2201084-1-potin.lai.pt@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|SN7PR11MB7511:EE_
x-ms-office365-filtering-correlation-id: 919efef3-4b99-4010-974e-08dacbc76649
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TieCTqKyvGqwuyg0Xd8Hfm1qYQ6pn/XcEsom4yZYthiFIheEnUO0rzSHVNJN/xWVXDJYwmtsTXCVKyfOTVdSj7222wvpgQHhtqsmVs7QH48p9vYfgcfoNUmEchQyNEEshBMfVKqzo+TODjaaquA0axFN2xy0P2CZmsD4Z43KHMcqhbwxoQ3qhBdC7N7wvbFxi95+FaFCi9cjHv90anDJCmhWgUOMYcuM452hGbcUXg9x3FbKmVjo2aSMBFW/3okSGrfyPhEFq8hkVlpkrIAHjYtHwI/OOoUxi6ifZVaTd90DHrMX5KwJ4RpjVn6ik+byTZfdhHS4zijXj5qtJr/yqijYQHX9U6CThU7saHK+FhXRT/k+jNG+PR38JsI2lkJOFRtpsRvkRGr5tV7wz4pI4OVUBV01BUE4xIOGbalGBJm+85cUVV7ucQ0gUdN5e76lystp1QYyiS+680LabylKVtjBruskucFTD3zobDq/X9yv9s9TF8KFchJZ3VSnBegLJ2/DbUq2kkeZiHYlPGbChBwABvO1mZoZ5nwXJEIa6o4Lm5nEDcm48qJog/XAlNy7Bh472zTO8RHazWhzZhUIAHW+tM9cN56Kq4Z4hlV4kJ/7MnD++wf1xDN4gHK5v5tNWV4Pn7IuoRurcn2nKzIeRfLPXIb45XmpTJxvEmdZNFmLxHhLnH6gJ5UTRvbq/NorwiYZWeNhJEwDJ6FnK/4JSeZTk3TJcOC7q2+USYJhBc5UcdqE2H7Zp8JhleLAfnEm77fcc8CD1dlJLz8w0GxbaTSriCm8GsALXzIjShyyw8TWvufDwgMyCJjCTytyf7orMpM/EhfSRpOgBpGb774Pd+RSe3M9yWzO6Cylr0aTsi8vl5L/I2aiJJpw1Cefd9vj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(2906002)(316002)(53546011)(31686004)(122000001)(6512007)(26005)(6506007)(54906003)(110136005)(36756003)(86362001)(38100700002)(31696002)(7416002)(91956017)(66946007)(186003)(4326008)(8676002)(71200400001)(66476007)(66556008)(64756008)(66446008)(2616005)(8936002)(38070700005)(5660300002)(76116006)(6486002)(966005)(41300700001)(478600001)(138113003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDg2MUJZYlNxRVR2Nkltd1ZBZ0UvQ2JpOUpxd3U2djMyUmFpNGh4Nks1dlRl?=
 =?utf-8?B?UG4wVHJYVkFBMVBudHFkU29acVNVaWRWUE00eUFiRExIUmtDNHNWb216SWxY?=
 =?utf-8?B?QkxPVyttRjVhSFUvaWZGdGZ4bGJjODFUZmpCalZxNGZFV2d0U2RJSzl4ckNn?=
 =?utf-8?B?eEV3a2lRMWNoVjNmZ3NPRFNNSlpWVFJnYkpCVmpiNHhBU0RmbjZHRnpGdmQ0?=
 =?utf-8?B?Y1UvQURYOHZFRG5kMDl6OUVkRnVkSVV4QWFJOGJjdi8vSndFd2ZWaVoxOVJp?=
 =?utf-8?B?NlREc3A1TkhyTGh4dWxQa3hESDNmTkozbHRmalRHT2YxMEEzWHZPc3JETTRK?=
 =?utf-8?B?Y2xHQUlVb2wrMnBLQ1IxSDU2WG1QVFM4VGp0NjVRRzQwM0hmZDk2Z0cwWWZ5?=
 =?utf-8?B?SC9OUFlmWVNQRUc2UWxZUzVDV2ZNYjl2R0M5eElhbmtYY29NZFQyc3JyblJQ?=
 =?utf-8?B?OFV3NE51ekhKS1BQbXd2YjdZQkRvSjhjQXFaQTBkb0x5YVBRU3ZQd3M2cG1x?=
 =?utf-8?B?bXcvZEpzRk11M202dDZkK0hWYTdQQ1o1aGNIT2Fxbms2bkd5MzJ3YkpLYzBu?=
 =?utf-8?B?VFFSR2Q4d3pNck91ck14MnNjTkZ6ck5seEJOenhDTkJoSkVzWHpzeE1UVUwv?=
 =?utf-8?B?a29HZ1ExbmFZbmhSdnVhM0hOVjZqWGhhTEJ3bVNPbENPcnoyMU5RY3RqelJ6?=
 =?utf-8?B?c1pVOUFGUlF4SUhuRElmNWFxTTVpak9oZ2l6bFlLZWUwaGFWWm00NVkraFFQ?=
 =?utf-8?B?SXcvdkt1eVdYSTdES01sN1Zad2x4dEhibThiUkxIbWltWXphbER2UTU2cUUr?=
 =?utf-8?B?eTlTT0pVVkh2bnRWSkM3ZUFXbi96OHN2Yk91c2JTVDNrUjd4THVqeEV1eTJP?=
 =?utf-8?B?MUdPSXpJOFBWNlJWei9BTzdZTlZ5TGNkUEthNWdMeWY2SHhsNUhIdUxRZ1Er?=
 =?utf-8?B?WHRYcVV1YlpOZE5FRmphWEV1NC8wOExrS21jd2lVajN1UjJhdHRZQ05QbnJG?=
 =?utf-8?B?WXZkUWlwNUhLclZBTFJhZ2pEdVEyVDVGZUtoMHFFU2RVYVRuaW5tczNsdEZz?=
 =?utf-8?B?MXFITkIwQnB1bzliMzU0dmYxdVJzbFRNT0RyM2piSFBmMERRNHRvL1lsYm42?=
 =?utf-8?B?YnhTYThBcXpVeFE4bzlzWk1XYkJQQmFFWDJTL2RabmpvZ1NBSFZxVUJpV1p3?=
 =?utf-8?B?SFk5ekxwb2FCdmlETDdlbGZFRDlGem5oTmppd2lZcjlZU1BNclQ5RmQ4Z0dQ?=
 =?utf-8?B?aTY3bW9GaVQwemQzZmp1RlBhMEViR2xTRHQyaVhlOERSdkV1dDdyVjNUZHBQ?=
 =?utf-8?B?Uy91YlNiR3JVUlJqOVNwaEw2YkxSZXZRSGZkWjlJNDk4NUFBbGloYzhkbFdu?=
 =?utf-8?B?SlNVb2JGTGUrNksvaERlSEVVUnpxZ2toQ2FUTlpvT0pHUnhCTzIwUVlMLzY1?=
 =?utf-8?B?RWlPMmROVzFtZDE4aUVXbVRpZXBUYzNLZUF6NWtBd3NmM0RmSm92eHk1bTRS?=
 =?utf-8?B?SVZWR0QwcW40cnhQWllYRVhaRlNSbExPRFMzM2lxODNveUU2WStJVnZJUTVJ?=
 =?utf-8?B?NFRWM1Z1NkdZTVhPbVV6ei8xOGpkazVRQXJGY0VldDlGL0h2S2JpREcwYVEw?=
 =?utf-8?B?QmhCcGtmaEk3Zm50VlVIcUhzODN6UnpySUk2UmtBOUd6ODNBaDIwVUZVMnpF?=
 =?utf-8?B?ZmVHUWoxS3RaNk9UUmhhS0VqbHNFNHh2N3EwZ0Y1UFVkUHZaWUpWVnc5RXZh?=
 =?utf-8?B?bmFDSkl4WTFHZmZLSDRSMVk5REFNNkVSd0xTSWpPRkpPSG9yRCtXdFNNK2Fm?=
 =?utf-8?B?OE1sOFZzRVVkL3VGTFMrNzJtVE9LUVU5WnB4ajFGSHJPMkMvV25tMXF3cnR1?=
 =?utf-8?B?NENKTjBtb1hoNkYwbW01Yi9Qbm9PN0NBSzhQWWd3NVQzMkhCNHJwTzE0Sm9i?=
 =?utf-8?B?UitseWw4ODFwOUxpRkNVQlFYODJFR2hIaUU5aWltdFpJazhQRlJ3M2pGaTY5?=
 =?utf-8?B?SVl0ZC9IT1VWSFZpQ0QyL3lJTi9uTytzVldERTJqU1JBQUVXZmkxUzVKdVVO?=
 =?utf-8?B?bSthWXcwNXpIWTZ1bWVaK05GZTdxM1d0Vm1nZjNOajBmbVE0S2tUbGVDaHJH?=
 =?utf-8?B?N0J2U2lGZnRka2pSV2hicGE4akNmRHNFRUl2dnBwdHlXUzlYVllocENzbk53?=
 =?utf-8?B?YUE9PQ==?=
Content-ID: <DE850F057EEAF6489C7AA94E2FE29F3E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919efef3-4b99-4010-974e-08dacbc76649
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 13:50:50.1063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goaHA+ekDR1v/zDeXK9uhj2dwwS3G2wWueLV9D0Ob/hkHd/G7TZCNaYNaeYC5400pK2orJVa2oWW+3JHtV7/UF6w5oAQ0T1Uwqv7KhjG6H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_055101_503516_B4A08B41 
X-CRM114-Status: GOOD (  21.73  )
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

On 11/11/22 08:05, Potin Lai wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Potin Lai <potin.lai@quantatw.com>
> 
> Add support for winbond w25q01jvq chip
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> ---
> LINK: [v3] https://lore.kernel.org/all/20220222085148.21594-1-potin.lai@quantatw.com/
> LINK: [v2] https://lore.kernel.org/all/20220222064227.16724-1-potin.lai@quantatw.com/
> LINK: [v1] https://lore.kernel.org/all/20211224104522.24615-1-potin.lai@quantatw.com/
> 
> Changes v3 --> v4:
> - fix correct chip name "w25q01jvq"
> 
> root@bletchley:~# cat /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> ef4021
> root@bletchley:~# cat /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> winbond
> root@bletchley:~# cat /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> w25q01jvq
> root@bletchley:~# md5sum /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> a7b9dbf76e99a33db99e557b6676588a /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> root@bletchley:~# hexdump -C /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 00000000  53 46 44 50 06 01 01 ff  00 06 01 10 80 00 00 ff  |SFDP............|
> 00000010  84 00 01 02 d0 00 00 ff  03 00 01 02 f0 00 00 ff  |................|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> *
> 00000080  e5 20 fb ff ff ff ff 3f  44 eb 08 6b 08 3b 42 bb  |. .....?D..k.;B.|
> 00000090  fe ff ff ff ff ff 00 00  ff ff 40 eb 0c 20 0f 52  |..........@.. .R|
> 000000a0  10 d8 00 00 36 02 a6 00  82 ea 14 e2 e9 63 76 33  |....6........cv3|
> 000000b0  7a 75 7a 75 f7 a2 d5 5c  19 f7 4d ff e9 70 f9 a5  |zuzu...\..M..p..|
> 000000c0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 000000d0  ff 0a f0 ff 21 ff dc ff                           |....!...|
> 000000d8
> 
> Changes v2 --> v3:
> - move spi-nor flash information to comment area
> 
> Changes v1 --> v2:
> - rework patch to work with new flags
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index ffaa24055259..e60ad92c0ace 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -139,6 +139,8 @@ static const struct flash_info winbond_nor_parts[] = {
>         { "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> +       { "w25q01jvq", INFO(0xef4021, 0, 64 * 1024, 2048)
> +               PARSE_SFDP },
>  };
> 

Thanks all for sending and reviewing this patch. As this entry
uses just the PARSE_SFDP flag, without any specific flash/vendor
implementations, we could instead don't define an entry at all
and use the spi-nor-generic functionality introduced by Michael
at:
https://lore.kernel.org/linux-mtd/166903807811.85501.6803386075881922742.b4-ty@microchip.com/T/#t

I've applied Michael's patch set, please try the latest spi-nor/next
branch. We won't be adding new flash entries if the support for them
is solely based on SFDP, and will instead use the generic spi-nor-generic
driver introduced by Michael.

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
