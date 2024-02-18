Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A7DC48BF8
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf5Vfpz4Ah9HwuqwuuYB1KGqrtwonVmES9KxlnAd630=; b=wh/CBzojAKWbYs
	4lcgjuX5Ed+EGuwCYksgt/29qFZ/5ON6y4wc0A5t8HBOQLvcKk2qXD2poDbClj6RkgysGnkXwFjjq
	NTXRjOW+S6sBIinNKPGFMZ+UWpC3rK+P6T9V7BqMVqW7MZdkF1NDgsst3MojguIfUX+iok8Y/Jb7L
	VU5cPaMKdnmfn18b+0khcgncZB9UfZ8qu01gdIvs0m8z9ZcZDyXvho859eQ1k5d79AOx8f3D5twWR
	USDAg8Fxlx4kKxqKM+ewmBFU7tG+06KVDJ96SWtDGUJHQgxv99gpFw4iPuE6ZwaZY5lyayjBP0x0Z
	Nk5gqqLwG2C/D/UKLEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbdbN-00000007PqO-07B1;
	Sun, 18 Feb 2024 09:36:49 +0000
Received: from mail-psaapc01on20713.outbound.protection.outlook.com ([2a01:111:f400:feae::713] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbdbI-00000007Ppg-0XMn;
	Sun, 18 Feb 2024 09:36:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOSpS+6Jo5ClWIRD8aL49bmYPYm1+MoB0dmOY5FPmLyV0A6CgYBiYp+P3FFN9dyVHVKLTMGgwTd8AOaXNctOKsqLOwunf062Z070TtCRNra1kd15JJvrCcfSPmy16xL5LDfL49OI3J2MfSi1xnrKD5/ugx+TsMMWc5DWDYuvjXTr2rwI+uAcgo8qxLItgiQD0lwkOPbCeentlPcL5aN7ENDj8Zp6W+3zaI7+IyxRpZZbGxuqvoEMFgsRN4z6qQcxsF33ENQnTlhM7omQTA5qIQ2ICgQxvrDdskXo+BpmxXEohmVnBL/X2ZeXoEpTKbtMjfuXi5bUqMpet/SuZakvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQkUePhmb/HQzPqsHlPKfiYkR8j30LAExlpH4TYuwL8=;
 b=mdA+rVRRbh+Fc0t+ZOA9Hsc812Y9pyvpomuLF1nQxpJJpOln3U5QNxTLqCbv8Bed+qcuh3cpVCoOXFPN3Sow8QJEH7kSNSG2LyyYLCA9pbfDLr1JMFII1eTrkXfcL8Hljt6WAVmvKMIL99MS2VypVG9eZA1NwClhSf2XF7fFh3BvEs7naTSKCQy/YWy9rfGHfHKwNiGYgPJi9RHtTIyj7frQoLML+kDLc8gk4nNvu826BcCxUPtpQetyG5yLMejQXdgEmCqSvIqv2SQa8p5Z5/D7v3uuJh2EXSGzqAK5a2eC45ikJ8RQz74j9D4uQiqOIDoZrMegBdlOXBhX4mw/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQkUePhmb/HQzPqsHlPKfiYkR8j30LAExlpH4TYuwL8=;
 b=DRqk9knw05OohoTyhLqp2KhhgGotz2fb+UHUnzyfCCzEFmkTy/3CkAU1pqTaNVsYZTM4knif0PAyounVJl1lszEkREb6MWQCQNpjJDhpEkSc4UuFLKOtYIFOwId7FO2D6HEIPIviOYVspqOrhg18TFaRiy/4rX1nmyrIIGKt8kccM2vLxlg3UhJPo6h3omtAGYjW2rFIwMkY1Cc6u4pEAAndKVWRO7JaYbjIkn0LjNyesRVF1/KohCAz8FnG5DfzBHjKRl2dLbkRJAqEfbv7TblvrkaBriimjjMoWAVYpVQMkGxhMM9R9pLKQ1EJHGv7ZuadT+vwZ2vNGlsArT9OSQ==
Received: from KL1PR06MB6652.apcprd06.prod.outlook.com (2603:1096:820:f9::5)
 by KL1PR0601MB3971.apcprd06.prod.outlook.com (2603:1096:820:21::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Sun, 18 Feb
 2024 09:36:27 +0000
Received: from KL1PR06MB6652.apcprd06.prod.outlook.com
 ([fe80::cd2c:f551:eb64:44ae]) by KL1PR06MB6652.apcprd06.prod.outlook.com
 ([fe80::cd2c:f551:eb64:44ae%3]) with mapi id 15.20.7292.033; Sun, 18 Feb 2024
 09:36:27 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
CC: Manojkiran Eda <manojkiran.eda@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Patrick Rudolph
	<patrick.rudolph@9elements.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "zev@bewilderbeest.net" <zev@bewilderbeest.net>
Subject: =?utf-8?B?UkU6IOWbnuimhjogW1BBVENIXSBBZGQgZVNQSSBkZXZpY2UgZHJpdmVyIChm?=
 =?utf-8?Q?lash_channel)?=
Thread-Topic: =?utf-8?B?5Zue6KaGOiBbUEFUQ0hdIEFkZCBlU1BJIGRldmljZSBkcml2ZXIgKGZsYXNo?=
 =?utf-8?Q?_channel)?=
Thread-Index: AQHaXooDcj/dRKED5EijCru7OZnLmbEJqwsogAB/zICAAHchIIABBVwAgAQgEJA=
Date: Sun, 18 Feb 2024 09:36:27 +0000
Message-ID: <KL1PR06MB6652F1A2D8652B727D5F581A91522@KL1PR06MB6652.apcprd06.prod.outlook.com>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
 <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
 <20240214-yoyo-platinum-dcd0e7e16a22@spud>
 <TYZPR06MB6640F82C539F0B17BCDCC55E914D2@TYZPR06MB6640.apcprd06.prod.outlook.com>
 <20240215-probable-gimmick-83d5dcbc4729@spud>
In-Reply-To: <20240215-probable-gimmick-83d5dcbc4729@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6652:EE_|KL1PR0601MB3971:EE_
x-ms-office365-filtering-correlation-id: 4bd73df6-c209-4058-96de-08dc3065148d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BERrzqTCq7F1ITfixUkKdshswwbLysJbVL5ZHUSI/BjgO3nLRixIAabddhJ7zG5hMdDmgl9r2zJCZ0s5AyhqAmVB0s5eGTWW70I/pXqg2dAeHsP5HOBIJsYX2GknumZjMvLQtCPVy65CO5wP6yjP45ZDdaU6JxsKXl3zw+hJQXOlGUZTSwNTvz3tA9V+jNJvrQUMqkA1xba9aLSWhK8eTEzRQaJ8i30gghijLmOtOkT+YzIx7BveyCfVPw2avj+0fXbUB3AY8xx+JOEOstWwDTz6RWg/DzJ7UWztcrhMY1Aeqg9VY7+g7OCw0rB8u7Anag9UTiYI1lJ+dkV2IEosCTmRM2b0andunndLew94ukrRQnkxjbrFT8ALm+PPpdeurp86bwfWGVkUUKqjtNqxLYLWyVZBVPG75gOKHLiAPTPubZo5ZWba48QkZUyYOJVpKX9Dvwmd8qXO/FlBWSeqZ4Zud+VM1dNl18pnfhinwd3YyEX0bl1nmjmd+QkmV7eKRgElCmhEfOuHT29jyOcr/4CJ5qS0dztFQN23pif1wHV9f7T0DUuz8xWUn2WfZBbUWs4KmUIRnWeRHQgri+7dtaWYksuUXTe3W/w4a1agM0xixPJeyz/4VAYiXlHavK10
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6652.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4326008)(52536014)(8936002)(2906002)(7416002)(5660300002)(33656002)(83380400001)(26005)(86362001)(38100700002)(76116006)(122000001)(66946007)(6916009)(66446008)(64756008)(54906003)(66556008)(66476007)(316002)(71200400001)(38070700009)(224303003)(9686003)(6506007)(7696005)(478600001)(55016003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUcwZ1JnQWw1NFVHQ2U4TGRXS25TdUNYVmQrSzgzN0NXNVFyajE2c1B3a1RN?=
 =?utf-8?B?ZUNQd3JyNmhFSWpiZjlzSUdYdi9Jak4vZjB3M003bXRTanlRQnVNczR4TStU?=
 =?utf-8?B?d29DclFVK3AzNUtnb21kTkRyeHhoWFFaM0RHT3hvWWpZMWg1Rm9EYVlqUXI1?=
 =?utf-8?B?TDhoekZHWHQ0UGJHVXB4Qk5Ka0pTekVVZTZuOUo0K29YMW1lL0szdXhtb2Z1?=
 =?utf-8?B?VHFsRmVpU2hySGZFOXYrQUhocW1OanpteFlqaDdXQ3Y5SWRmcVJHSmh1bnhQ?=
 =?utf-8?B?MXpBQmROTG5HZm1kNzQ0THRBZjhxZlF2NGlCb0tNdDkvV3pzemdTNXcyVm5J?=
 =?utf-8?B?Sm9aQXVhbzBaakY5S2FqRTZZR1lsNG1RK2lma085S0ZWNmlBTFZqN2Z6OVAv?=
 =?utf-8?B?WjhtTi9QZURHUmY4N1FDa2g2Nng4VzMxWUZqbk9Xek1TdklTNEFGVTVHNVBQ?=
 =?utf-8?B?S3BsbFk4cFBPdGNWc2xta1VscG5HVG80N1V1bXNxa0RUOWtlam5QWE9sRE5l?=
 =?utf-8?B?T0ZrNWN6Q3RsM3JoR01Td2VkclhjU1hqV3JJL25iMEZXMTAvTm1tSkp2d3pM?=
 =?utf-8?B?cGl0N2x3U01kM0V2d3NhMHZkN1hFVSs5TWdGcXF0SWQrc3dUcDUwU1pMODBy?=
 =?utf-8?B?UmNwSGlHeVN3SWM2Vlc3M2FDSHA4eXlQUW1vVGVZOXQ1N1lleHFJL2I5bUhw?=
 =?utf-8?B?Z0Q2UXh0K1ZGLzVLcTF4WjVPT1NTbGV2cXJBYm5TSWhZQndNZzV4bXVKWUhG?=
 =?utf-8?B?cFNPWkp2VFI1MnY0ckpYbGtqbWRENExycFcxdW9ZcktvK0NZTXJ6WDZrUGFF?=
 =?utf-8?B?R1g1bFBjNHlNRWVVUHVUc0UrbU9hUktiKy9VejdUVTB6SGhuRG9zMjl0Yk9F?=
 =?utf-8?B?Q2hHVFU1TzJiaUVNL0FXR0lkdDIzODNJbkhFeXIvT2htUlNONGdCUlBiQmsw?=
 =?utf-8?B?aE14MzUyY0cwNHR5L1NZcmpyUDhYQStVbHF4aXRTZHZHTGhHZnFPNGMrQkd5?=
 =?utf-8?B?V2c2SnBNZld6ZFlWUkpFcURRNEFVTjJvUVNRbEpscW9laUVHUUpqQzRoaytn?=
 =?utf-8?B?eW1IRXRORk15T1JnbmFCMXE3N1VzSitYZDlVNUZNbVNFcE9GdGV4TUUvbFE0?=
 =?utf-8?B?UEorRDMrMmVxVXVsNE8xY0NkZ3VkdlBFWEplaHZCV3Zwb1lrUENXKzN1RnVs?=
 =?utf-8?B?THp0dk1OdFVCT201REtaRzlJUXA5cG5zcTk2YjRMeTlpUXEyRTlrYmxYeWZ0?=
 =?utf-8?B?WXZGRGJXN3BTZUZCaUl3eWF0YWx3K3FmWDUwZlNGV21iZkVXZml2Qk1qUVFq?=
 =?utf-8?B?ajhqWnRPSVhsbE1QeHViTS9RejB4bU1RcFgxRnFHMTBuNzRCQnZ0c3VSR0V6?=
 =?utf-8?B?YzdLelNUeHlacTRZMEZWdVhNaWp2M3Z5Y0J6MFZWWWZCNi91S0luWXE4T01H?=
 =?utf-8?B?V0MxeHAyTVQyUzUyU0hMQTVnZmk1ZVk3VkdxTm85THhOeXlEUkhpaytEUUZn?=
 =?utf-8?B?Z1FCT0t4YmpiY2w3SjBCbHNURE9SdWxuVEdJYWtOR0NMMWo1ZDJVTWVyVldN?=
 =?utf-8?B?UVo2WGdlSHBLU1dUa2JaNE8rMy9GaEMvSHdlSDBQK3k5ampUVW01MC82c2Fn?=
 =?utf-8?B?c1NUZmZJejRrZ0lUWUEyZTNlWGQ0eXRrMEVUaEpyTTE0NTFuR1ZWNmloYlpQ?=
 =?utf-8?B?cUl6MVVWWlMybG92ZlU2ZzJUdjVubStLNFJySUsrR0ZtZWxiQUYwSjVlYjA4?=
 =?utf-8?B?ZjFIVktiVHZUNm1KQ2U4R2V5SnQvUUNIS1lmbnZKWVhYaDFVK3N6TWRJVkli?=
 =?utf-8?B?WWtzVG90UkVGVVlUb1F5RW16ZmhqVEVqMTZ0NlRwbWlibk9Pc0x0VWRYRklm?=
 =?utf-8?B?dWJxb3NMMGN6UHVwNVF5VzFuOEJ0Qmt0ZUEzZGk3VnZ2S0Q5ZWYyL0tMVDFl?=
 =?utf-8?B?YmlvMXRKenVQaURjcHF4TjVxM1dqaGFtMEU3R21YdnhqN3RCUVNHcGo1Rk1w?=
 =?utf-8?B?VEdNRVcyZThzbEJ2K0ppcEJ1ekE1ZXg0d2VDRWpRRERFVUM3YlhhN2R1UG1o?=
 =?utf-8?B?ZUtMNlJwWUx0TnJsVWJ4MkxvRWw3c081ckdyMG85MXNoMFY2ZVU1QzIwKzdH?=
 =?utf-8?B?ancrWjJVK1FZY3VBaUZFcnloOTEySElOVDN2dFdvT2VJMmVVeGxMcWpFampt?=
 =?utf-8?B?c2c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6652.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd73df6-c209-4058-96de-08dc3065148d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2024 09:36:27.3994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLd3THHcxBOfj17qbg7GiW1+h+Dcaky9YeSSMpYBY9EDrQpkvj6jWVksemWQANhIburyGHrovwbzlfogD5SBzG0Gi4/BDGs9HNg5IyoNCCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_013645_286050_9FF8F3BE 
X-CRM114-Status: GOOD (  25.07  )
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

> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, February 16, 2024 1:13 AM
> 
> On Thu, Feb 15, 2024 at 01:56:00AM +0000, ChiaWei Wang wrote:
> > >
> > > On Wed, Feb 14, 2024 at 11:34:31AM +0000, ChiaWei Wang wrote:
> > > > We appreciate that you are willing to help on the open source
> contribution.
> > > > However, please co-work with Aspeed before submitting drivers of
> > > > Aspeed
> > > HW.
> > > > Otherwise, a misleading driver on the community are going to bring
> > > > tons of
> > > customer issues to Aspeed.
> > >
> > > It may not apply in this particular case as Aspeed did write the
> > > original driver and it is polite to work with previous authors when
> > > respinning a patchset, but in general there is no need to work with
> > > a hardware vendor before writing drivers for their hardware.
> > >
> > > Blocking a driver because that company might receive more support
> > > requests is not the kernel's problem.
> >
> > I agree with that and Aspeed will not refuse to support.
> >
> > However, in this case, the authors, IBM, and Aspeed already have discussion
> (at least 4 times) before and foresee "issues" on practical eSPI SAFS use.
> > If there is already a known issue of the driver, why ignoring the previous
> discussion and push it?
> > A compromise is to ask for driver renaming to espi-mafs to avoid confusion.
> > Otherwise we need to explain, again, why the driver does not fulfill the SAFS
> expectation.
> 
> To be clear, in case you misunderstood, I was making a general point and not
> about this particular patchset.

Thanks for the clarification and I understand your point.

Most Aspeed-related drivers are from the Aspeed SDK.
And we keep revising the SDK based on our customers' feedback and issues reported.
We only wish that the version submitted to the community will not result in unnecessary misunderstanding and thus more customer issues.

Regards,
Chiawei
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
