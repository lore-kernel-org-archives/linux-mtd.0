Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BE0ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Sep 2022 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecWOKBHX6Gj/rrnn4WXymj9G3AOYnIO3UE1jmN8+9XM=; b=RlJFQGH+14NEEi
	LsPW4QbN8qhow9ACM3yVjBa5rqbZ30CJwFUAvUnF/Kbv0qo6MpBv8JvHS14j9zgA0CESkCYxSUHBk
	6zvsAVOKJgXb0U8P57qJ2zu8G8YHFFDZrXMMKH5mB1mpwOGnJOmRXfLtqip0NUlCbzINAbJIM3usH
	ILKD9GYhn4chAglusWwHJNXHXRWLsMr1NUV6/6sMHi/gjbw9sYIblKovaqS5iJH8buUuiJAIIMYk4
	mlelek6QgUNjGxzsSlPUsahJTnfe9UdXVox9G2LQESTU3ukoD6i7UvtK2XCYhmHFp3ElG1r93C+9S
	j/OMlLB6454b9P9NPnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXhEP-0097bF-TB; Mon, 12 Sep 2022 11:04:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXh8t-0094Ko-Fg; Mon, 12 Sep 2022 10:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662980299; x=1694516299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6i9AUKPA2YMN2lqzxqWFSr3OLv4X1T/YqIZVTnwggEE=;
  b=s6CKHV7jI9engikHRZ2zem52z1eHfjk9db/tL08tJf2T0aBBwEVI+yUJ
   V3ivuYja+VY6irgSQsLAxE5jJDynQc0CX+JhKqhNBG0JS7JI+ndEy1sJ2
   DOe4kp0FtpPYhTrtEmJAZilKF+m5gS5JtpgdulC+vVNslx6WTLV4smF+g
   urlfRZuN2Snffa+JOTaRlFG6hfYT2t3/p71ALZF50TEAGM/rU4RP0cZ4q
   egvTscUwdViAG6PXfLmYZ8JPUcuDoDkq5fKTvP8IuGIxz+0KXX9G31L4S
   i3grj8of0Igx3QWaPTWOaT8IKloh2yv++CJhAoAznJ+XVmZXLj5G9Rb+W
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="190423302"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Sep 2022 03:58:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 12 Sep 2022 03:58:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 12 Sep 2022 03:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx6Y016LYTQtoTUnlAaNXvolojkeNfB089kARf08lN54AAZTIAAs2zsTW2B4J7+3jK1j31NUk413YfNr/DhCTnED/ufQ6l6KToCyj2cvi3i6ujESCV9Kys3WI/GTGJl5kBCXpbkHR3Y997YgcHlOSr50V6tpOaQ0D+jM5DgdDiUIxX/P4x1FYyE8KumPqSC+YiNjC0hrJjfzIBBzpq4dsvDI3jyMnHxP0TXszFB/1UZDVXUKjoa3RhruXf/oG9bIPD/A9nljAkuz+vQ506QnZuoFN7iwH18nXh3dvV0dMPJw8ioWWWZeSHsd2l8Yslx9ArQRfswnzI2VSHIr6r4yAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i9AUKPA2YMN2lqzxqWFSr3OLv4X1T/YqIZVTnwggEE=;
 b=bpcJDjjg3bUCqfPq6H3013LukLPzdszecTkf1siOZSJbf6Hx8eEW+J+YFLi2nRlRJhrG++Iqc1AsbmI93t3TTLDMYDZmZjXdAf5/WODaClZLxluToKXldOG/TNcVbcdMBpb0LKhtStaPBwJ0DYyCW+SWqRFuvkvABSM/enyHraXQl7xbxEc2pzMzTUDJXkpZ0VzgX96rtkZN3/iEu4fx8/+WWPLUmZ0Uz97jkIvnjKz8T2WOHrdkYMbLr8Luwzw4RzXgPqJr4j2NrcqL3VeLIdA4YlHjJTmG+vEtYe6qzhXDBPSOUzBAfTfJ00FAi4GyQlY+/JkhOmqNfTGs5/p5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i9AUKPA2YMN2lqzxqWFSr3OLv4X1T/YqIZVTnwggEE=;
 b=S87M0S2EmlE09EhXhdVylodsGgtTzPl7YbmHxkR8gxyN8CesoOl3x3CSSiWQFQd68ECIJTjlZPZLeq+AnK+2nZeHi/GY9jQ1aiMIBJHRUrupWsn3A9ldv7yqVvi1GOsDZ8So+FJGBFW3hIy89wUrrza/MOrp0ZsHqjBuWlzmDKg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.14; Mon, 12 Sep 2022 10:58:11 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 10:58:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <patrice.chotard@foss.st.com>, <Sergiu.Moga@microchip.com>,
	<pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<Claudiu.Beznea@microchip.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <joel@jms.id.au>, <andrew@aj.id.au>, <kdasu.kdev@gmail.com>,
	<fancer.lancer@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
	<matthias.bgg@gmail.com>, <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
	<tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
	<benjaminfair@google.com>, <haibo.chen@nxp.com>, <yogeshgaur.83@gmail.com>,
	<heiko@sntech.de>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <michal.simek@xilinx.com>
CC: <bcm-kernel-feedback-list@broadcom.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Topic: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Index: AQHYxpaM18pKo/tQ3kmXPj7Epj0Q4g==
Date: Mon, 12 Sep 2022 10:58:10 +0000
Message-ID: <118c2b49-fefd-7de6-5b0f-9ae4064c7b56@microchip.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <2c44a497-b489-7519-e922-4ec79eb7617d@foss.st.com>
In-Reply-To: <2c44a497-b489-7519-e922-4ec79eb7617d@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|PH0PR11MB5080:EE_
x-ms-office365-filtering-correlation-id: 47d177f8-763e-48aa-50d0-08da94adaedb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qZy0nph4+h1VTFQ3sDjmj5Jd3DwG2dfGMun9eVvENtWVrgJkwS0XcH1wvWG3NdCXuoboZ1XHIT8jHIp1T7w/USUKdsEuh+cMqDzvGiX1oD2J75HTzMiS5eV1Za9wcknFKKYK//PhG0KaocwHORYsQgtN7o1XAPd4epclRHseLw03v5JFvNUb6SiMsQ70j9XDXG1P9pn0xayLYVjVh9k+1Qe44ktxInNVlDqfpjCIIQFEv+CmIKYC9BqYpmrZrwOshFIjBTGpuKUrCuWfXr7stEHdkzWLGcERWvepy9y3LAQAs/XaWtc48YHox47ADt7VDHphHzS1cAXBsy4MKOUY29LRFwrgthKtbWgVgsg8xwDTti7AVsiE37drcLkgW5M56dcUpjP2qlqGF0l95Z/8MjQuIis6jO3W+J+WMzNZV8LRix4V7adfouBWE3AzXKUOt6k9N5rjBUNqLSJKtXMkex7EWw3/N/3oWcxjTySkwxgUxgkRp7+3nAkV7EDMsTMf2TSgySS47KALN5B7FcJUJEehVvt2mBsKa6ZPyY+IeJDjh7y2spcdjGvDr55jZVS2pRaDFzLOI2VIJ5Pno0gzPaWlGUy4rMUjPw1rRoLdpm/RfosXYk0wRKxa1TxR2cK3En5Ika72/joql2jnLJXH/YRVAX+IPX12Poqs9Zt/XFhW4OFQWE6CWp3Isd4+e8PZSA3t8jOYJckdFPcubADVi9POumjrCcXedYrADE9t610CQTjrbChBItk9wWSHx4txG3+x+kbjdKrca74VKm5lIJSsT5ldD2EPunleVZMNocjMycSvsH4Jfe2p61ghuuuMyfU41VQFYbURs/YNdoYFw2yP17/eKa9DHM2yojj35lNLh5YG9k96hDSx1AiL8apU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(136003)(39860400002)(396003)(6506007)(186003)(7406005)(2616005)(4744005)(2906002)(5660300002)(8936002)(76116006)(91956017)(4326008)(7416002)(8676002)(64756008)(66446008)(66556008)(66476007)(66946007)(53546011)(86362001)(36756003)(31686004)(83380400001)(41300700001)(26005)(478600001)(6486002)(6512007)(38070700005)(122000001)(921005)(31696002)(110136005)(38100700002)(54906003)(71200400001)(316002)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTlqWlo2L0dJczk3OEZwRGRFRERVK0N2a0x0U2NNUjk4VVVMdEU1eVl1ejBm?=
 =?utf-8?B?NTNSV3M5M3hmbW5zcmxmMFd1RGtoc2pTTElyMjVmVllFMVYrcmVjUENRSDY3?=
 =?utf-8?B?d05UMCsyZGN4Nnc3c1V2T3orSXJSZE9WNk5KeHIvbVEvNlc4Ylg5LzZUT09y?=
 =?utf-8?B?anoxWHY2T2h1MU16Y3pUZnVEd3I5VW9JRkhDQXdhRUxxZzF6azl0dG9MSWdG?=
 =?utf-8?B?QjYrMFBIMENRWEJMQ3ROT3M1MGdzOVhXeHo4YUliR1JZa3Jwd1F0MlZXSHVG?=
 =?utf-8?B?VzRNallXRUZZM2VLRGlSbGNzb2VXeVpxWWRFbnJIMjBHL2xjYWs3S1YrZFFI?=
 =?utf-8?B?NWw1QUVpWnlRL20veVBhaVlMWWdSWFNJd0ZTRno1ZCtRZGw2U2RYVk1mSi9a?=
 =?utf-8?B?U0dwSTVYcit0Z09RMTVCZS8vbCtBMUdHMit3aEkvNFBUbmxwam1FcVNmOE05?=
 =?utf-8?B?dUlzekxWZjV0bEpQNUQrN2VERkg1NmpYamRVSTNHM0Vlc0lBQXZORGtvQ1gv?=
 =?utf-8?B?aEpuRDh6OWwxWVRYeGY0b09aUmhxSlAzVEJhaDVQUlBlV0NaNEJMdzVYeUlN?=
 =?utf-8?B?L3QvWC81bDJwQlQwMkVHMXNCaU1jWE5ra2tMcGpaZU1aWFV3OURKU3V3ay9W?=
 =?utf-8?B?ZDNOa3hGazlOdVdQU1RHNGpJS3I5WmtFYVBwWUxjdXdMRTNweUd1aTRVd0oz?=
 =?utf-8?B?Ny9iQXlxOWlHM1NORTl4VG5Va2w2V1kxQ2l1T3dQVzJFUjFMcmhGUStZdmZT?=
 =?utf-8?B?Z1ptdjZNUGlYTzA3cDlwVllKYS9WQnJ6WkFqMzNBVjVzN3VYZ0VqTndnUGhL?=
 =?utf-8?B?eHRMVXpaZTNCbCtjdWZpZHRsVWlET2V5bUlvZXovMDhYZmxrMTNUcE9ZTGFM?=
 =?utf-8?B?T253ZTZzMDZyTnNJNVIyVCtWeUtmMVVLU3ZIMVI1QlRuNGVvVndISXFLSDhZ?=
 =?utf-8?B?R29wM3E5TVRtbG10c0REcGg5MkVIQnM4ekYxcnhSaVRBMTk3M2ZJOWRKSElY?=
 =?utf-8?B?UzZVNkFlT1VCZVJ1Y1dSTHN1K3hNa2xpbW5QM0FoTnd6SGVLdU12M28zZCtV?=
 =?utf-8?B?cDdRTFBXTzd1MngwYjFuZHc0RjRsdG9xcFc3TmEybUFXNytsclBiMjhPMzhU?=
 =?utf-8?B?RkI5TlNvakZ4NTd0dksyWkRpMUVYaTZBcEFSZ0w2bHZJWXYvRGFXNTM3QUdw?=
 =?utf-8?B?R2diNm1TeDkxQmdHSGlpNXFDOSt6bjRWdkprWEhRTmlMY0o2WnZnanVFeWpj?=
 =?utf-8?B?NkdzR0NHdThkYUppb3FVOHlqOHlybmlWZEJzdVlFdm91UGswdkdRNFlJWTVN?=
 =?utf-8?B?TDhIUVVZY0p2Tk5BRWRicWdkd2pGc084dnkyOXhQZjl2bUVBS3F3NDZtNlhR?=
 =?utf-8?B?bm0zSTZTUjQrOTRrZUVZNmNrVk41cy9hZlRseHlXWm04ZW95US9lNjlZQUVF?=
 =?utf-8?B?Zm1UbWg2RS8yb1N5ZWRLMTlXcW02SEJKUTMwRVY0Yjl4SW9jNmx6NVJLbXc2?=
 =?utf-8?B?TWdpTGJMN1F3eHVmek9Ed3hRdnE3dFN2ODVkUGFOQ1FIbzkvcjdWVzZTMlJz?=
 =?utf-8?B?Szg4cVNTTzRSOEFVNlFKWndtbEdHTmp4NlVNT2NvZWhYVnZRcWFpQWFvdTRz?=
 =?utf-8?B?bkJXZy9LZEZlUTV3dTZ0cExiTCt5K1lPV0pESC9lbWI4MG8yTmZtSVcrQlhZ?=
 =?utf-8?B?VkkxTmMwdDVYalV0c2haSDVHV2NhT0l6QVVEeXlYZDF2VW5kQlNub2NKbFFG?=
 =?utf-8?B?NXhoMmJmOEFEYURRblU3dm5KWUhJd2NrM0k0SVprMXY2eDIzbEVsTkI4S2ZH?=
 =?utf-8?B?N3RpUEhrWjM2RGtGMUc5S1lYSGN2OHlsdjFsbW1XT0hpZG5KRzBxQ1JuQTFN?=
 =?utf-8?B?WEtycEo2RU9SK01YdzNrNWN0TzlzN1JQOGNpaUhXR2xtMThydGFzOHpjc0Vl?=
 =?utf-8?B?bGUxNUFCWHYzY0twRXJYWDl5WFJ2TmFuRkdUbmhRYTR6WmNWeFluQkZVMUp1?=
 =?utf-8?B?dWlQVzhFNU9XaW1URmJ0S2hFTWJLZVJ6WEJvVWlJOUZjK3hnTkRJU3ZudWxG?=
 =?utf-8?B?NERqTElLRGZpUEFjb1hVK0dvV3NoY1Y2UUtXRVB6SnpsejVrc2pQQ1VNQzlS?=
 =?utf-8?B?eWY5UzJzZTk2Tmp5S3psVFlaVXhOK29FQkkxWmNwSzhrci92Ull4cmRMWCtT?=
 =?utf-8?B?bVE9PQ==?=
Content-ID: <90D72D190F139044AF8A09245A5F770D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d177f8-763e-48aa-50d0-08da94adaedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 10:58:11.0052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0yP0EYs4nITEE1esTTwRa4SAcTZkPCACH9NLpk2vFVtzyMCWkm1P6WaJCqFbZ2fb32Q6327ggWOUWl7a/zGMt3r2cMOCyrwEHU8rqwke+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_035820_158063_FD8B3D2F 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

On 9/12/22 12:44, Patrice CHOTARD wrote:

Hi!

>> -             /* 2 bytes per clock cycle in DTR mode. */
>> -             op->dummy.nbytes *= 2;
>> -
> What is the benefit to remove dtr dummy.nbytes computation ? it leads to spray it in all drivers which support DTR.
> It was simpler to let the framework to deal with it, have i missed something ?

The majority of drivers from SPI need the number of cycles, not the number
of bytes. JESD216 refers to dummy ncycles as well, there's no such thing as
dummy nbytes. You'll notice that these drivers do the computation back to
ncycles in their driver, thus they undo what's prepared in SPI NOR. There
are just 4 drivers that use nbytes and rely on what's currently computed in
SPI NOR. Since these 4 drivers don't use the standard parameter and require
nbytes instead, they can do the conversion to nbytes in their driver.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
