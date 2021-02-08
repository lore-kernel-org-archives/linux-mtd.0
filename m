Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F405BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 10:22:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DAA64E7D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DAA64E7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QXYQKc0Q0+5uVLyfCJ2IwS3I+nAEE5JlRZaBhUHTKzs=; b=RYBPYUhymuk3ZSyH4rEfbYenQ
	0V6zaCylwxeilFh6xJpDdYG7LTeLXaRQakXzHwXKAleWoJYRRATWrKDRaM0BnzmLygss2Fy1tjiMv
	VDn3wi4zE33MQdZRW8sz02yKYtFwV2OrDXmOxtm2X8rjiLzRm/RuFjEfcya8sHK12yKR2CAS2cWqR
	7cfNfyKH+FI7tOtZJtrAJBxV3ES7IyDsxtCLzde4zIjZaOXkUc+QW1qkWfApwPuiaMHqNaG4VFUJc
	dgKbAUQz+HZuBfdCH0m2nhLJuF9Lv6RAoaoV/KlKh+6czGZErfVqAhOhKSG6Ii7mZkPWiZM/LdJAO
	NprmdJT5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l93fU-0006LG-Up; Mon, 08 Feb 2021 10:21:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l93fS-0006Kl-Ni
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 10:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612779678; x=1644315678;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/Lt7k+85JujGHUWKqsPWiO45NlDwAb/F4uB6lNPjA8E=;
 b=BvcWo0DK113wYlHrzGWEZVQtpB60h8RGF3pNz2R5kLJBeVFEDw1LmE78
 MAf9Dfn16OUChzFNhWkBTWzSc03CRcZzI6JInwy5pKeOGPbdzAH6qEjc0
 mZCMcVUzQ/fKQk9EaMZew0Oj+vUyrBMfEpgTTVazUTTGCE8ms0jSE6DQA
 zKED625avSb11bR6LxU/W2Uy1sG1EihBzb7zqJiXufDmeVdv9hALe2DVB
 L6K/XrcDLxBhsH3au6xzdZQQ6INJ2dT9w82M86XKuLv4ZBWdCgyUnJify
 gJXTo10ABpouScWVAS9e585YT2xcgmTWkqLwC1y4iQ7gfXyiVPcCneRIv A==;
IronPort-SDR: FNP9k47U6UGDZsSVlAjqa1B9t3kYkusyCl6bVZDHZoFC4acGxdSaIzktjqy3wzm7ZgboXundog
 b/x3UJuzpf8qTKz0YLcZUpVYEJePktKOdccvp5IFrJhRuJ4BKMqhSYXq9+M46/qif35Yf7X8Ch
 ld44Jm2y6h9qe7HmDl1NFSHc0FHCPsSWCIaRugEHQK3eKEDd9gqSg2In7/xWShevItxvHTolQ3
 oN5RjfEebK7aCuBQbkbCUym7OvhTr8FsGoSChazvu9k9CE9q6hp9Ug76uy9MeVF/unEuq/Cd1Z
 0vI=
X-IronPort-AV: E=Sophos;i="5.81,161,1610434800"; d="scan'208";a="43320715"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Feb 2021 03:21:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 8 Feb 2021 03:21:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 8 Feb 2021 03:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNiHhXhWkWERJEtv5/8Vjlta47RQ+EtM9Jg1xBRbLmalIsRWXhxvQ7Iu1dXupAiQ0F2n6SQxaBLEmQ5bufGUu8Als1ncoc2Y9gWV1E79FvkGlq5sFHRa6pl5qza01grDk3tCY36ep4O7YvQp/jeTHEjn404SJEwrX6AYF3lSibx4+ylPc4tSxds7skreqRqiaSGElbohmP4gphhga/++uJHWo5jBmaEl5Mbj9qa8X5iFGgNQhKhvYuXYaRHkVuQCHxLR1v5oALUvoGL/4RfYD6tZD41cSpu2lfTexTVUdKjnObs/GOeyvYBbTsBdX7+qJdmD24cgpucct9RXBcW8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Lt7k+85JujGHUWKqsPWiO45NlDwAb/F4uB6lNPjA8E=;
 b=HvaLJCK9q9JxiADccCQtwlGxcICST5dE4fIkJfo2rF2KPhUzsdmLbm7wYykTM5mPuc0V8pxP6jpSI9CiQDt6basEsG/Gz/LOzBxAc7LCCmmXozlmQo5bW7ADkUiAqdaL6BHnl+32Lv7rx/XtqtvmqKrmQbcXVfKHBcHDQD1OTjlz+YXimj8lex2FWxlZTJM1mRh5DKNLlzHOwjbGi0/YETRRGAPHAh58noU79YBknt990KtdQ8/2pn1RlAYBQ3DOQFK/2AES5yznhckMelADC1wmX8FaV8PBuYYn4CZaHaJSyW6VqXZLwgtesFi3oX0CVuK1Cp8hRGYZjH6H1POQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Lt7k+85JujGHUWKqsPWiO45NlDwAb/F4uB6lNPjA8E=;
 b=LnaB48MQmVegIdn/M/kcvOQr03ztzHyAsKN8BdqMAfIC7cthl0TiwnU2u9SnQE13dju5kR+YQPl9PuFTX5r6GWIcUA5RbFS3eMieesNIcduKHpZK64euytEsWltxG2Ev790SeLX6jtRXDLkFCf0YTOYXxOpPqK9WdNVeja/nHYE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2624.namprd11.prod.outlook.com (2603:10b6:805:64::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 10:21:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 10:21:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <figgyc@figgyc.uk>
Subject: Re: [PATCH] mtd: spi-nor: boya: add support for boya by25q128as
Thread-Topic: [PATCH] mtd: spi-nor: boya: add support for boya by25q128as
Thread-Index: AQHW/gQfTsOspvLRpkm4wlN9KD9l4Q==
Date: Mon, 8 Feb 2021 10:21:13 +0000
Message-ID: <0c5b8a0c-7bd2-a15e-ee25-0adec9430e8a@microchip.com>
References: <20210207123032.516207-1-figgyc@figgyc.uk>
In-Reply-To: <20210207123032.516207-1-figgyc@figgyc.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: figgyc.uk; dkim=none (message not signed)
 header.d=none;figgyc.uk; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5df10a4-70ca-44e3-c484-08d8cc1b42e5
x-ms-traffictypediagnostic: SN6PR11MB2624:
x-microsoft-antispam-prvs: <SN6PR11MB2624C54F70B2C0C7D9197EF8F08F9@SN6PR11MB2624.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bGWNIqquZCiwoJBmJrDvBLCgGEMIMYxZVo9s/mAFO6N5WxH8hNkNSNUf8xCJ/tFkPV2AfHFzc37588ZWGvlQ7qvhS0Ey1lafP35Ub2UOOtwoyVA3IKGCwdFMdx0Iq8372SLnp/ivsS8kJFtb1t2E3TtYsBse/HVZX4+Q9AiXbcWpzZPBeQ0l1byxb6iAfahNGrY0eSbpPqUaaMxnkeiZO+926iFcHXADdMwMfL7/g8ng9NQNmyVjRv4s/tosVfOpBldONDNX30wcdOi3hQmeQ1tgrK8PtSJYdZ3Rsl03K/3Q1GMl4YGmg7KCxqFADGuYwPYf8s7Ebf0tGyh0rtUOZ9y4rmhKUXi7EbZkcD4SF7mXSZHbuPt/Bn7JHPx2D9q6zadfTqZK7Zye1BhS9uP1u4/fnp1v1cvjjK1xlEIyHqB1Wp2A6ckVngo7iApVNoPpmFtEvFMeJAguLJObNcWrt1SjktCgB4CHKAn6HugiFyhpPpEjBgvRiEpGf/EzIq2WAX7LI2RcPwVWtQdhMRehtkyDJ2fHlIJVjUD+pQPxnRwXnXxzugAoDfAimXR5CoBg0+Yuemcn1UaGnIiaFCL8Y2+ORRBWOm68TCqX7kc9IHtjcGVEZWqGw4K1KzLTSZABrZ2grl57b5270JbRh+hS+3BwN4m6ndnS1k8wC+vGO03zh/0WwFKcX6vVnebWWYrQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(396003)(346002)(376002)(6916009)(83380400001)(966005)(26005)(6512007)(6486002)(31686004)(6506007)(4326008)(53546011)(2906002)(478600001)(36756003)(8936002)(71200400001)(2616005)(86362001)(5660300002)(76116006)(91956017)(66946007)(66556008)(66446008)(64756008)(66476007)(316002)(186003)(54906003)(8676002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?d3NVTkJhWDkyNE51TjY5RnJzeDk2K0JJSFNoTnZNM3A2Qlp5YWYxMUtGV2N4?=
 =?utf-8?B?NlNEYzVZczd3SzdCeXlQcUV2ZlN0elBRRG5FWkVjV3gwZWpNL09Wb1BSME4v?=
 =?utf-8?B?NStYVWh3TGVjbCtadUNML0xteEd5MS9oM29CUzRYVXRZdXBsOWM0RFFEcmE1?=
 =?utf-8?B?VmVGYXdTaGJtVXhXeEprYU9wc3V3L2JzZERKQjZQSlY2TEZrcU0zWUlQVHZy?=
 =?utf-8?B?TjF1STBWdjBvUGVSVHV5V0F5T2wyNnhoM3pPMlVaNlUwRkt2eWgzN3QwWTgv?=
 =?utf-8?B?N3NNQi92ejNqK25Na0VLblVST3d4UVI1WUoxVTU4U3A0NEk2Q2kxcHNQWVVW?=
 =?utf-8?B?Tk5PanAvLzZGRHlFT1FHMDByQ1M2Zzl2ei9FeTZERnJPUTFiUE1WdUJud0Z2?=
 =?utf-8?B?YWdMdzdRM1p3VXdUUDgzNFdjK0h3ajMxOVlyTm1wYlhjNlhIWVlMWVdSRk5P?=
 =?utf-8?B?R0tmSmVGcXhNeGdMQWpuOXVQWE1IVHlUQUxDZm0vTXVUZVdpYS9CaFlaeXRj?=
 =?utf-8?B?QzZub2w5WnFDWk5veEJPVDM0S2FGdlpTL2tTcGhqYnhJZ1lrOHZ6b1Zhanpp?=
 =?utf-8?B?emF1aHlwSit6ampZRnJQQTY4UEE2S0JkdE9hQTIrT0htSjFqdGFrQlAvZVhq?=
 =?utf-8?B?R01MVDhxa29NYjFCQ1Z2ZTd4T2ZxOFlZdGNyanBZamI4aFp1dzJmWG5KZC9W?=
 =?utf-8?B?WG9qa1pWcmVYVktGZy8rOVpBQnVYczJQdzdjZTRXUDRVZ1E0NHZtTXJoa0Zy?=
 =?utf-8?B?NXpFNmJFVWZmSENnYWUyankvV0wvNzNPM0Z1VldDMC9lWmhaMSsvSGwzM1No?=
 =?utf-8?B?Z1hlbk1QakFSbzcraXVjL2w3b1Z5Q0Q1RFBrKzhNT2VmT25wV1lCVmpSOWwy?=
 =?utf-8?B?K2RiZFFMWHRIYTJiZWFRU0x3S3JMeEw3NjJWaWtBMmtTUk8yelQ4YU5PT2FI?=
 =?utf-8?B?cEUxS0krQjlWbEsxQWJmUzJuOHEzRlMxbVdWRXZRWDliVVVGSy9uSC9sTjJ4?=
 =?utf-8?B?Y0JOYVoraEpINUg1TVoxQ2M3MkxUV0xCQ2oycURacWVtdHdWK3dOOFJPQjNV?=
 =?utf-8?B?a2RZWkkyL2pwMnpTVkk2cmJpK3lTd2ZIbmRiVVhURHo5Q010MktsRUxZbGZu?=
 =?utf-8?B?cXRsR3F5cEhVS0JXeTlQWUxlWDRBTWtHeG4vY0ZWdDZoTURVdTVjZUtESmd1?=
 =?utf-8?B?czBGVVdiN09XOGswOHhNMHNnak1HSk1wTUV3NWVhdDdHZGhSQXFWT1BFeEs1?=
 =?utf-8?B?SWNBWHZUWDUvbGR1Y2VSZVN5T3RwSzVxWkVhTzArQXIxOVdOOXJDV0wwRkNG?=
 =?utf-8?B?WTh4YWxjVG5YTURsRUxSeWZubHVEMUNBN1JGN21EOXhCQjRtUVVKYWVGeGJu?=
 =?utf-8?B?Y3U4UkVhUldDdFBUNmVxUkZ2b0JOSy93UVNIa2VpUXd6VzZPN3hWeldDditU?=
 =?utf-8?B?RDEvZUFSZ1hkVlFDNDBva3ZueXJncUtMeVNjYWFnSnpoL1JqUXpobEhrQnQx?=
 =?utf-8?B?MmlpdUZ2dm04NnV6ckhWZXExV0o3MkFLQWhvdHpzdkdHb1ZjdkZvUXVhODUx?=
 =?utf-8?B?OWZpSnhXU214akV4TW5XK0prQkRrYmltVGVRejZady9UTktWaXdBMnRkMUlJ?=
 =?utf-8?B?RTN5bVo1QmN4WERJY0wvdFhaZTRCSU9BT1BqVUhYM2M5M09oRkNqNzljZ1lx?=
 =?utf-8?B?MFRFdEpjbWdQWStwbU5hdkVncW9IWi9uMVBZTUdZSXJpMjhDUGRDdVlpZ2Fr?=
 =?utf-8?Q?rT2/7rfDXacLN8XGvw=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <25197A0F0F27D84CB94F4600510CCDB0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5df10a4-70ca-44e3-c484-08d8cc1b42e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 10:21:13.0098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/BEQmuhAhN60qawsWeWRyAgKhyIoESc0ZzWOmM9k7S2HwPjJJWnIVc0hS+tqGOaHjyNePJcq6QcRKkV9kDG10nRJsknmKoHFrNkE1XKgog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_052118_967673_BDCFE2AD 
X-CRM114-Status: GOOD (  25.31  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIEdlb3JnZSwNCg0KT24gMi83LzIxIDI6MzAgUE0sIEdlb3JnZSBCcm9va2Ugd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQWRkcyBzdXBwb3J0IGZv
ciB0aGUgQm95YSBNaWNyb2VsZWN0cm9uaWNzIEJZMjVRMTI4QVMgMTI4IE1iaXQgZmxhc2guDQo+
IEkgdGVzdGVkIHRoaXMgb24gdGhlIENyZWFsaXR5IFdCLTAxIGVtYmVkZGVkIGRldmljZSB3aGlj
aCB1c2VzIHRoaXMsDQo+IGFsdGhvdWdoIHRoYXQgd2FzIHdpdGggT3BlbldydCB3aGljaCBpcyBz
dGlsbCB1c2luZyA1LjQgc28gSSBoYWQgdG8NCj4gZG8gYSBiaXQgb2YgcG9ydGluZyB3b3JrLiBE
b24ndCBzZWUgaG93IHRoYXQgd291bGQgbWFrZSBtdWNoIG9mIGENCj4gZGlmZmVyZW5jZSB0aG91
Z2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgQnJvb2tlIDxmaWdneWNAZmlnZ3ljLnVr
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvTWFrZWZpbGUgfCAgMSArDQo+ICBkcml2
ZXJzL210ZC9zcGktbm9yL2JveWEuYyAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4g
IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICAgfCAgMSArDQo+ICBkcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuaCAgIHwgIDEgKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCsp
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvc3BpLW5vci9ib3lhLmMNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9NYWtlZmlsZQ0KPiBpbmRleCA2NTM5MjM4OTYyMDUuLjdkMTU1MWZiZmJhYSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL01ha2VmaWxlDQo+IEBAIC0yLDYgKzIsNyBAQA0KPiANCj4gIHNwaS1ub3It
b2JqcyAgICAgICAgICAgICAgICAgICA6PSBjb3JlLm8gc2ZkcC5vDQo+ICBzcGktbm9yLW9ianMg
ICAgICAgICAgICAgICAgICAgKz0gYXRtZWwubw0KPiArc3BpLW5vci1vYmpzICAgICAgICAgICAg
ICAgICAgICs9IGJveWEubw0KPiAgc3BpLW5vci1vYmpzICAgICAgICAgICAgICAgICAgICs9IGNh
dGFseXN0Lm8NCj4gIHNwaS1ub3Itb2JqcyAgICAgICAgICAgICAgICAgICArPSBlb24ubw0KPiAg
c3BpLW5vci1vYmpzICAgICAgICAgICAgICAgICAgICs9IGVzbXQubw0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9ib3lhLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2JveWEuYw0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjAxNGIwMDg3MDQ4
YQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYm95YS5jDQo+
IEBAIC0wLDAgKzEsMjMgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
DQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSAyMDA1LCBJbnRlYyBBdXRvbWF0aW9uIEluYy4N
Cj4gKyAqIENvcHlyaWdodCAoQykgMjAxNCwgRnJlZXNjYWxlIFNlbWljb25kdWN0b3IsIEluYy4N
Cj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbXRkL3NwaS1ub3IuaD4NCj4gKw0KPiAr
I2luY2x1ZGUgImNvcmUuaCINCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZv
IGJveWFfcGFydHNbXSA9IHsNCj4gKyAgICAgICAvKiBCb3lhICovDQo+ICsgICAgICAgeyAiYnky
NXExMjhhcyIsIElORk8oMHg2ODQwMTgsIDAsIDY0ICogMTAyNCwgMjU2LA0KDQpUaGUgbWFudWZh
Y3R1cmVy4oCZcyBpZGVudGlmaWNhdGlvbiBjb2RlIGlzIGRlZmluZWQgYnkgb25lIG9yIG1vcmUN
CmVpZ2h0ICg4KSBiaXQgZmllbGRzIGVhY2ggY29uc2lzdGluZyBvZiBzZXZlbiAoNykgZGF0YSBi
aXRzIHBsdXMgb25lICgxKQ0Kb2RkIHBhcml0eSBiaXQuIEl0IGlzIGEgc2luZ2xlIGZpZWxkIGxp
bWl0aW5nIHRoZSBwb3NzaWJsZSBudW1iZXIgb2YNCnZlbmRvcnMgdG8gMTI2LiBUbyBleHBhbmQg
dGhlIG1heGltdW0gbnVtYmVyIG9mIGlkZW50aWZpY2F0aW9uIGNvZGVzIGENCmNvbnRpbnVhdGlv
biBzY2hlbWUgaGFzIGJlZW4gZGVmaW5lZC4NCg0KQWNjb3JkaW5nIHRvIEpFUDEwNkJBLCB0aGUg
bWFudWZhY3R1cmVyIElEIGZvciBCb3lhIHNob3VsZCBiZSBwcmVjZWRlZCBieQ0KZWlnaHQgY29u
dGludWF0aW9uIGNvZGVzLiBTbyBJIHdvdWxkIGV4cGVjdCB0aGUgbWFudWZhY3R1cmVyIElEIGZv
ciB0aGlzDQpmbGFzaCB0byBiZTogMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg3Ziwg
MHg3ZiwgMHg3ZiwgMHg2OC4NCg0KV2l0aG91dCB0aGUgY29udGludWF0aW9uIGNvZGVzLCB3ZSB3
aWxsIGhhdmUgY29sbGlzaW9ucyBiZXR3ZWVuDQptYW51ZmFjdHVyZXIgSURzLCBDb252ZXggQ29t
cHV0ZXIgYmVpbmcgYW4gZXhhbXBsZS4NCg0KSSBzZWUgdGhhdCB0aGUgZGF0YXNoZWV0IFsxXSBm
b3IgdGhpcyBmbGFzaCBkb2Vzbid0IHNwZWNpZnkgYW55dGhpbmcNCmFib3V0IHRoZSBjb250aW51
YXRpb24gY29kZXMsIHNvIEkgc3VzcGVjdCB0aGF0IEJveWEganVzdCBnb3QgaXQgd3JvbmcuDQpX
ZSdsbCBoYXZlIHRvIGNoZWNrIG90aGVyIGRhdGFzaGVldHMgZnJvbSBCb3lhIGFuZCBzZWUgaWYg
dGhleSBnb3QNCnRoZWlyIG1hbnVmYWN0dXJlciBJRCB3cm9uZyBmb3IgYWxsIHRoZWlyIGZsYXNo
ZXMuIFdlJ2xsIGhhdmUgdG8gYWRkDQpzb21lIGZpeHVwIG1lY2hhbmlzbSBmb3IgdGhlIG1hbnVm
YWN0dXJlcnMgSUQgaGFuZGxpbmcsIGluIG9yZGVyIHRvDQphdm9pZCBjb2xsaXNpb25zIHdpdGgg
b3RoZXIgbWFudWZhY3R1cmVycyBJRHMuDQoNCkNoZWVycywNCnRhDQoNClsxXSBodHRwczovL2Rh
dGFzaGVldC5sY3NjLmNvbS9zemxjc2MvMTkwNDA5MTQwMl9CT1lBTUlDUk8tQlkyNVExMjhBU1NJ
R19DMzgzNzk0LnBkZg0KDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIFNFQ1RfNEsgfCBTUElf
Tk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCKQ0KPiArICAgICAgIH0sDQo+
ICt9Ow0KPiArDQo+ICtjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9i
b3lhID0gew0KPiArICAgICAgIC5uYW1lID0gImJveWEiLA0KPiArICAgICAgIC5wYXJ0cyA9IGJv
eWFfcGFydHMsDQo+ICsgICAgICAgLm5wYXJ0cyA9IEFSUkFZX1NJWkUoYm95YV9wYXJ0cyksDQo+
ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYw0KPiBpbmRleCAyMGRmNDRiNzUzZGEuLjRkMGQwMDNlOWMzZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4gKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmMNCj4gQEAgLTIxNjAsNiArMjE2MCw3IEBAIGludCBzcGlfbm9y
X3NyMl9iaXQ3X3F1YWRfZW5hYmxlKHN0cnVjdCBzcGlfbm9yICpub3IpDQo+IA0KPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciAqbWFudWZhY3R1cmVyc1tdID0gew0K
PiAgICAgICAgICZzcGlfbm9yX2F0bWVsLA0KPiArICAgICAgICZzcGlfbm9yX2JveWEsDQo+ICAg
ICAgICAgJnNwaV9ub3JfY2F0YWx5c3QsDQo+ICAgICAgICAgJnNwaV9ub3JfZW9uLA0KPiAgICAg
ICAgICZzcGlfbm9yX2VzbXQsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuaCBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oDQo+IGluZGV4IGQ2MzFlZTI5OWRlMy4u
ZDVlZDUyMTcyMjhiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaA0K
PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaA0KPiBAQCAtNDA5LDYgKzQwOSw3IEBA
IHN0cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciB7DQo+IA0KPiAgLyogTWFudWZhY3R1cmVyIGRy
aXZlcnMuICovDQo+ICBleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNw
aV9ub3JfYXRtZWw7DQo+ICtleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVy
IHNwaV9ub3JfYm95YTsNCj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVy
ZXIgc3BpX25vcl9jYXRhbHlzdDsNCj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51
ZmFjdHVyZXIgc3BpX25vcl9lb247DQo+ICBleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFu
dWZhY3R1cmVyIHNwaV9ub3JfZXNtdDsNCj4gLS0NCj4gMi4zMC4wDQo+IA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
