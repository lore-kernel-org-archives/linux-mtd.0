Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9C0C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlFKClCbmIL0/e2m/5XQlNmNGNADOTAD+n5CKx1QeAk=; b=dprkrk01OHp881
	hKHINxuOKPwc8a6DqM3m5cdzKNg9xKFMrUjsf4Ooq59/BCKVDnnhw9jw6tMJLuOfgKbT5sdaIsoWE
	bbAeLo4lizGNdrP2o7vSIC71c1CkqXf/OCrxSj2ACiNx3J77Va04+mRrBKz1Xhj0OxF5YlsoLthC0
	cmuX75AZWR6LguVb6pqi8WT6IhpqA/q7uYQVXN0Ys+UJwPe/0wcLBlnzzYK2XJqhoHnTkK8xlFR+t
	PAGcwfvfiZF9NL6oSLNBaFs42GEtgGlq3aGwcTLwXy7MQJwXY7JKk3CYcLlBAJ3pOd3idDWeVjfeA
	wJk4MpPjkRRI+q6hBIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIhN-00HQOP-Ty; Thu, 06 Oct 2022 04:41:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIhK-00HQMV-2W
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 04:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665031287; x=1696567287;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l8nzlLOArWBZgs+R+pcvuxt0x1p3yB5ppvzRYbGbXzw=;
  b=TVEaUGUlZBfTUHB5BpFpTmY2sup3fA63uNX/XML4VLxUfhOzHCU3ruY2
   dN4rRKupZnPsD9fHsOXpZ7vI2+0XbJzxF3rOUjP25Xkjqf5hjWhShQx63
   tFtTqiWA9ZoysFBU2+cx+WRP1YoH70ISCdNhuF7W0xnDtdD1XLfUtl47f
   JleMhSjZR5qcSdwE9Ikuai7S5B+CUhjq8trQyHr/EmCHgiAFviGhNrHed
   UVsm1Hz9E/YNamPLZVp1jpCnd9nV5oMCeaD/qlYaxWo1vbvKGtTTqxizs
   aIVeM/1mDVPr4UXyJ6KMitDV93RX0SXxy/M8S6GVOeB56EgpAA922TPWy
   g==;
X-IronPort-AV: E=Sophos;i="5.95,162,1661842800"; 
   d="scan'208";a="177281813"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2022 21:41:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 5 Oct 2022 21:41:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 5 Oct 2022 21:41:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZY+ywDvyam9TkowzPJTMRwmIQZzQuZ4xOamEp2GtthWfBZ5a5ikV4wvEveONaVi9uz7uSOQzUdOTw6Bxv/oQUJ4sInlrBq0oQV0DxqDrhAJfhiJYCefK+l8wOG/DbRBIveWeGICb9Zh4Gx+NgIVqKqgq+uyQrQ6ZfZ1ibNTqbV3NpNQ6KOPWqy7wyotHVHZVmpiInekLGpF8BBLatA6elHohR55FqWdRZJO5K4N5l+Xl4plAAk0Qut4QrZqy2+ftdKnjUiXSWSpUztci96ikCr+T/qkezjP8zHwWUp3KaoaANSahQO1G5DVBvUcyo/Gfwr5eS8oISV7ulg0yp9T0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8nzlLOArWBZgs+R+pcvuxt0x1p3yB5ppvzRYbGbXzw=;
 b=AjoVZ3rNwCQQ+roP5+5X0AJ7AwXmEzmwDxlmDnrOS+pIM0Uc9eg7YNWcQoirs8WTGuSe9fezQ7wIp1GnHoTwM1jU6EDvM59rMjySixKZWEfyDe2gwmx+dCKGH8aalafzzmQU+YiiEL/nOah/WhaxSxc3xJsyiG9HYUq3IPrQOCzcjlNndFQOpUUfmlBKPSvHIwputOD4LZzmb1zSGNYTjTQG2w8UnRGV05HpE3fopcLP8+vp9BdDySZuJUHdMkjd2G2hu7AJCIcbcNSbGHIFan9eE0ufXHB5V3/4VNqF41W7IVnEx3VTBRdOxLrRvUF/gamAi4h7E95SwWnP0koZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8nzlLOArWBZgs+R+pcvuxt0x1p3yB5ppvzRYbGbXzw=;
 b=nKC/nR62OYDMAU46VAFc1F/l6m4UVi4J827k1MRl3jILySzUBXMuNHfmB6K38BX5+kPKtPvcHQqWM+ZYYsjn+ViE9TQGpwL9kJ74J/72V17FnBl4FxZv89xPWerKDRoh2GdujdgKa2HHRi/YwheRas2YwJNemskjEkua5NDzHh4=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Thu, 6 Oct 2022 04:41:18 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::c574:f416:8a72:18f8]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::c574:f416:8a72:18f8%7]) with mapi id 15.20.5676.033; Thu, 6 Oct 2022
 04:41:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <pratyush@kernel.org>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <Takahiro.Kuwano@infineon.com>, <hongyu.ning@intel.com>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Thread-Topic: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in
 spi_nor_init()
Thread-Index: AQHY2T3fePCZ/Lfg1E+SS6lAXFxdag==
Date: Thu, 6 Oct 2022 04:41:17 +0000
Message-ID: <01bb5297-1723-2292-1060-f3a003ddb129@microchip.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|BL1PR11MB5238:EE_
x-ms-office365-filtering-correlation-id: 433c90b7-a65b-472a-d575-08daa7550235
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bjhy8Z3RcxUCCn5slmyhrMZmRjnKged9OXIXkA5LCaeR2oEjmJfjucTA1pLAytLl9SijvLAw6mRi0ugJTTelFGe+0JMpY5YnU5FjVTvRQKgniI9Ww2VEfo+Ce2i/MUjw67IXqKZ1uMWaujE3oyS+u5wv/aSmKcFjfvYNPZDm/sqVQkTN/G3NjdViOpdDfEEVf1v+nhhFIb/Fp91qqLk3Wxs7L8YoSANEerwTqx8BtJu4rh4jgZSZGkEEoft6QBXINFUtaDQWsKNW1GQFtykUIBku5isBWrRCqdw/hL0BwHqAPdM1Iq9UG/l5mwe1mcGK5f1KU4atxG1bEmGXFkxy33sywkYk4xDaQMecw+MLmMGYkhMNrMxNZVFCsqaZFG5l9oPi1Q6BUHn5qWA3A5ib4crbSvbO2e1ysckE9qVQog0QAhUCe9sVIv525TPc0Pintr6T3i215F+ZljdVfS2Ezid6l+XVXsUCSkVIssUyhJ7V4pRnby+CHWYsbh0y+Ni75YjJA0ruTy4bL6QonWxl3Up/aszVpAnm1lrMPcE33MKoM1P4ItwXOQnz4yBbk/vCJnRaLRx4R5yeUsAHiD08MoJABDGiKKXIKWLFHHJQTNLIp/g6+62bQWqdSIQb0ciDpz6mnNwgXJEgMWqnZyAh04/GedEiU7p+EIouPtB3/5c0XZiCPstcE3v239JqiHVgstn3vu5dOs7AGtAc5ai7znYP+x2XYjyH1ggtWBnmtV8fGonxb16A5Z2i5YHSG2nXV7SbZqnJ/SYNg4IFfhb9kuP+ZKimiv2gCjKI2gac87Yr9Sp11BEJ7A8P0eV++2jL47dscpsOw0ZB5hsoSj/svt6zkN7dn83b5Bdk2ztPtk0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199015)(66556008)(8676002)(66446008)(64756008)(4326008)(66476007)(66946007)(91956017)(76116006)(110136005)(316002)(54906003)(186003)(86362001)(966005)(8936002)(478600001)(6486002)(5660300002)(38070700005)(71200400001)(41300700001)(2906002)(31696002)(38100700002)(122000001)(26005)(31686004)(6512007)(83380400001)(36756003)(2616005)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3lrK1VKRjgvOGhBUlFOOVlIaE1nVnlEOFJaeTg0cy8yY1JsTUs1dlVpeXlN?=
 =?utf-8?B?Q2tYT3hjUCtvb3Bkbk1RVnhmekdyVU5jOTJyRUZBbG5icnNPSXdQSEp0M3B4?=
 =?utf-8?B?WGIrWWdrdnMyaG5rV0w3VFUrMm4vTFErWFAyZEZXVzFiWlBPRC95REZvbWFX?=
 =?utf-8?B?akYzMldmU0JVenRMU25MVUtncXBwU3hLSFJldFExbTBZWUpQNiswRXkrV0la?=
 =?utf-8?B?bnpXb2hWYkJwYXFVUjhGemVSbHo4MVJZY1RNdVhIWWhXN0dFcC80YWVtTjZj?=
 =?utf-8?B?clpGNlZBVTFYcjFTZDhEVHp4MDdkUEhhb0F4R0xQRVRqaFE5anlhUTk3a3Fu?=
 =?utf-8?B?VzRaRUU3YVgrZzQwaGhJekFBYWFKbHpuM2Rwb1pCdmFycHBrcER2L0VDTUt6?=
 =?utf-8?B?SEp4cjY5ZklKNjFlU2tnZ1lLTzJNb2pLQm1Sd1hXZXVncXByYzRPK3ozdkY2?=
 =?utf-8?B?cnl2MkNGM0h6NWtoNXJ5dmdLeU5Zb3lmTDEwYzJwYWpDZFh4RHdxZVFoYkJy?=
 =?utf-8?B?S2U4S09BTncycVZNZWdFWFg0V3EraENxMmYwZ3NpOU9uYk43QmszWjgrVmU0?=
 =?utf-8?B?aW9qYWE5MklCMG1tL1gvWE5TMm5TaXJIMFYrS2YzV3RxaGpQbUJGSjV5MVFs?=
 =?utf-8?B?b3RLZnlXYUZFVE5KdDYzZUdYM3VpQ1RRTmJ1QWlTU1c4ZzRldTU3anBDd1JL?=
 =?utf-8?B?YldIYUZzNWtyeitEVkVEd3EyVzJTQTVwVUhkcUUxVWNUQmtHYXZ0ajA2M01Y?=
 =?utf-8?B?d1YyVTdIU0lYOHZobU9qaDRtWHVtcEZJcEZGS3lSMXRDU3B2dTZYYlB3SEU1?=
 =?utf-8?B?UmxXWVdlYitrcW9sT3E1RVpFeDlCY3U3ZW5FNG9DUTZoWktJS1Vuanp0WTNK?=
 =?utf-8?B?cWlHM1VRWExpbEpzNG1sMjYzRnkwUnRIdEtsVzRIQ0UvUW90bnM0cSt5ckVt?=
 =?utf-8?B?czJvVjZWUmNzRmxIbFFvbDB5S2NVcWhkc283WHM2MWZYcGZqRkhzUzZLVkRC?=
 =?utf-8?B?WXFPY090YThWNjVmSFBLMmdraUVPTStPWmhrRnI2NzBUZit5czE4YWpndTBY?=
 =?utf-8?B?UklleU4rY1BKaG1QTFpwMm1LRTlNcEc2V25PdEt3dHZjTW9VY3Z1SFZUM0Vh?=
 =?utf-8?B?VTE2Q0dRRG1EYjArK2kxQkwvYW9hVWVFdXQxVFN3UWRvVnlaTGtrQW81WUVH?=
 =?utf-8?B?b2pWR3ppMzh1SDZmdzNNeS93Wm1Id0ExRWpLMHM5WER2djZxTlpnendLRVpl?=
 =?utf-8?B?WDB3QlRmUmpCaDdNdDRSTEVpVzMxRkJvQjIzMGxtNmE0RUsrcXZ3N3RlNmV6?=
 =?utf-8?B?V0RrREVCTXlsY1hobG8wODdsUGR0K2krYzV3dEYvdmhRRUdQcjMvOHMra3ZJ?=
 =?utf-8?B?UHArY1pSQkUrWmp0Y1B4NGRtTXVSOGZxT0tSbC9lbGNCZlN2YTRuYUUzMnVY?=
 =?utf-8?B?M1dwMGVOTkI5YVhWZGc0QzZ0c1d0OVhFWmNVaWluTS85Z2hNQXF2enJBTHpn?=
 =?utf-8?B?L0RHcFBQKzlBM1E3Rk9NMjJESHNpWUhMV2FWSWtvbTRjdWthblhTNHJRQVNP?=
 =?utf-8?B?NXh2bTRiUlk2Ni93NDRsNDlRSlpINnQ4eVZIUm5FQThEdFdXQ2ZpVkVjc1lV?=
 =?utf-8?B?ZTJiTHFtUFU0ekN3eU5BSTc5VDZaVFhpV1JaM1p4V0NlVi9yQUtxaWI4bDJo?=
 =?utf-8?B?SFh6ZWJqcTRWQ3Q2bTc2QVJieXJ4MitRWW80bUp5eTNxQklTN2hBVzJDa1Zh?=
 =?utf-8?B?azJCNm5HaEJGcjN4WW42SGppa0tKWW54b0kwZnU3RWxHOXEyY1RRU1Fycy9x?=
 =?utf-8?B?dERhOFd6VEFaMWZpTDk5M0EwRFZ5bGZmVU1SNG8vWXhWSVdmSkhjV3JCVFo5?=
 =?utf-8?B?dVpEUGdObXNhUlVWNGxsWFlDSVQxR0hYRFpyMjZTZWFhYlpMV3NENmhNdzhl?=
 =?utf-8?B?Vno2cjltSERLUTJuR1luYmVDYVY4K2l0a05IQTBUcDJIWnpaWVdCbnNlZGti?=
 =?utf-8?B?RWRJVU5wYVZNSW1pa3gwQWEwVk5TSXMvUngzUDFUZFMwdk9UY1dmRTFiTXdL?=
 =?utf-8?B?bUwvbGVzUXUrNVQ3L1plRFFKcGVlUHE2ZkZjV1ZBdE5vaFgyWDZpUHE3UjNu?=
 =?utf-8?B?Z0dyWVNkQVcveDdEMmo4THlYQ1VGL2ZueEJYYmdHQkxkdmNCME5yOEE1eXJM?=
 =?utf-8?B?M0E9PQ==?=
Content-ID: <A79FAFD05BA6874A900446AE330E805F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433c90b7-a65b-472a-d575-08daa7550235
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 04:41:17.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vrEeYByvTHDsOYMPZ7TII7QpO0wS9i5P8Ix/60793II41aIMtwXyR38fXSax9Q81U/3EWVDGwNZx0atHaDt5RZeUzrMvQjQ397BgK59duY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_214126_487416_A8F2A0D4 
X-CRM114-Status: GOOD (  25.53  )
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

Hi, Miquel,

It's too late for me to queue patches for next, but I'd like to have this patch
integrated as it solves a regression. Would you queue it to mtd/next?

Thanks,
ta

On 9/23/22 12:34, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Intel SPI-NOR controller does not support the 4-byte address opcode
> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
> chip probe fail like this:
> 
>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> 
> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
> Return error code from set_4byte_addr_mode()") it worked just fine.
> 
> Fix this by ignoring -ENOTSUPP in spi_nor_init().
> 
> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
> Cc: stable@vger.kernel.org
> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> The previous version of the patch (the revert) can be found here:
> 
>   https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/
> 
> In this version we ignore -ENOTSUPP but the other error codes will be
> passed to the caller.
> 
>  drivers/mtd/spi-nor/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..bee8fc4c9f07 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
>                  */
>                 WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
>                           "enabling reset hack; may not recover from unexpected reboots\n");
> -               return nor->params->set_4byte_addr_mode(nor, true);
> +               err = nor->params->set_4byte_addr_mode(nor, true);
> +               if (err && err != -ENOTSUPP)
> +                       return err;
>         }
> 
>         return 0;
> --
> 2.35.1
> 

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
