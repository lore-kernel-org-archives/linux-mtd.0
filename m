Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C16C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 08:45:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB379610C8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 08:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB379610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghGK7WghhPekn+li+qxnD+LXWnTz0+b+C3FdswgK4i4=; b=cIsa1uP7hza0Vt
	VkMKgeR2OGSEHEubxSW9M4kNY1b+0/0bDRcwKdBNDOBMPO2nlFhSg9EuneDCCctUOI39PjTOnvRNP
	F8ZCF4KnKMWji9nDIAyEQNKu0M0azwNq9Mt6nPYKLLAOw9+7vPmjOgMM6r5mE8QMxLLnz9465EH5X
	+WTNmYmD+TkLeWhNW+IYgbSs3QHjOGmbY+qCohjCgl7BHQeWRciA3+ihqDGux6+LcHTqdROPk+aFl
	m5NCHrppevRW1iL0uFBXr+/x0fpQQ/3j8YnnuFmD4tPio/wtWImHzu8zwgPq3rw6pp1a8IILKvvo0
	/WbIxM0r1lBaqW8xxBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdThA-006t1L-Ps; Thu, 21 Oct 2021 08:45:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdTgo-006stZ-Bp; Thu, 21 Oct 2021 08:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634805882; x=1666341882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oigCqIDYipjhB9KT13NuYhtG7va5IkxNMri5h5jHq1g=;
 b=RV1jXM9ue9SvtUUZxvoFLMoEZDuFFGHsaTl9fF7pieLNyd2VJgxdiBZV
 W/bwNoZ7PRg8eANJvSCQlx8lzYiOpBRRVPH1Ka94Ojiq50Pgjoa49WyPe
 Ik0M3XyoblNzhQ2KfGWPfQpcZv8NKD/FtiWFMtvPSq0jtDnpCgC5Fk01f
 lgBgKiBC4wypN1Jn2x98NLhif0ykjrhOPinYa2jjJGPGS1jDj0fe8fxnR
 RKWD6ah4Y+ktGfm4cdaswm6MIP2hm8kbDZtg02PJeGmYwvUTQxEZ/sFcN
 TNeTOgNORev8u+jRULJMh9aS4gTTV6gXy8bqYIHoSp8RHehn2emiP/kO3 w==;
IronPort-SDR: eC/B2yPs6grH0A2CXHHrufkx+Dk2UUdgpRCbbtKbl/FrLKjEb4CSs7+nxGnyipPBqw63CNFGAj
 icG/mr6gOokunOCtCn0ze2S7LCI8Xqjh6kG6NbqW9mRTNX+CHr+KKgfWsCQYRSkYzOkwIyn3cW
 5ekHtrQ1yRh5keP8JTX8G5noTWZESKwDHdOlg5yyO+8xWFFinWuBV1+HRXCSuXCrM/fEPNoaVD
 UWVdUAY7fNvSF+TAncukBL/OGt13hwcFGIc0CLVWpibHOCedhzIQXv/i9SjenGo0cMjiLzwud6
 MbhG6ZFli1gwhzXg7BTDj5sy
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="73803193"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Oct 2021 01:44:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Oct 2021 01:44:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Thu, 21 Oct 2021 01:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXcn/ShxkKdxyKKexBWB+1DaJZAgYREs/fSaVtUoXSwnSdElnI4e/0Mm6oFfEoU4ktrBA26Q/5coa6vlNJA9qABc23vJ2ovq8X6khFCdqI/IVeCDS5SlqZYMQO91mLF/JgwzXCgVC9v9z/YPq8p7L9mNP2BspNRdgMr+x2qYjkVW+PXq0+6BuiLptuEw9oYDfwb/vrZ14HdA0V5xraSfEa9xDmaTzW2roLWhWzApDWQ4Cf+BdzbRIu9R7V3H67TkE3dxNQqMCno5vbB/LiaoFz42uE5/nt3o2x56yCua99a9Bum3mZ1Kv+oT/QrMTsUDUiNmzm39ShnvGuSHZUUVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oigCqIDYipjhB9KT13NuYhtG7va5IkxNMri5h5jHq1g=;
 b=l2Cr+idl/k+xO+vdkg3E6n53cIVcsSljXDymV6GsvmsuXLxzcGs4f89og+Pk8JRQXXypMl6Whv8v0MJOUTXs4SFE7Wh8gLUGL5h4XxSEKLsZUFApXvYcKM25hmUxuCU+HPeqCPKDM4k31StvT9pJnRUOoL7iqO9/uj0RW/1yLtEmWJNBHv396yuo1xwSqKwUvZHu/8OxA0ezt6v4zr5yGg7oqbsCfk4HMysZh1DZd6rgtkBhuUVIEcLDILorgUh4t/h1YFKxFTV0GX5SRk5iMoLRN+8rIzRnDnSVUHarp8k5MAMxKguB9dxQW4vbffpek72vHVSaKoh0itMxgOIU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oigCqIDYipjhB9KT13NuYhtG7va5IkxNMri5h5jHq1g=;
 b=a829VclJV2a0teZYcA94te8xNyrMpYCl2ieTIf9kzw1nDvnV/13lAVThbPXPGM0MedjtSrDc4K8UUW8EqmeMPDP8GjRkjFyoqnYpI79Iz+kYFQn8Wlg4jKKF8uw+5wbN07uA6yU0XpdRcWRcQ4A0idV76brG888HT8xoduJhd4w=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3391.namprd11.prod.outlook.com (2603:10b6:805:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 08:44:35 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 08:44:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Topic: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Index: AQHXuM5x3Sn1HTf2W0qinCbUxi2imqvdPiEA
Date: Thu, 21 Oct 2021 08:44:34 +0000
Message-ID: <208ed4a3-fd89-9efb-6dd6-6bddc5c1d818@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-19-tudor.ambarus@microchip.com>
 <20210817121626.5vcwuluheqfqrqc3@ti.com>
 <d7d7b602-0c42-dc14-71f5-9b89303a0941@microchip.com>
 <20211019172623.hi5c4i274bv3lnqw@ti.com>
 <e3e5c59e-08c0-07c7-e77a-5edfc3502388@microchip.com>
In-Reply-To: <e3e5c59e-08c0-07c7-e77a-5edfc3502388@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 011f8405-0a39-4e50-e836-08d9946f0245
x-ms-traffictypediagnostic: SN6PR11MB3391:
x-microsoft-antispam-prvs: <SN6PR11MB3391DD54315E2651D1114152F0BF9@SN6PR11MB3391.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iaQh2rkFZzhKRfaro6P3JnmLekNsPLxhDl7ZFerkbptIRapgse9vqBZ/A0msLm7zOZ1leBX7XulPwd30dsNuPqLG6thMRQj69bFJ8ibuh/SVg5l1E10ywKVY6DXaUJVaIo/GGhtUvvBsS1Cmf9Ek+Wg95pF250Bo1+0xuqpnOiBhPAOSVAWTqe3u0t/l3P1dSd1ffEGaoN2D1uwKY+15glAkg/kK21pNUFVZO0hP+9Z3jloIv00FG1JoZCebFq2WJ5Re9ja14yn8B3nMdZp6BZ2nJwKXe3qhXjtD5PuvEhCl7GMFdzEiKZpXsivTxKJh6KqtT4GrSitGbe+WzzhJMQQa0/YtekbdJdOAUpZLB/Hp8UnYhbLcRNqeWONli3H6yDbckH/4b3ISBkLQ59O3nyJM/BcPve4KrVP9iytBXUB7EgfM027ZjClxExiY680MMSeKNGWIHAVb3E5rFnFkM19sBM7L68RHSMKRidrTKaSldQAzXQa9731YrVs9eGQOzgXwavhbwSD4HWHGL9mfZuhD0FGtBQAL5jFeLeyJgg7IOHsHjq1Z8Ev2RSOgABXAMnhVtQtj8Qjg4tEFgHoNCpAE25x2hHszCBgTHsxI+Ha4319oXAFuc3jjiCFDwP+ecL+4wjfo3cLkaSW6H7m2oMSf5+9hPiuWK/LsOgzNKn9JOXz+rgNibAP3G6nTMgkbqzRV/1VXJZAl6iwFMHt8efgh5p//V1BEpc3QNiNiJrHA83/i3UqMt3VYRrOwHe0pri7aoC9RzWNknkBNC3tAEe8XRs7imAxagu15hORvnk4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(86362001)(186003)(26005)(6486002)(5660300002)(31686004)(6916009)(316002)(6506007)(53546011)(71200400001)(2616005)(7416002)(31696002)(8676002)(83380400001)(91956017)(2906002)(64756008)(76116006)(66446008)(8936002)(6512007)(66556008)(122000001)(38100700002)(36756003)(66946007)(66476007)(508600001)(4326008)(38070700005)(26583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXFYMHlWYW82c2x4N2oydm81bzI1WXljNE5rYWVoaGdBaExMdEI3a2drUjhp?=
 =?utf-8?B?akV1USsvN0JDcVRhMWlXamYrWmNtMjd1amJERSt5eXUyTnVqcVI0cEpGMVQx?=
 =?utf-8?B?cytjeUhsTFZmVmJhbUM5MGZKK1pvZU4wSVFwNFMyenVmS2VxMGsxTnJlVlUy?=
 =?utf-8?B?Q2RncUk0dm5CUWNIa3IrRW5mOUp4UjEzcmwxWVNEL3BGWmNGaUF1ZGtObkpD?=
 =?utf-8?B?dXVRMW1zZWlzdHFnNklJTXdFbGdzMmNxUW5zcDA3WDhrUkx4MjZkSUNjQ01N?=
 =?utf-8?B?MSsycWJPSjN5L0JObDR3TktUcSs1MkgrS2xrZjl5OEpRdWJiZTh5K29SZFVN?=
 =?utf-8?B?VThkMmxJNW5xbUtoN2pxRHNrUWFxQlJRZWYrUCtCd2hIdmF2ZGllWDV6MHYx?=
 =?utf-8?B?cWZzQml3NzJIZ3NrZElKcEh5R2tGYVJhUEdReFJQSjIyOHFnbzhTYUlqOS83?=
 =?utf-8?B?Q3QxSkd3aTlFSGs1Nk1oZ0ZRdGh6RElTN0xwK3QyZUpBTGJQVzk3VjFKVjgv?=
 =?utf-8?B?dDJYc1Q2d0o4WElPUXFxQmRQR1oyVEZ2aUlMVzNSa21lUjJVaHpDMlR6OXpt?=
 =?utf-8?B?UENIaittS3dxa2kvSVZIejg1czVqS1pCUC96TFZpQ2lyeFZWS3R1RStLdFdS?=
 =?utf-8?B?N1k0aVRMZ0dhdEdCNVdFUnRWWFdQN2ZEb2xNZHpuQlNncGtrUkZyKytJSzI1?=
 =?utf-8?B?N1l4YVErT0NNb3B5MWVCS25BalgzOHByMjM5WnVxMDB5MWQ4OERBdlRpaE1Y?=
 =?utf-8?B?eHQycTlHcllWT08zOWZvV05PM29ZUXBYMWlTandqNTNlNGEvbmZtcUYrallI?=
 =?utf-8?B?YXZwUklYMWtLVTNzeTluaWdwUXdNOUZlQ054QVM2SjVJQ2JWcENvNVlHYmpV?=
 =?utf-8?B?UmN2b3ZJM3RwWFM3Rm0xREFJdnpZK2Q5RzdJb05zeWJ1YlVGTitxR3hqcnU4?=
 =?utf-8?B?Qi8xeTdIbGkxY21MdHR4NzVUZVg5UHJMZ0xOL09OQnllVlZxS0pKVXdLQVpS?=
 =?utf-8?B?S3R2MCtFcGhKa2M2eFFPZFJhT2FIRUQ4dGNzVlRoaWprTmthaDQ0RTczNGRR?=
 =?utf-8?B?NXc0aXpaNUQreXh0TUFYZUl5QjF2MU85c0xmUTRrc3VGUFpSMnh0Sk9mdXdn?=
 =?utf-8?B?aHhHUXhyMUIrRHBGL3lXSlhCSHdnT0lCNUZWMTJnWDVRRitramFDelRpdUtr?=
 =?utf-8?B?OEtLWEZpelJ6QUVIdzRxbDJyOFc2emVYUEY0TUUrdDVBK2FDMlBYemd2dFc5?=
 =?utf-8?B?bVJ2dkxHRjFxZDRObDNvTHFyalhkM2J3WlFnTGRlS3liblZzdWxyRkFjb1A1?=
 =?utf-8?B?RFBzNWNteERrS2FYVTBjbWZxb09UWnFRN2ZoTlhQQzRuYXE0Z3diN3RPKzl4?=
 =?utf-8?B?L21VMFlZcVRwUHdOWGxaczAyUzk4ejFGOWprMnlLdkQ4UjJ5cDBzdHJlM3hQ?=
 =?utf-8?B?b1VJTktIbTR6aHhGbWFTRTB1dHBQYThsam4zcnAwYWEwczl4bkJCZ2N1R1Ix?=
 =?utf-8?B?ZTBSYWJZS0JCNTU0RzgrS0FDeW53SGRIdlZ6YnBZcTkxSkxZdkF6QWJXaGEz?=
 =?utf-8?B?NlBSYUpjOXZWaHdKR1JrWjFGNFpRTjdjMGpyb2t2TTYreUdkeEs3TUFUNCtH?=
 =?utf-8?B?V3MyZldaMm81RjYzRWF1Z3NISllNM21BSUYwWkpZY1Q2M2dUN1VyaHp3a2k2?=
 =?utf-8?B?aEhheENMUDhkNTc5cXIxb01XRHBjYjhESFVXSDVERGxqKy80SXltY0pJRTdR?=
 =?utf-8?Q?E0ki6ZNblRrOpSHeJw=3D?=
Content-ID: <B2E2BA1006537A4FA37F7A162D96AE52@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011f8405-0a39-4e50-e836-08d9946f0245
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 08:44:34.9016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3391
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_014442_708777_953CCD5E 
X-CRM114-Status: GOOD (  28.29  )
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
Cc: code@reto-schneider.ch, vigneshr@ti.com, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, michael@walle.cc,
 zhengxunli@mxic.com.tw, linux-mtd@lists.infradead.org, mail@david-bauer.net,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, linux-arm-kernel@lists.infradead.org, jaimeliao@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/20/21 12:55 PM, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 10/19/21 8:26 PM, Pratyush Yadav wrote:
>>>> While we are on this topic, I find this a bit "ugly". Having to set
>>>> late_init() for setting these flags for each flash is not exactly very
>>>> clean or readable. I don't know how the future will look like, but if
>>>> each flash/family needs its own late_init() to set some flags, it won't
>>>> be very readable. We seem to be trading one type of complexity for
>>>> another. I dunno which is the lesser evil though...
>>> Your point is valid. This patch removes SPI_NOR_4B_OPCODES and sets
>>> SNOR_F_4B_OPCODES in a late_init() hook, forcing the reader to go through
>>> the late_init() function to see what's there. As you saw, late_init() can be
>>> used for tweaking flash's parameters, settings and methods, not just NOR flags,
>>> so I would expect that this hook to be present among flashes that don't define
>>> the SFDP tables or for flashes that have parameters that are not SFDP discoverable,
>>> the hook will be there anyway.
>>>
>>> This patch opens the door on how we could handle the flash_info flags. All flash_info
>>> flags that can be determined when parsing SFDP can be removed and use for flashes that
>>> skip SFDP, SNOR_F equivalents in late_init() methods. spi_nor_info_init_params()
>>> should NOT be called for SFDP capable flashes anyway, because in case of SFDP flashes,
>>> all the settings done in spi_nor_info_init_params() are overwritten when parsing SFDP.
>>> 1/ flashes with SFDP will set the flags as:
>>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
>>> 2/ flashes without SFDP:
>>> SPI_NOR_SKIP_SFDP | non-sfdp-discoverable-flags
>>> and a late_init() for SNOR_F equivalents of flash_info flags from
>>> spi_nor_info_init_params()
>>> 3/ flashes that collide, one with SFDP and the other without:
>>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
>>> and a late_init() for SNOR_F equivalents of flash_info flags from
>>> spi_nor_info_init_params(), that will be used for the flash without SFDP.
>>> 4/ individual flash, no collisions, a flavor supports SFDP, the other not:
>>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
>>> and a late_init() for SNOR_F equivalents of flash_info flags from
>>> spi_nor_info_init_params(), that will be used for the flash without SFDP.
>> To me it looks like you can separate these flags into three classes:
>>
>>   1. Whether to parse SFDP or not.
>>   2. Flags that can't be discovered via SFDP.
>>   3. Flags that can be discovered by SFDP ideally but can't be
>>      discovered for this particular flash because either SFDP is missing
>>      or the table for this flag is missing.
> 
> These are the flash_info flags, indeed. Apart of these there are the SNOR_F flags
> which are set either statically (one sets a flash_info flag equivalent when
> declaring the flash), or dynamically when parsing SFDP. Check
> SPI_NOR_4B_OPCODES and SNOR_F_4B_OPCODES for example.
> 
>>
>> With your series, flags from 1 and 2 are populated via .flags in
>> flash_info and the ones from 3 are populated via late_init().
> 
> My proposal was to get rid of the flash_info flags from the 3rd category that you
> described, and set the SNOR_F equivalents in a late_init() hook. This way we also
> control when the SNOR_F equivalents are set, late in the init call. But this can
> be achieved with your proposal as well, let's see.
> 
>>
>> Why can't we have 3 different fields for these 3 different flags? In
>> flash_info, we can set .parse_sfdp to true/false to indicate SFDP
>> support. We can set .nonsfdp_flags = X | Y | Z for non-sfdp-discoverable
>> flags. And we can set .fixup_flags = A | B | C (can probably pick a
>> better name) for the flags that your series sets through late_init().
>>
>> This way, you have a clear separation between the three and they are all
>> clearly visible in the flash entry itself.
> 
> The downside that I see with this is that we extend the flash_info struct with new
> fields and the spi-nor.o's size will increase whether the fields are used or not,
> as we have lots of flash_info entries. This reminds me that probably I should have
> put the late_init() hook inside const struct spi_nor_fixups. Anyway, we can avoid
> increasing the size with some flash_info flags masks. We use the same flash_info flags
> entry, but we introduce some masks, to separate the type of flags. Something like:
> SPI_NOR_PARSE_SFDP |
>         NON_SFDP_FLAGS(SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_SWP_IS_VOLATILE)
> these are for category 1 and 2 in your description
> 
> or
> SPI_NOR_SKIP_SFDP | SFDP_FLAGS(SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
> for categories 1 and 3 in your description
> 
> but you can end up with flags like:
> SPI_NOR_SKIP_SFDP | SFDP_FLAGS() | NON_SFDP_FLAGS()
> 
> 
>>
>> The only case where this might run into trouble is when a SFDP flash has
>> a collision with a non-SFDP flash and they both need different
>> fixup_flags. But I supposed that is a problem even if you use
> 
> we can probably solve this by putting the minimum supported flags by both
> and fill the rest in fixup hooks after we determine which flash is which.
> 
>> late_init() so it certainly doesn't make anything worse.
> 
> yes, this is a different topic.
> 
>>
>> I have not given this extensive thought, but it seems to make sense to
>> me, and I feel that it would make the flow easier to follow. Thoughts?
> 
> Both approaches are fine. Your method keeps all flags in one place but duplicates
> the setting of flags, you'll have "if flash_info flag, set SNOR_F flag".
> Mine gets rid of the SFDP flash_info flags and directly sets SNOR_F equivalents
> with the detriment of introducing fixup hooks at flash declaration. Can we involve
> Michael and Vignesh to get their preference so that we come to an agreement and move
> forward?
> 

I'll go with the flags mask idea.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
