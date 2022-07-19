Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7401DC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EU6S9SLfPiD45xKKU0H3MT4fTqW6DWQpi02ybZBWU1Q=; b=OrhPf0jpStX1Fa
	QGcZIAWhaDpWE4WL/M+bQmeQNL+jmtBGwpgG1Ui89w4xq/EZFmQLinI2xDFLnKa3el9xKwPnIQI0C
	1DnbxV63SZ8xI1hjS3x1F3wCJ2ytWD/6K5XjN+hTqDfLUp0thCMQ8tkqGNsqIUmEYn9Qd/neElx3y
	dRYhy6cJQAGW1FycGVGMm0XiOXf+LudDYPsPES1lVuyl1wfcK9tMoe+th6kX+yjVRudhZp5b2qNI+
	aNKJ7/EgzDqUXHjNlq3psm3lyD/7IZrhyKgEOG3LV7x9Jak+RLr3vFw0Y9qCdZlHoM85mzwmtSuRI
	sRgnAnGx/fZDfYOZbgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhjg-005x6P-K6; Tue, 19 Jul 2022 07:33:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhjd-005x0R-2I
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 07:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658216016; x=1689752016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vK+LoGi4wJzrpr8SjTTQ55mnKQTqQ6ntaR6mnGIw2XU=;
  b=dsuxj1cStcZ9slh9004tW1VDzPqCCc5fngKR/BGAb5xzUcS24k8wlJBr
   wjEfY7yMoeJub/D+fFtmwr0YW56tdF+G7Ne0Rl2mTA2agScUgGUg78vev
   5CRFDGHh9K9pnTC5tXNy1ktG9ziwOfGHhihcdXpZ5E5tjzqX60yUh1NLZ
   5fIA5GXbWSJwhvcNCQnVkEmaBPY3RC9oBZdh6tjTUWnQDzUylRWz0Oqrk
   exqssfe4oDT7WgOjZc8toD/0PIqNT3uedh9U0uzCt78FynYYwTTeH3uWz
   5hcNicLkE0itcBGBS1LGmoEWK1CQzcZGkdC5vV9FXraxd5wEpCyAxhVzW
   A==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="168460023"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 00:33:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 00:33:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 19 Jul 2022 00:33:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRRwZmcStIYoWJ0X6p9SffSrVE/iUkyEUmVkm7Z7ImCBaDxIak7YOtiHFpK1k7vzMxs43YG7luOsh8xRSshYWfc7h8FMowJHsocNNKHB/azZgQheissIW/SeA+ggeqPiAV5EY7huiXeRtCZx3lobKLYZ6P5g1FF+Y6NYk/Lk+aam6Nw+MvozwLyBuRBNCtOmtZF1dchWl5l5NgheqEu306qNAzUAKBvkuYtz2hyEmsArrpptf4CGbSrTvt+OK3gIOsTmjr5jtF3Aw9Ne5zcC+ZLn968dhKO7LKPXWA/nPBm62shwx/KkMmsgzpdCa9rrfb9SEBvUzfbvEE4MTiqDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK+LoGi4wJzrpr8SjTTQ55mnKQTqQ6ntaR6mnGIw2XU=;
 b=ldCzHLge7whK1fDYevflfXqfOICPTCU56tjpvOJrumpJjtuR0r1bmr/jykUXUt4yjLIel3HOeTDAkpvqoPNNqWFk8xzUAHjuWcuq5XNLZ+qbnQedbiqOpeuymMU5lh1eawbc+KLFZ9bCfFVHOMuPBnxpPFFZVLJu4RPmeb6+ypRxN17N8oNFHNGy/lp/qrjMMyDfQzaKHgoy+VG5E/l6Hw2xwBrdqwQLjvcgk9FgbDGtSkeSFfKMmHIH+tJ97S5g1BDSKHPlU4Vy/LjDE44C2jMimMLdkkEc8uFLCJ3Bmbty+UY1EsYuQtxlP7yPgQt/hnBRu343xkJEmXGCdHILBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK+LoGi4wJzrpr8SjTTQ55mnKQTqQ6ntaR6mnGIw2XU=;
 b=b/2o88AMCMjj7RGOHWVOoFI3OiQ+Yha11p/U2nuCZnFei3n2Y0OXTJbhM3NXZSqjiovzK8hjzSsaDn6IeYl+G1PKF1fINfdtEdMKSN1Rcmhq9ax7Y6WrRabDYVq79dc//cBcleCgOS0RXEhsrREyp3ykM4VO4eAeUqPPKFLgNQM=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Tue, 19 Jul 2022 07:33:27 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:33:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Index: AQHYmzRwuAFPdIe45ECo1RhI0CKwAw==
Date: Tue, 19 Jul 2022 07:33:26 +0000
Message-ID: <7365146d-b001-2a14-014d-62a6b19f4381@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
 <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
 <02125e047cfbf347d81811224be3141e@walle.cc>
In-Reply-To: <02125e047cfbf347d81811224be3141e@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbc86dd6-6844-47af-b808-08da6958f844
x-ms-traffictypediagnostic: CY5PR11MB6533:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2VV4cnh4Kab2ul+ImFWJq1efVRSPJQpYqJXSgepy8fYHZ0IDAcEcpxzwQwcbKcjxAj0Qni8582BECkZZKE4Fd1CCWvizo6L1NaV1mgIbSP3u869+KC9KozZDkT12teknKR72Co0fjWdG45C6lSzb5OTCUmAfslAbc9ZDZ+j3qpKIUOOIu/HrN2qEvssrm7BErGfigtLFnXvvGY9sVTdwn5fB5qUY9mMd4S7tlK+GP70uUs+eF1sAAAlsSxCnLHtH/O5rsS0A7FbNFnyDIyOz/DqS/hJ9iKVpdkwtpu03lfqGKiQMr0WlzpJQIvrFyHkJU/y0pC1Q7nSMkBg2OMTEDu8ozVtiNboVWeQwt7L73fM8AINY0I2qnV71Zo9o/DmQ58W+dLerQleNDo0vnIIWtjWCSjvcE373XG8XGz8qtQ9eM185UC0k8lO9SFt/3Vx/hpIu1/OQtzHKeP3YsEHykKtyTqcxC26H6G1J27tswMqf0tSvIO5YDMisanpvBQZyi0hwyf02sTFjbgi9Mbdllux9vqLCjmPjvp5KlV6//Ey9xOjk5Wcu4enKQojjrHGn/qFs9pBD+bQq0N591YbqQjXclT5hafH0emhV2zEGSqekJ9698e9N1VUZjgb9egnBbUJW0uom5mSg5slWzD3Q0mcho8qMWIwydt3ad4EgI6e5PYfPp+ICWrl+HCsnSDOFjOWRlDzn9o2PWTHqcciZIfKApy2UnWzw7jlBf9+pHo+BVltpn0R//uENhEGpvqXfqOSZs3sIPCf9rwVWbcQKfZGmRi9SdyqYmLyCTMph6AVGJgqkcNiQTVY8XVzuZfaavv/Od9M2io1ip8IcZM1baE8yfIF3ZtVciJw1+ywBwpj6NZ1qeXtyKVqfkcN7E5mvHcTOHrJzi/cPwIZQ087RlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(376002)(136003)(4326008)(71200400001)(38070700005)(26005)(64756008)(31686004)(2616005)(41300700001)(91956017)(478600001)(36756003)(186003)(66946007)(66446008)(38100700002)(66556008)(8676002)(66476007)(53546011)(6512007)(122000001)(76116006)(5660300002)(6486002)(966005)(86362001)(8936002)(316002)(54906003)(31696002)(6916009)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1dnMFhYank5L0JwTE14OE4vYWxyRUloemRuZ1AvUkJqSDZrMWs0V3ZKRW9z?=
 =?utf-8?B?NkRZZ1haQkFYemlLZ0F0VmFOcE9IbzN5WUZKVjg1ZUJNdHZETWQ0QzlESkV5?=
 =?utf-8?B?Y1dvS2h2dHhFYU1tTFpCaGswUXdDZ29mRXI4bU1GZzQrUUh4a0R1VVhGVmhs?=
 =?utf-8?B?WFEwRjV2ZXB0OEd4ZlRLK1J6RmFEVitaREdZSzhLRndYQTNTay9NcmFBdnZM?=
 =?utf-8?B?a3JyTk12T3NuM3BpRGViUnF5WnpRczlGYWRjVEgwbEdDYjlkWW42WWFUZmZl?=
 =?utf-8?B?UzBwSVhNNXRKT1FKWWpFcERKR3lyajZZSjB4UVNrOENzMkxDQ0VGODI4a2J2?=
 =?utf-8?B?anFyWE9tOVBaTS9GNmEvNVlqSzVLL0ZFRFgvMENFTWxkd0NGSVYzb2VFdWV0?=
 =?utf-8?B?ZkM4ZUlDNGZMS0VYd2dvNzROVk92V1FEV2V0ak1uR3RGUHJKTktIZjNzTWcw?=
 =?utf-8?B?N3EvSWZLQVovSzZ1anBnUFd5UTYvVElraUFvQytYd1VveXl6bUVqbU1reGZk?=
 =?utf-8?B?a0RaaU5YQkZtSzNFc2phMTdyZWE0SG1iUGN5R0VOVDhRbGRSQlJBU1JxQnVk?=
 =?utf-8?B?Z2EwZldvVXRwVzdXLzlUMnN4dVZHSW44TGdlL2JYanlnNG1CU2NUdlkrajk4?=
 =?utf-8?B?cjBja1R4c3FQWTNNdmRRV1BxcTZGMGQ3dHVBd2Z6SlE5THN4TVp2L0ZZM2ls?=
 =?utf-8?B?L0RSNHczNUpFWkY1QmdOeSswSjU2SkRkbzNKQUt1TEJYUzJoKzRPT2ZLQTBj?=
 =?utf-8?B?cnlrTXBBd0wxWmsrTGVCVWlZSTNnQTNBZnBIWllxdDBjNTdVN1Z2Q1k2UGpR?=
 =?utf-8?B?cFAzYzhseW5kM3J0alJSY1BCUTRiWTkrc2YweDdydEc4dUZCdVZhL0w5OW1C?=
 =?utf-8?B?QXpHa2loeWw2QVZ0MjA1am0xUnV6MUVra21sZHgvQWdJVnVTQnQ5NUZZd3R3?=
 =?utf-8?B?dnpyZHpRcGplajQvM0tCMExtU2h0SWZNbVl6MWlGOTdwZ2FEVmdGSEFFMjdR?=
 =?utf-8?B?RE0veVF6NEIyNTVFMDQxWTQ2S2tlQlJ1S3BIWVkyNXZ4NTlsRGlZM05YTFJr?=
 =?utf-8?B?STBFSmhVT1ZNYmE3MHJtbk8yb0dvTld0WnVpL01ZaHBmZDBLL2N6RTNyZ1lQ?=
 =?utf-8?B?YmNYTHJOVXQxU3djSnJtSWhZZDExYUxidkdhc3BLQWZ1UU41N3NVQWVqMFkw?=
 =?utf-8?B?eTFubzk0M042TmlONjcxbGE4ZW8wSGpybXhHUHU4MW5vdHRkRHhBTzFuZDBl?=
 =?utf-8?B?WXYvQVlJaVZLd1ZvK1A3NGhmc3lZRzdaNUk4ZmtHZ0pubWNHd08wUlZRQkRa?=
 =?utf-8?B?WldpT3N5aU1yV0ZkeGJpSVNGSy9JeDlYbzlYNzhzZk5lSzJZb0Z0NjdvSDEx?=
 =?utf-8?B?ekw5SHc3UXkzdk9xOGpGRzFqZ2pVcFhMV2RNQkN6cUhGclliYjNWajFrYTVs?=
 =?utf-8?B?SkYzeGxOUFBlLytuUzJycDVQOEVYRzh4N2RCQkRXOXlseUJaak9VL05OTW9t?=
 =?utf-8?B?WEppamFWa1dNTDFFUDdadHdrZUZkYUNMUTE3ellKQzNOSVgwdkxNU1Rta2Fw?=
 =?utf-8?B?bnpXd3hHQWp4OGNaR3pCL1hReWN0TXQ5OG90ZG9wTStIemhSVkNLYjR0NFpX?=
 =?utf-8?B?MThtTzBjdXkza2pqTHhoUUMvakxoQ2VQdHRiRGtyMEJSOUlLaHNvZ1pKMFNS?=
 =?utf-8?B?eUlxVktPWEZXbHppWGJmeU0wRURneDdpVFI3VlovOEwwaitIRUtzTXZXQWlO?=
 =?utf-8?B?YXc4T0VRTTF5Z1lkOVJLWlJvUFpLNHVobTZtUlZ4TXE5OFpxK2ZIcWlTbGdr?=
 =?utf-8?B?MUxjYnBPUlpMRVlDV2RSbDBtL25ONkppZGttOTA0MmQvNEUwU0R4UXZqQVlz?=
 =?utf-8?B?SWFzTTAyUzdRczRTblIxYVhQVUxvaHBSUFRwdE9SMWkzZFFhYjVucmlKd2RB?=
 =?utf-8?B?YWFzS3BCQURSSFozNUVLSlBIaEovQ1JrMXVnYlFGWno2bnpkbG54SHRUUnZZ?=
 =?utf-8?B?dGFLMmVqWVJVK1BuYjM3ZGllUnBLQmY5T05Kazl2Z3BxMk9hRkc3bUN6city?=
 =?utf-8?B?TVA5U1pScWJRZjdlRmVrUERsWmxTRHFOOTVzUGxBNHdGZXEwcFErZVFPMzBq?=
 =?utf-8?B?bUZ1eXpFRGcxalNVQUk2U2xVSWRGWE9Mb2h2YytsYTBRS3JzUlJjSUF2L2x3?=
 =?utf-8?B?MVE9PQ==?=
Content-ID: <ADEF2DA4AB233944A7B13BE6B5F4FED7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc86dd6-6844-47af-b808-08da6958f844
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 07:33:26.9012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgGzB3A5x0Fqq1wqa3Bup3OuDfSV/wp5Xqc8sSn73QObO4g9GXWSYdNqtjcP5mx1/1T1ASp7srohORk04/V+HKHUW2mDmX8d+UzfeIxwunY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_003337_203554_2FA870A8 
X-CRM114-Status: GOOD (  19.18  )
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

On 7/19/22 10:07, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-07-19 07:57, schrieb Tudor.Ambarus@microchip.com:
>> On 5/10/22 17:02, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Up until now, flashes were defined by specifying the JEDEC ID, the
>>> sector size and the number of sectors. This can be read by parsing the
>>> SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
>>> which just takes the JEDEC ID and implicitly set .parse_sfdp = true.
>>> All
>>> new flashes which have SFDP should use this macro.
>>
>> I like the idea, but you need to refine it a bit.
>> Your assumptions are true only for flashes that are compliant with SFDP
>> revB or
>> later because params->page_size is initialized by querying BFPT DWORD
>> 11. I think it would be good to specify this in the comment section.
> 
> Sure.
> 
>> Also, I think you introduce
>> a bug in spi_nor_select_erase() when CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
>> is not
>> selected. wanted_size will be zero, will you select an invalid erase
>> type?
> 
> You mean to squeeze [1] into this one? If so, sure.
> 
> -michael
> 
> [1]
> https://lore.kernel.org/linux-mtd/20220716000643.3541839-1-quic_jaehyoo@quicinc.com/

No, these are orthogonal. If you keep wanted_size to zero, then
spi_nor_select_uniform_erase() will return NULL, doesn't it?


Maybe to adapt the code to something like
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 21cefe2864ba..dd6cd852d1ef 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2148,7 +2148,7 @@ static int spi_nor_select_erase(struct spi_nor *nor)
        struct spi_nor_erase_map *map = &nor->params->erase_map;
        const struct spi_nor_erase_type *erase = NULL;
        struct mtd_info *mtd = &nor->mtd;
-       u32 wanted_size = nor->info->sector_size;
+       u32 wanted_size = nor->params->sector_size;

and fill nor->params->sector_size even when no SFDP

Also, params->size = (u64)info->sector_size * info->n_sectors; from
spi_nor_init_default_params() becomes superfluous. I would check
the fields that I don't initialize in flash_info with SNOR_ID3
and check how I can mitigate their absence throughout the code.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
