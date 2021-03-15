Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C84C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 11:26:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA23260C3E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 11:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA23260C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=InwSvwakD5aOsK/AjE66n3NGtAGDSCMS9LlqX7podfw=; b=UsNvypOXJu5dFJvQ2+KgmHzc4
	7fP04MH/QPumUTtV/vkNxyqYAx+i+lJTI5vuZSh73cbrN6xius1MqXCqZlw0GBwapIeRgF4MToK8F
	MJ3G/4vZ1EE0TVfu1njf4nBqoWX9caLy4CnRJF59JfTn8k2bZF9uKCZsOM23VOlERIvonILm+GKkn
	HwzZDuYld8L6wLRwBptvXvL/wtjRdM0bMS/M414GpOGf74H007ZzR+44EOwsTLicqWgJCz4dncmhm
	IRSio/0y9r+QfYwVnbL2LLUL8MUnE5ml+ubUx7SgCsYzKWEld/aWI6XNgI+ImAc1l03aQwU07qQD9
	YEsclsIZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLlLW-00FesF-4G; Mon, 15 Mar 2021 11:25:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLlKv-00Feok-2q
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 11:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615807476; x=1647343476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IGA8iprVA+QiHRSowP4VkJeNOBSDsApcwzHhObjJf5E=;
 b=IeUR+9hJbstrYuJkIO1fjnn4nvclWph0xgDbtgWModj6yPQ6GAixrH2D
 Ty+tQyk9y+ZeHJQyAv4kXrYCaHYCjaTcdy4wkvJKSOswosdAgxm+CI+Sl
 4LvPsRg31tfpH6XpPv9SnG7lLfze+5zt5O8G75RMtni9IZos2BxKiHpB9
 mf6AvsAuUyYYogTReiSQw0UOr+o3Il/pRiLEHg3xLke8nfKVZ5lVmQGNp
 PbauB0RBrBWoL95CNqan6yzvRaOOizjGlSJcC7iSk/dCx6tGUxl6UuikJ
 lDMxUvv1IxhEEW4hLiJsj4/vjAhOglf+zyDzyet/9HtifWewF3W2r7Mjv w==;
IronPort-SDR: Q4jFLEHU/kMDzVpuAgt6MF9XF/lVoljrqujCEwlcHEOPOS5ATDRyxFsi50fSIb78uPvJsdSKOs
 a9EmrGfWJ1phWDhFxpUc7ad88/XXiHpySKRjxzIdyViSMcWSiwpIoSE2Rhl25Zn/ARZrX0IJ1p
 1tP6f4WIAKgKhfZnNszEZ8ckNOiKeR6MSQhTP+wCp9hO3G7shKVFQP9/tgR3DeDdyWzaylj5k8
 iRkycyHySrBWXb3Fv1jMjRS2w8MlT2wagnNYtYjkYmvMqcAMXl6+yE5W64zIj2aDQ3HkGRg/KD
 nOk=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="107214011"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 04:24:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 04:24:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 04:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqY4LpHDYaHOUCBQf95XCGjB46l244tGbbtTPxCyR6S+RG0KLmiPpmb7xUFTyrJ2fgRc8m9nFkEKB8ijoMxWnJefJ7jN0avppeDx2PZbRTVGsfeifR6ADe4J+kw/zxifdhQWtvbSnT1zCSRc7ByH2nEgmt1DD9ouDC/9R7iVQqvMjeveqCKCxDkRZkI/J3IMurawgrhB7CI+29Ln++Ct7EkF+jerlNsZUsLWw1mPRoEIm72GM6UssOBvAXjiAClPDZ9a26PDQ5FTYme/5kYZAELOMfgmxMZZNcUp4q0GBWpNWn9HnY1tlY1xLP0yZBeaeJUhESHIRd/YR9K9IyW1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGA8iprVA+QiHRSowP4VkJeNOBSDsApcwzHhObjJf5E=;
 b=i5iWvQPubCTGy1zJQ2PubC+rWSeGNn1hprnyi/5ZR6RbU5qMQ+22AtTyKW02fkPNy9A6/77oS6KwOH2fo8+z8AfYV6O2BGPjKGLGCSi676QYnY0wRRSN4aOwBODlRLCb1X533/dShcZa9ffZVrHSQWN0xB6Pc08UIXK1zoZ6s5ixEsSbkWTsnX02OSlAXiT1W7qOdqkvp/dOAowygbuBeyKeOJ5dBgDJpesPs9hT6AKhh702fnLhkrSXxvyqMlre71v15y7sl3MkWgpq8iD1pv1aiWIgx4mlY/IiApB7hGigC6LtbkRAsUSh+2hE324PNJCm0AAf7yIpxM5b2t8Exw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGA8iprVA+QiHRSowP4VkJeNOBSDsApcwzHhObjJf5E=;
 b=N/WVQhDcaf43WaPLWJaGZ6/I+HaPILKrZceoDansHHBC7Opv48Zqe95K11afCxIfxElgT3S7Op9eFOP754YDfvB4291HQRfqTqzt6sFCBUh/kahC7mHgZIc46Ao7BmOi2zh8ymVkLP6oj3Q4SN/zcTuKovceZgDJtz/jCwhwiII=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2621.namprd11.prod.outlook.com (2603:10b6:805:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 11:24:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 11:24:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <joe@perches.com>, <p.yadav@ti.com>
CC: <vigneshr@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] mtd: spi-nor: swp: Drop 'else' after 'return'
Thread-Topic: [PATCH v2 5/5] mtd: spi-nor: swp: Drop 'else' after 'return'
Thread-Index: AQHXGY3EuW2H3unPVUaRE39dynJgqg==
Date: Mon, 15 Mar 2021 11:24:32 +0000
Message-ID: <3ed8da81-55cc-4fbc-cb01-9405ac9709d7@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-6-tudor.ambarus@microchip.com>
 <20210308062821.wn4uqfxcg6vo3gcb@ti.com>
 <5723fabcc03455ee6624a7d223186e5fad2bf2e9.camel@perches.com>
In-Reply-To: <5723fabcc03455ee6624a7d223186e5fad2bf2e9.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 934d562a-6a1d-46de-55e1-08d8e7a4e7d4
x-ms-traffictypediagnostic: SN6PR11MB2621:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2621D3FC48DD593C9A3724E4F06C9@SN6PR11MB2621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hJKguIrJqsoH9vbJhMJgBerPRUTByxNSPAOzgbf8L6XMpjMY33yJIyQ5vpDbVn8sH/GqR+7nItitlfOOdPRm0IyfBbZLtOP0RRxyKtrAhOPr/ZPevC+8Y6M26PKoKumaPvTrYsQP7QF0eU12h4QOgPAHOKOrOkBwCIgfDCvZrpJxZiNdBx04JZI+WHUDeBj4M6Zgbl74aOTCsN+uucsvieuJR6+LW/wHdG03osXUms18OcLs6e/El9ru3hF7YIeMM2lpDSqSlKSDEYYFSa9ktIyYehYnC6H14YSG3RL9x9N75juLRLvf9Otkbc5hczJbiKOVCvGdSxDvzGnwLF1uGZeuQW2juYt3lo8J47khIce5ONBlatBEtaGUQzFMxdjHlWRO3EG+4Q64ACUGHiORI1tMgfJ1v4nIHOmhE6wYodKolcH/Yimu+l8nzO5Zap7mz1dWw4XW2hnaMianJohxlQhOb3C+awEzt9zfWBZt60ZXKr7Ukgdrt0bTwbBPQXeibXyD9iaiRCv8as8n08MOiiTwjnwThjwva8BnGYRQHaReQbtOfBHP7+1gnvP+wU7uZBSrEEbTkjz6OMCbu+lkbE5bBU1h0pEiCcSV2qdrG5UFc3KC1UVoyZNTABmu2hJpVsmNLubV7b1Lkw+se7fwyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(83380400001)(86362001)(66446008)(31696002)(478600001)(2906002)(64756008)(66476007)(5660300002)(31686004)(71200400001)(8936002)(54906003)(66556008)(36756003)(2616005)(6486002)(66946007)(76116006)(316002)(53546011)(6506007)(8676002)(26005)(4326008)(6512007)(91956017)(186003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UldUb3lOMTZ6UU41ZzBYdnBJd3VHc3kzck4yN2ZtNVhaOEZ0bnJ5clpldlpD?=
 =?utf-8?B?RU5QeGpoNExXTjArYlEzS1M4RUFNTEZRc0xTclUyZDhueXcxZDF5QXEzQ2Y1?=
 =?utf-8?B?clJLWkRxR29iYURjUkZITEZtZ3NkQzhLT2xZcng0VUdRckdvWE5aZnN0VThJ?=
 =?utf-8?B?V3ZVcHFqRS9uUm1nNXN6QmVIY24zam9IRVpZWFFRRElpVkI4Rzd3d2ZrZG9k?=
 =?utf-8?B?RGVsKytPZVRNdXFyb1BCSTB1MTRpK25MWHZLOThpMVB4d0QxbFhnVFgzWnQx?=
 =?utf-8?B?SVJGTnVvVEIycHhFN3NsT1R5cmdUOWtDUE5zNmlodkNIVjFvU1JHUlkrTFFo?=
 =?utf-8?B?TTJaMllJa3J4SU9uMm95czhObmxxR0QwZ01IY2E5RkR5OUJOSC9DSVdxa242?=
 =?utf-8?B?eE5RWGV4SHlsYVdKN0VReE1obDdCNDZhaG9VaE1sYlIvd2JVSTlrRmpqY3RH?=
 =?utf-8?B?ZVFHY1J2WXg2cXhmOFR3dkplS2VIUStMcVA5RWJnRFpwZnlMMmNPT25qWTR0?=
 =?utf-8?B?bm9DeGFnaC9ZS0xtSWxvOGVDbkd1b1cwMTRuR3RDWURGcWdiRU9BakVpSGFH?=
 =?utf-8?B?UWJSYzZFWklPWGVGZjV6Z3UwQ0pvUUMvYU9Zd3NVZSszVUp5Nk1obE1LRWpp?=
 =?utf-8?B?bWtaMUZEVkFnMXhSOExobnNITmRMU0FXb054anV2bzBObFN3cGhqNUVJdGNO?=
 =?utf-8?B?SXplQ1M5WHViTVBkeVZNdUhYVkF6TlhTaTN0OEJVSDQ2NmV5U3VnRUVldU5B?=
 =?utf-8?B?eEY0d256NDlBRTlGaXVvQjJpd0VOSTdUVUNXeitHb3kvcHE5VDNxSUZKck9q?=
 =?utf-8?B?R2hFNXdiSGhLYkNLemw3d0VQS1VjS0dtN2pZSjhoTTJxOHQ3aEdFM1d4OW9Y?=
 =?utf-8?B?MDUvTzd6T3hYVWZ6cnRKQlBwK3dLYkJHRWx1anVPVmpmR1hrcWdHQjVSQjNQ?=
 =?utf-8?B?OGNZdmxTZTB2QU9MZ2N6QUdWcTYxaEJJTjk1WldtS0NZdkJZQTJzK29HTjBo?=
 =?utf-8?B?Rnh4bkw3YnRiRHZjMTJjczdsQmJ6RnluR3V1RGtUK0Vzb2Vnekx4YVlNdjE4?=
 =?utf-8?B?dlNFbHQ1Z2NrZ0tpdU4wMFhzZG11eFFBOXkxcUN4Qks4TDh4V014NEk3UGJp?=
 =?utf-8?B?T0pzZUx2eTY3QXlxaXRVQXJDOTRNVU5EV3lueWREK2M0MC9LQVM4MDhRV3cx?=
 =?utf-8?B?SEdROXR1cmRJWjYwNTVQTExWVy9nem8wZWN4WUVPbTBMcURzSHdza0dCMUIx?=
 =?utf-8?B?aXRVWEZCNCtpZDhWUDNleFlyRUtVRGd1TzVFTnlzc1Bsd2wwR2UzT3hCakVm?=
 =?utf-8?B?dlZVSEtvUnpLaFlqMTY2blNZVUFTd1RkenhWUGRHamVTUnlXMnlJMDdUS0Vu?=
 =?utf-8?B?TlJBb3N0WmN2YTBkR1VrZnFDVUU4R1VGeEJGbi9WNkxqMGNqOVFYTmdoRnc3?=
 =?utf-8?B?azh5U2lUR0F0VHVxK1J1UnNSVVFXNTZmcmlwZk5OeTl2akI2dG9ZQW5QTE1G?=
 =?utf-8?B?ei9qWERTeWowR1NmTmY5K01MUnVKQSsrbmJab05lK3hMRkYrN2NKYk9qTUZp?=
 =?utf-8?B?Z0c4ZlFJS2xQVWlsTENJSWN4WVFUd1hwY24xQWpZR3FNOXgyNnd5clBUMVU5?=
 =?utf-8?B?SGFFbmY3WFZ4dGEvc3A5OWpIekhQU3phdS9sREt4eHhnSzRIcVJ6Vjk0Q1ZJ?=
 =?utf-8?B?aDJjWFdNeUM0bVlGdFV3NEtvZTFxUlZKaXVJakdGT0lRaUpIRFFnaHYzci94?=
 =?utf-8?Q?wv0bEtsC0ISQMqYIhA=3D?=
Content-ID: <9DEBBEDCBE816940A2A920E27E000713@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934d562a-6a1d-46de-55e1-08d8e7a4e7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 11:24:32.1467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: useVzy0tD3x2qQzrqeHCdcF+euLH4N+jUKI71iCl+b3vi0C3cuoVKoN8B4cTQmicXkbQfDbbFGJnofpxd9/f31qngMHg08iVdCDudykdX+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_112437_699819_F4591511 
X-CRM114-Status: GOOD (  26.51  )
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

On 3/15/21 8:53 AM, Joe Perches wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, 2021-03-08 at 11:58 +0530, Pratyush Yadav wrote:
>> On 06/03/21 11:50AM, Tudor Ambarus wrote:
>>> else is not generally useful after a break or return.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
>>
> 
> I don't think this improves the code.
> 
> Generally, checkpatch is a stupid little script.
> 
> This code uses a form like:
>         if (foo)
>                 return bar;
>         else
>                 return baz;

Isn't else redundant? What are the benefits of keeping the else?

> 
> which checkpatch recognizes as OK and so checkpatch does not
> emit any warning message, but this code just adds comments
> before each return which confuses checkpatch.
> 
> I think better would be to change the code to use temporaries
> and convert the functions to bool.
> 
> Something like:
> ---
>  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..e174a2f1d621 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1798,36 +1798,41 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
>  }
> 
>  /*
> - * Return 1 if the entire region is locked (if @locked is true) or unlocked (if
> - * @locked is false); 0 otherwise
> + * Return true if the entire region is locked
> + * (if @locked is true) or unlocked (if @locked is false); false otherwise
>   */
> -static int spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
> +static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
>                                         uint64_t len, u8 sr, bool locked)
>  {
>         loff_t lock_offs;
>         uint64_t lock_len;
> +       uint64_t lock_max;
> +       uint64_t ofs_max;
> 
>         if (!len)
> -               return 1;
> +               return true;

returning one is wrong indeed, would you submit a patch for the conversion
of the functions to bool?

> 
>         spi_nor_get_locked_range_sr(nor, sr, &lock_offs, &lock_len);
> 
> +       lock_max = lock_offs + lock_len;
> +       ofs_max = ofs + len;
> +
>         if (locked)
>                 /* Requested range is a sub-range of locked range */
> -               return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
> +               return (ofs_max <= lock_max) && (ofs >= lock_offs);
>         else
>                 /* Requested range does not overlap with locked range */
> -               return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
> +               return (ofs >= lock_max) || (ofs_max <= lock_offs);

This should be fine too.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
