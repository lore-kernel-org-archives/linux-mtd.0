Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DA2C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 05:36:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557F561151
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 05:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557F561151
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0unz94v4jC0yUrbw8vrYqmdMHdx8ISrFObijBxou1n4=; b=ROkwdyksKM4gCCdjZFS3OPzm3
	4rXZ8K+AW8vY6zqU6rUBI04YqXRDzFneRvxirn4D4A8a6wHM5zuU3ZTconT1PIQUENkdtgZks6BuK
	6itcAsIgxysi/G9aiHaQA3f4eLr/x1dBhG85HbeREU56d2dg2KsfFVO1Q/g7kQGleN/HSOqFvJGER
	dknS/Pofj9XvYVLOEnZHZ9krS6ronpMawCrIz4jvNM+bA1Wf2/M1tzL+6IbRt547JLKFVXLdfVNYf
	ztwEro6WP9Yaa9/NTsfmFigZ/99KGiEfGvmMaKKyWCcXva3nFjSUYlwQNFMDTi8thf9aHk/Pep+Xi
	7wiHYpfRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUNK4-006zBb-Oe; Thu, 08 Apr 2021 05:35:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUNJv-006zAb-1W
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 05:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617860110; x=1649396110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cRz8mcj302a/nKyWQi9Vvwoqkpcv8URV/8m1MuUrock=;
 b=oZeOI/PaR66sDmEwNNx794o/atSZiDomUl8kNPq3ZJB99crSrnmUPNj+
 u3GeouKdnaAtbcrIR0Puc/rD/iGjujZGIom10fMobGl5xrao11vyUZdsT
 zekWsOSmZMOAfxup9b0gpMrxfEM0vIo9FmCG8JVcM3tmZ3bjix9CdIvSp
 YyVrnb34BCGnwY8+gLNN6cXQjmcwILQnj4dZvsihVXqj6ovTE/0uvy+pS
 uoWlMrOKKen7x1zj+73NxiRnsznVR5U7GIh1vWjvWuXr485C4JB/il3aS
 tlKsq+o01LQEHA+y3FBpqSdMK9mNceqjeTTZ5FAT1GShzA7gcUwu6Np+7 w==;
IronPort-SDR: 1aoXjio/ausYBSmb9DhsRF+TtO0FRMWsC7KkL3oEzn+l6mLfPjc3OpMoUmae2RtQ9mtCEXKaio
 /SUzZdfhBWFbB+P+n+WHhyLVo8XAayNSFxtKnDFa9h/chYgwRYbLo0pGexB+tvI9WW7RJyBTGW
 g0HM6nww2W3wjIZylyDsw2ZGgZ11HCZCdAUS40N7L1icZGlgVhYavdCYtpG0oyWpPQXEad2uwS
 YlofX9vRuqGNgSBf2El86+f4idX+ohTuGlQHyW5pWOwRnBcD/4oT6HwqsXYMTUQ6LUJS3niNcu
 CKE=
X-IronPort-AV: E=Sophos;i="5.82,205,1613458800"; d="scan'208";a="50394973"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Apr 2021 22:35:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Apr 2021 22:35:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 7 Apr 2021 22:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLKVdrbTXwpL6B2tgS1vA0/uuHLY2m0arLBdnCqozY+X7QuDzn/hqHrVN69KwDcBRHn9RZDSf/4k5mkHhOeupirXX21zHF799EpzxRCrDlaZN0TjRdnpAKCB4pDsB4u7xXV6/hhBWjOP+JbFGWUW+p9YBdxCyiCisjuXItjc4pipCZRrNedqgMHHn/yZPrlYaSvvzm8lTpDCx6H9SHIxDlJjeE+yfA1MvEyxj4Tn93yIH9uC0uUrnj3evkCr2YuSlVuLT6Iic1yWPWnzoM9zdvJ02R4aDU69cDyfhSGv3XTmcCWIBBQhNHEfkMWHMPuhNz7uXJdZxpYI+cnI4uwRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRz8mcj302a/nKyWQi9Vvwoqkpcv8URV/8m1MuUrock=;
 b=Mg+YDc3AaOFihNy189lLHNVEaxjJma+8u6uVZwJpaCVZOiqO5CFo8ZtS/E/L0zzhEbfAgsa/HsAT9zJ4+DUqIKxGDiLZ1uXCwL6Pm6gMNkkyViDK2njuqgSf1uzFmON73j1vLyr+gQeY3LuGugVH6tcW6VNgxJzfR2TZD2Hc3eDRJzU84qGdUVdXSgKQYFgAw7t1Dxq46kF35ZDYd1DRG8IcmR/8DM8mjzd6RJzhSwa0Jy38k2i+ElviWuQ+XbD18PliCskQ3VFyKszIKnxnQ/RmxBbDrggn48leb73drrkK/+7d6tsYTyI8FNtv42nikC3VLNvKKuySBcB9K27DHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRz8mcj302a/nKyWQi9Vvwoqkpcv8URV/8m1MuUrock=;
 b=F5yFYY8jB4DFuTK5t50xkEUWI+uoQyTx43bjQEeC6bjePEU+3Kl7SLjbXNPo3hx5n/OrPETB62T9uqpzOlkEIf6XnS9x7N97a5EP3DhLGFFWqiY67YSTlEpex+pEDI7ybKp/dfzHDjfF0iFxQjlEAdW0k1BN9Xm+feVVZcBR2Wo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2639.namprd11.prod.outlook.com (2603:10b6:805:59::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 05:35:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 05:35:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Topic: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Index: AQHXJr2Dl0IvaIfezU2humJwIWm1bA==
Date: Thu, 8 Apr 2021 05:35:05 +0000
Message-ID: <b7e1a323-ab9d-5892-ae6e-7cf420e2885b@microchip.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <561ec6a4-5e64-8a82-043e-9e825aa00a3f@microchip.com>
 <50b9d6c9-c501-bc08-7f39-5e49b9e76782@gmail.com>
In-Reply-To: <50b9d6c9-c501-bc08-7f39-5e49b9e76782@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5065f0bb-be7a-4c3b-ccf9-08d8fa5010bb
x-ms-traffictypediagnostic: SN6PR11MB2639:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2639B9F7ACA9598DC3BEC4A5F0749@SN6PR11MB2639.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ii2ngD4q2//W6hV+7a6bC7aYXWEI0puEVlVfnn0rhJD2/dc7RmW20d38AjQvES2aQjxoMrxwZmlars0Dyk1/8mAICah/keuzLPk0+T9iJ9teH3/+Q/87HRKIWQSzNWiGP30wFalW8wyLJ5cCzi0biegP29KQ639X5KAYQnQsooPJ93zn4BzItR110CghTO0UGBGEvw604aBtXAV08NhZemlNgCBRmR/mzqoX4QapbtX6N9BE2PIX8Yc9eJjIkAXq82rlHwJ9LQj9AFAUSGiqnPIk3bU6zA7UvgwNACtd8DPwmQ6h5kXQ4S+Ok5hnvrPX2WCD5B7xHOu4RQN4D+ojd4JY4TvT2QdOfjFjGJIZnSXWnFGSZvcLVa/to3dq700sELHNVBGCvP1tzAMZ54SWuI3vJOr6w4aI1RFlYS5Z5QF9ve+Z1fNvZEKjxpsZT150CBBhSDQykaEq1jY3OJCF5EkZe34G7GfiATcGpSYYf2xR8nz+BUy3PZDC8YvywuxgBoec5Ur6YTKPExR8KPkzXOBOyvMApCG9Cu7SzJHDioD9i8XpXR8PbfCL7ZP9ouyiTNBVz7Zz6EqNkC/LV8zxxVLxj3TXHYZxRGL5io2AoGjUNPkFDnK5OLkSyXidS0L28QRZULw3jutpfuSzdVW41bQHZP/ZXYbeObwE094SjLudL5vStKWBZv0OA4HLzE/UhsaT0KuvZENGL5G4w90YcYiPzYzKSa74aIyysROT7RNihwKjHZB8gbIRQ2ORsQMt5Ph/VlWRV7qUSHdaZdADl/Z16icC/To5uUY0vw8GPa1DksW+efUpUOgM4GIIIdiR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(366004)(39860400002)(396003)(8936002)(478600001)(26005)(6512007)(186003)(66946007)(66556008)(66446008)(64756008)(66476007)(8676002)(54906003)(71200400001)(53546011)(6506007)(110136005)(83380400001)(2906002)(6486002)(5660300002)(76116006)(38100700001)(966005)(2616005)(31686004)(31696002)(91956017)(316002)(36756003)(86362001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TDdreTY2SkVwTHdFK1NpakUwUEtFQjFNTGFZNWhzRTljd0lDMmJVeE9sMmlx?=
 =?utf-8?B?MFF0ejNYb2pLYkJJdHJQcFNrMDJ1VGUrUitSMkJSNzFVUzljYjRzOWFaU2hX?=
 =?utf-8?B?NGlQVG15ZTNwWktmSEFLMzFUYkEweDJwOUx6aFd0cVVqN21IcFU1TEtSeUJ1?=
 =?utf-8?B?TVRKKy9wcXd6VW1KV0JBRnJsZVl4STk0RjhwMmRZZmkrUTF5TlhhT2lTdFpr?=
 =?utf-8?B?eTRoZ21aVmhZZitwZmNjeENXK3JHRjZrMFNrY21hMVowQXgreUFQN2dZUEts?=
 =?utf-8?B?c1Z5dWEreHpna1N1Y2szRFJJeVZubDJlT1Y4L2pHK045dGcyMCtYSDlLbGxW?=
 =?utf-8?B?SExHNnpsaDM0U3ZhOC9Ca254TTFBY1hnY2lBaG1Pa2ZGNFlQT0xRVDM3Y2Vs?=
 =?utf-8?B?N0hjTVczMVZwTjdUeFU1L08wSm15cy92c3QwMFlyZWVTakI1OVZvMHIvWHVW?=
 =?utf-8?B?dEs3cWlPTXYzUzZ6MmZrNWNjNEwzUHVkaFVOdjZEMVBlaTZiQkUxVm9Yc2hR?=
 =?utf-8?B?YlNjL1cvYlIrOVBBeFVzY0N2M3l1ejJYalhvT0pwUGw1QUZLY3BSRzdvSXZC?=
 =?utf-8?B?WmRmME5pZUhKVDIrdytUdm03L3NwWWNQQXg4OEtDMWZGSWMvalE5Yll6UCtI?=
 =?utf-8?B?WjlSL1V1Vnl3MUF3c29qVGYwTm5Hd01tQ0Rmanh1dG1nOTQvdzJ4REdmYU9I?=
 =?utf-8?B?UnZWK29mcGR0Tml4YXpzcUR3RUZ5andFczhXRS85UXp6SDRiVXl6RzNQUVl3?=
 =?utf-8?B?bFN2cSs1Wk56aVhxQmJCaTRKaFRiTzJWbmNNNko4Ui9RTmRRVXlsQ2pEMTlE?=
 =?utf-8?B?dGdWSnNRQzVOVU9kMmJkMTZFbHFwVHRYc1pUM2xuMkZHTkpKMW5WL1c2WGRw?=
 =?utf-8?B?L1dybTZVNkcrcjlMS3FVMzdib2Q0bkNtZlVFeDJKY3VpMUw0NlY3WnVXaS8z?=
 =?utf-8?B?MFF1Sy9SMjhhSDdaakxIdWNJZzVaWCtUV1BJdGdZbmJmZ0p6aGUzbXRmekZI?=
 =?utf-8?B?RHdMRU5UdkJmQlhUbEFETGVoUCtJeEF4bXZXUTZ3QUpCVm5VV1crTHdJRUtF?=
 =?utf-8?B?MlBqa0xwbmMzYXNjQUcvL3FkSWRSVnhPNDdZQUx3MTh1QXVGT0dEZFVUY0hm?=
 =?utf-8?B?YjJud3E5VTlXWGVNdnY5elhBTzdHMThWdUE4eXdxeUpMeUEwN1lzWWZMSnlO?=
 =?utf-8?B?b0VVVlN2NU8rYnZrRmlWUWVpcjdreUdUMG5XU1ExU252eVdHQVF2YXR1dGl5?=
 =?utf-8?B?emp2NmNlZnpKMG91RmtnZXNpbkRNZE1jY0RDNlNXdkhRS2wyZ2xVSzB5dWR2?=
 =?utf-8?B?VHNiT2ExL1JYWGJvNkhJeXl4ZDBtYUN0cG16RHBqeFZZWGYzVTNnYWdwZlJP?=
 =?utf-8?B?TkRZdUhaS0d4NDlRdWVYL3kxZ0VTRUlMaHFrZUtHMS9kU3I2Ymo3cHhDblpw?=
 =?utf-8?B?b1BvZitpeHNWV1NMZ0dwd2k4YzZvcVlpTE1GaWNJd04zdW5tc0VFd0NVKy8v?=
 =?utf-8?B?K29oOGpNNkI1eVY3MDh1TDlEMjVrZ2FGYTJDRDF6WVJYMURMTmxtSlhuMW12?=
 =?utf-8?B?OTV6aUd4K21xMi9zejVaOWhBRTUrNWkyYW9Qa1VlNlN2SVYwbnExWWRBOHZz?=
 =?utf-8?B?RFl4VUhTMEh5dWpIQUFGQ2JLaHNMVEd5UGlvd0tWM20xeC9xdUsrbWdESDA3?=
 =?utf-8?B?Uml6bUpTdEthQ0ZiY0xkSnJ1NCtZWVFnQ1dydlVsMjdZUU0vY3k3NVhrWUsv?=
 =?utf-8?Q?yW1gPdXgxpHF2x0w/U=3D?=
Content-ID: <91A05B14C5DFF74BB96F70897C5D6BDF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5065f0bb-be7a-4c3b-ccf9-08d8fa5010bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 05:35:05.7060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvSfS14QBqWuBdUDBBTwaOOngOCGh59gksVzHQcYJZndDRc65mUWPo9OYkXDdZe8goNh7iKEOSKGp4AnOZaiqy5D7S6R/rcA/4+aHqYtKXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_063511_594380_6366FD64 
X-CRM114-Status: GOOD (  20.14  )
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

On 4/2/21 10:13 AM, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi!

> 
> On 4/1/2021 3:09 PM, Tudor.Ambarus@microchip.com wrote:
>> Hi,
>>
>> On 3/19/21 8:51 AM, tkuw584924@gmail.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>>
>>> The summary datasheets can be found in the following links.
>>> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
>>> https://www.cypress.com/file/499246/download (2Gb/4Gb, dual/quad die)
>>>
>>> The full version can be found in the following links (registration
>>> required).
>>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
>>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-2Gb-MCP-Semper-Flash-with-Quad-SPI/ta-p/260823?attachment-id=29503
>>
>> Takahiro, looks like I can't access the dual/quad die full datasheet, not enough rights,
>> even after creating an account.
>>
> My colleague helped on this. I hope you could access the datasheet.

Takahiro, I can now access the datasheet, thanks! I see that Erase Chip
requires an address. Is the erase chip with address common to other
manufacturers? We'll have to update the core so that these flashe
benefit of the erase chip opcode. Otherwise we'll have to set
SNOR_F_NO_OP_CHIP_ERASE at flash declaration, which I don't really favor.

> 
>> How are multi die ops handled when crossing a die boundary?
>>
> The existing erase/write ops are done by sector/page size alignment and
> never cross a die boundary. The read ops does not care about die boundary

What do you mean? What will happen if I request to erase 512K starting from
offset (die0 - 256K)?

> but still works because the Semper dual/quad die parts continue to output
> data from next die when crossing a die boundary.

cool

> 
>>>
>>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Have you tried to erase/read/write multiple dies with a single request?
>>
> Yes, I did 'mtd_debug erase/write/read' with address ranges that involve
> two dies. You can find errata info in the datasheet about cross-die read.
> My test does not cover the trigger condition of the failure actually.
> I will submit another patch that work around the issue as needed.
> 

How will you differentiate between silicon revisions?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
