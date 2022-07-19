Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D8CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GeXcVVcX29uB64aEgQOBR5Kxh6Z6sTPqVa0m7KJwNo=; b=jN5VyN6lJvzYWG
	F+fW3ZV9acPkQAK1ReNAvr87QvZoSxl6P2W7AjSxTowf01nfU8tutG519uRAzaUjyDJ+9R9hJrWFV
	+KfC3DgH5/WJ9bdZKn1L/1mwAyEcd/8eBY/u0rfvtmOtOcsTue2at6Z4pupFizwZfcv9CMtcg9AiI
	stLbxxQdsTktmaQVSg5491ILEqFXIng0cT0VL5KFyl6Hiu68Ihtcg65/Kir5ZpwiANtO9p5RqJ/4G
	gZ6PO+HXqNG9DAJkgnzspoTvSw/lbcY6F/9DnMRZjLFygOb5EkaqjIF6t3gqQMoSfx1h4i8j7WCyu
	LG2TuSeYY7uZfgkBv/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhmd-005yia-DQ; Tue, 19 Jul 2022 07:36:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhmS-005yap-18
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 07:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658216191; x=1689752191;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1dbLOySNwur9SZR1OSLMrokXp5A96iBC5PweTcFjous=;
  b=IS8/YvRFXIk4HfhycwvLikd+a22nJi+kF3eGtrPxVKXXyvMxFXiS3U2V
   SA/gB+H8lk0qPrU3QFeoG+CtmLhWVs5BsLNIhtJd39nVY8XRlvGyBtg0a
   K+y/7dFVrOHMR+cb684cz351WbyvJp8IGoAdRz7ml0yayCWpvte5PaxUl
   0Hnm2V6jCt9Sv/UFOjZukUA7MrFUJ4Q5zYkVc7xzJwsCEwYCKO16tmAWl
   JJNv5mJ2LHNnSmetj+LF2jFLbnae/rMlRn/OIhztgS+IRgtnNSL+vgzCV
   p2H+OZ+Rades0p107t/YgitHp5myj4gDnjl4XteaaFcPmZJcGqcEymSbg
   g==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="182776564"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 00:36:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 00:36:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Jul 2022 00:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjT4EEZbjP8BDfhB/FNphix0hm5EvD6PGD6PrJmrmp+Jj0ySLR2ZxITKEYpU5j5hDAIlKh/1LW8TaY7CRJBsBHG2zGmwJrePj8C7AT9WVMhXFzHd2hab+ycJ/Rbo9gI9M8/90lAuAx6x0WMdSQYvjyTLDmTVZGAwR97LO52STLL16bdggofTNUFkbkdCfxNP8Xjow8qc28/ji/7o7idfctGoV7/zW/Qfcw6f7hD6I6OFS0DXfu3dE90LNd4snQcQa2xz6+6tPebYYQUnY8RRCMHZyN5J7tskjM5+4BHy2YwuzTfCQjPlF5O+9Y26f9UuOyd9euhy9C1pp+imzK0DLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dbLOySNwur9SZR1OSLMrokXp5A96iBC5PweTcFjous=;
 b=deJ8AITWBKB9NAiB9j7i87rCyXHDmHhV790GQW1K60beIseL/efRH10EHm5bYu0nvXuCcY1RwpvF33Fe6FrtClet29/SPf4U7cm+eZBhdAVE/ZKS1zB7MHLawAOARFaUgsWBPAgJgDibUhWTpilxjBt1R5GVTudKMTTddvUjK1t/JY6DKVXB0B8FdJYefFdWyHHR6DsjEFGKolWGtZu0cXYPB85FDNSgFltb/4PG38WJVRnWNlIvhL/8vf865o1jG6+n+SBFQOdHOjpCifm9tZOrPqs9lUXr/73glnuQZqESkXvmMqXwLTTyV5PwipKE/lzRyA3D+A3MSZgwKFrZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dbLOySNwur9SZR1OSLMrokXp5A96iBC5PweTcFjous=;
 b=HjVGLhChrBlrdDYnikad2s3gaCKI0acjcq4reCQD0dLGZDOWwUQOOnfZxKjj5GVbz49AF/My/c4f5mjaRWCqPm6etWasXv084ut+EnSz7G++oavwVL1Kuare+CnG1L23TxRS35h3TG6Ujusyr1GAoUC0jPImdB7l7rgOcsmTCQA=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Tue, 19 Jul 2022 07:36:14 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:36:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Conor.Dooley@microchip.com>, <p.yadav@ti.com>
CC: <tudor.ambarus@gmail.com>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <michael@walle.cc>
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org email
Thread-Topic: [PATCH] MAINTAINERS: Use my kernel.org email
Thread-Index: AQHYm0I5xTsHtamg50WbpqwXvnFVuQ==
Date: Tue, 19 Jul 2022 07:36:14 +0000
Message-ID: <d8bb24a9-ad36-0acd-2672-731ae08af77f@microchip.com>
References: <20220718151243.1149442-1-p.yadav@ti.com>
 <165820520992.90015.1804934724521244853.b4-ty@gmail.com>
 <6b9a2433-12de-eee4-02a0-3cf9ea8843e4@microchip.com>
In-Reply-To: <6b9a2433-12de-eee4-02a0-3cf9ea8843e4@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa43a3cb-d0bb-4056-be64-08da69595c48
x-ms-traffictypediagnostic: CY5PR11MB6533:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: viAJOIb7wPowvzUj6jqOK6QNLk4pWVqWH8QsK23Vj8ISZf/O3KaDKiSi0Xv01GminoB7rjON549ODjTU9lg8z+bUKnvrp7cZgIAo45GfG77DCwWWS88XDVzVJcPoxQa24qelv9OxvapO01PoxCxZxG/jP/WRkb46jJXS1usKdmQulTsJGhh7zASgKTWX4/fZj0aaaFnE+Tfcum8z8QOPxMpXP+kEPp8IwOUD/boFrHXjmdN7WEPAEJ2y1MWqa9iqFMWEuL0b2xQ9+eCe9dkV9e8Z636azDSRa71ZQ3w65n1fPIpxcwfvt6+Ka+pbxUqZBLy01jTp8d10ER9Siz8VT+OzbSBJy9PqbdCyQAczOx57qR9jDoZLhOqjSu6Cicbp3mYylZyUkGsTJzYClOZN4NVzJ+4qxJGEq03dJrDT4fZcKgdF5Y8OmMvUys9A+mQBe1PnnUNOhstwdhUruF1j6NcjprjL4CADfa7PzpweWWWkGyFIpd00geSjV/53vF9MIT7AMDJEXQPSqob1kjBDpLKLgcT/1eKMWSAnr/ykU8Q6UPyJ0t9mFrzEFz5Riq5h7ymCIFqQ6OIoEabvSy1YLM3sBKhs68XL86puZEJAW7oCgd7fyDnt9Fz9032ODr0JOA9k4aQ3JTat8jBe15VBRtw0bVXPQHX4RcUi4mfYAiXQvMoG2wyNsfYAos7yhQzVicVB3rF+dq0nlJbqtTfNplHCeShrZ/ruXED9WcqKaR7n0gm5Hclj2nxqCT8Pq61IoOrTrlVl+AxrLdLm2U3HNgYTtbQU/AnFPiJpIpU/q4G70s8r6NQxvxl93EYf4IBMMp9m4TO5MVM7m8sSpfFi8mLbQ27VRPJALzlQl6c0eDrnf6cq/mGWaMOpm9kwZKXfVEsaXdeY9W8MzWzMwz1B/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(346002)(366004)(396003)(376002)(54906003)(316002)(110136005)(6486002)(5660300002)(86362001)(8936002)(966005)(2906002)(6506007)(31696002)(2616005)(41300700001)(64756008)(31686004)(4744005)(36756003)(478600001)(91956017)(4326008)(26005)(71200400001)(38070700005)(76116006)(6512007)(122000001)(53546011)(66446008)(186003)(66946007)(66476007)(8676002)(38100700002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YndiZ2M1d3lXaDhnTkI5SmZneHBURmwxRTVhM1QxdDJud1ZxVWtxeEszWTcw?=
 =?utf-8?B?eVZ4YXhneXBhTm1kaHByY3VTMWlSclhVdHRPcjRPZzBkWURFWU9WKzhOTkdK?=
 =?utf-8?B?ZytrRnFmTkhERnQ3dkx2UEN4RjRaSE5mVDlCVHdxYU1oNFRCeUJVQzNEVjh2?=
 =?utf-8?B?d0VpOUxhWDJpNldPYVF4VVJKR0M1dm03OHlSV1l4T0RWUDRFOTJBak5na1Q0?=
 =?utf-8?B?ZGhRMnNSRFZpNVZIdFN2bWFaMmpRU2V3NmZEYjFlWXk5b3N0eHppSWFSV3Zn?=
 =?utf-8?B?bGVjcUcyTDBjc0hWTGFzMWx0aDZ4ODQxSk1Mam04RDhoN3JlaUxjQXVwNnBX?=
 =?utf-8?B?OE4xVC9hV0c0enJKekNXOTRxMlhtMEtqUjhNQU5ZQVpMYWhTUUJGSzJkQ0g3?=
 =?utf-8?B?SUc2L0wvaDJ4WmFjeE40U1NkTFNQeTNycDRYdjRkUnJxUzVUdEQ2YU5RQWEv?=
 =?utf-8?B?anpMa0RkcWFweGRyVjNDeThmeEdFTzduVTJhTUlYTUh2OFJiMFpCYTRGdytW?=
 =?utf-8?B?WUZqN1BuVUYrSWl3VGxjR0g5RUx0SzlZd1BBZzdjL25WUGFqN3pYQm5HaUcr?=
 =?utf-8?B?SjRIU0Y5VUV2cDU5cUNUR3piMllEMlBBK3haajNucGJTdDdqVEN3QmVJK2tz?=
 =?utf-8?B?Q0ZLbVEyZTExcXY0Z01BZGJxSVo1WkhTMG1VSmdPYVZoNjArc1NKM1J1dUxw?=
 =?utf-8?B?cHJpOHp3YzYzS3ZxcmZoZlFFeW14UUw1elM2NGJaMS9lTTBSYi8vV1ZHNDdz?=
 =?utf-8?B?SHc3NVluSEtTdWFKZGcyQktXZC9rVXUrRDdpdWJ0N0Z1OGFac3lNMWwzeHEz?=
 =?utf-8?B?YWwzcEt1MDJCWEdHVi9QcldZK2xsS0dwY1R6SGRnUXlmd3BVeDNsQWVxZldN?=
 =?utf-8?B?akVQZzR6cXVLc2V5OXpBV21hczRPcjFJTzFhOGE0NmdKVjRCS3BaM1lFM2Fw?=
 =?utf-8?B?eHozWDRhUVlWb1lHNWgrQU5vdUV4WHF2QkFMVm9LNVE3VnJCbzZWQ01qRmRD?=
 =?utf-8?B?RHhZWjBlMitkM0ZRZEZ2OEgzakptQlgvZkRhMFpQYVJuRHUzZVIxN3FHMWdj?=
 =?utf-8?B?Mk1UeFVqSCtOTFVPN0Z1NVFEOWtsVHhrMjhxZjduaWdJdnROQ054RWdjUkxw?=
 =?utf-8?B?eGxXOHpIQUE4bFMydmRwcTRlR0UwTUw2RlhJZUJvWWJxQ2dEMGJ5NUlSbTRH?=
 =?utf-8?B?RjcyVlg4czVGZUlwMG5uU25pUUpoSkd0UGQ3aGZvdk8xR25CNWZlcmJyU3oz?=
 =?utf-8?B?RXJsRG5rNDNKbEgveXFneGh6TlFOS2ltZkJyL1Ywa05LOEwvcnc2ZDFlNnhP?=
 =?utf-8?B?NnNZVzl5L1k2RHJUdkpYbmtRMk9PYXpPeDFpTWNGRzN0VjN5eDh4WEVYSHg4?=
 =?utf-8?B?MU16cUx4YWN2amJFUVVsL0d6RmpIZllWdk55MUtxV2dUak9rdTRvWnhKYmJ1?=
 =?utf-8?B?K3AyRm9kOWhDYjNPZGc2bkQzZDFvaGhPeDlnc093enJpc0lXcW1hQklvYTNR?=
 =?utf-8?B?aFY2cHhpak02UVVRYlhmTUVSU0RtUnc5NUIwQmlDb1g2Qkt3cVBpR1IySWU5?=
 =?utf-8?B?YTRBZEt3WWNjS1ZYVE9xeVE0YVZmTGVkeHJtV1lZWUNrRElCdE9ydk5YeFM0?=
 =?utf-8?B?R0VJSmJ4Y3hpbmdGNkxyVXg1S2JzOUlaemo3dUVoNVhTU2lzdmNjMkFWMjdz?=
 =?utf-8?B?bEFycVRpcGUyaTljamhXV3VGQTRRVm9BZnJQakhMMFEwUXVLTEpiNTMyVmtu?=
 =?utf-8?B?dFNod0NGS1BLSnZ3TjJORlpPaHR5N1hEQ2IwSU0vdnBjZWJxTGhRdHRUcFhI?=
 =?utf-8?B?aGNoTThLdUlFbjJONFBrbTI2SWFleGFHc3JJQ1FiajNWOFdNRlVBZXhwKzIw?=
 =?utf-8?B?Snh4UExEZ3FZbXQyYU50OUhYc2c5VlF3R2tJUkVPNjdyaDU3SEcrRUF3emxu?=
 =?utf-8?B?VkNYeFRqdW1ZcnBuVFdqTXEyZnlQQ2ZPSXZNUkNrbVFaRWJNTFZvWkNacUM2?=
 =?utf-8?B?YTBnaU5lZFduVFp6ak5aK0x0bGlqRGE5QnNrenVLblJKNjc0OXFZQU50cVU2?=
 =?utf-8?B?TmV0S0lvcWlUaEZmUnhqMXVCblJyMUV5aFp2bEtSd2JYVmlZdys3Ym52aUV2?=
 =?utf-8?B?aERtM2RqMkdIeFA2RzE1VHptcW5keTczTWtNclNpb0lhbmtUeEdXL1h6RkdQ?=
 =?utf-8?B?OVE9PQ==?=
Content-ID: <8F26EE0B412A5342B8EA5254B1F290A5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa43a3cb-d0bb-4056-be64-08da69595c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 07:36:14.7623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EbhNrltMR+T+cbDiW/GSBi/R+Q54dY+JktauiFumnU27TJpU40BxlAlml7cssYDU9WWhFy1FYGzrUICgvAuOlExwUJS4A/fW3owq6RrKCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_003632_118518_ED1BF9D8 
X-CRM114-Status: GOOD (  10.52  )
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

On 7/19/22 09:29, Conor Dooley - M52691 wrote:
> On 19/07/2022 05:34, Tudor Ambarus wrote:
>> From: Tudor Ambarus <tudor.ambarus@gmail.com>

oh, and I used gmail here :)

>>
>> On Mon, 18 Jul 2022 20:42:43 +0530, Pratyush Yadav wrote:
>>> Use the kernel.org email I have for reviewing patches.
>>>
>>>
>>
>> Applied to spi-nor/next, thanks!
>>
>> [1/1] MAINTAINERS: Use my kernel.org email
>>        https://git.kernel.org/mtd/c/7de3074b218f
>>
> 
> Hey Tudor,
> Just FYI that link does not resolve to an object.
> Forget to push?

yep, let me amend this. Thanks for the heads up!

> Thanks,
> Conor.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
