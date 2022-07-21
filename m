Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869F6C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmH3JdR4nQZ1yfHDAaLr/0OyyJqxU7HUoVb23GIktv0=; b=l9ey1S2M6ReZUG
	5gZQmEnOG5fRLmF8cxTJPgE16GjHZuNZZjChUr4CZSCn2PK81Q3YqjlEi1ebUpkaBn39c1Whx1SUC
	r6RRGsuvDuRw5G/fZeFLfyA19jPbRwEmeEbgWQWuzRFj6Pjugxenh7Z7soYWbxxZmnQBfs5cPNEHi
	Vxf+LaoTzbnT0N1lVKDkteUq+SR4YjjJWZCD2qz0XfkH3wL/sHTVbDjiPvqRU//tUxmOySS/X1T9M
	uKBg4zQYmy+EDTExA0ucMnPW2DUMakgthoKyGZKOuGUpC4wFlbcCeSVwsxV5etP68V2jZrV5jFYku
	PsPNHEDBsqAQM6/SBRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERYB-002VOS-SV; Thu, 21 Jul 2022 08:28:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERY8-002VLl-K1; Thu, 21 Jul 2022 08:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658392129; x=1689928129;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wBDwWYFM/a6/bPa53Ab7OHjrihpEXqFD3OZgtXSEYOM=;
  b=OrerHr0cMcXcVDcbkPTTxHKUkygyQ9oRsXEq6UuFz7hmLgRQe19E0DBi
   NVP6dgIngb0wCC/2wToO6QhKMOF6TCXIPA4mpS4ZIZ89BEuTZ90YDU4/R
   2e056YWpaxTz5m+lKgu2r/tZKAiLNIgAjoxk5/ak0e9tTyfbLyliyE7WQ
   uSo/BKXIYle4a1jd8c9leqOgGlIrAHnondEbSqlro57VZX4PAsj7B+k2L
   3uco52B8aB0/N1hEpIQf0FdgAyUNNciDbw4HQrk6YqJEllySi9kgvj4TX
   2nJMm8o+ze8FVLTh0f/OWhoQQfHB2WiYhOHzZqhb4F+EM7PBNWjnItKh3
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="165756315"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 01:28:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 01:28:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 01:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLQuCMCPHU4+6Ps/4AVwapTt9wXYsZs3qwwTDNYD30olsoPBlMhDDd23Bp1ERTVvmpGmrhR/HbWQeMNpkL5DMWNrJM8fo4rlnFBg0uozBxRRVFeYG05x7gid4pJBbeDi852HkUfsaBkR/eKbjsFrTbCAjwAR9R+3ygj9MTDQtAtZJvpjafG7dZK2pt9L6DE/RyhrZfe5qhYheCpvnPM+k31H/cf3g2LAqqesGrTPoZL4rpImwFJRnhLIUkivQ2IakyMomQFuf0Z8lGvj76H8mRo+GvBYr1oXTdtfWuItVFQ4TWSwINTvbZCb4gAiI5YAzll+sVAcVxXJWAt68zJvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBDwWYFM/a6/bPa53Ab7OHjrihpEXqFD3OZgtXSEYOM=;
 b=G5k10jbnzxUDbpMGjOT7MBwT7gkas7rwLAq8pidNaLPD3g3L41FYFz/ABAWVTYUpp4iJL/eUpAke4W0ZzklR31TcyNvzqyfI7eeDHqN1Q+tkj1cs4sHe1FYQh4WSl8iW//9NUTgafKvfkM1UmBuUxhGdg6S2/xIYfTeaYv1HPsAGeDjuZiVcq3nU8JFK5irCiHuNJ+5Xl0IVD/eD1UDgis2fqkzZDupeOxz8woavV1w5iLNzHxbQa67PdN6Xt5aT322ue2iIowhH79opmsYLodMn6qi94aHYQqbW3RUDV6oqYM6irbS2W3oxK0+paYPsIo4GagtqfO9lSHq7syip3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBDwWYFM/a6/bPa53Ab7OHjrihpEXqFD3OZgtXSEYOM=;
 b=CSgTlGVkfmfXm+qta+RiDVDH0xmMRuH7xzf80pxEgpUvfXymuWEMOp23eZI0njinRIc8gDyL+7J5BEKyWfcY0iSdqQo9WuVrDwXaoRtDj8ayW/TR9eXc7n5VLxPUEYj5DQ/jrOEaVF96RSN62vQNx2ZPXSZv6vpeDwajEvN0OiQ=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 21 Jul 2022 08:28:43 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 08:28:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <biju.das.jz@bp.renesas.com>, <p.yadav@ti.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <michael@walle.cc>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <Claudiu.Beznea@microchip.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<geert+renesas@glider.be>, <Chris.Paterson2@renesas.com>,
	<biju.das@bp.renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Index: AQHYnNvhSu/G76y6X0CbqZjid5ETZA==
Date: Thu, 21 Jul 2022 08:28:43 +0000
Message-ID: <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ac6e998-210a-43d7-4078-08da6af305c3
x-ms-traffictypediagnostic: MW3PR11MB4732:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DISzeVsbyuktHHAmTQMWWvvvH1v92qr83tJ+T7KHWUr6f7wslOuVGz1UwQTbiMqrgpoVnBsjJqFEIoi4qxYe1rV1vWcp0YRWkLIGsGDpQ9qkHI3x5lu7Z0arHwyGTkNHInypLK9FlrnQ4WL9ojgzAIb0e/bIP1l9cA+J+GQQafZk1v3/pbE6IFbG/A1+U/FL28rFXK9lFlcdcevNux/6PmxnU5GCFLIg71W3Bq8rjYrlH9jn1sG0mEcnGX2/nCDcPZS0o+pgUqrZo7pvNONUNFl7lk/rkuX+qBdOwTOxzWVdT14b71rJXNkitouD1I8uQhuLrEJ35A6tuX2AZNRODHH8WgUIXD+Ul0CIMfAZSE0K53lJ8J0dRP/AaI+K8MMGbd+jQb/XLKI36VQGtQDUimrMOGH2o5v5bY+YOK9TH9Io5yV+Z7tGZSY3h3c7Ml3EnEC5qN4m4BCW6cX7NURiz5er+DkxdItjBy9huS8Oz/23nRt3TMAxFqbeFrY65SzTAcKYi0dh/3vO54JgVI7EpmmG8OMadApLQmSUvdtKaUNxyeS6LRp2n7orlPG9SPLQZBCrKM0oKndornb+ZZYA2AXKkwBe7mmhIBElRv9ehDBEak2SzNkVNlUj0Isy4Y0+ze+d+gN3OZajTAFDk4d08O3GS5w7W+Zr3vXSGEiRpeCeFUN7KjZzZ34SLI0/aMzUCWaoVfhEtHlJou9ge71UAiST+zjj4LH3NqRDT0OtZqvy1nzf2e+oCsD+Pb/qpNqOQSglVnh8I2wqB3vR9vdnSNjyjMOFLSXiGwDIBuDnoUyujb9b9oGsqJGfX4eYY+6f3blAhGWLpaKVXgpZq2gmKDakZEiyAcqxyXWItHimDTKTP/z2SllPc2QYHGPoNzaA3wxwXXKh+doltD1ju+/s4PCvltGXTZruVHyUyQzmHsXrdYFwtlX1SPNPb0tKiUn9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(136003)(376002)(186003)(53546011)(2906002)(26005)(64756008)(4326008)(6506007)(2616005)(6512007)(38100700002)(31696002)(86362001)(83380400001)(38070700005)(8676002)(6486002)(122000001)(316002)(41300700001)(966005)(110136005)(66946007)(54906003)(76116006)(478600001)(5660300002)(91956017)(7416002)(31686004)(71200400001)(66556008)(8936002)(66446008)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGRyRUxibUFpWWx3Wlg4MjlZL09hRENZWTVsVjVjNGt0a3dmd0tzR0ZrM3pG?=
 =?utf-8?B?L1NpS2psYWFaNWlyUHFSaU9YaDVZTzJKMm55bkNJL0h2cFVFT0N4V29LdmlP?=
 =?utf-8?B?U0llQmZhSU11SUhmOHF0MXRIcU1pSkU4TDlCU1dwQU03NCtBUzY4U3ZNWE4v?=
 =?utf-8?B?QzhuQmRjY3pOUDZJc3lRZnI1bVhqVW9OQUtGRmpnT21QcHpRZTlMK3lzZ01Q?=
 =?utf-8?B?YzVlRElOR0kwTk1CaWZ3OStMTjJEbE9QK29iWFI0RVZvc1dRYkRvMExVbEJZ?=
 =?utf-8?B?SnNIQTdPd1cyZjJJR3h3bXhJaW5JSnBXeE9xYXJ5WFRSNG5iRUpPWk5qTDN5?=
 =?utf-8?B?bSs5VjN0QjZuTHpOSW5JWmphL1A1SUJ3T29GZ0YrcEZ4RHZVeENYdkZ2NmxW?=
 =?utf-8?B?cWhQYzJVNloyNzVsSVExdzZCNkl2TGVmd2M1YXkwMVc1RGtTMGdvOG9TZjRD?=
 =?utf-8?B?bFhqcDFUd1dyMW5Gb3NYb0oraVFkdGVDRkRhUUxQdUViSjRqb2dTNE5OUWNv?=
 =?utf-8?B?TFJmSmQzV0duNVBtOFA2cG1mTE5DMkJIRnl4UURhQ1o5VTZ4djJXeFJ5NCtr?=
 =?utf-8?B?Qys3QnpCNXlac3NUcFFRMVRLZmZlbFFLNG5tckZOYzA3M1dlUTRaWXhUKzhq?=
 =?utf-8?B?NDU5UzhiSTZQdTYzYkZxb2F4bnhib0l2L2dNN29kYTliT1NlRGdLZElKN1FC?=
 =?utf-8?B?V1JaSnF2WncrVWRiWjkvUDlwQVRLRVd4TkJaVHlZR0xJL0wxaU5LeXUvenhw?=
 =?utf-8?B?Mmd2NzEzeXN6dktjK1dvSVV3czg2WHRJUnNDejZjQTk5VUdhUk5rNGlwUmlB?=
 =?utf-8?B?VGJPNUYvcFVQTzBxbXJ1SHVzZUNrREJpSnQyNzl3U1lOOTI4UTY1YmdMejMx?=
 =?utf-8?B?Qk5hVnNaWVpaN09Ga0Y3bTlUZ0I4YU1EMFRlS2FHSjY3YmF6dnlJSTdwS3Ji?=
 =?utf-8?B?a2x0OURsQ012akhrcTlzYmJZTWM5bU1Ic25XUDNOTlFuZjZMOGdkK3NQam95?=
 =?utf-8?B?V1FyY0I5d0lTOE9KWDREcXFBMndvQjFKeEFVZXlTTkxjQ1pDVjJlaUVUdGdF?=
 =?utf-8?B?Y29ETThvdG1yZ3NIZENLVTRLenNCUnJEenk3b3R3U1V0UlFFYzJzOEFaYmZR?=
 =?utf-8?B?bFN3YnY0cWJTUFUrNnEzdnFIMVhtTXI2ZmZMTzBDNFpxNTJ1VDMwbHAxSC9M?=
 =?utf-8?B?UDdKUnhKZzRqTkRzRHBPakNHU1l3b2dpa1ljNFlKaG1WUmxVSHBFVjJxeERu?=
 =?utf-8?B?VVdYcnVDc0RqRXAxMVl2TlFMMFlmU3cvWE94Ty82Tk4yL01XWnlnbCtNU1Vy?=
 =?utf-8?B?Vy9kazluN1VBemZQNStadzM1c3p6ODlWeHJTTjhYZ0c1M0lrVEoxWTllS0x6?=
 =?utf-8?B?S2xGVFlwWGdRWDU2ZGhpZThGNmQvK3ppT1QvWDc3WEJsQ3lsL1ZCUTNyTWln?=
 =?utf-8?B?OWJibXhLclNPaG5UUWFTVDhWcWhVL0NvL1FZV1l3bEVOTDEzRnZMaDJpOG96?=
 =?utf-8?B?VjFHR0pBVXVLRzk4ZVUwOXJHemg1QXhzR0pFQmczSDA4NDU3SmdrdnRaR0Js?=
 =?utf-8?B?TTlmeGpuUk9LbnV4S1hkUWlMUmxta1Z4b1Q4MGtlY1FIZTZ1ZUVicCttTU1N?=
 =?utf-8?B?QjBXUzlPTHBlQzZzbnE3dERoNlpua3IweHdob2N3eEswRjFMSFpYTGpZRWp1?=
 =?utf-8?B?VHliZmljanVGeWJtN2pSTXBpVkVMMUozYXpUVWJUQjU1cTRiMVY3NVJGdlQy?=
 =?utf-8?B?TGxzVVZXTjlOMUF4UzRCMVZpblpDaEpSUURPR3JjY1I1NHRsN2ZoZENkWHRq?=
 =?utf-8?B?Q0xqUEkrU09hNmJ4YWxXY2RtUlBabzJkZGdMb2IwaWFwS1FFcHN5b3JicjJj?=
 =?utf-8?B?OGNqUU1maVEwNitaK2dUTlFFZTI2ZTV1WVFndXlRczdNOVh2MXpUOGFnSFg0?=
 =?utf-8?B?NG9xSWxTMWVIcFlCUUJ1d3VSdnhoQkU3N0kyNnlaSkZLZnRHdTNHc3pLNTFp?=
 =?utf-8?B?NklaMnltNkI2ZmtiVk9QYzBMc00wREtLSXUrV2dULzZkZFJsQkdjTEdZNFh2?=
 =?utf-8?B?Sm9DUnE5OFJrMEZvcTk1MDZvYUZ5RXpFY1lpZ05qS1l1Nm5PSVJZT1B1UW8w?=
 =?utf-8?B?YXJzN3pmazdnaXRBZUFkd2Q0MFJrL1RCNCswVXdnZ0VHVVZ2eXlybVZrWmlr?=
 =?utf-8?B?eUE9PQ==?=
Content-ID: <AF60A1A85B166B48AA6B6A1C15E95E0F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac6e998-210a-43d7-4078-08da6af305c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:28:43.2469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQ6AAHM2TQG0WZj5DAJpNZCTtzRmM0XiJARzPX6pkTi6rRTp4zmtj64286oMXBWPsxzKrWjUQKwUtqAPGGSpVhs8RF3VsvSysaXpGuPD6/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_012848_768100_4189F41A 
X-CRM114-Status: GOOD (  21.16  )
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

On 7/15/22 13:57, Biju Das wrote:

Hi, Biju!

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for Renesas AT25QL128A serial nor flash.
> Details of flash chip can be found here [1]
> 
> [1] https://www.dialog-semiconductor.com/sites/default/files/2022-04/DS-AT25QL128A-129F-022022.pdf
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> $ xxd -p sfdp
> 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> ffffffffffffffff501650190000ffff
> 
> $ md5sum /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> 23e3ec56b5b8f986d0488ba4727239dd  /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> $ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> 1f4218
> $ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
> at25ql128a
> $ cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> atmel
> v2->v1:
>  * Added flash definitions into Atmel table.
> RFC->v1:
>  * Moved the flash definitions to atmel.c
>  * Remove macro related to locking as it is untested.
>  * Replaced INFO macro with SNOR_ID3
> 
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501185512.51158-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/mtd/spi-nor/atmel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 656dd80a0be7..80c24d138b27 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -186,6 +186,7 @@ static const struct flash_info atmel_nor_parts[] = {
>                 .fixups = &atmel_nor_global_protection_fixups },
>         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +       { "at25ql128a", SNOR_ID3(0x1f4218) },

As the flash is defined now, all its characteristics can be discovered by
parsing SFDP. So instead of adding a new flash_info entry in the already
big array that we have, I would like us to focus more on a generic flash
driver which acts as a backup when the flash is not found in the flash_info
array. We can discover the flash particularities by parsing SFDP and we can
probe the flash based on that. Michael has already suggested this, would you
please help review it?

https://lore.kernel.org/lkml/20220513133520.3945820-1-michael@walle.cc/
 
>         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
>                 NO_SFDP_FLAGS(SECT_4K) },
>         { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
