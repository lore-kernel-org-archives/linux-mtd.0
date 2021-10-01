Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4CEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3DCA61A51
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3DCA61A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keT/pCwcBo0RVMhn+k0qoS6GI3yg97pnGhonaF60ZpA=; b=YR5b38/XxziM26
	zpm/McdMFQ916i3Xo5sX6wQuFlEcClg4PDiEtlXhzM9m2RnjaYf6wLWBCBGUruFBPoxJvyf9c0ZsS
	QNkDQOYbrcZ9nDAy5gbWF2rPDy8snLjRsxMTjT3p5kp5YWdfwJXwyUvahke8ydtfdiy5/+3odZbQl
	m7anp9D18Bd3VU01iQZo4+Rjc0M20nF8J3m8rXAaQzjcWvtXUSh14E5Q3SgAD/NWdwod//BEeC5/8
	DRIffoAj0kqqbqobS6IWk1AxiooSLZk3UoZHWwWl7Pf6cxF7L6HXKRBob707WREdwbR01WWtvxVQF
	T/f37mTEz0qkztUf/8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWEfH-00HBW9-7k; Fri, 01 Oct 2021 09:17:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWEfA-00HBUi-UH; Fri, 01 Oct 2021 09:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633079824; x=1664615824;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Evz+GfVv4EsEsBYUgXZZ50t3o8QhUWZT9M4mp5oRySs=;
 b=M+FVbz8BgkOp40wmYSv7Uzj8brpqypIVviRQCLTBoQ4E+dlaIfYnjN1+
 413+abotqkWZFEWMoPdAWTjvyw4jV4FVctUCx/6haNaoBtn1/sqBEYw1y
 Tx977Sexl0Dura15QCj8PXC3sQ7dIvaTNtNenxGzWrGXqEP+Jkwq7/KBu
 LUr3KtWIQE/NdKGlVE6QhjhLVb9boHd1m0cBwl3HeSQtgk33EoMNfC/49
 C1bdI24kt5zn029jEU2C9m6YSqQ4JYv6AL3PBJDLcDGQhhOylN5zkTLlw
 zwYd4msgXtOxL6TdUQSwzQ4AilMFJBKmmYzfutq90ykxuFoEJNBPjkcNT A==;
IronPort-SDR: pSx8anYNDB+uqeRfu3NjtSr1rZQKJgUPHjw8BJ+hD7L6jTZRUq2UTxnPYmOL717W+UHswh1Q5F
 NU5L2fLn6Nyphwunh0ooBHzD/neJWmY2UuKLI9RInRR/cvKP5HrgmzS8pgXH3MohhJKSx6zjM4
 HzQ020XwT2sr43QA08Plo4XqyF2IVrMeTB0eLIJbB8ByCp0YQsdhf2GnUcOsLZ00JsHTy3AiVW
 LSyl+GUPfU4GIjS1K5hD8/71An8LFKiJUfHt/7mNATLbtpprWamvlArP9Q/OTcG+0aIsoqT6vX
 +hBeES7i+N6y1CBUfCcjgpCJ
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="138689657"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 02:17:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 02:17:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 02:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXn/qZde3F5UIeJRYQMW3/Do0s7Y99jGI1Od3dIaRvdhcww31rn7Q2qktw1meqN+uVlec4BRDDK5k0of0oFYm5L6J1ISQVUXBIX06khexFpUSbCWPB1iBgZVI8vCYP52OUq/WiF/XM1zNibh+Jk5yPmHep6Gll7KMwDMt2k6SYwX6JS4TmJKTkn9iCejGrRsRVK741FrYpCkSRqQYPjZddVYFG0UFrgzExeLkm+Bxg183l0EMJOpUr7CXdJTMdkPPmgmNTQaPh2JgVy+5sUx6SkjLDaNz9uvupW08HWwF1dqXcirc3qHjHzsJ6E9iL/C6mUphO9GqxqhvJBV9Ah6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Evz+GfVv4EsEsBYUgXZZ50t3o8QhUWZT9M4mp5oRySs=;
 b=EgxvMgV39fFz0WS/YKePLsZjK+pa1pzZjX9CV14Y7C53nuXdNycXl9OydbwiRp42FldrMb7deMGT1Kx2QteODdyvLvr8wyrgoQX0VTbHaK+CGBnOrMCR0ld3G2vOxBdSy8lKpVyz2vnQgUYi9iLnaYVIL7w2L+UkALbyPJoy0XoYu5p+8gw6TTJ/goifYUZ56CfxqwvFuP+jGawSjpop257X9BWb0wxkM7To0VJ/Qx4T/UyRkemDsyxLw4Y4Q+sAClQ6mI5bmv8Yfcm1YFpW/eSOgQbVYEUrK6siKVYFK5MxDQjMfkGJBhrVt+axjtJnbCdJ8Aa+QVkecH/qQ2UERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Evz+GfVv4EsEsBYUgXZZ50t3o8QhUWZT9M4mp5oRySs=;
 b=mydVSC2jNV4wXzk+0yuSNNqnPGcjizoxKIRHbXqmH9mWWop29eP2vqmno0nOp2hTOJZX/mbsA+G78212EbAs5mLM/Rzv3EwpOJW+fYivFsWAQIXng+nLikuRr2wo/tUFatKRmJ1Vbmw7PBpLlBJqvgODMlYGDXI8WXSG5p/gCFc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Fri, 1 Oct
 2021 09:16:59 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 09:16:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Thread-Topic: [PATCH v2 05/35] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Thread-Index: AQHXtqUWm9E8rAgDnk2BIf71kqjibw==
Date: Fri, 1 Oct 2021 09:16:59 +0000
Message-ID: <022113f6-7cbf-8ddf-63ad-71f51ce3c0ef@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-6-tudor.ambarus@microchip.com>
 <fb581e64c1af72f30fdd10157e7275d4@walle.cc>
In-Reply-To: <fb581e64c1af72f30fdd10157e7275d4@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2bf5a41-93fe-4eed-f765-08d984bc390f
x-ms-traffictypediagnostic: SA0PR11MB4655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4655B18FE7C695C2351AF761F0AB9@SA0PR11MB4655.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jeJIxBuwkT7hR7FOGDDfqPavFY5hjXUHWEad+NsUQVMNYCOF3N72k8CzQOeGIsM2DCQWCz1+PBkQo76uyO7wzRlv4l+ahBHpbfkiQA0c22JA4kmuQ0IlUNP4G1QVX5i4wVyLMagRPRgiqhcb/cu4zRzOVcQv7px9D7H+E7QoDCxZPH3kvOblnRFKqwU22cSDvx34QjiUJPzDwzSM1n/CO+3wF10WJgz/KigM9BlBfe56q2J0SvB07jjyTR+wXhPsgZEVB85DNMzMIrkXWa56rlS2eKbiPxC1dJzioM4blJCjvhiBucsCcG7+EBJ4HJ5/wdXtdpbpvpouzmqFC7mNrgvXTo/G/Zl5fZIVoi3HWkoXgxCJWbjyzkWla/sFS3CabFr7lhVp1h5+NSZ90AjqrfqnJFHMjNdOA4UNywB7iSdKi/h2mOX0IEuGRRc+S1mzEdx5+TF/KxjQlucOoQP8OUrfVrV2p6dPSbJDhrf+z3Vz8naOYZmwuuK/bMRpgQ/J+jdC0r3ZyOVdMdiFVHwa0C+OnxtG2JXnDXfMnBpMRWFbfuaoo8lDxJCajbuWAqnaLTMzjES+8rAF59DUCQKjgC2ioSCZKNmiCwnqDlSL8C7GIVD0p6vUbd0r4VOszKN2X7aCo8fR5/iqtI9jqPN/p3NXk6UkyqXoGpM5rd8XcrGHuanjAvjfSWsIdGa0LCoWAgad9NpteiQheftPuLEkXhbiYSICgsRShgjJ423SgtoRTdrLh84Gcogu2UPVwvnySpFgLZX8q6BsuwOINzFUhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(6512007)(71200400001)(5660300002)(66946007)(91956017)(76116006)(38100700002)(83380400001)(31696002)(2906002)(31686004)(8676002)(8936002)(86362001)(64756008)(66556008)(66476007)(508600001)(122000001)(66446008)(316002)(6916009)(36756003)(38070700005)(107886003)(6506007)(186003)(26005)(54906003)(7416002)(2616005)(4326008)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SitwUWFYTFljRGl0UjJKY3VMT0xPWE8zdjlkQStla2JkTXg3dEtwdTdyUTh5?=
 =?utf-8?B?T3hyWDlmUFduZ2hJZVRRTXBQVzYzREtxN3BRV1VvMlZqWVRidFJHT2liQXdX?=
 =?utf-8?B?d3JHVitSdC8rNDFOMVErQmlPNlMyUE9LL1ExK1lBQ3M3TlVoYjFKMlRGbkZQ?=
 =?utf-8?B?TVJIRjlWMkZCVTFETFMzRWRYYWFTZi84N1VLQmVsZWZ1UTF3a2IxMEFGYTdU?=
 =?utf-8?B?RzlHU3NoYjl1Q3JxYnVkd2MxT0tBRDFTZjhlNGRaek9OVFdwZldVOGpyTnhU?=
 =?utf-8?B?Ym01L0U3ZmhDcFVBbmN2Q1ZhU3hleFg4SEtxZjBoOVo5WU9JMFdWTWlMdXZY?=
 =?utf-8?B?RDNWVzYrOC81RTRwRUl5R0RjcmRtcTJ0UEllaGtRbXJtSHV1dVhkN29KSVJV?=
 =?utf-8?B?VU1GMHVOcHJVeDRHbEdOaTZMQ293ejY5UzFYR1JXWnRYU0k1VDVkSHh1Mkww?=
 =?utf-8?B?bzY4TlZtbDdMdUhNNkdVcGc3eHBJTzVpWEZHWUpkUnoxajRxcG9CRzRMenow?=
 =?utf-8?B?TTE1MXpYdlU0VUN5bGZ4N1FIakRjMzNGaGN4UFdSNDdUc1IyV1J0U3paUzVw?=
 =?utf-8?B?ZkVrZC9IRWkrUnFyUjNJd1ZveGdZNWNtTDBwaFFHVWs0SHlMNW51alJaV245?=
 =?utf-8?B?ZHh6aW4vWUVlLzdiVXFRejVFblI5Q1hha3ZPQUFiWTg1cDJkQ3ZkL0JkSzFP?=
 =?utf-8?B?bTk3QU1iWjVQazQyNDdHd0s1YmNRVzJQSkcwNWk5aU5qanNwem1TRHNmeXBq?=
 =?utf-8?B?K3JLRllmcFJydDhueldWaTY4VFlDeDg1OHJXMDZCVU8vQ2VXTVd2QXVnZUpG?=
 =?utf-8?B?ZnVMSExqbzhTajY5cThIYWhyM1BocE5ickRvVldwR0owV3dmZVg2ZlpET3Zh?=
 =?utf-8?B?VGxxdmhSTmtuRWxWUWw4bE5HM3c0NVVQeU9mODczSVNYbVBiUlAxNUdKd0lL?=
 =?utf-8?B?M3EvQWtlMzgyeEdCRE5STVU2VkQveDBLWlpnL2MyVktSLzJnK2FYYjlHMnd6?=
 =?utf-8?B?aEdhYTRab2FMT1NXclRBcitTdE0wOG9yRC9BUmRCQkppbnlZOUtxWTVYVkZw?=
 =?utf-8?B?R3RVOU1JcTQ4L2NFOWJZRUxiOUxwK1N1blpnYkQwczQxaDVkL2IxT0hoNWZT?=
 =?utf-8?B?WEJid200WlVuRHdocnRvUWF3TVZYZVFnSmRxVEN1eEZ3NkNtNkJCY2gzdGNY?=
 =?utf-8?B?alZCVHk3Rms3TXBhQmJwSWE4cDRBVnYycHI3VUJJb3dWZjdtYXhHMCswbnZr?=
 =?utf-8?B?T1FRTUhWZzlnMzBrWmVUeHhtNUlNa3NzR3lVcWViOEo3TlljRG9td25veVhG?=
 =?utf-8?B?ZGo2Zkppc3N1bHg0QkZmUGI5dGllSDB4ZHpwVmdweTBHV2F3bnR1MVFYaSs4?=
 =?utf-8?B?VnBlZFZBOVkyZjVxQWRDQVVyd0E5RmtJaUdIazZhOTZScjFkV0pyT1FZNmlV?=
 =?utf-8?B?UGRpYjdiZXNYMzJLMTJTcmhvbGlSbUFPekFaTVU2VnRUM3crUE9xMVArZ1BH?=
 =?utf-8?B?TldVcTRpbThGWmlKZ2FORVdYcWJzL1EyVlplbzNESmIya1hyTU9jaVppbk45?=
 =?utf-8?B?ejJXSWYzUjhOc3Fiby96Y3lVazlKd280M08vTkFjcHZWNDFwSVVZdFJkaHdK?=
 =?utf-8?B?Nzd5aEhNUjYvYUwxK2FEY3pDUEIzZ2FZVHNKWVF3bDBVN3JYbk53WkhKZUFz?=
 =?utf-8?B?YTRadTZwTWZoMmlGemN1b01MaC8wYjB3WHR0RVVpaEQxaVRXQXhwM2cyMU5E?=
 =?utf-8?Q?1VGKMfUhgkwczQiV+Y=3D?=
Content-ID: <735A4EF8769A9640800AE1C0F8427F99@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bf5a41-93fe-4eed-f765-08d984bc390f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 09:16:59.5004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S9EpxJcfWD6dphJ2JcryoOgYIPs1JcdZyxXUPQclq/ATNae+Zjzc4rv/2q/xypv6HSqbj0lOrHzI9zuXT9RNf/2JCuL0Ql8CSFx2iLTJZBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_021705_121698_CB74494E 
X-CRM114-Status: GOOD (  22.75  )
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

T24gOC8yNC8yMSAxOjQ3IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjEtMDctMjcgMDY6NTEsIHNjaHJpZWIg
VHVkb3IgQW1iYXJ1czoNCj4+IFNvbWUgbWFudWZhY3R1cmVycyBjb21wbGV0ZWx5IGlnbm9yZSB0
aGUgbWFudWZhY3R1cmVyJ3MgaWRlbnRpZmljYXRpb24NCj4+IGNvZGUNCj4+IHN0YW5kYXJkIChK
RVAxMDYpIGFuZCBkbyBub3QgZGVmaW5lIHRoZSBtYW51ZmFjdHVyZXIgSUQgY29udGludWF0aW9u
DQo+PiBzY2hlbWUuIFRoaXMgd2lsbCByZXN1bHQgaW4gbWFudWZhY3R1cmVyIElEIGNvbGxpc2lv
bnMuDQo+Pg0KPj4gQW4gYW4gZXhhbXBsZSwgSkVQMTA2QkEgcmVxdWlyZXMgQm95YSB0aGF0IGl0
J3MgbWFudWZhY3R1cmVyIElEIHRvIGJlDQo+PiBwcmVjZWRlZCBieSA4IGNvbnRpbnVhdGlvbiBj
b2Rlcy4gQm95YSdzIGlkZW50aWZpY2F0aW9uIGNvZGUgbXVzdCBiZToNCj4+IDB4N2YsIDB4N2Ys
IDB4N2YsIDB4N2YsIDB4N2YsIDB4N2YsIDB4N2YsIDB4N2YsIDB4NjguIEJ1dCBCb3lhIGlnbm9y
ZXMNCj4+IHRoZQ0KPj4gY29udGludWF0aW9uIHNjaGVtZSBhbmQgaXRzIElEIGNvbGxpZGVzIHdp
dGggdGhlIG1hbnVmYWN0dXJlciBkZWZpbmVkDQo+PiBpbg0KPj4gYmFuayBvbmU6IENvbnZleCBD
b21wdXRlci4NCj4+DQo+PiBJbnRyb2R1Y2UgdGhlIG1hbnVmLWlkLWNvbGxpc2lvbnMgZHJpdmVy
IGluIG9yZGVyIHRvIGFkZHJlc3MgSUQNCj4+IGNvbGxpc2lvbnMNCj4+IGJldHdlZW4gbWFudWZh
Y3R1cmVycy4gZmxhc2hfaW5mbyBlbnRyaWVzIHdpbGwgYmUgYWRkZWQgaW4gYSBmaXJzdA0KPj4g
Y29tZSwNCj4+IGZpcnN0IHNlcnZlZCBtYW5uZXIuIERpZmZlcmVudGlhdGlvbiBiZXR3ZWVuIGZs
YXNoZXMgd2lsbCBiZSBkb25lIGF0DQo+PiBydW50aW1lIGlmIHBvc3NpYmxlLiBXaGVyZSBydW50
aW1lIGRpZmZlcmVudGlhdGlvbiBpcyBub3QgcG9zc2libGUsIG5ldw0KPj4gY29tcGF0aWJsZXMg
d2lsbCBiZSBpbnRyb2R1Y2VkLCBidXQgdGhpcyB3aWxsIGJlIGRvbmUgYXMgYSBsYXN0IHJlc29y
dC4NCj4+IEV2ZXJ5IG5ldyBmbGFzaCBhZGRpdGlvbiB0aGF0IGRlZmluZSB0aGUgU0ZEUCB0YWJs
ZXMsIHNob3VsZCBkdW1wIGl0cw0KPj4gU0ZEUA0KPj4gdGFibGVzIGluIHRoZSBwYXRjaCdzIGNv
bW1lbnQgc2VjdGlvbiBiZWxvdyB0aGUgLS0tIGxpbmUsIHNvIHRoYXQgd2UNCj4+IGNhbg0KPj4g
cmVmZXJlbmNlIGl0IGluIGNhc2Ugb2YgY29sbGlzaW9ucy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+
IMKgZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxICsNCj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+PiDCoGRyaXZlcnMvbXRkL3Nw
aS1ub3IvbWFudWYtaWQtY29sbGlzaW9ucy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gwqA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykNCj4+IMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbXRkL3NwaS1ub3IvbWFudWYtaWQtY29sbGlzaW9ucy5jDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvTWFrZWZpbGUNCj4+IGIvZHJpdmVycy9t
dGQvc3BpLW5vci9NYWtlZmlsZQ0KPj4gaW5kZXggNmI5MDRlNDM5MzcyLi40ODc2M2QxMGRhYWQg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlDQo+PiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlDQo+PiBAQCAtMSw2ICsxLDcgQEANCj4+IMKgIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4NCj4+IMKgc3BpLW5vci1vYmpzwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gY29yZS5vIHNmZHAubyBzd3AubyBvdHAu
byBzeXNmcy5vDQo+PiArc3BpLW5vci1vYmpzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKz0gbWFudWYtaWQtY29sbGlzaW9ucy5vDQo+PiDCoHNwaS1ub3Itb2Jqc8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IGF0bWVsLm8NCj4+IMKgc3BpLW5vci1vYmpzwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gY2F0YWx5c3Qubw0KPj4gwqBzcGktbm9yLW9i
anPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPSBlb24ubw0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMNCj4+IGluZGV4IDFhMjc4ZDMzYjAyZC4uZDMwYzhmMzUwZGMxIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5jDQo+PiBAQCAtMTgyOSw2ICsxODI5LDcgQEAgaW50IHNwaV9ub3Jfc3IyX2JpdDdfcXVh
ZF9lbmFibGUoc3RydWN0IHNwaV9ub3INCj4+ICpub3IpDQo+PiDCoH0NCj4+DQo+PiDCoHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgKm1hbnVmYWN0dXJlcnNbXSA9IHsN
Cj4+ICvCoMKgwqDCoCAmc3BpX25vcl9tYW51Zl9pZF9jb2xsaXNpb25zLA0KPiANCj4gSW50ZW50
aW9uYWxseSBhdCB0aGUgYmVnaW5uaW5nIG9mIGFsbCB0aGUgZmxhc2hlcz8gU28gdGhlc2UNCg0K
eWVzDQoNCj4gbWlnaHQgdGFrZSBwcmVjZWRlbmNlIG92ZXIgIm5vcm1hbCIgb25lcz8gU2hvdWxk
bid0IGl0IGJlDQoNCnllcw0KDQo+IHRoZSBvdGhlciB3YXkgYXJvdW5kPw0KDQpJdCBkb2Vzbid0
IHJlYWxseSBtYXR0ZXIsIGVpdGhlciB3YXkgd2Ugc2hvdWxkIGNvcnJlY3RseSBpZGVudGlmeSB0
aGUgZmxhc2guDQpJIHRob3VnaHQgb2YgcHV0dGluZyB0aGUgY29sbGlzaW9ucyBkcml2ZXIgZmly
c3QgZm9yIGJldHRlciB0ZXN0IGNvdmVyYWdlLg0KSW4gY2FzZSB3ZSBtaXNzIGEgY29sbGlzaW9u
IGJldHdlZW4gYSAoZnV0dXJlKSBlbnRyeSBmcm9tIHRoZSBtYW51ZmFjdHVyZXINCmNvbGxpc2lv
bnMgZHJpdmVyIGFuZCBvbmUgZnJvbSBhIGRlZGljYXRlZCBtYW51ZmFjdHVyZXIgZHJpdmVyLCB0
byBoaXQgdGhlDQpmbGFzaCBlbnRyeSBmcm9tIHRoZSBjb2xsaXNpb25zIGRyaXZlciwgd2hpY2gg
d2lsbCByZXBvcnQgYSB3cm9uZyBuYW1lIGZvcg0KdGhlIGZsYXNoIGluIHRoZSBkZWRpY2F0ZWQg
bWFudWZhY3R1cmVyIGRyaXZlci4gUGVvcGxlIHdpbGwgcmVwb3J0IHRoYXQNCnNvbWV0aGluZydz
IHdyb25nIGFuZCB3ZSBjYW4gZml4IHRoZSB0aGluZ3Mgc29vbmVyLg0KDQo+IA0KPj4gwqDCoMKg
wqDCoCAmc3BpX25vcl9hdG1lbCwNCj4+IMKgwqDCoMKgwqAgJnNwaV9ub3JfY2F0YWx5c3QsDQo+
PiDCoMKgwqDCoMKgICZzcGlfbm9yX2VvbiwNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuaCBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oDQo+PiBpbmRleCA1NWZj
ZWIwZWM4OTQuLmU5ODk2Y2Q2MDY5NSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5oDQo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaA0KPj4gQEAgLTQ3
Niw2ICs0NzYsNyBAQCBzdHJ1Y3Qgc2ZkcCB7DQo+PiDCoH07DQo+Pg0KPj4gwqAvKiBNYW51ZmFj
dHVyZXIgZHJpdmVycy4gKi8NCj4+ICtleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZh
Y3R1cmVyIHNwaV9ub3JfbWFudWZfaWRfY29sbGlzaW9uczsNCj4+IMKgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciBzcGlfbm9yX2F0bWVsOw0KPj4gwqBleHRlcm4gY29u
c3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3JfY2F0YWx5c3Q7DQo+PiDCoGV4
dGVybiBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9lb247DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYW51Zi1pZC1jb2xsaXNpb25zLmMNCj4+
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYW51Zi1pZC1jb2xsaXNpb25zLmMNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmJmN2RiYTM0ZjAxOA0KPj4gLS0t
IC9kZXYvbnVsbA0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYW51Zi1pZC1jb2xsaXNp
b25zLmMNCj4+IEBAIC0wLDAgKzEsMjIgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPj4gKy8qDQo+PiArICogVXNlZCB0byBoYW5kbGUgY29sbGlzaW9ucyBiZXR3
ZWVuIG1hbnVmYWN0dXJlcnMsIHdoZXJlDQo+PiBtYW51ZmFjdHVyZXJzIGFyZQ0KPj4gKyAqIGln
bm9yYW50IGVub3VnaCB0byBub3QgaW1wbGVtZW50IHRoZSBJRCBjb250aW51YXRpb24gc2NoZW1l
DQo+PiBkZXNjcmliZWQgaW4gdGhlDQo+PiArICogSkVQMTA2IEpFREVDIHN0YW5kYXJkLg0KPj4g
KyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRlIDxsaW51eC9tdGQvc3BpLW5vci5oPg0KPj4gKyNpbmNs
dWRlICJjb3JlLmgiDQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGlk
X2NvbGxpc2lvbl9wYXJ0c1tdID0gew0KPj4gK8KgwqDCoMKgIC8qIEJveWEgKi8NCj4+ICvCoMKg
wqDCoCB7ICJieTI1cTEyOGFzIiwgSU5GTygweDY4NDAxOCwgMCwgNjQgKiAxMDI0LCAyNTYsIFNQ
SV9OT1JfU0tJUF9TRkRQIHwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FV
QURfUkVBRCB8DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCKSB9LA0KPj4gK307DQo+
PiArDQo+PiArY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3JfbWFudWZf
aWRfY29sbGlzaW9ucyA9IHsNCj4+ICvCoMKgwqDCoCAubmFtZSA9ICJtYW51ZmFjdHVyZXIgSUQg
Y29sbGlzaW9ucyIsDQo+IA0KPiBtaGgsIHNvIHdlIGxvb3NlIHRoZSBtYW51ZmFjdHVyZXIgbmFt
ZS4gRG9oLiBDYW4gd2UgZG8gYmV0dGVyPw0KDQp5ZXMsIHdlIGNhbiBpbnRyb2R1Y2UgYSBjb25z
dCBjaGFyICptYW51ZmFjdHVyZXJfbmFtZSBpbiBzdHJ1Y3Qgc3BpX25vciBhbmQNCnVwZGF0ZSBp
dCB3aXRoIHRoZSBjb3JyZWN0IG1hbnVmYWN0dXJlciBuYW1lLiBXaWxsIGRvLg0KDQpjaGVlcnMs
DQp0YQ0KDQo+IA0KPiAtbWljaGFlbA0KPiANCj4+ICvCoMKgwqDCoCAucGFydHMgPSBpZF9jb2xs
aXNpb25fcGFydHMsDQo+PiArwqDCoMKgwqAgLm5wYXJ0cyA9IEFSUkFZX1NJWkUoaWRfY29sbGlz
aW9uX3BhcnRzKSwNCj4+ICt9Ow0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
