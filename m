Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A48C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EycxTrWA6ix+BNCP8CcGj3BquOB/pi5CUjIvWTgPWDI=; b=TZXOczUsleDjO3
	RCc6kdxgF4Y9Q9om+MfCA7YbordBkYafHBdDYsv9t6geY4GH0NBS4nWqR/ysHdZ3v2yTGY1pAObP4
	R+qtkTAzi9x6MH/i0ylRI2N4jhHf531hiQtYtO10aqqKj76fmZ+WkJ6ahlpR/OJEFcYinEFEmkfyM
	5/vIKsjCa/TPdd+EiDLNK8heoDcZC/4h/Tof9cmd4ATeKbSzP0RaCpLW34AR2Lquvz2s9WuAulDTa
	qTcKj+bqftuiCE8cmd8K2GbVQMXOynWZjCxkfQZqpj0mMenUpZ8mODeyqyYn7TmaW9p+Nfw3U7IU7
	Nxl3WzMwk5UppRnV7CJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8dV-00F83V-80; Mon, 21 Nov 2022 15:23:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8L1-00EyPw-61
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 15:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669043039; x=1700579039;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=usm9zf9W5JwUMyW1quosGIUyrxEXQ+I1OToFbj44oCc=;
  b=tg5GH51Kr94g0AiBJa+MswXtag+Nq342XeEYtMdC2WAOjm0DPeMV4HTz
   Rg+NzazN+sOWXBY5z51dFZfatWWzF1yvdoPgrsgUuoB5XFlNC0Fdvk+iU
   vVEuFSPTWjblHqCySIt8uyyjRuyeGpSdtAdHIQM81/d8zJ68fGkXYwB+1
   gPK79Lq79wk9XJaPWHN7dFklCv5ESqXY5XL7QfIcUHdeIk1tehiVYTFEn
   Rckfc12ZbN6lA2jBKUzoLzTqYIvq3YC+x7W6MtlssPG6xeqjnrv7kvV8Y
   bpmpz8/Gyo1ePs+YFiDRqtJCnepza6bA9OXctT6yVexZFubYEUYkFpzuT
   g==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="189866991"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 08:03:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 08:03:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 21 Nov 2022 08:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYjPt/smvYGVru2WwHXtTa9bUDZFeJZM2ppsUm3AM3oY0tWM/INdCIFtbl1eODaBwbBtLZjhqefBqBaXPdB+bNOfyAyAAnXGD8CU83p1OFc8FomV70bn0yo1mvwIaqq+PahoS2lZu/gqqPYtW4Uf9yOTrlAhhXut9NoB85UhJHTrCSErq5wQOZbUXluwO1WohMdhvAGSIykswB3KMkAL1hXpQivnhETyMeKFkOEl+56NqmDvoTbOx2e1fqFY9jMs4qL4SQaiNDJDt3gyuxkPSgOD17Gaq8zfR0TohD0dRPbZpqdSv5V3TWILjf9Jy1eL0p504kWI/LtHIls3IysKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usm9zf9W5JwUMyW1quosGIUyrxEXQ+I1OToFbj44oCc=;
 b=nF3+t6lOQeJPDFml+YcIFeEyU7LNv2Q4XGQWTl4Zxzl+p2jqnKSByIABDsjotiieL60v35uJc9oMEfmq20iBQ0jX8dsaJOPnTWknfsK6+uqMR8L9gZLrtoeLED+TFfPl55HE3dmtbmRJt6MB73jCXk2VC17RTqqCgGn9B5SnQyW18WoRc/gyRoddnft67X2CiZnzKaQgBDlNlYLA7nmB5oasszmJUyKawEqYfIf+q5zGE5rzR/X0o0sSHWL7+r0Jh2SVO0v1RNbxfCVbt/KTklW0G1Mktca+XSA9mJQJYJ+6VBXA/oADWvN3RKYByZi2rHZ5TkArfeDtAB4vq/j1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usm9zf9W5JwUMyW1quosGIUyrxEXQ+I1OToFbj44oCc=;
 b=WA+yer28lvHJRBZA4WvOkzggA1A/MTYeSOIMQKwsxsazxSEHWlXT2HK0hTPNu6xH62m9naKedBPimxot9zgi0f9iHzHCY5UtDVpb9zKFhAqq+ZNxbSFTt4SLzAaZ6lJW+5kAEEZ+DjbFaCMNODWJe1rN6H/14K/Zg5xfYdxle+4=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 15:03:51 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%5]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 15:03:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <pratyush@kernel.org>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Thread-Topic: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Thread-Index: AQHY/bp3TTNDOiKYzU6EJOHdvS+Odg==
Date: Mon, 21 Nov 2022 15:03:51 +0000
Message-ID: <959a3de3-dd71-acaa-d26b-0e93f3db820a@microchip.com>
References: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|MN2PR11MB4535:EE_
x-ms-office365-filtering-correlation-id: b4581ed7-8e22-48d6-50d8-08dacbd199c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7GZ3m+0uw7u6k8MzW2bKWYzHPMvZuxSChf7RvCa5jaqWzMiomS0w+1pl1eFj99xDVzKeox2na32TRob68vkZ1Hw4LjECQmjNdOv7uMYGagsKLDVtv3hBu5F1469AWfODKmmsTftr5e4UbJInuyhXY/bEdiJQgUUyGIkzNy+i+pkfoUx84UK9c3WdwVN+j6ELHcI0DDg8bonFjPWdUb1h43hOhQ0hZIPT/CQaHBGmaqu8+lAuzWotaWAT6ied06gGcO6pTVzLV1Z7WLE09IZBrGkwnSwHrSSDzRIo9o/3puCmPjfWrZjrPRXNENm4F1/oNisN6B30yYbmOpl2U/ltAoaGPoxSaiZObyGQx2kxsjPVR5dsvBQWpAJcveluWm6IyTlpuJjgSkUr/LOIKugvz43mhYAanKBX5KT3u/cjWjU9mMnhB3Z7BzHVweepKgde6nhlruoCE4v2JMFp1m29J62rXZMnswr6DLa5a8/e/8q2QNlglqygRVE1VtiyXDUS25d2VE4A/9Y2BitdDKfClJmVLRV+EQXljRQCX2PcBV4do1cTESCOwMZ+G/3J37yOKsKBXQ7G/RYm7QAEajXjwjFgtDWEeBfPbw4dCZLhqCpHLWxWbCT4bOBE1nI/zsCPO0u6HDKHTOuFLucP9KB668mmk3Lr92BZmhV6L8Jq/EiNuoGN6I4nPVK54+v1zd/bgjRwRW5+qZk/KmxH6XUe04unKcqvuN24/3ZCEKp1Uft0+/4zIh3KZRVscyK5t1gGDbzXJU/fXh1tJWzaS7auK4HLyW5KcS/BBFHCfW0QSiik0QFlbpIagYAA8JrTy9uDcbmf71NzjyrzZDjRumEtWADpj0VhalOcEvziprZfXFgBM5NCQqhdWKssxf5C5Aok
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(8936002)(5660300002)(54906003)(966005)(53546011)(110136005)(478600001)(2616005)(6506007)(6486002)(31686004)(186003)(316002)(38070700005)(31696002)(2906002)(86362001)(6512007)(38100700002)(83380400001)(8676002)(66476007)(36756003)(26005)(71200400001)(66446008)(66556008)(64756008)(4326008)(41300700001)(76116006)(66946007)(91956017)(122000001)(138113003)(43740500002)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGpIWnV6MzZ2V3kvczZyV2NJbWZvWWxVOCtIVnAxVHVXeFJIUm4rdXVWRHBF?=
 =?utf-8?B?bVFKMWdNNnZHWVFoZUkwRXRmUzVoekV1cGhxcW9Jd3htbUlWR2pkb05Eb0hT?=
 =?utf-8?B?SDAvSnVDOEQyZkEyOWcyODQ5b0FpUmdNcnJNNkc4TGdoV1RNaDlQRENuMG05?=
 =?utf-8?B?QVlSSGd0bTB3N21DZ3B4UFVGaDhDMnVScDNQa3JKc1pNQk9qbU5KYWlHVkNN?=
 =?utf-8?B?Kys2ZXJYb2UxaFk2Z2hLQkVZZmkyT09YSzNFVTB0c3JPbExBMlpVN2VOeWlM?=
 =?utf-8?B?SVRVOEtJckIyOXZRZkZuQVBUaE1HTzAwTm1oWjErSGFqeEpuYVBlUUQ3VnNz?=
 =?utf-8?B?dEtmdlRVVzRYY1pYcnZGZ3JhQk1oNXNBM1gxdWRIM0xLdkJNK2ZjU0xndUN6?=
 =?utf-8?B?aTZyb1VyQkcvbWpBUnp1SDdTdUxhK0s0akNTeml1WHVZUHRrbGN3bW9LVEM1?=
 =?utf-8?B?N1JMM1JrOTZyUEpOQ2RyRlVlK2JBbUJQTlQ2amVyZDdOdk84NGMxSFBtczFI?=
 =?utf-8?B?Z1hIRTNlYzdKbTZEYm4xTmNnWVZIM1pUUS9neDFPQzNObjFMQytwWFJTbjhi?=
 =?utf-8?B?RnlMd25yQ2lxZ2MycGJTZnZuKzVIQVJNQ0tBQTBxTEh0UENNNGZEeWJycG0r?=
 =?utf-8?B?aWFKRk0rc0hYNmRWS1EvR25QdXAyWTl6K2F4aUk5L2Z2MyswYVVJOG80NVRN?=
 =?utf-8?B?TUxybGMxa1BSZCtVOUlSZ25qOERWRlU3R1YvOEFZZmFsemFpaXVZYWtta3N2?=
 =?utf-8?B?V09FQ3dPa3JEb1BhUEFvVG9XTGhDeUIxSENUb0dWUzhEcUp4SzZ4b0NCZUxC?=
 =?utf-8?B?ejJxTU45bjhOQmlUUXdNOXpoYVpRTWhES25YTHlHZXc5dUp4ekt5Y0lhaldF?=
 =?utf-8?B?SjBLNFN1aE1XMHdxaHB0emdpYVBMSlY2OHJvNmtvTTZ2NkVpRGRIL1dQNW8r?=
 =?utf-8?B?RWV2MzZSR09hVEsrT1BxeTJ5KzdYeVVKL0RHc21YOG9HSG94czR1dUxyQ0JT?=
 =?utf-8?B?QU1CdEFGOExJZE5SL0JSRi9vZGJTYzUxclp2YSthSWJCZjVUaWMrMEVxVzR6?=
 =?utf-8?B?a2xka2hBc0lsb3hKM0RUbHNjRC9TSFhEODgzVmNpN1ZuYm5HYkdueWZQWkZO?=
 =?utf-8?B?a2IvWHhJaFJBeFc5SGlJV2RXZklHRkI2dnNtVDg3WDlMRVBIZ1gxQkdSYnUy?=
 =?utf-8?B?WjhLeVVRRmN6RTdlZ2VmT1p4WU5PdVlWb1RjZG85UWtvQU9qNUN3RElvbG1n?=
 =?utf-8?B?S3hWaThjYzYyUXdGN0syZ3J4UndnN0ZIRVpDSDFiOWRUUGtKZm1ZajZKcUZi?=
 =?utf-8?B?K1BjbllaRnhPZzduSTYxN3BzZUJCbXBJUlJOYXIyWU84djlwZndGVktudjFO?=
 =?utf-8?B?dHdNUnNPMmpTZFRXSGdKdWQ2L09FbVpuYXNtT09xWEtIQWUzeWlwMGFpb1pU?=
 =?utf-8?B?VEh1Q1VsZlUxNWxwY0lKeitPSE1vSmgrVGJMdHJrMGpxT2FrWWRzYlUwVng0?=
 =?utf-8?B?UWJrcE5BVnJRVThjQWd4UjhKUHdRS2lyeTdxbGZpajRiSThWK3lRcUtkR3lC?=
 =?utf-8?B?ZXBTOS9DTGR1NDZWd2dQYXA5RFJmbTFlbWNwaXZ3ZGYxLzgvNW1SUDdHMEVJ?=
 =?utf-8?B?R0dHRnV2T081ekNlLy9NbjVFYSttSFlpaDJlVDE2NE0xamhoQURITWpROGJK?=
 =?utf-8?B?eDJEZk91OUtDeWtIZzJERnN3UzdGa21TOS9ibkYzNURES1VnQXRiRzRDekU1?=
 =?utf-8?B?aE40TkkxN1dYZ0N2K0RLenhFQkJxbEJ5Nllqc3hHZkdkc2l5bTQrVTZSQ0p2?=
 =?utf-8?B?TG1BTG8rZGdkRkVYRjZucUdVTkYyQjlLNnRXVW1STUpMWGVKZUdoRlhGUWc3?=
 =?utf-8?B?QUVoZ2VKNTdodkZ0YmdzSWtyS3RCbWl3SEU1Q08zaGhlaXVKYlY1eE5sYWh0?=
 =?utf-8?B?ZGkrVTFCMjJoR2l3allQN2xGU2J3Z0dsbnFURFdoS1ZaeWVsTGM3SnJrbTBV?=
 =?utf-8?B?ZjFlb2djbEcxMWRBUTNzQ0tTMncvNFZOQXVpTE9xN0o0V1ZOYUVOTWlVVXlX?=
 =?utf-8?B?cmZhY1BHZzVMbmVwZlpXS25XMzNSYVpZMVU2R013UWFUdmVTNmdGWjFpUkhJ?=
 =?utf-8?B?Y1VYbjVEYXFIYSt5L3h4QVhYQzZsNzBMQnRvdHRKbHNXWHM2N2llbGpodzcx?=
 =?utf-8?B?c0E9PQ==?=
Content-ID: <A5CD1A3DC2D1D047A2A7596B3F439BE3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4581ed7-8e22-48d6-50d8-08dacbd199c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 15:03:51.3998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sMQ4LZOfUpNX0bQdD2cYdx/fdh09d/gM+DygYIsPjkAp7u01+yxvw97knZxvpLrpWXeQYscpvDMHdQNo+WXc3RDr//jHBok0oi2fk1/Iqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_070359_517018_F7FEC04C 
X-CRM114-Status: GOOD (  22.11  )
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

On 10/23/22 09:58, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for this 32MB serial flash.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> The previous version of the patch can be found here:
> 
>   https://lore.kernel.org/linux-mtd/20220922135646.49906-1-mika.westerberg@linux.intel.com/
> 
> This version uses SFDP instead as the chip supports it just fine.
> 
>  drivers/mtd/spi-nor/gigadevice.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index 119b38e6fc2a..29ae4048bb0f 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -57,6 +57,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>                 .fixups = &gd25q256_fixups },
> +       { "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
> +               PARSE_SFDP
> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_gigadevice = {

Hi, Mika!

When submitting flash updates or new flash additions, we require contributors
to do a little test using mtd-utils and to dump the SPI NOR sysfs entries.
Would you please do that?

Here's the simple test:

Run the test_qspi.sh script: 
#!/bin/sh 

dd if=/dev/urandom of=./qspi_test bs=1M count=6 
mtd_debug write /dev/mtd5 0 6291456 qspi_test 
mtd_debug erase /dev/mtd5 0 6291456 
mtd_debug read /dev/mtd5 0 6291456 qspi_read 
hexdump qspi_read 
mtd_debug write /dev/mtd5 0 6291456 qspi_test 
mtd_debug read /dev/mtd5 0 6291456 qspi_read 
sha1sum qspi_test qspi_read 

The two SHA-1 sums must be the same to pass this test. 

Here's an example on how to dumps the sysfs entries:
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl02gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342a1c0f0090
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080104ff00080114000100ff84000102500100ff81000118e001
00ff8700011c580100ff88000106c80100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff7f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffec
ec031c608a857a75f766805c8cd6ddfff938c0a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3fbc8ffe3fb
00650090066500b10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015000080080000000800008010000000100000801800000018
fc65ff0804008000fc65ff0402008000fc65ff0804008008fd65ff040200
8008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8fffb0ff8ff0100
f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100f1ff0100ff0a
00fff8ffff0f
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
86aef254bcfdf763bdb92e4c31667242  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Thanks!

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
