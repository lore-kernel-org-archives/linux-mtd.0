Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D7FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMh5h5eRR9KBF84H/J8/YEZ624+gzRe2NNcjK435/00=; b=jubcU2vR2gJ9Ya
	6OXWZr5wncI2kn4B+z7h67H3SUsO5npms4NBK68I4KV7swuN2EL+f717gH72nPO/lKQL6Vcw19vdi
	RXgbg36Db0qxINvLg6Yr+Gp1elYVFf06VWew9CVEhxOOouZdCIbIr795KlonZdkrRoPEM8fULYJRw
	Wyt26XxV96IWimyIuk8vOP7IfXj7DOq0Rm24LQdixYessMLr+nRZclG1O839OLcfJ5DSwL2JXvmHJ
	HLeITjhDas/xIuAtNZqeHsXIOLDvDSTQo+mJqMTn8i9gLdujGROYRf0C4jQMzDGfH+XEat3din95J
	aMK8V0tbL1QQoYeNvLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNaw1-005Dio-KU; Fri, 25 Feb 2022 13:47:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNakd-00595Q-LJ
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 13:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645796115; x=1677332115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hBZaWVlfL8vnJAup42vuxZndGzmnXYoJlPHFqst47/I=;
 b=u3gVKpgHOlBpbSgofTsNR5GUwJ8WG3qjjL9cy5lkikYNSOAzlmtLCTa8
 U0PGuMdxiLKIv/boR2wG44vsvF8W9KLd+88O4nHQombrUwECcE8R/onS4
 JbRHw2x+QfLpZyprsE07VvTmjZgVDWkNcrPWAmR00P1BMZhXrKQydzAt9
 XKk2/zW6KRn83n2H3vx3h+WOHdESfk0YSaONN+EhNzq4ODMlItZhStYJA
 FofgULeT589W/v15i6PNdgW12hWhdvQGfwBoU/xsz+9We3ciUTkSGT/31
 02LsBfgutXDDZ0TARk0/Kdv+2r+RWtpQ26MJdV1LBPIWWxd5JFti7DWb3 g==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="163648923"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 06:35:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 06:35:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 25 Feb 2022 06:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKq65q8pKRI91QW7u6gNJYcwjrhJFKihiJ6Ip8Awz3ieEiMUr8XHF+kMXcFB0IEhRzmKUQWp/w4S93TOGIU44cG+H44RzVGh1pbOALdnDx5IFjKuNXr4YxTnhGItZvXgpLNJ0SWtX/4VGfeKgXO1eM3gFlqZZmPTmnkIMgQNqxUSGc8Ex/UQw3r/4UGzo/ykKXZIuOiW9KwXcDilcCTxv9swIFsMMS/B3XoEd0Pt10xyz3/HnH2oP5eBX16nQlWvBmn5nULwJGUuOWYVFUkiBn11pcRXSOtk8CFf1uCFnSF5D9tdTZoeMR170kf0TUZX1nYPk+N1bTeRzctSlx8Wdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBZaWVlfL8vnJAup42vuxZndGzmnXYoJlPHFqst47/I=;
 b=llte74OHAEh+5zHPwFxig6fvMMakJhXimx+SgeA0iSBefZJcgJC/8+fomRsULnSEj/BDkBUqlTZL9yi8ian7XlB4XSxK83P7xO68W5fmwfMWySF7fU1fWdMmIwuesv6X4rhUith7iy1EGNmbN8DUhHPdvuLLUzY+lvpuvgNRpqEQ7nZscQ3RijPJChfWNcBoXIzybwaEMyPDG6JPYldD8lmt3uappLAho4lqT9dCjZo+y7Gen9EGWnFmTVtS/QLFIvwyHVQLR+Nk8YhzmoA3+oxSMs23zuHQxR2oLrdswLFhzzfpc3h4fkvmIrqyrmffaM91yfNPGiROZuKay1YHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBZaWVlfL8vnJAup42vuxZndGzmnXYoJlPHFqst47/I=;
 b=cdmcjMZKqJ/bz0pTDLiOWewIjb1pChxOyWrt6s35rYyyuWGGcLXoAasE2mIN5YgC1YW3dNs66JstxugIfiPm6SuwlCgU44xSvFYHUxE+VW7/nIk2YxWevGMBCPxcXsgZ7vWYXa2IRxWqJigKEqbhrGyA3tll4X2VhlUwpXvpepo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Fri, 25 Feb
 2022 13:35:06 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 13:35:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Thread-Topic: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Thread-Index: AQHYKkx/rOWxu2o8UkShyaiFUyzsrQ==
Date: Fri, 25 Feb 2022 13:35:05 +0000
Message-ID: <5c2ba6a0-a06b-d4dd-d503-1ddfa76f9be4@microchip.com>
References: <20220223134358.1914798-1-michael@walle.cc>
 <20220223134358.1914798-12-michael@walle.cc>
In-Reply-To: <20220223134358.1914798-12-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11da84f0-fb6f-459f-4597-08d9f863a272
x-ms-traffictypediagnostic: PH0PR11MB4822:EE_
x-microsoft-antispam-prvs: <PH0PR11MB4822EBF49DE3CE9CACD3D103F03E9@PH0PR11MB4822.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLKhbJ2Xh+o9FBT/rjKo1NDpgrNiq0uJsFr7k137315cw6UaATrDOMlfEjNquixDMvTjB7oWdNAVBHUrLG+7dWzEmCzTpyqEsLr4AmLCWwmfbEq4B8RH/w1gPNKpAYEsGKD5p87SZRjNJPwOWk2kYRN5X/CZ4mHtu3PgJrRE+DIHmU4q1cWbaR4+mhTkgG7GyT83lYTbJKxn3kLpWnAZPmSQQdi/BO9yQ/QfiMyWIW5uu6tIA8cB4gvkWXQmVg3FYRabYdZIG6qyC/bmQDeS0ewqQ+ImMJvndHMelGWh2kL8BCZ/O6SdxhEWZDRxigKC8nGEDHIu/QBp+WB262I5Lyt05FPksH1v2STdswRzt+XciQQcKQnpaFiPRuK+xgHPNdWLjWcVFdOxqXtjSs3EcccfMvCq8roppOYe5/ncHFQmPkN4eQH15x8pMvih668H5k+wy5OjQYM3u8x0EBR5b2MSQkGVlDRxQbgcnKCokgU/O1prFg2ok2USA2N7sHqzKArGSa3Sms76D7VPZsm7ja9gycVZfK+3jcO3tiEhAMAGJkkjIfQvQshlpGoftqOPH8JHxJ/JdUuSzx5Zya2AM0340pNdE1qlR+WsfeXo6QUD0rtj/0I2scKyT4qD0epUDmOpDfAe1UsITcHiMsdyXNPFXJ5UvdMeCjczZ2keujwo3n4xRU8Omtv2Q4wJ12yCzhRDad69/nhizfVfMhQbgrG9AHVEXEDuan8GTT6hpNS/J4oHK4e9E1gWZs92AFcTpVxNDQuVQgqUt2ou6kGOTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(186003)(54906003)(110136005)(31686004)(316002)(6486002)(38070700005)(26005)(31696002)(86362001)(36756003)(8676002)(6512007)(91956017)(66946007)(4326008)(71200400001)(53546011)(76116006)(64756008)(83380400001)(66556008)(122000001)(2906002)(66476007)(66446008)(6506007)(38100700002)(508600001)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODZ5MUhXZ0x2NHhsejdZNlhPbW5HY0pHTkUzbFVpRUloVEhOejlZczFqbjJz?=
 =?utf-8?B?VUFOWlp2U3VMZEVudW5TcTRhYmtNSG1pTUpJOXZEbVZXSk9qMGpxWmhqcWhm?=
 =?utf-8?B?MzgyVlN4VVAyaDV2eVBZSkUyUmlXbzl1WE9JTzV5REpYalRnQ0pFMVFHYTlq?=
 =?utf-8?B?dTYxTkhkdktQUmdUbXZXZ3lic291ZjBIKytzS1U1VTl0YXo5MEZ6NUd2cUd6?=
 =?utf-8?B?T1lhaExabU9ENnZQTGlEU2NnbTdEL2g1VmJpVGhhemFTQzBGc21iREVPU25E?=
 =?utf-8?B?S0JvdWFoT3dEUHBlWElSMEU0WkM2Y0tNMW5RbUhPL0YwTkptYkFlQ3h3OHJk?=
 =?utf-8?B?SGJhV1lreHpVaVIxZysrZHpCaFBnVlBwNXVMelZkUVkzUzhZRWNjYWZDcWhE?=
 =?utf-8?B?WmZwekFhOXAwQ2E0QzgvVFlXZjlLbUtFWjcrbmE2ZzQ4TTdBd2NXZmVjSFV5?=
 =?utf-8?B?Z3JMS2ZuTVRzZmVoMitySUxBeVMrbEx1akNGWk4zZWNsTWNDaUZMSDBmd3Vp?=
 =?utf-8?B?L1FFK3dzdUlhazVJNjVCd0JjT1gvakV3RVB4UHF6TGJnNEdoSklnUEJKdkgx?=
 =?utf-8?B?T20vQ2dVWDZBcE9PQnFReFEwenl5WURvOXdFdzgvaHc4NDFwY0xaakRWQ2xi?=
 =?utf-8?B?bXdjTFp1MXpJWGlFMGZWb2FCcm1qM2k3Z2xNS05NQWpMb3NNY2E5aGRqU3lP?=
 =?utf-8?B?cEV6a1UyMGg0akp2SkJlb2FobGwwL1E2SjNJb0FpeDVYRWR5NVd4S3NuUlFh?=
 =?utf-8?B?ZkVOWFZvTEYveUwraGZlY29JYWFIT3orT2VwMGVHVU1kRGRFM2lHL2pZM0Fw?=
 =?utf-8?B?Z3lWYWlsdTlzQlhmVEdJQzdhV2tzdzNjUDAya1hVS3p1dHhGc084NEkyRWJm?=
 =?utf-8?B?dXIxb1VKMkE5bzhCaXhTSksvRnZ2bDJmL1JzbmtXR3lSMk1MZ2pNWHo0eDUr?=
 =?utf-8?B?S1R5OG1ud1RrcDJ3bUlFNEJqSnFsTUx2SHoxMVYyZDh6Z3g0YjlKSlBpd0Qw?=
 =?utf-8?B?dEwyeVdwTSt6RUJsa0l3K3ovTHJzbFJzbmFoanhOeEE5UnNJNWh4TVM5akxt?=
 =?utf-8?B?aEVJc3g2WDNESFpoMWluK1ZiZHhjRUxZbUYxY2RqUlZZME9JUEcrcWkwT2I5?=
 =?utf-8?B?eUFESklIUVJnencrUENCaXZnbG8yQ0ZNNWJkVSt5eFNhZURsMXRPWlZzY0pM?=
 =?utf-8?B?NThmTXIrbXY5aEZvSUFjK3pIRzBjWithYVh1NEFwSHg1VkhRWVVIbkREL0cx?=
 =?utf-8?B?MHV1QXdJSE5JVGxZendpRVFJR3J4TEQ5Yys0TFkvTHJscWdrRUY0c1BMN1RM?=
 =?utf-8?B?TWF0ODRGNUgySzh5ZmhweEdCWkM1eVJiL01ERUZtYjZXaFNDK3pyVkVtSDRW?=
 =?utf-8?B?MWtwN0ttTkhmZHpZRWlqTmF6eGJEUWRGZWFWOGpveGRqMXg2bGN2L01zdHJm?=
 =?utf-8?B?NVJNZGVrQzhBbG5vWUVNeVlhdWJOMWgrZXZRZ3BUUnNsb3VQcm5vWDY2bE12?=
 =?utf-8?B?UC82NlE3MER3MG1LcjNFUmhMS1gvZlZBRFZZV2Q3MzhEM2MyUC9tOWRYOGNK?=
 =?utf-8?B?b001eWZzZy80cEQvczFaOWpCc2tXU3dkTFJobU1UdS9abXlpV2RjeFZnUkVP?=
 =?utf-8?B?WTNzM25kSHZWQ3drMUh1QnpqdFg4TFJ4WHU0ci9XamV0QzZHSGdhcGhMZ1RT?=
 =?utf-8?B?TFM1eTR6NkZobGl4L1RCYkM5TUkyQU1OZ1pGWEJDZGFkNnBYQjZBQko4bkxk?=
 =?utf-8?B?bS9XNGh5RzNwMnRSbUwzYnFDcWRmR1FscEJWVUlIMnBlQUZtMm10ditYV0ox?=
 =?utf-8?B?NWkwVEdpcVJtL3ErQlVyNzgxRmwzdUIwTUpDb01IeHJITk9qOEZBbWNTd2x5?=
 =?utf-8?B?VC8xRHVRKzMvN295QktRSW5NV2t3WWFrbXdDbFJIMWtZV2E3ZFRXZWZBajV6?=
 =?utf-8?B?Zk53ZzFJNGhIMlMxd3dKb2IxTEMzempUUW0wYlZIa08vZjZQT1VpMGlHMHI5?=
 =?utf-8?B?QVQvRXRzWnlsOHdwZDlvMTN6WFR0eXFaa2pwMDFFandpRFM1a3RXZDR3cWgx?=
 =?utf-8?B?VnY2NzVYbDFaSEhzYUxsT0x6RDJCV0dVSXpLTStLcVZGNjJmdUFIaGNrbWo2?=
 =?utf-8?B?NkF4djI3bzFSRXcvSzRsSWRPdGd5bEdNaFNENWFheDRuQjdUMFJ2NVVTQzBl?=
 =?utf-8?B?eUwvVTEvSTljMmlMd1dlZ0RZU1lZb1NWemdWeUN4dVA3QXRDcFdOanBtZGFT?=
 =?utf-8?B?elp2Uyt2VEt0UXV3RzlzendRL0RBPT0=?=
Content-ID: <2F661B0AB01A7943B5E1B254492899E8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11da84f0-fb6f-459f-4597-08d9f863a272
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 13:35:05.9377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnz4NWWvjIJ5CW+q4jfmWwJECNFRjYuMgZ5NFcrmhd6tQH0NQq+kXd1NwPo8kToOswBeVA9eVpJ9wRSWjMs8FzHBjg5D7ZMybFovjny9qoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_053515_838324_DB2E0FF4 
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

On 2/23/22 15:43, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> To avoid name clashes unify all the function and static object names and
> use one of the following prefixes which should be sufficiently unique:
>  - <vendor>_nor_
>  - <flash_family>_nor_
>  - <flash_part>_
> 
> There are no functional changes.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 34 ++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index bb95b1aabf74..7a68f2ad3ea1 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -17,7 +17,7 @@
>  #define SPINOR_MT_OCT_DTR      0xe7    /* Enable Octal DTR. */
>  #define SPINOR_MT_EXSPI                0xff    /* Enable Extended SPI (default) */
> 
> -static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  {
>         struct spi_mem_op op;
>         u8 *buf = nor->bouncebuf;
> @@ -102,7 +102,7 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> 
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
> -       nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
> +       nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
>  }
> 
>  static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
> @@ -130,7 +130,7 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
>         .post_sfdp = mt35xu512aba_post_sfdp_fixup,
>  };
> 
> -static const struct flash_info micron_parts[] = {
> +static const struct flash_info micron_nor_parts[] = {
>         { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512)
>                 FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
> @@ -143,7 +143,7 @@ static const struct flash_info micron_parts[] = {
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  };
> 
> -static const struct flash_info st_parts[] = {
> +static const struct flash_info st_nor_parts[] = {
>         { "n25q016a",    INFO(0x20bb15, 0, 64 * 1024,   32)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
>         { "n25q032",     INFO(0x20ba16, 0, 64 * 1024,   64)
> @@ -250,15 +250,15 @@ static const struct flash_info st_parts[] = {
>  };
> 
>  /**
> - * st_micron_set_4byte_addr_mode() - Set 4-byte address mode for ST and Micron
> - * flashes.
> + * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
> + * Micron flashes.
>   * @nor:       pointer to 'struct spi_nor'.
>   * @enable:    true to enter the 4-byte address mode, false to exit the 4-byte
>   *             address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> +static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  {
>         int ret;
> 
> @@ -273,28 +273,28 @@ static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>         return spi_nor_write_disable(nor);
>  }
> 
> -static void micron_st_default_init(struct spi_nor *nor)
> +static void micron_st_nor_default_init(struct spi_nor *nor)
>  {
>         nor->flags |= SNOR_F_HAS_LOCK;
>         nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>         nor->params->quad_enable = NULL;
> -       nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
> +       nor->params->set_4byte_addr_mode = micron_st_nor_set_4byte_addr_mode;
>  }
> 
> -static const struct spi_nor_fixups micron_st_fixups = {
> -       .default_init = micron_st_default_init,
> +static const struct spi_nor_fixups micron_st_nor_fixups = {
> +       .default_init = micron_st_nor_default_init,
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_micron = {
>         .name = "micron",
> -       .parts = micron_parts,
> -       .nparts = ARRAY_SIZE(micron_parts),
> -       .fixups = &micron_st_fixups,
> +       .parts = micron_nor_parts,
> +       .nparts = ARRAY_SIZE(micron_nor_parts),
> +       .fixups = &micron_st_nor_fixups,
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_st = {
>         .name = "st",
> -       .parts = st_parts,
> -       .nparts = ARRAY_SIZE(st_parts),
> -       .fixups = &micron_st_fixups,
> +       .parts = st_nor_parts,

you have st_nor here

> +       .nparts = ARRAY_SIZE(st_nor_parts),
> +       .fixups = &micron_st_nor_fixups,

and here micron_st, it confuses me.

Any idea when should we use just st, or just micron or micron_st?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
