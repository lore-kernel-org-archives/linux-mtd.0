Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3CEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksgu7YdT6hhfvHuN+ieq+irL9+f8KBnw0E+D6Ajbt94=; b=mT7TD2t9esgS8/
	CRK44uucC6qECV5YGT8lE4CJmlbgM8ZhSfaFYKYyObUOjhARirBL5h1fStCoYu45XpM3Qr7uvpo8u
	FyHalKgn86rDRnSt1M5z8uTdyr8epDcO3FnQrZ2XAXmRfr4ek6GMuUT5YqZZApvetKsPlDOtDCzDz
	oK6ucL2Za4JGXchVAnOOn32y2JwbiKo/TT5e7TV3HlD+KNSoW6MgK2L83ajXpcUpLhfYA+I1tVmE6
	bWYJgQThjFBqLAicWbf4W9OVMa/UP0i6Mk5yMWFsBQGnHQVR0YzuMpJ1KxnVyG38w4Nbb3mbyNH0S
	tVM6u+VLsbggJ21Ax8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtZa-001p9y-Vv; Tue, 15 Feb 2022 08:52:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtZX-001p8u-Pn
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 08:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644915151; x=1676451151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BaDCvre+ATMX3Vei4ysv7xcMzwabtq7J/8sfKz9lSMU=;
 b=jJfKmT7eHHSSxJdijJkWoYIxLdkLksnCNvhHsagsWL+Ez3RheDCuy988
 +lQsyNwWxo1hGVQI1+DmMAxmgk3YepXSUKnbof2QeAoLLsR9Eb0gKPEKv
 +GrsmjK9jW3vvfgCAxjAGrEmUHzNWC85efCcUeLqZ8mPJ7HB/ShuQcMP2
 xn2qW0DpHZOJ+DuM5fkB/tjxmGYKd8BijQQMxYJYHeogzhmZTbCa8z7dQ
 gVfqBVezEBCXhRZxGPrNXVfLXD0bjlA+SREXLjSDgKTPJjRuQ4duOn8D2
 reHzuKgKevbGpAP61jMldAvLh74MUXtGqjmLqQyiXwD1Lk5xO37FW1ls/ Q==;
IronPort-SDR: /riTwrMLuTqWmOc8HREhPZekPxpOjvUHy++AxbUXmeRb2v5H27T5Zl9NtOwQoHF5n0IlewiIXF
 4ggJ1zZm38vjmO4X6TaybRizWdJ+FUvnarEylgd/lIkzJnHufJm2Eirx+42csgNsLGR8feFZ3D
 EjusnRGE5Uwa+ggnEOmJZ6DrpfQfCSeSBTFh8EadShjFFmrn7u1IWSJ5OnKcXmFpbnJUv8yqk9
 1lCNYYQqbWh6rROaQZQZNaUjTiqzdH8HVy+XSdr/b2v6h7BJnC0ABzBzogP7WauFKwQ8mHFqT6
 /BhbQ+e7Hu0HT4s7A3JNS8nt
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="153627340"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Feb 2022 01:52:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 15 Feb 2022 01:52:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 15 Feb 2022 01:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hgk/0k5kfjIvvUk+x0x3vX481ZpADROK45fTkNQCAOeaq7fAPohCpvFIXmtW9tA/OvyeUJ2eo9VS6qtqbVaevDgupvXgL2nNlEd1as2WM+336krv+eZz0dlxnPOZLblNK8F4u55FhksT4TEcoLTwP/qpIjpK2gA/rdzgWa3KaJ3vQcN66bVFjhQ8QyoVawKgi+TwoTbheWd6iYrCNWnZ/ncPUF7HE4ytor8aa4KGWZa34duLvoALsTViUwWuMKMn9seO3yZLfDxezr8HLb8mAdOKPPF9zbHbOnhyFLg/U02RLA95zVlEbv9BQ3RdgN13KdsNI0tSAvUEy1jRxi9Z2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaDCvre+ATMX3Vei4ysv7xcMzwabtq7J/8sfKz9lSMU=;
 b=BDfMNs3pbotITryonssVFz6O9nFyNQnrzkLAQNDURMjnfatSidzTl5wvf76rqD2j7MQPhbGrfLQs0RWI7RK72x/HAK5jfbN86y3yaF2164fHqiquW/pQqGn0cwg/SFHau8j5xF8aDlLan32epk6qWi7Q5MeeyFyQD/IZWUKuVWepVHAHyOrT2Faewfgax6RApC5pc1j4dL/l9NTPfZlLV8xfND912fzA+RyB75IiDPVVaEsfxcRLN4LGPjoqy19mdBs4AkC+NDiO8eMw8v4vxZcz6ROO/+eCVMRx/A6dfFewmLwWaRuVKXhJOyNv1g809aN2WMv7xqWWsSCmEQQ8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaDCvre+ATMX3Vei4ysv7xcMzwabtq7J/8sfKz9lSMU=;
 b=noHIVIE1gJ+1KNHiAX3b2eUdiUOih9UCQ3IPa3k2tMR0Yy7WA+vEdXVHXVntjSZncoUqR6mGzFj3OL8HI6hYq4iLIR923VyPOkGkPhQuzCJxVDPKZjAwGdHFpODkS9vKiCrN6rSbOqpZjsYiVsiZI8TOitqlyf11cI9e98c7cvc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BL0PR11MB3425.namprd11.prod.outlook.com (2603:10b6:208:73::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 08:52:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:52:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Thread-Topic: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Thread-Index: AQHYHiuFz8+evF2o8USFiXwNjUvH0Q==
Date: Tue, 15 Feb 2022 08:52:13 +0000
Message-ID: <7d8b7581-4610-6c04-9033-dac9ba27038b@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
 <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
 <73d3d8ed2cb4ca1b06902b767fe529c3@walle.cc>
 <d76f21dd-4038-57de-f2f6-6afa947b62cb@microchip.com>
 <c3a58de8ee39dd473483dfd0ed8a0058@walle.cc>
In-Reply-To: <c3a58de8ee39dd473483dfd0ed8a0058@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87da95b1-7137-467a-3428-08d9f06075ce
x-ms-traffictypediagnostic: BL0PR11MB3425:EE_
x-microsoft-antispam-prvs: <BL0PR11MB342530D52B36666F1A92547BF0349@BL0PR11MB3425.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qQkHRkuyECbBcRvYG5iBxqBfJXt0hzjGhxYDByaXZy9sYEZqKIW8hTZJmjFIxIwZaZ5J1IJ/7Ul+L8/rTRmTj6Nsa8tdOpzPb4twcZMGr2XrCouCGgM1oJ+dnIKewMJ8OtlZUD9NUZpT88B1kuLGLP8kiL9sA+z8NZmHj2B6KVjseiOqfkvmGzTuy3XGKzxzEBWq4rAzMNfjqce3WLImDGB0Pk1RrkUzblsW9ThCHmfRExgvalTaggcLPv9IjgCA2ISNL2qhHxiUuW1pqwjTGZhbn6o3Tjv5KsD+jerjrWuv8OYewhTR7D8xbqE++1i+R3dxkEJtmr/rLRORHV+/BCppruOkMWPytoaZxiHAz3rojjHJdbSHxePYKZGTUVafreSuWIj4ga8KOaU/CTznDuY3BQf7qBjl1Q0XWyGVPqgsbHljBBIYbog1TZuUs3WIk7ggKD8V+rUMPHe/gMJ7VWvy+0mpYeitVZ8pqAvD2SS4S6BK39K7gW844N/xjefd6e90X/7ZdEeQrjydyddFcbY2P0Fhnp0Oe7CZ0ICPGPQ3tSUjqL0Uw6aInZfp1HDNOIojCBIIqiYrwpPbH0T8mWzE53aQU1BiSSRFSlseE/Unj5iAfoCt8UNa8BdnIr6XwIgGx7fm2LicNrtZoUaRYxPGKYH1M/+SIO1+U8U1RKAEAoCKbv27eN5xHuW3mppBHMj1GVC6DnpnthDm4S7K4XunwBqitgnEJOm2JKApsZOZKm3lcwefs7rc3p7rRu6X3/jBsvDm5hmtB46RDw6CJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66446008)(110136005)(4326008)(8676002)(64756008)(6486002)(54906003)(91956017)(316002)(76116006)(38070700005)(31686004)(8936002)(36756003)(38100700002)(5660300002)(66556008)(122000001)(66476007)(31696002)(66946007)(71200400001)(53546011)(2616005)(6506007)(2906002)(6512007)(508600001)(26005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1JBdjYyWStZMFBKQnQ0SVVyMGh2QzA3NjE4RmUvUVg2dTlqcGxONk9JOVpS?=
 =?utf-8?B?TEYvUnVRd0FsRHg4N2RZekpqdkh0WWpKbzZTeVY5R1Y2cTRRejJkYnFRaWxR?=
 =?utf-8?B?ZVo4UW4yQ3BmamxCeW1UWTBYNHNZM0wxdFJqTFU2cDZPVHRBWE51alZEL29v?=
 =?utf-8?B?TWNzMCtCZkJBd2pUUlRQaWdFTEdQTmRIY0JQdXUyTVNJbzNaOVZONTBNZEw2?=
 =?utf-8?B?YWtwUG85K3VCOHEvZEw4emtiNGJETnNlYVhFSmszU2I0KzhYVHJMczhEdFo3?=
 =?utf-8?B?RW44dWdaN2s5SXI5Z0Z6aUlSU04zT1FyaHBpU01kdWVnSFpLVkgyMklNRE1w?=
 =?utf-8?B?b1JSU2ZaVkNtbTRmQnRYZk9BeEtyWUs2eWEzRkJzelM5SlI1Tit0WFZsK3E5?=
 =?utf-8?B?SWxGMmZSa2FPNWw3RDY3MWFzdWpNZnNVc0x5YzM1ZnMzeEF2cGFxdVluK1Ux?=
 =?utf-8?B?aS9OdUg5YksweWxJZjArY3dHejVYTHpOSFkxVS82VXBwVm9XMDVOVFFZaWRs?=
 =?utf-8?B?cEJOVUhoMkNoekJraHVYOVo4MjBqOU9VcXJ4VkI3Y1d4Q242UTB0REk0L21M?=
 =?utf-8?B?ZDBVcVNSUlFmN1RndkRXMHhqcGJzd1MvTTNYeXEzTUxwVE9SUjVVemllejY5?=
 =?utf-8?B?R3YvSGxKRDdxQWl0NlBzeTcvdkl2NDFjSm9Wc0dKbDQ5R1A0dTdnenN4eUNx?=
 =?utf-8?B?cUNGQWhaeU9mTDhmSTZrSko2bStCeVo4Und6S1JaeXFJd3RDbkJNY3lsa2ha?=
 =?utf-8?B?V21WVzhiMTRIcG1YYSs5aWU0RjhiQWRHRGVQQitSR29FSHhtOXdwTjJIQnB5?=
 =?utf-8?B?eEZCditMeEtHOGJtWm9QK3E0UXJiUWxvd1JVN2JaMHdDcy9Lb0xQN1hXQVV6?=
 =?utf-8?B?YXdnc0pQeGhBOVJTZVpGWGoxZG1VdkZDajJ1NWRsNXptbGhIZVJWWnNnc1Mv?=
 =?utf-8?B?cjlTVDhuV2JzVEFCVzdPMkFHWUgxTTN1d2V3MmJ2alJ5dDgrN2R6cllvTTlx?=
 =?utf-8?B?OWR6YjBkU1doOGJwNVc3ckVUdUhDbHFXWkt4WG1ZWk9RNkhoSXhKY242NWs2?=
 =?utf-8?B?TytPS0FxZUx3ZkxUak9qeTJaM1pkTVhkdkNLNkt0TzEzOUNXZm1lOWN6bGdP?=
 =?utf-8?B?dEVJV2JMa3U3NVozT0FaUnlMdHBOb1o0VnA4MU9tQVNvckRqZUNuNUxKVGpV?=
 =?utf-8?B?dyt2NGhyZGhodFQzZTV3T0svbE1zcEYxTHJTOXdXa0tPbG1WcE01L3JMS043?=
 =?utf-8?B?WWV3dnZoOEVrazd2OGw1NkJaRmNCaGNISjgzRTdQWlo2MHhHNkROb0lqTVdU?=
 =?utf-8?B?dWpRbHdwa2xKV0gyL25RWklpYVNMcWNhT250eXltbU1GN3NnZ1ZxMUFleUxS?=
 =?utf-8?B?YUZYZDJwMEFBRm4zSkpuaGw5OStvMXlhWTNWWklIWFpTSkZqeGdxRkhIVXZy?=
 =?utf-8?B?VEJmbXNhdDhvZ05JWHVQTEFibTdrTGt6WnMzam44SFJpY0RVWUJhcWJBUEg5?=
 =?utf-8?B?ZFlqMXBUOXhZR2hyVGtUZytwY1kzM1VQMndrSzFPK1A3c1J6YXRDREE0UUUy?=
 =?utf-8?B?ZnVxcVliaG52N1lJbW90K3R6RTlOcFZJZVRHa0g3cWZjVmNuMmdnK2NpZjNr?=
 =?utf-8?B?eTZPTTEwb1lucm5TLyt4OHlXMlBtblBycTA5QVZVUnpWN2pnRVhvaDdtWE1E?=
 =?utf-8?B?bDFnRHZ2VU1SRkp4TzhDMDhuMU9aL2c5N1V0dmN2Y1MycERoZVFJelpSSDZR?=
 =?utf-8?B?MUF3NjVidytTb1JZVkhjZHlJRGljTi8xK3FKL2w2MmV3V2RwVysvNEtBRjJr?=
 =?utf-8?B?U2NWY25jL2VlckxCWjMvNExrY0JEd0pSb3dueHNWeEw4d01TOGZKdlBRUjda?=
 =?utf-8?B?eUNjMHhQa05OMzE5anJ6bkl6blpDbnBRSDh5WUY4dm54YnpqUXVEUlh5QnhM?=
 =?utf-8?B?eDhVZzByVmJBeUlITm16NUd6YmVnbzRCQ3ZkYUt6MXV2d0Fnd1FJUCs1VU15?=
 =?utf-8?B?WnpTZFdCVmc1Y3VUZVdlZlIxZEliSVdKNEdvK0xQVFpaVWFwVjJLcDZFWkRj?=
 =?utf-8?B?VW12V2tYSzliaTJSRDZTbENTaCswa0g5WTRBdFVrS2Z3NDFOZ2NTQVk3d2dq?=
 =?utf-8?B?VzYxQ2YyMlhtVG1ndXNmK0xnOXZoeDVUZHdnQ2VFMUhQQnpubTNrTFB5QnJu?=
 =?utf-8?B?WFIxdWxHNlB0VVd6b2pwbXVBMGdxN1MzaVlRUVNEdk5sUUh2M1plc3N1VGVN?=
 =?utf-8?B?c3pMZ3Y2UjVPMkQ4SGkzdG45SmlnPT0=?=
Content-ID: <D142FA0A5B26B6429A4E528C5AB602D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87da95b1-7137-467a-3428-08d9f06075ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:52:13.2985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yEZxZng3bRgQOFHVZMC6Rwfyv9uqQPbepGyrpmVhQaw8xpo0MDSYuTBpzUPKQlzAC3CniEx9jql69xExYKWfdkHcqO6KSAtP/byXJneTlMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_005231_957207_AAFBDEA4 
X-CRM114-Status: GOOD (  17.91  )
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

Miquel in To:

On 2/15/22 10:25, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-10 09:06, schrieb Tudor.Ambarus@microchip.com:
>> On 2/10/22 10:04, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Am 2022-02-10 04:08, schrieb Tudor.Ambarus@microchip.com:
>>>> On 2/2/22 16:58, Michael Walle wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>> know
>>>>> the content is safe
>>>>>
>>>>> Drop the generic spi_nor prefix for all the xilinx functions.
>>>>
>>>> mm, no, I would keep the spi_nor prefix because xilinx_sr_ready is
>>>> too
>>>> generic and can conflict with methods from other subsystems.
>>>
>>> But all the other functions in this file start with xilinx_ ;)
>>>
>>> I don't have a strong opinion here, other than it shouldn't
>>> be called spi_nor_read_blaba() because that looks like a
>>> standard spi nor function belonging in core.c
>>>
>>
>> then let's prepend all with spi_nor_xilinx_*()?
> 
> I'm still not sure what to do here. Have a look at all the other
> vendor modules in spi-nor. they are all prefixed with the vendor
> name? E.g. there is a sst_write() which is far more likely to
> cause a conflict. So should we rename all these functions? Or
> do we just take our chance that it might have a conflict in
> the future (with an easy fix to rename the function then). TBH
> I doubt there will be a global symbol "xilinx_read_sr()".

I doubt it will not be a conflict.

> 
> But I care for consistency, so having some named xilinx_, sst_,
> st_micron_ and some spi_nor_read_xsr sounds and looks awful.

yes, I agree. Take a look on what's happening in NAND. They prepend
the name with vendor_nand_*(). Or in SPI NAND they use flash family
names which should be unique. So how about aligning with NAND and
use vendor_nor_*()?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
