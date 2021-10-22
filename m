Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B42AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5485561163
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5485561163
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIOKhAdJE4jIzC5jCQSrZAY7gXftvvwOgysUr1MpUJ8=; b=NiQAWVfG1R/9lm
	RQ0/KNJRqGGHcG5oMwMiMY39Bl2GYhg/sco8pHWJkQZEZecXRIN0oCaAzHjL9v1NRO3z6RLjwES2r
	NRgGqG+MQMTO6QzS50yLCrl7qwsw5cmA3spSJ1wstYvLDpbtaqAb7NgFqEn1G2pKXA1Grfdb7bP4+
	jyMpp85j5hCusQLEyZBNmqKVoMnpuKNLYl0g6EbuNravZH5tQRvMAtdutw521ilGmr9nnDx/SJhgH
	VzTcLNyDxspqpg3z3TtW7Ad/d3byoG1CgW68jLe3OPh/uDa2kdBzss51p+wYMaTbsYL4SGrpFQeG3
	GmGy8mDtPn44zKCyZgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdugc-00B7Lk-69; Fri, 22 Oct 2021 13:34:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdugW-00B7Ka-Fh; Fri, 22 Oct 2021 13:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634909652; x=1666445652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rPkwvl6FacghV/ZoCmvZnJVT83yAMoUcz3VpyQ6xo10=;
 b=y6kbD4D6mH1s+GRxLMXtqHRdCXLENxcX6CjN3O/Qo9F7WCEozURvqJEe
 uhy1JFfPPuIC8cxmbVeioPt2q5pDZH4HF0FB2KivUjj9YJf67PFHCtXOW
 6r5KNpQTTeqtNwfNb9Fe9jv4Tp8wMw90JRd1DP5tMRgVm1Rr66JYLY28z
 V0XQAqhpkfWd9/77oqFe0V75qberdWVZI1IAVnFderE5MdnPDENs76t3G
 pgMkl2gFV83hke/6YsihG4CkkV1OwuFN8sGJk3A/C3xq9mzcaVIyxPOZk
 ZnFM37scsEOizeQhF4/W58Ux3EfMgNeR5Nl35lFZQaMz7MnkfdysQDGdz A==;
IronPort-SDR: mLf6tdFZqMphm5GU8v+IAPbIIIIHcsVlQEz94oyrZvSPAm1wPit76nLudRypWXI8tjcZ790Q4e
 DwCCD7nmnEofI6QDvSVADZyediDpTzMqh1vN8IfzgCVphbM14yoaGNPLW9d3131T0/0G8N4nIJ
 p0I8cBH1bsx3O9Sn/KFAiM1UamuKo++/Z7dEulk2ilERo//K4GXNHs2KWirJC3FjfhU4Bhb6b2
 m+ECqDO6nh7gUhw+fVVhmI5EqVkEx2Y93CHS1u5GvhR4lc0pLPqbAX8C2c1s3S2MezSZmHYIw7
 BGuU46Z3geaRNzsKUwDe9dJP
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="141351425"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 06:34:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 06:34:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 06:34:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ylix5oqkWqF3sXmm7q3Ss0mM247okOShOSq041vH/u96YtkiHpbtNZJ6N6ZkfqZey1u4S0SDhbfgG6Ah7ZCwRQHwF1GjEYLpdmee/pO9MMQXdaPfFRF0nO71d1FzRTubHO2tFo2XFRnpMIAgoqH2Bx0wKQrCQb38p6vta80hnWk125afhv2Y7wE4b/VDkqtxGFDGztiJyasa1/1gq+iWCs6BuyY0Sb4BsM98de8+WROId8A3IG/Yp3ztGawBhZM7MYOZKRiIBi2qog/xSo7m33iY5VXjUmlVGDHDSUIwMg1L9qq1QhOapQ98Gcjjn/B3K3VA4zniLicRaDgVN/aAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPkwvl6FacghV/ZoCmvZnJVT83yAMoUcz3VpyQ6xo10=;
 b=PY1sL9IIRSgjO9K9XK32vWd33hRmHgNIZf3135qHDHgflRL7iOXhVPq0Ye4cF7RBrAd017P5I1qnW8DeW8S6cEpj2HtTPEEeVR9eZSemt9JY5cobeNeLaSlc8acMsC2UdIN3e7ZXGDobxWwXK4maRSriD1fh4wU62Y2obn/ZfjZEBhZLZZaujfAo0yeXOXKIi/RL+M7+VTvHNAMQ4sJW8nEl7r6dyhjv72G44dVlppwuGWXSTHGkPVlAdZOGvuJB6u8ttKy6lh+xNpH7kJ1PuJswfPWtBOB+BLNNzBTMpTKpcPWcHPbpfoyuqzn5pRSWKlhLmrKSwkDUBnC+bRAUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPkwvl6FacghV/ZoCmvZnJVT83yAMoUcz3VpyQ6xo10=;
 b=Dyup8z/e1txRsM0Ja90YQKjka9zB6EvArCnvIKf+4Ejor3kdn6jg0P3uE7EuVLfvNEsilPKJYsBz94NzLIBC2Ir5bi8fv6e98YNqPOp7Q/TfoDIonruJBCxB1R6vJIBJgeEacDyw/EcSMEIGb8TmAAOkbwPl8L6WZGjnGGU/Yls=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 13:34:02 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 13:34:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme for
 setting mtd_info fields
Thread-Topic: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme
 for setting mtd_info fields
Thread-Index: AQHXx0N5rlK8gQtwg0iBL129ZDcJxg==
Date: Fri, 22 Oct 2021 13:34:02 +0000
Message-ID: <cb4ffd6f-1f68-1f29-c648-c464d5c8eef6@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-23-tudor.ambarus@microchip.com>
 <4c0ac0a3efa3075e77260185767c8554@walle.cc>
 <7d264652-abcb-b317-7745-36995deff003@microchip.com>
 <9c08f234068d328dd229893e836cda60@walle.cc>
In-Reply-To: <9c08f234068d328dd229893e836cda60@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c20bb53-8ee5-419a-198e-08d995609c4a
x-ms-traffictypediagnostic: SA2PR11MB4794:
x-microsoft-antispam-prvs: <SA2PR11MB4794653DBE976477F613B140F0809@SA2PR11MB4794.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4I5EmOGwnvLue2BCLnY5Gwx2qKwEln0Sl3ZYaoDICnVKH0052Qm91aeENWGqMaL5GZmXRLvJyuGitGxVxMD9ETXMlaFtcfzMkvLavByM9zxm55ZyZN5JQQPT2J/kT8TK8I8j2qAAOeVGTEeF4wDUfQpMCXE0fAzbcGAmCQgCNetm0Mo/xzE9YSRQE+e8MrPc9PYpzASHDsPaC5pYVLvw551pn5/jTP6oQ0eRgZRRNZSdnkqClPuA/uU10ZsgRNbBGhEfupxvFV1c5zFhHCIPmI1sX0tF1Ham80GFbs3qWF1gJXxtp9/O8g9QcGQ5ofdwoQhoiPcG2cCWqldNJhIfsb9ds1ET6rFB93VypEHq2NPm/jY1kgtbfrlQpIVZP9l6LYYVyPtC1SacD93oOvVPXjYVYo4s0ckYaVt3Av054KQkmOnH66LXUREt2QRy6C57DEQcSDOE+A7A/wbDuYSgGo/W9w34WzKCCG3gLP65VWugf0snsvg9jHOKja2R9pORmKYpaAfn309o1Glxzu6312NLTF5UIDo28J5CzvaZD49HQrPf88QPXM65BHr9mtj3vH3IGM9Wc1KRN35JKpMmTUDzGaektg1eJrp0M0DKNakUz/hKSMM0A+84PMjtGiQACphaDSRv2dFpnljPKnA+DbahNhTHrr1OWVfW/gU67/B4aFTvezB5Qv42so19eJh8n3Ap96+0bEJmBt9jS6ZISC5ywOXFqi/kEMWAO/XNbT3U3KqIdVeaCsNwpgbyOt/CbHbKNQEJNNMwr7lcv+6Ovg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(4001150100001)(66446008)(64756008)(7416002)(5660300002)(86362001)(38100700002)(2616005)(122000001)(36756003)(31686004)(53546011)(2906002)(6506007)(186003)(26005)(4326008)(76116006)(508600001)(6486002)(71200400001)(6916009)(66476007)(91956017)(38070700005)(8936002)(6512007)(8676002)(316002)(66946007)(54906003)(66556008)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzZIaVhBekVMK3M5Z1d2L1BMR084NTU2OXUxY3ovejJ1TW9vT0hHenJMR1lV?=
 =?utf-8?B?RmVVNXQ4YXJDUWVnUU1ScUdoVG1CT2Q0RHkyTy9sbTN5Q1orMjV4MEZ4cXc5?=
 =?utf-8?B?UEhVSTRETjIxRjkybUJ0b01LNnFNRE1pRUI2S3cxeklkZStrUU56NnVCbFdK?=
 =?utf-8?B?RWlQejVwQjE2c2k2ZnlxOCs0M2F3VnlGYm5hQ3V1cU1hUXNVL1pQZXBCZkV1?=
 =?utf-8?B?NkpOQ2ZTZUVyYTIzQnRLSHhTUGFQdzNsaHhzSlFQd2hTdFA3WTNWd1dmc0Yr?=
 =?utf-8?B?MnZpWW5KM01LUFNiKzZ2cmxTM3BsSXVVd2M4M3EvczFuWjBkUlI3SXlpbVdW?=
 =?utf-8?B?ajdQSTFCOXE1clVjNkFRWFMrYXJpYWp6OXk3NmU5WDdlL3BIaytqeWNlMlRx?=
 =?utf-8?B?UVZrcDFyalIyUWYwbXpobGNmdERzcS9xVGt2cUprWGhmdlBaV2plR01lbkdS?=
 =?utf-8?B?Y1ZwbGZBemw3RHJxQmE2cFY0Q3V1YnNJVityRE4wMGtNc1l1TjNUVitwUzJQ?=
 =?utf-8?B?aldSVUpFMUN0ZFhvcGpYWWl5OWIwVXNNT3BNZG9YT0FSQVR0THNmejJkWEJJ?=
 =?utf-8?B?SWJaa1ZBU0lGVW1TOXR3WlVMb21GT1EwZENWL1FUM2R3czZQOUY0aW1RdGtZ?=
 =?utf-8?B?YkZ5RGpidG1rZkQ0bmEzT0dFcUxqL1Y3aVBGS2ZaUnBleE0xWjlEWk9yRVBM?=
 =?utf-8?B?QUJtaVZReTBkd24vMjVVeGtqdjJua2xFZHRyeGVMUXJOMVlxVTd6T21TSXlN?=
 =?utf-8?B?ZEIxLzUrblJrUUhaSUVWdUN1S2FaTWdEclJUUzJKamU0SGxTTm16TG1BaWFQ?=
 =?utf-8?B?UnJlYUIrY1VvZTFWSkE0dk9zWENTNS9QNml3VUR5SlNoTU9UMWxCVFJkcW1r?=
 =?utf-8?B?c1hvL1BxYXRtSFgxWWs5U1lNWlNROG5MczNjZkhHUHdBZ2QwQ2szdVp2TTFz?=
 =?utf-8?B?a0NTcVFVUkVBc1RRTXV2K0MrcEZPeUVyaXIyZHI2RE5KbmN2N0ZvTXlZMUMw?=
 =?utf-8?B?MGh4cnF6UUZTWjkrSGxMYVJhRWFFbWZ2SklxbmxiZ0NrcElDMnNaRXNPLzBE?=
 =?utf-8?B?NDg1ZzRWOGllK0dvL2RKbXFLVjNTcDM1T0dXU1BNWVhheXlnTTRtMVJYMkxG?=
 =?utf-8?B?cE9mbWhJYlhwYWE5MElZRnlLTTVZZDBPQzc2T0dZanM1MDNEWUdySUM1UTFP?=
 =?utf-8?B?eTh3czBSSEczVWRaZTIyNkRNR2hMZ2NNdWNTemxqdEpLeXc0TlE4QkR3VUpy?=
 =?utf-8?B?b3ZLcGtVVEJHMVZ4RGwvK1RVQVdtNi9xMXYvVzJad3hJM2M3U1lZQXZrTWdV?=
 =?utf-8?B?b0djcEJHWFNpQ1ZrQjBwa2Z1c0pyaWcxNW5ERjF2cVlkc0x5Nmx3RzloVW8w?=
 =?utf-8?B?Yk8wOS9tUDVRU2xDQ1lvcmJKWE1lbjIwYUVlbHVDQ3lwTlkycDJDenAxcWhY?=
 =?utf-8?B?d0Nva29rdGVuS3FweCtheU9GejhrYU53R1p5MUY4SHVnQ0xLeFpPbkZyeXNH?=
 =?utf-8?B?R0ZMOHVndlRoblNtV2JvRWdvOUpqN1pOVmJjVm9mVTUvVzZ4S2hQT2NXbzg5?=
 =?utf-8?B?Rm9YcTBERzBuNDJZZU5oNWtoMmsvM1gzdVV2NWxzT2VaQkwzRXlOMDlWNlVq?=
 =?utf-8?B?Ky9qdVZQQlI4N1N4Z29yQUZGZmJHMytUTGZsbnJXUjFEWXZ4V0RabkM5RURa?=
 =?utf-8?B?SVU1OEFxdUMzZ1NtQkRJTktFc09GN1Q5a05vdGFLZVhmbHZydUoySDdzVGUy?=
 =?utf-8?B?ZlE4TEpBbFBNQ25Mcy8zUlhKUXhHb0ZIZWRoUXNpVVNVMXp5UUJxenREZGhI?=
 =?utf-8?B?VzMrRnIxVTVvaFFDNmFNNjRGcVFGbURadE1SMkFrKzVJOHVDS2ZiTVhia1V2?=
 =?utf-8?B?eWU1MjZWTXd1VG1PQS9TWUVSdDNPMWE5KytTdGhZN29tbE15TW5uMzhpbU9S?=
 =?utf-8?Q?oDs9pJu5BosgU+Jx5QhaEm8DbkhixVhG?=
Content-ID: <BF1DEBBAF1BB63458A0687575B151752@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c20bb53-8ee5-419a-198e-08d995609c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 13:34:02.0589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_063412_620467_3138C3ED 
X-CRM114-Status: GOOD (  24.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAvMjIvMjEgNDowOCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTEwLTIyIDE0OjUxLCBzY2hyaWVi
IFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToNCj4+IE9uIDEwLzIyLzIxIDI6NTcgUE0sIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdw0KPj4+IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4+Pg0KPj4+IEFtIDIwMjEtMDctMjcgMDY6NTIsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1
czoNCj4+Pj4gVGhlIGZ1bmN0aW9ucyBuYW1lcyBhcmUgc2VsZiBleHBsYW5hdG9yeSwgZ2V0IHJp
ZCBvZiB0aGUgY29tbWVudA0KPj4+PiBmb3IgdGhlIE9UUCBmdW5jdGlvbi4NCj4+Pg0KPj4+IE1o
aC4gSSBzZWUsIHRoaXMgcGFydGx5IGFkZHJlc3NlcyBteSBjb21tZW50cyB0byB0aGUgcHJldmlv
dXMgcGF0Y2guDQo+Pj4gTWF5YmUgaXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciB0byBoYXZlIHRo
aXMgc3F1YXNoZWQgaW50byBvbmUNCj4+PiBjb21taXQgOnANCj4+DQo+PiBvbmUgdGhpbmcgcGVy
IHBhdGNoDQo+IA0KPiB3ZWxsIGl0IGlzIHJlYWxseSBqdXN0IG9uZSB0aGluZywgeW91J3JlIG1v
dmluZyB0aGUgZnVuY3Rpb24uIGJ1dCB0aGVuDQo+IHRoZSBmdW5jdGlvbiBuYW1lIGRvZXNuJ3Qg
bWFrZSBzZW5zZSBhbnltb3JlLiBTbyB0aGUgcGF0Y2ggb24gaXRzIG93bg0KPiBpcyB3cm9uZyBv
ciBhdCBsZWFzdCBpdCBtYWtlcyB0aGluZ3Mgd29yc2UuIEFsc28sIEknbSByZXZpZXdpbmcgdGhh
dA0KPiBqdXN0IHRvIHNlZSB0aGlzIGZ1bmN0aW9uIHdhcyByZW5hbWVkIChjb3JyZWN0bHkpIGlu
IHRoZSBuZXh0IHBhdGNoLg0KDQpJJ2xsIHNxdWFzaCBpdCB0aGVuLg0KDQo+IA0KPj4+IEJ1dCBt
eSBtYWluIGNvbmNlcm4gcmVtYWluczogd2hhdCBpZiB3ZSBuZWVkIG1vcmUgdGhhdCBqdXN0DQo+
Pj4gdGhlIG10ZCBjYWxsYmFja3MgYXNzaWdtZW50cy4gQmFzaWNhbGx5IHdlIGxvb3NlIHRoZSBv
dHBfaW5pdCgpDQo+Pj4gY2FsbC4NCj4+DQo+PiDCoMKgwqDCoMKgwqDCoCBpZiAoV0FSTl9PTigh
aXNfcG93ZXJfb2ZfMihzcGlfbm9yX290cF9yZWdpb25fbGVuKG5vcikpKSkNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pg0KPj4gaXMgdGhlcmUganVzdCB0byBh
dm9pZCBzZXR0aW5nIHRoZSBtdGQgZnVuY3Rpb24gcG9pbnRlcnMgd2hlbiBPVFANCj4+IHJlZ2lv
biBsZW5ndGggaXMgbm90IHBvd2VyIG9mIDIuIFRoaXMgaXMgbm90IGFuIGluaXQsIGp1c3QgYSBj
aGVjaywNCj4+IHNvIGZvciB0aGUgbW9tZW50IEkgc2VlIGl0IG9rIHRvIGhhdmUgaXQgaW4gc3Bp
X25vcl9zZXRfbXRkX290cF9vcHMoKS4NCj4gDQo+IEl0IGlzIGEgc2FuaXR5IGNoZWNrIHdoaWNo
IGFjdHVhbGx5IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlIG10ZCBvcHMNCj4gcmVnaXN0cmF0
aW9uLiBKdXN0IHRvIHNlZSBpZiB0aGVyZSB3YXMgYSBtaXN0YWtlIGluIHRoZSBvdHAgaW5mbyBm
bGFncy4NCj4gDQo+IE9mIGNvdXJzZSwgaWYgdGhhdCBpcyBub3QgdGhlIGNhc2UsIHdlIGRvbid0
IHNldCB0aGUgb3BzLiBCdXQgdGhhdA0KPiBkb2Vzbid0DQo+IG1lYW4gaXQgaXMgcGFydCBvZiB0
aGUgbXRkIG9wIGFzc2lnbWVudC4NCj4gDQo+IEkgc2FpZCBzdHJpY2x5IHNwZWFraW5nLCBJJ20g
b2sgd2l0aCBoYXZpbmcgdGhhdCBpbiB0aGUgKG5vdyByZW5hbWVkKQ0KPiAib3RwIHNldCBtdGQg
b3BzIiBmdW5jdGlvbi4NCg0Kb2ssIEknbGwga2VlcCBpdC4gSWYgY29uZGl0aW9uIGlzIHRydWUs
IHlvdSBkb24ndCBzZXQgdGhlIG10ZCBvcHMuIEkgZmluZCBpdA0KcGFydCBvZiB0aGUgbXRkIG9w
IGFzc2lnbm1lbnQuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
