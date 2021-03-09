Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EB3C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:50:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74D564EF0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74D564EF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hNo+yoA7vkMh7z/ADS3WkG7jNsPON75/NJz5y1xw5iM=; b=fqu9R/I0nIbTUFqdLMPxCVRs8
	shjxhfBfzob3pf7q3vjECrR46ZBUoHa/3f0aVNtD/zcRHwFDAiIFTeglKqQx7aanghc807cZgaOF0
	SwcY2tyOFLxFpCGwetn9AmlMbUPAvJNJdRv4dHcB/Qs4N3iCOSuWfA6b0//0AlegK2ixIWCdSoAKP
	Janf85kXIJTqDq0BnQ2k67EbvtctUoXSVUBcYF1njfRZ/GwYrkkk+dDEgkaH9oRcTWRtLTprO0QNY
	hOH+XXrrZ9YcdozUFWX8KatGTeh7LnOT5ncdmEYsl+2kdT0cfzBRGgMcrzfLwEOf7+MX+POtBZTik
	wTL6Gwq3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJX7W-003ynO-LI; Tue, 09 Mar 2021 07:49:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJX7J-003ymF-1Z
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 07:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615276160; x=1646812160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J4fr3z5oaigZYRGOWyJ+a9m1vpVpuxyRJ1Vm+sMkIMI=;
 b=CdwfAEpIShgchw8wBW+WM43mHZqR5A666F+0egT6/P0yMHADe98MMDEg
 nUuC/hOsnKew1KLNiaeiBXR2OZR9nT5EN4eM5SvZEtsuSN2Hnsuuih/Qw
 RsZBiv0Yb3hv+1ZhJqU83HsCQ486T0aHUH639iSNkciwW3wXcne/+dBaI
 3pzBX12V48bDmOLUCFPTtTb8wL6t/APypqf5DrLug6A3Zk8J0NbJdg8jY
 hGfbzHUWwgliIRxJpHbbSGIeSypip4BPKUgYOr2BwDjepy4nUvs3nfo8J
 yXqg1XnMJ+Z1cDv+Ri4k6j2s7RevxbBDBsr1R4q5gbyJ0z57/kDPMAFs9 A==;
IronPort-SDR: Y55awzMYn6jWfk4NHBOqPP2Cu62hJ8k8azHehi1sRnospU7bwqi8Wd/q4TV1WKxKLXnNA/VidJ
 B4gdoSglAtBEfTL/0RZbNGuKGLe1+bCZ7IrP7t916kzxlTM5wRo3uzdYQVpg5RQ/q+Ci6LyQ7n
 VYN25R5coWR36pamqmmVCc4MD0ZM9KzgwsCet9NYeM5Mx6lz3aItb7xWhlzFC5WbCEHfqLaKD2
 oxy54MTMwWikeGx6L2sPScebGQftALajMKmo5wbFKNvReYfru2nVTfPV5pbHY4CAV3cOL42BxM
 Qus=
X-IronPort-AV: E=Sophos;i="5.81,234,1610434800"; d="scan'208";a="112484167"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2021 00:49:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 9 Mar 2021 00:49:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Mar 2021 00:49:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juWkul3PcarK0LG+GClJQcb7s/daEOqHnScB++K2GLr5uMg7E+hTq95BesGrl21u35H5WS40oPHVUqo/aWRiyFqohqCeI5z/ZGBjnGEyqsD6G9cSBW44/RmQ6mUuziD4KaWqYcZXjT4y3d75foIXvO/+1oeF5CnzuACDRpMQ3vedLGE5Qg2XwPq8o+TChMTQtGSaKzCKn6VZZKYTRnw+m/49RWlzigLd9epOuVmyOK+A9vw8/L/rqWBELYHytacw6m9ZEbxPmXNNDyRBZaisy1Aiw+fL5u9nfnj1Qp6t6OqskJaAw9Jkhnw0Vm+8UpyZ0mfshvUvwfdNM3hFihYamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4fr3z5oaigZYRGOWyJ+a9m1vpVpuxyRJ1Vm+sMkIMI=;
 b=k3ReRiAny5YEA5nmhuqbshd1+pQzg+uTEit8b7GsLyUfKlzXrdijRAo35xndPSgmrEC3YoPIfZDuW7ESz3fDZAYjRW377rHiU6d9toLBcP5j0iy/kNINC+vLhb800OrUI8M7VPCuDc86y+gMoYf0S9mny3ERgLzakDDivm3jBLDIYABLtrp+Up8r8eQ3YuZp2f7cl4hNeEETCMflJ8Gw2THgXdftY8Qujxjl1WtFLw4PlF5/8J9FAhOI0rra9DxEL7hy9b/rwaYzCz1GPfNn+llaTeNQtVilJJow1eL+xvI6Hg0qk+F7Q+t2hBbstvkSCj6oMz2A5/du5TiyIBC/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4fr3z5oaigZYRGOWyJ+a9m1vpVpuxyRJ1Vm+sMkIMI=;
 b=rbCEVFAY+tugXTIuN9SKiorpr19kSqpLwa4/dZ2X8duZc10q3WNIwOcAkoLDEzAzdBzWG7rbFvluC7AN6kdSkH/2k3/303VyFelWlHKaey5GOFAcGk62680sjZy9NVedsQX5EA+6Hw75X1oDGSli77FHKe/O0r+NdSLz6DxQ5NA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3535.namprd11.prod.outlook.com (2603:10b6:805:ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 9 Mar
 2021 07:49:14 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 07:49:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mail@david-bauer.net>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: use 4 bit BP for large Macronix flash
Thread-Topic: [PATCH 2/2] mtd: spi-nor: use 4 bit BP for large Macronix flash
Thread-Index: AQHXFLiygkQ/L+kzR06Afaa0+zqI5w==
Date: Tue, 9 Mar 2021 07:49:14 +0000
Message-ID: <a0e30c1d-32d4-ab61-b5ad-730af1b21c35@microchip.com>
References: <20210303094833.139221-2-mail@david-bauer.net>
 <20210308123747.26142-1-michael@walle.cc>
 <40e3dd20-b4ed-53f0-7dbc-e2a16857dfc1@david-bauer.net>
In-Reply-To: <40e3dd20-b4ed-53f0-7dbc-e2a16857dfc1@david-bauer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: david-bauer.net; dkim=none (message not signed)
 header.d=none;david-bauer.net; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7e45b4a-32cc-4d9c-dfcb-08d8e2cfd5f3
x-ms-traffictypediagnostic: SN6PR11MB3535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB35352F4940A9EB65FB45D510F0929@SN6PR11MB3535.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NeRkRyXX22DbLVZ5ZSNhXUwl0nOP5zB4AXLsLYVJTkQKPNllZLi7tQVoQ+Nu8kUduhg7r5TdApaVSQDC6fY/Rehy37XeeVbmxTu6xELpZVFw/mfJF5wlxRWZxBiGWMKceb/w5zIQULS9tjbP6cuIqX6l/TXBZW9+4GPHbDOnFhdSZNXh1D4uuwgcP81X8tiMPSvXCeIEEyqLTQarcLQuTFFMtN9eo/Wfr20XnLTp5nnUHbIeqv8RkviKyquiMBL+dPz8rJoC/gKaci42KYMm5ol4a4dmc0ogX8mBLVc0xvJ5TL5zNwJrLlPZmC62lERmFYssSTWyZ9viFAhoQzugLrbhG31g6tg9H1v28bAMe6LiXinekW7csIiw7U30fem2FKpbX8Jhvb8lOoyOEP8xgQkYd303+hu6KpXh4NcxNTe0TvnQmTC+U6Yn1AqBfcAyeC6LYjfP7id0CQpsuuqauWo3aJNP7R9TZZ376lQx8opJvYo0hl9CNzDPiIqQlnLdu4zIOvhK3zHOzUbRapp4HMBbCoU/jMc0emaGNzZBynIYHnGhwIiRkbAPA0/IgZtxN9XoJKxjBoDN66jUz17EzZIFJKLgeSiDDGR11EieIYs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(86362001)(26005)(8676002)(6506007)(8936002)(2906002)(66946007)(2616005)(64756008)(66556008)(76116006)(53546011)(186003)(110136005)(36756003)(31696002)(54906003)(83380400001)(66476007)(316002)(31686004)(478600001)(71200400001)(5660300002)(4326008)(66446008)(91956017)(6512007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SEQ0RGZHYStNVFNZQjlDaEwreGJrRXRXUENoRHlLaDY0YnkzRVlLMUpFcmVh?=
 =?utf-8?B?Z0I4b2U1QmY1dlNweWR4RkprS1dmS3ZPY2dvbUNzRnRGOERzK3dhZzVYQmxr?=
 =?utf-8?B?d3VKcVpCdXM0dkh5NXZ4NGtLUDZIUkhGVmRlbUU0ei9QYzhGVDlmWGlqeDJp?=
 =?utf-8?B?aEt5NWN2UWxhdDQrRWpoaFowVWhhYnc5N3FqUXRDdlRpRDduVnpHSTh6OXp4?=
 =?utf-8?B?N0VjNTIzWjdhd2Y2Y3RuRy9ZbUdqZ3NtbDI0MDFMS3o4NnI0NmZLa3NocTBC?=
 =?utf-8?B?Z3ZZcUlIbW5MSkUvVG1jeHZRV3p6dlkyUW9OUmIzb1dPanZTV0w0NHZ0MWFw?=
 =?utf-8?B?YzhqaTBxaHBIRmp5RThDWHNmM0h6bEI1ZVFzc1lIajNRRUhqaUZaR1pyWnJo?=
 =?utf-8?B?MThWR2xUK2UyelJqUHpEeEFEYzhocDRpSStiTk9vV3ZCZ2Fzem5wSDVlenJH?=
 =?utf-8?B?WGdzeXZiS3ZudTlNdlFtVlBMK1dsSXA5Z2EwZ2N1YTZ0MFF6c05SRDl3OWtE?=
 =?utf-8?B?ZEJWckZYK3dWZU83eGcrYUQ0YVF3ZWxSZDg3UDFNY3lGcUVoWnZ3cisvdExm?=
 =?utf-8?B?a2JKTENQWEUzRHY3aExEeHJaNFlWWnMzZHVxM1VUaGhKM0E3R0trRTNuK1k5?=
 =?utf-8?B?SWgrK0ZZeFY5N3QwZUlaNXdRSklTclVIK0J6TVVlcDloQnNwV0pteHpXMVBh?=
 =?utf-8?B?NytFbnBYb2QweURxczRNa3UwdTZmczJJVmxiUjk2aGRYNFZJQTJhVGpQVjJZ?=
 =?utf-8?B?alBoTWZDMnk0aHJFK3lSRWI2eXBuSGU3cG1IaHd0QUt3WFJUek90NERDM3Jt?=
 =?utf-8?B?bXozS0ZFTGpMVUxmN3ByaVcyUWNqS0t5RXkwbGZXOHUxVXVXTWd5eGRqQXFh?=
 =?utf-8?B?cFh0U2pkb09UTXM3Z2JxeDBjVGF3Rkd3MkN2UmdKa0NiVHFsdzFRUHlWZEl6?=
 =?utf-8?B?MkZQdkxEK2lrQnpBdUVXTkt4akZzYkZQVGFEY0loUGNCWXp2TlRtZi9sNzdB?=
 =?utf-8?B?NFJXb1dQcGVpNU5icEFFbjVvOHdWSFFhazNqaFhIcGw3OUFCV3c5L3RMYmI1?=
 =?utf-8?B?RTU0NktvVHBWemE0Rzh5eFF5Y0JhQ2NNdXZ4VzNjQlBGZHJ3VnphU0lVWWQr?=
 =?utf-8?B?UHZqa1MzOGJlWUNWeitVY2FOdGhqNkhXRTJWbGloclllM3ZBTlBLTGhTOFRj?=
 =?utf-8?B?cmM2TWUvd2pDUEIxNGlQT0dMdlZXSlFlNzkzTWdPT0xCelVyTDYzd05DM0la?=
 =?utf-8?B?bG9paEVZOEpSS1FzeXBIWW1aQVJUZGZybXBwdlViSDl4UHhmenNPV29iZlhJ?=
 =?utf-8?B?enVaOVZuaXlSUDhucmNWZUI2MGN4a1Iya3JtR3RLcGZFSCtBOFZhYXFaR2xI?=
 =?utf-8?B?VGxZZXc1OUF1ajdiMnUzZ3JEMC9CWGswekg5ZWxhSUxETWpSTW1tVFNGUnNB?=
 =?utf-8?B?YVFwUjM3NTdxOUFBSHlyUlJJZ0dFblo2dzc2WGhZZUM5endNazZ6SVJTbmNL?=
 =?utf-8?B?ZWZFckZxZGxqaGRpc1gxNXlwTWlIOFo5NmM3ODNjSGptc1poVGpoeE9DckxJ?=
 =?utf-8?B?bzcxTDBYYk4zRXZJa1FLV1dqTmVqQzlhaW5vL2J2SkJGNzFwQnNIVzErd2ZN?=
 =?utf-8?B?UE55d3cyR0kvbG5BbzNsR1hRaVRUSkZva3VZbGZjamw2NFBMSUh0SW5TQ3o3?=
 =?utf-8?B?bmttN3lFM3hLOTVnTzdxRVNGdGFXcyt2aGVCUzRBakxHVnNmK0huWmJwdmJN?=
 =?utf-8?Q?fqcfIqfcd5OGEVGsVI=3D?=
Content-ID: <D876F84C0D4FCF48828889ED5B74AE73@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e45b4a-32cc-4d9c-dfcb-08d8e2cfd5f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 07:49:14.7765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JB1kEn+Z3H1kuPdVvpDMPYfmPEVj1zqcBmezz9tWy+J++bUcNPWRWtvgADvNCKrwdykTVe0X/VIqJh8Mwn6qG43gLtk28rnpMWfBOMhKUTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_074922_015151_BB08F88A 
X-CRM114-Status: GOOD (  24.06  )
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

On 3/8/21 8:01 PM, David Bauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello Michael,
> 
> On 3/8/21 1:37 PM, Michael Walle wrote:
>> [This time with the correct message id for the reply. Sorry]
>>
>> Hi David,
>>
>> Thanks for your patch.
>>
>>> Macronix SPI-NOR chips with 128 or more 64k blocks have 4 block
>>> protection bits in their status register. Add the corresponding
>>> flag in order to clear these bits when unloking the flash.
>>>
>>> Otherwise, the flash might not be writable depending on the state the
>>> bootloader left the flash in.
>>>
>>> Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection functions")
>>
>> Macronix didn't support locking before your patch 1/2, right?
>> Therefore, this patch will just adding features.
> 
> I've had a second look and i didn't spot SNOR_F_HAS_LOCK can be set per-flash. I was under the
> impression to add SNOR_F_HAS_LOCK for the entire vendor in order to use SPI_NOR_HAS_LOCK per-flash.
> 
> So 1/2 is not necessary at all.
> 
>>
>> Please limit this patch to devices which you are able to test and
>> mention in the commit log on what SPI controller it was tested on.
> 
> I've checked the datasheet of all flash chips I'm adding the block protection support
> for, shall i still limit myself to devices I can test even though the datasheet indicate
> support?
> 

Yes, please add support just for the ones that you can test.
There are manufacturers that modify flash capabilities from a revision
to another, while keeping the same flash ID. All the flags that are added
must be tested, so that we know for sure that at least a revision of the
flash supports them, and that we should preserve backward compatibility in
software.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
