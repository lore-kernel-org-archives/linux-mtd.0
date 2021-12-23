Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+upgu6v/fSwomvA+/ariHrZSV4L6eUK3MLrCSQ931s=; b=PjoNEMsGDLiSoY
	ywMbcwE66sqWYAfJ5I8D41CFdUisSCGt03FgYFpKJRJDrsbqSXFZEamlZVxadISWB7pASKsIgDyAg
	zlRFPeYCEpCZhSpYCX0o1Naus5pso89lm0V3E0Kv4y/Xz8EDpyF8xqg/DFMUNqYMN322PGKC3JKHm
	Q2Ahe52kw32oI3+BsX70mRvsEjddyU4d3ATPw5KbD/jiWphfx22LQ7ja4LzHvSsYgStd56It+Bz1P
	/gFYR46Bx1uzaSsooRHrpfPTKuYiFcF55ELVKjXar4sO6Ho9NeieeVsX2tpMFL4dRUzNyIT7moY0u
	FLlGvJl2dqV4mxAOtbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Nt0-00CmTz-Bv; Thu, 23 Dec 2021 13:11:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Nsx-00CmSs-46
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 13:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640265114; x=1671801114;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LCu6qnPURvrDf+hymn/Qb8FwS7Qdv/il6FJhZgicC0o=;
 b=OPesccz7hVg/Yz0vYbzZT2J0A5cQtK4nCZaHmLNP/2o9uo+bVI5CkX/Z
 naTQAK8Xo0j5BdMlhjJVwD2Y713IYeAW2yA25GUmDww7rfpRlzUgD6OlI
 cht2HOmoAWzZayxCLK8MSebR1oM2sHQL7i5GkT37Vod0RyqxFxr7JHiXQ
 JaUEJ2i2bWQB1s8wPxRvoT4Z3p1wgzChzZoA1woTGV0MFwidCasB5DA1p
 zC/tP6XZP08vHAhSdWzDt7nZWOfyal+uxY309P7/IpdrOAMg0Kajr8Y/O
 FpAD3BI/Qfdc4289lHgx7cbaHKnZqmrPFksnguN447C5scPlQ/d/fhNT1 w==;
IronPort-SDR: Ug4E9LA63PeqRRkI4XOibCHrx7H/Ys9uhzUGsxEKji0vOiLNNrb2Tg2nyzGp1o+LW6uKIHHi8M
 aKhM9p8Kx6DqU0nfmck31y2a7+myCPJrYr4OUczkxXbnmrA5DqBxPDI69yT4QNLxjv/YSjSxQA
 qAqZHiQ2j1PyWGyrBbxVuQMTEIkhuHXxLd8X+p8MPmY25UoYRAtnayej/ioQ/Ll/D0LZ1jIY9U
 zpDtMenZJZ/K/pU5lypuvk0YJf270ncXIAMFLBnIS8emZfGfvUROB1/MgmG1usv+2QvpvNSkbG
 ABfRCisFlv1WoU8sL8VsgTm1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="140710709"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 06:11:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 06:11:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 23 Dec 2021 06:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb0aiNwS+ZXmKnXXG+YKvjQyXQ7wgvJ8Wncv8Zm/BjG4Y9QlOkhZlJodPEYHNraa4B0BfCUq/lcDdjEMgHp6dRIVlgc8OJUTT8cjL0VSf9M93T1tJtsksoY6bgQMPOPQcdUso2V6wvxb6XQmQb7qCF5WBtEzvxv+ZLM/NDGcP+fHU2OJUi54tfqe3qeY+p5/ea8j7EpPHG2ns+Nv1KBJVvwalhd6Buz5gb7/p2/IrbHQ1v1ngZf2VBEtacMqyAf9Wg8BjSRS9Nj5IL3gqYu1dS/0YzD3Ib1GOKtzT2fgc1Q9ZsLst//dNCzbGjlL/6B1oS23jm4taHLl/3HO+32ySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCu6qnPURvrDf+hymn/Qb8FwS7Qdv/il6FJhZgicC0o=;
 b=RJe11+OSinVtX5v8Zcr4JAY0d2qcnRzpMXZBCF6hj49ZY28wh3dagdmjZ8dtvfoc1IBXfx9NWio0r8iwQnrZyWM8gBpFTZTse/YJJkpRKxxCY/7Ew8SkODY4/5k/QlUuTxjEstFXVfC5Z32HpHNUP77nulaYYCCswBUgZTiHSvDbT1Biexx0WSvma4VTUFoHEkvCgOtiutZQJf0Ya8qqz5qsArTEta83pB4uXcdtDmqJfUOwhsvUWzNLLzhLbAmid50f+UAym53qmxDjxtpyivb/PcUYf+9g4JueACVtaAlT6OG1m+1Ddi7QolhiEMxR6mTeLYTm5lNbL+7T/AqCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCu6qnPURvrDf+hymn/Qb8FwS7Qdv/il6FJhZgicC0o=;
 b=Nw4XgRxLPSyjpaxFT4rKpDudq+ken2W4eP8nqCIvwfDPyOS3N6hUYfTd8jh4iKKTD9BQE+vLgdoVUxGa7vXJ4zuPzQvRUIt3WIJRLGh52YICHmCwfgxN+/lbXOfZCR0h897L/1vVpmwCejc/9gVwywzd2v3Xp5FV7FAbp++dYnk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2943.namprd11.prod.outlook.com (2603:10b6:805:d3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 13:11:51 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 13:11:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Thread-Topic: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Thread-Index: AQHX9/3dZMPS/7j9wEKlAvg+zFmXJ6xADU8A
Date: Thu, 23 Dec 2021 13:11:51 +0000
Message-ID: <d211abea-0a4f-d23e-45fa-319d7aebe52d@microchip.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-3-p.yadav@ti.com>
 <ec30ca85-5341-cd06-e007-c6c9aa24b0d1@microchip.com>
In-Reply-To: <ec30ca85-5341-cd06-e007-c6c9aa24b0d1@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 575701b2-de69-457f-a67d-08d9c615c8c1
x-ms-traffictypediagnostic: SN6PR11MB2943:EE_
x-microsoft-antispam-prvs: <SN6PR11MB294386A156E90D11BA89ADB3F07E9@SN6PR11MB2943.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F2rQJZXoelPFjxqPli6KIqoLNaWloOnkFCRRKoJ8tI3OUobOWofpafmTwiBczkt3sTOjektKz/MG6I+6VT24axvh04ESBkJej3kHKAM2tEQJm3vhXDvUuquXzsQLKyXHLmpVNm0qmAi14l3/9eGlyT4ThkXtkXL4x/iUmdy7JPFf6JM+hjx9lzM8FbAeBwf9wbIMZIBeeBuQMIs6Nt8lFahX11Wjm3X5bmytLULlcReUV7v7vjuYh76Tk+CoSBI0ESq4Wty3V24H71GJvvXcCUK528odGvT8/MGQJGFmQ0FOLrlF9o6hRa3eMcXLDhPWjWpqcc+qJF+LIXE+J4W/lMQM4MTyi0cLrTjS1P3aIl6ZTFhCwH2ysN44g8p52eHn6ZWr7x05loqRCAcELBzOZGjkAP9PyLQKmcAInoYz98YnKkECKt340i5JHiJpJkvAM3FUNmNUPJIXtGNc9PqNTVdwpYsEfc4YxcScZFUddHf724okgRCO//HaJ0AtYGzhdSxEuE80NtAIl6EgQzoeKNiIV6BZVvy2EaxDl/YW/NtYbfxnw8MGSw4tZ/VNRus1ONMCtpPeQWb3IluUAeLmoIZP8hlteZ+hGjyi8CDJO1UPPi153yOTT5lh4x/MZyacOf5CrVqrPNlpIGjM7y01ZnuJONIvx79xWcEAeWch9Nmm8i5rCY9MV0lHVEw1f2NP9h6yxLTTm6UvYUmawC2DxgO8OOyW6FifkZ7RDCQD5TDGe/0XpL11WPh8GurE9R1G1H/zcHPXg//l/I56+IbOjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(8936002)(91956017)(66446008)(64756008)(2616005)(8676002)(66476007)(66556008)(6512007)(110136005)(31686004)(316002)(31696002)(2906002)(76116006)(38070700005)(66946007)(508600001)(6486002)(83380400001)(36756003)(5660300002)(186003)(86362001)(71200400001)(122000001)(53546011)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXQxSldkQmhJZUNWRnJ2dUoxY3IrV3gySStqQ0lVeDBUVTV3M1RYSGhaTEhi?=
 =?utf-8?B?N1N0WmlYaTNVNGhIdi9mYmExQkxxeGszMFZwVjFaMC9zNmRzdU5SSmpoalcy?=
 =?utf-8?B?cjJWQjhLcmlNWkNlcFg4Q3QwZXNESEFQdHhoTEEvanY3VnFsbmRRT1FNSU0x?=
 =?utf-8?B?ekYycUkzTmg2VVB3OTk5QWNLZHU5eUo5WWJKdVprVnA3VnM2RkFXTXdXcThj?=
 =?utf-8?B?UGVJRTd2QmJPTVhxVTBWbE10VXUwZ2NTWHkrdk9jWlN4Q1IxWnZ1MEhUbkxm?=
 =?utf-8?B?YTgvNWxEMFphZmdJbnlndlhRQWVzcmtDSHo4NnkzRmxtU3dldjNFRFVWaWJS?=
 =?utf-8?B?RlJTQXlnL3JXT1U5M2IwbytkQzFGTVpEZzAwY0dZbFdIamNOOG82Z3hBY00x?=
 =?utf-8?B?dzdMTUpZSC9MeU9TSlk5RzhSd1RpamMrUTZxMm9vMzcvL24zN1VqdG14Tk1h?=
 =?utf-8?B?NDY3b3ZVS21ETjY3MVpibld3RUtFcU9RSDNwZzBpMzdEQ2tmVzcwclRhQVNt?=
 =?utf-8?B?bnhzclRqMER3aXV5bzV6QjhZTHE5WkNVUys1T0VUT3oySFpOSmlGTjYzZEZY?=
 =?utf-8?B?WkRFVWpCOUZVSEhJeEYyM2dEeWVOT0s3NGlha1ZHV05UbitLcllGMFNKL0c0?=
 =?utf-8?B?aGd2RStXTEpHN0ZURHBIZGhqbjJnbTFFVVF1NUhvdFMrQU5CVVV2V2hhQmZl?=
 =?utf-8?B?dVhEekd4RXlHRTFnV1J4OE1GN01DM2c5NDlyQXh2emVTTHBCNXRiNzQ4RjlD?=
 =?utf-8?B?cGxnd3RUMWN5MytBMElMbE0xTG5uU3dSYlcvcFN6S3RHZm1nanQ2MHNpSVJw?=
 =?utf-8?B?L3hXM3NqT2Y4QTB5eTd6cW9zWkMwOXZuajRjcU9HME42YTBGWXZGSkNOZUY4?=
 =?utf-8?B?S3ltcVIwOXJIT20xMXBlZTZuSVFwUmxrb21rbFdHbzZsLzFqU1UxeWx2amRs?=
 =?utf-8?B?T1NxeWc2aFdNV21yd0tzeVBSVGl4OWZyNElhKzgwMHFyWEhRMEtuVm1YRDE2?=
 =?utf-8?B?Q0lMSzI1cnpYdHFXN002MGYveDRJK3Z2V1BHYkN0enRvUWdsek1CWWI4OFZO?=
 =?utf-8?B?dWZCREF1Q0gya2VQZytheUtNaVVYaUI3V1hRZnZKNTdXYWgzaXF1Vi9wMEZx?=
 =?utf-8?B?aUxUNnZxVEtwdG0rVTlvSHpCZjBlSXEvY0NhNGo5c2ttbkpJUWJnS2lmWUx1?=
 =?utf-8?B?OU4yZk0zNzR1cFk3aUFxakY3clpua3Y4anQvV2R1am9Wb2RxOWdRaW1NaHo1?=
 =?utf-8?B?ZWliOCtZejlhOVlGbkhjRkZOUVhLR3VwdStQakh2c0c1ejdaV2p0eXl6ZXZ1?=
 =?utf-8?B?YUhlVS9DdWgwcm5RUE93UklISTN6UjRJKzNFbTdZanhaRGlqb29RZGdBQkpa?=
 =?utf-8?B?cGhLc2JRbEgxeVVqMlVwVUlab3ZYbFRSWk9sUFpNMjA5TEo4V0NJUFVKL2V5?=
 =?utf-8?B?NHIxakRETThmL3lBRFd5cC9hWDA4QlJKdkptV0hWdldHSm5HUGozUTVQZTJG?=
 =?utf-8?B?akdhbzFpc1VGQkZKeWVwSXIrV2c2Vk56RE9tY1FvcldVT2lYMUJIQ0s0Y2Vo?=
 =?utf-8?B?d2RCOCs0WkZHeHp1djhpL1M3cDFlRllhSms0bXA3SUZLbmVMbFJpTlZuRkFY?=
 =?utf-8?B?N3RDMERNZTZ0SUtjZ3NNbHp0OUlobEgrRWtXZ1RHd29pR240ZTNaVGRqS1M2?=
 =?utf-8?B?RzAzMktseTNCN1BNckZRelBtUGg4YWlRZVQvUHkyTlRrQTlPMXlONVE5MWVm?=
 =?utf-8?B?K0tUK2dpT1lzb01GalVQc05NZE93ejBPNkdEdTVmRUIwUDZwVlM1MkF2MEZ3?=
 =?utf-8?B?LzRqN3JiTGlUUG1zZkkwVVpicUJwcy9QNWtoRlpmS0VsUmhQMXJTQThzV2RI?=
 =?utf-8?B?OVpnQjNvbmxqMXBTdmwwUG90QkUzcm05VDVmWEt1aW45cU1DRFBRdFFVQVJk?=
 =?utf-8?B?T09ZMXJKUUFxbjJpRVQycWlZY05MVWtKWHNCQmtDK1QrVmcvSkhiQ2wxVDcy?=
 =?utf-8?B?ZkdMVjAyU2FNcGpPQkgrby9kQzk5YlRPOXY1UVZlTWUwc2VvZGtwZGkrZi9u?=
 =?utf-8?B?ZTUxYjlrVERSZjA3NDJsREFybUx0L25nV1JsVWk5SVN5NSs2VW1CNitvenVK?=
 =?utf-8?B?M2FhOG03S1l4MzNKUkRvOWRVOHk2bmhiZXh4N2lTZFY1bWYzbFpKYm1UVkty?=
 =?utf-8?B?aGMrZ2dRampvSzhBWUpPMjk3akkwajNlL3lOeEV0eHBuODhFby9tOXRCczQx?=
 =?utf-8?B?Z08yS2ZkNTg1RmdENGMwL2wzWFVRPT0=?=
Content-ID: <98EE2BB807AAB946A46FAB9EE4B1DB5E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575701b2-de69-457f-a67d-08d9c615c8c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 13:11:51.2839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80GY8HXV++BLittrSNAjTe8jlmnDlIgayPBf1/Cpvf3dvuMu7feGF8hi0OANhO4kfd4K8uJJYK/Hx8skZ/syrjyKh7iP6zcZJcxylCj9B/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2943
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_051155_342104_7872ABE4 
X-CRM114-Status: GOOD (  18.55  )
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

On 12/23/21 3:06 PM, Tudor Ambarus wrote:
> On 5/31/21 9:17 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The Octal DTR configuration is stored in the CFR5V register. This
>> register is 1 byte wide. But 1 byte long transactions are not allowed in
>> 8D-8D-8D mode. Since the next byte address does not contain any
>> register, it is safe to write any value to it. Write a 0 to it.
>>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index ee82dcd75310..e6bf5c9eee6a 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -65,10 +65,18 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>         if (ret)
>>                 return ret;
>>
>> -       if (enable)
>> -               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>> -       else
>> -               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
>> +       if (enable) {
>> +               buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>> +       } else {
>> +               /*
>> +                * The register is 1-byte wide, but 1-byte transactions are not
>> +                * allowed in 8D-8D-8D mode. Since there is no register at the
>> +                * next location, just initialize the value to 0 and let the
>> +                * transaction go on.
>> +                */
>> +               buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
>> +               buf[1] = 0;
> 
> how about writing 0xff instead?

patches 1, 2 and 3 look fine, except for this comment. Would you resend them, or you want
me to do the change locally when applying? Send me an updated comment if so.
> 
>> +       }
>>
>>         op = (struct spi_mem_op)
>>                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
>> @@ -76,7 +84,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>                                            SPINOR_REG_CYPRESS_CFR5V,
>>                                            1),
>>                            SPI_MEM_OP_NO_DUMMY,
>> -                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
>> +                          SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
>>
>>         if (!enable)
>>                 spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> --
>> 2.30.0
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
