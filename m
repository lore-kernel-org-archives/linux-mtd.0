Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4341C0018C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:52:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F4A8206D5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F4A8206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V+OMUzLD16ErsoR8GhcqJ2ZHzVhqiCKcNO6CnE/F2Mw=; b=Qw5uRkP2qTcqB94UofW7CxGeK
	rEEOl+3gAKGV5YaDAbTExkj8FF1ffaKRXuuCpdd9JJndQ7WmVeDeb0Chd3tb8uHGCNtpt8lJglOVB
	amLRpNEZVgBUEfFPtCwU6TcSRf6eDkATAVzwZ/d1TBUq87QrA+UqRx4GX0qP9pEWpo5KxmcLAD9cV
	tDFQpZh1F/nk75ct6s/mm4J1318vow0Ki71dJJk9KmsEfS5w0tIcOufKw1SjFiHDp0+lmLem2XyGx
	N03HdpiaHlC37e+ZfbHvCbsiLyeS71uVxPo65w/D4m0bgW6j4BIRTUu/c8H0TSgNucC9aN0+8SLCT
	eBGxFl+1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpwv-0003wI-FT; Thu, 03 Dec 2020 14:51:13 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpwq-0003vd-Fu
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607007068; x=1638543068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IX0J8C7JadHF8Y0JshTHPUeGW740ENgkRRMlvOeDo1g=;
 b=fnUHO/s/jDLgPIAMSM3LEGtTQOzr/uTrTfdlVcMLOP4YS67YYds2YgHO
 9AQmhyl+SI+e8XPYkh76G+4e0syeFDaA3kSOpv0hy2NhuuPaFQLe8KUj8
 sGSXJ7aDyy4nu3nA57qm6BLSrqwwel4hd54bxukNokrGp8Vz55O61eV2m
 6PJLavlk40z74eRlmGtV8yxq2UCzfsQ6HC4AIF5AnDi6+x+lj5WgbmXXB
 GGiSv5t9XuGt6Oc2fNUNYfFZUPbtCcs9WRyR/bOgMsV7sg5ARraYXwuXN
 gCXzcYnR5wqWSrrfSrQILgAVpLID4iccNWXPu9eUdS8WjoddivOZayx0g g==;
IronPort-SDR: hfJJI9kuRZspnE4Z/RBFmVaUxyvKSmnm6d/G778L3I6duXQXgwbgmufZieYuQuPcNsWIN0Eu1K
 Widjv55+HX5l/I2sIBwA6LCgVHZLW0mtoRma0ZyicR2JUspgvC8gMA1obbmgvQLtbxGWBmI5is
 tyE0EMNd4Etuz22He62nXmlNo0dN9KAi76g6j69AFEM0RqEF0V6SfiUorkAe72TDwWooi2pQjY
 pDxlL8kAktbCOWPctCwYeQbBbo1tUT0Eba/XuJv359FSKDZF7Zg5/jCodS47P6OtlRGyPfxVas
 AWI=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="100750023"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 07:51:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 07:51:05 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 3 Dec 2020 07:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khZ0MvCjfJSK1hICBca9ZL8WJnta4vJBAiEYUWYSAuDxvCohwCxGPWToZZSyNmtAPzp5Uhl/PIhhleqfqK51nY2pBpQWC2wOmS1tLD/tKt8oiUl+ShXpQT7kw5pRn4foWEhaTTIDSNmwKzII2apPdzvQbbWAst2rnBf8ttNSiScb2MJI4pHw3Juq6GiJsQoVWZdJWEcfi4maGDJk7AhHBgshbmO2KU3omGOtB5kCC/G6w4x2U+ycoo8iKPLqMA0MGro6pwWyt/EcIKqN7QoMvBdymvO9jbicqFNd/OfVY3hIHX2EQSc1sOjMKCsCnTUSUwwRWj1SGpteHHV7k43UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX0J8C7JadHF8Y0JshTHPUeGW740ENgkRRMlvOeDo1g=;
 b=VTYf7EGiQPM6VHFIARTSMIr8/gWw87D5dE9YdlzzDs9Gzsvu+ITrJUQBEFreRABWQpK7j0k5Zl97iUrRV9UjCc5Ei601G3SvFjxkxlUJtZdSEvoIxWfTHMPsHK4GeOJrQeQal7vhHR3QiK9y2G7OynhdskGBLybExwlTJrFt5WvTjkkTt7OlvYu9Ta6gjWOnKljHT0+U1/BmZtYqFVSmBdLhUzRqW16BFC6Mp+lEmDVQc8b7vNN5OV2bCVMoiFnRBaNLCcGs1WxOBknUjxrSqgtIG35lG6SI3qdFZzU1xMkzq3h4yAg+Aca0h0/czqr0CrwnmCXtb9a3YczURcou3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX0J8C7JadHF8Y0JshTHPUeGW740ENgkRRMlvOeDo1g=;
 b=R3e98VNvjBWGS5/hSdbVK6j2CtueFHlPn/YZue6CBTHVS0e8YO51cCOP6HI9bDCks4zGAqeeyvA6STvmJbiX5PQDyjorK/osSct2insNkLWHdDRdUXEdUX+007YhPR3k23jH4Oc0QPwdw5VSACuVoMY2VO2lVVwOw9rJtOhz/uU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3022.namprd11.prod.outlook.com (2603:10b6:805:d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 14:51:03 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 14:51:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 7/7] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Topic: [PATCH v7 7/7] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Index: AQHWyYO4fmku6Iz0zUWnjJ8ug2RJ+g==
Date: Thu, 3 Dec 2020 14:51:03 +0000
Message-ID: <22fa3f19-a7e5-5b35-443b-fa387e0e4fc1@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-8-michael@walle.cc>
In-Reply-To: <20201202230040.14009-8-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a826244d-ff7b-41d5-544a-08d8979adb5d
x-ms-traffictypediagnostic: SN6PR11MB3022:
x-microsoft-antispam-prvs: <SN6PR11MB3022C4EEEB6E06F473D781ABF0F20@SN6PR11MB3022.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NAzSwGK+LiKsh+3x75rBqFYbFNhwsiWJjdcmgmIHhSaxpSEKWotlX8vOXKb1MaB3oPnEnULKM55KXejbDzASheODKqscDjkZoABPhChTmQZx11n28MQPPtBQ9KO0sukCLLiHtxz5xbxMstZgceDa4dFMe+2tLzqeUtfW9W0feY/siCuNPw7/sC/ip/PlS8ahbHbKr9oH9i+34MxpOStmX7Pp9J7LTQebNvmWTPrJuZo5bsn1edKmqEiReVzQBEoFpuAe7cvAtPxc8Sn5JJkRotTfEA7F5z1gGFR9pE/TVVwqEoLdo676W09tIy2wYh7vWulJxJ7mEkwUW7K5h/izv764fSw2WlbiaKPIVWl9DJC5Q3nTKEbqAtIoCtKXa8mcBWC42TVYYnt7t0Qc4SUVteSJCxHHdoijcoYXI/5gcMc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(83380400001)(36756003)(30864003)(5660300002)(31696002)(86362001)(186003)(478600001)(2616005)(66446008)(76116006)(66946007)(66556008)(31686004)(26005)(64756008)(66476007)(6486002)(316002)(8936002)(54906003)(110136005)(71200400001)(6506007)(53546011)(2906002)(4326008)(6512007)(8676002)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aUY0T25PeStFTkVvVGZKejhpR01UdmtzY3IvaVBKSExOMnJZQ0phZVZEL3ll?=
 =?utf-8?B?eWczQXpuakt0eFhUb01IdGloV2FHM0xQVURPOXJoNEhLdzdjYUJBR2FrMTVC?=
 =?utf-8?B?eWlPRUh1WjhJVHN5bDVtSEx6UEFmTFM5YndLSWU5Qk5IckxLelMza3F2bXdF?=
 =?utf-8?B?SlZRbEdqQ05rWVB3RmZyb282ZFRDS3dQMStlb3lCb0tZSE1SNTZrT1dWaThF?=
 =?utf-8?B?N1R4N0dPSjdXMFRwcEdLOVduWEd2akYxa0FDMVREU2UxcTRVVmc4TUdCK2tD?=
 =?utf-8?B?bGxRaHJBVU9XZE5VbU9XN2hoWUVTbm5EcGJUT0dMTFJGSWxIak4vTk4wenUy?=
 =?utf-8?B?VWVRUmVlN2hNQVdDcGloQ2tZeFJDcm1YeDdjYVgwV0J3Y3Y1cGxXRHgwMnNQ?=
 =?utf-8?B?L3AxQnpOc0dETHZIUGZhc0twUkxnOTY0L2c3MjJXeE1CYy9NOS9VdW1tTjdk?=
 =?utf-8?B?QTdFSDZqbG1COUErNGtjVXFCWW1MYXZyL3o2Zjlpdk10MzNtNW5vQjAydkRY?=
 =?utf-8?B?VWpsU0dMQVl0MWRXRVl3MkkzRzRNZTNza25XNDhDclNRYVIwY1U5dGM1RzJH?=
 =?utf-8?B?OWpJYWlRQjc2SDVYSnBMNFRxYXBMSkt2a2hiYmUxcEtFTisraTFXR0dHam9i?=
 =?utf-8?B?NUpJUHMwYitXZUt2bUcyQytJWWExa0owVWVtcFV5ckt5NjhNalNtd21MYXdZ?=
 =?utf-8?B?dlFja2h6Mk5neStlT3BCak8xSDNPWnNhUmJzMGFUcnhYUHJEVC81ZzQrOTBB?=
 =?utf-8?B?b2pHTVFkVzJ3WDJ4aEc0ZmtxZk53aGUrMDNpVW9UeW1VR1ZkUjMyaHBzS1RY?=
 =?utf-8?B?dFBYbHZWb1YwdmhGS25qajR0Y2YyMkpmdHpmSkV1SWJRMnpIWTBmZ0JuS2M0?=
 =?utf-8?B?UHpWWFQ2VERvM0gwdVhUeEF2aVYxc3pLaWJKQUpWaGJaTmk1eEtKd1Y0SkhT?=
 =?utf-8?B?eXFRTHZkdkwxRlIvSEFTTUpyTHZtSmlGOFZNWFFsbzNHM1Yrd01oUzZtVG1U?=
 =?utf-8?B?WWJoVGhOYkxNYjAxdmx2YWtnNjliR0FRb1RxR2F1S1ZNQUl4dWF0VzZPc3di?=
 =?utf-8?B?Q0d3ZUVZWnN3MXc1aFBRSUtmZjFoUjIwZnNkNmY3bTAyUEx3WWY0d3RCNHRC?=
 =?utf-8?B?R1hxcm9PZHUwRjY2VTIwYi92TzUrVHF1UG9xeS9NK2Fkdkw5VG9uTk9yZzVn?=
 =?utf-8?B?OFZSZXVBTzhoMlVtdlFkd0lwV2lQMkxVRVFDK1QyZmR6Q2g3LzNSM3NvQmJr?=
 =?utf-8?B?WlNkbmFnbXpSZEx5dGhYOGNuQW5tREpHOVZ6blVWSEVWZStwOWZ2Wk1JbG9F?=
 =?utf-8?Q?s8rmIDF4JxDRs=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <414B97917C72814984A28632748EC1D3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a826244d-ff7b-41d5-544a-08d8979adb5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 14:51:03.2605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GlBzbFA85RUNyi2O6hwU4Y8X6bxxYrE3vgJyU3dgVjSmopK63PQYc9Kk+H4bzE8lRBMHsR/X4MH0HxZuyIczgXyQGmzFKtBhjCJuMGxg4fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_095108_872101_3BDCA8AF 
X-CRM114-Status: GOOD (  32.59  )
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

On 12/3/20 1:00 AM, Michael Walle wrote:
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
> behavior (and extended the behavior to other chip manufacturers):
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
> is set on spansion flashes") changed that behavior by just clearing BP2
> to BP0 instead of writing a 0 to the status register.
> 
> Further, the commit 3e0930f109e76 ("mtd: spi-nor: Rework the disabling
> of block write protection") expanded the unlock_all() feature to ANY
> flash which supports locking.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

nice work, thanks!

> ---
> changes since v6:
>  - fixed typos, small documentation changes
>  - changed _WP_ to _SWP_, "write protection" to "software write
>    protection"
>  - use dev_dbg() instead of dev_err() to print message about WP pin
> 
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
>  - add Kconfig option to be able to retain legacy behavior
>  - rebased the patch due to the spi-nor rewrite
>  - dropped the Fixes: tag, it doens't make sense after the spi-nor rewrite
>  - mention commit 3e0930f109e76 which further modified the unlock
>    behavior.
> 
> changes since v1:
>  - completely rewrote patch, the first version used a device tree flag
> 
>  drivers/mtd/spi-nor/Kconfig |  44 +++++++++++++
>  drivers/mtd/spi-nor/atmel.c | 128 ++++++++++++++++++++++++++++++++++--
>  drivers/mtd/spi-nor/core.c  |  23 ++++++-
>  drivers/mtd/spi-nor/core.h  |   8 +++
>  drivers/mtd/spi-nor/esmt.c  |   2 +-
>  drivers/mtd/spi-nor/intel.c |   9 ++-
>  drivers/mtd/spi-nor/sst.c   |  21 +++---
>  7 files changed, 211 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index ffc4b380f2b1..d0f17919de3a 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -24,6 +24,50 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>           Please note that some tools/drivers/filesystems may not work with
>           4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
> 
> +choice
> +       prompt "Software write protection at boot"
> +       default MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE
> +
> +config MTD_SPI_NOR_SWP_DISABLE
> +       bool "Disable SWP on any flashes (legacy behavior)"
> +       help
> +         This option disables the software write protection on any SPI
> +         flashes at boot-up.
> +
> +         Depending on the flash chip this either clears the block protection
> +         bits or does a "Global Unprotect" command.
> +
> +         Don't use this if you intent to use the software write protection
> +         of your SPI flash. This is only to keep backwards compatibility.
> +
> +config MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE
> +       bool "Disable SWP on flashes w/ volatile protection bits"
> +       help
> +         Some SPI flashes have volatile block protection bits, ie. after a
> +         power-up or a reset the flash is software write protected by
> +         default.
> +
> +         This option disables the software write protection for these kind
> +         of flashes while keeping it enabled for any other SPI flashes
> +         which have non-volatile write protection bits.
> +
> +         If the software write protection will be disabled depending on
> +         the flash either the block protection bits are cleared or a
> +         "Global Unprotect" command is issued.
> +
> +         If you are unsure, select this option.
> +
> +config MTD_SPI_NOR_SWP_KEEP
> +       bool "Keep software write protection as is"
> +       help
> +         If you select this option the software write protection of any
> +         SPI flashes will not be changed. If your flash is software write
> +         protected or will be automatically software write protected after
> +         power-up you have to manually unlock it before you are able to
> +         write to it.
> +
> +endchoice
> +
>  source "drivers/mtd/spi-nor/controllers/Kconfig"
> 
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index ee382a44bd0f..2000babc6a81 100644
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
>   * block protection bits. We don't support them. But legacy behavior in linux
> @@ -55,6 +57,104 @@ static const struct spi_nor_fixups atmel_at25fs_fixups = {
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
> +
> +       sr = nor->bouncebuf[0];
> +
> +       /* SRWD bit needs to be cleared, otherwise the protection doesn't change */
> +       if (sr & SR_SRWD) {
> +               sr &= ~SR_SRWD;
> +               ret = spi_nor_write_sr_and_check(nor, sr);
> +               if (ret) {
> +                       dev_dbg(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");
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
> @@ -62,18 +162,32 @@ static const struct flash_info atmel_parts[] = {
>         { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
>                 .fixups = &atmel_at25fs_fixups },
> 
> -       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
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
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6afcb99e9741..235acf3f4c43 100644
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
> @@ -861,7 +861,7 @@ int spi_nor_wait_till_ready(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
> +int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
>  {
>         int ret;
> 
> @@ -3139,6 +3139,8 @@ static void spi_nor_try_unlock_all(struct spi_nor *nor)
>         if (!(nor->flags & SNOR_F_HAS_LOCK))
>                 return;
> 
> +       dev_dbg(nor->dev, "Unprotecting entire flash array\n");
> +
>         ret = spi_nor_unlock(&nor->mtd, 0, nor->params->size);
>         if (ret)
>                 dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
> @@ -3160,7 +3162,20 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> -       spi_nor_try_unlock_all(nor);
> +       /*
> +        * Some SPI NOR flashes are write protected by default after a power-on
> +        * reset cycle, in order to avoid inadvertent writes during power-up.
> +        * Backward compatibility imposes to unlock the entire flash memory
> +        * array at power-up by default. Depending on the kernel configuration
> +        * (1) do nothing, (2) always unlock the entire flash array or (3)
> +        * unlock the entire flash array only when the software write
> +        * protection bits are volatile. The latter is indicated by
> +        * SNOR_F_SWP_IS_VOLATILE.
> +        */
> +       if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
> +           (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
> +            nor->flags & SNOR_F_SWP_IS_VOLATILE))
> +               spi_nor_try_unlock_all(nor);
> 
>         if (nor->addr_width == 4 &&
>             nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> @@ -3459,6 +3474,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>                 nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>         if (info->flags & USE_CLSR)
>                 nor->flags |= SNOR_F_USE_CLSR;
> +       if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
> +               nor->flags |= SNOR_F_SWP_IS_VOLATILE;
> 
>         if (info->flags & SPI_NOR_4BIT_BP) {
>                 nor->flags |= SNOR_F_HAS_4BIT_BP;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7780169d485b..89acf499aecb 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -28,6 +28,7 @@ enum spi_nor_option_flags {
>         SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
>         SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
>         SNOR_F_SOFT_RESET       = BIT(15),
> +       SNOR_F_SWP_IS_VOLATILE  = BIT(16),
>  };
> 
>  struct spi_nor_read_command {
> @@ -329,6 +330,11 @@ struct flash_info {
>                                                  * available I/O mode via a
>                                                  * volatile bit.
>                                                  */
> +#define SPI_NOR_SWP_IS_VOLATILE        BIT(22) /*
> +                                        * Flash has volatile software write
> +                                        * protection bits. Usually these will
> +                                        * power-up in a write-protected state.
> +                                        */
> 
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> @@ -430,6 +436,8 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
> +int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
>  int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
> diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> index c93170008118..cfc9218c1053 100644
> --- a/drivers/mtd/spi-nor/esmt.c
> +++ b/drivers/mtd/spi-nor/esmt.c
> @@ -11,7 +11,7 @@
>  static const struct flash_info esmt_parts[] = {
>         /* ESMT */
>         { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
> -                          SECT_4K | SPI_NOR_HAS_LOCK) },
> +                          SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
>                            SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
> diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
> index 6c31bef3fc60..8ece9cceb3cf 100644
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
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
> +       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64,
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
> +       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128,
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_intel = {
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 0d9d319f61e6..00e48da0744a 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -11,27 +11,28 @@
>  static const struct flash_info sst_parts[] = {
>         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
> -                             SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK |
> +                             SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
>                               SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
