Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA08FC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 14:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8666561407
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 14:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8666561407
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2tzCf87yKLmlXaYrhHn/MdnWHpqbbafKQEIemnOis4=; b=WlC/WtmIHKgZvb
	2MzSATw4sDdb+uGlxPP66Ts88QC76uut3H1/n8i5BTpf0eRp40QlcFrKn93mz7ENaD3zJDDxTyPxi
	AHMIyfcLf4Z2u/CT0oE01dxJKV/4aABeTNvamNTm1aojxgLgTsKLZn58C5hx21ju8fyM64R6F3Eip
	zB3veKARGJvdcV3yMBU66kHVR1h27kq5uh/Iosxgbg/yBh0+5u7JCS9+qBR0GU158Gefsx2JRyqin
	GDEXUtWiy/xCi8YgjMOp3Vt2CO3ZHWR2VLvpthtVRvY3oxtByHcdk2iqGD2obwhZaqWdPdgd1lY57
	GUPQ3I5HT9A3rI8+zeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzPP-001tGS-5n; Tue, 16 Nov 2021 14:26:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzPL-001tF6-Jy; Tue, 16 Nov 2021 14:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637072759; x=1668608759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UhkqWqgVz+Nul8OmVw0CdQRVyq4eeFEvPu/fucVeMq8=;
 b=rrY8d2K9RCUfTWVSLWlhhYDBnAELAEVnMp7/DeIP3xs49hK9qEyrNc5T
 g1JHcs4UDYcBzCZaFJ1IJ9UooZr0FNiw3vRfDxyRqa2tq03RhPJ+3j7ac
 LZvt0udk2TCBI1PIrWcqlgXNZE7syxLIDapZxBgc7RQ1dHw9/M5P1mdlN
 9AcI66BKyLr3sUHTJloj3yk6rQLDAM6QQRE3Zd85ALhZTyDnR3+0/8yys
 ARbyKLNKbbDL5zoCoLeO5Utb2a/5I7FJd3Eir9KWf5g8TrbONQsyZGpuj
 dNGeMhBWEDziEG5OpIxUTgJiJvNuZNVsumPf8yVtiE9vF3LvcpyIyGgbA A==;
IronPort-SDR: nhRt+YKR/EgoAeYj5NbgKl/R0pC4MU9soGD2MZ9/seEJy8CAkAhdDwx8cq8w2VZY+9b3oLJO/a
 aAmEcgBEYun7eLlep24MtdTltdSh8FKHlUDmeTGZehODcHKzrzklx8f0E/8St6uuSqvMX2cF6A
 ZQtn5eLZ2wn/vSCPtnKG1yiVyU5uCE6G0n3UzcRX7YV5BEXpwmN4MPRhibMicutzH0ZwZTdc5r
 I2EQPZjnaCKKh/oGihwn3ufF2ONEimVlsctgkN4+ICpaqTikgHpaMheMlEDpUA+LLvzIowrPLB
 VG1BpFxIa1EQKkG84LOH4p1S
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="139293565"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Nov 2021 07:25:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 16 Nov 2021 07:25:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 16 Nov 2021 07:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awEei5IhSUVfjOpphY0Ad7DRPrt6cH4kS6N/uj14VFIEz57XaLPBLz094WbPRZvLqbt17sRjWxdYi0dN3JuCd/dv1fdhjrk7GRhftRo779Ls+hoDQg2jzCgf1j/6hV5Nu8xuawoTncmj+1lPUoutNTWwfHEftNEHk363Fhb4H+JZ1o+HYXbXOtvd1j7ILQxr9f0OLDBR1lnmfec53sSsM5FeDa5kPYNiJOKTclgxpWvt0MlFWHAnf6gOROyzwsyK0PhSUTs7hDBLLMu/7MPpBP8AsWmZElhvzSQ4vzNNiRT46MAgR8nUGa28+49S+yHymha/qcyedJL2rcaNXUdO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhkqWqgVz+Nul8OmVw0CdQRVyq4eeFEvPu/fucVeMq8=;
 b=QbvqjBygyFqaerP3azHysTBanLKfvQ/crt3oZq5s0rsRz3P0nHiqtZ7ay/4kH+vvvU08CHmiCojdGZNj5/hif+9krwZQv0DHip2xN+L12KiY9fWRlI07ztDGslSkUBzw9Bz3X82vqS0HRJQ8ZnixbXt84LWwu7t7s3s5pr6B15sgsaeXUCMi64SpUFB/8N7w7zYE4j3YYiIZBbmSSuxzcHyvCox0woV7ATaETZfhB+2mlaLCeUvjxumQau5bMtEcDttN0pf78TIYjR+xUmknAzUwGLAvtGvBqZOKojTWn5s5w51eY+BKvznBf++EqVE43LCqtR6Kv7NwLfDFZNeD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhkqWqgVz+Nul8OmVw0CdQRVyq4eeFEvPu/fucVeMq8=;
 b=F0ooi82fxcd29Cm2BdBjfIhiAG5+MnEpd1tYoj4bT0NpSqmXWmNAAjz8HcwQUQkKh0R3oGIwuB/pKHgtort68p61L3yYx6gIfjBEXB6nls7d4IEpA4kY7XyJYq6L4sDixFfvNMqzYAA5ZzAxXeN0kQcjUWC/fX+VDGVsnQZnymQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2878.namprd11.prod.outlook.com (2603:10b6:805:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 14:25:48 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4713.019; Tue, 16 Nov 2021
 14:25:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Topic: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Index: AQHX2vXYBbs1KEiK4kmqIPtsuumDOg==
Date: Tue, 16 Nov 2021 14:25:48 +0000
Message-ID: <f55d2c76-0265-b616-93fe-9b3db8f714bc@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
 <20211115185227.4b4gjnf5zi5bdw56@ti.com>
In-Reply-To: <20211115185227.4b4gjnf5zi5bdw56@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1dfe2cc-a272-49dc-2f89-08d9a90cfc05
x-ms-traffictypediagnostic: SN6PR11MB2878:
x-microsoft-antispam-prvs: <SN6PR11MB2878442E339FD6A251747FB5F0999@SN6PR11MB2878.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o34oS4IoHduwSIqRHy12yt/Vny29x7ufUTxdxJ5Wss1AA9W2Wtu5G3QDmEU8QOF20c7Tw106rguMNCK/1gSWhjZ01/D8u3+g3DXTlvu0g3kUAugxTravtSCgtnLnKLjQfbbpRKUepO78/zd4IJtCwRgVPu2wpgR1nU1Kj9HgLVsqKuJ9zq1VE6nNfS6msBughOCDZLn1QK0An+sdnC1tWOmC8o/wCNWTGPaMQWopE0a6dnLj01oQ65VmmFalXxOD2Kxj18ni0Z2ROSQ7ZHcrvccR+HJ7g8g3vCz32oIfxJTQJQPy3idwZqKAm9j783l8HD/mnk4NLvZN05bBiuoSmdWpUNpwLURpFklCNoPbMRaseRg0oSMWSa4Up+24n6R8gTVdDrCl4MirmsruOmGw+hv5ZMCMa4uDF/I2q6OdGN8YeAcXva9STwmfb1xIDpYZn+V+0yf+D0NyA2R92TafIhfd/VHVqOiUD37wUY8b9Gw18VKictgIivSoybhQPxTVZ7+aHFUAjkQ9Drd7pYYjoSZv6YdIWfFUlHM7KI4HbjLR6xIPptTCWDWBQE4T15brqNEN1zn2IfU1kAIfS+aWr7pcyEIdzzF5y0zGvlZkOOedhIELRGOjnfMJlrqDcyzpIhf0XbbHQeDMZ8e5bsd+D/jFkgpuQ+4hC7xPS69hNfrreNXelnjgWOfq08meWq/lgju1L4DWGPn4TYjfDgoyl7+5XB3MWeFnAlBadohVeFggN/gQwCMVgRXtcu5bgsTilwZhOwjiSAson4eKm8en2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(6916009)(2616005)(83380400001)(53546011)(6512007)(38100700002)(6486002)(8936002)(8676002)(38070700005)(71200400001)(86362001)(31696002)(26005)(66476007)(66446008)(64756008)(508600001)(76116006)(4326008)(91956017)(66556008)(7416002)(107886003)(5660300002)(36756003)(186003)(2906002)(316002)(66946007)(31686004)(54906003)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2M5bTBtZjM4TjZkSFByZkU4UnBnY1haWkNUOFV2SEY4ejhkSVd6OWVzTnZu?=
 =?utf-8?B?TDBscXRTRXMwTTRlS3pjQ2I2RjRTK0thcVo0ekVwVE40RTJ4RUdpQnJNZ09u?=
 =?utf-8?B?dUR1cjVQK3lzYWc5OUwrSkx6SHQ5bkhKanBXWkJvTzgvSnZoa3JUM1ZHVDlx?=
 =?utf-8?B?NytmVnZGaHJRMDJSLzU3aGtyMEhGZ2JEZ01hV2RkVGMyN0llWXdOeE1zWmNh?=
 =?utf-8?B?OFBGUUxxRGdnTFJWZ3J6TEhjVFNJWEhjV0t1MkYrNzBVekFIcG5nV2FEZ1Rv?=
 =?utf-8?B?MHNOdEpCSnVudnhnanRteUxPOEZFRjdlZzlzTmVqRE1ESWJyOGJ3SFZKbTBy?=
 =?utf-8?B?RUh0Tjh6M1JlTi9DTHFrYmdEL1BxaU9CRFJsdkVTT2kzWDNKWVBkZ2Uxdkkz?=
 =?utf-8?B?aUJyY2h0b29hTm5xWHloYmZrbGpuU1Btaml1bTZZQVJjNDdEa1hCRGZDcUJC?=
 =?utf-8?B?R0t5NEptRjQwbnZNK1lFZFI3M0xPNm8zT0c4b0VaS0tiNUNVM3JVdFBCQXR2?=
 =?utf-8?B?MEhoSUpTcWZSdUlvbE9GU3p2MWNpWHhKb2o1eGNOVTJGMkhRNlVOcDlHT0FL?=
 =?utf-8?B?OFJROXd1N0pzU05nNER4eE0rQVduMUhrMTJIRkNrU2YyajRIenhvOUl5NUcy?=
 =?utf-8?B?d0tOMG9zQmh4V2EyKzRDcnZYSUJIaXFpOXFLbENDUHpZa1l6VnNIaFY4ZkQ2?=
 =?utf-8?B?UjNhRGIxUjROaGhrdVFpcGVucGJFMXVkU1NRTktkMXVrK1R1WUtXYVo3UXZa?=
 =?utf-8?B?WXF0U3JQZWNBMk4xVzFhdjVGR2RqM0ZwSFhHaE1DQkQ0YTk1ZDM3NEM0NnNO?=
 =?utf-8?B?ZThldnBqelQyeE5CK3ZDeGpFcnlyZWlhbEY3aGVKSERvOHk5WFI3OC9mV0RD?=
 =?utf-8?B?ZDFHN0t5UkxhMnVEdnVyY05kK2hvRGJQUkd5Z1BFbHYzTzBxUERvRm0rYUNR?=
 =?utf-8?B?M010UU1lcVBoRFY2M21adUFLMzdTTU96ZFJJc1o0TlVhU0xpWXBncnV0Q1py?=
 =?utf-8?B?b0dwZytBOXNoTThpb0xkbDB1Zk44SFlTREo0TUN3Y29QU09oOUtrZGdLQjlL?=
 =?utf-8?B?L3RsWStpZ2hTcEtWOGJadUs5cTdTeTZCTGFTQU9aYjFRZnpUOFQrM2I1MFJ3?=
 =?utf-8?B?ZXFSVElmK04zdHllS2tUK3YzMm9zU1NnVVVvMldxSGZiM1RTNXI4dWNLSzk5?=
 =?utf-8?B?RTlKWkxMSmlRZ29LTTE5U1h1NTVZay9tRk5QSTJkcFR2cEJ3Zys1YWFMUjQy?=
 =?utf-8?B?ZmNHSUxLU1pDZXhGcVlBSXo1cGQ2T29XYTl6akxRbnBBT2dZbGt0UWEzRDc1?=
 =?utf-8?B?cmlEV0pJODh2VVNJekthY2ZHQXRNTVV0RG5lTVFKY1VvU3lpckZHZ3dKQzVJ?=
 =?utf-8?B?aEFjQ056VUNGaXFoN2liNnhsa3MyVTI4WHdnUXgxMmdFeGNiYlJFUjI2WUxJ?=
 =?utf-8?B?T2EwcUNWaWI0YWtpajkyYzlCOHBBMDNCUEZDbXJhZlJzcHJvRFVTT2lGb2V4?=
 =?utf-8?B?UUZYQlJjNkdvVW1yaHJ2cWhKbVVOc0MvcG9wM0w4ZFVOT0l1MUJZWUtVeSt6?=
 =?utf-8?B?TmFGNUdCazZmZ3B6dWp4OThxa25sd2hWZ1pWRUZzeUFUemtJQ0dNMDRwZDBw?=
 =?utf-8?B?UXlsYnVXV3gyMERrQW1GOUt2TVZTRnJNQkNxQkRUbnJ1c2p6bTZuYU1aWE05?=
 =?utf-8?B?NlYxdGxMbmJjeVFLc2xEcVRRNTVLbUtnR2lUUGpsK1ZXMmpMWHNwSmhKSldw?=
 =?utf-8?B?Y05LOFFReUMxYlBQcDdoQ2F4MmxpanNUQ0lZQ3pVZVEybGJ1T2V4S0RNenhw?=
 =?utf-8?B?VkZCM0VaOHFieEF1SUJHZHRRMzFydXdqTFVjOU93cWRxaXhRb1hTcS9KMFhk?=
 =?utf-8?B?cHlQVjVBQ0RndnlkbUJLekdwSDZ4QlEvYWZYSUhaTWNzZU5TcDdXSXYrK0U2?=
 =?utf-8?B?dXM0Q2JlSEpvbTNXZUF4Q2FXYUwwVzUzeC9PZnF3Z2d3QkxlUnJ5akU1dE5w?=
 =?utf-8?B?b3JFZ0dTMDJmdHIyTElOek1PUk1WUXNDd2taQzFlbDZiZ1ptUlk0TXU2U0xV?=
 =?utf-8?B?LzRKa1ZCZUhVUmtRZXVndTJtS2h3VW5YSmgvRDYwQWtqYW1DMFIrUnZka09p?=
 =?utf-8?B?V2duMWRNK2ZmU2s0VVZzUjVWYXNyWFpmOWRRZjQrUVdMNnFuV2t5cjZYbGt3?=
 =?utf-8?B?T1NZUnNFOE81QWdNNVhxem1sVWhrVlFTOEVHaCtoSW5jcEF2UlczU3FqdDNs?=
 =?utf-8?B?eEM1cXRmcEhVWGl3TEpaTVlsWG1RPT0=?=
Content-ID: <D6FB56B82E7C0D4683D997BCFB1F0A5A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dfe2cc-a272-49dc-2f89-08d9a90cfc05
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 14:25:48.0952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pg/3vC4Fhf+BO/xYwQivWZgI2IFDVCoeSDrANGgYx5Aw7skKgRnolbJM6NHKi7kx99diCcEqs0GuWLWh2yPTrKldLYfnN9IHechRG3JtV+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_062559_862142_52420BA0 
X-CRM114-Status: GOOD (  19.44  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/15/21 8:52 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 29/10/21 08:26PM, Tudor Ambarus wrote:
>> Used to init all the mtd_info fields. Move the mtd_info init
>> the last thing in the spi_nor_scan(), so that we avoid superfluous
>> initialization of the mtd_info fields in case of errors.
>>
>> While here use common naming scheme for functions that are setting
>> mtd_info fields:
>> s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
>> s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
>> The functions names are self explanatory, get rid of the comment
>> for the OTP function.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 54 +++++++++++++++++++++-----------------
>>  drivers/mtd/spi-nor/core.h |  4 +--
>>  drivers/mtd/spi-nor/otp.c  |  2 +-
>>  drivers/mtd/spi-nor/swp.c  |  2 +-
>>  4 files changed, 34 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 277d1fde84c8..ae971c773334 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3071,6 +3071,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>>       return info;
>>  }
>>
>> +static void spi_nor_set_mtd_info(struct spi_nor *nor)
>> +{
>> +     struct mtd_info *mtd = &nor->mtd;
>> +     struct device *dev = nor->dev;
>> +
>> +     spi_nor_set_mtd_locking_ops(nor);
>> +     spi_nor_set_mtd_otp_ops(nor);
>> +
>> +     mtd->dev.parent = dev;
>> +     if (!mtd->name)
>> +             mtd->name = dev_name(dev);
>> +     mtd->type = MTD_NORFLASH;
>> +     mtd->flags = MTD_CAP_NORFLASH;
>> +     if (nor->info->flags & SPI_NOR_NO_ERASE)
>> +             mtd->flags |= MTD_NO_ERASE;
>> +     mtd->writesize = nor->params->writesize;
>> +     mtd->writebufsize = nor->page_size;
>> +     mtd->size = nor->params->size;
>> +     mtd->_erase = spi_nor_erase;
>> +     mtd->_read = spi_nor_read;
>> +     /* Might be already set by some SST flashes. */
>> +     if (!mtd->_write)
>> +             mtd->_write = spi_nor_write;
>> +     mtd->_suspend = spi_nor_suspend;
>> +     mtd->_resume = spi_nor_resume;
>> +     mtd->_get_device = spi_nor_get_device;
>> +     mtd->_put_device = spi_nor_put_device;
> 
> You should also merge in spi_nor_debugfs_init() in here which
> initializes mtd->dbg.
> 

I was thinking of getting rid of debugfs entries since they duplicate
those on sysfs.

>> +}
>> +
>>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>>                const struct spi_nor_hwcaps *hwcaps)
>>  {
>> @@ -3125,26 +3154,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       if (info->flags & SPI_NOR_HAS_LOCK)
>>               nor->flags |= SNOR_F_HAS_LOCK;
>>
>> -     mtd->_write = spi_nor_write;
>> -
>>       /* Init flash parameters based on flash_info struct and SFDP */
>>       ret = spi_nor_init_params(nor);
>>       if (ret)
>>               return ret;
>>
>> -     if (!mtd->name)
>> -             mtd->name = dev_name(dev);
>> -     mtd->type = MTD_NORFLASH;
>> -     mtd->writesize = nor->params->writesize;
>> -     mtd->flags = MTD_CAP_NORFLASH;
>> -     mtd->size = nor->params->size;
>> -     mtd->_erase = spi_nor_erase;
>> -     mtd->_read = spi_nor_read;
>> -     mtd->_suspend = spi_nor_suspend;
>> -     mtd->_resume = spi_nor_resume;
>> -     mtd->_get_device = spi_nor_get_device;
>> -     mtd->_put_device = spi_nor_put_device;
>> -
>>       if (info->flags & USE_FSR)
>>               nor->flags |= SNOR_F_USE_FSR;
>>       if (info->flags & SPI_NOR_HAS_TB) {
>> @@ -3166,12 +3180,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>                       nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
>>       }
>>
>> -     if (info->flags & SPI_NOR_NO_ERASE)
>> -             mtd->flags |= MTD_NO_ERASE;
>> -
>> -     mtd->dev.parent = dev;
>>       nor->page_size = nor->params->page_size;
>> -     mtd->writebufsize = nor->page_size;
>>
>>       if (of_property_read_bool(np, "broken-flash-reset"))
>>               nor->flags |= SNOR_F_BROKEN_RESET;
>> @@ -3196,15 +3205,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       if (ret)
>>               return ret;
>>
>> -     spi_nor_register_locking_ops(nor);
>> -
>>       /* Send all the required SPI flash commands to initialize device */
>>       ret = spi_nor_init(nor);
>>       if (ret)
>>               return ret;
>>
>> -     /* Configure OTP parameters and ops */
>> -     spi_nor_otp_init(nor);
>> +     spi_nor_set_mtd_info(nor);
> 
> This will break multiple things.

this is gold :), thanks
> 
> - spi_nor_set_addr_width(), which is called by spi_nor-setup(). It
>   checks for nor->mtd.size which has not been set yet.> - spi_nor_spimem_check_op(), which is called (indirectly) by
>   spi_nor_default_setup(). It check for nor->mtd.size.

Let's use NOR parameters in SPI NOR core, thus nor->params->size instead,
and let the mtd fields for mtd. This will spare us of these problems.
And it's cleaner too.

> - spi_nor_try_unlock_all(), which is called by spi_nor_init(). I don't
>   think it actually uses any values you initialize here but still worth
>   pointing out.

we are safe here, the pointer to mtd is used just to get the pointer to
nor.

Thanks again.
ta

> 
>>
>>       dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>>                       (long long)mtd->size >> 10);
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 223a03769950..48f26d3f1b3c 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -548,8 +548,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>
>>  void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>  void spi_nor_try_unlock_all(struct spi_nor *nor);
>> -void spi_nor_register_locking_ops(struct spi_nor *nor);
>> -void spi_nor_otp_init(struct spi_nor *nor);
>> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
>>
>>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>>  {
>> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
>> index 983e40b19134..fa63d8571218 100644
>> --- a/drivers/mtd/spi-nor/otp.c
>> +++ b/drivers/mtd/spi-nor/otp.c
>> @@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
>>       return ret;
>>  }
>>
>> -void spi_nor_otp_init(struct spi_nor *nor)
>> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
>>  {
>>       struct mtd_info *mtd = &nor->mtd;
>>
>> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
>> index 8594bcbb7dbe..1f178313ba8f 100644
>> --- a/drivers/mtd/spi-nor/swp.c
>> +++ b/drivers/mtd/spi-nor/swp.c
>> @@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
>>               dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
>>  }
>>
>> -void spi_nor_register_locking_ops(struct spi_nor *nor)
>> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
>>  {
>>       struct mtd_info *mtd = &nor->mtd;
>>
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
