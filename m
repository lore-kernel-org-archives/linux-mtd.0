Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA406C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781D26108D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 781D26108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBUbby8mKhUEnJTvJUn5E0Wy+eOyZnqdUMz2fzw7KjQ=; b=3tV25JwhBl42Fp
	Ero7czAhlBcz5sDSJ1e9LIQbaA8qFhe+fV3EOh8n23o6bu+wB4HXqIHrYtOjvkCb4cZBOkR1z7Rtp
	EnrYNZoGZey3teX4dDJmvFUYtw8MWAoOwsWiBjhEWuH+rPxsb1BDHo0b3RojAIgeKZwzSDcVK3bTs
	+47mhlbtrhk68pnyOohZxQ0TWgrAHwwfLOS+HPva1gH7h5snhxTCPyiRibfKki7Er8dSTcXqdMqud
	3WQai2Rb6bjRixXGF+u2wOSROiWKC4nT9SuHTAQBB7X0nTIA+LDLvg4QaAu9iMBHmQutiiIO1f9Me
	y5fhJYzwrm3v6zhW2pHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQHc-0022Yh-GI; Tue, 09 Nov 2021 12:31:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQHZ-0022Xl-Jy; Tue, 09 Nov 2021 12:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636461082; x=1667997082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MTq2VuGSWzuen2xJMW09A8rYGMCLASxEBjNLbEr1s8k=;
 b=iEVP8DCwXabeqKUNbcexmWb7soDLx/jVzd1bTsYmQgKaIue6au6K+V/t
 PbrXjA9zvHF7CZInaowCg7x0Rc6eOezCEg//h5soCJG5HaRz3UFqrvO+p
 P9j46Qx/qatCJvnX0wABq1yHB4Xjh9ZsEuNaD0iia8/p369MgrHJOSxq4
 +Yspt/mrV/A1SZwt9pVeDIsLLNXyxKr/xSZS56lxzCa5oQmMzLH5mBjDE
 O9xCSvrKmn4oXxq9KLzkcBP2ku1cf6rpMljVKuVO0cvZ6Mmz2vGuMOtox
 Hf4UJdlp3sbLtFnTBmlKgKEd6qhJgPnVELvPy+vhNUjvsOPXyxXjFgppz w==;
IronPort-SDR: 6EbrgZphcsYuiyDPvJxXuiV3SydaCH503HPFCQjy0D+jVeS3Or9yz0V3EarrMOE3kDaLOvSPKk
 0lRKKNNwoYv6EtTSQgVeCSnVHRfAEKWPipzyxld6qvvAX6Uk3ld+avZG/SeH6LoIoy7MsNIlUo
 d6V7FiOxUTAebqZZDmqDHRjccD4l7+fc5RuFVoVHTtpPdtAhExiqGcymp3WUqQu9Sjgc/wj3Bv
 wJVjyAg2qjk3Mh90Ldy+hZrB8wj+WqonI+w4t1+eNFcxzM0GnhlEIAq/Fb2XOkdKi9VkKTwMYg
 eXPRoaFMYfQt0z19pi9op3Mx
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="143314800"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 05:31:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:31:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 9 Nov 2021 05:31:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+FI7W4tyUugc0ws67G4zsT/YEs18dhjTjO28DkywoQwibATqjgEfSNVz9wdv8SeLN2YvWhk++G7/ZWU4WFUFnuPh88DT5qkv4I/tnYElABv/m502NNZMrsFIEKD3gatJBBMnVy8md2r5ZQyhklMm6VdlWv4FayFOMS31AdMwhwA13tYizIniod5rjACSa10cm2F4j8u4emLSJ9RYBeulwPZz0bjUCZuzFsZZtqP0vm1V1cdTJxag+iePOsFY7UF+uw/S84EjyY7OHXw74YNSElnPzuF9b0s7OE/kgKIdx+YN5+IGotDITHyOZDv7YBGOoEzWnuajZJRvd7ZSrJ9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTq2VuGSWzuen2xJMW09A8rYGMCLASxEBjNLbEr1s8k=;
 b=ilfQ/LBKa2FShjhFXjPOvCsUMt214mcEbedM6JL2emeVWglO9KEEgm324zNKbWU1/F8B6TCa2RA79Bd7ILaSMHUHn6yNypRwjChPRX2kEkNnAlN9ppJPntZzsVX4tqwBTKTzWOIDMmOzV2nQHvoHUOZxb7Mn0CSB/5fjhtaSI79kFxnfLuUZ/tpA+uzdUHC+dsSpsgUbUEzbmFnYdrddsejANbrAT5Pv2Y4CpXFTKsDhgu79lun4+OOBCV5VA4NLdtIot7X195Au42fYGU16vAXpFu0cLP95KZenuW88CnIlKJOK16QWyctHGRvELZwuf4UyzfMxt275E1fkopT3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTq2VuGSWzuen2xJMW09A8rYGMCLASxEBjNLbEr1s8k=;
 b=kwwbbx4FCyWhZijS/KdPj0Run9ulz/L8h+mPq4tIRKth0K1USYSXWU/bX7VykDaFcZSNvlBW3YPZ1Z/SOEqUz6WHqio33YwDbdN4FExXjEp7XXp0EzzkI78xXsHVzqR7YeDIM3pjAS//yy/XmrKVBt1Q3RvLd8oyH85KXQw/lZw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 12:31:14 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:31:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 13/25] mtd: spi-nor: sst: Get rid of SST_WRITE
 flash_info flag
Thread-Topic: [PATCH v3 13/25] mtd: spi-nor: sst: Get rid of SST_WRITE
 flash_info flag
Thread-Index: AQHX1WWvEbQugNr3kECoGX88i3DXbQ==
Date: Tue, 9 Nov 2021 12:31:13 +0000
Message-ID: <0d7dc115-f616-bd20-a924-f7ebb7649812@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-14-tudor.ambarus@microchip.com>
 <ef9e5b2e36b37293a8761cd01e334877@walle.cc>
In-Reply-To: <ef9e5b2e36b37293a8761cd01e334877@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93f8488b-d174-4f09-3f4d-08d9a37cd1d2
x-ms-traffictypediagnostic: SA2PR11MB5164:
x-microsoft-antispam-prvs: <SA2PR11MB5164D3B6EB1EBDF87823BE0EF0929@SA2PR11MB5164.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ++qGV1/LqyBD0+fjRs1aJChljNawWCixtwT+4/p/OceCSgF93idT86rcqyt//IObdcs0V6clbYNEiYo3PiZL3SXMq7CFwlLYYRj55r6nx4sZFc+8FBnRAxO6oxvGLiYcNbfz9Utp7wjRzFpLJ6Kl/feM90hrDJ2ezcRaupc4DOFefqSqFiX4YUCasnBnV6Dph2R9uKfqk665rK5nMcnWlieBHYwKMV1inL94oKTXQcmRPOcDzL0POuQpiTOxQKi09U4qztQKL203bzC1CD8Cv6Th1dhRISiF76d806W6k0Z07rbuudgNjqK1gBOcs/srV1mjf0qdBKgY+wGjqEG9IFDyvHDb5dvZEP6ajzA9GoareTgzzu0ixYtAlTP1hYqxnkUTSU+j3rcVCVUNSG4qd3dZAHWY/+YgBLZhxE3IUIxQt9+1k2K7kZGJLRalWAWCLXGJRu01a70phr8nlS3uUziEDT2M7Gv8qy+HYbGXgqw81ceQF3lOKNqYa7yNY8XfiLX/gb2ienaS/kZDDXVGaGUhAgDZuGGqFl9qif95F5yH7dxc3zwQV1Cxty3nIY2lu7F+zCNC3LY9txqr86V07VX8yrV7bA2jxgYNsaIlpa8cmcR5hGRx3dsy5QT+ZLZk+Bi5fika3zAcnnPJ1ADG4Ml1b1qFm0Q/qd3lreZbYAjc5fZpL0BArF5tiYd+IH+Azi6LM7OJ3b4Wx9NrllqiWNw4yBIARXsxcHnP6qiIhH1WfVrN0T7f71Rddf1So4sLKH1b2FbZpBU/KtOvQSXcDeaf2E+YEKOlzuIVe/lGe3I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(316002)(31696002)(31686004)(6486002)(26005)(64756008)(2616005)(2906002)(7416002)(76116006)(86362001)(91956017)(66476007)(54906003)(66556008)(66446008)(8676002)(508600001)(71200400001)(107886003)(186003)(6506007)(6916009)(38100700002)(5660300002)(53546011)(4326008)(38070700005)(36756003)(122000001)(66946007)(4001150100001)(8936002)(26583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEgrZzFreVpTblNBV2FHZ2RvRnQ0WHMwNmg2VnBxeVdFbTNWTXBmUGE2M1ZX?=
 =?utf-8?B?LytNUWFLYkJyWXlLdS8yYUZWY2htUE5HWE1DZzJEbUQvSXVnVkRNOURQVk1K?=
 =?utf-8?B?ZzhPU0dML24xVDN5OUQybFExbTJSdzlTSTUwM3pldlpMdzNKSTBZTEFlcXJm?=
 =?utf-8?B?WDY4dkJ3a0d1ZEU3R1BqcUxlUTMrTjZEOE9NWHdOdHRNWFZNUzJKclplRmFv?=
 =?utf-8?B?Tm5DL3BKSXl5a1dPN3NaSHBuMUNtWUVocktmWGY3ZjVWY1FhNGhSTDc1MHJG?=
 =?utf-8?B?RDR0R241WFBhTmxwb2svb3VUa2tUZDVCaUhZckcxL01hbHA0aHNBSHZXa1E5?=
 =?utf-8?B?dUxoSmgyMENlNnhGRGMwS2JLTThxUGxoTU9xRDZRT1MwN05EUndKS2pOS0dy?=
 =?utf-8?B?NURBeFZoL05KK09peTBEb1FJNmp6OXNWMTY1alhYSTYxTkQ2OWV1ZXdjLzlx?=
 =?utf-8?B?Z29PUmNYZlJNZ1h1V0hWdjRCUlF5djh3OTY3c3ZSRDRTUVR4Vi83QUpSdlZa?=
 =?utf-8?B?bkZvYmNYcVFLL2FWOWFQNFl5QnpmRTVkd2dNYU9ZTkp6NnJtamo1UXpWMHpR?=
 =?utf-8?B?MkNMTlJUQVcxSEkrelZtRGJ4cGtHTzhhWTF0UGpybU9MYk5LeGlKeTFEU3dl?=
 =?utf-8?B?MW45SnRPdGxyc0dUMFBaWEdUUjZ6NzBZT2xZMlFSSElFZVBrZGhGeEkrODVM?=
 =?utf-8?B?STU5anh3RnpVZm52bTBZeS9pN3N5aWY5LzRNTEFIY1NWM0tXUitzbEU0UWJN?=
 =?utf-8?B?azZtbVdVbU9HSWw4SkJkWkVJVFdpTEpEQ0hscFhXdEpNZ2VZT1R4aDJBeUVa?=
 =?utf-8?B?QXBtM3ZwdlBXaEIxZ3NERFdNblJBL2FRZUFJQ1krZ0IrS3hEQ1RVNXZlOVM1?=
 =?utf-8?B?a0V5blVKbW1CemlRVUM4Smp2c2lBb1NNejg5QWE5ZEhSUmpCZWZSRjgxeFJs?=
 =?utf-8?B?QkpuMTRWT3dBUlR4bFF6bkhEUFZvYUdSdGlWaUhBV3ZmWkJwUnhaRUVSa3o3?=
 =?utf-8?B?bXFxblE4Z2RRNU91c21Gc2dpd2Y1ZXpyWExNR1I0MU5VSk1TbmdXeTB6UnpU?=
 =?utf-8?B?Umh5dnFyckRVVHF3MFJvYURYWXcxMXRNcXZwdm9GbXFxMVlPM1UzZ01FVkxw?=
 =?utf-8?B?VEk2eTRsSTVGSjJYK2N0WElTMWZRYUF3MDRKT08rdEdLSVlEVndxTHJHeDhj?=
 =?utf-8?B?V1V6b24rZmFjNkNra1BibWIxbmpSQVYrZkJjb0ZyUWtHa0R6ZTRZRFNjYVNX?=
 =?utf-8?B?RTFDbWJDZG9uOTJEaUEvQTQ3RGQ1WW82MUxnWnppQ2NVbSt1QU5DSmRMYzg4?=
 =?utf-8?B?UjJXL2Ruc01XeVIzY1h4V2NLL1NOV2ZQcW1QbHVPZzBacHYraFVoZ29VT010?=
 =?utf-8?B?ZmJZMjlCaFRiUHF2U0lPTmh2SytOL0hSdC9BNEwrdlcvTHRpTjYwb2hTalFj?=
 =?utf-8?B?ZWhGT0ppOWt0VWtEVXNGWUxXWG1kYXVUeW4zWFBZSUFNa0JWc0pXNWEraGU5?=
 =?utf-8?B?UlJpY3JKK0YwZmEwT1M1UGRCbmJ6c2w2TU9aeGlqR3A3T0FYdTZZaVJmTEsv?=
 =?utf-8?B?MTVpcUQ2OVc3eVRGWllLTFhqUHBLZmI0SVovNU5MeXpwOUJhYXZSMk1iV0Yx?=
 =?utf-8?B?enlZeHpPUEZyR0VtRWVRc1hjRHpWWHlPeTFhdWIwSkdZcDd6eHYzb2Jpem1H?=
 =?utf-8?B?cWFLSjArT0wrTDJHMzlaV1hlNTJlYTI5VnphZUsreW0wT3RrUk82NE5LVEow?=
 =?utf-8?B?U1IzWFVKU00yMUNKNWZhcnBYb2ZlVTU3Yi96VzRSdUJ2cVJUbWtQc20zOUg1?=
 =?utf-8?B?bWp0eUpaQXUwVityWGtIMTYvQ09uaWNZU1VHMFJEOWc4ajV4bjNOeEZpUlNo?=
 =?utf-8?B?clZoM3l6ZTRBTTN2c2NzSkZTM2xWUEJFd00zNkpZcGRnQ092dnVyT1RObm40?=
 =?utf-8?B?R3p3YXZqT2tLd0pRcVlLb25MQlEyR0NNZkVCMDV1eHZsWVdKRjZFOXFKNzl5?=
 =?utf-8?B?WFJJaVoreU1nUEt4RzA0UlgyUzUrenV4T0NkWlhZWVBQRGtacnAxTzdOVlho?=
 =?utf-8?B?dWlGeUltL0IyZ1JQMlFlUGlieUxLejJ3R2VwYXlHRGhhc2NKOTlzODV4djdE?=
 =?utf-8?B?TGNUZ1BLajUxU3RmYXZrN2gybGo1VzdhN0YzamRJMU01MGZvc2Q0VEdYNWVr?=
 =?utf-8?B?VzVFOVE3UWd3cDJMSDA3ekxqS2FSNllwTVFiY3B0NjNjZUlZcDFLekFSKytV?=
 =?utf-8?B?ZXk0K2ZNUmZuNmsrbjhDaVZRbDBnPT0=?=
Content-ID: <CC7BC6FE10FAD5488107B4CB5172708C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f8488b-d174-4f09-3f4d-08d9a37cd1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:31:13.9770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVU2p2duWrIh1VCfWEP+nzQfX11BTXvr3HtsPNssI7kBQZ2HJp2pFenokaKeHkLo4xMjbo93d5fK0R9ocgu2OyJmstuvgvAE50hvtUHXlAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_043121_691697_0F0E24F3 
X-CRM114-Status: GOOD (  18.71  )
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

On 11/9/21 2:21 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-10-29 19:26, schrieb Tudor Ambarus:
>> The flash_info flags should be generic and not manufacturer specific.
>> Get rid of the manufacturer specific flag and use the late_init() fixup
>> hook instead.
>> Please note that sst_write is now set at flash level and not globally,
>> per manufacturer. Manufacturer hooks are generally a bad idea, because
>> it affects settings for all the flashes and we might end up with fixups
>> for "manufacturer settings".
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> I'm still not sure, if having a just one fixup function will scale with
> different flashes. What do you think about having an additional (opaque
> to the core) (bit)field for the manufacturer and flash fixups functions?

Sounds fine. I can reserve few bits to manufacturers and introduce a 
MANUF_FLAGS genmask for the flash_info flags. Each specific manufacturer 
flag will be visible just for that manufacturer. Please check patch 14/25,
I can extend the idea from there.


> In this case, you can reuse the same function - and then a manufacturer
> will make more sense (addressing Pratyush comment about a common
> manufacturer fixup here).
> 
> I.e. the SST_WRITE flag would go into these flags, set per flash device
> and the fixup can still remain in the manufacturer fixup.
> 

Right. Let me know if a MANUF_FLAGS genmask is better than this patch.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
