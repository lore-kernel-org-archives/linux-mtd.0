Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C10C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:22:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5044D61424
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5044D61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTGz3HRzQpfFm7Rkt5Nk2I8bKTKcwNVfTmH0rmjd1RU=; b=ZhYBVMStskKxCu
	hZKsW2s2G9DnJ6ublRk9G0gYBXaK7bNW6Ay6NRwHkTsWINHNYR+DwVEaPCFJqpcIjsf53zX7kIpbI
	ap1HxUZrQO+NIxYf1vwh5HwhatHNTjzDXEtDCZCdIm88nJTcG+T7nj60h+EidjhlSHHK3frzgWxV7
	atXdK8yMbzrnGmCiETlx3Oh3WbBuZfxBViqS8F63agU2t+5URXYJb+c2ih3QoN9UBtYc6dUFBl/ou
	BREWfNyBvXtmXiW3E9NBGt24YZBlzMkTF3tyVo/wLDHeWlIdFuiJH3OJreh17b3VKThleneLB9wrE
	mx2hIP2acQMVlqlX0EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJ6f-00361W-JS; Fri, 02 Jul 2021 13:21:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJ6a-00360q-Qj
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 13:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625232076; x=1656768076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yDuFnGq3TAAw2aq63DtDl587SvdRiqHl9tVQBzBKEIQ=;
 b=YU1UVclEOsP2vrSrek1AitlOed2NgFMpmyBiColCPsxGaFDi0em0Xc8z
 ZPcggWXsUSq8RkeVUHJ1y239nYb/7bRVeNmgj4jJAM0Y7P5GfCGyT/6Vw
 O4BfNaJ4p6dtGJELIf7jKmfbFyGpoEe3BOCrQsMyUxiOQdgYoagXdEfIv
 2a0D5KtToTt6vFA5B6ZnjaTRuap92P70+sV8Q8W+a/AT/+5vtycTfom/a
 F6YQtnIizbxWLlGSCYFqnnBJbXu6xF3cqzzWB9JweHj8rdeUlwIsYuxJx
 Lhs6qRPncLzhPXPIZ+PEPoAFBM326RPfwEPMglA7SIjZpolRXyTdu+rpS A==;
IronPort-SDR: l0Y7fgWA52JppYH+C/6ozBjjP3EKddckiv50XL4aa9LXeP61uEhs9d65f8bdLPFTtQMDVK5aE4
 lFV0aR0FDbS2tTWL/6PX8ic8t1VS+g+Wyc+zFmkg7ggLfWoQ9nDKIx4QUaV2OMCAb6dnA6mSiy
 cP5LJCdDgyrW+gkqrOkg3Qyjw8ZT7iiumdKoTsgZtAnLDw9R6dxiPmunT+KLrDR05Eq4WJCoRf
 eZ9+41pqC/PEaEthT3WEPWwLhsCYYZvIA1yb+0nZZbrLghPeEbEqSbcEGvwSADt+XJt2x9EvE0
 un0=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="127475416"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 06:21:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 06:21:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 2 Jul 2021 06:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNhDQVD011fOfaHVja2xpfTIfH3DPsREvHtV0GqDme3nS1Q2NZOl5bC3I6fv8zo6fZUJUBAfZCIvNaZqMTbEjK6nFgQSs099AwE55YMOao8emoYBONX0sdo6yAjle6fn/0goEa+jBgAQg4f9DdmlMgZC7B3UjzFCkrqp34T4YHVrFJrLhnRsiYwznSXR+wJ0h6JkuppCR2xECEe/UFl9UDo7Sq5b5HelVGPgVNfGLwAoSHTCngz6VmX9C0lu0zJE6rYgUOaVBJDKHpkPFyyUy6DO8IVUQKGsvIBJPM/sjTlO7HCF0kWAYQ+Vy735gjbWz+4WdO5BimXbRAirs+yT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDuFnGq3TAAw2aq63DtDl587SvdRiqHl9tVQBzBKEIQ=;
 b=KWfwQW472SaE4NSdhHk+L2nfFpjWhUUsxZP0wqH/Xt2uUVBnm9Jgg5mnum8nDNRrPonUtb99KkDZAgIbdigR85s5mrpRQ65rNB7lwlmv4E1garsakSDX1IPd2V5cqItCikQxmGGkRnNQMWycIlz3SN3CgIjHB5L66L0bS28JAWBu/8Z4ucqEMkljKespwXSHB07ATHMMnF/vfdswPimxhnGCP6/WoSnqiD81EDeVULzB8Hxy8mKBZiRu3lw6bYlcDV+pcZop4g8oVwn6dF5uIRPK1x8syXEM4izepLhVmuplApP5H1T01I7iOro4ZMgRo9M/c9YLlcVMtHY2OMCvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDuFnGq3TAAw2aq63DtDl587SvdRiqHl9tVQBzBKEIQ=;
 b=WO//d8iQYsPrUVFSMfCLKnnqBpVWuOazmcuD76Rl73k43uDEQhAjTgoxkp+aj4PARr/APhH2JYGS9vMn70D0xGTJubw0bdQxWRSFHq9/vXgtDMd8THyF/ZP4aTgQ9++ttpIGIxBJ+iBBlEuvAxJRNVHf/WfstVKz+lWx2hwt744=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 2 Jul
 2021 13:21:10 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.024; Fri, 2 Jul 2021
 13:21:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <knaerzche@gmail.com>, <macromorgan@hotmail.com>,
 <linux-mtd@lists.infradead.org>
CC: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Thread-Topic: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Thread-Index: AQHXb0UeVe6ILG5rqk67W5iaVE1elQ==
Date: Fri, 2 Jul 2021 13:21:10 +0000
Message-ID: <bc09e0c7-bbf5-944d-ad8d-13b24e410e51@microchip.com>
References: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <a31c9949-089c-fae8-b8a4-30055a4833c7@gmail.com>
In-Reply-To: <a31c9949-089c-fae8-b8a4-30055a4833c7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00762d84-1180-4848-7640-08d93d5c41e5
x-ms-traffictypediagnostic: PH0PR11MB4903:
x-microsoft-antispam-prvs: <PH0PR11MB4903C8CD3E6DB40A62C49F7AF01F9@PH0PR11MB4903.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2YPl6s1FPeqOmSe7mnSj8pmTonyK+2orDz7pB6zLjltw7ZqdBSQDD9wTCsKkjmnN+7o4f3JqmsipXKW+yrrzFZdQIrcGWqb7WbIzcF+P/y7BLQh79Hsujt34cvuJ7zu+KbgUq5aVYd8VjFmKvFC4Y4ko2Yjl0y1HibUJda9yUncnwdJd1YJgyBgWruKPWOwMckitXAvfq1ZuYdpE5oPaOTKb6a7k1/DAIoV0RDDfGNW/DsAaW7R8fCFHJDbiVP508nzI8OVzUSizFVW8ubkEcquEPXJ9hOXp35faTFXslY5TWOmB25YgbPysgJjx63NP7drHxajwiP4dYW7Ak0/TKH1NzrnIMuvd9EU+MXIuA7ntmTRyQeUD+8z+8PKCd5RSnR42YHyRWnfjA6OZ9RA/cwNVaIvT/Zbli6w9hf7aRxzIxeWFczV8JQL3B5NanpBBpRjA6haGFNvSg9eU7zounwdColU+2S+3TE3Z6d+8cWmQZGIn5FqKBUNveYgJ2v2ahb2UrXTfDxUoghKcZ4Sr0K48gyitVxdwX4kr0O8QaARh1kxBLX163LCbfpshAQEY+mt9dfCiJnk/ytnYgz+5r9TphMNBQX5ctqlLK+NI+HAnGgmRj2sNlfcR2I/vZnhtbIe+cnW/XfcQyFLaPxQsI9fZY+05uq9PVznWVEqeJFMfKNNGqTwyeou0HUZdVpMYqkCL9aauegiU8S0xhxVyc23/gfetfk22ZghtCSrbQcCUWpbZhd4BZwIWiGEMUxi3UC7kG66yPni9aHeMSuFGv0ToviKlUfTV/IXE3AbBwqg8QGxv4/+zbKhggETBJJtWwduEOjMapzlKBUQb8r///Kkv2Tl/Vcn+REEBGILk5sC9ldGoZIJKDB3Jtj6R/hJkp8tqy7uEPEDjHyHrGNoXrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(366004)(136003)(396003)(4326008)(36756003)(38100700002)(5660300002)(122000001)(83380400001)(2616005)(26005)(110136005)(31686004)(53546011)(86362001)(186003)(6506007)(8936002)(71200400001)(6512007)(66556008)(54906003)(316002)(66946007)(31696002)(76116006)(2906002)(8676002)(66476007)(91956017)(966005)(478600001)(64756008)(6486002)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWU0dUFPSU9PNmNIa2F5MGVqZTFCV3FSUDdEOVY4QUNBZUdzVS8rdGppd0pw?=
 =?utf-8?B?dlFzamFUbm5FTXdxUFc3c250L0d2Z3hYUmpWdllxZEhqWHZUb1F0QjYvUDEv?=
 =?utf-8?B?TFAxV0lZMXdsN3I2cVh2OSs2eVpJRzQ1c2xYNVZVb0VHUmQ5K04zcDVrQmp4?=
 =?utf-8?B?MkZOQ1lMLzlCSnZnRmtVOTBaQ1hZa1FZa240aEhFMGdsZFhxc0ZqcVpxdklT?=
 =?utf-8?B?WnlTYm8xbXAxSzVDM1NueDBSUUlpZGJBZk0vaWFaSFVrZ3NIOUk3ZVBEa1lj?=
 =?utf-8?B?c21OSEIrSVlzV2NzVUd3WUIrWGp4VFBpUkxhS2U5NFZwS1RrcWVVOEdwdTF3?=
 =?utf-8?B?L0wreVBzajk3djZOU1A0VnBmVzhYUjVUcHgrbTJ2Rk1iOWRQMUJIbEdjL29h?=
 =?utf-8?B?WkNLMEp4NVZndVhMY3RDSTh4a0E1bTgzaE5Wc04xbzJhYlpyUEdVRThEYmFx?=
 =?utf-8?B?eU44d281WFVYNFdDQmRxQkQwdXY4UVkyS2pTRkFQc3piNE1VSFJGVXk1RDJK?=
 =?utf-8?B?S2FvZE1aVUlVVmIrb0YyZ2EweE5nbHJUOUc2K293WWNhNDZJWkxBNWxBMEJs?=
 =?utf-8?B?TTlrd0ZSc3lyRzgreEJ3cEtUaDBPakhUNTZ4eG81Ny9YdzduREE0UjNkMzJK?=
 =?utf-8?B?aFZSUG9NeVFmKzYyc3QrZW1wYmEzTVUwbnY5c3RmeFhUcFBWUEE1emFmQU9R?=
 =?utf-8?B?Y2tQa3VYbFEyR3hFS3JmTVBBd3lVaEU0WUwyd3JOMklXaWk1ZXpteE5DaXAw?=
 =?utf-8?B?Q0tvVkF3bFU4N25oVW53KzFTSFY4aHV3MlNCdTRXTWFzMEZRenZ0bityV1pO?=
 =?utf-8?B?aEFPd0h0U0lKaXVtYTBvZU5sa0hrOVM3cGtaL0VzMVRnVGJYVUdOV3NWaStC?=
 =?utf-8?B?aUZ6alVQTm1FZExxb08yVnNrUUtRWitORkRnWkprVWFHcVJNalViUE5zZ21L?=
 =?utf-8?B?UE5FbGtDY2h0c0oxODgxSHNrNnA2Ni9sY2puSTVBNmNTemt0MyttVVJuTVhV?=
 =?utf-8?B?bTZidVhKSmRTa1BXQjFXM2FhTGIwdWE1eWFRblVNbTdZeDg4TE54dldRK2E4?=
 =?utf-8?B?LzNuaHpBVDZYMk95U0dHM0dSNDVFZ2hXQkZyTEVZaXVIa2ZZWHdDdzc5UmZJ?=
 =?utf-8?B?Tm4xRDF3V2l1S2dOSklZWWxpNC82OXl4NHpKKzVHYnBPek91T0VjZ0F4SlZB?=
 =?utf-8?B?S3FJY242MmhXTDVGd3pGODRvU3E1MHZ0Vmd3TkFJUWhkL3FiUTVxamYvb3F5?=
 =?utf-8?B?bk53cDl3bXdqMHdUeUdWK0ZqeVp2aWVGcE9OL0lOd0RnUnlyTWxEK2dXZWFY?=
 =?utf-8?B?cUlCQ2U0TTkvZ0ZtVWhOaFN1bVdVMmhSMmorU2w1N0NtL1prTUh5MHFnK0FV?=
 =?utf-8?B?T1RUVldoVTJ4Nm1LbndHZmhNSk93bm9QZVlqelYxb0NzSGJ2V0VPSnNzTjdt?=
 =?utf-8?B?bEtBR1VjTUdNdk9FQkVkRm5WbWxTSXdjemhtV1ptRTMxbDZScUF1VkdPMWZs?=
 =?utf-8?B?ZDlmVVZhTngyc0pNTTh2WUNvY1hPQk9xL05qR3Y1N3FuME95YnZzTjVhOFRl?=
 =?utf-8?B?NFh4T2pZSW5wRGdoVUt4NkE0Ti9lcERwN3RaTTRkTURlK04xTjZrbGcyVlpN?=
 =?utf-8?B?ZUtGekhtNTh3RldUb01NYkpzU1p5TFBoYjJvWkxDZHZtRlNuaEowWHd6b2pT?=
 =?utf-8?B?dzAzRnZZaSsyTHBYTGtDUEp2UUc0WkUralFaWDZOWTd2L2dLVUJoY0FXTXV1?=
 =?utf-8?Q?ziTyMBB78o2rkDX1V4=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <13F77A6E607FD94BA48724AD8A97ADD6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00762d84-1180-4848-7640-08d93d5c41e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 13:21:10.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tn8y2rFgtmfrkJy1Aghe9bA/d6jnNMJu2ZAK2IIX6WLBEvX/Ytu3bQ0RSm3uL6oVVbdqRBuLCuPdKc4cad16rmymLd/scz78j6jg9Ww/6XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_062117_028931_2E780D2B 
X-CRM114-Status: GOOD (  19.27  )
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

On 7/2/21 3:49 PM, Alex Bee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Chris, guys

Hi,

> 
> 
> Am 02.04.21 um 22:15 schrieb Chris Morgan:
>> Add support for a new vendor (XTX) along with a new chip from the
>> vendor (XT25F128B). This chip is used in the Odroid Go Advance,
>> and has been tested extensively using the spi-gpio driver, as it
>> is connected to a serial flash controller that is not currently
>> supported (but the pins can be repurposed to GPIO). Read, write, and
>> erase all work as expected.
> Once you've figured out how vendor id stuff is read out correctly, would
> you mind also adding the the XT25F32B variant?

I've started working on this, here's the work in progress:
https://github.com/ambarus/linux-0day/commits/spi-nor/next-id-collisions

> From what I've checked it has all things in common with XT25F128B -
> just has a 64 instead of 256 sectors.
> 
> Datasheet can be found at:
> https://datasheet.lcsc.com/szlcsc/2005251035_XTX-XT25F32BSOIGU-S_C558851.pdf
> 
>>
>> Datasheet can be found here:
>> https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
>>

we'll add just flashes that we can test. Do you have the flash at hand?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
