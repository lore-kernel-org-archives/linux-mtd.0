Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7357FC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySNF0juX4GJitBpLl3dXxDb7x3jgjlXA2q6ZYE64vRY=; b=y+PyTR0BL7qPxm
	8Pa2XN+AS8xImmP9Rdy6j6JhafKKxjrNguPPkgn2kH8oe3jtmNouI1QoWUPsQK1xFXkfEwz0fAYb+
	iRGBSlBtEu8T3R0CQLaq8EUfRJ+KIGmFAzvXwRZsCXqRbhSfE7XGNg6peyLbgSGNZifEFwpy8k1VW
	1GD18gbJpJni0sEoIY9+STHpYaYQi0rB16sPx4jncmRBt3hNDzTtcrJlXWIyObGTqAB5fxmOAS1h3
	cGS5FuLlZ9jdt/0AUecBVWZUnt4b8DKckyXfd4G7yPYmMw6r/OzYLy5lPN7FOzmJ8aPy09ELnVBun
	0MXU3QA/wYc+RGA7vD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSkk-009PyY-Uj; Tue, 22 Nov 2022 12:51:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSkf-009Px0-5c
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 12:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669121509; x=1700657509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Fk28zh/B/7qL6IzeJ3ZB5y1B/Uu4J1mxBmD59DzEzss=;
  b=ONduVc9BnH1TwRN3evpjLrxtya3ZL2utuKp8o8mtemU+jsZ5uXzVAKzC
   SQZUhpuUabaBPo6SYzW7wEKAXqu5wTPedhx68OMIK3JECqVsyNeY5q3eC
   7O5O4DPkz5W1y9e6LhtTAuRmbNsp4x80ZiDU2YSR7w5FZ/7yuYK4agwUG
   MzXOxCRAUdHW/OoI39ERJzsirH4Ckyi094UUX7Mt0C58Omr108t6Bs6aM
   nvBy/WhKcQP1HHbzLyhI3V8lvCb+Z9M3SNja+kFL8wPQJB62AMQKJl1Es
   x5BV/4bsQ3B4qe3YXHbhGIHVxQ7Lf+5t9bpJcwa0b3J6WJ7FN59JJxsT1
   A==;
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="190048699"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 05:51:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 05:51:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 22 Nov 2022 05:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+JwpBnvZF7MdnearVvUZ+HXCtr6XCtXtJ2fDLBYG/ebE46STrPpSBN6oFoCj6PkYrwIr1fB9rNngemH4/qzkOhIUZ6NdLS5EIzX1JMTgHuf0UADG/QRuqtA63OAFQV9x1SbuASflhaZDg2F0PhJsAFGtetl4b/ksuyOyI7QdkjtmBHA92Ye9/5ILn+YapAloK2eiGOLd0nKX3OX/FnOfycqGCBn5jdthVxgYG5J0cxpYkMUGBb8ym4fPL61sKG3x99IvOIw7Zbnu2vXxExPB1U7ZM4TwRpWlrMadaVcKWYG+3R9A+fAbslpl766VlwBFxTp6tehVAiyUJQb9pZ6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk28zh/B/7qL6IzeJ3ZB5y1B/Uu4J1mxBmD59DzEzss=;
 b=VERSP3oHqSMsePNNWW+irjAnCq6Geo+W8XtNqExXeTGntZun0vbWksuLPt0KCdJYcyI9JJu40/7KzoKXd/hGv3MeViNctNby8VQFYkrXWcptb2dOYV3WU3Qx71aYVQZvoTDpnCWTRt6kbyhFrRR2fVVoklMxlkU4N5FvKfx/HhyGTdZE6XC34kavfYVRKcxwjcKXJgcKqVi4pCgyZmVKOJn7jsOojLVY5ejLiI+AIzalq437wZzrtzdda74QAtrRK16aN0xWplIr0JCGZSF6nQPlsbZWhnIjYuJtz4+M6RjTL7SMX/cCtWM7yLOXxPkW2blCvwO/LA9ubfFQVFvC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk28zh/B/7qL6IzeJ3ZB5y1B/Uu4J1mxBmD59DzEzss=;
 b=B/oynV+AQ7aUQvVExq/HU9TST7dmL/gfCktiV4QLPDwzmWYMvuW7LeiQqmPAhmezlH4e8HkLs1MM5cI80OUbd/Gt3CXnsa6KuJroleWfZ6FUUK+fDULOWVTNeQnYG/l9DC88A45D73xFVqxpHdxF2DZrxaJXk7LfpN5mngio/Xg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 12:51:47 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 12:51:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Thread-Topic: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Thread-Index: AQHY/bp3TTNDOiKYzU6EJOHdvS+Odg==
Date: Tue, 22 Nov 2022 12:51:47 +0000
Message-ID: <af2aa562-b35a-7a25-49b3-4384164b61ed@microchip.com>
References: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
 <959a3de3-dd71-acaa-d26b-0e93f3db820a@microchip.com>
 <Y3yxDLw3n643Ivf2@black.fi.intel.com>
 <870780c6-6f2e-9b90-6540-2c408f206f6b@microchip.com>
 <Y3y/teAMsOp/tnUk@black.fi.intel.com>
In-Reply-To: <Y3y/teAMsOp/tnUk@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|DM4PR11MB6165:EE_
x-ms-office365-filtering-correlation-id: f1e6aa58-6b70-4843-430f-08dacc8850e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CyUEjau9OOOsE0hftKZEL3DiG9YqdQvdVrlB2pjC85Q371aK9l9P1nPtXZAQYcW2UIXpdvf/oEdzcjxnJZUP5kZM6hTTeEwdJ38crlfCo5YYdXMg0HuAw3U2y56NT7Kf6HyWl2zYsevTNa3M/UqQmR6kK/SAC3y1tkkQXnEz2nko8mt2HWMppkXqwW4tM8lO+H4PN5W4mGW6cfrZuJM0aMSTOhl1TH5HWyPjqRQqmkjagP7QbDW/POM4TNqJ5wtrMPQIblef04KNHa6xwsSK3V3exl/1sx0mrt4v03hEwMD2SJ9GEcHsxfCE53FXjHqqRNptiDMidtiS0CY0AXWAyO4JVSXC87RNqtTH/6N/1GD7tStAlzF93fpr3oqbAq68F8hNCZUec6d03hQLdRKiC1DtpAbTM/4f65y1mIDExUNnZdUr9Pw6vzIBfky+jJG/UoivnXJLWpOCyH3jnCaX/68owsvldaRt4d4n6sDokKab5BHpuRGE/wghfMg45q8e9La85zcjyVtGHsaURilcg8467PbTbv93/p7AgVsceXpnY7bcp604pTa1xTgRl6ws9UB21DUrJCMpQkfpbhrfEtbMgxVAuF3KWWEi0HOgZJC5lGsWo5veBs5lL1LkAlGvb5qxfr+ks87TZLtvmjBJlImrPgd6TDobZ0Hb5GdLHdXq46sab6X3hQb87GSs5nNgeaZdxUEybaRvmc11vqN2FrnpBcPhc0Jg/Klwus19vBWpov92S/TY23ayYamSNnhei0kD3JnhQB5LAbUYNbu/U4p1AmjqP0i5WLfYsQteK9E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199015)(31686004)(2906002)(83380400001)(86362001)(38100700002)(4744005)(478600001)(36756003)(31696002)(316002)(6506007)(2616005)(8936002)(6512007)(5660300002)(26005)(6486002)(53546011)(186003)(4326008)(71200400001)(8676002)(66446008)(66476007)(66946007)(122000001)(66556008)(91956017)(64756008)(76116006)(6916009)(54906003)(38070700005)(41300700001)(138113003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWZqQXZ2OU9ubnB1a1BWVXRSdWhVZ2k1YTJqcWJSNEpEQ1V1VVo5R3ZBd2Nt?=
 =?utf-8?B?cmh0Vk1FTXRCZE8vREpNNDVxVnVaSlpadXRmR2RoeTZOVVRGeXYzTkpQK2g4?=
 =?utf-8?B?anZ0WEJwSmZPNno0S2Z1cTQ2MFQ3dzRzd0lseFNqYUFvMWZvaG1TODV2QnRw?=
 =?utf-8?B?ZkVxSzBOZEM0ZTQydVRjelRjSEpMM3VtdFRpalhBSG9lTEtKTjBXdTF2T3lG?=
 =?utf-8?B?elNpRTRYMEdwR3QzTXpjRXV1eFBQbHNvcXhndEJTZkdHeVZjNnFTcFVEUEpG?=
 =?utf-8?B?MzNvenVxYUIyQk1aQmpsbXVWeUhqdGdGQkw3Rk43akZpekwxTXp3d0kvTWxq?=
 =?utf-8?B?UHZlQkhZaXhhcGVla1pXOXpGSzJiRHY1WDNtRXN4SEpEUmRPakVPaWFBNytX?=
 =?utf-8?B?Q2tHdHpjc1RrSllmOW41aEdKcGkwaWZ4Wk5IaUxJVFl0d0RTWkp4RmhxNVRi?=
 =?utf-8?B?aUMwTUZOWnF4MC8waVUzaGFJeDNpOEhHVU55QXcxeHE3cE83WEZBWUJTNWNl?=
 =?utf-8?B?Y1lrejVhZG5aS01ZaXZiaG9FaXNINGN5UjhOYlYwL0tEZGM1cHBlUjVnOHk3?=
 =?utf-8?B?MmV6R0l1UnpZUGhWNkJGOG5zczh4Z0tUTHZCd1RYTEdjTElkT1pWZlF2U3lp?=
 =?utf-8?B?Yk9ZY2pPVFBkaktZY0dvVkI3OWxaMlAyOXB0eXBqWUFtTEt2cGExalJXTm5M?=
 =?utf-8?B?TkFYeE03YnZ5TVhiTzBTejlscGZ6WkpYWFlHZFlQOSt5WWJEc3VnekRiRnlv?=
 =?utf-8?B?YWp4T0dpMXgyUjdiNVJ2OXJDV2c1RFE0dDZPM1VUTjlPNDNoZzZLOW5CN2U2?=
 =?utf-8?B?cTRBNDYwWnI2TUlvY292b3lrUWllSmNWeCtzSDFWZm80UE5GR0s3eVZKeWR3?=
 =?utf-8?B?UnRMUGpBU3dJcGdBZlowTFJraVk2TEVmWjRzdDU1dDArbUhLaE5BVU5RdnI1?=
 =?utf-8?B?VkhoKzVVTGJmUXlGMzhFanRDcEdCRWNCalNIV0ZHM2UvZDNjNTJsRWNkaVdD?=
 =?utf-8?B?OEx5Z3Q5V1JGNXpvZzhJbUNqUVJOYmlhaEZGN0RwVHI5Nk1ZZ25acUdpdzlp?=
 =?utf-8?B?eXB4czJEVitSZGN6V2xRejB2bDh4ck1wZWZnUHBMd0dkWUJGMzVuSDkvY1RR?=
 =?utf-8?B?eEVYYVNiTlFxVStDQzNlWFc3dmVnSkZteVR5OFQ0aHZ3TWVKRkJkeW5jQzdw?=
 =?utf-8?B?dmdoeC9ic0xtdjZDbThjTlo5MDJiTWE4WHZHTkl0UnZoVjJuMElBQ3VMUzg5?=
 =?utf-8?B?QzMveXJZb0M3cllWRmliM0d4c0VtVGRaRStFREdTbmh0RXVoNUloTEFjaDBO?=
 =?utf-8?B?TkRtUGM3SzNnNDNUWVJMNEVkQjMzU0J5OXdVa292SFBRNmp5cFJPc0lhaHlW?=
 =?utf-8?B?UERSMk10ZlJiakR3WldYL09QakRVWm1IdjFKbm5KZjNXTERWYzIzQjJUY0tt?=
 =?utf-8?B?RzBZZHpCUm1NU01JaGRSSjNSdFRxQTZPQXI3bEY1TEtxc01zN2NucFk0RFgr?=
 =?utf-8?B?SDJyejZJa0M5RHpVbUlSRVphWDZCZUVibXJKWjFSWmtBekxUeEJIR1h0R2gx?=
 =?utf-8?B?YThoUUxBbm5tUnpDcFV0NmEzTWpQMC9ETncwWGNua1NDdzd3cXg3dkNmSllj?=
 =?utf-8?B?ZDVOVk1DeDFhV3NZR0trSUlUQkxTaUpCN21pZnNqZmJYbWJlQmJMdU5XcnB3?=
 =?utf-8?B?amhFSHpXOU0rOGcyRHp6UmZqTE1MUmNuVFd5Qm5TNnEzR3Jia0phdWxHNTNT?=
 =?utf-8?B?MnpDM2dFVUF1c3kwMTM1M25kOWNZQjVvWmUrZU5DNTk3UFJqa2NmNGJxSWtP?=
 =?utf-8?B?RVBJaDRSM3hJQkVpSlJXdHNoS3ZIdnAwRzA2cmtVNm51bDI3SVdyU2p1dnZL?=
 =?utf-8?B?NnpLWWFvcENaVGVKZWc4MDJpWmlqVk1hQTBlemI1U2hqQU8zRmZnNnJLMHNy?=
 =?utf-8?B?VUdUM2ZNZjRmR2FVT0tTcGVwTEpEbWJtU3drMm15SWh4YXFjUE1mbjdCL0xZ?=
 =?utf-8?B?UWs4UkkrNkRVTWFXLzY2b0hZZkxiVjZML2taSUJEazZONmhLQUMzTDlwMFJx?=
 =?utf-8?B?YmJBKzBpRE5DM2xvQ216Sm9lQ3RDQUlYUTJMbHIvODUwdE1HSkJZSHVWZEZS?=
 =?utf-8?B?TVhGWU5IaWRBMmdWSUlyOWU4UjdnYm1VdGgwR0plTnliU2NXeWI1TE5kU1hi?=
 =?utf-8?B?c1E9PQ==?=
Content-ID: <EA5A030A9AD2BD4B9D82B7043A92D1A9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e6aa58-6b70-4843-430f-08dacc8850e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 12:51:47.0829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XEmHwBC3Pzq5Y7nxt7nwt8x05iHu4AWrmrTq01kQxiYNQHAhftZZpmflT1tlH9sftX8KGrb9WpFpl+jY479RTrUfKJN52zepJkI2YWohXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_045149_239678_67892D33 
X-CRM114-Status: GOOD (  14.45  )
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

On 11/22/22 14:25, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> On Tue, Nov 22, 2022 at 11:59:47AM +0000, Tudor.Ambarus@microchip.com wrote:
>> sure, it's fine, yes. Did you test the locking part of your patch?
>> I'm asking because if you don't need the locking or you're not able to test
>> it, then you can use the spi-nor-generic driver introduced by Michael at
>> [1] and you won't need an entry for the flash at all.
> 
> Nice! I think this one should be enough for us. It's coming for v6.2
> right?

yes, I queued the support.

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
