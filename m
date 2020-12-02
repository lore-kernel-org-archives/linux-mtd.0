Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266BDC64E7C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 11:15:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E1F20637
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 11:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E1F20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocpFJtFWIXhJyU308DaSAjnnQ050jlURlC+M7/lc0hQ=; b=HQEw1LapeH5UTcDgefQPR4TMw
	mD8jra6o563RZe/DjP2OxlyIxSvk4SO6+8uSOq3uS0+72m6ebyU0IL7DGkVYQtkuLYpeRqU8nsxZN
	0K1jMvnyMtJd2lLFuLILHqb4RxCNX+UF2Am+5lwhr4VSQSZES6kJT53eQwxd1jkzqky43ORxsk53u
	i8DgGGWVNSF5g91gIXBFd+Pvk/iz/lOS8WeI/8sNfOgEDJnThUfNfwNxal5uxy78XVArckD4wIhyE
	CqjtB1BRtQboYQIpZkLmspBzFWgG0ahtiwbDJK7DX3C112doW+9z0v+YtOZfjw54Cn/yGla8lJbHC
	UoPlksQKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkQ5l-0003Ab-PN; Wed, 02 Dec 2020 11:14:37 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkQ5i-00039K-OY
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 11:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606907674; x=1638443674;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xomkF2+x8epXR4zqwe6Kb3yJ1TfDeVIh16AfUfFvnQo=;
 b=AuxlOiwXqLjEkuGELfhFUmQzqHRxZAsonOHTAEosifSHLPTYQKRUj5+h
 SH4qgkKXf/hx8TUtQEEqU2+Gdg1xnBq0bbWqIX7NYzyE4lc5opGkFzf63
 1gBnijUjtkpM3n4wTJV+/CVx0HcDVMkBWukolOFfS9MO1Xj6aTBU84aqy
 MIOW2jSHSNAAzgJ7OGsfIZMRZyKpHzSybfOZR3R1n2v3VjWqrrsQU+yzY
 DDmnDsnjffP7kctmOENoDTDmh4TWu/Jvuw1pssk8Umtu3DyNIGYzA3MZi
 ZpqVXBA1+PjIl5LcpIOfVgmDUTWBHu4O9U2dRewdzwusDVJI0QePKrsxE g==;
IronPort-SDR: B4ukRfZ9dScu7cF3WoHRp0jkkTyeyWA8G1YEzd51d8Zh0KGh97TiVt9R1cZh19VdoltBb5tiiH
 0D90j9ffyH9bEyw4k9dupd+ThGvHd3CRafYKfvalc+RLks9KK3tY2XrrQG6RYgeI5H+ttWHxAC
 OZl5d7qMvvAjxp5wB7UKs9IUODtACAiqVWAv6/yLYNEeCjhWM5ZoKcmzDk6fXdf23ctZtF8VUu
 r4Hri+pv7n8HiFXl1F+bmzww9CpbDK6/KN/OoFhR5kZpWfUJDBVculwpehiFyPAK4OG4yt7tVC
 iH4=
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="105830478"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Dec 2020 04:14:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 2 Dec 2020 04:14:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 2 Dec 2020 04:14:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev5tHUtxRcNbzMphCBUpzxdV2NNZ9sUmr+Kw4YY67Ll7wkq4JWR1BUEn6Md96toQVC7FgYMTKCp7msO8wmzHtuUCf3ovuI8AKpS0Z1P6pfgd9xseorQuLovyDsAxIvHJHLbnUf7bSFPjoAP1MEf2rdosCOVSBzTHlHsTWSiMyJNRp72zmMuvDFZi/PSnujpiy0sxZHLh9r7XhFMPpN5wrNphDsJLoNgq06nL9++SMTyLPaHJUVtEKnwFOv+OQXfn9w/kycNtwCc41c4J3pQyM/ekLkypHuudmW9mz8bcIbcjEGm6xenryVw2Oeav4sA4EUm/C5ZWDsaIXhCD8k05nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xomkF2+x8epXR4zqwe6Kb3yJ1TfDeVIh16AfUfFvnQo=;
 b=FOjKvhzwR4n4Bv5j+Iez2Uu4Gumswl5AYPCs1rwPF9wOh0Ynn2sn+UhILY7+mvSek7nFqNlOXTSnC7RbQwFdlxZ9RoTEJ9fqTweN0P8gel+zD4ieaBI/xVOSl1I2XVlpSmROBgxsghupV7b8KEdpOA2+uqgk1/zDN0ZCF6PMUTMg2AwtSt9KDqHi4aKr+LzsCEt6U2kdaqqxn8hMxbYONJMjHPuVHwsyFDS+naQjMcy4I1/of3si0BMg6DYDJdqjZ4xkxQfsivLFF7d73XGM7o9ANkpduOWut6dDPLtLhh6EeFc7ykSj9pLB54aPxsUufwUfCHVMmAKw+Ew9PkoV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xomkF2+x8epXR4zqwe6Kb3yJ1TfDeVIh16AfUfFvnQo=;
 b=JrSEZZQ+Y5Tz5aYO8OSVZx8AoStQn9XZnEXUat4eflupC8nKQGWI/0xEG6dvZSvB2W42vAskk76n0E5TyttBdezL/W2UyQnxrBKa7M5+zFte3XJ0pjFMoTq0TYlfswfyToW6/zlBgTozyP8XmzMCZMsArFwANL9ke94Bhj/JbZY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3104.namprd11.prod.outlook.com (2603:10b6:805:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Wed, 2 Dec
 2020 11:14:31 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 11:14:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>, <masonccyang@mxic.com.tw>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add post bfpt fixup for
 mx25u51245g
Thread-Topic: [PATCH] mtd: spi-nor: macronix: Add post bfpt fixup for
 mx25u51245g
Thread-Index: AQHWyJxOYMvXY7tiskq9Gbw0cTWbPg==
Date: Wed, 2 Dec 2020 11:14:31 +0000
Message-ID: <303d9546-5a74-dc75-18bb-a00e38143b2d@microchip.com>
References: <1606881552-41659-1-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1606881552-41659-1-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aca87a7-d5fe-4b32-598b-08d896b370f8
x-ms-traffictypediagnostic: SN6PR11MB3104:
x-microsoft-antispam-prvs: <SN6PR11MB3104D841FCC1756BE008CB19F0F30@SN6PR11MB3104.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 994jZS/aumd797pLRaowDBSFJNqFw/Hz2vCMdA9lIBCfIlOebOUsnW5Du2uidB/mHMhhS+x4lRb3xMDSn2n5ttIS6it4ga7ErkVAjHGCpOv0QIJYhE1qgWpnYOSi0Nl+zmTvaLotml2/j12RvbcyikvmKH6yfUBdn6t/zY6Wg/POAYu0aNjgcU3sYm6oSy0WFgcFQTny7oylF6IfoVuT/8Eqtq1HZ7/QS2wy1CIzZTJIebSkpAkT0bD02Z/gY8eVk30b6lM6d1fPi+LzzaLjr18y/lXBfyR+RWspWySXIWSkAQBb4h4mIcbrAENh0FfzlFD8Ol60pzjvXH+H4B5MqQEDb9Ozm+5P2mv3D4W9k7xwlpIhlK/P0MHjgTFZ4aQLHDJYAc00wHZiO5bPdsvRXqwcquTKbyg8Gs2wwdxqHrY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(366004)(346002)(66446008)(76116006)(6486002)(66476007)(64756008)(8936002)(66556008)(8676002)(478600001)(36756003)(54906003)(66946007)(5660300002)(110136005)(2616005)(83380400001)(31696002)(186003)(316002)(4326008)(26005)(6512007)(86362001)(71200400001)(31686004)(2906002)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?amVCYmJuSWh0dHlMY0ptLy9peFlERUw0ZzdQTkJxL2c3VUxCK25WcUxSaURQ?=
 =?utf-8?B?cE9uR3dNbnY4R3dSUnV1NzZJVms3clFnazdrZnpJenlOYnFYMjIvZ2Zsb3B4?=
 =?utf-8?B?L0tvUllXd0RuK2d2MTZsN0k1a0NpS1d1ZHVwWnVJc29qaTBBQWR0SlFoQ3JR?=
 =?utf-8?B?Q0RUQ0k2QkEyMVBmTXZWemI1eHh2ODV4TXd6U25nNkRoZSt4UHo1UDRQamZt?=
 =?utf-8?B?aWVRdlZ4amd3cmh5b1RWd0c1TnhCQTZwdnA4L3dyb1J5WGJHazgvZTJhR2g2?=
 =?utf-8?B?bmJ2OTJvMWE0Z1FGODZaa0J5S1haOWtxd3JsYUxLN0o0dXRickZWRG81OTJv?=
 =?utf-8?B?RkU2ek01a2d0ZzhNM1hPY05IZGdmaTJ0VGhLR3piU2lFL1B3em9KazlLRlZF?=
 =?utf-8?B?NklRT3dFNTRnZG9iQkVSWk1JN3d5a1RsZVI2QUxNdVd6VzBKZHlsRmU5bmdE?=
 =?utf-8?B?S2Y3YWlUSG9zNWRFbWFSWHJKWTZ5c1RVbDlneWtDTHpHVjZ2YkxFWTE5dDU3?=
 =?utf-8?B?SnJROHN3KzJacGdZa1RjNTlnRnNBVjZrZ29JSHlWUGdhWFpBY3ZTSzR3OUFC?=
 =?utf-8?B?dHJCVU4rRk5LNlZ3ZlQyMGRKazI3T3pZZUkvTUNYd21vTHQ1U3AyUXJXa21B?=
 =?utf-8?B?d3cxb0cvM1krSnJKRlZJSWlTZXhUdTZlaWlrQ3lGR2pldzVPMVVFQTlWWW4y?=
 =?utf-8?B?azRxUlRMZHM2b3ljUFFZSlJuS21UQkFjS0U5M050QkZRUGtkcS81anZaVndV?=
 =?utf-8?B?cXdYa0FZdVZ3cDVvVllDR2MvV29Edms0OU4rZXdzTHdoVnRWMURWQ2pkYmdQ?=
 =?utf-8?B?T0VyTzVNdFZkb05UY1BGQXJ4cmFWS0hiTnZFNXBNZURmZzRad2o0NFE2QXhq?=
 =?utf-8?B?Y05HNEc1djEwdHB4a1NjMWJ0aGEzOXh5R1Q2bGh4c3lSUzJpbnplc3dlZE5M?=
 =?utf-8?B?R2lDZ1hmNDJPYkVHdDJDMGc4SUo4a1ZVeEppeFdxdERURkhnWnoxMFpRUjE4?=
 =?utf-8?B?TlhDa3Fqck1qWXpLRnBPWnFhQU5BQmNZVDRkZlQxK3NsZWx0SGUyYk9UeTc5?=
 =?utf-8?B?eVhIQTJVK3c0cmlYY1gyYzNDOC9RblpDTmhSL0NqNGpHRnpGWEJDRng4SVpv?=
 =?utf-8?B?dnZqYWJOZDRjekNyc2lSaVJ3cENWOTgvY1k5ZXhvczVhaERtMHAvc3NSejBm?=
 =?utf-8?B?dTFmSktxajFCeGowUVFKN2g4eEpYT0FoTUl2Uy9TSmI2MkRkZGlzb00zaG42?=
 =?utf-8?B?cGJwRkdoenNTams3ZUUvREdmWDBPS0ZjZEh4V1N3S0k5MVFzTXZ5NnZhaEdH?=
 =?utf-8?Q?z2Qrez82Rm3Y8=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E06A6D44D9E2FE40AADEA9500C981072@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aca87a7-d5fe-4b32-598b-08d896b370f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 11:14:31.0227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3SZ99R2ugcWfUjTGRlGASRHZF9Nr0qoH0bFNoXVay6N3aFfuaFC75FxP9FvlSZO3+syuxNkK5Pmjy1fIQiXayNX7g7V53XqA+Hc34MNA7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_061434_961924_33597D02 
X-CRM114-Status: GOOD (  25.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linuxarm@huawei.com, vigneshr@ti.com, prime.zeng@huawei.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/2/20 5:59 AM, Yicong Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The 64MB MX66U51235F's BFPT_WORD(1) declares
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 and it doesn't provide
> a 4BAIT table, so the address width will be set to
> 3-byte by default after parsing BFPT, which will make
> the upper memory region unusable.
> 
> As the MX66U51235F shares the same JEDEC ID with
> MX25U51245G and is identified to MX25U51245G, add a
> post bfpt fix hook to correct the address width in
> MX25U51245G's entry will solve this issue. It won't
> affect MX25U51245G which also use 4-byte address
> width and the address width will be valided when
> parsing its 4BAIT table.
> 

isn't this fixed by the following commit?

324f78dfb442 ("mtd: spi-nor: Fix address width on flash chips > 16MB")


> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 9203aba..2b9065c 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -33,6 +33,36 @@ static struct spi_nor_fixups mx25l25635_fixups = {
>         .post_bfpt = mx25l25635_post_bfpt_fixups,
>  };
> 
> +static int
> +mx66u51235f_post_bfpt_fixups(struct spi_nor *nor,
> +                           const struct sfdp_parameter_header *bfpt_header,
> +                           const struct sfdp_bfpt *bfpt,
> +                           struct spi_nor_flash_parameter *params)
> +{
> +       /*
> +        * The 64MB MX66U51235F's BFPT_WORD(1) declares
> +        * BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 and it doesn't provide
> +        * a 4BAIT table, so the address width will be set to
> +        * 3-byte by default after parsing BFPT,  which will make
> +        * the upper memory region unusable.
> +        *
> +        * As the MX66U51235F shares the same JEDEC ID with
> +        * MX25U51245G and is identified to MX25U51245G, add a
> +        * post bfpt fix hook to correct the address width in
> +        * MX25U51245G's entry will solve this issue. It won't
> +        * affect MX25U51245G which also use 4-byte address
> +        * width and the address width will be valided when
> +        * parsing its 4BAIT table.
> +        */
> +       nor->addr_width = 4;
> +
> +       return 0;
> +}
> +
> +static struct spi_nor_fixups mx66u51235f_fixups = {
> +       .post_bfpt = mx66u51235f_post_bfpt_fixups,
> +};
> +
>  static const struct flash_info macronix_parts[] = {
>         /* Macronix */
>         { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> @@ -68,7 +98,8 @@ static const struct flash_info macronix_parts[] = {
>                               SECT_4K | SPI_NOR_4B_OPCODES) },
>         { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
>                               SECT_4K | SPI_NOR_DUAL_READ |
> -                             SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +                             SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
> +               .fixups = &mx66u51235f_fixups },
>         { "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
>                               SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> --
> 2.8.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
