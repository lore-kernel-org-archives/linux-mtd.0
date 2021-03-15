Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9656C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 07:29:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57FC864E6B
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57FC864E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GQO3WmjQvINnVenFCj9CYWyM+Ltb+0ZFEshdHQQQ2Y8=; b=CzHiCDpW3YJ/89o+q+wFRu5Dj
	u1OMeXdUTGvZCMHxrirce7aoEXAPR7SHhRqIGL8XIX5d+003vlLylQiR7hew+lMGspNqBGcV3l1ye
	Co/XgUIe2BxWB9YYtl+HPzP6jywAzQ5qFRfvSd56tFj/w9SmOXGHmYdE11I0tH8r12CS2xyf2cFNL
	vr2vlMQSL3ALit1f8IWA9nN+e8LqX7tA5uO1R3O7jwpJTmCjXnzM0XMs6vuiCKf4H6Y7izW3u99My
	YKm7KtitZ4jKWmPs55tcItZOnMpupIzCz97zJPsZVc24lpTrULKrggHe+KCnb77XmMltYSJGzplQk
	nsrPv/24A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLhf5-00F8ln-Qm; Mon, 15 Mar 2021 07:29:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLheq-00F8kA-7g
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 07:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615793336; x=1647329336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VZm0YZp5zeeQ1jsSJCwqooSeZXukZyV2gDR5SgtvrKI=;
 b=kk7VLCr+5ZO0qPdWn8++nwQ8DZoDyvQmL3qjRfKwM/bTDe82oyMfYxVb
 QYqZGYkj/GQBF6cZ9+dWtKJQ08tuEYA8bei+/MsO0tvDVHks5WKuyTOfG
 hMQMxsG/L206e8XZFEKI+/HQUaOSWs+SgdTSyEE5PHiSS6onZEYi08Zlf
 E6dvsuRsb+RRHoZGGX5DIVJlWNeNARh5ZQc4PvGF6U+ca3sCfjspUGDOg
 nY9xWVQDwyIwJxkLi3PAKqTsPVwRMVVsWalsOgybbn2G6pbG5mcJetRNm
 xr364lDCyGg709CciCzFsuldX5DW/h5FxMNgg09FYa3XjDH1TU0BU8lOj w==;
IronPort-SDR: mcxsKXkyocYJMFua5marZqKIGySPOiOONaOBl9VIP8ctxOSCO3zTj5ondWOPR5NhnpUHSvOB5i
 iRLw9IqqVtQbrD4ipcjqLq6kaPe1P1LYlyl6v++8Do4xRqkOaDGdfWAJFOH3lj21+fEm31nA4g
 eBVPdSVg+tD/godHJ1TfjQTgvQF1c5rSGWDBz7gXGMR449f3BP1Pxt67NRfvEzfHXrEIbTCJJZ
 cjUy9V9/fsFJ1ZTsSRAH3l49HuRYulHfzDpqwKvmc1sz6Frzg7d3lx0OWk11p86zkexiiRL8St
 O9s=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="107187495"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 00:28:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 00:28:48 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 00:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc5MpFelq3QHReO37NpNWEV3zg6U5jZu+JxK2g3L/FqPTjC5Xsrfkq3IvETSNBeItdDAW0yCP7cPqz9BnQ6UsVcntTelT7uYCxMjhW0OfV0SjHiKRTKSf9Sv2S8Z8kN7Luso5ljXkAf8cv1Pyz2KQjXo/djh2rD0CNZ8yAYL8VchIn/XRbSvSfr73bmSWHBgVpG0mLTkjbV49kRuVGuEtLLXPZbzvsjsPZmwX9HDR5+daBsNqfw9lk4PktFcTQemwMn+um8mM4prmiS1j18A9MxP970132X3QZBPGvhIyEsy0Te/o8A8QhtBlrhvvdtPucRbTkwQE+KAWiCyn6cF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZm0YZp5zeeQ1jsSJCwqooSeZXukZyV2gDR5SgtvrKI=;
 b=nN4ILem6IQ529FmtOroxBt842113UrV5Niw3FonPwH7WnMfHT+mlIXA2X/JafV/wuUXRth5w4RSMA13aPauqPOvR257WSCvj6Pcxr+0wH1a7JWurN6AISJJEqCZuTyqjvvCKhM5UpdYn2OaRqXRV5CdAB1bmrxlQzFkmSW8AknFnKJDgw0TOTpLzSbtuzoMpqB9L4WbbSmg+1NI0qvM/DdXzXvF8nxq9IfP9HjAykfGDHf9sQ5/XAJSR8KxZphVaAGbZ6ATBVnORJbGwJ2ZouOSd8nryPV+38lJOTKld2/v+x3DC18r5ugBYEFJzyVnCoUAC5LisrpVqphKy99Z+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZm0YZp5zeeQ1jsSJCwqooSeZXukZyV2gDR5SgtvrKI=;
 b=FFfWe7fmXHqf1SAR6TDpYwaXo2W9m/BHLNf6wJo1qO7QPYKZuwzJeB61KmTkQSzNgflhqAaV1J7CSs8dXnW/K8kfeHNh9/nvJ7YRMtIF6szPK1v01Px5uqTP5RBMH436j4PRH+MyObRIf90kKo7q6CyN3lV1TdR7N4kdjSq8pPw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 07:28:47 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 07:28:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add OTP support
Thread-Topic: [PATCH v4 1/4] mtd: spi-nor: add OTP support
Thread-Index: AQHXGWzVX5jrWvQlhkiOlI7agfm/7w==
Date: Mon, 15 Mar 2021 07:28:47 +0000
Message-ID: <7dd4bfb0-bb38-20c8-68e1-ece836c847fa@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-2-michael@walle.cc>
In-Reply-To: <20210306000535.9890-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9080fb7-177c-4e94-53e8-08d8e783f8a3
x-ms-traffictypediagnostic: SA0PR11MB4639:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB463938E276EFA2EAE57BB972F06C9@SA0PR11MB4639.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zLgEtv6AK3iLGNstkZqVnEIS7PCZFyylNFi6gzrzbXxv+eKTaaIbqyZTEdyvswarIX6jj8v3tcm/EzhD1kN6jr5wEDBme5bWgT+9JVUXFwcZi71IUlispHHYaXN7JqHyGzRsSkU6kfan0o458LFS4mclfcOJjm4Gd+2s1N/BZphCkvoB4VQnCGq4RGYoG5rfN0SFcUsjhJq2oN9/5LaND9YfxXLeim/NDVGh9aQzPwoxo2gkJayoWFMaBQUhng5jMTG57fjBItQEZdJaeMo3YCrNeMfWGyENarmwo6EsMtkdA3fr/jtke0SZogT/feWrm/c9bfosUbLfNFfUAXlEvvWto5IN3UmKdcRjo8yA3/Yb6r36Z2JVxhAX8uUopaMojVbN7Yp+ZBmKvjWDuLOr5i2DTdSSVDauJbu+0zS8Pw77eLv1401XjfM9nRSuoUbUlQECIHFJvOSpWKi51OLIy07UaZi8T/1zZfAJLLPrBoObq3U6LX++CdacGyq/0eZsTmBeox2Q9puYBNy6a4jMS19vzZWWTfTuJxZCDyjAWkrQSxu17173E4KSxoVT27RddRdm+Qf1/NfideiIvYSBvyKw6ZwEgAi+eH/P3j7KpNeYgxZO0shx1W7/9HxgBSW6e7MLyCwpLlZvhRiVKxv18XcB8itSUStiEnqY5zJPSqI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(366004)(396003)(39860400002)(31686004)(6486002)(186003)(2616005)(91956017)(66476007)(6506007)(53546011)(26005)(66446008)(64756008)(66556008)(478600001)(36756003)(8936002)(8676002)(2906002)(54906003)(110136005)(6512007)(31696002)(4326008)(30864003)(5660300002)(83380400001)(71200400001)(66946007)(86362001)(316002)(76116006)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ck4zOVIrZkpGbHFUekpFcmRPNVB2OHlxb0VjdTI5UVlDS1BqT1BFdTB6Z1lC?=
 =?utf-8?B?cEQ5MkYzdjdJTFdqMU5ySlV4a0xDeUszWFpibit2L1U5ajRrR1UrNzZBWjNv?=
 =?utf-8?B?bU0rL2ExL0hjTWtUL2YvbTh4bjVmRWppOHgvai9hazc3Wk5xbnplVWYrZnRJ?=
 =?utf-8?B?OTlhMllqc3ZrYTQxaldHcGU3WTZsdW5QcHNubGhjYnlMenZveVk4bmVsSjUx?=
 =?utf-8?B?djFHVFhsU0RjSG9YU0NEWXVSOFdJSlFadElWSzcrazltLzBnOXZQK0ZpN3cy?=
 =?utf-8?B?THdDbyt3LzNLbTN2N3VGUnBkZWJwQlV3NHRad2ZMWGdLVFJsTzJOZ0xDWEhO?=
 =?utf-8?B?Uk5zbnViYUtKbDZUSzRMcVhhUzBQNWpkdmlIcWVIajVhV3dZOUErWW9YMnF6?=
 =?utf-8?B?WU9PcmdFdWtVQmJsZVd2U0p1VWFyUW1taGd4SUdGZzh5c09ia0lWSjltaGdK?=
 =?utf-8?B?YmtiYU96QVdlalNiNFRUSEtmeFUrZ1hBVlpNY2xZS3pIT213UjlPS2hybDV5?=
 =?utf-8?B?cWNWY3dpdzl4VnVXWmJqN2UwVmxZYll2NHhpMVBMMWZsUzZCOGNFZnczOG9J?=
 =?utf-8?B?U1pZSzVCMkF0anh4Qmk4TzZiNjlxM3hBa3d3T3hqZjc2M0s1WE9xUmIwYXRW?=
 =?utf-8?B?MzJRSGZwOXAyQXlMUGROMXZ2bHhVRFZnWWJVRnhoTXMyRDF3QXB6Mm9FZmNM?=
 =?utf-8?B?OVdYaEMxNTlBWEFQeUhGRGxvRGZ4cStRTmdrOFVqamFVVmhKa3gxOVJ3OWZO?=
 =?utf-8?B?QWdPU2pCWDlna1NUOFkxSTdNY09LSnRNdDdteXhTOFhyMkhMUFpuOXRObWdV?=
 =?utf-8?B?ZFo1KzZWL0xjdGlvcXM4MmxsY3UrN1FodkMrajRFUG9qTXY3enl0cEIyQ3NX?=
 =?utf-8?B?ZWNVNnlUNjNGTDZkeXo0cmJ2VlY5OW9DSnRpMlY2bzFpQVlMR04rVlJvMng1?=
 =?utf-8?B?R0NVRzRGWVNEek42M0F1VkFPMS8xdGMzU1h3ZTJMai9XLzZGMDFWakZMQjht?=
 =?utf-8?B?WWxHM1c1b25pNTZsSlRBTTl2SnhVMXNaTVNrUnZRRk5IM01vS29LMVF5azhM?=
 =?utf-8?B?citZSXpoY2t2T1kvUW8ySlpNUnNOdDNwYUI3eXk4Y09PWGRNM3hjUjNrYUR1?=
 =?utf-8?B?MGhlcSsrWHpSS21oQ2NJY0wycU5acEh0cVozV0Iyc09ZR1lQaVN2NVZYT3hM?=
 =?utf-8?B?MUNKRm5NZkhBUGRwM1BucnJCenBZckRtVFliK1k2Y3QwMHZPNm43d09Ubk9n?=
 =?utf-8?B?eDZsTGZzQXFMd25CT2s2bjlTeXdYZjlFdDNCTG01Q2IwVkRYYkFxdWNleVZa?=
 =?utf-8?B?QmZrbGJHNGVDazQ5ZGErd3Q1ODdTSnhhWDNkOUgzUEQ2c0RGaDY0VHRvUUcz?=
 =?utf-8?B?ajVibDlrc3d2cmNUZDArNldWS09PTkx1RXNJTzZRVVJ1QkxadU8vRDRkajZQ?=
 =?utf-8?B?akxNa0EzVUpIYjVvL0ovMWNqRG0vSGh6WDdEN0JVMlZhRThWejNsZXNsK0xE?=
 =?utf-8?B?VHR0Zi9oS3Avc01CS2g0ZkRqMU93d0lDUTczZVdqTCtRb21ZQ0tQbUZrNFlQ?=
 =?utf-8?B?THhpc1MrazNqQzE0MHFIeUd1aXd0bnVkeCtnN1NRbi8rN3pkbG5MdzNqK2ov?=
 =?utf-8?B?bVQ1RXZqRzU3REZaTGx3N1pkbm5wenNMek9BSVBPRkhHeU9Nc0s3aHMrRXpt?=
 =?utf-8?B?cGNic2p1ckIvVk0zck80QUNYL0Z0Y0tWMWw1NDFLeEwvWGpQa0NZQnRPV21M?=
 =?utf-8?Q?P6Z2BjpXHc9EMrp5Gs=3D?=
Content-ID: <C637B92B09F34E4D8727E630AA4E976B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9080fb7-177c-4e94-53e8-08d8e783f8a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 07:28:47.0174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQf3TRroJCFMEOYiWFlZAGATnd/PFQ09miSZVmcqH2anZjTcHpAcUZx1EelQW8lyNYxktKI+ZtyLlszFL4k2nPDJmo0ra46l6UE1Giagqoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_072900_582590_7CBF397A 
X-CRM114-Status: GOOD (  30.24  )
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

Michael,

Just cosmetic suggestions this time.

On 3/6/21 2:05 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> SPI flashes sometimes have a special OTP area, which can (and is) used to
> store immutable properties like board serial number or vendor assigned
> network hardware addresses.
> 
> The MTD subsystem already supports accessing such areas and some (non
> SPI NOR) flashes already implement support for it. It differentiates
> between user and factory areas. User areas can be written by the user and
> factory ones are pre-programmed and locked down by the vendor, usually
> containing an "electrical serial number". This patch will only add support
> for the user areas.
> 
> Lay the foundation and implement the MTD callbacks for the SPI NOR and add
> necessary parameters to the flash_info structure. If a flash supports OTP
> it can be added by the convenience macro OTP_INFO(). Sometimes there are
> individual regions, which might have individual offsets. Therefore, it is
> possible to specify the starting address of the first regions as well as
> the distance between two regions (e.g. Winbond devices uses this method).
> 
> Additionally, the regions might be locked down. Once locked, no further
> write access is possible.
> 
> For SPI NOR flashes the OTP area is accessed like the normal memory, e.g.
> by offset addressing; except that you either have to use special read/write
> commands (Winbond) or you have to enter (and exit) a specific OTP mode
> (Macronix, Micron).
> 
> Thus we introduce four operations to which the MTD callbacks will be
> mapped: .read(), .write(), .lock() and .is_locked(). The read and the write
> ops will be given an address offset to operate on while the locking ops use
> regions because locking always affects a whole region. It is up to the
> flash driver to implement these ops.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/Makefile |   1 +
>  drivers/mtd/spi-nor/core.c   |   5 +
>  drivers/mtd/spi-nor/core.h   |  54 +++++++++
>  drivers/mtd/spi-nor/otp.c    | 218 +++++++++++++++++++++++++++++++++++
>  4 files changed, 278 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/otp.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 653923896205..2ed2e76ce4f1 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -12,6 +12,7 @@ spi-nor-objs                  += intel.o
>  spi-nor-objs                   += issi.o
>  spi-nor-objs                   += macronix.o
>  spi-nor-objs                   += micron-st.o
> +spi-nor-objs                   += otp.o

spi-nor-objs                    := core.o sfdp.o otp.o

This better indicates that otp is part of the "core" driver, while
the rest are manufacturer drivers (that are too part of the core).

>  spi-nor-objs                   += spansion.o
>  spi-nor-objs                   += sst.o
>  spi-nor-objs                   += winbond.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4a315cb1c4db..0c5c757fa95b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3009,6 +3009,8 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>         spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
>                                SPINOR_OP_SE);
>         spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
> +
> +       nor->params->otp.org = &info->otp_org;

Init this immediately after the setup init, something like:
	params->setup = spi_nor_default_setup;
	params->otp.org = &info->otp_org;

>  }
> 
>  /**
> @@ -3550,6 +3552,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         if (ret)
>                 return ret;
> 
> +       /* Configure OTP parameters and ops */
> +       spi_nor_otp_init(nor);

Please move this as the last init thing in spi_nor_scan, immediately after
spi_nor_init(nor);

MTD OTP ops are not used accross spi_nor_scan(), there's no need to init
these earlier.
 
> +
>         /* Send all the required SPI flash commands to initialize device */
>         ret = spi_nor_init(nor);
>         if (ret)
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..ec8da1243846 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -187,6 +187,45 @@ struct spi_nor_locking_ops {
>         int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  };
> 
> +/**
> + * struct spi_nor_otp_organization - Structure to describe the SPI NOR OTP regions
> + * @len:       size of one OTP region in bytes.
> + * @base:      start address of the OTP area.
> + * @offset:    offset between consecutive OTP regions if there are more
> + *              than one.
> + * @n_regions: number of individual OTP regions.
> + */
> +struct spi_nor_otp_organization {
> +       size_t len;
> +       loff_t base;
> +       loff_t offset;
> +       unsigned int n_regions;
> +};
> +
> +/**
> + * struct spi_nor_otp_ops - SPI NOR OTP methods
> + * @read:      read from the SPI NOR OTP area.
> + * @write:     write to the SPI NOR OTP area.
> + * @lock:      lock an OTP region.
> + * @is_locked: check if an OTP region of the SPI NOR is locked.
> + */
> +struct spi_nor_otp_ops {
> +       int (*read)(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
> +       int (*write)(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
> +       int (*lock)(struct spi_nor *nor, unsigned int region);
> +       int (*is_locked)(struct spi_nor *nor, unsigned int region);
> +};
> +
> +/**
> + * struct spi_nor_otp - SPI NOR OTP grouping structure
> + * @org:       OTP region organization
> + * @ops:       OTP access ops
> + */
> +struct spi_nor_otp {
> +       const struct spi_nor_otp_organization *org;
> +       const struct spi_nor_otp_ops *ops;
> +};
> +
>  /**
>   * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
>   * Includes legacy flash parameters and settings that can be overwritten
> @@ -208,6 +247,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @otp_info:          describes the OTP regions.
>   * @octal_dtr_enable:  enables SPI NOR octal DTR mode.
>   * @quad_enable:       enables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
> @@ -219,6 +259,7 @@ struct spi_nor_locking_ops {
>   *                      e.g. different opcodes, specific address calculation,
>   *                      page size, etc.
>   * @locking_ops:       SPI NOR locking methods.
> + * @otp:               SPI NOR OTP methods.
>   */
>  struct spi_nor_flash_parameter {
>         u64                             size;
> @@ -232,6 +273,7 @@ struct spi_nor_flash_parameter {
>         struct spi_nor_pp_command       page_programs[SNOR_CMD_PP_MAX];
> 
>         struct spi_nor_erase_map        erase_map;
> +       struct spi_nor_otp              otp;
> 
>         int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
>         int (*quad_enable)(struct spi_nor *nor);
> @@ -341,6 +383,8 @@ struct flash_info {
> 
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> +
> +       const struct spi_nor_otp_organization otp_org;

Can we move otp_org just before fixups? Fixups are usually the last thing
that we want to specify in a flash info.

>  };
> 
>  /* Used when the "_ext_id" is two bytes at most */
> @@ -393,6 +437,14 @@ struct flash_info {
>                 .addr_width = 3,                                        \
>                 .flags = SPI_NOR_NO_FR | SPI_NOR_XSR_RDY,
> 
> +#define OTP_INFO(_len, _n_regions, _base, _offset)                     \
> +               .otp_org = {                                            \
> +                       .len = (_len),                                  \
> +                       .base = (_base),                                \
> +                       .offset = (_offset),                            \
> +                       .n_regions = (_n_regions),                      \
> +               },
> +
>  /**
>   * struct spi_nor_manufacturer - SPI NOR manufacturer object
>   * @name: manufacturer name
> @@ -473,6 +525,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>                              const struct sfdp_bfpt *bfpt,
>                              struct spi_nor_flash_parameter *params);
> 
> +void spi_nor_otp_init(struct spi_nor *nor);
> +
>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>         return mtd->priv;
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> new file mode 100644
> index 000000000000..4e301fd5156b
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OTP support for SPI NOR flashes
> + *
> + * Copyright (C) 2021 Michael Walle <michael@walle.cc>> + */
> +
> +#include <linux/log2.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +#define spi_nor_otp_ops(nor) ((nor)->params->otp.ops)
> +#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
> +#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)

I don't like these wrappers because they gratuiously hide what's really there.
I find the code more easier to read without these wrappers, because I don't 
have to memorize what these wrappers are doing, and I better see how the code
is organized.

> +
> +static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, int region)
> +{
> +       const struct spi_nor_otp_organization *org = nor->params->otp.org;

how about s/org/otp_org?

> +
> +       return org->base + region * org->offset;
> +}
> +
> +static size_t spi_nor_otp_size(struct spi_nor *nor)
> +{
> +       return spi_nor_otp_n_regions(nor) * spi_nor_otp_region_len(nor);
> +}
> +
> +/*
> + * Translate the file offsets from and to OTP regions. See also
> + * spi_nor_mtd_otp_do_op().
> + */
> +static loff_t spi_nor_otp_region_to_offset(struct spi_nor *nor, unsigned int region)
> +{
> +       return region * spi_nor_otp_region_len(nor);
> +}
> +
> +static unsigned int spi_nor_otp_offset_to_region(struct spi_nor *nor, loff_t ofs)
> +{
> +       return ofs / spi_nor_otp_region_len(nor);
> +}
> +
> +static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
> +                               size_t *retlen, struct otp_info *buf)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       const struct spi_nor_otp_ops *ops = spi_nor_otp_ops(nor);
> +       unsigned int n_regions = spi_nor_otp_n_regions(nor);
> +       unsigned int region;
> +       int ret, locked;
> +
> +       if (len < n_regions * sizeof(*buf))
> +               return -ENOSPC;
> +
> +       ret = spi_nor_lock_and_prep(nor);
> +       if (ret)
> +               return ret;
> +
> +       for (region = 0; region < spi_nor_otp_n_regions(nor); region++) {

for (i = 0; i <  n_regions; i++)

already indicates that i is the index of a region, no need to have an explicit
name. Also, if you want to introduce a local variable, n_regions, use it here
too.

> +               buf->start = spi_nor_otp_region_to_offset(nor, region);
> +               buf->length = spi_nor_otp_region_len(nor);
> +
> +               locked = ops->is_locked(nor, region);
> +               if (locked < 0) {
> +                       ret = locked;
> +                       goto out;
> +               }
> +
> +               buf->locked = !!locked;
> +               buf++;
> +       }
> +
> +       *retlen = n_regions * sizeof(*buf);
> +
> +out:
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       return ret;
> +}
> +
> +static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
> +                                     size_t total_len, size_t *retlen,
> +                                     u_char *buf, bool is_write)

not related to this patch, but the list of arguments is quite big, maybe
we can update mtd to pass a pointer to a struct.

> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       const struct spi_nor_otp_ops *ops = spi_nor_otp_ops(nor);
> +       const size_t rlen = spi_nor_otp_region_len(nor);
> +       loff_t rstart, rofs;
> +       unsigned int region;
> +       size_t len;
> +       int ret;
> +
> +       if (ofs < 0 || ofs >= spi_nor_otp_size(nor))
> +               return 0;
> +
> +       ret = spi_nor_lock_and_prep(nor);
> +       if (ret)
> +               return ret;
> +
> +       /* don't access beyond the end */
> +       total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
> +
> +       *retlen = 0;
> +       while (total_len) {
> +               /*
> +                * The OTP regions are mapped into a contiguous area starting
> +                * at 0 as expected by the MTD layer. This will map the MTD
> +                * file offsets to the address of an OTP region as used in the
> +                * actual SPI commands.
> +                */
> +               region = spi_nor_otp_offset_to_region(nor, ofs);
> +               rstart = spi_nor_otp_region_start(nor, region);

Maybe it's just me, but I don't like the helpers :).
Especially spi_nor_otp_offset_to_region. And spi_nor_otp_region_start()
is used just here. Maybe discard them and s/region/i?

> +
> +               /*
> +                * The size of a OTP region is expected to be a power of two,
> +                * thus we can just mask the lower bits and get the offset into
> +                * a region.
> +                */
> +               rofs = ofs & (rlen - 1);
> +
> +               /* don't access beyond one OTP region */
> +               len = min_t(size_t, total_len, rlen - rofs);
> +
> +               if (is_write)
> +                       ret = ops->write(nor, rstart + rofs, len, buf);
> +               else
> +                       ret = ops->read(nor, rstart + rofs, len, buf);
> +               if (ret == 0)
> +                       ret = -EIO;
> +               if (ret < 0)
> +                       goto out;
> +
> +               *retlen += ret;
> +               ofs += ret;
> +               buf += ret;
> +               total_len -= ret;
> +       }
> +       ret = 0;
> +
> +out:
> +       spi_nor_unlock_and_unprep(nor);
> +       return ret;
> +}
> +
> +static int spi_nor_mtd_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
> +                               size_t *retlen, u_char *buf)
> +{
> +       return spi_nor_mtd_otp_read_write(mtd, from, len, retlen, buf, false);
> +}
> +
> +static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
> +                                size_t *retlen, u_char *buf)
> +{
> +       return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
> +}
> +
> +static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       const struct spi_nor_otp_ops *ops = spi_nor_otp_ops(nor);
> +       unsigned int region;
> +       int ret;
> +
> +       if (from < 0 || (from + len) > spi_nor_otp_size(nor))
> +               return -EINVAL;
> +
> +       /* the user has to explicitly ask for whole regions */
> +       if (len % spi_nor_otp_region_len(nor))
> +               return -EINVAL;
> +
> +       if (from % spi_nor_otp_region_len(nor))
> +               return -EINVAL;
> +
> +       ret = spi_nor_lock_and_prep(nor);
> +       if (ret)
> +               return ret;
> +
> +       while (len) {
> +               region = spi_nor_otp_offset_to_region(nor, from);
> +               ret = ops->lock(nor, region);
> +               if (ret)
> +                       goto out;
> +
> +               len -= spi_nor_otp_region_len(nor);
> +               from += spi_nor_otp_region_len(nor);
> +       }
> +
> +out:
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       return ret;
> +}
> +
> +void spi_nor_otp_init(struct spi_nor *nor)
> +{
> +       struct mtd_info *mtd = &nor->mtd;
> +
> +       if (!nor->params->otp.ops)
> +               return;
> +
> +       if (WARN_ON(!is_power_of_2(spi_nor_otp_region_len(nor))))

Why WARN_ON and not just a debug message?

Cheers,
ta

> +               return;
> +
> +       /*
> +        * We only support user_prot callbacks (yet).
> +        *
> +        * Some SPI NOR flashes like Macronix ones can be ordered in two
> +        * different variants. One with a factory locked OTP area and one where
> +        * it is left to the user to write to it. The factory locked OTP is
> +        * usually preprogrammed with an "electrical serial number". We don't
> +        * support these for now.
> +        */
> +       mtd->_get_user_prot_info = spi_nor_mtd_otp_info;
> +       mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
> +       mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
> +       mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
> +}
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
