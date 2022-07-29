Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65EFC00144
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 06:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jAMI/jYoLR2HWHTQBHZ+pUCBPdtS21TzZPqRqyWeITY=; b=pcqgWzRXXLrNLW
	jPTvyaLOQlDAdDlhVyj02TTbzEK/in6sFjCs4pSYxCpoBIcm2NhKyGf9iXBoqBFgQY7I0VorXjfYq
	LNCdqWbVfCuyvu5QvPW6xOiEr8mDsyM1tN24tdWnCQw5aBgJPjJCYTPCubeeyQ1elpaDPsEZWZMS1
	NcJOq/W6UeA7Uu3khVkdEHaljjvgflkeWdQE1FUjA6lJry4OnNg4fbpfwqhQ3pvsXxs+OY6iFHxm4
	AIigdAm9677MfJpeF89NEUMYLO39pEpSFL9x+A2b9hSlip8xLVK17vxoq7udzf+mT9JwT6vPZ0YsS
	XeYaiL0vWibtcFxOpMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJjA-002AWp-KX; Fri, 29 Jul 2022 06:44:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJj6-002AV9-T4
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 06:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659077040; x=1690613040;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=DbrFCHXH6aK3Fxw/q+nLUz1NLGX/sG8CBiol8e1rDA8=;
  b=oFUt7Y1fcypqAuLelhL7NCXbQ6QlLvpYOH47yZOXSbxBBowQj1YMjELO
   QixV+DZf2hpGn2VbHjF9Z5Rg9zzG3wKP7JV2pQ/Seg6TVf7mqlwj8yinb
   cYmCuRyJYLl8GFOX21SMT8SlvEJcAFKRHuUSVwwp9izjAneoeTBdnI3ll
   5WGTYFdmuNgga1gLalS5SXfGTlgCtHhHsNqBuPVaqM73xGz1bkp7IATbv
   3ZJ8zqTypiSQb9+TyaVrYIKpyXpVUKSNqlgf5PKQlS79i8yL0redPqq9v
   bcvPh16BqA9XOmP+MLycjEKXBXylTh5z9HTvSfEBPzG8Wn3MrdlPMGi+/
   w==;
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="106655305"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2022 23:43:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 28 Jul 2022 23:43:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 28 Jul 2022 23:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg3T5Pwufkrq5Ynp+e83el1bWu/i5kSjEdKzuhxL3E+CAaKz0RAnk+3qiNzILgi/22ea9SLZ9rkb+KEmwCtPSajSD9IFiuDSEhHB4ujbU3ohRme04abRSVY3tnllGEfem75GI8Y/5QIaEV6LqjrjjKzeKJqCHR1b3dL8iGKSuee1jxB+LOP8b2AODrMRfBU8DAUEKTppaT3Sacf079JHR/+cJVIYmfusT5flaKPVIxgTOXdhAoWrVXuQpMmmATAaQ1qoN2n1YvOMtfsqh885aJ4OA2KQ3dSPdtIKvwI69/nGklP0SKMxPs5DEKz0bZnQly6SvD3/hsD4Lriu4UpRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbrFCHXH6aK3Fxw/q+nLUz1NLGX/sG8CBiol8e1rDA8=;
 b=F8BwJYYY+Tf4yJUWeaqoBODynnZi7PNP1ZdAR94BRjLxrK4Sjajaexcfe+nFogyIKLPqlEMWEsmtWQcV0o0fDdvKE+kFp9TZJbHEMZ3MDh2/EeyB5v4j3zAr2c3ASdmL9MOJpVMX3y/8N/W9mdVBcs5jzOQycq+q4gr5N/GcKp0c+5UIMNELtNIR2BGoXYwxlnNYYqUL3jUuDIYoYOjWi1F/m5yGZ7dVeU5FdudOei4UDW5pFkypr1wsGGrez0jaVqwjzXi2tW96Zkhj1+fwVIsP0Hf/g2Ga22jYBfln7QTY3K5ExYNRQVKLKEIYuuahzCgQzY7YtqL37cHoDXQ/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbrFCHXH6aK3Fxw/q+nLUz1NLGX/sG8CBiol8e1rDA8=;
 b=fw+KdlG/GWV2HHKXZcitwyFKzgDA0tMHQ30fLx5tyjA7ueRGp0S0ph95T4ilipnjmEiIeh+lLh+EukLMJcAfXc1Yzh2oAA7FS8RN2dqvP+sTAZwKJCaDYEcpwf2+bKamvQLRuZdIFioprWrIP3z6weFuKf3AM9abi86JO+bDUy4=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY4PR11MB1718.namprd11.prod.outlook.com (2603:10b6:903:2c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Fri, 29 Jul 2022 06:43:50 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Fri, 29 Jul 2022
 06:43:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.20
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.20
Thread-Index: AQHYoxaPRBQPxxDqo0KFYj7labUcFA==
Date: Fri, 29 Jul 2022 06:43:50 +0000
Message-ID: <78f86200-4c07-651c-d8b1-7e7c8a69fe7c@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39f96f81-d166-49f4-f410-08da712db24a
x-ms-traffictypediagnostic: CY4PR11MB1718:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tj9UPMwj+yO9tPlcVPOfOF5NmQ9FcAH742/x5iR9bIAoge5VkKwsBeuw9jTOJw8YrTs5dI9i94uoh/nIj5lcl0twsRdZ4ar8NdG7OOOLH3rBgJa3GhUx47qRtcIWfM2TnL1lOV7cyH6KNHMzZY0a3E6TwJwgy4Y2mwOkq1wdAKE7CFiI2IOrbxLRQnfEir6kTVzE2CHxl3nnhqcEZqt9h/dg024r3/SNVZ8T7ylST/KDRdTEnLT6cJiirvGau9ZkbcA0p5mAkjq3x4B3PFMGuK69hU9dF4ESHmFl34CkV10vG2t1Kw5Mg6JcAO14FmULlD7QyqNoQ+ld3j8XTNU90FNx6tea6y1K5z6zo3ZhSbUh/vEwSRO6Os4+9NVWMzhW76s8nj0WY7HIlRYIaGeISC2D2vT5w7gVhEAlIf+mm8+n4BbYIBQ1yN2yz7I+EsbSUu7ZqZMU8uTus6pEEqYfCYjNTv50uhv1kCGbJV7LLZa1pnL+a1F0BveAD7D6m71DhHnTwixY5WsLM6rhBJ1vbN9U3wIgaItmjR1mUfzWAUBDVDwG3hGOaZzn7ULa8SLfs18YMWIrl/KgDmxxgRudYEBfzP0khimW/l6b9sF8QLnj+CO1+Nx6PFIhLHCESqHgwWkTwY1/oq+pndKQm8QvssY+Th5q6TtY6eIKhiPYrxrSz2TaQifMnhGYD30gGmBWVpDQWzOuJiEfWE/idS+Mr9Q9wygYTgBOy6Wm4bopBj0GLKTfcJO/MJcklUwpynkEfGoTwvYYDdH6Buj4rn8XGZkCGlmkqsea6K0SI21RcO1zmyU674fRa1uNXPFrXqU0AQblKIdTG3ihS9avVTzZ989aaMjkBkWlF6IJ/MfVuSm/l/m45Fw9byf0m2uZhV4j
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(346002)(396003)(376002)(39860400002)(110136005)(4326008)(54906003)(31696002)(6512007)(76116006)(66476007)(8676002)(38100700002)(66556008)(6486002)(26005)(6506007)(8936002)(86362001)(316002)(64756008)(41300700001)(478600001)(71200400001)(91956017)(31686004)(5660300002)(38070700005)(122000001)(186003)(36756003)(66946007)(2616005)(83380400001)(66446008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVorc0VlMTlwQmVCUmdSc0hGZ0dyM1NENXJWY1ZJekRNQmJQb1FuaWJpR1ZR?=
 =?utf-8?B?amN3d3dBQ25BVjlYN2dlVk1jakdtT2VXTEJJRlhLZ1VjZ093K0JyQkt1MEI1?=
 =?utf-8?B?OENCQWtad001WmlwS0pROHdSYkJrN2NNYlNCSFNVeHc4MkF5Sm9oMDFFRzNi?=
 =?utf-8?B?TzVzdjJwOE1mQmdHbjBtYlFLSGtPYzBIZGtrV21QY0M2aFVBVDUyMEZFSlUx?=
 =?utf-8?B?VURJMTJyZXRZTHlWWktNaGZRejNBRCtzU0ptcjRNVGppNjN5NU9HOUI5VTRu?=
 =?utf-8?B?UTdjT1RJZEd6L1RtTkNkMlRHTWpDbFJ4UGN1K3BNcUlrenU4ZHBWUStWOHFD?=
 =?utf-8?B?cHl1VTRTM1MyQXpRUHRJdGc0K2lUeVFBNE1pNjN1UnBTb3ZsVFB1YThJZVhS?=
 =?utf-8?B?RHo0WXpYYTJleHo4bHVNQitkdDhMcU1SdE5hMVh0RzVqU1dGWmwrdHBrSXhV?=
 =?utf-8?B?bTRJNFBlMkFJOGVRWHBTZGF3MlZKdHlLVnc0MkxmRzR3SkxkNzNlbXJHMlJI?=
 =?utf-8?B?MTdkMGxwRWN0SVdJQmZjbkpteTBzUVI3SG15SGxzSHh3bnE3aWc1NUt2ZzN1?=
 =?utf-8?B?NXJUUkd6bzBJamZRNEdZQU1DeXNwWm92aVJOUldVS1o2Z0xvTVVVSmk3alRh?=
 =?utf-8?B?QUkxNWgwUkFuMVFwOFhEaml4Tk1oeWRpTkx4R01OKzdpTFpJYUoyblpKaUgv?=
 =?utf-8?B?NUQ4QUVMdXFvTkZ3RWhDQXlzOGRuRE9DaSsyMnYyS29yVWJYdnpSVFB4Zkk4?=
 =?utf-8?B?V1g0djJTRkhPeUhsYmE3NUptUWxFb2oyTXRTQ0JOb2xjcFQ3VlVKR0JYTlRa?=
 =?utf-8?B?WVFZNzhpYUdtWkRwdjVsOGlVVTJlVUVnTmwzMU1IQzdMY3R1RnU2andEUE1p?=
 =?utf-8?B?K1MwTE8raU9MZWZWZnB5Sm1UVmJNRjBYTm1uNFVIaFR1M3hOaFJobjJpbXln?=
 =?utf-8?B?eUpmOE9Kalc3bHFSR2hXNEU2YXZtTForOFRMdlY1eGUxcE1oVVlTSVFxK0M0?=
 =?utf-8?B?TmZwNTFlY21QMGkyYUQzN0pGTmhpdXVvUHJOb2MrZ3RFUEkyLzVGSTRjL3J6?=
 =?utf-8?B?blBTUTZOazhWY0UrM2lzOG0xS0ZyR1B6SUMwSXhnTUtZM1lBSURReFdNbHZX?=
 =?utf-8?B?YVhTODlrbmlZRU02aVA4bDlBdmJQWStrdnJha25OTUF6b0dXZ1J1RkNoZWV6?=
 =?utf-8?B?Y3RPL0lqa05tRDRDS1hHdnJLMVB3QUhnU3Q2SlgwUGJPWDB5cHZ3N1NPMEov?=
 =?utf-8?B?WVZPZ3lxSEIzLzl4L1JraGpIQ0RodXZCL0d3TlRGVStxT3ZWa0ZxRXNicmU2?=
 =?utf-8?B?TEZLVDVGdU1XY2NnVUNSNlRGUnZRcTBTR1U1RkVYdUJqeWxSYWZnYytvZld1?=
 =?utf-8?B?aXdnYWt2Z2hkVXF2SUJYK2VMK1RNNFppL1p3RHBpdEhQakViOGVzMVhuL3lz?=
 =?utf-8?B?RE52a1p3ZUxWQ2N6MzVScis1bmxTaFk1c0JUN3FMdmNDK2NDYTJVVzllTnBE?=
 =?utf-8?B?UkNVZFNwYkk0OEpWNm0zdDhsN1E2dzZrUENsL1RGZ2dlbGY4eGRPM0E3c3RD?=
 =?utf-8?B?Z0pTS1VmUXBwM1k4RlM3cmo1dW5pUGlXaGc1WGp4Uzc0ZHorV0FSVzZxSXJN?=
 =?utf-8?B?RDNoVi81aWlZWjQ2ZUxxWm85QXVWQ1lweWhOOEtuMTJ3dGp3YW9rL2RmM3Fh?=
 =?utf-8?B?MW40RWovM2ZpT1p1Wkg5UTlRdWxlVjFHRG1iVndNZ3loVkJPd3RwZkRwQldj?=
 =?utf-8?B?ZGw0YXBrUytoSnk0djlWNTJKbVBPbVNlZ2s2U0I1UnQ5LzZNeXZ3Syt1MHdG?=
 =?utf-8?B?a2xMSVoxRmc1Z05NanBFWWY2cnlHZ0ZkNW1sM2dZMjQrdkdOSE9yQjVwakRB?=
 =?utf-8?B?K0dYRS96Yk1yR1VrRU8vUXhBMEcyM0psMUFuYXYwNVkxUDhqeVVJNklsMngr?=
 =?utf-8?B?eTdmclAwa2liTnhXRHJaL2ZFM2hVYWpFcFNyeWhLOFYyYXBVTXVlWHpNMkNa?=
 =?utf-8?B?OHRyRmkzSWhVekQ1YjFzQjBGUllKOFAwaHRmSXZ1ejF2YjlOYjQwMVI1dUw0?=
 =?utf-8?B?dFVSYzcyQ2NUaWU1b2JOZjVQM2MwVGhFVmJ0TWxsKzRHc1U0WEptTUpvWHMr?=
 =?utf-8?B?cVg3Q01KUEw2M2hpVnFma0RkU1Zld3REcXRHK0Z6TDhNckZ4czFRVWhzMFBZ?=
 =?utf-8?B?ZlE9PQ==?=
Content-ID: <786A279286027B428370C6F9F2BE8229@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f96f81-d166-49f4-f410-08da712db24a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 06:43:50.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlIIgVAaowfPhSAKaus93WTgoP9hch1etvbVsDQSoDosTZYi/ndYYLbl3j94voURbvVBxXcispxD1z630oDamIWME1m6WPcQahc/4PvprGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_234401_316010_B4DCE577 
X-CRM114-Status: GOOD (  15.31  )
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

Hi,

This is the SPI NOR PR for 5.20. If it's too late in the release cycle
to accept these, I'll queue them for 5.21, just let me know.

Cheers,
ta

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.20

for you to fetch changes up to f8cd9f632f4415b1e8838bdca8ab42cfb37a6584:

  mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}() (2022-07-28 05:34:23 +0300)

----------------------------------------------------------------
SPI NOR core changes:
- move SECT_4K_PMC flag out of the core as it's a vendor specific flag
- s/addr_width/addr_nbytes: address width means the number of IO lines
  used for the address, whereas in the code it is used as the number of
  address bytes.
- do not change nor->addr_nbytes at SFDP parsing time. At the SFDP parsing
  time we should not change members of struct spi_nor, but instead fill
  members of struct spi_nor_flash_parameters which could later on be used
  by the callers.
- track flash's internal address mode so that we can use 4B opcodes
  together with opcodes that don't have a 4B opcode correspondent.

SPI NOR manufacturer drivers changes:
- esmt: Rename "f25l32qa" flash name to "f25l32qa-2s".
- micron-st: Skip FSR reading if SPI controller does not support it to
  allow flashes that support FSR to work even when attached to such SPI
  controllers.
- spansion: Add s25hl-t/s25hs-t IDs and fixups.

----------------------------------------------------------------
Michael Walle (1):
      mtd: spi-nor: move SECT_4K_PMC special handling

Mika Westerberg (1):
      mtd: spi-nor: micron-st: Skip FSR reading if SPI controller does not support it

Patrice Chotard (1):
      mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()

Pratyush Yadav (1):
      MAINTAINERS: Use my kernel.org email

Sungbo Eo (1):
      mtd: spi-nor: esmt: Use correct name of f25l32qa

Takahiro Kuwano (3):
      mtd: spi-nor: core: Return error code from set_4byte_addr_mode()
      mtd: spi-nor: spansion: Add local function to discover page size
      mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups

Tudor Ambarus (4):
      mtd: spi-nor: s/addr_width/addr_nbytes
      mtd: spi-nor: core: Shrink the storage size of the flash_info's addr_nbytes
      mtd: spi-nor: Do not change nor->addr_nbytes at SFDP parsing time
      mtd: spi-nor: core: Track flash's internal address mode

 MAINTAINERS                                 |   2 +-
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  |   2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c |   8 +++----
 drivers/mtd/spi-nor/core.c                  |  70 ++++++++++++++++++++++++++++--------------------------------
 drivers/mtd/spi-nor/core.h                  |  21 +++++++++++-------
 drivers/mtd/spi-nor/debugfs.c               |   2 +-
 drivers/mtd/spi-nor/esmt.c                  |   2 +-
 drivers/mtd/spi-nor/issi.c                  |  31 +++++++++++++++++++++------
 drivers/mtd/spi-nor/micron-st.c             |  12 +++++++++--
 drivers/mtd/spi-nor/otp.c                   |  12 +++++------
 drivers/mtd/spi-nor/sfdp.c                  |  34 ++++++++++++++++--------------
 drivers/mtd/spi-nor/spansion.c              | 185 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
 drivers/mtd/spi-nor/xilinx.c                |   2 +-
 include/linux/mtd/spi-nor.h                 |   4 ++--
 14 files changed, 278 insertions(+), 109 deletions(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
