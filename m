Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EEBC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ7K3Y/7r9dHG5VPzQhieQ1w0nXKcPMLBHH+xrMQ8z4=; b=I14ASjiVRtbeax
	8b3P3WsAgNPUaw8YOHDj7asMoiFF/ojEpozvpYAaBN6ZJBlDb6K/NNV1y0dnRtmtDNCkunLekq2US
	jZMbpKlVswwRKo5irsm7y8U4s10+LlSzIDfE6M0AGnvXUl1vAIeb4W+BSw2SzbxAE1XirwL+jPLAB
	j2lhu+6ypWkKAvWjLIhsuzGmEqFxvSW3ljU0B4q+ThSlNDIP1z57l3Y52xv/mmTQbZe+jBSSC9e0Y
	2+sOofdlkF8AnSrnCfajXiWOIUFn2CaFzkm3G+KNmJmdcUdfE0F3FxgROXQpQeqbn4Vt06mA6kiy8
	vvJ0o3mSaqwE06YdEEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njfGy-000zdO-HW; Wed, 27 Apr 2022 10:51:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njfGu-000zbx-FK
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 10:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651056708; x=1682592708;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AHd4hzZ3nfWReKhfHQW0ei0Fsm2Zjcd2cNtU5wKIfhg=;
 b=Wu+/4zsZ2jvueeHjqLNeEGWkuOPtFBCoisntK91PQepYlhcoUce9CLRL
 w4VlgxTJ8r4gVn+yZ8bWW2qyLJ79Lzj+jkhiewVaEA7ueNjmMBJI2O+dd
 TGCOAOEkvJPaMCY8tshbQc6NATgZnNqtpYrOCG7/zvoHONC8CFhMn+4Y0
 p0N3EsjoR6XH0GCg6IeXsPrMS/EF0DICBaedZeuw7Q9Nu9hKCJLvOemyQ
 //HFKDfyuD9MQowuMe9Z+wjcnz3DSxvbT2JFCtK1x1Rn9t7iW93G3Qg7r
 jBY8USxLcfRBjFhGG91gLSpzfgVLiEEUpDrGSBe1NFnWkFGVsc23wh+rV A==;
X-IronPort-AV: E=Sophos;i="5.90,292,1643698800"; d="scan'208";a="153991522"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Apr 2022 03:51:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Apr 2022 03:51:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 27 Apr 2022 03:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTaFTlF1VZOR4UAA+hFzjeDsFs46Ohb3jIGRdz6HnFq1kzQLiSiASzspVZXXcq6wS6WT83dFEDT6x2v3QsJejcWzJ593stYlT2a3uSTV7zgOXtqRLdeWRz6UHQliZ/BqcNp9k/itpvlAeFOau7k6tKrCWsiEmkA4TKuVX3dofnm9Q6wdaZo/36TH+qL9EyHYV+HmntOfpmHl5McJvrDaGk6GtTKCzyhJmdNRZVOaNnrW/3dw40R0stW9Z0SjsoNDcvTzhj7Jx8BQoQFUiTJxPyha2gdqS3/ZXrbrSNLZycLiPrKvRLH2vwQRuPuI5jOlH3ETjU7jq0fW491NLJSQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHd4hzZ3nfWReKhfHQW0ei0Fsm2Zjcd2cNtU5wKIfhg=;
 b=VUeOFs4SLYo+FymknD30MOqJajqmrtYZfw1VRySi7zha8F7S3A/+SIjHJ/M0FaodiThaj/JCGYHrnUIPD/iSGoRgcxoFAM6hSZUtJas6Rej90qQILJYG52O7PGOR6pEu/QFL62ArkeD1N+riad/2+eJ5/pedRZgobK/S/NsGrQyVE0qyMKLVQpp12lDDMoeuakZqx8mUJoyGwQjrorV/LrmpdBT5tkYHLtgE8QrY7Hmjz3s1v1g37BrCRbuNB14wXDhfg1aq+wzsLL+P+S7prjaW13i2tDdWidfrxnnysZnZNMy1e0VPus4U79Ne8C7Bv+PkKNxwIWT4CYPBMUhxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHd4hzZ3nfWReKhfHQW0ei0Fsm2Zjcd2cNtU5wKIfhg=;
 b=ZwiirYd1osl8ZwVrugTvCdEujhTrYTinxW7yQX1lFgBYCiIj338XykE6XE9yV9BnFS6GSEVJZIKedBPIaXZuixln22U50t03MbYllAX9Z4ejcawpXkaFRpSQKlAr9wioTWrw7Sn49VElix7whDZk8a/kZsG65A/AzCoyCyrTTSM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BY5PR11MB4403.namprd11.prod.outlook.com (2603:10b6:a03:1ba::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 10:51:31 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:51:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <chentsung@chromium.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>, 
 <richard@nod.at>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Thread-Topic: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Thread-Index: AQHYWgX8ewfNtQDrSE2YBtaW8mA4Jg==
Date: Wed, 27 Apr 2022 10:51:30 +0000
Message-ID: <89d43450-b702-8f9b-f4e0-6f28a1cc03c9@microchip.com>
References: <20220126073227.3401275-1-chentsung@chromium.org>
 <20220131171929.uk3z5sr453c3eefp@ti.com>
 <0e02112a-317c-e95b-e0d3-7ed2c74c3509@microchip.com>
 <c6b2956d-85f6-19c3-4282-23a72a1b5849@microchip.com>
 <20220427085925.wlmsnr7qgi5wteod@ti.com>
In-Reply-To: <20220427085925.wlmsnr7qgi5wteod@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4df55f37-4033-4ed9-1d54-08da283be372
x-ms-traffictypediagnostic: BY5PR11MB4403:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4403F42E9538D80DEF585230F0FA9@BY5PR11MB4403.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7WwFA6MYdgmGSYqsXrD/0UqHDbGHKZeHMnbuvxR74kVVNwJz59k3YvD3ZuQ85TBRONyPw9K+77pXb9i40Es8gYfa12dQMLKB856Z4gb3h2TiLoRECnwf1+Xv4RnYljaOl7v0jST5UKa2cOeeQ0UTgGoOMbk9cPuZWsNLzZp484Xk56nCQa4jCH+dwgRjHSK34BFr+88VzY0xz9vzdD5nDTouvatthA7cB7pSyKeH7jmXDJN3YfSLOQBNFl9ENYf/oOGwwwbL3fWUVMMoDAbaNroC/eKss4Elrc/xMArfUOIr4Vthv4RZbAckLF79u9h2H58cfsrWeOJuIZDpts3tZ+i5UKlv4CzHyYiiKYlYnRwMdW1OeVeHoq9UjXkarTvUbUg40eatZlVAjeG+BdW5B8xx6reACmdh44RlfOED096C4azcexVMr0OVLk7k72VZeKmMNmJ39YNQaLw5xG1wBbxXw+7xW902Pr+o0XZwvqXVgTFp7D6WMhsPE2CnrXSzycmKyqeo61sVL+x+4D7DvgsKXclFpIb8Hh9xxBJaRWdikXtnraW5jJ2CFZC7HSk0MIDzT5z6P8hivoxVO7g+FBzJovCIkI2mp9oDkS3KJfGCBGuPipFI95GUZvhmI3+DNqniGYfeHnMKfIKMtKm+q0M991NJzcJHaEYckKBZKGHxrOrAJs32zZMbGkdIVsffgDhy7mQhxuwLayl8PHi7eiSdafoZbWIVIg7esILJXYlWGgS8YlnCUxvW+E+0eYCtwQDX6hzbGwfeT0n78wLZSGJzPKNOIZ92mya9RH/b65eWZGObUmAKSFc1lZ8bhcVH6fxGjHqVd7rvbKP5tYau+Wg6YAyh0htlKapkRZ8ME5o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(91956017)(966005)(76116006)(8936002)(5660300002)(31696002)(122000001)(64756008)(66476007)(66556008)(66446008)(4326008)(66946007)(6486002)(86362001)(316002)(2906002)(8676002)(508600001)(36756003)(71200400001)(2616005)(53546011)(31686004)(83380400001)(38070700005)(38100700002)(186003)(54906003)(6916009)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDlFWDVxeXhib0F0UnJoWk93M0hjOVJNMEpJNXQ2Zy9rakowR0hudkQrSXVZ?=
 =?utf-8?B?czFFY05jOGFYaFJZbkRVMGpJbXo2bWFmdFRmdVZqTW1GV0I5MGVsdDdYbE5x?=
 =?utf-8?B?YlpLS0FONXRyQmF2aHU4VFFZRHdiLy9hKzBQQWJpRnpyaDBlNXNjQ3RPOFVy?=
 =?utf-8?B?TWllVXZDYkRPRnpBQ0NsZUxjdXVXcjJpTXNNd0dkS2VZRFVOa09ZWnZ2c0Ju?=
 =?utf-8?B?YndUODRMaHhYZG5Xd05aYjNSRnY3VHpjeDVPSVROMFF0Yll1NjFFRTJtRkdr?=
 =?utf-8?B?cVVxYndwYzJBK250aWVkRFp2dXEwUWgzYnpOTURRK1NHRW9WbThEbHNGWkF3?=
 =?utf-8?B?K0lNVFZJcTRiNEpCZWRUcE9qRkFxVWYyU3dtcmVCc2lDMHUwUHF2VUEvYXpu?=
 =?utf-8?B?cDRXQk8xRnhJRTMzYVg0YWNiK2Ftc3BMZWFsd3R1TFFFdXRSZkJUNGptSHIz?=
 =?utf-8?B?bXlrdHpsODhDaklUb251RjFJMWh6WWs1YmlNVVZMZ2pHdlJVcm95d2Y2cEU1?=
 =?utf-8?B?KzlYU2c5NzRtaVRtQXhaVlpWRTF4aDIxZGtYQ2xQUGsybHFPNXhiaEN5TUU2?=
 =?utf-8?B?VU9vOGZWaFJxTU9vNjdjUitieUpsVjBnQXl5aVJsL2VEbU5mUzlhSWkwcTBX?=
 =?utf-8?B?c3Bac3ovdytNR2NkNjNQUUh6S0lCWFIvOGhqVVRIKzdVNTRjeTVrZXZMeCt4?=
 =?utf-8?B?NUIxWFNYS3ZybDZ6a3RjR2Vrd3Mxd2JDNmlkdHNuK21kZElZcnM5blJPOU5G?=
 =?utf-8?B?dS81cDF3QlFZd1FyVGdZVkdMUW1Fa0JyVkpmV0QwcTBMTVZPTS81QXRCTUdL?=
 =?utf-8?B?YWY4YmFpY1U3RlRGc1RBUW5lYjJoYVUyMDBGczh6Y215R3NST21XYTVPaWh4?=
 =?utf-8?B?d2ozSzc0VmxPdWhpU0JqSHJLNkNWek5TMVdVQnljNEQ4U3VZbmdnbXRiS09q?=
 =?utf-8?B?YmtWanRWTEUyT2lvNmVjbjdUbWpaOGxEeW41OUtmZXZLWExqM0ZlUGgzcHRI?=
 =?utf-8?B?dVJ3YmNZT044WHk5Wis1WkJnSUk0aU8vOHliUDJKQ25JZUJwT1dkd1A2Vzdr?=
 =?utf-8?B?eDl3cjJHNDlHRHUxcC93ak5DdXl1aHVpM21NczM0NEtrQmxyWmo1SjBGcUti?=
 =?utf-8?B?M3g4Yi9FT3B6WDZnTUVHZVZnQzUzUXBDSmZxNmFTVEd4Q0h4Qm9qMG9mYUFj?=
 =?utf-8?B?UEhzVlFGUWFvQXBRUnlnV1V3U280Y2lIcjNXQThRK2FTVFBLVHpjcXlSdWZV?=
 =?utf-8?B?RnhuZjBrVHlSbEU2MkZRMHpjdjBGRDRsOG8rblI2T0VVVmVKWGd0ZFJnQy9i?=
 =?utf-8?B?MHlyTzJuZUhKMGxNWDlKdWp5aDVwTEk0SHYzdEQxY1ZtSzRPMnRPN011Zi80?=
 =?utf-8?B?MHlyOUlScEJ5Zi9xOTdTQVUxcFFFbjVHUkoyZDhuRFdqT3FYQytuNjUyT3Jh?=
 =?utf-8?B?TTNKWndkdUF5bWZVNVRrZzdTYXJMZkdHazBsVEdNUWdGS0R1bW9qV3BMcllX?=
 =?utf-8?B?bW85dVM3Qlk3NWtsWlhPcklncjBQL0VtZHh4djhPT0FBbFJKSUovazEyaGdP?=
 =?utf-8?B?cW5RQnozb1NMUnlUcTJpUllkeGtYQTllVXBZMnNDTUxqSk1qWDNkcVhIUEpF?=
 =?utf-8?B?TDhDRmJaOGwvR0RhQWRscXR2anJuOGRqeUc3cWdaTHhDcjVHYUxtN0R4L2gr?=
 =?utf-8?B?L2VlRDlESlhZcTJFRHZDUlNlbTJBZnJQRVpCdjdSaTBFMXlydEw1cCttMmps?=
 =?utf-8?B?eTNoU1JyVkhSem5lQU5hTUlZQlNtMmxRMDlRY0JpT3ZOQ09NMHVSQ2JhaklN?=
 =?utf-8?B?SnBUbFZKQ0lrZUdpMlNOM2VXczl4cnN5UkZ3TkZBRVhTUktlSFpaSFRiTlE4?=
 =?utf-8?B?UWRrM0kwcFZCdVRldlJ4UnMzdkEyeWxLT21RVlM1d3lOeWRTd3pqNHk1QzdY?=
 =?utf-8?B?eVdYNGR5dXlIUHRoM0xoTlJkVjJLQjdQVFJyMENjdFprTkRLYXYzWFV5VVBh?=
 =?utf-8?B?ZlJjeHJDSVUwNmxIRnp2bEJNd2poWi83blI0NWtqWmlYejJraUk1bGJSZ1NG?=
 =?utf-8?B?RDZ1TGZHR2Q1SDRzVzhEOFJieEsrM0YxSThYZHJPSmw3ZlBLdjVDTEtZKys0?=
 =?utf-8?B?RklNTWk4c3M5Sk9iemkrTjJPaFd4d1F3TUltVitxeFhPdG9ZcllmeHlDdDhS?=
 =?utf-8?B?b0F5Wmx2VXhTSjRIVXY1Tk1tYlpFSXk3NjNOM0JERWxTY1M2bkdOeEpFVGg2?=
 =?utf-8?B?RXJIdlUyU3JhMy9IdU80RGhPeFptTUdycWtNYTZxVWo2RXZocXl2Y2RLcXNE?=
 =?utf-8?B?clV1elFucm45bHB4SDFzUjl1REVKdTQrQ2crblV4RUJkL0VablpaeWN6aUd1?=
 =?utf-8?Q?bL9fuGrXJlWgVNLg=3D?=
Content-ID: <394F9607FC7E0E40A22BEE9513A18BDA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df55f37-4033-4ed9-1d54-08da283be372
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 10:51:31.0278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FE1oqBf8tJBzchiHQEPdu1oEF/XyveLfFBIAz4Qs+u5CVgpxKfcguaORZH9aGlja5cW5Q/WBEey0NapFUsbjqEomUwsqN95cwCvkpxVWAoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_035148_863570_46EE038D 
X-CRM114-Status: GOOD (  13.79  )
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

On 4/27/22 11:59, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/04/22 07:14AM, Tudor.Ambarus@microchip.com wrote:
>> On 4/27/22 10:11, Tudor Ambarus wrote:
>>> On 1/31/22 19:19, Pratyush Yadav wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 26/01/22 03:32PM, Chen-Tsung Hsieh wrote:
>>>>> Read back Status Register 1 to ensure that the written byte match the
>>>>> received value and return -EIO if read back test failed.
>>>>>
>>>>> Without this patch, spi_nor_write_16bit_sr_and_check() only check the
>>>>> second half of the 16bit. It causes errors like spi_nor_sr_unlock()
>>>>> return success incorrectly when spi_nor_write_16bit_sr_and_check()
>>>>> doesn't write SR successfully.
>>>>>
>>
>> cc to stable please
> 
> Since this has the Fixes tag, once the patch hits the MTD tree stable
> should pick it up right?

yes, but indirectly. The recommended way to submit to stable is to cc stable.
See: https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> 
>>
>>>>> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
>>>>> Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>
>>>>
>>>> I don't know much about this bit of code but this patch looks fine to me
>>>> from the surface. Would be nice to hear from Tudor about this too since
>>>> he added the function.
>>>
>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>>
>>>> Acked-by: Pratyush Yadav <p.yadav@ti.com>
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
