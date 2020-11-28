Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCE4C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 10:19:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17812222BA
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 10:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L73bxjDb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="enJ+Rds2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="EFT6GKdA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17812222BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jqv13Aay9zlwmwZ6lDFj5tbqTR6cIpyj97OxQl1A3Ww=; b=L73bxjDbcLas4Qm49H0XL65BA
	E5ZCXae5BMeRd/KZcc5Kv0MhgdgoG2VNLhg4A1FC0IxM2O4Q0in7oTTgJ6XIv0I1jLHdrvcaLDiAE
	bLvsqlUQ6eSw5vy86i1HDJy6GLddoVjK0U7taK+kBbvTCEu0XwhqrRQy/tzGwO1nA9OMpPweYzI9R
	DljHYicTGNjKGH1jUIzGX/LqYnwMNXqpo9ByBqrbN5jo71Btksv3YkgcCyBHsIH8dRgLVQHUhEqCG
	QGJg1DBV58fJeOhaQKS+a4pAGbjVFVl+aU8lSMBoxqZR7vuzIkUC5UrP3i/U8ghq6acYmQPWyANVL
	j2f6+q5UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kixII-0006Qr-1s; Sat, 28 Nov 2020 10:17:30 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kixIE-0006Q5-HJ
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2020 10:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606558646; x=1638094646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zUK7lKqm1/HIcwQxDs8ov1pg/U7VYtZjxlpEvvshpSw=;
 b=enJ+Rds2RkHNM3FYq4RiPt5hZY3X8Yx29oC0Q9aM94mDkarMgNvFSAfS
 wb54HVLFFBxjk0FuGHNhJSplcC80xih/3n2VKn6i1Zipl2siy4g3enVgX
 x4ZnsMfunWRTYJpbga8c6ekHwVu+ld3/MyXRgEDZXxFcuOiHVW8qn7Hi1
 XhwQhAsaQ6TZTm56IIbecJJyOEkrm9Mi0kRQrRM1MPuO6KeZj3+Y9cYXB
 pK3NbvbMM892Fyfd9Un8Yy/LTW67lQKtzEHaQaM+Srd6eNKeOmW/Xroir
 9yllTuCBisqeRPN+29bkUb+7EZyLSm5+S9pYLKpYF9Msg0eCOQxe6e/RU g==;
IronPort-SDR: v+7HzRm6ZU3GkPV64kRGD16/7scyvd2vYdqcHz0ty8cK1vNbtM2HF6uxhNLg4g1GQc3su7FKMi
 QtntPtKQiTji9A9sGVVlUJKzSa/P4fp+hSBTxOSbJIlZVmRM0VAIsC3YFPAUgiJ9Mnxjp8GB+Y
 2w16EzQfeV4aeLyypeGU3GOwUuC2RUorQDPSN05VwYaklmrFmdkaQZGWbsI3MNvgSxDNDdPxrG
 /GDBxxasFqefzcEk7u8xb39h/VRt6Z9CclwDdN3Ncv2A4bObmUcUpear76MugJejgEXlp/I2ue
 Y+A=
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; d="scan'208";a="95101537"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2020 03:17:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 28 Nov 2020 03:17:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sat, 28 Nov 2020 03:17:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj0+pwuggbpCsjwcUV2fbzscL7dk/s2lprGJ2nhjgOWZy9O6ZQ1Cu7txrgrhqUbCbaiOyDzS/dQb47Jc09g2/eTwXLSA3h0ynQzCBTrcXyyLhfmAtqY6orpgyw4iG1FbfaesT8aO7Lp47dTN0AwVXOxyQ1xCS/NPvdKJcf/aH2vgyTV//F/u4dQM4hIu+vDszQR7Emq3N8Su5464H8vd0FlZOX2LAM3299k8O+m2ED/NjhIoMRs9Cieri0TSnxYFDYf2MAghk+1Ox53VzypnCEEFWBEEr+QdCDDG+un8piz0A0dRR9/3tdiqYc/m+vCCingQXfTOaVZg0Yfru8aWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUK7lKqm1/HIcwQxDs8ov1pg/U7VYtZjxlpEvvshpSw=;
 b=jytvcUz6+8g6xs2cBq9s5LJhl+HpvS2QgTG3J7cvaBU0toZkj115qbWzhe4dgzM13Tc2Jf4cFEDjvEImLRWIpfB2JdJPrfMTtFdWNFLBea9xgZtjc8L4bzrWcdDJczBdVTXkuDIBBvXFQLNSOBayRmFpLUBDuJkjQUanDo8FJwd7DRCC09Q8uXEGncA+ywsYccBJFDsYRLgDZb9rRvWSy5cwPzeLKQcs9a7vuHUB+ralQ1AmHCKf/OXuvIyjWplqUvYJ8Uf6oJv9DuDcUm+5KUxIHkMTVkRaLJUPzwA6k1LXLRtFN3ZmD/erQcXnyHc9oFdzfpDZPabWz/hW6kqypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUK7lKqm1/HIcwQxDs8ov1pg/U7VYtZjxlpEvvshpSw=;
 b=EFT6GKdAiC/RwrrVFOWpALIQWFffmgP7BnFgn/ojBkLykBxMpS927ITpHRfJeek4ST/X73gnNZokcYprNhKwlbZmu9ZI8iPM7dy8zWWDVtKl8dhNHCCtbYehGLrRNH9ZiwJafJ0KAQPMeReBIKDji4F6+k9iY+mlFw2RqYMpZ8Y=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Sat, 28 Nov
 2020 10:17:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.026; Sat, 28 Nov 2020
 10:17:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/5] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Topic: [PATCH v6 5/5] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Index: AQHWxW+nmejBYVo+OESi/M9WLE7bHw==
Date: Sat, 28 Nov 2020 10:17:20 +0000
Message-ID: <432b31a7-2560-3b83-44d2-aa82c2e322ae@microchip.com>
References: <20201126202614.5710-1-michael@walle.cc>
 <20201126202614.5710-6-michael@walle.cc>
In-Reply-To: <20201126202614.5710-6-michael@walle.cc>
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
x-ms-office365-filtering-correlation-id: cc047ac6-9203-4686-8071-08d89386caca
x-ms-traffictypediagnostic: SA2PR11MB5100:
x-microsoft-antispam-prvs: <SA2PR11MB5100DD0314617BC992DDD1EAF0F70@SA2PR11MB5100.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cL/rzWhFxHSxl90neM+tOM1ZsQbHV21TBsWggBOhDQ+5yzGVyugXpniTnzQh0u/fYjpc04pMBxPt0RtYxQLecufnFnvmCfqCk7+KUNn8hz8zr8H/iUYCrk+Oe0iwsZBlE0Mwh6L2AIIjttNLnWoSi5n8yOAJaGyPwFMma7XIvzfWn+zze9DhmG6wCcGQZAZb2q+KbZIeE3/D22JTp+1OZD5wescYNHctSUUcP73USaT0Ru8RP5cQBeRSHNquI04P26abbUI64OSsy26D4Einn6EY7zPXe5qh0TOASyNBJqeg1pWY1SjMF7pLaqydQPNY4wTe1r8WU63C9OrwsjA6cmF9eFUP248opZhT7BBrHFf6dE+wz5qptv2gBqXGiX0z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39850400004)(376002)(396003)(6486002)(110136005)(54906003)(316002)(83380400001)(71200400001)(478600001)(6512007)(2906002)(8936002)(2616005)(30864003)(8676002)(5660300002)(66946007)(186003)(66476007)(53546011)(31696002)(64756008)(6506007)(26005)(66556008)(36756003)(66446008)(31686004)(86362001)(4326008)(76116006)(43740500002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q1dZUk4rN2JKbFJxckEycW1FeUVaQTdmRkZuY28xSzNVUXhTNkZsTk9rTTk5?=
 =?utf-8?B?bzdwTjRhdzF0bXB0R0pPV2VxMjBlVzB1b0wwN0ZaSWdYTkpyRHA0ZXdNQXJD?=
 =?utf-8?B?bUl3eWpPd2hndXV0NGRhd3UvY0tBczFtTm1wMWRQN2VxZWNFMjVqbGk4d0Ex?=
 =?utf-8?B?ZHRUQURPYXRFK05MV1VNbUZHOXhiVUFvV3NKbk1WVWtsbmswa3F0KzBzRVhP?=
 =?utf-8?B?YzBNOEpheXFqTWwyUkl2czZsYTk1dUhqdkVkeGlvZ3h3REhyVStMVTBScXRv?=
 =?utf-8?B?dFk1Mk8wZFNuU25TOEFjZkdWM2t4bzI3YXM3cG9TSnZGbEZPZUZFOG9KNk4x?=
 =?utf-8?B?cWp0dm5icUh0Tk5TNDVHQVFpNHdKVFZySzAxV3EvK2ZSakRaZGM5RGdXZkJx?=
 =?utf-8?B?SjYrc1dINXRiVm1zWXZKUUk1d3c3MEZZTTdMZmdoNytCR3dYN212OENBNFNa?=
 =?utf-8?B?N29aMWRoK0t6SHhaVG5CYmkxdkU4NUVtVlpKNHh1MjI4WWNXU0J6ejFlS1N0?=
 =?utf-8?B?c3FxYmNZV0ovdktuTkgyV3Y2ZEZxMEc2cjk5T0s1UERreUhrVlZGUGFQNE1D?=
 =?utf-8?B?ZURyQ3dsYXJFcGl0Unh3K2Q4eDFyVDRoaWlZYkhKK1lXd25INjhpYytxWTVo?=
 =?utf-8?B?NnZyUjZma3ZVQnNoVU9CY3o0MkM5aE91WlVXVC9yMTJRZ0lpUGQ4SldEZWgx?=
 =?utf-8?B?Q01mMVZ6Y3QvdjRiYVBhWG9NVzhhK0dhNy9zb0hSOVhTRzM1a2NYcE5lcm53?=
 =?utf-8?B?eTNiKzBWSFMxM05oaEZwL2Q2UEQwamtINmx6ME1QdTB1TldSeHEwMTE3cHlF?=
 =?utf-8?B?YzJHR0tKTUErTk1pYXRWWkRnVnRDY0JpUUJURm8xR3h5b2RkNjg5bkErMmI2?=
 =?utf-8?B?Z0ZBVmdGMUVlbGtPMk9hd1crbE5rMk0zVlZRSldIOCtacHZtZ0ZMeElIRS9U?=
 =?utf-8?B?bno1VXgrNnk3OThvVnVncW9UVW9hdGFsV2JNMkxLSlozYldqdFg3S2FKUHZu?=
 =?utf-8?B?V250WXBuMmRPNDNhSVljNjA5ZVJhTXJDelBqQVRNRXE2cWc1SE5udkdkNUJv?=
 =?utf-8?B?b3p3eCtndWJuZEpFSjdtRHRUZGNKUnFFNXd5Sjd5UXRNUHFMZ3pwSy9OUWxp?=
 =?utf-8?B?RzBEcGphUXpueWhXeXQ4a3BlWWFNcWZxN3l5SW1EVmN1ZlY3bHNKZFg2Y21z?=
 =?utf-8?B?TGt5YUwyTFl1bE1PcXJaU0tFNWNnMVo1V292N05PVVlhK3M4ZmNvN2tNYlVZ?=
 =?utf-8?B?a3dZdU1RYk9DdnRTak9HRlIrS094dmc2MUxucHFDMDdPTzNReWJHdTJyeWph?=
 =?utf-8?Q?ONh5ZFAEDv0gQ=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F2CBDC5FF8EDEF4088A96B0C631EFADB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc047ac6-9203-4686-8071-08d89386caca
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 10:17:20.7874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BLu+ipo/aZHZMRhDnv9YUKWXVa+iocKYm6jMcHZKxMQtms5GhsibhcjWPdjO4BchDVNIc9gophv8Bh4c2wJcM2lbzB1gZc/u3F43nW7pnOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_051727_056349_B445BAD3 
X-CRM114-Status: GOOD (  33.02  )
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

On 11/26/20 10:26 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Traditionally, linux unlocks the whole flash because there are legacy
> devices which has the write protections bits set by default at startup.
> If you actually want to use the flash protection bits, eg. because there
> is a read-only part for a bootloader, this automatic unlocking is
> harmful. If there is no hardware write protection in place (usually
> called WP#), a startup of the kernel just discards this protection.
> 
> I've gone through the datasheets of all the flashes (except the Intel
> ones where I could not find any datasheet nor reference) which supports
> the unlocking feature and looked how the sector protection was
> implemented. The currently supported flashes can be divided into the
> following two categories:
>  (1) block protection bits are non-volatile. Thus they keep their values
>      at reset and power-cycle
>  (2) flashes where these bits are volatile. After reset or power-cycle,
>      the whole memory array is protected.
>      (a) some devices needs a special "Global Unprotect" command, eg.
>          the Atmel AT25DF041A.
>      (b) some devices require to clear the BPn bits in the status
>          register.
> 
> Due to the reasons above, we do not want to clear the bits for flashes
> which belong to category (1). Fortunately for us, only Atmel flashes
> fall into category (2a). Implement the "Global Protect" and "Global
> Unprotect" commands for these. For (2b) we can use normal block
> protection locking scheme.
> 
> This patch adds a new flag to indicate the case (2). Only if we have
> such a flash we unlock the whole flash array. To be backwards compatible
> it also introduces a kernel configuration option which restores the
> complete legacy behavior ("Disable write protection on any flashes").
> Hopefully, this will clean up "unlock the entire flash for legacy
> devices" once and for all.
> 
> For reference here are the actually commits which introduced the legacy
> behaviour (and extended the behaviour to other chip manufacturers):

typo: behavior

> 
> commit f80e521c916cb ("mtd: m25p80: add support for the Intel/Numonyx {16,32,64}0S33B SPI flash chips")
> commit ea60658a08f8f ("mtd: m25p80: disable SST software protection bits by default")
> commit 7228982442365 ("[MTD] m25p80: fix bug - ATmel spi flash fails to be copied to")
> 
> Actually, this might also fix handling of the Atmel AT25DF flashes,
> because the original commit 7228982442365 ("[MTD] m25p80: fix bug -
> ATmel spi flash fails to be copied to") was writing a 0 to the status
> register, which is a "Global Unprotect". This might not be the case in
> the current code which only handles the block protection bits BP2, BP1
> and BP0. Thus, it depends on the current contents of the status register
> if this unlock actually corresponds to a "Global Unprotect" command. In
> the worst case, the current code might leave the AT25DF flashes in a
> write protected state.
> 
> The commit 191f5c2ed4b6f ("mtd: spi-nor: use 16-bit WRR command when QE
> is set on spansion flashes") changed that behaviour by just clearing BP2
> to BP0 instead of writing a 0 to the status register.
> 
> Further, the commit 3e0930f109e76 ("mtd: spi-nor: Rework the disabling
> of block write protection") expanded the unlock_all() feature to ANY
> flash which supports locking.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v5:
>  - also set SRWD bit for the "Global Protect" command
>  - use spi_nor_write_sr() instead of spi_nor_write_sr_and_check() to send
>    the "Global Protect" or "Global Unprotect" command
>  - mark ESMT F25L32QA as non-volatile as indicated in a newer datasheet
>    revision
>  - rebased to latest tree
> 
> changes since v4:
>  - made atmel_global_protection_default_init() static, spotted by
>    lkp@intel.com
> 
> changes since v3:
>  - now defaulting to MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE, suggested by Vignesh
>  - restored the original spi_nor_unlock_all(), instead add individual
>    locking ops for the "Global Protect" scheme in atmel.c. This was tested
>    partly with the AT25SL321 (for the test I added the fixups to this
>    flash).
>  - renamed SPI_NOR_UNPROTECT to SPI_NOR_WP_IS_VOLATILE. Suggested by
>    Vingesh, although I've renamed it to a more general "WP_IS_VOLATILE"
>    because either the BP bits or the individual sector locks might be
>    volatile.
>  - add mention of both block protection bits and "Global Unprotect" command
>    in the Kconfig help text.
> 
> changes since v2:
>  - add Kconfig option to be able to retain legacy behaviour
>  - rebased the patch due to the spi-nor rewrite
>  - dropped the Fixes: tag, it doens't make sense after the spi-nor rewrite
>  - mention commit 3e0930f109e76 which further modified the unlock
>    behaviour.
> 
> changes since v1:
>  - completely rewrote patch, the first version used a device tree flag
> 
>  drivers/mtd/spi-nor/Kconfig |  42 ++++++++++++
>  drivers/mtd/spi-nor/atmel.c | 127 ++++++++++++++++++++++++++++++++++--
>  drivers/mtd/spi-nor/core.c  |  36 ++++++----
>  drivers/mtd/spi-nor/core.h  |   8 +++
>  drivers/mtd/spi-nor/esmt.c  |   2 +-
>  drivers/mtd/spi-nor/intel.c |   9 ++-
>  drivers/mtd/spi-nor/sst.c   |  21 +++---
>  7 files changed, 213 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index ffc4b380f2b1..11e6658ee85d 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -24,6 +24,48 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>           Please note that some tools/drivers/filesystems may not work with
>           4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
> 
> +choice
> +       prompt "Write protection at boot"
> +       default MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE
> +
> +config MTD_SPI_NOR_WP_DISABLE

Maybe it's just me, but when I see WP, I think about the WP# signal, which is
somehow related. I think I would prefer to use  SWP instead, which comes from
Software Write Protection, which should be good for both the BPn protection
and for the Individual Sector Protection with its Global Lock and Unlock.

I won't stall the series just for this, so do as you prefer.

> +       bool "Disable WP on any flashes (legacy behaviour)"

typo: behavior

> +       help
> +         This option disables the write protection on any SPI flashes at

If you'll choose SWP, you have to update description here and there. For
example s/write protection/software write protection.

> +         boot-up.
> +
> +         Depending on the flash chip this either clears the block protection
> +         bits or does a "Global Unprotect" command.
> +
> +         Don't use this if you intent to use the write protection of your
> +         SPI flash. This is only to keep backwards compatibility.
> +
> +config MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE
> +       bool "Disable WP on flashes w/ volatile protection bits"
> +       help
> +         Some SPI flashes have volatile block protection bits, ie. after a
> +         power-up or a reset the flash is write protected by default.
> +
> +         This option disables the write protection for these kind of flashes
> +         while keeping it enabled for any other SPI flashes which have
> +         non-volatile write protection bits.
> +
> +         If the write protection will be disabled depending on the flash
> +         either the block protection bits are cleared or a "Global Unprotect"
> +         command is issued.
> +
> +         If you are unsure, select this option.
> +
> +config MTD_SPI_NOR_WP_KEEP
> +       bool "Keep write protection as is"
> +       help
> +         If you select this option the write protection of any SPI flashes
> +         will not be changed. If your flash is write protected or will be
> +         automatically write protected after power-up you have to manually
> +         unlock it before you are able to write to it.
> +
> +endchoice
> +
>  source "drivers/mtd/spi-nor/controllers/Kconfig"
> 
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index fe6a4653823d..215df7c4272b 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -8,6 +8,8 @@
> 
>  #include "core.h"
> 
> +#define ATMEL_SR_GLOBAL_PROTECT_MASK GENMASK(5, 2)
> +
>  /*
>   * The Atmel AT25FS010/AT25FS040 parts have some weird configuration for the
>   * block protection bits. We don't support them. But legacy behaviour in linux
> @@ -55,6 +57,103 @@ static const struct spi_nor_fixups atmel_at25fs_fixups = {
>         .default_init = atmel_at25fs_default_init,
>  };
> 
> +/**
> + * atmel_set_global_protection - Do a Global Protect or Unprotect command
> + * @nor:       pointer to 'struct spi_nor'
> + * @ofs:       offset in bytes
> + * @len:       len in bytes
> + * @is_protect:        if true do a Global Protect otherwise it is a Global Unprotect
> + *
> + * Return: 0 on success, -error otherwise.
> + */
> +static int atmel_set_global_protection(struct spi_nor *nor, loff_t ofs,
> +                                      uint64_t len, bool is_protect)
> +{
> +       int ret;
> +       u8 sr;
> +
> +       /* We only support locking the whole flash array */
> +       if (ofs || len != nor->params->size)
> +               return -EINVAL;
> +
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;

maybe a new line in between.

> +       sr = nor->bouncebuf[0];
> +
> +       /* SRWD bit needs to be cleared, otherwise the protection doesn't change */
> +       if (sr & SR_SRWD) {
> +               sr &= ~SR_SRWD;
> +               ret = spi_nor_write_sr_and_check(nor, sr);
> +               if (ret) {
> +                       dev_err(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");

spi_nor_write_sr_and_check() already prints a dev_dbg(). If you find a second message
useful, you should use dev_dbg for low level info.

> +                       return ret;
> +               }
> +       }
> +
> +       if (is_protect) {
> +               sr |= ATMEL_SR_GLOBAL_PROTECT_MASK;
> +               /*
> +                * Set the SRWD bit again as soon as we are protecting
> +                * anything. This will ensure that the WP# pin is working
> +                * correctly. By doing this we also behave the same as
> +                * spi_nor_sr_lock(), which sets SRWD if any block protection
> +                * is active.
> +                */
> +               sr |= SR_SRWD;
> +       } else {
> +               sr &= ~ATMEL_SR_GLOBAL_PROTECT_MASK;
> +       }
> +
> +       nor->bouncebuf[0] = sr;
> +
> +       /*
> +        * We cannot use the spi_nor_write_sr_and_check() because this command
> +        * isn't really setting any bits, instead it is an pseudo command for
> +        * "Global Unprotect" or "Global Protect"
> +        */
> +       return spi_nor_write_sr(nor, nor->bouncebuf, 1);
> +}
> +
> +static int atmel_global_protect(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       return atmel_set_global_protection(nor, ofs, len, true);
> +}
> +
> +static int atmel_global_unprotect(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       return atmel_set_global_protection(nor, ofs, len, false);
> +}
> +
> +static int atmel_is_global_protected(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       int ret;
> +
> +       if (ofs >= nor->params->size || (ofs + len) > nor->params->size)
> +               return -EINVAL;
> +
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;
> +
> +       return ((nor->bouncebuf[0] & ATMEL_SR_GLOBAL_PROTECT_MASK) == ATMEL_SR_GLOBAL_PROTECT_MASK);
> +}
> +
> +static const struct spi_nor_locking_ops atmel_global_protection_ops = {
> +       .lock = atmel_global_protect,
> +       .unlock = atmel_global_unprotect,
> +       .is_locked = atmel_is_global_protected,
> +};
> +
> +static void atmel_global_protection_default_init(struct spi_nor *nor)
> +{
> +       nor->params->locking_ops = &atmel_global_protection_ops;
> +}
> +
> +static const struct spi_nor_fixups atmel_global_protection_fixups = {
> +       .default_init = atmel_global_protection_default_init,
> +};
> +
>  static const struct flash_info atmel_parts[] = {
>         /* Atmel -- some are (confusingly) marketed as "DataFlash" */
>         { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK)
> @@ -62,18 +161,32 @@ static const struct flash_info atmel_parts[] = {
>         { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
>                 .fixups = &atmel_at25fs_fixups },
> 
> -       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> 
>         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
>         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
> -       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8c06a28a90de..8354ce0c8810 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -377,7 +377,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> +int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>         int ret;
> 
> @@ -1049,7 +1049,7 @@ static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
> +int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
>  {
>         if (nor->flags & SNOR_F_HAS_16BIT_SR)
>                 return spi_nor_write_16bit_sr_and_check(nor, sr1);
> @@ -3124,15 +3124,14 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>   * spi_nor_unlock_all() - Unlocks the entire flash memory array.
>   * @nor:       pointer to a 'struct spi_nor'.
>   *
> - * Some SPI NOR flashes are write protected by default after a power-on reset
> - * cycle, in order to avoid inadvertent writes during power-up. Backward
> - * compatibility imposes to unlock the entire flash memory array at power-up
> - * by default.
> + * Return: 0 on success, -errno otherwise.
>   */
>  static int spi_nor_unlock_all(struct spi_nor *nor)
>  {
> -       if (nor->flags & SNOR_F_HAS_LOCK)
> +       if (nor->flags & SNOR_F_HAS_LOCK) {
> +               dev_dbg(nor->dev, "unprotecting entire flash\n");
>                 return spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> +       }
> 
>         return 0;
>  }
> @@ -3153,10 +3152,23 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> -       err = spi_nor_unlock_all(nor);
> -       if (err) {
> -               dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
> -               return err;
> +       /*
> +        * Some SPI NOR flashes are write protected by default after a power-on
> +        * reset cycle, in order to avoid inadvertent writes during power-up.
> +        * Backward compatibility imposes to unlock the entire flash memory
> +        * array at power-up by default. Depending on the kernel configuration
> +        * (1) we do nothing, (2) we unlock the entire flash in any case or (3)
> +        * just do it actually powers up write-protected. The latter is

do it if it actually powers up

How about: (1) do nothing, (2) always unlock the entire flash array, (3) unlock
the entire flash array only when the software protection bits are volatile.

> +        * indicated by SNOR_F_WP_IS_VOLATILE.
> +        */
> +       if (IS_ENABLED(CONFIG_MTD_SPI_NOR_WP_DISABLE) ||
> +           (IS_ENABLED(CONFIG_MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE) &&
> +            nor->flags & SNOR_F_WP_IS_VOLATILE)) {
> +               err = spi_nor_unlock_all(nor);
> +               if (err) {
> +                       dev_err(nor->dev, "Failed to unlock the entire flash memory array\n");

dev_dbg for low level info

> +                       return err;
> +               }
>         }
> 
>         if (nor->addr_width == 4 &&
> @@ -3456,6 +3468,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>                 nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>         if (info->flags & USE_CLSR)
>                 nor->flags |= SNOR_F_USE_CLSR;
> +       if (info->flags & SPI_NOR_WP_IS_VOLATILE)
> +               nor->flags |= SNOR_F_WP_IS_VOLATILE;
> 
>         if (info->flags & SPI_NOR_4BIT_BP) {
>                 nor->flags |= SNOR_F_HAS_4BIT_BP;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 16b350e1d865..6bf86c2994c8 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -28,6 +28,7 @@ enum spi_nor_option_flags {
>         SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
>         SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
>         SNOR_F_SOFT_RESET       = BIT(15),
> +       SNOR_F_WP_IS_VOLATILE   = BIT(16),
>  };
> 
>  struct spi_nor_read_command {
> @@ -329,6 +330,11 @@ struct flash_info {
>                                                  * available I/O mode via a
>                                                  * volatile bit.
>                                                  */
> +#define SPI_NOR_WP_IS_VOLATILE BIT(22) /*
> +                                        * Flash has volatile write protection
> +                                        * bits. Usually these will power-up in
> +                                        * a write-protected state.
> +                                        */
> 
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> @@ -430,7 +436,9 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
>  int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
> +int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
> diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> index c93170008118..d970f6da27c2 100644
> --- a/drivers/mtd/spi-nor/esmt.c
> +++ b/drivers/mtd/spi-nor/esmt.c
> @@ -11,7 +11,7 @@
>  static const struct flash_info esmt_parts[] = {
>         /* ESMT */
>         { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
> -                          SECT_4K | SPI_NOR_HAS_LOCK) },
> +                          SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
>                            SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
> diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
> index 6c31bef3fc60..0bb1e3fd9702 100644
> --- a/drivers/mtd/spi-nor/intel.c
> +++ b/drivers/mtd/spi-nor/intel.c
> @@ -10,9 +10,12 @@
> 
>  static const struct flash_info intel_parts[] = {
>         /* Intel/Numonyx -- xxxs33b */
> -       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, SPI_NOR_HAS_LOCK) },
> -       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, SPI_NOR_HAS_LOCK) },
> -       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, SPI_NOR_HAS_LOCK) },
> +       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32,
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
> +       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64,
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
> +       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128,
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_intel = {
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 8b169fa4102a..5e4450877d66 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -11,26 +11,27 @@
>  static const struct flash_info sst_parts[] = {
>         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
> +                             SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
>                               SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> --
> 2.20.1
> 

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
