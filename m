Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC911C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVArDdvgjcLJ46PPO7eje9HmdvNZlZgnstIfRUN3jNQ=; b=EyzcPl1nSuZjvx
	peBgf5nIfdVNlj4sFxUp6gtfrBQtUyOBBO5ULxG9NmQTEJfYeqPE61SP4DH/3hN+K5OdXUl2a6Nuf
	1jaS2ceUt/RV6CPVg9OaUmP4UsrlTRiRJhQt6/Sb2tdLB2z32m1shzGNRvLfGtD1xzHPpoXH7VE+L
	Kj2Baou7DQDlw9sJLNVowcFhw5I+NQE0Bnb5T/OBT3nP9rVAzbGM0nQ3T+Sqcjo6nFFV2aB62A7Xz
	sqmIWOxm67/bYJ5Iqdzv/XndoFtQS0NXL1tdGyu00cIWpDLHzQ2f0EN/UsXCGkFWn6m3UEZU8kmPR
	bEfc5k0885VB6nZLmSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUCu-00D36n-0s; Thu, 21 Apr 2022 10:38:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUCq-00D35h-Ad
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650537516; x=1682073516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/al/bwqeiK+EHojIFhvaPmepsh9NhEh0oQHWvI4I0tY=;
 b=Ziw/ujmwKjCRpcvXozsbJ+8cS8c2VE+GzWmCJD0aoi/kgkFDFST0akb8
 hhscQlHpVnNchgtWnhTdFQQKmviKYJQGZI5XTEY+1OVqHwDmYb3NApg/w
 I6tCiaUqTQImJeLsfUqcpUADWhSKCApB/zASxtl3H8jHnepPFKtNVPnlG
 R+mQPL/umLYDJtFIaZkhmcr9aFm1/UOgpmH4FCaD+YPaAMKygHBxJs4cV
 Z4waDu8jAD/CqQb9JxSsDKPqe7a6NV//MAyEpyrV+niqPBUEHtZRhwvFP
 +ZU9219ARziVVggO3pr4gLd5zWL+lnxWkICwtkhijm03HwR0+J5/tYnA6 g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170409169"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 03:38:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 03:38:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 03:38:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdFLlYlq21T9yD+wpfP8mB+ggFfGTqK0OPa9r5c8Xg6X4RQHtLWstmQ6paZw4F0EebO3pTG2f+uue+42F+0P6H6Bcr7Mpgct98MhGPqDvm2ni/lUeIFpsnE8muSZng6Yw4ilXsBN1dj5o2wRi29ARJmYhC8Ca3JWS9Fm8dqCi+0oXEvgifk9SJfo7jZXvWUBVbutyN/DIWINfd2PNgeXXJl93hmYt+8IAFSj4Qxq5MQd4g2FbEe5ZiMxCYdBiZvu7bFDlYuTEjbMTdFxlq9PvjWj00uedoUhzsxHCKhN+OLw1vY8JC0lrW2MlXOmjKlW/PYHQ1PM112pnLASZNvbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/al/bwqeiK+EHojIFhvaPmepsh9NhEh0oQHWvI4I0tY=;
 b=GYSwV9ejkQ6OkqYK4asqH3GOpQpVBc2uptPbiYiUejhL8FaMU/WQIVu/0vsZSvEZkZc2yoOvyfSe0p3GsSXe3J3CwoEpdDkl8bo05xv3T9oBLsCDiXbVI5klHow4lENl/8nyY53AdgE6UKPVrwujzRP5e0xEaKT5rgNhcE1GZXldjuCfg4RDUYoW7qsTxff/t72C1Gdr2wFIx+F7iLb5X0r2MJ/NMag0ZxLj52oV+k+Dq+qS6Qi6pMFV6xk40CO5meB2TSUb6VOlKlSxcP8BgjfeRWjiczGg0h3KhaEASBUsVJpvReP0eCp3MzO/hyAKPkyvoBlL0lHiMHMSR67Yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/al/bwqeiK+EHojIFhvaPmepsh9NhEh0oQHWvI4I0tY=;
 b=bHPNfgGIAdPvneT++milKKElIhqb91VwsK1Kc6eZsjStkuA5HPaFOBha/SA1CbiWR1yQBPaOcCWQkX5kaBiqAXBNy1koDwVy2bYY7CEidx0OuQSjoZ6wUMEaW2WrqlFYm6LaOk7NKKeHvlZt17s8rBSIV+w11Iv/8taTq66o5ok=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4208.namprd11.prod.outlook.com (2603:10b6:208:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 10:38:27 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 10:38:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYVWvv68wo3t3IT0asmq5tmkva9A==
Date: Thu, 21 Apr 2022 10:38:27 +0000
Message-ID: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <d705a2c1fc8d0a59c93454aa05642aafe4fc960b.1650532121.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <d705a2c1fc8d0a59c93454aa05642aafe4fc960b.1650532121.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdbcba16-5ba2-452e-a183-08da238311d5
x-ms-traffictypediagnostic: MN2PR11MB4208:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4208B598DA7D366E68C8BE00F0F49@MN2PR11MB4208.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OcrvYFPdGoEwx/QryqYN0gW9bxsL/iwWrm5ovms89iEvbL9GJMQwRUJcsJyUMgtVzvJd0WoTKNXbsrDQM04dZrfUUvxqo47o39lqyE10mWKk1Heog0FZHpGWmPUzncrkOZKrstSAWwncxNW349z5YFR/XIrSS8P862Ca6E7ybtw1w/DMtEWaDnQVTNaw9hUbQoM689XRrvaiX7ss1hBy6TZEvuvjyWwQue8L40oVbht/fJrcTM0DH/UWVNNUfu7gQNBo0QCvShH2XtSCDGBUz+tsTU9hR6FrMb9r2nxKWAdyMKIfBrOx/uQ2hJrwFhi9M5upYg9FL0cyLZax5xWKfhawQciHu3q4Q/ZgRzm2lKR5hgPlEwfc+wh33aDzLikXNvCpFkFpKZeLqizewK7EwCbc3GIfGqMkAAe3MOAB90IrZDWxcIbK25QF1+hXskvucl0QF8K+XZugJ1UeioRAuJGzKtrl7fBo691n6FMsQz8zcuDGoxxYXumxd9Hv3Ars1XakwHoSk4WgMuFPyRek/0U1AabBuL4GVisn1iJjCKUzVaJsl5c/8XmIl+lUYvaaNvD86e7DT8cBWBTKjliAxkz1D4W2e51w8a4wD00AGiwZUxVEN2jUJ28trQfVqPJlZCHH59kpHDDDuKNvPPP8Fycs4K0yo0hj1HZoVegCSVTkQltjRM0gbRGkXPVne8Hi0HmvX3/snXOMua62IQFyh1Br7CeGBl004nSK9OILHr0R4Taprt7D9AXNS7vyuxxHFpbFCyE6HKI2QEKq8+IucA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(2906002)(86362001)(66946007)(110136005)(38100700002)(38070700005)(122000001)(6506007)(26005)(6512007)(54906003)(91956017)(186003)(2616005)(508600001)(53546011)(6486002)(76116006)(71200400001)(8936002)(66446008)(66476007)(5660300002)(8676002)(4326008)(66556008)(64756008)(316002)(83380400001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dytBOTlPK010dWVtMmFqUXVueEhSSmRmM3RlZTkrL2RESkF6VGZOU0N2TEVQ?=
 =?utf-8?B?aFZZT0tLM1RJMmNldHpud1orVXVoMTNhT1pmRjNYQ0ZYRjEyZVFrVnJHdk9v?=
 =?utf-8?B?YXdUTWlBSFN5Q2dpWENhZ2l4dlcyRHhSVXMydzAzWXJvRFFTKzJpNWo3N0ZX?=
 =?utf-8?B?c2xkYVV3OHRwUWxVL29YZy9vUWxKdHJXOUZJSmZFbEEwK05WdHdZbC94RnRK?=
 =?utf-8?B?RUV0T2xsZHhuVDVhM0N4S0g3cFZQUWc0RS9YMk9UTmIxcC9uZkNDNVJYTGkv?=
 =?utf-8?B?bVVpVUlIR2N3WE44Vk9VSUM5NGEvU0dBK3M3bEp5UHZ3akV3Z2NHM2hGMjBa?=
 =?utf-8?B?VnZ4YUZ3dXo1T2hMa2c0cTBDMXlqUTduOFdoemtVL1NmZ0pLR3daejhLK05v?=
 =?utf-8?B?dzZaajhhK0JnL2xxOFNSWVFWSVlValdaR0tpbHN5WUhsNGMyV3M0ZjJzNVZ2?=
 =?utf-8?B?MllXNll1bS9BZ0JoRnl1dFVUOWt0RVFWbHA2a2ZvdVliMmkxWFFoRXF3cTRw?=
 =?utf-8?B?RG83ZnNzbjlPSmNXZUx4SmFyckFyWEJNV0V4MTBnRGRRbkZaOEJDQ2FLVU83?=
 =?utf-8?B?VzFUakdZRUNjaXN2SWVSMnhSd0FNQ00rTndhTy8wVjVqeDZXeVdhK2hmRkRB?=
 =?utf-8?B?cEdXNUI3WmZHRUJxdkhrTm9Zc1Zjdm0wL0tCd1djUGJhR2V1U1dQT1l3TGdz?=
 =?utf-8?B?MXFWb1BLQUxWSXd1RklEWXpFbHdtQ1A4NDVUNEhLZUUrN3BRNUZORTRTcGFN?=
 =?utf-8?B?MHUwL1JSVVV6S1BhU2RvQjd1ckE0UmRIay9PRTVkbUprWXdMSnlzdzJkL0Y3?=
 =?utf-8?B?UzFWK01DdmZSTityMm8vTFJUemhjZy9IUVRoT1ltSUJ4YnpGN3ZkcWlwY3l0?=
 =?utf-8?B?U1hrem5FUTQ2YmV2MTZTZng2RG9TY2FleS9SclRNLzNDSjNrNjRHUEFDREtO?=
 =?utf-8?B?UG8zQWNIUnhrT0dkb3VGRUNHS2MySjcwNjVNa05oalRiWHoycXcvOWx1VHZw?=
 =?utf-8?B?OVNtdHJuSmZDdS9zUHNuUEJvYTlKalJYNG5iV3YzbStzeTl4MXdqZUp0dTNx?=
 =?utf-8?B?ZmI0dER6REpGbHhCbCtLeUp0bWtOSGhyaDdzWmJLWVNmU2UvbC9NYWhTczZy?=
 =?utf-8?B?SHNlOWJHZjBwazFDNmVxb1JxZmJJcmxFZEFCQmJIem9BalZ2aG5DcDkvcEdX?=
 =?utf-8?B?dis2ckJBa2VNUXhITC92OFE3R2FPeUo0aHZuUmpHQitDMXN2ZUFnT29Oc0Vq?=
 =?utf-8?B?MWNweVRZSzlPRE03NVFuZUgwUGplUElKUU1UUWtsUmhqOHEzWkYvQVFkcERu?=
 =?utf-8?B?cUowYU5Pb0hNcEhZaEd1aVhjdDQwSCtlTjBDUEFrRWxYOFhiUHAvRnBPcit3?=
 =?utf-8?B?eHNoUDhyTE1VY1dVZ2ZQakN1QnJmdjlQYXRueGtHK0NpRDNGS0VOZnBaR0py?=
 =?utf-8?B?cS9LL1A0NWg1QUdBTzBNZ25BcTN1OURnYkJYUnJPd2dUaVB5UGo1clM1aHp2?=
 =?utf-8?B?VXdpdWY0VnkzaXlNR1dXN0tCTHR0VjdRaDhVYnUwdzhiSndvT0NNb3pBdGl5?=
 =?utf-8?B?NEVaVU1wQklRODB5S2M4YjdxR3NpUk9sUlV5QzF1NC9nTUcvZkRPNU1yaXor?=
 =?utf-8?B?ZnkxSVpQWEJNS2ZZdDVSZ3MxVEpjZjg4SWEva0VRQzkyWFk3R3FtR1JhZFB3?=
 =?utf-8?B?MHFaaFkwcmhUNUMrbEdJUU5lR3RoRHpNcTlxUzhCZzZ4OHREeHpHVjNPckph?=
 =?utf-8?B?TzM3S0RpdVk2RGMrK2NEUmpXZUQxREdTd2pSSm8zVEQzZU1Yb2JOWkxwMU5N?=
 =?utf-8?B?VUFFNGZsS0w5ckR3UVV5bll4Nk8rZWt4WVZvNEdGSWQ1TlBOMmNoUDZsUHpp?=
 =?utf-8?B?dE1FaGpWVEpvcW15b202SVhwc3VoSjBSU3diZy9iUjlyQ082NjhjQ3c3TmVy?=
 =?utf-8?B?TTBNY3RldEFqQWI2QllTbmN5SHZONlVMTUg0SFcyMy8vcUIycnZuckRQc3Fi?=
 =?utf-8?B?a0pSaHkxUHpkMXoyVFI5MFZwWmg1NjhYSEJTTGNYSk9kVyt5Y20rOU9CNDRO?=
 =?utf-8?B?SytJWk5nTW1aWVZJY1loendoZWtaalhCaFhMMlo4Q1Z4TXNSMDhpSG9Fc0FM?=
 =?utf-8?B?MHRKdGtCVm1ZRGlsV1RMbGMwWG5hK0g1dVlJNzJOckk4VzRKRGNObUlLbEdS?=
 =?utf-8?B?dFNwVmo3NDdlajdJRXU3ZUlTYzJoeEVQY0docWRlUHBma085T1hhcWZ1Nzhv?=
 =?utf-8?B?YnhqOXh2SWY1VVI5cVNwTnlBUUZXYjlVVE1pV3ljbFA1bVMxZnRIUVpIRS9m?=
 =?utf-8?B?YU9PUy8rREptK0VTNzdFbkFWRDVSUUN1YmJjS1JBTkdTREVtVC9tYUcxY1pR?=
 =?utf-8?Q?nz5oC2xo3Xv3NpbM=3D?=
Content-ID: <E6970249278A0D4CAE5FFA9FEF433C59@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbcba16-5ba2-452e-a183-08da238311d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 10:38:27.2778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPJ+1+fr2mQTF7OQQ/Csdu8XBvbSgI0Rliae0VSgHotWuZSUXNEmBSIRIMwSy7Dp/gIBIhwLrU2tFS2d90RHjhtcZj0v8V1oypTNi40giUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_033836_640515_3EB8BF7D 
X-CRM114-Status: GOOD (  23.24  )
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

On 4/21/22 12:40, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> In 4BAIT parse, keep nor->addr_width because it may be used as
> current address mode in SMPT parse later on.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 7 ++++++-
>  drivers/mtd/spi-nor/sfdp.c | 1 -
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 40ba45328975..87603a99938f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>  {
>         if (nor->addr_width) {
> -               /* already configured from SFDP */
> +               /*
> +                * Already configured from SFDP. Use an address width of 4 in
> +                * case the device has 4byte opcodes.
> +                */
> +               if (nor->addr_width == 3 && nor->flags & SNOR_F_HAS_4BAIT)
> +                       nor->addr_width = 4;
>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {

Can we have this instead?

commit 61d73dea7e63db4c7a3ffaa7f2b5068fb71c2d8b
Author: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date:   Thu Apr 21 18:40:21 2022 +0900

    mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
    
    In 4BAIT parse, keep nor->addr_width because it may be used as
    current address mode in SMPT parse later on.
    
    Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
    Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2bfa84100d38..7095bf897318 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2272,6 +2272,9 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 
 static int spi_nor_set_addr_width(struct spi_nor *nor)
 {
+       if (nor->flags & SNOR_F_HAS_4BAIT)
+               nor->addr_width = 4;
+
        if (nor->addr_width) {
                /* already configured from SFDP */
        } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a5211543d30d..b2cc3bfe0d5c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1098,7 +1098,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
         * Spansion memory. However this quirk is no longer needed with new
         * SFDP compliant memories.
         */
-       nor->addr_width = 4;
        nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
        /* fall through */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
