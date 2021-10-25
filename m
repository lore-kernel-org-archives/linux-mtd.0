Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52022C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 12:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 116E760C49
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 12:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 116E760C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWhsA5Da1Bi70n/D5i1QCyelAeu6lkA+B7+l2Ib0J5E=; b=WJIs9ih3FDFqSN
	fzTwjQpD7yF3CtVdscl+/TM+vWS1+AqoumaGYDUIjjfLA3BiIKOs8Ewd+b3/p2wI7b0FyslTL0X2v
	ZBD1eSxXZTHG8TPxc8bu8Mhywj2yQpbaTvw+088ejXM2Dhcf3OHZ5QyaxGLQeCsT53vWJFp1LiZfj
	ysqxxkhIt/xJtRjIsH4BMg6CSmPgIO20kBU8Chxf0K76pdb/PCN8nTM2UMYcmrtYCp6A2eOSK7cBJ
	jJEyJWumZgANRLf8aenP72yTtt0lEkIPc06L1r0PpBnVXRVEi5UxdNOLuj3lVDBm2Xcz3sVDSS9Yx
	SSJ2jKz4NOeKEukZlSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meyvq-00GOLk-UQ; Mon, 25 Oct 2021 12:18:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meyvn-00GOKz-EV; Mon, 25 Oct 2021 12:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635164303; x=1666700303;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NGwn7RjcsbhDOJ3gTV0Yb2trKalPpz6tEXnE9IwoMhE=;
 b=qyeJfYBW0qhxkFPDZef729YeGDHaun53kRTm1G1TEFH7fwii0EtvkcP+
 HFlFZoR2pYrzJUB83Z+eEOSNLY0rzG/ljojAaUIR3Zw42C2HzZT/yTLk/
 GGLpxde7kDe5bnGIh+023j3WoF159q4Sr4SiDvaKfLe6HhLdEA4uW6VzO
 q74bOKRYlCqXvPSm/ZTJBu6+FpXPQaFsJPWrqeieUD53G5kN3QPi6FKmV
 dr0g0Vyn779Dmcr6Owblhl9K4CkeCGJZ4MaG/Ab3T1TrOGcIeaE9AaR8t
 E1Ecplz4FWf/YY1xYAZOB1aCsmMZ4JXeNRxOjhWBdueJcQDndWDlT8Pu6 w==;
IronPort-SDR: Y6F+rWmide8PhwNRjCYtDVe+GONJkldWVRIYHnx5KaCDZ52Hs34WQjFXMBF/uZT/uG+TtH/KCp
 274YAis6yXu2aSuXzW8B17ILTohoq/w0gbSGl65NxjH+hJBfmR1sZJsbc7i91dXLVSVkiZXova
 +vI4Q/e2uZjrG8pMbjHnlHFvowRMzSL5Qa86ZoROJLmC407rLNhR88FHNfXEl4pMiP6QpLnQpa
 RKCkxpa3ru8iDwtZMy6mWP/yFr3gBGUUKQ3Bb28IMjhBQujFyM5J0wWyJKGXT0lEeXllUgQz59
 HVZd6CB5agU4ajg1PUg3gdVQ
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="141566176"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Oct 2021 05:18:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 25 Oct 2021 05:18:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 25 Oct 2021 05:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpmzFupP1m5cb+fkKzvCeKeV2DA+v029ABDUBBbDNOZli8F2iUDxFxhC9WVPgxD2NVfsd/0lqEA5JW0ifaxXax2y+hh7GfM0ShW4aDRcv9VZenh/HxlFTKEC+ur2mbL3LnHUz/RxbqNtCNAW7pjZDA4s0vdow9RIulVaAJ+e3D9JwAKuCVsZmy5UFxPn/FV1C+jGZ+nFhu9G4tRWztiygaL0tAmGWS9emGWX1Db4hZiCs2gkJf8tTyX5xDwrXJ5/wwV612Vun7igeR44k3kCoupotp5RjIJmyzwZjwtsdMC/NQSc1jFq6qb4hVrQSMbzvi+nZlcu2Mo3FUyY4ZtIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGwn7RjcsbhDOJ3gTV0Yb2trKalPpz6tEXnE9IwoMhE=;
 b=eKyC1bhcr2xP3KGtCfpTvee3YPWoWAt3yUIPff8McvJGkQaSmqlVMhzKP97y28QQT8jgoOAEi4hb0/Y2/mSJWKkXNk6WCkKHTCw3KEllYNul3svXtNRSK6HCWAXJ6mIcoJEivk8O2KYDLy3UsQeObmza/2S3Xe4kF2pTZyRzqJfSkoKzOWgawGYFqFuHmPB17OJ4CvZU3VdJNvv3LXMYWIkMlYpmoiHbxoIOA3hLjLkIBKDeVW+opqdMZSuYyt6StHn65+SFuKXet9VlATEhIAiwlvUjaNWSDQ3IMUYVwxg4vbQcMNw99gsDPKRvsog8R8H8R8A8dwaKRHTNx6JRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGwn7RjcsbhDOJ3gTV0Yb2trKalPpz6tEXnE9IwoMhE=;
 b=FRsPLLBC6Z2NmEwStqrS1a+cwoYhD3sBQNC6n7nfWLsDWzT9RlAT70qEswcXBs9Rnk9iW7eNMiv/SHU/XPR775KUzsp2QJxaxJ1wgdLMENB7A3FpytXCwaTvfeGS15+yrkjevwozIYXXJIW+ThyWKmekQEvQDo5pI0Nw7h1aTI4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 12:18:10 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 12:18:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Topic: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Index: AQHXx0I6UHICDZIL9kqtt57ceHbdbw==
Date: Mon, 25 Oct 2021 12:18:10 +0000
Message-ID: <8ce9a228-3d38-1be7-a987-fd20208539d8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
 <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
 <20211022121010.mzul7qsxi6s4ru2w@ti.com>
 <eed6741d-cbb2-4f67-2780-6ba107eec0f8@microchip.com>
 <5a1497c9b2f07b2e6b91deb8ef17646f@walle.cc>
 <9bf93cbf-fc57-54ae-2439-45e4d75dc0b7@microchip.com>
 <b06ac5238d85f62ebe588f161e34cf59@walle.cc>
In-Reply-To: <b06ac5238d85f62ebe588f161e34cf59@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fef7893-81e9-451e-ae34-08d997b182bc
x-ms-traffictypediagnostic: SA2PR11MB4985:
x-microsoft-antispam-prvs: <SA2PR11MB49854133330029B59E7B0D0CF0839@SA2PR11MB4985.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mFNEKkd6XyyrX8tK4E+GBKNf8IOQNZzBv49NLJB1yQWzVn6eod49gIWEs4t7yiREivyK54XfROQp+SIpe73Y7kUByERpMAU4TsmQJr6wQMFOcKoQ0FX63dSRsmwFUbwwrmV6Nz15705h2f7y3EMRUxbh82E7mq3rrsu/7lQKaRKOuioNPl9MwSjsYA2UAkUObQnlkGWbd51W1Ilb+aPIZnjw+P9Yq4P/1lQs7I28xnn4Vi7+1yDSJuvW2NlP5OncBQ1NkAtJ9dgs6NFHhXByV24sYuIULqu0dF99oE5TAucRYDHvN5L1My2V06BsiqthvYfCGyTNA3tvZQ0nTbhEDO2qbpNJ4/aC+OzD3L7Z/XsBZfZrsWM51jHl+zXxwk/0ZO1gpEys6RRjc1VE1g4oCt16ENOBvvxz8sbK0kSwvFjT2K1yjN+qio8j0f6Paf3tQQ9MHWJ8D4cT6euwcec9Cr7fSIyp+DsD2fJJgLTdaRj8DekoSAXUSNGaQbXW5oEkDtONGZDjwMig9WFZyWJVMA82giIilSZ4taQP73DGTNvdgR2qjEbf7YFl7GrVXEW67pStQSr3v0G09FN5Oem94Efot4Qn4y8GJ88mXakY0GdjA3l+9DmGgVDO5jhvf5eZA/SyeVmdADLkOKMR6KRfFol/jc0gWJpg8JF4RArWuH6oqkivRiIXqvV+5AKmex4Riszn6Ng86VtYMwqR8+kexSuQDf0Klw0XyrVPo8OgmK0i3CQeQA8G4Miyz5jeaDKWt58PYtWhC756DMLsccJgFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(107886003)(31696002)(91956017)(8936002)(6916009)(86362001)(186003)(4326008)(6512007)(4001150100001)(6506007)(316002)(31686004)(54906003)(71200400001)(36756003)(5660300002)(66946007)(83380400001)(2906002)(38070700005)(76116006)(6486002)(66556008)(64756008)(66476007)(66446008)(2616005)(508600001)(7416002)(8676002)(38100700002)(26005)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlQwQlpEMWxaYVlTUEtjczBVaktBdnB5c0VwVm9uaDV1Q3FRK09XdHRLMCtm?=
 =?utf-8?B?QldybW1tUlVMOXhUS2hpaGwwOWtGS2tBTVUzMFFSQ1VSTTFFa21adThBWUE0?=
 =?utf-8?B?eDR3Z2xSVE9neW1hNkxrQVNkVSs2NWw4dkR3ZDBRbVlIS0YzWUdrWjJTRVpU?=
 =?utf-8?B?ait5bGxUN3hDK3I4V0kyaE1KM3FQTmtuQlRoNElDZk5sKzc4NDdaTStDOFFv?=
 =?utf-8?B?VmNpSS9mMHU1UDBRLyt5b0tqZ2llbnI1UmR6eEhUS3NYOWxOTlFZV1FoSitQ?=
 =?utf-8?B?alMreTBUWXJTK3c0SlZyRG53UEN1bmRBU3A1VVh3ZWhaSmRMZ1U3MllBQ0tD?=
 =?utf-8?B?V2U0elUrMGk5SkZTOG1ZZElQdEhlbkpsdUxjRytndHgwMUNrUGd5TUZHWEtY?=
 =?utf-8?B?N1k0b0JwWGNHa3VJV29Xb001WktTaTdYT0pnMldPakpoS3dLMTJaakQ3M2l4?=
 =?utf-8?B?ZWlLYkhyNy85OFF2Ty84aU9KWkZaYVFzWDRJbW4wYlQxMjhQTlNuaHRMRURP?=
 =?utf-8?B?L2lVR0NTUlQwbWhpN21laHVTYXZrR1ZCd2txTmUvbDJxVUF5K0ExenBmS214?=
 =?utf-8?B?enh0Mk4vMHFweG1FU0tpMWJJVlBOTDBTa2VuMHNyN1IzRjNCWDJaYWQ2a3BZ?=
 =?utf-8?B?N0dDUW1UWlA4bnVCb3Z6VHMrdEp6MkcwRFRBaUlpZjN2Y1ViNFE2VTBhbjZC?=
 =?utf-8?B?TTdhQVJUM2tQQytJZkVMYWpreDRIOUNVNWY2cm9PVDNHSytRcGNZdy9EOWQv?=
 =?utf-8?B?dGRKK1YvMFMyZkRFdDBnWWJ3Zkd2blVoQkhGbDRsR3VzVnFXS0kvK0w0MGtl?=
 =?utf-8?B?b212cnRoR2VXQ244OTFJQThrMWNjK2tyQ1RUdjRGWWZKdE96dTd6WGlLR3lG?=
 =?utf-8?B?ZGZIbCtnbHVkY2RMc3JxNGVVS09TSDVKVmJKa2R3TC91ZEh6VDlwRlZVWlh0?=
 =?utf-8?B?L2RCRERMY2JSaGtYMzRVWmZYcjV3b0FsMkFhMm1nbHdFcmZSMXl4WE95RXpD?=
 =?utf-8?B?eTl1Vnc3VWlpNUpoTk1xYUxJcFNCRlA5Z0QzRndWcTdtV2UyOFRTMzkzTjhl?=
 =?utf-8?B?MTMyVkhzTitxM3RieGhWcVp3T2o0S2poa0RJWHNXMm44OFVqZnpBSkhqL1Ez?=
 =?utf-8?B?UGwvRkNORHFTT2VoSjh5MzhTUVhGRWViOXpzdWpRVnpocUlwT1VqRmVGQ0lh?=
 =?utf-8?B?WmsxOXVhQ1JPbFBGcm1CTS9KRlJmKzl2Y1dqUm14K0MxMWx3cDQzTlhKVmt6?=
 =?utf-8?B?bk1yYTdvRExrem4xNkd2bk5CZFdKSXlXU3FXOE1BVFdwYUZNWlMvSlRra04r?=
 =?utf-8?B?b2hVVU1DZWdvcFM3UEIyNWtRYW11Yjd3amloYXNmeVY5Wnh5WE50d0FWdVFC?=
 =?utf-8?B?a29TOStLTzlNdGdkWmpFTm1ZSWJ6UTVGUytXVm5nQmZhdldUbW12aSsxWjlM?=
 =?utf-8?B?dS9qVUpRekhadG9EeWl2dE1OVEk1Mzk5c1gwSkVWRU5JRUpiZDZ6Rm9vSmFU?=
 =?utf-8?B?TTdjcmFOelJnRXFlMVNXMVkyd21yTzZzM0RPM3Vrb1pSWFIxeG81RHFoSTVB?=
 =?utf-8?B?a2lOam5zQlpSSUE0ZGl4OVdoS2lDS2tQeWkwc2d3VEdGVy9ZMzVPQXRiTCtw?=
 =?utf-8?B?ZlVKaFNUeHprcGttMkgzbktnVmp2SFVjclIwK25jOXdTRlE5bEVKT3BFYjRI?=
 =?utf-8?B?czhrYWZmRzluMUtpeHlpYVg2YmV6d096cUlwaXB3eUZpZU9rUy9LQ001WGVP?=
 =?utf-8?B?VzRjL014OTc0YXZuWFR6R2lOSy9za0hjdHpMRGJkd3I1WHZQNk5TUFBySUo2?=
 =?utf-8?B?Q3BJb3QzSHpRQWk4a1h0WDBqSm8vNVpUWVA3NzcxSFNzd1d5QkRkRDhmbUlM?=
 =?utf-8?B?eHNsRFQxaXJsb2RZK0QxZk1ZeThtSkxhaDFTN3NuZFRXWnFKOG1rT3NZa3VN?=
 =?utf-8?B?U0gzVmVkNys2RWJuak5SYjlhM3hhV3lpemZZRU9rVmhYWlVJOWxQcjNNZ3E0?=
 =?utf-8?B?a0F3eHhjZkhiZ244YXBxUGhFUzdDdW9jSmltRUtpb2FPb0FWY1lid3RzN1ZS?=
 =?utf-8?B?UHByOU5CQmE2OS92VHNFNmsvOHF5SlNvS0doMkpoZnJpT0JVaWRPdk1Pcnk3?=
 =?utf-8?B?UE9ZME85Zk1NTGk0bWREdzdINGFUNU8xemNxWGRmSUFmMXVVYkRYTmVpaDFV?=
 =?utf-8?B?U2xLTjllSnl1MEsxN0YrQVRPZGV2L2FoK1AxSjRyS0xTWmVvQnZZQkRoWWNZ?=
 =?utf-8?B?dkh1bVI0dHdTWEpjQnpTUFY0UXNBPT0=?=
Content-ID: <C72B02D73AC34E439B578058DA18C4DF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fef7893-81e9-451e-ae34-08d997b182bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 12:18:10.7069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpdHy/vC3HTMWqrDNOdu1Qs75x8Na0j1BFhGe5kdDtMPKsxeOPBmEqNHBxxccGl0tRBc0i5UuTZqhmY73cB0eB5rcnZpi4qRdrnuC0ZDDjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_051823_626424_2B946592 
X-CRM114-Status: GOOD (  20.49  )
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

On 10/24/21 8:05 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-10-22 15:25, schrieb Tudor.Ambarus@microchip.com:
>> On 10/22/21 3:59 PM, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Am 2021-10-22 14:42, schrieb Tudor.Ambarus@microchip.com:
>>>> On 10/22/21 3:10 PM, Pratyush Yadav wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>> know
>>>>> the content is safe
>>>>>
>>>>> On 22/10/21 01:21PM, Michael Walle wrote:
>>>>>> Am 2021-08-17 12:24, schrieb Pratyush Yadav:
>>>>>>> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>>>>>>>> Used to initialize the NOR flags for settings that are not
>>>>>>>> defined
>>>>>>>> in the JESD216 SFDP standard, thus can not be retrieved when
>>>>>>>> parsing
>>>>>>>> SFDP. No functional change.
>>>>>>>
>>>>>>> I am worried if the order in which these flags are set can cause
>>>>>>> some
>>>>>>> subtle bugs.
>>>>>>>
>>>>>>> I can see one instance of it with SNOR_F_HAS_LOCK.
>>>>>>> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there
>>>>>>> are
>>>>>>> no locking ops specified, it sets the default locking ops. This
>>>>>>> works
>>>>>>> fine before this patch because the flag is set before the function
>>>>>>> is
>>>>>>> called. But now, the flag will be set _after_ the function is
>>>>>>> called,
>>>>>>> and so you will never be able to set the default flags.
>>>>>>
>>>>>> Maybe we should just forbid to look at the SNOR_F_ flags in these
>>>>>> functions. Instead the information could also be deduced by looking
>>>>>> at
>>>>>> the SPI_NOR_ flags.
>>>>
>>>> not true.
>>>
>>> I guess you mean that some init flash init functions might set it,
>>> too.
>>> Right? IMHO this goes into the spaghetti code direction again.
>>> spi_nor_late_init_params() must not look at the SNOR_F_ flags. There
>>> are too much inter-function dependencies and it is really hard to
>>> follow the call chain.
>>
>> I don't think I understand what you are referring to. The flash_info
>> flags
>> are used just to set their SNOR_F correspondents. Take
>> SNOR_F_4B_OPCODES for
>> example. A flash that can't discover 4b opcodes support when parsing
>> SFDP,
>> will set the SPI_NOR_4B_OPCODES flash_info flag. Flashes that can
>> discover it,
>> will ignore/not set the SPI_NOR_4B_OPCODES flag, and let the SFDP do
>> its thing:
>> the SFDP code will set the SNOR_F_4B_OPCODES flag. The only flags that
>> are used
>> across the SPI NOR core are the nor->flags (SNOR_F).
> 
> Sorry, I wasn't clear enough. I was talking about checking (already set)
> SNOR_F
> flags in all these init functions ({flash,manufacturer)->post_sfdp(),
> (flash,manufacturer)->late_init, ..). If we didn't allow this, then
> we would avoid all these "subtle bugs" which happen because some of
> these
> functions depend on another being called first. I.e. all the called
> functions within spi_nor_init_params() may only add SNOR_F flags, but
> must
> not actually use them. [I see that spi_nor_sfdp_init_params() will
> remove SNOR_F_4B_OPCODES. Mhh.]

Keeping the setting of SNOR_F flags based on the flash_info flags as late
as we can assures the reader that SNOR_F flags are not used across the
init params chain. It also indicates that the flash can't set the SNOR_F
capability by parsing SFDP, so it needed explicit flags at declaration.
It is clearer who sets and when.

> 
> Btw. I wonder what is the difference between a member being in "struct
> spi_nor"
> and being in "struct spi_nor_flash_parameter". Apparently, it should
> contain the properties which can be set/changed in the fixups or by
> parsing the SFPD. But then there are also the flags which are also
> changed in the fixups.
> 
> Maybe we should pass the "struct nor" as const and a second parameter
> "struct spi_nor_flash_parameter *params" which can be updated by the
> called function. This way we can be sure the functions won't change
> anything else. I don't suggest to do that right now, just to start
> a discussion.

I'll let this for other time, maybe a separate thread.

> 
>>> The locking ops should also go into the (static) flash init which only
>>> depends on the SPI_NOR_ flags. If SNOR_F_HAS_LOCK will be added at
>>
>> we don't have to specify the locking methods, we have generic ones. A
>> single
>> flag is enough.
> 
> Hm, I'm not really sure we need that SNOR_F_HAS_LOCK flag at all.
> "if (nor->params->locking_ops)" should be the same. At least the current
> code
> which checks the info->flags for SPI_NOR_HAS_LOCK will set the default
> locking ops instead of just setting the SNOR_F_HAS_LOCK.

SNOR_F_HAS_LOCK is kept for consistency. The core driver operates just on SNOR_F
flags. Here it's the same idea, I would like to set the locking ops as late in
the init chain as possible, to indicate that the locking ops are not needed earlier.

> 
>>> in an init function, then this code should also take care of setting
>>
>> what init function? We're just setting some flags.
> 
> all the functions called in spi_nor_init_params().
> 
>>> the correct locking ops. Maybe both can be set together with a helper.
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
