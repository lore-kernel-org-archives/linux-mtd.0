Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D538FC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 19:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD5A206CA
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 19:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iQkvW9GE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IfZqN0/i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Ml1iIVzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD5A206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dvXyBVo4tsCzMJAU8mpBspMAkkZ0la/fdCp/35m8Zxw=; b=iQkvW9GE27yGz9zWU7CliXm7j
	SimT+nxVX5FPQ/HfpsjtC/ymwEMWFA4By0g5DdccBxiTlYssAuf3M6WRd5DVd7z4eP292XjGzwt9a
	8pkfv+lnDKMpDpY5prB7DsIeySLvk+oUu6KLdgVCWKm10srLxe66CMrI69Hgx98hqt+0KwNKoh2JU
	Mgb8rSwYtNZpD3D4PMklQ26rnqdv0wRzN4Oys0oPqXkmtxqMl0AaxncqXObbY0YWc/Zj4D0veUML8
	g7GyEkJ+wUOaFV9gOpcyRaLqccoU6MUaM7yFuurF/2+jFYKKwkzyf72X/8oGsrUjUCeTW/bHe2xLA
	TtyKpP9yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kheKo-0001B8-SG; Tue, 24 Nov 2020 19:50:42 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kheKl-0001AS-SD
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 19:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606247439; x=1637783439;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vzHkDAFKz3un0oZtlChrEjrbghI6y1fdwrRsFYMfxMU=;
 b=IfZqN0/ip8I15BwIDfGBTOz+zPu8y71jq+B/fuxXEtBhOwoy5xt2WUz6
 O+CeYsk+QYueLq6NlfXDnBQPtbYSS2JM2Ks8yWlb8WuByO5l00CbbcypB
 6WJ9jgMeGbZMkFeQbUGcoZAxhwmjXMk9JB/AO7fxavlRI8qxNgcL5VC4l
 aUncdoF14Va9CmXrc6v2P+fjQn/jhrDz/3ND8pal6Cq0AqGjAVgOzhJzC
 Ye9gb8pAbLUW53dVlsiKgJ8dGiFodmgO9981tULFK89Ek+bj97mtgWpsd
 8bieM6sQsyiyGRIWk46JnPqPaR+/Yb+gLXw/3rUgXjm5ABoeFXKAALsdu g==;
IronPort-SDR: LKrnLt7Spwvh6rN7fQCqNWbI+M02SswCN9xfM/yN6UCIoE0MWvq8r7YsHXqZfYL6OXZvWXNz94
 uIVzDsCKOnEajv5Oi9ZvydZaQPngzPR0yuki2GeIrYgniiafSjamG0fwIB1wvQQrwFaiiuhTd9
 9l34Mv0T/joBrWA6sHEn/6ds49NwB1YT9TSwTY373QoZ8GGdEun4/gAzSffz4Js1tUrih7Q10E
 Rw0CrGBZA+K45mFeCUQPSDD+vo0kt9kqy77R6BUrhBlx+R5bqU+/r6yifafGphFGLk8PLHc8rt
 guI=
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="100250936"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Nov 2020 12:50:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 24 Nov 2020 12:50:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 24 Nov 2020 12:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClqlqgBCPiSMT5jpuCh9Bc+8P6APlsZO3yHf36/s1/4g4RbAts1citIPfDnyuHBXYEzhDGKLrNfIXpHYJ7LY2YIoDTJ/wAj8GqanFyJwGCo/0J00ZL4co5qQqSYseZyZfm0j+UDhNV/e6uPD65M/7aogDbIwYDyjXUAPlGoz8bdN8Rc1eiV3gufCQlhz0J5EsBrJPE2E1SV+yCuw/U6JGS0VZCRPd5biD3Ncl9YId3P2Lxx66t+OL4u1USTwtq0OlJcsP+O0GLLklp5oyUrqTuGS+LnBRZlyWNz62Cm28mSvFxS1+T1nuaB1gT10BvUdCoKWhGelMBzL+HJc22wOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzHkDAFKz3un0oZtlChrEjrbghI6y1fdwrRsFYMfxMU=;
 b=c/GND6q0xw6eofHZFnMfQa3t3bOVUzVSzyWkboimkyQ2v3wkk38ijDz2Z+4whk4/GSiy9KYZxWuycJGNm0ZEX2Y1AX/K3ffBq7opVZ5XfnIYEYpFpU9poxXjXwOO7ZHsoOj/SzfR23c1sWjaWXf6EJ003f1JaTyAT2l0OFSKhjeqE8b8pqQ9JpSJOj07kk9TekLCaVBwsk4oC/CYiXftImUWGoqOvPrgB9uZ+BG7UJBzTwnG4z+I8esywvsm4g4GJ1lFaVdwcYuCL77Fl69nyIoTRhWQn9mg0BxTLOR6RURL42uIg0W3Few8bLE3qzCjVb/EEgZIrJSl35TPno4DgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzHkDAFKz3un0oZtlChrEjrbghI6y1fdwrRsFYMfxMU=;
 b=Ml1iIVzkwCTPlEviWAJFY9p0UqqwfYkCScLlc/yjUq2RjHyfJEpbvNEB1FkmJd4rpzjQCOFkOUhhiLLg3RieJDkdRFe9Y9+c8xdm5pQd4/cUYjPIQkrhxEl/CKyePc+d4iEj+2IEnA2dgfpZjn+aZhB3StlawB1n2gYKbuBRo+0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2832.namprd11.prod.outlook.com (2603:10b6:805:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 19:50:34 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.021; Tue, 24 Nov 2020
 19:50:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: sst: remove global protection flag
Thread-Topic: [PATCH v5 2/3] mtd: spi-nor: sst: remove global protection flag
Thread-Index: AQHWwpsROIpE6VaHrU+F0uO9ZMzlbQ==
Date: Tue, 24 Nov 2020 19:50:34 +0000
Message-ID: <e0ad3dbc-0d1f-015b-c02c-c969657a4a4e@microchip.com>
References: <20201003153235.29762-1-michael@walle.cc>
 <20201003153235.29762-3-michael@walle.cc>
In-Reply-To: <20201003153235.29762-3-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb1dfc2c-46e1-4b00-7b87-08d890b2350b
x-ms-traffictypediagnostic: SN6PR11MB2832:
x-microsoft-antispam-prvs: <SN6PR11MB2832E7C37AC0DA18B4F08924F0FB0@SN6PR11MB2832.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ifgs9r8rmqxZOTgudplqZeMbIvU+WJ5xEYNEeQqczv4m5fD8ILrPVJJAculBscmhWEeLgNdYKT2i1JwTc/BZC7cz8SrN+HuvwGd1MIq1OMCXL8H1M9bOL2hjFO9dmuGSfODyGqEQyfzXrrYBU5rRtMW6TQu/ktT6fsOzYwDbKSrEneSlZoSlYNeVtOqr0QXO1OqP+Fwv3EEQl3E6h3nutgTIWdz2vOhSWXZ/B7jaeeujlTmsVxeVBe0M9bMVq6EDF9a3Bt2xjC5WxS8TMjLWshlNNJYGtj3/uRSOAU+Q0AtZ+9vb9QyeIvEBtlDCdQJLCBWip0IsHDbQsgmsgZ2XRqVuF5f48lhAUhRG5Hz+Q5F4BT1znnyjqwJ+jM/r6jt43F904QpSPHV34nakW9oOHN4U9AkptmHoFo1J4v+irE9h9Q2Driv1QWpJ0pRSxmYkt0Ed4jfydbqIU5k1Y9UG5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(39860400002)(376002)(64756008)(71200400001)(66476007)(66556008)(86362001)(4326008)(36756003)(110136005)(66446008)(2906002)(2616005)(5660300002)(966005)(66946007)(54906003)(8936002)(6506007)(53546011)(316002)(31686004)(6486002)(31696002)(186003)(8676002)(26005)(478600001)(76116006)(6512007)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VWszZGF5MlBZZlRmVGlZQkNiWjJ5MlA0Q29wM2F4aUlhZzlwN1E4eTRWRWZQ?=
 =?utf-8?B?dzl2SlJBWGtlZDZVcTQza3pmRlIxODJ5aHlrRXZHdXpmSDFuclNUM2NzU1py?=
 =?utf-8?B?ZU9VY0VCN0czNndBVzZrbzUrM0RCVWpuT0NpaUZDVEpSam9hclhGQ2dDWlI5?=
 =?utf-8?B?YzRYNStCL1doK0tuRWV5eElVaytOSnd0TXRpdXQ5NHJrdURtMFpIMEZRTDli?=
 =?utf-8?B?dS90cWpzRXBmd043cm5kSEkya1JOdkQxZGIyWU56OWw5NzU4ZlJ1QS90bDNq?=
 =?utf-8?B?S2ZQTDAxOWxoNzAvQWJudU9pcG8wV1N6WHJ6U2x6WWt3VjlqWGREaW8vTWhx?=
 =?utf-8?B?dDk0akphMzlXMFVTMm1yc2h1MFc1SG5HYm9TYTlKcVhIZklzNEhsUURObm5w?=
 =?utf-8?B?KzV4MjVZbVRmV0tHVE1qNHNDSHZxdzdscHZhaTY1WU5zRzdyZ29zbEJpeXJL?=
 =?utf-8?B?NEw3RmFBWDdRV052UjVLNGlqZk80K2Z6OGRxQWVkTFduSWVNc2svVnpqZlRZ?=
 =?utf-8?B?RS9Td25PdE1lbThBcUQrMjg2MW96UE4vblE2UzhVdkR0M1BiM1VhU1EyNkUz?=
 =?utf-8?B?MWVxYjkyM0c4cFNPNFRSUEVzcUFLVTJFUHdOTjUrazZIcWVEMDlxYVVNOHV1?=
 =?utf-8?B?MnRPS2Z0ckJtOFRTQ3hJb3o1dzAwU2V4Q2VHSE0xb0w2RTdwM1NXK051ajF0?=
 =?utf-8?B?ZTI2RUpyQmFHd2hlYzVQY3BNdnBZYVpoTTNGcng4dWw3eHowcWc1RTh2RGZB?=
 =?utf-8?B?NTBTZUQycXhqblJoT2dVOStJUlplc2ozZW9SbUc4aHRGb3RaQmptOHIrckpa?=
 =?utf-8?B?OVNEdDhXejd4ZWJkdlVkR0FYTUsyNlUzaG8xWEVHQ1YzMjJGNGtqR3FtTUo3?=
 =?utf-8?B?NFJsd2VwNFMzY052akJ2dTRoUHYzWHRoc0xOMS9Dem9XalZhTno3bGYxdVBJ?=
 =?utf-8?B?UVg2N2w3NTBQZENzczExam12RmVYVnhXdUZVT0VJbUZ5MmF2Vkw4WUZJZUF0?=
 =?utf-8?B?U3A5blB2U1JsWTAyakpyQVVIU0ZicGxEYmZXVytFeEI1U3F5MlpsQzhCclpL?=
 =?utf-8?B?VUpMMUdwc0NOVlJ0YXNyL2Y5eVJ5K0NsNW1yQ2V5bzUyVjdLWHdORmhwZERF?=
 =?utf-8?B?Nk01bitEZWVqaHhaS05ZNmxCQmd5UUp4SElNRUdOamxxalNjZHFEckJwQnlJ?=
 =?utf-8?B?RmhLNXRzWFZFaTBOakZIWjdGNmZQTG1UZGNMa3ZZRGttZWF5Y1MyVUFXUzVI?=
 =?utf-8?B?Z2NkeGFUM2FndW10ZUQ1ZUkycmRIRUgxN1dHZUlxNzRzL2pXcG5GZ2VEUytZ?=
 =?utf-8?Q?SEcWUrVnaoVBU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <BB2F3292A122E649899F2E0FF45C81CB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1dfc2c-46e1-4b00-7b87-08d890b2350b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 19:50:34.0323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxmbQqiRpXOzt/ocepYYGj/+iFciBS2IbHh4imth7EESUa0d4N+2eFlT2oeH3SFKmEkU23lEwoJEoGL+rHfiZcFPIZcwB8jhrkPlkzdhM0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_145040_157661_EAF826B7 
X-CRM114-Status: GOOD (  24.60  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/3/20 6:32 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This is considered bad for the following reasons:
>  (1) We only support the block protection with BPn bits for write
>      protection. Not all SST parts support this.
>  (2) Newly added flash chip will automatically inherit the "has
>      locking" support and thus needs to explicitly tested. Better
>      be opt-in instead of opt-out.
>  (3) There are already supported flashes which doesn't support
>      the locking scheme. So I assume this wasn't properly tested
>      before adding that chip; which enforces my previous argument
>      that locking support should be an opt-in.
> 
> Remove the global flag and add individual flags to all flashes
> which supports BP locking. In particular the following flashes
> don't support the BP scheme:
>  - SST26VF016B
>  - SST26WF016B
>  - SST26VF064B
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> changes since v4:
>  - none
> 
> changes since v3/v2/v1:
>  - there was no such version because this patch was bundled with another
>    patch
> 
> changes since RFC:
>  - none
> 
>  drivers/mtd/spi-nor/sst.c | 30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index e0af6d25d573..8b169fa4102a 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -11,26 +11,26 @@
>  static const struct flash_info sst_parts[] = {
>         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/DS20005051D.pdf
BP GENMASK(2, 5), volatile, after power up BP0-2 set to 1, BP3 set to 0.
BP3 is "don't care".
SR.BPL BIT(7) volatile, default to 0. When 1 - BPs are read-only bits,
when 0 - BPs are r/w

>         { "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/20005045C.pdf
same as in sst25vf040b

>         { "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/20005044C.pdf
same as in sst25vf040b


>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
> -                             SECT_4K | SST_WRITE) },
> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/20005071B.pdf
same as in sst25vf040b

> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/devicedoc/20005036c.pdf
BP GENMASK(2, 5), volatile, after power up all set to 1.
SR.BPL BIT(7) volatile, default to 0. When 1 - BPs are read-only bits,
when 0 - BPs are r/w

>         { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/20005016C.pdf
BP GENMASK(2, 4), volatile, after power up all set to 1.
SR.BPL BIT(7) volatile, default to 0. When 1 - BPs are read-only bits,
when 0 - BPs are r/w

>         { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

same datasheet and characteristics as in sst25wf512

>         { "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
> -                             SECT_4K | SST_WRITE) },
> -       { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
> -       { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

same datasheet and characteristics as in sst25wf512

> +       { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/20005139F.pdf
BP0 BIT(2), BP1 BIT(3), TB BIT(5), BPL BIT(7) all non-volatile
SR.BPL BIT(7): when 1 - BPs are read-only bits, when 0 - BPs are r/w

> +       { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/20005193D.pdf
BP0 BIT(2), BP1 BIT(3), BP2 BIT(4), TB BIT(5), BPL BIT(7) all non-volatile
SR.BPL BIT(7): when 1 - BPs are read-only bits, when 0 - BPs are r/w

>         { "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

same datasheet and characteristics as in sst25wf512

>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },

https://ww1.microchip.com/downloads/en/DeviceDoc/25024A.pdf
same as in sst25vf040b

>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,

https://ww1.microchip.com/downloads/en/DeviceDoc/20005013D.pdf
OK. sst26wf016b, SST26VF016B, SST26VF064B support individual block protection
and global unlock command.

>                               SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> @@ -127,11 +127,6 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>         return ret;
>  }
> 
> -static void sst_default_init(struct spi_nor *nor)
> -{
> -       nor->flags |= SNOR_F_HAS_LOCK;
> -}
> -
>  static void sst_post_sfdp_fixups(struct spi_nor *nor)
>  {
>         if (nor->info->flags & SST_WRITE)
> @@ -139,7 +134,6 @@ static void sst_post_sfdp_fixups(struct spi_nor *nor)
>  }
> 
>  static const struct spi_nor_fixups sst_fixups = {
> -       .default_init = sst_default_init,
>         .post_sfdp = sst_post_sfdp_fixups,
>  };
> 
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
