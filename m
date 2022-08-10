Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F4CC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V063CZkgGKCQz7vxHZPI7UJycSCU488jbCh3b4zAP5E=; b=NkkOVrx2yaYzGX
	cMv+FZoFnLhQabY36kyp71ZYDzlSb8NijUbhupVbwWW1StEykq5QGcVJr0XPjbmqNOW3w4uCbfyse
	FaMYa4+N0xfHetpcEQs08ywDsZPKoBzDN35XyBGwx7czOdyX76f5cPSk1HpTk4zX4Kf8oYTCWYE8u
	mRCM+NTUuy6/gOC0GyC3WoaYHN2eymR8gb8izogTzHGGzhGhZyh3Lhv8McaVJLNKUhRQPDIU9FVAw
	IDHiEup8aY4+8hWYsxl6uP9G0YbPmFYPYdKmcaLMMV1h8ZoypF+vHYiuntRXBCcDRaBsXvWQbdqBY
	puxJ836iDITdtJ0vfDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLgZH-00AXAs-24; Wed, 10 Aug 2022 07:55:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLgZA-00AX6l-OE
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 07:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660118148; x=1691654148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5Ete+A4Uo3DDru+XEV5+p88EZqE64a+ko6TYtjL5wW4=;
  b=XDJ7q0TmMtUA4bBlDau2ILGdYTgUf3GK5qoHMROdWNtOvc6StLb0dmk+
   msOb62D69bjpqzHZ8cKteYCP1ZqVbCSQmauAmlT/5XpvhxhHY/VRUCF3B
   iaORtkSZyN8tjJqovb+7GHwpkdOCfHlyfW5OVqgpa+l2M2k3cq52Ki/QA
   DbWWkj9nSlNJyCYQJshql+cfBnrDO7XJlEJIQIEzDFGCrYizxZR6A80yD
   ++SeubpX2IscYmQjb0NZLWnPD23VIqHG+wNf5A2gZBDaNjrVv1dBzCURX
   dCj3Wfqj8FKtgYRDZW0TGrtrzxyJWBXMwwSF6Bg/Vi+1VCV05hzZpdf9C
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="175794513"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 00:55:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 00:55:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 00:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjqM/w8X6OIzfeUZRJnoV79jSnY7NeTc6rEquSERUeiOAV6SNbIomLQX3gQkslF4fxvXXmaLrqNkO2911tHnwAzDZ+zh/i31dwtVYJuWOtz6uJqoqzal/6vgZ2b9XouDye8zH8C5lJwhVlLG3/Iu4OL6ZFs4wboWfj5qkq50y7dgYdPvmlSV4oBbEdz4IEEciV45UYUXe6Z2/s31WR4foeLPT8LXYAnIoEi9KC0qazCOn6PHR9NkSHxdofvRt2935Bm0NOaRLG/O+Gx1MV+kfDmAMto87/+mQjO6eVDrgV6CdupGEiF3AtgNXT4WMSaZIADfHbF5vDWNIqAO/AmS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ete+A4Uo3DDru+XEV5+p88EZqE64a+ko6TYtjL5wW4=;
 b=UXDlMcJuQfP7Zo4/15MB2jEDzxF5ZLFSBuy+ZtcWMw3iTS6Z1Rkv9iu3y62sIZEZebg3PluP/uqugS04oOqXa8h0cZQVesDgsWTl9rLR2sWmPhL8A5p2z4Xto+fwYmtyfWXdm3J62/MYBLhP+TpZU+UyaOfyqhusokALeA6q5md1mntnCpdIE/zKvTr5KCiTOtsWzvBTinSNfc2MAtGDz/33r5Ybsi5Qgj1LdfnH46QjMtyCtwmYtL87TN+AsHd7/ZtALCGIeXcQeRmGAXjLggOVuSDAsfz2sj6yQ1IhOFQn/yEUsElkpRmKnGLrDwTvVy/yqhmYkXaM75oZY1lNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ete+A4Uo3DDru+XEV5+p88EZqE64a+ko6TYtjL5wW4=;
 b=EgsfR4Yi7UdN2M/I3qeJOKQkrawbH2JnSPkkIQaWsuO70DQFgr+wEcatFhCWf9gm+Hj8STzXowNzrfFNGbpjG0bvQz2OvIYs8zl4vcuzEhK70Xd18NLh6NF7+CIm3MC7Sf5y0t8rWyVYWQIPcjhmRZtni0od+vZ2Y8gWImsVybI=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Wed, 10 Aug 2022 07:55:39 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 07:55:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <greentime.hu@sifive.com>, <jude.onyenegecha@sifive.com>,
	<william.salmon@sifive.com>, <adnan.chowdhury@sifive.com>,
	<ben.dooks@sifive.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: issi: is25wp256: Init flash based on
 SFDP
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: issi: is25wp256: Init flash based
 on SFDP
Thread-Index: AQHYrI6UxPDo6RxI3UKhgSYQjCexQQ==
Date: Wed, 10 Aug 2022 07:55:39 +0000
Message-ID: <2a50d782-ff21-91af-8488-503168e29867@microchip.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-2-sudip.mukherjee@sifive.com>
In-Reply-To: <20220809201428.118523-2-sudip.mukherjee@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 622b137e-bc6b-4204-4833-08da7aa5b75a
x-ms-traffictypediagnostic: PH0PR11MB4998:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A6EnYL4E2eFq7/CGpJs9aVHVD6ZIEmvSrhHjX+5e4rzbOcppE2e/ScfAJhVsO+Ibp4nyKfVJwgvAkU5UH/M8jAXWN1FTqiS7bhGB6jeVcsab1kq7eUw4rY6ZWaaEN/4WGjnGSn3qCf0DTOL15QrzQrz8lL7/VTgi+n5EwbWmvB8WKNPjSqs1q1/MVGu8ayIgCiKtR8djLbntw+xGQ3mCOGHti9Now8zkiF2qAS+biYALB0/Ql2nHNHcBUZkvBX72IF4IPExhWhoIPk9kMvNAuyZhq2pC/dMWy+ScoeYTnb5gAx0oN/CcposIOOIgLlv5SDsh48/tLj8GgTp85n0V/IRdDYpVO7ftsfl6/PJIP6TstZcncVBEvpmZ2a9Ocg3ljwuc+ZhYpwfOYtVMMvww3pJGeGQG8m9iB5tj4H+D5/UiqgaEvtzKdqzZ4WYcLXPhjJpQzpljfpogut52eMDWkF4Wod6Jw5bfR1xMPLoRiLeAOSv59+ClmjjzPmV35yLeGdyEQ/qlGY/q3O8qQHY69WgGr8t+J9kLuLtUMi7cGIKrkEULdgXjN1HfVvon6/6pYv9wYnI+HvpWnASvPvnE9cnsHlTkCa6QPFAhX+m8ku56EpRPWNWbS3OA582mAQyQ6Q88+gb6UDXIlXGCnDMD5H+thVeQuEgWn/dUw641LuTiY+OWbGd7GZvy8Vwv7VAXok42ANw8dYrqPc8shcBIeQHoeu4U/w1BvfcZ6GaXKydnAEpySdZKnFjqEwXiceRz2k6joC3beIYBh908yxvw8Btv5MkQqs8RVwF4tDZHuMzbHSk2B26bBjQwL6Q/IuWyyPq0LXaJs72fpJcNYSYP5yUgf19nElAA++lca82GZe62/uRgiZgby1p+XpL+4rBj9PX2hjKJOF0bZxbuWASVMAB3YkmMcl17uY0Eh92F+zQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(376002)(366004)(39860400002)(186003)(122000001)(41300700001)(71200400001)(8936002)(5660300002)(31686004)(2616005)(83380400001)(2906002)(38070700005)(91956017)(66446008)(66556008)(53546011)(66946007)(64756008)(66476007)(38100700002)(36756003)(7416002)(26005)(54906003)(478600001)(86362001)(31696002)(6486002)(4326008)(316002)(76116006)(8676002)(110136005)(6506007)(6512007)(43740500002)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU5vZ2ZTM3FkMFgvcmdHZGxaczNYSVJtdzFEeUk2QlM4a1BMenNJaStRR0Rp?=
 =?utf-8?B?OHRVTWcvMG95VjQ4QW95MTlsamQybGlqNllkWXB1UEt3a1NOc0lXV3FPNGVm?=
 =?utf-8?B?dzNHUTJOVmE3d0RJN1RFTkpsTFNnT0NSUFRITWtHWlBwTkRHNzl5TU80M2dH?=
 =?utf-8?B?aE4rZ2RRYStPNGdGZFNhZWRIUVFjVTI5RGpXMjBCM3U5QmhuUGxBRVAycndW?=
 =?utf-8?B?TENaMGdpTHRLN0dJNGIzY3RENEhpL2FHNFUzajRqWExJdCtkVHc2NTIrWlIw?=
 =?utf-8?B?VU5VQ1lZblJIZHhtaHJXbDlidFJzNWluWTNVN2FUemNqbFVzZGlYcGZNZ2sw?=
 =?utf-8?B?MmVBWmNMTUxyYU5yWlNhUzFXUEFSbk9BNFdnV1FDKzFQU3B5a2JGRlJaUmZr?=
 =?utf-8?B?QUpJaWRKVzY1UFp5RTVBT2ZrMENMUENKcUNrcmNWQ0N4VkgzeWFnZWhPQ251?=
 =?utf-8?B?VllWYkZFQjhuenVjclRjVURHQ2lPWnZPUFhaMWxhRUhrSlprOG02S0lnUnI3?=
 =?utf-8?B?dVVEYWRpaXREVmhsR0ZZRnQyZGt4c2dJbEZhR2JGdUhCd1VoT3JnL2d4TWFP?=
 =?utf-8?B?aGxiMzc1NU9LMTd6dTEwOVVEY3pGSmMvaUtXWEM4WVNTWENvdE9jQ0dQT2xq?=
 =?utf-8?B?SE9JNFE3OXNZcWRQVzNHTzdkS2k0a2tRQnVGZzRaTUh1NWdRdU83cEFNdFcz?=
 =?utf-8?B?VkJ2NTNPQ0ZkRjNvUVBaTmJLTDRzSERValhZeGkxUTNYVWVzd1hiNFZlZGl0?=
 =?utf-8?B?MzVqUk15ajRyVmM2RkhqQlBBcmhwRDB4ZU95eGt1dUlMbkNOQUNJOXdDRmh3?=
 =?utf-8?B?ODM2SW4ycWRYdm0xOTBjcGVTMjhXUUh1UVFyeXlHRzgwUVA3eWViYVlBNy9w?=
 =?utf-8?B?dTlaRUQxc0grYlBUTFJmYjZVL2U3b3FnRG1Xam5ZdmxBU3pnckcyZStjeFVq?=
 =?utf-8?B?bmNVNXZVeS9ZQ2NJbXEzVitlWG83VjlTM0pZM3JEUmpOcTFkWjZ0S3A0Ym9T?=
 =?utf-8?B?VGhYbjFNQWl4WU1uajlvRGdUNXBSUTg1MWJ2WWdJK3FyeEJ5Mmd5S2tHZUlB?=
 =?utf-8?B?azZjUncwajdIRVEybUMyT3JaVW9LY0Nod2tabVNPbHdBUm5wckpZMi91cXZy?=
 =?utf-8?B?cWJYTzJkNnZVbWRiY21pWjBPT2hWckk1RDNvdEltVlFvMkJGOHBYaHFhYW9H?=
 =?utf-8?B?VmFYMi9jQWVQbXNkdGxsaXg5M0k4UWF2eTA5cUpZV1hhNEQ2MVo5dXVGMmFN?=
 =?utf-8?B?aitUeG1VZ2ppc0dNRGR6K0d4OGsxRWtOWDZqVUtzbGRzQkV2YmpwY1MreGtu?=
 =?utf-8?B?aVlEcHVHckFkVnUvUU1TMGR4SytSNFM0OFcrT3RnYU9mZnlhZFdGYVRGT2dG?=
 =?utf-8?B?TWdXVkt5aFlHYUxxSEg2MDVNeXdvVW9KNGNLSUhaT2RZeDBCcUdQM3dHSXFP?=
 =?utf-8?B?SzFtRlJ3T1JXeEpPS3FLUEZWOXMzY2xMNmdWMHMrUVZMb25RZkJsYi9VZDNR?=
 =?utf-8?B?cmMrQjRLTC9QRC9sU2gyVSs0ZE45TWs3dnBjcTJYN1VtSWVjc1NEem9tNXJa?=
 =?utf-8?B?MXpQbGJIam0zZlhvdUZuU251K3ZRbzBkRERlRzNJRkxxNVdLOVJIWlQvdXZk?=
 =?utf-8?B?Sm50TzhXZzdTL3lJZGdydWRxbG5UWjYySzdGOHBjV2ZRamdCeW9qaDNCYzNE?=
 =?utf-8?B?bVlxM2tWRzM2bFpQZXBCMGRObVN0RGlEVmorTm5Za1ljM3Bmd0hlMUhZampa?=
 =?utf-8?B?RDZKelhsc1Bya0dlc0R2ME1ZdmVtMWY1N0FHRzE1L1ZFUUxWYXJjeFhRRitK?=
 =?utf-8?B?TlNjcHd4V3lnVjk5b1NUaEVnaXJTUDRnWHdEMHVVZ2kxRXZ1d3krTlVHNEtM?=
 =?utf-8?B?VnE3T2lMV1NyWEkyLzI4SGNJdFlmMTlpY0JjeS8yaXdpZ0FuYldST3R3K0lD?=
 =?utf-8?B?YUN0SFplbnIwTWZ3VjBHb2NFK0Z4ZWlJWEZWK0lGV3VxQmdZWWhlQ0pqRlpm?=
 =?utf-8?B?cE14WEFPa0oydy9GMWJGTkJlSUQrT2pZdHhHNXhON0RCQzJTMVdCSEZGVklF?=
 =?utf-8?B?Wmp1ektOckF2c3F4NWhycnU5Y1RLM00zOHllcWVLU2E0STJ2OENFTVB3OVdL?=
 =?utf-8?B?bnQzTWV1d0FXZFFyaXlLOURNcTJ4eU9HYTVsY3Bhc2lKM2tCTmRkclBWM0pD?=
 =?utf-8?B?bGc9PQ==?=
Content-ID: <029933D82E907D4791CBD074C5C34DF9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622b137e-bc6b-4204-4833-08da7aa5b75a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 07:55:39.0530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZbX/0TM4RQT4gHXdD3CHSqjqI4fCDyNncGgMg7rq43PvlIJn4PUeaMnpD81I6CWWmWd4GzM5K4d6BbGTCUR4cbnNEHIPi77udOGU8iTFwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_005549_189297_190121EF 
X-CRM114-Status: GOOD (  23.09  )
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

On 8/9/22 23:14, Sudip Mukherjee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The datasheet of is25wp256 says it supports SFDP. Get rid of the static
> initialization of the flash parameters and init them when parsing SFDP.
> 
> Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
> SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
> After this patch, it parses the SFDP information and still uses the
> same opcodes.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 89a66a19d754..8b48459b5054 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -71,7 +71,7 @@ static const struct flash_info issi_nor_parts[] = {
>         { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               PARSE_SFDP
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>                 .fixups = &is25lp256_fixups },
> 
> --
> 2.30.2
> 

Looks good to me.
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
