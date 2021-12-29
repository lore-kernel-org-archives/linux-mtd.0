Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8FDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glek3+Qp1FTzepsCfk/KykZ+2ap9PsS1i46EQO4PlKk=; b=knNvfrUr1x9F+O
	X/MxZVf1Dthb5Lq7Fj6tMhU/nL/1e7jwpDThEBdsMBI+L6+kjIiVfn0KiBkOerwSAGHYyF2PnjRMp
	rvZKu4wpmj38dWk3dgusLNtnL7F4Xe61rRKJMGImQ3j9ExdVMbv2UUkXuD2kNIndufl/5xSIlzul1
	kJTJ5ZSlLVnB3YUeywia9I1QHzKZqVZHTw02yAKe+dTZs1JPl5iQKDEGZeW8WSPs5eGu8qoIEM8tS
	fF841030PM0xs78zRTHnS9SeSKZ/2zW8trAlPGsIakRkloyb3QEbLzYzq5Wi1Gf3fYa011j6MNd+t
	y6olOy9ZeeHRPDJ3/8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ZdR-002uCo-OQ; Wed, 29 Dec 2021 14:08:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ZdO-002uCM-EE
 for linux-mtd@lists.infradead.org; Wed, 29 Dec 2021 14:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640786934; x=1672322934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I1JqoPfo0j8g/+IHu04hX2j09YlWmc1yJjuevpLKUkM=;
 b=nv4KqG+fm9vPuajkt3JM63je0SwbmE1F0YwMAV5cx4dhcHhf2ZjE64Sb
 ZEhBOP1My5ll/nL5yyS4+w4zlRH5SrO3MsMyAHO3QDYrzft5dx+xle3yK
 Tn/5IdqqpBWMuqJN6FHOKG8kL32N28yYgagmroshZ1D2vLo64JYsiNTpG
 C57ZytIvaAuhC50tVVoXDrWtU4Na2r0HJ53KI/FZqWvz989Zr3Udwv9rx
 N2sFKJV5+SZYMX8Znlx5lj4mMTpuWw+5z6LmxBwVMWS4i1c1LqycnaLSg
 z4N+JJziqXKnC5tWhXqFTwzvg8jTucmaj18+kGEjpFYW9KJ5OyjYL9TAe A==;
IronPort-SDR: WwnbdhJwwm5lYbcDhqjW51EoRN0FE+H72r0krNUWyxHZsinWSsG9Cy+y2Yfv85u2YxhbF8Nv2t
 ZjY4lzZmCewmEfP9yhXDZdYVmzOQpRBzwpUdJMLjnHruTFjl5AaV0ZY7qBAJIM77KTp/vBEREK
 MauN34iFGOuvxBFl1mphpoz81+WdAMSai9QTToV4fkfQ4jAzMn78YSlSAgtI3po0wyyVU40ZAU
 v4AV+uAUME5/yhF2CKOfiZmh0mRoK04tMXXA96nRgC7WsV4QEe1nq9VuwYCnOspYd7cfELC8v7
 y4n+CK/y4//wCSBOD0mFkCN8
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="80923091"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Dec 2021 07:08:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Dec 2021 07:08:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 29 Dec 2021 07:08:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC4ESC9pmKsHd9AZjcv1qt+CMWTM3aARLqPJCz5yWUkiZ26LbvNPNPho4OcdHZYh5CaCOQiaL4Z9OaRmpIm3P6q3FtEmztI8NzlDFhKhAGVh+Pqiq4H1k5fRoaLvhCdIPwPJ6jjG6nwuF7aZ0q5UdjyjovLBVZyaXixFL0pLyr6b6fnrws9jNyJHrK96Kv6jFECRyBPYagVPjPxuY17N+vI4bN68uBDCTueqSLlZSnfM1HXYHyj44Jdf9Eienmda1zC00hFbS4V45v1NESDpXFNutKCPbCRz3I4jguwQ1qBf3vgwoa9FAsbikW69fRkIyq9dTAxhkAi3xs941P82Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1JqoPfo0j8g/+IHu04hX2j09YlWmc1yJjuevpLKUkM=;
 b=mCorrjxyDaJrlfxX2b4cKRfBAqkzPzjwC5kR3uMPZAhr+OVRLSuz2kSgvrIj/rsosFAAsZrTm5RRZBYRaqqkZ9GdaLO4kv3QUN+GxyD9oRrg9UoUFgYVNmvjJKTvUyHoHdqNH6aa70498LXKrhS9dxMeqYibcyPCVx6hRbT1AWCMtBkK7M5o6lx3IMbAJkl3bNnZ4Xsj/xrwSeeY7CZvw5mMoskDmVBy5+DoXjujV7XzyaXZpxflCrayI7YyLyCkMAtw5LEdgmSOgZTp+iMJS2fbKOMcvUuVTdeyfM7BfXL3/4yYUZU3Xannwmo8fNAUHG8n0Jpxv6ybGBamj4ia7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1JqoPfo0j8g/+IHu04hX2j09YlWmc1yJjuevpLKUkM=;
 b=PcfZ4q0mu9F+I0+opdT71bwvUmBhS6H7bbRqlCNWqwnIxnvf7yCj5vAW4hOZWW32y8mNHoUDY6w/UgKoBFd+cQsJF4XZafu4DRE64u0qOjYltrouMQeOYw1SzbLb6aDM2WDQeGn5uTBK7FHPFAofNk3hl+IRF3m4AFPTRY2SdCY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3054.namprd11.prod.outlook.com (2603:10b6:805:ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 14:08:47 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 14:08:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vincent@systemli.org>, <linux-mtd@lists.infradead.org>
CC: <mail@david-bauer.net>
Subject: Re: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
Thread-Topic: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
Thread-Index: AQHX/L2YjpMNwBho4EiOQA8V0LMd8A==
Date: Wed, 29 Dec 2021 14:08:47 +0000
Message-ID: <0db13110-ee6f-2e02-abf9-d5b9eecafcb4@microchip.com>
References: <20211227091638.177917-1-vincent@systemli.org>
 <20211227091638.177917-2-vincent@systemli.org>
In-Reply-To: <20211227091638.177917-2-vincent@systemli.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb7bcd9c-6cc4-4fec-4bf1-08d9cad4bb23
x-ms-traffictypediagnostic: SN6PR11MB3054:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3054981D4CF65047B1F7FD44F0449@SN6PR11MB3054.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bcGQdjzRtRgrjPI9Ha0dNcsT6//UX9j4mYNDqXLxLxulkmTDDUc5KtrHUp8scWgoAJIO5/BQwpZC2dji9eD3PvqHKFpOUDqe20igNFKJvz+eqXSbrm27JSHiJpDlmXoOAKtFjmEGzkHKK8nkD6OvzaGrZGJ3KPBmI6X8IwpDKsuilwQoSafn44SrxvkGmz5tvjLhvoSu6kibajL2HFtQCLDlSFcuyo9uyb+j+5hp963pNbFAoEU9ph6es3D+6Fb3f4TiAXFMX9tSn9QuAypqKyTJpGgqI65/7mBhIj+5OdMdzs6xMsGrA8SVd6q+KOkJPXa76ITI8uKelwnNIyulLYxHwyEQJNitdshb+r1q8Xa9wEF6FfZcWtlJ3eHriYbQmeTKQc5DfF+u36vjW6u6+QvBFM30/k3194p8zwCP778E0uyog+rjtg1QWILMdnfXfTdGyfxszCD3qNC8NIDs5BLQnblxBNpDLUFxmv+LrSN64XriP9/UhOZjD8gVinQ6m24NcXIr+7PvKAfnb2I+p6L3JT457ppclZUJC/wx7NtOoN2EYDT0k2mzyBl6U3cgbXJelYcR/aGaxsTHhUH4uOl+E4iym1X8KEeHC1ZxJIO9ZDWb3tgpTI6an+2nU7To909CIT6yWyDuxVRPlF4yMPRcsY1eRl/pWx4kFIAV126jgqa1JtY6xEx2QL6/vvZcrthvWejzzv+NMclVYP6IJssy89MsuKirCb/nwhvIaOZwWEo0EO2+AK7FEp4JlCTM39qbLw4SFoR+gfHj6DjuFiJ0omGN2B14lMPY6MfnIGQgfJKQE6cVjt98Frlv2HH1LwdkLOKSfC9EZgc28llVLcPKqlXP5DFIkqQYbmSW+0c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(53546011)(66476007)(64756008)(83380400001)(186003)(36756003)(6486002)(66556008)(38100700002)(5660300002)(91956017)(26005)(31686004)(86362001)(122000001)(38070700005)(508600001)(76116006)(31696002)(316002)(2906002)(8676002)(6512007)(966005)(6506007)(8936002)(66446008)(4326008)(71200400001)(2616005)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3F2WG9JQUNQNWN6NGU3NGZUYnkzNFVFazIza2daMEdodkp5N1BRNlN6cUtm?=
 =?utf-8?B?VXlZUERkVlhBQ3BBUVFBWFN4eWZOK2wwVmhiUTdlYUVHMnZsQnpwbmVzQ1pn?=
 =?utf-8?B?bW1iUlRVOVR1czFHbktvU2o4KzFyZTN6QlJHMTh2MmtnUlFLdnBlM2V0RW9H?=
 =?utf-8?B?OUpvaE94Wi9mOTBqdGw5Nlc0aGFrY0NodEpRK1R5NVlkWXc0eEw4TGZsb2o2?=
 =?utf-8?B?eGE1eHpsSFRJTWpGYjU0dzVTcjN1cHJPT1VvTVdTZk8wcGVnSkJYVEhNN0ZN?=
 =?utf-8?B?L2FsbjNyMWQ0YUY2dUxiYXI0OG5ZMVN6NXNlRC9wTTFzbmJwOG5VVXY2eEhp?=
 =?utf-8?B?QkU4N1NIUmlzQzhOZjhDb0JmcnNUN2NneG40REc2RUFYSm0vcUgvQUs4d0lU?=
 =?utf-8?B?ZGFnT1ZYVWxsT2pSSzd1cXhsNzBiM0xWbWYySWFIbWJTbVVQZ2VBYllvZFZL?=
 =?utf-8?B?Y1V6b1VwQ3NTeG4yRzVJcXFXa3AxY2pYYTdhdFR5MnYzQTRXWlBXclZrUzRW?=
 =?utf-8?B?S1Y5N2FPdTFhdHk1NjF6bkZWeTFYeTFnak1mb3hpRFBHbXlNdkhYajlQS2JI?=
 =?utf-8?B?V1ZuQVAwOEJ0dXJ4bUFvS2NiMUljWUVPK1lVcyt4Wm9pdWJpQ1E5NFA3ZndD?=
 =?utf-8?B?TnI4VnpObnlyT3E2SnhpbkRuNm9UNmJISGUvQTNkVnEzTmF1Q3plUzdxTHI5?=
 =?utf-8?B?cy8rVUJ3WlpoZHB0WGVsYUt4Q2pjNHdLd0w5ZnUzd01GM2UvMER2QjF5eUhZ?=
 =?utf-8?B?S3E3c2dGWWtFRmlMUHVBL1RRRG9OU3ppUlNycDJEN0xGMDZnWElzRHJTQkZp?=
 =?utf-8?B?VXpJSVFFemN1dUV6cUpKaFRqWnluQSt6bkI4VDVuNC9nNlJsNElVT2gzT1lP?=
 =?utf-8?B?RHhJaVZ4QnI2UGY4YlJiZWJacDlCa2N0dVIyUThJWHRQZ3JZNWJ4UnZzdjAz?=
 =?utf-8?B?YnpzOW9GRDdJZmNoejRvZ284YTBmeUx2OEZqeEZ5RGw2RDZ6Y0U5YXpBb2RN?=
 =?utf-8?B?QTA4WWp2QzdDSTQrTzlZY0xWUElVNGhBWVJPNkFhTldJV0NyRWtJazNXeDQr?=
 =?utf-8?B?dFc3b2lzeDF6TFhyTmNlSnEzTEUvRzhQQ2d2ajFwSjJXWXlNN1VlM1hFUzIr?=
 =?utf-8?B?c1gwQlNzemVXaVVXeUpYZExtUWlpc0F0YXh2Z3NXV3NWcHNKc3BCTkxRbjV4?=
 =?utf-8?B?R0N3ZGxONkgwOC8wNnlIbkNtYW1CalplWFJITm90bkJCOFlNQjd0bk1XbUM4?=
 =?utf-8?B?ekpaK1E1Vk5xUW8xcVcreUN1SC9IeGZGRU9naVZYaUhKeVFyekdONjdodjJJ?=
 =?utf-8?B?TkdrTGxzTVJ0SnUzdGloRUVjZkd1NGpwVkcycjhaUEpNZ3FkSnlITDZzZGFj?=
 =?utf-8?B?dFBTM1NsSklocnBOWk4venZXYnd6SCtwVUZGOFk1MDVmekFzSUMzRjl5T2ZY?=
 =?utf-8?B?VUlnRml2enFMek11WDVuclpMam1VUTdodDJaaFd3Tzk3aWRLNmltSlE0OVJM?=
 =?utf-8?B?Z0JvZmJ2R1R6U3N5YXh0OXZOOGRRK2tvcGFhb3hsUmNIaXhHZE45UXdhSzdk?=
 =?utf-8?B?QVpObXo0eFE2eVhVQklhaFhKeHZWdFlvRzd6WCtsN1RkZ0lUaTc2K0Uwb0Jl?=
 =?utf-8?B?MDVpZ1FzMTRubmJ5RHFUVGh0aEhLVFdIUDhraWRtUERpOC9jOEZXaHlVQk0y?=
 =?utf-8?B?akRhSHBJT1N0dlM2bUhlbHlRVWFLdy90TEo5b0I0MXUvVHZPdzAxamNva0w5?=
 =?utf-8?B?a1B3RWJ3dCtKNHNYTEZaUG5ONytXclRrdTErSGRlS1diQmdXKzJDOUVSVWdo?=
 =?utf-8?B?SUZteldnSG5FWTBuYkU3aCtZZnRnQTl6S05xL1NFUGVkZTI3bmdleGQrWi8y?=
 =?utf-8?B?alNGekNaa3FFb3FpeThkak9vTDN5L0FxSWlFWXRYRnk3TzJ1S2c2YWsyam1p?=
 =?utf-8?B?bGc3blROU1RiMTk4ODRaQm43VFRFbE9ET3dtNFo0bk1YSzMxaE5RanN3S3dp?=
 =?utf-8?B?NUFjdmFxT09ZaHg5NTNlWElWTXA0OGhMcVdIc29xeXBqL2NYc2lLdHU0cS9s?=
 =?utf-8?B?dUZzRktOWTkyUGdsc1NyRmZveTE5SXJubjdJWW1DdkhERlpKUUlxSVFtQWp6?=
 =?utf-8?B?TVNsZy9ub3ZsaG0raXU4WlhaVEVYZm52VEExNUtLR2F3MFdrRXMwL3hpS1V6?=
 =?utf-8?B?ZXhyU0U3bVhRaHFzSzJTc0FuNHJqcXl5UlJZWXhkVjJiS2ljazJoL1BBUy9E?=
 =?utf-8?B?VHVKQ05mRWZsSzdsNGpoNjVLelVRPT0=?=
Content-ID: <78705C5B40FF464B81EA7AD316BAA5F9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7bcd9c-6cc4-4fec-4bf1-08d9cad4bb23
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 14:08:47.0917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zv2ugsGdRpcLoy+r6M0IsEUmcJIazj621tjssZ/b2v1yVTWuoUfYTmCf7dIPVIwtRmQSMuHgKcIwEBnsHMMMOOFvffHzdTXb5rkUUfAlkqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_060854_633124_DB8443FB 
X-CRM114-Status: GOOD (  20.24  )
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

On 12/27/21 11:16 AM, vincent@systemli.org wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Nick Hainke <vincent@systemli.org>
> 
> Macronix flash chips seem to consist of only one status register.
> These chips will not work with the "16-bit Write Status (01h) Command".
> Disable SNOR_F_HAS_16BIT_SR for all Macronix chips.

Hi, Vincent!

Have you checked all the existing macronix flash_info entries and determined
that neither of them support SNOR_F_HAS_16BIT_SR? Per manufacturer settings
are a bit sensible because we can't predict what manufacturers are doing with
new flash designs and whether they'll respect their "legacy" flash settings or
not. Thus I'm a bit reluctant in adding per manufacturer settings.

Cheers,
ta

> 
> Tested with MX25L6405D.
> 
> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on
> lock()/unlock()")
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Nick Hainke <vincent@systemli.org>
> ---
>  drivers/mtd/spi-nor/macronix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index f07b59a4120a..d530ab0b3b13 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -94,6 +94,7 @@ static void macronix_default_init(struct spi_nor *nor)
>  {
>         nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>         nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
> +       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  }
> 
>  static const struct spi_nor_fixups macronix_fixups = {
> --
> 2.34.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
