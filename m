Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD63C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psmbOBK55IIZJy9LNCrn/hjDztqZlNZYlQ13tmNQ9bk=; b=dnaKmbKqllZagY
	GghLf9WyLkY+Ez0HF0/9F/YmHJD3817QPXUMrPBWkYZd9sIlYW38veH2pP75NPn8Uz5DJT2QBdfSA
	++PywRHYkY3vgtbPHM5wVBgLv4sxIyQ1+IV9HwGqYL4ueGRYSxLtf+E+8HNwpljwJRyOaehDp7sWC
	yfLKl1Il0h93arIHBSj8ktCG+HQALr1A9AXKRgpmOwN1h11ayQJcSgjPzXinb+EmPnMyFog/5IEMn
	kJ0ZGlgehgp8Dr2pKuTHpBYpGybIot5DbtcAv4S+uKtR9wxlsA+19r4xV3lPaLA6+HEyBFUZnbaPq
	SjJ5Nq4bKg5KfdGDX9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDj0q-006jHe-5o; Tue, 19 Jul 2022 08:55:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDj0l-006j6F-Kd
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 08:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658220924; x=1689756924;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LWIbahYWw1gqPP8HtNlDPnHhskjXtQvE8Msbj1dn+lY=;
  b=SMSeRb16Yp15HBxPsdY82+iz2Ll6FFQAetqbXL5vqvtmBOcbTTMHrGBc
   ZIu8o37lZd/uFEXrkxRDZqArEYNEdnxU17NcixUM13iBvbQanhGkupNRp
   6P3b85DRoZBJ3sG0MedRTj5I9xmqmc1gG/qk9HklTw4t2oJ7qAWKHMmHr
   7w0CD1nzG/W/r+s5+kKJrW6bkxdfktFrusNy1XSon+QvN6bnJpRptlv49
   6t7LaSR8I53WGfpCd2GJWci3ob1gkipvps2/kZY+8yfGv4b6lb7T1CwM3
   wXBdBio9tEGxPU7H4ZMZcjwsz+Wx8GwuGkXK5WsSwk+MSJs3RzndQVgBt
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="172709329"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 01:55:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 01:55:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 19 Jul 2022 01:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp3I4tEKesrqHHgUvqelZqlxYj/CaC2pUl/L45c7+MkmqmCXGjsYt+AIBHRtDIVCzjuNiOfVtZ6G9JTHNQU2Wumz27GSYLvgSLpUov0k/9+/kwBfEU0Pzo6e5BMvvT/3y0/hki7NcQK6obzq6RXCAJ2TAyNB+na6e0t9Hikh4zslnAucjTKKidyKxM3v9p7y1lzNw418401v62dErD+6yuqcTWceuzoH7TGb+yQH0zJk2qwqbRfJzLXd4Xwj0nb1vCmWCfLR9VpWXDKSMmDDjQenlMLDUBykPxLY8vnjnx6N2yw39YDRYSKG/BkVe3FUkBuy8KqWf6ccZQg6986P3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWIbahYWw1gqPP8HtNlDPnHhskjXtQvE8Msbj1dn+lY=;
 b=Jx/P63DEqEQ/3acw/f3+D9bvT8DPE0RW3cOlIeUJCR/SJJxslgbamZawm/ZAUYNrnrjREUjIkd9HIq48/tSlatAVLzGeYYHLJDQwnZ8Wmjo0fBvTkjngj00bXDDZih862jkkeHSBAt9HaSXsUrF7cNERfXvW0g6NSMju30XGgYXTjcTQDDcBfZY363qfzQvG+FQDdr4IY9WFYeXdCVgam5AMdGwFRkcdoyyOG8E4glaDWLR2LVu+X2LPOTBvOe+VgO4JNRtkBXNtABJTLa5ccV7W8Jy9iwK4IF5o+7DHWRGqc2uU/cs6WrLAMNeln1Hy2vIWCFVKQrcivHG0q300hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWIbahYWw1gqPP8HtNlDPnHhskjXtQvE8Msbj1dn+lY=;
 b=rxb8tzTJ8kpWeNnZbkOu76rR+m2Q/FmHIASZ8yvZyUE95Y/kt2znOqWIcY0ktu3W/5IREaH58hD2mUt1y2vDOPMzbPAnByfVHSwMaZb4pRzXxJi+OKP8uzyqVc82ZAW+tBtQJVp1WBKnbC0/5bUuOxxwrx5wh9nj6ny+1G2MQB0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SN6PR11MB2943.namprd11.prod.outlook.com (2603:10b6:805:d3::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.22; Tue, 19 Jul 2022 08:55:14 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 08:55:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <michael@walle.cc>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Skip FSR reading if SPI
 controller does not support it
Thread-Topic: [PATCH] mtd: spi-nor: micron-st: Skip FSR reading if SPI
 controller does not support it
Thread-Index: AQHYm01ChGqzoyPG2Uya56JRURrdgw==
Date: Tue, 19 Jul 2022 08:55:13 +0000
Message-ID: <8014065c-2c30-28cd-7f6c-0b9c76f39843@microchip.com>
References: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
 <ad148cd90c1abd391f9014471a555307@walle.cc> <Yp4JNGvUzHIuYAHx@lahna>
In-Reply-To: <Yp4JNGvUzHIuYAHx@lahna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16f388a5-cb5f-44ab-44b1-08da69646502
x-ms-traffictypediagnostic: SN6PR11MB2943:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HKe7NSqg+hRb7usH+hcDMuEBvTcBwVEpZqmZKIuy9RJHdMn7XU327XOy4HgfzHvpSQcC+0rZQ7LQ9xdLMjfdY1e08mg2KqzdLlH4Rju1rLf6jCgkq6qPqxVGdXpw21q/oBWsKsESxANFAold/RKUtd2LoRtOSjg48p1YueimPIoDWwK9Ef6vmk3KOTydAX2PxSfKO96e0XKnptL983twVP7ozdJHC/v+DaDdxB2AyxNmftvOBh7UK5aw9Su8aA9cl/EjCIW75BveVdj5uG7SNuObs+SDnkmNLf4S5MkHWjYTu1GPh8S7Wf3Xu9cPB7K8T8EP0iKE0LfWN+6hpbPXSkjqMTMjsUI4DvMj8FkhFIizeqOP5SHUBPIX3SmdyNEuj1UDw9glgokOPJbfBY8brVD5MG2zQQMWRxIh8VtWqoKgfwNctcAMF1CedecZzqn/gRy/qXZqoE3ke6EDcBsG6AKa7LFRktCHo7L53lhuNaQiywlJbdTM6Yu+OHOOp2lUxbfEPQwIKxul5NaCdA/URGl8DKnZ/eYy2RMSIoWZBny/r3WCbA6hVKFfSlypGzIm0KcP6RBDVy+QAsZj09F5lo72xKWvrSis0FYj4KTJjmAF3HxUAzOM9adZ/qis9uPPpZYFZic9pRu0tSDJxwUicdP+yfHRQc35guQYwP1xZz3ASWW2qOdWR8GIMD3pvd8Q3Ivc/cH/QSu63043HufXK6PLzePLk/FaY1KR5SJsvPutDYKK8/EfF9klbXjh5s6uZm5w+EOO93ZqvoiHGrAqQzqBlx3ihWeYFA9KjVHyPA4bn8sPtV8ToPtsmMKjKyD7rvLTkUVSf9LKj+mzelnB8m3ZC13v/ovOBYw9xoJm4MbRAi/9Ilr++40JQKstPlG1MiQ9Kh4f6xd0zhWYcfINRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39860400002)(186003)(2616005)(83380400001)(4326008)(38070700005)(8936002)(91956017)(76116006)(66476007)(66446008)(31686004)(36756003)(2906002)(66946007)(5660300002)(41300700001)(64756008)(316002)(71200400001)(478600001)(31696002)(54906003)(6506007)(6512007)(8676002)(53546011)(26005)(966005)(86362001)(6486002)(66556008)(110136005)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHVWU212bkVMU0ZYWTZOdjFIWSs3empKc1RGNE9EYXZEZUdkQ3lqMEl3azFo?=
 =?utf-8?B?VHNLRCtKYmk5WThCamxXbzVBYnFNOXRmOU92RkIvL1EwN1V4SHFrYzA3WnNQ?=
 =?utf-8?B?Q3Nwd1JxWGtwMXliUEFMTUEzSUh4ZUQxMGFHSGZJRTVGcW1oUGRBNTZlNHU4?=
 =?utf-8?B?dmFiZmY0RVNrdWNPdGViK1huVmdFTDBqb0ZRS2M2SWc4U2VLMzVURUptWHRS?=
 =?utf-8?B?SS9XTnpRSkIzNnA1Q2lhQ0krVmdkMWpvd1duZEdmQjFEQUwvcTNQNWMyWFlk?=
 =?utf-8?B?dFYwTE85ODZENjFCbXlyckxWanh1ZFdFSlJEUVFHbGJMblZnVmJ2dDB1a3lp?=
 =?utf-8?B?QkJUcC9CU0pRWGR0aklXUnp3NlhCdGJaeko0WUxIYk1YK2E4K01tK2xUNE9T?=
 =?utf-8?B?RmtKNkJaNmpoZkFENk83UjFXNDZBT0FOOEJtMDcybDRZQ3hRNkQwSmF6TmNv?=
 =?utf-8?B?NmhQOGtFMUg4UzhjQnVyQVNsemdlMjBUQmJZZ3BwSy9seWJuajRWQ0NGbjJl?=
 =?utf-8?B?V1N4WXlrWkpaaS9UOGNlbGtxaFRNb3JSWnUyRlAxWnd5bmV5ZkNlYmhqMkM0?=
 =?utf-8?B?WERnNHg2OTVGOTNYeUczaWVvRnFQeGVYYWtuYWlERlVMTGpJZmtUZGxONUdT?=
 =?utf-8?B?MjdRdVdwODRHUmpMN3lkb1pQQ2M0UE5lNGRUeWpwSEZySE5lZnpjOVB6Y0N2?=
 =?utf-8?B?L1JwdG5vTjUxQUswelhRdjlpd3l2RGRrWVcweEp4VVFEemZXenVmd2EwMFdI?=
 =?utf-8?B?YTdYNUlmQjJLZVdvdmhzZkE1ZXh0MUZKbHFFWDVLRVVjTWhxTmNBaysweFFo?=
 =?utf-8?B?U3FkS0NnOFYvMVdsVjN2bmVEOUJJWkh6TFNCNC9mSXR5ZDRvRW1YeVJMYWNK?=
 =?utf-8?B?RHFmRVJZQjN5c2Z2VGJGUnZaT3VJRXYvRGlqWE1QZlBjaHlwZjE0NkwvajEv?=
 =?utf-8?B?YVk3WWRMQWlrdnlGM3hON2hqZkJOMjZxaFRQMFIvZitTK0xNMHgzeS82dWdR?=
 =?utf-8?B?bmZTVkFwaXRXMnZ0RldzTk1RSytnZW1yNW1IeDhvZVF0SW1GakEzWUpRTVA5?=
 =?utf-8?B?V0YzYThzUUlScW4vb29mODk1V3hNZ0dGakZoRkhxMG43QjVGeStoZ0oxWHJ5?=
 =?utf-8?B?S3ZpaS9CbzBaUXU4QSttTW5aNDQ5Y3lqMmxjbTlOR0YxbWdnOS9SeWVOd1hw?=
 =?utf-8?B?VUcxRy83akExYU80NHczQlRlYUdmbFI4V2RUNGZwcGRTOGc4Z0lVMVVkdjg2?=
 =?utf-8?B?RFM0TlkrTnlnUkNaWDJnbFh4RC9NSWZFN20zSk5vNWRJYkZaS0Yrd2NheVhv?=
 =?utf-8?B?T2hlS0x3K00rVys5UVVFc1FEK2dGVm5ZdGNwODJCdXU2NGF5MUkzdDd1MGdF?=
 =?utf-8?B?NlBpR0Jlb3BtRldsQ21DeHc0dGJkZTlmaUNCTFpWL3VLa1ZvencrV0dieTF3?=
 =?utf-8?B?eHVkZEpiOVByclNOZHhWR3YxbjNBd1RueHFWU3UwVkp0VkR2aFg5YzNIcS9p?=
 =?utf-8?B?T0o5VmQwN082NGJLbVE4bU94UmhQTFRwU2NHaVg2STQ2L0phUTBoZS9pQ0pt?=
 =?utf-8?B?Ni9paUZXdjJURlAvWU5xb0d3Sk05MWp1b0RuZFJxRFFBVHJrRkUxcHdEZSs4?=
 =?utf-8?B?b0lGUjJ0dU1YN3ZzU0FxUDhheVpwREtYcmJ2NC9tTnQ0ZFhSUmVQZ2RhczJZ?=
 =?utf-8?B?dnhjQ3EzOGIxTUE4TExtTzFWZ1BqamJMR2JpY3hsdVpnSEMwY2pOTjUyc0Z4?=
 =?utf-8?B?NDRMZS9IOVVIV0JCMXFqYXUwZU9reVM1cnNUTG5IY1JmSjlRWGhyMHE0WVEy?=
 =?utf-8?B?K3p5SENCcWltcCt4QXJpMElrbjFoZ0N0K1lxSjRkL2E0NHJSbkQwcTBpTG1Z?=
 =?utf-8?B?SVc0eGF4S2dzNUV3dmFGYlA4MmRxYVorMnladDhLcmozMnFFZVgxMjltUGpW?=
 =?utf-8?B?UUE5c3MvcGduZ001S29KS1IrU3FLUmEzK2RPYzhNU3lXcnorQXhLSXUxWkdv?=
 =?utf-8?B?NWFqNEJBbDNmaU16eU80c2l4R09KWXZFMUVIZGtzV0xyaTIySFpUTzNHZWU2?=
 =?utf-8?B?Y3o4bloycS9CeXBacmV4d3Y4NmRBekRMbmt2ZDhSUzVjSks3OVNkc244RXVC?=
 =?utf-8?B?bzlGWlNyVG4zenNwUjhMVnZGTnh4L2NzRUFLNFJkaGw4dk56YmhtN00xL2RV?=
 =?utf-8?B?U2c9PQ==?=
Content-ID: <F35B84902884C047B99286DDFAB1ACC5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f388a5-cb5f-44ab-44b1-08da69646502
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 08:55:13.8640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rfAKClmlxxJYo9s5NTQ1vzIi4jEPnXmaRaiJsH2Y6+UA7L7IOk2WfSpQmaiiEMfb/lCP57n2iVZw7DE/tD37JkbR7OS/AYdQq6iZWoi/sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2943
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_015523_722377_ACB2A67D 
X-CRM114-Status: GOOD (  13.76  )
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

On 6/6/22 17:03, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi SPI-NOR maintainers,

Hi, Mika!

> 
> On Mon, May 09, 2022 at 09:12:17AM +0200, Michael Walle wrote:
>> Am 2022-05-06 12:51, schrieb Mika Westerberg:
>>> The Intel SPI controller does not support low level operations, like
>>> reading the flag status register (FSR). It only exposes a set of high
>>> level operations for software to use. For this reason check the return
>>> value of micron_st_nor_read_fsr() and if the operation was not
>>> supported, use the status register value only. This allows the chip to
>>> work even when attached to Intel SPI controller (there are such systems
>>> out there).
>>>
>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> Gentle ping on this :)
 
Sorry, I was out of office most of this release cycle.

Looks good to me, I can queue it. But I see in other thread that you requested
to ignore it? Why's that?

https://patchwork.ozlabs.org/project/linux-mtd/patch/20220616121446.293408-1-oocheret@cisco.com/
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
