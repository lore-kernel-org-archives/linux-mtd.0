Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5667BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:17:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1972961A55
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1972961A55
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18PfcWA71eu7IIMhHKGf6C0+lWd2c5FoK6smUPx0B+U=; b=DnHjma5z6aEExx
	GpOz61XVBuRJGkAmEIb5E6QmhnxV+u7ms7+7Lpviggp6ITAwe2qrnT2UgU8935qYTA9Q8x8v0XUeH
	bJMnGGhe64R3B1H/V12bOFA7ldZlffKj+t863j1ioksFD68JJFNFgJoMEHWN+iqqkoFtxx7gNVqoq
	I2n0LMzwoCmGu7PSmDB7EHUQ852UcW305fitlzfimflzrLoXNEEOtKqPxcgTP9daY94ZBg5dY3+LA
	WNP2/wU4PRzefAJatLo2pgbQ1WsSjLJGqyO1fE5yVvVeneLNCDBNKKlBYWcQht7TH/na2ioDnNdpr
	al5MPgjHhy+q37BgppqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWHTY-000GSM-2K; Fri, 01 Oct 2021 12:17:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWHQy-000FR0-QX; Fri, 01 Oct 2021 12:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633090476; x=1664626476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=khyuN2O48NGLmrooGyOFYB7PM6E59YxCI+H1CxKaq+k=;
 b=D/FlHP3LkebSlPKEBGEIucyRSn9w+0J8G327ihp3CG3dl13gHYfen250
 VGJ6OYSUzuW5Ua4ccFM1WQUcHT0nNI6yL68Qqoe9crCp4a5E2auyPNSeu
 Mrxa3mU3d61hc99GQ4Vjua4IahuD/pYJYuUhAs5F+eA2eWZGYWsEpJEFR
 zh+srnCDDVD6hRyUtXYC6y08xchRtSwdrxgGd6jp3Bu0YbIsaNhQoU8OW
 q9mAfPsMUyLbZEzJOC91rPH0Dc+eRAFzt9ruI/icNpcuJRoLICW0cpd0n
 psHZRmyjY5/WMgSjb3hhIVVk/x82wnz3rclr20c57W59NUMC4Afba7IVl A==;
IronPort-SDR: ELtFFkOVsBC0Mqc2oLiHqvLckCQgtasCvFf/ulXRuSEBFgo3ONqBEDqjHkvkbeQ8HLJtTFnCqO
 GqVVBtpv2JYfvuS/VCyWmLclKVUq6wjvdaTFwQ7+fPnChzN0qdV0cBkpvKvRVt2ILUZbaUrf6+
 RZkkWArZGfASPAiqH6M+4buJ3vXf4jTKZ9bxCjhBhFeedBEuSZTR5UU5gn/HAMIzZ+6MetjS73
 ilIgl31ULrb17grONYDwcY/0p/mXmpPGfhHIGpdHrJimcBWnj6Hj6qsU7rgAtwB/1X7whhC2bd
 iUrYgw9JgPSbDuUJ8XIZXvMf
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="138703697"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 05:14:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 05:14:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 05:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXCGaCxjTyLMlK8+gKGiBNvwuN/UOviwcJoqbcQmKcWlhEEChNSuG3GnBGPWW8nJWkgl0UHcij2vQES+sSXkP2gR7Og82ODzbtwq6xygstZn7EHerjAo3RDlmznGMIOAFAmomT6QwUHSyQ5g5SU7rGwtKL6EucamQw8pLEpNhRNsF0rUtMrczuQcGRMhVvTRZk+p9ukSUTPSD/eYugy2hLAVFQhIjtme6x5fuBtjIWjiQX+9y2dlOc1ALD+xVTuBT0SfyPvLXkwFXoWBTMxllhRtJ/ct9mv09dT4tyJIK72UMgYUnvJQi7I5jjmMlSXOi9s5nGiY5HaH7fid7m5DFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khyuN2O48NGLmrooGyOFYB7PM6E59YxCI+H1CxKaq+k=;
 b=XXk+2tAMZ+Clu+VDUp4NdAsf2UiQAEg4qMDUFrKxV84c+LCZB3yHa0cMnpZYENg0ASP/bd+cnNcCB5AA2XrqYTuVwc21PHM6p4wWmAJKF57wLB50N79tgJQC9fkuoAsvIlKBaBDe8NzYmiN3FeYvK4uBYY4KZmFjJMoXIYM+hDx6IcQ/pTiJAMdhFuoqewMO9IRNPlrmXsn3QG+3ry1GD69o5J8gW5qw/YSpMUugxAz0g/vGO3Jlo4ZnQKFgrkTtWlqQsfXVVtAmICu0Rzm1OW+PNtnUglQpoR+6O6ttfME4uGkUAFAaJl88z2TKUVaQ6B7PyZ1njdt4XgniquSxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khyuN2O48NGLmrooGyOFYB7PM6E59YxCI+H1CxKaq+k=;
 b=aHBl3F7qOH6AyuQ6OKqwGJXf39WE5cX6hU1jXcy6EeyRFvmA22Eadsblz4U6a1bbt2lEpv2ENuLt2/7CQSPsK4e8AnG/J4l8zJhRuVnv2R98ri0oPR/HweqFgI9gGYZFgjt476tibSIt+E8mwH+Rv+6T0uiZHETWB8BMvyR58AY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3200.namprd11.prod.outlook.com (2603:10b6:805:ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 12:14:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 12:14:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 14/35] mtd: spi-nor: spansion: Use manufacturer
 late_init()
Thread-Topic: [PATCH v2 14/35] mtd: spi-nor: spansion: Use manufacturer
 late_init()
Thread-Index: AQHXtr3jtybZpsmONkykmAcfl4hGZg==
Date: Fri, 1 Oct 2021 12:14:32 +0000
Message-ID: <d5f6181f-850c-122f-ebd3-57ac6c3eb1c6@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-15-tudor.ambarus@microchip.com>
 <ebfc420928ef28bb508148b41f55b0e6@walle.cc>
In-Reply-To: <ebfc420928ef28bb508148b41f55b0e6@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 670214e2-9eaa-47ef-73fb-08d984d506e3
x-ms-traffictypediagnostic: SN6PR11MB3200:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3200276760BBC397CB440738F0AB9@SN6PR11MB3200.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MuN3VCnmpNABAYkREruBwjginIuO9lC7amc6ncuSVEdn2gtrpr+ggtcUvPxyvcFM/8Fht1aK7hNFeCv5tHuzTjz8crNwBJUVR2THxGQP9fHlrQ3zvSP1V5URleTIb4go6O6SDv4pnKQdrbTFlKhrUNPfOqycC8/tHLV5cj7lpBj4oKPhQ50ZBsbC1E6w1gNmS02edic0NnifsngFpkRVT0aZGcBWtg0HrZ15pUW0/ncgP0n0NTtM1CAThpCA63CmIGa4wnPi8IPSJFQOT/GtPeLNQfTxX9/hGcz+EeaMu/RMPAmXnWPNQTP196u5KhRx0Le8pTHYRcxdECLRPloX+KiHPG330vJcgT/ajOkB/t5wvTxWOrNw3vdEEu1VYWi4n6tGBS4KlmLFa/VjRTW+rJ8SjymIjEJgcorOm97SHo8+ogoGDoS23cUINyIxWtuYhFiTawX5NEZiXPrJT67VmTc46aULz+Ub7l9zjMSw8QujLJB+9GjH8opcQcGEwV7WLuBSttst5x7D+tU2VcWLFBO0wTHL2Fhiemv8fa7hzZe8FGpTuFmTErgzpEoQgGHlXPeZbU6+w3l3ILFv0WjJvvmS2hBSeqwDX+j74lteiy0ooVnm0MddgOeE25y2ZVu9y5smCNTi1q9SisnE9gUMVto3F7PwU3Z6TFzGimYJPnNTBmukfAkBH/TM8gTHkVvPW4xEBMLXB5Udwgbts/Hk2HfNBK8IpI94TYnKEu/AxXd74gCMapznlThWl+3NBbucZuo7Ndom+v5Bz1IHNNti9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(8936002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(8676002)(107886003)(6916009)(4326008)(71200400001)(36756003)(2906002)(7416002)(31696002)(5660300002)(6512007)(91956017)(2616005)(122000001)(26005)(6486002)(86362001)(38100700002)(6506007)(53546011)(38070700005)(31686004)(54906003)(508600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUJ1ZEhKWjVLaEttU1RORkVIOEVTK0R0cTVGd3cyWGZaMml5SzNERzF0OFRQ?=
 =?utf-8?B?VnpQSnJQSWxtdG9VdHFLL0xQQkJiMmtoczRZN2dUQU93ZnhFRkNuVE15Z2Fx?=
 =?utf-8?B?RVlJSTBneW1Wa3JiNHYxRnFGcWtma211K0g5N08vTzNkNTUrK2I5aTA0c01m?=
 =?utf-8?B?T09uUzJBRDUwbHlCZExDdE1XcEtRaTJsZnpuQm9QZ3Q3VTQ5ZmdLVE5kUXVh?=
 =?utf-8?B?UkQvT1M1LzNZMUtLVHQ0WG96TitJcG5sNlRVZEk3N2NqTTNPNCtLaVkzeXJz?=
 =?utf-8?B?Q3p6V3pzdk4rM0xtd0UvaG5Ca2N0WTQ3dFp2WGlhTG1iamE4WHRUN1RpZVMw?=
 =?utf-8?B?WlZmZUVCMEtrT1lHOGVTMXdwQTliaFRadFlaWHZERmhsRVFlNVFVaTFuQXFQ?=
 =?utf-8?B?ZFFYc2VPWEdudXVSNm9teXREbTJMdjBaUWU0RXN1d2l4Vkk4bmJMeVdaeE9F?=
 =?utf-8?B?VnNRdUFQOUZEdlA5a0RVMVhRa2lrSU5lTXF3cDRHK1VSYW5MZVFDbWcvTmlW?=
 =?utf-8?B?TzhKL1luMjVPM2VJdnJvaDFndHRWUnlYRlludUVYdytBdDR0UEgzK08zRjhV?=
 =?utf-8?B?dE1Ddk9BRkE0N21WZlNyUlhqWThxcEdYNC9RRkxXQlo1bnM4enBZT3B3TE55?=
 =?utf-8?B?a3lKc3FpbkswREhKKzRGQ3JBR0dNWlhybDJZdW1QMnBmM25sUUlobVB0aXdB?=
 =?utf-8?B?V2haTUVCb2tOUjBnWTc1blZ3SHNHeUlpTzI5dDI0Q0N4K1loRlVlNVBiUm1j?=
 =?utf-8?B?ZXM1TXpDZ3ZncWlFYUN0WmRuZDJaMUZ3UzVacXFaVFA3QVQwZnZwQ2NRNWRa?=
 =?utf-8?B?alVkc1RRemVYOXEwcG5QdlpPdHliNGFuYVZOUU1CNUlRY2ZqVS9YMDduYXJ4?=
 =?utf-8?B?cVBWbERMQk1jT2hZSS84L3hwK0NXZnRLRWpHbVdvTHAyNUlJY1ZMT1ZqcU1o?=
 =?utf-8?B?UmNTRkNkRndKdEpaMndhYU1ZcExyVmdqeVAyRVp6d2M0eU9QZmdzMElWQ2lU?=
 =?utf-8?B?VHdIdEl3dG5Eby9iYXFXL2labTFEeHVMTEdkT2xVYTl3TFRCVC9tTm9Iekc5?=
 =?utf-8?B?a25WZEdNMGJwRVZPTlBYbmNtZlZVQkMxQ2hRZ2Ywa2czNGc3UWdiWDhSdzEy?=
 =?utf-8?B?dXlkRG9RMG5KUXJaczQwaE1ZSStoaWlHWmI3bXh0WGVjdW1zcExoMUwxSXg0?=
 =?utf-8?B?VVJaclI0bENySjRYQXlnVWE5UEFrQ1ZhUldiZHZqNXU3dVZ3d3Mzdlg4bjg1?=
 =?utf-8?B?NnVvT3UrNEdyTXhXRWNvZDJxUTd2RE5DN0tGRnBHSWkvUjBGQmFpWjA2TkMr?=
 =?utf-8?B?Zk5tbkM3SEM0dFdrNFVVbkdWbUF1ZFdBbEhPNkdXelQ0S1Vxd1E1R1JDcFQx?=
 =?utf-8?B?ZDZQbE93QlZHZXNNQVVkYytwakNKcVk3RlhEeGFRMHJyMXlZbDVKVDNiVlgx?=
 =?utf-8?B?OWZvY3lYWlFJSW9kenpaZzhFUHJWcUJqb2d3S20zbWxTMkhEeEtzc1dlQlNE?=
 =?utf-8?B?Si9FdFdVTEMrOGttd0trRFp5YkxzSTlmamFJM29leTBIN0RqZFE2WGFBVkVU?=
 =?utf-8?B?MnN5RjN3K1hVSzNnTXAzMTF1STV0NHRpRmNFM3JPandkbzdWWGpoQ1krcHdw?=
 =?utf-8?B?T0FKdXVaUzh0S25wNXVCbHV0SGR6TEp3M1ZVcXRaVStPQXUxNmVNQmNHWEJ5?=
 =?utf-8?B?dVJCNk9nZmRlSE5ick10bisyYS9ZWi8wbit5NWNKYWFOWFdtMjdGQm1tSDBp?=
 =?utf-8?Q?98q90zL3F5SdH1Io44=3D?=
Content-ID: <F3C73643541BE54FB52EB5D15AC91BE2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670214e2-9eaa-47ef-73fb-08d984d506e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 12:14:32.7319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmHLntGAGNBJWFCAyxqs7mR+qdyQnBAiXb9YUQ4W60hKpS/WaJl+STT1swqOdYd69Zz/z4GpjXp0JyOvIPvkteJxiL8w8+CKTtCEABBqRV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_051436_926341_CAC4DE74 
X-CRM114-Status: GOOD (  12.94  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/10/21 1:02 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-07-27 06:52, schrieb Tudor Ambarus:
>> spansion_post_sfdp_fixups() was called regardless if the flash defined
>> SFDP tables or not. A better place for this kind of parameters init is
>> in manufacturer's late_init() hook. post_sfdp() should be called only
>> when SFDP is defined. No functional change in this patch.
>>
>> Instead of doing the 4b opcodes settings at manufacturer level, thus
>> also for every flash that will be introduced, this should be done
>> just where it is needed, per flash. I'll let this for other patch.
> 
> Mh, then why does some flashes define SPI_NOR_4B_OPCODES. It's
> unclear to me when you would use SPI_NOR_4B_OPCODES and when

check patch 18/35, I dropped the SPI_NOR_4B_OPCODES flash_info entry flag.

4b-opcodes support is SFDP discoverable. Where flashes define the 4bait table,
they will fill the support by setting SPI NOR SNOR_F_4B_OPCODES flag. Where the
4bait table is not defined, SNOR_F_4B_OPCODES should be set in a late_init() hook.

> this individual fixup. Also right now, these SPI_NOR_4B_OPCODES
> flags for the spansion flashes are superfluous, no?
> 

there's no spansion flash_info entry that explicitly declare SPI_NOR_4B_OPCODES,
if that's what you meant.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
