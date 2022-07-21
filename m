Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184FBC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD3Ac9GdX4UOwFXEuhbl6915/rjpuuOxt4jlIrrZRKQ=; b=pCQJSLkCbB/LoC
	SJOwvyQf4ZDxfGjn7BK1rznWBg4EYukAJJXhmT9ndc6ybxl3stskuaTpkr8gsGFW7iFq8tnnswGsF
	QKcjCmxtln8Wbi8jYlyCL2zLufFtLmi/AGCObevJ7U5Sxzgtlk+g1EdhWri5DNGu0yNXkKq8vAtCC
	ZcC50amUJa4V1fdPHWUKYcqX2ZrNz5DETucRs83UxLw9XPPfMN7kCBR6RVIM1KxweTntGNWujPvM4
	hfLaXDCrU2LUu9M+eU68YJfzBjZVqAkYWt7dAQcg19iq88lgv6QkDQDb3JsIVZed/y3Qufe8ViYj8
	1FtA3/5pID/akRBBIBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEYlJ-009f6Y-VG; Thu, 21 Jul 2022 16:10:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEYlD-009ecH-65
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 16:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658419847; x=1689955847;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Vu5KGnhmWhpLEoguG86NDbBSJnATmkQINDypkPgAMV8=;
  b=wJF7tAL8P4pyDmQgbUlNGYYgPx8PHxXP463lXNUT04N/daMjNK6zIzgN
   06Yn+tAx5NMneFLv7js6FP2Hr0AWHyBwcB5itRy2+UEz5lgdGXDKLM7TD
   YG4de1uJByVGpUwB44ni4g9m03L+DuCmNi7DjNDxwa2j6hHXwftzwHq0v
   A17uZd349tfRFUDx7jWtiTSDgjLY7Gb121v6WanjvRHedxXl9zb87QiAy
   +vK5Q8pe3oDE1E8cVCq9Xybigkh2QQG6oojHydNLIKtl8AKDfvML7khmE
   OEX0EGU5K4UBzFRfuYMjonf4WnPzrXFqaNJPxqaLFRXgJ5q+Boi3YqsPf
   A==;
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; 
   d="scan'208";a="105558735"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 09:06:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 09:06:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 09:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVR0ZtLUmDHo2j+PqB2vPe8aLnBGeGJHKuHqFspstpJrxO99zpY1wbrCwSF5fGXK71amTjv93LCcCIp7OJYZrZXyxZuDJG9awA/t/nub0E96Z5Hj/n4U3YrZQSP9exQbnzkd0AL+6TqHO1IFVZgIaJhfoqTWdus6XSPT8Q+IGBnJI+bmgtSareqfYPakETWyJ2C0BI71n5zdwFKEc72n810Ey9uUwiRnU1cOKL8x9tp9k5RsqrEvQp836ZeQRvfeqvNkJxqT/Z3HPk0WTpRrtOmXNUUxu+0xqcXzBFLukLajtkAqjA81Ea+mdNjfMVOlel7aQDNpoTbCeLPpAXxWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu5KGnhmWhpLEoguG86NDbBSJnATmkQINDypkPgAMV8=;
 b=kQfl8ciKDjU8deTT2TTnKyqMSBe3sbUn647RORbDeXIDSPBFdOHZY2Ko52RSxJ8vJvhSL+3gYHIfCEd2QTD6yX+Mtd2aEdnPLemHDuDXHf0uMflFk31YFlEIV0mb0b4RuMxiizk7qQgwkqKJchYPZ9+5Box9bR3UmC15hPz/rtqwUF87j+CNvBkjslIJxqReZ3/GO0YEcMBZns7WqdZBJcDMHadpsQgexNCXyi8l5oLKnivohDqFj5NatzIMJQc5MXFBLVdBDzhcQfycGzzAhkbkcU9mGFMUyemIAYeIArNerQlH3Pu1GKEzubCqbNC6tB0FhVdFXy2OD1mOkzYCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu5KGnhmWhpLEoguG86NDbBSJnATmkQINDypkPgAMV8=;
 b=EaZng/PYW1fPYo/uluHtPM1RIU6PdWg2qbHGaa0i7KA8jAWyShNUCSl4Ew227OtMsXtq7jc6mlZDSlIlT7iCWYq8nBw6S2huHp74DfTAj4OoumB8pPaXqAkutXlymjqZLD5TQX2j7oClv1HG+6L1zDOufIgWcWndzwfX7XcqlyU=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CH0PR11MB5707.namprd11.prod.outlook.com (2603:10b6:610:110::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 16:06:44 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 16:06:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYnRvdTEt+bD16DUaYd/6imLQaPw==
Date: Thu, 21 Jul 2022 16:06:44 +0000
Message-ID: <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
In-Reply-To: <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4355f34-a0cf-4d96-dd2c-08da6b3301f3
x-ms-traffictypediagnostic: CH0PR11MB5707:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: imoF/I/TsN8h3JaxsMA+XzD+vFippQfqW+qMQ8uGEKK7xmUfkopVv8Qeqpf0WvAXx4oP5vJyme2BAT6YMbVyUf2QcuaXB2Tr6/gPg6xVaP/yNSpDJ68/Up3tModskq8r/54qL0E0NZAce4/sDekNeznTCzfht0vrIKjgBtHtevsBK1baXx/YYmA6zP9quiQ57EgExSPKfCPEPieJk0o3TnnwxwIfaJahDYfXiKqI/YXacwthfz0khpjhRb9A5BvTO+t/iLQJzrZcqSOC6pAlRqEFdxfWid8RbHhrAEwyiUHKIW9YqoNTpZ3AGyTRZHLhyRcQMJ6TBJ7nv3+Mzc1yQFDbAOoUTQCR9U2rH0HiG30e7S4FlMZh4X3vxXF2J7LX4m7Alij2YPcGb5IhJ2XAhRDrva635fp2cfpAyLD3BULBOM2La3uHjmncpwt8OBb9oFOe7CBnCUHv1F80yN+zLAXSh0VokLAkaDzOA2RTYUrpjQdvdPdAB0i+X2FB1UTGrelqTralVHXT0lPj34EkRIBKoEEvXYjGp1ZogQbeiLEKFsPkkW+C85tqY8v0uZyk+ZHHCyp8iQEmtjMdkgPZ5klPhUTA1/0aNSGjZMps8V6c2D9hNcyJ+8L+Z+Gqgb99Q0/LQa7Te7tDInDEmFGqfax2YwegVOrBKm4Ww7n6rkcHwvXI9bKbvDq4TSK1ZqZa7wqIjlzY1m41dIhr5aUPH8U2/lNqfa4MbBQmrgelDkKbQ/f7Q8woKS8cZwqJHdo36b6FXAQA/4yO9oAgo62ItCz6J/Ap/H0p+987w0frZrTS3HPZR93qcrYo30DzZsixlPzcAxnFZbnY9fCjrKBO/vDat1UldDzoVRQU2q38nHs17zMfYw2go4KqN6Tm1OXU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(346002)(376002)(39860400002)(53546011)(2906002)(6506007)(122000001)(2616005)(6512007)(186003)(38070700005)(38100700002)(26005)(41300700001)(6486002)(76116006)(31696002)(66556008)(66476007)(8676002)(36756003)(64756008)(4326008)(66946007)(71200400001)(66446008)(54906003)(31686004)(110136005)(478600001)(8936002)(316002)(5660300002)(91956017)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWJLR0Y4SFRxcTY1blIza2twQ25NTTc2NCsvYmZtNjUzUXlidDRZQ25zN1lN?=
 =?utf-8?B?cHM3dFJPMTY0MGdCK3FqejFVRTFjUC9FUnpoSi9BVm9qRkFiYUZocmU0RURz?=
 =?utf-8?B?NzYyRWYrVUd5S3N4c0hLUThpMUhNSWZyT1VxZjg3OENBU3EwRlFVd1RiWXlu?=
 =?utf-8?B?NVRxem5zaHdsOFVWdlR3STg3aUlOWDYvSi9VMVFvTWtqN21SZDREa3AwSXRq?=
 =?utf-8?B?R3pOd01Xb1B5R01STlhoQWF0K0lPMG1tQTJ4SUJvRmxlUEZIOEEyTzV6YmI3?=
 =?utf-8?B?MzVQTlBwQ3BXR3FKYkNYS0t4ZktTK2QwVW9pRXpmTHJJOEpRU0tDNWlLNXEy?=
 =?utf-8?B?OERhSkU4Qkx6d3FOdUpmOExHMFhBSTdFZDNYdjdlL3gzMlRwQUdlang5cS9U?=
 =?utf-8?B?K0FRV2U0VGtrNEZZajdhd2dlYXNqYmVIdHczWUJxR0NCRWtaREdMOURmZXpV?=
 =?utf-8?B?R0NGNU84V1FXc3NEelRvcGQvNWNHSGJHNUd3TWVab0tqT2NpeFJiendFbXpz?=
 =?utf-8?B?RW54QUZxWm9wMVMxTlJ0ZjJnQmlZZEZZM1lGalNWakpKdkFITVJWdXhuZGRD?=
 =?utf-8?B?UmJmY1F5ODJtdHpxNy9takNyTWFjdm5uSHlCYldXSU0rVTZFbXZGTzgyc2tV?=
 =?utf-8?B?Ly85TGE0eEtFcnBFc3BpNi8rcnpFV0pnSzZyZnBxQTVtdGphemFrSTdMZUNh?=
 =?utf-8?B?M2Jlc05nczFNTXQ1eDhxYWxjYjlRN1MxblI5Sk53QklpVVNhRXlZNE1ZekRD?=
 =?utf-8?B?WTkvbGxKTysvamk1UDI3WFZrVk9heUtLMFBHVmQ1aHJxR3MzYWRjc2w0Vnox?=
 =?utf-8?B?Zk94Tk5xWGh4ZnVqLzVTdXZWRDYwR3B2WXhRREZlYjJGU00wa1NRZ3FjM2w2?=
 =?utf-8?B?VEpManNoZHhndWIyT3E2czJoaTBFZEowUlhFNWxqLzU2bzArODFUUUVWeEdl?=
 =?utf-8?B?NWdaeEUrV01oZE56MmJtMmw5SHJKZEFVUytuMUw4VmdZWENMeUhwK2JhRzhm?=
 =?utf-8?B?VGg1WmNmZGt0a2d0eTFRUTZpV3FRbERsYlRFMTBpMUlIZyswMEhTZXB0S0t4?=
 =?utf-8?B?RmRZOGtVTmxmY2p1YW8xYWkvd2tpaEtUcmJZTzluQzZiTHlsRmpjNmxMekZR?=
 =?utf-8?B?aVlRd2lqdDNxV25EWThTMW5ibEFJclNGQ0xIYXFWVmhqQVUzRFZ6UkhPYXJE?=
 =?utf-8?B?Q2dkTlR0L0hDZE9oNThiVEtPcTFMVkdrQks0RXF3aWNEUmlxUTNOR05mclRN?=
 =?utf-8?B?dTczdEtKZ3kraWRBR3JFb3ZUNU1FL3FmaWtpUzlxZi8wZEpDZmpNd3daYWJs?=
 =?utf-8?B?Nm9yelVGQkhUS0VvZmgvS29IcVVuQW9JTVpVZ09NMldQaUtyRkNpOTRyZEc3?=
 =?utf-8?B?b2NUb1c1TmtzalBtRldNaGtONnE0SEFtc3RoZ1dVYWtES0R5L1Jlci9aSnRQ?=
 =?utf-8?B?YnNiVzRQUVJseVZGdTIxVEwySlZQV24vVWFPeVVIc1BzWll3OHJKdGowWE1G?=
 =?utf-8?B?R3YzOSt4M3I2VVkydWFRNGhtSzJCUmUvL0JJY3M5NEwyeWQ2TVhBYjBtU0gw?=
 =?utf-8?B?bUVMQ1YvMDJwcHMwSDdrQVRPcWF2dXp2OHpYR3pUMHJyNm04NFQ5UEgvL1ZB?=
 =?utf-8?B?RjJGWk9xZlBJZU0yYUsyb0orellRbkFEMzdPdGpZT2YrYVBLRmZXeWdRWFRn?=
 =?utf-8?B?Qlg0aUs2cm5BRnFWZSs2THd0UndvdUgrcnBMQkd4bkxxdjdiWEtWM2JaMzF2?=
 =?utf-8?B?WW1RcHlMamtkQWs2blZJUW9pSnVJdmovVXBOVklyb0JsQkFVdk1XR0Y0Mk5J?=
 =?utf-8?B?dTJQWkNBamVlL2c2MGFZVHNNajlvQlY4anlrZDdORklIaFN0UFJ2RGx2VjY2?=
 =?utf-8?B?Vk1EOUxLTWFyY0VXT1ZIOHhsdGIyZ1ZqRWdyQ3p2enRjNmxhcG1KVlhSWi91?=
 =?utf-8?B?dXBtYXhHc01lb3ZLL0FnVDNncDg5WFR1aElzK09kTkZlSVpTZ2hLL3NQY3h6?=
 =?utf-8?B?R05RMFlTMFlZRUFnWi9hSlZFUkZVMDh5YzZUYVVTS25ZM08zckVpSnNzZklJ?=
 =?utf-8?B?dmM4MHdYTXZScnM3UXZ3d3pYQTJTM2QwZ1Q2ZSticm5NTDBhRkpWeERmZHls?=
 =?utf-8?B?eHdoR1NWUWU2ZHNUV0psUlk4TTRWTUoyQ2I2VWFMSmVpeXB2WldocHpldVRh?=
 =?utf-8?B?MEE9PQ==?=
Content-ID: <5F7C4A3C291C7B45BC015A1DB034F69F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4355f34-a0cf-4d96-dd2c-08da6b3301f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 16:06:44.5984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EhEZtaPUO4Q4yOjtdh4r5WoCNcUtxxn/oVBz9E5gyBJIMwysJiRxMtkD6SGQTvXVNwLzt3w0MpsepMiS7qstFTn7xfMGauKR5WhuX5sHqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_091047_670180_DB77A749 
X-CRM114-Status: GOOD (  32.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNS8yMy8yMiAxMDo0OSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIyLTA1LTE0IDA1OjUxLCBzY2hyaWViIFRh
a2FoaXJvIEt1d2FubzoNCj4+IE9uIDUvMTMvMjAyMiA2OjQwIFBNLCBNaWNoYWVsIFdhbGxlIHdy
b3RlOg0KPj4+IFtidHcgdGhlIHN1YmplY3Qgc3RpbGwgaGFzIHRoZSBvbGQgbmFtZSBvZiB0aGUg
YWRkcl93aWR0aF0NCj4+Pg0KPj4gWWVzLCBpdCBtdXN0IGJlIGZpeGVkIGluIG5leHQgcmV2Lg0K
Pj4NCj4+PiBBbSAyMDIyLTA1LTEzIDAzOjI2LCBzY2hyaWViIFRha2FoaXJvIEt1d2FubzoNCj4+
Pj4gT24gNS8xMy8yMDIyIDc6MTQgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+Pj4+PiBBbSAy
MDIyLTA1LTEwIDAwOjEwLCBzY2hyaWViIHRrdXc1ODQ5MjRAZ21haWwuY29tOg0KPj4+Pj4+IEZy
b206IFRha2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT4NCj4+Pj4+
Pg0KPj4+Pj4+IEluIDRCQUlUIHBhcnNlLCBrZWVwIG5vci0+cGFyYW1zLT5hZGRyX3dpZHRoIGJl
Y2F1c2UgaXQgbWF5IGJlIHVzZWQNCj4+Pj4+PiBhcw0KPj4+Pj4+IGN1cnJlbnQgYWRkcmVzcyBt
b2RlIGluIFNNUFQgcGFyc2UgbGF0ZXIgb24uDQo+Pj4+Pg0KPj4+Pj4gTWggSSdtIG5vdCBzdXJl
IHRoaXMgaXMgbmVlZGVkIGF0IGFsbC4NCj4+Pj4+DQo+Pj4+PiBTRkRQIHNwZWMgc2F5cw0KPj4+
Pj4gwqAgVmFyaWFibGUgYWRkcmVzcyBsZW5ndGggKHRoZSBjdXJyZW50IHNldHRpbmcgb2YgdGhl
IGFkZHJlc3MNCj4+Pj4+IMKgIGxlbmd0aCBtb2RlIGRlZmluZXMgdGhlIGFkZHJlc3MgbGVuZ3Ro
KQ0KPj4+Pj4NCj4+Pj4+IGFuZA0KPj4+Pj4gwqAgV2hlbiB0aGUgbGVuZ3RoIGlzIGRlZmluZWQg
YXMgdmFyaWFibGUsIHRoZSBzb2Z0d2FyZSBvciBoYXJkd2FyZQ0KPj4+Pj4gwqAgY29udHJvbGxp
bmcgdGhlIG1lbW9yeSBpcyBhd2FyZSBvZiB0aGUgYWRkcmVzcyBsZW5ndGggbW9kZSBsYXN0DQo+
Pj4+PiDCoCBzZXQgaW4gdGhlIG1lbW9yeSBkZXZpY2UgYW5kIHRoaXMgc2FtZSBsZW5ndGggb2Yg
YWRkcmVzcy4NCj4+Pj4+DQo+Pj4+PiBXZSBkb24ndCBzZXQgYW55IGFkZHJlc3MgbW9kZSB1bnRp
bCBhbGwgdGhlIFNGRFAgcGFyc2luZyBpcw0KPj4+Pj4gb3Zlci4gVGhlcmVmb3JlIHdlIHNob3Vs
ZCBhbHdheXMgYmUgaW4gMyBieXRlIG1vZGUsIG5vPw0KPj4+Pj4NCj4+Pj4gQWN0dWFsbHkgdGhl
cmUgYXJlIHNvbWUgZGV2aWNlcyB0aGF0IGhhdmUgdmFyaWFibGUgYWRkcmVzcyBsZW5ndGggYnV0
DQo+Pj4+IDQgYnl0ZSBtb2RlIGJ5IGRlZmF1bHQgKEkgd2lsbCB3b3JrIG9uIHRob3NlIGRldmlj
ZXMgYWZ0ZXIgdGhpcw0KPj4+PiBzZXJpZXMNCj4+Pj4gaXMgc2V0dGxlZCkuIFRvIHN1cHBvcnQg
c3VjaCBjYXNlLCBJIHByZWZlciB0byB1c2UNCj4+Pj4gcGFyYW1zLT5hZGRyX25ieXRlcw0KPj4+
PiBhcyBjdXJyZW50IGFkZHJlc3MgbW9kZSBzbyB0aGF0IEkgY2FuIGZpeCBpdCBpbiBwb3N0X2Jm
cHRfZml4dXAoKQ0KPj4+PiBob29rLg0KPj4+DQo+Pj4gQXJlIHRoZXJlIHB1YmxpYyBkYXRhc2hl
ZXRzIGF2YWlsYWJsZT8gU28gdGhlc2UgZGV2aWNlcyBoYXZlIGEgMyBieXRlDQo+PiBJIHdpbGwg
c2VuZCBkYXRhc2hlZXRzIHRvIHlvdSBpbiBhbm90aGVyIGVtYWlsLiBBdCB0aGlzIHBvaW50LCBv
bmx5DQo+PiBzdW1tYXJ5IGRhdGFzaGVldCBpcyBhdmFpbGFibGUgaW4gd2Vic2l0ZS4NCj4+DQo+
Pj4gYW5kIGEgNCBieXRlIG1vZGUsIGJ1dCBhZnRlciByZXNldCwgdGhleSBhcmUgaW4gdGhlIDQg
Ynl0ZSBtb2RlPyBMb29rcw0KPj4gWWVzLg0KPj4NCj4+PiBsaWtlIGl0IHNob3VsZCBiZSBmaXhl
ZCBpbiBhIGRpZmZlcmVudCB3YXkuIEknbSBub3Qgc3VyZSB0aGUgImN1cnJlbnQNCj4+PiBtb2Rl
IiBoYW5kbGluZyBpcyBjb3JyZWN0Lg0KPj4+DQo+PiBZZXMsIHdlIG1heSB3YW50IHRvIGludHJv
ZHVjZSBhIG5ldyBmbGFnIGxpa2UgU1BJX05PUl80QkFNX0RFRkFVTFQgYW5kDQo+PiBjaGVjaw0K
Pj4gdGhlIGZsYWcgaW4gQkZQVCBwYXJzZS4gT25jZSBJIHNlbmQgYW5vdGhlciBzZXJpZXMsIHBs
ZWFzZSByZXZpZXcuDQo+Pg0KPj4+IFdlIG5lZWQgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHRo
ZSBtb2RlIHRoZSBmbGFzaCBjdXJyZW50bHkgaXMgdXNpbmcNCj4+PiAobm9yLT5hZGRyX25ieXRl
cykgYW5kIHRoZSBtb2RlIHBhcnNlZCBieSBTRkRQIChwYXJhbXMtPmFkZHJfbmJ5dGVzKS4NCj4+
Pg0KPj4gVGhlIGZsYXNoJ3MgYWRkcmVzcyBtb2RlIGFmZmVjdHMgdGhlIGFkZHJlc3MgbGVuZ3Ro
IG9mIE5vbi00QiBvcGNvZGVzLA0KPj4gaW5jbHVkaW5nIHJlYWQvd3JpdGUgYW55IHJlZ2lzdGVy
IG9wcyB1c2VkIGluIFNNUFQgcGFyc2UgYW5kIEluZmluZW9uDQo+PiAoc3BhbnNpb24pIHNwZWNp
ZmljIGhvb2tzLg0KPj4NCj4+IFRoZSA0QiBvcGNvZGVzIGFsd2F5cyB0YWtlIGFkZHJlc3MgbGVu
Z3RoIG9mIDQgcmVnYXJkbGVzcyBvZiBmbGFzaCdzDQo+PiBhZGRyZXNzIG1vZGUuIEluIHRoZXNl
IEluZmluZW9uIGNoaXBzLCA0QiBvcGNvZGVzIGZvciByZWFkL3Byb2dyYW0vDQo+PiBlcmFzZSBh
cmUgYXZhaWxhYmxlIGFuZCA0QkFJVCBhZHZlcnRpc2VzIHRoZW0uIFdlIGRvbid0IGhhdmUgdG8g
ZW50ZXINCj4+IDQgYnl0ZSBhZGRyZXNzIG1vZGUgZm9yIHJlYWQvcHJvZ3JhbS9lcmFzZS4NCj4g
DQo+IGJ0dy4gdGhpcyBpcyBhIHBpdHkuIHlvdSBhcmUgdXNpbmcgdGhlIHN0YXRlbGVzcyA0YiBv
cGNvZGVzIGJ1dA0KPiB0aGVuIHlvdSBkb24ndCBwcm92aWRlIHN0YXRlbGVzcyBvcGNvZGVzIGZv
ciB0aGUgcmVhZCBhbnkgcmVnaXN0ZXINCj4gb3AgOi8NCj4gDQo+PiBTbywgSSB0aGluayB3ZSBu
ZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhZGRyZXNzIGxlbmd0aCBmb3INCj4+IHJlYWQv
cHJvZ3JhbS9lcmFzZSBhbmQgZmxhc2gncyBkZWZhdWx0IGFkZHJlc3MgbW9kZS4NCj4gDQo+IE9y
IHdlIGtlZXAgdGhlbSBpbiBzeW5jLiBFLmcuIHN3aXRjaCB0byA0Ynl0ZXMgbW9kZSBpZiB3ZSBh
cmUNCj4gdXNpbmcgdGhlIDQgYnl0ZS4gR3JhbnRlZCwgdGhhdCBzb3VuZHMgbGlrZSBhIGhhY2sg
OikNCj4gDQo+PiBPYnZpb3VzbHkgd2UgYXJlIHVzaW5nIG5vci0+YWRkcl9uYnl0ZXMgYXMgYWRk
cmVzcyBsZW5ndGggZm9yIHJlYWQvDQo+PiBwcm9ncmFtL2VyYXNlIGFuZCBzaG91bGQga2VlcCB0
aGlzIHVzYWdlLg0KPiANCj4gWWVzLCBJIHdhc24ndCBhd2FyZSB0aGF0IHdlIGFjdHVhbGx5IHR3
byBkaWZmZXJlbnQgcnVudGltZQ0KPiBwYXJhbWV0ZXJzOg0KPiDCoC0gdGhlIHJlYWQvcHJvZ3Jh
bS9lcmFzZSBhZGRyZXNzIHdpZHRoLCBhbHNvIHVzZWQgd2l0aCB0aGUNCj4gwqDCoCA0YiBvcGNv
ZGVzDQo+IMKgLSBpbnRlcm5hbCBtb2RlIDNiLzRiLiBVcCB1bnRpbCBub3csIHRoaXMgd2Fzbid0
IGFuIGlzc3VlDQo+IMKgwqAgYmVjYXVzZSBlaXRoZXIgdGhlIG1vZGUgd2FzIHN3aXRjaGVkIG9y
IHRoZSA0YiBvcGNvZGVzDQo+IMKgwqAgd2VyZSB1c2VkLiBTbyB0aGlzIHdhcyBtdXR1YWxseSBl
eGNsdXNpdmUuIE5vdyB3ZSBoYXZlDQo+IMKgwqAgZmxhc2hlcyB3aGljaCB1c2VzIDRiIG9wY29k
ZXMgX2FuZF8gd2UgbmVlZCB0aGUgc3RhdGUNCj4gwqDCoCBvZiB0aGUgaW50ZXJuYWwgbW9kZS4N
Cj4gDQo+IEkgY2FuJ3QgdGhpbmsgb2YgYSBnb29kIHNvbHV0aW9uIGZvciBub3cuIE5lZWQgdG8g
dGhpbmsNCj4gbW9yZSBhYm91dCB0aGlzLCBidXQgSSdtIHByZXR0eSBidXN5IGF0IHRoZSBtb21l
bnQuDQo+IFdoYXQgSSB0aGluayBpcyBjbGVhciBpcyB0aGF0IHdlIG5lZWQgdHdvIGRpZmZlcmVu
dCBtb2Rlcw0KPiBoZXJlIGluIHRoZSBzcGlfbm9yIHN0cnVjdC4gbm9yLT5hZGRyX25ieXRlcyBm
b3IgdGhlDQo+IHJlYWQvcHJvZ3JhbS9lcmFzZSBvcGNvZGVzIGFuZCBub3ItPmFkZHJlc3NfbW9k
ZSBvciBzaW1pbGFyDQo+IHdoaWNoIHRyYWNrcyB0aGUgU1BJIGZsYXNoJ3MgaW50ZXJuYWwgYWRk
cmVzcyBtb2RlLg0KDQpIaSwgVGFrYWhpcm8sDQoNCkNhbiB3ZSBkZXRlcm1pbmUgdGhlIGZsYXNo
J3MgaW50ZXJuYWwgYWRkcmVzcyBtb2RlIGJ5IHF1ZXJ5aW5nDQp0aGUgZmxhc2ggYXQgcnVuLXRp
bWU/IElzIHRoaXMgcG9zc2libGUgb24gU2VtcGVyIGZsYXNoZXM/DQoNClRvIGV4dGVuZCB0aGUg
aWRlYSwgd2hlbiB0aGUgZmxhc2ggc3VwcG9ydHMgQkZQVCBhbmQgZGVmaW5lcw0KQkZQVF9EV09S
RDFfQUREUkVTU19CWVRFU18zX09OTFkgb3IgQkZQVF9EV09SRDFfQUREUkVTU19CWVRFU180X09O
TFkNCnRoZSB0aGluZ3MgYXJlIGNsZWFyLCBhZGRyX25ieXRlcyBpcyBmaXhlZC4NCklmIHRoZSBm
bGFzaCBkb2VzIG5vdCBkZWZpbmUgQkZQVCBvciB1c2VzDQpCRlBUX0RXT1JEMV9BRERSRVNTX0JZ
VEVTXzNfT1JfNCwgdGhlbiB3ZSBjb3VsZCBkZXRlcm1pbmUgdGhlIGFkZHINCm1vZGUgYnkgcXVl
cnlpbmcgdGhlIGZsYXNoLg0KDQo+IA0KPj4gRm9yIGZsYXNoJ3MgZGVmYXVsdCBhZGRyZXNzIG1v
ZGUsIG15IHByZWZlcmVuY2UgaXMgdG8gdXNlDQo+PiBwYXJhbXMtPmFkZHJfbmJ5dGVzLCBidXQg
SSBzaG91bGQgcmVuYW1lIGl0IHRvIHNvbWV0aGluZyBsaWtlDQo+PiBwYXJhbXMtPmRlZl9hZGRy
X25ieXRlcyBhbmQgcmV3b3JrIHNwaV9ub3Jfc2V0X2FkZHJfbmJ5dGVzKCkuDQo+IA0KPiBJTUhP
IHBhcmFtcyBzaG91bGQgb25seSBiZSB1c2VkIHRvIHN0b3JlIHRoZSBwYXJzZWQgKG9yDQo+IGhh
cmRjb2RlZCkgcGFyYW1ldGVycy4NCg0KeWVwLCBJIHNoYXJlIE1pY2hhZWwncyBvcGluaW9uLg0K
DQpDaGVlcnMsDQp0YQ0KDQo+IA0KPiAtbWljaGFlbA0KPiANCj4+IMKgc3RhdGljIGludCBzcGlf
bm9yX3NldF9hZGRyX25ieXRlcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPj4gwqB7DQo+PiDCoMKg
wqDCoMKgIGlmIChub3ItPmZsYWdzICYgU05PUl9GX0hBU180QkFJVCkgew0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5hZGRyX25ieXRlcyA9IDQ7DQo+PiDCoMKgwqDCoMKgIH0g
ZWxzZSBpZiAobm9yLT5wYXJhbXMtPmRlZl9hZGRyX25ieXRlcykgew0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbm9yLT5hZGRyX25ieXRlcyA9IG5vci0+cGFyYW1zLT5kZWZfYWRkcl9u
Ynl0ZXM7DQo+Pg0KPj4+IEF0IHNvbWUgcG9pbnQsIHRoZSBtb2RlIGlzIHN3aXRjaGVkIGFuZCBu
b3ItPmFkZHJfbmJ5dGVzIGJlY29tZXMNCj4+PiBwYXJhbXMtPmFkZHJfbmJ5dGVzLiBJdCBzZWVt
cyBpbiB5b3VyIGNhc2Ugbm9yLT5hZGRyX25ieXRlcyBzaG91bGQNCj4+PiBiZSA0IHJpZ2h0IGZy
b20gdGhlIGJlZ2lubmluZy4gV2hpY2ggYWxzbyBtZWFucyBub3ItPmFkZHJfbmJ5dGVzDQo+Pj4g
c2hvdWxkIGJlIDMgZm9yIHRoZSBvdGhlciBjYXNlcyAoYW5kIHByb2JhYmx5IG5vdCAwKS4NCj4+
Pg0KPj4gV2l0aCBwYXJhbS0+ZGVmX2FkZHJfbmJ5dGVzLCBJIHRoaW5rIHdlIGNhbiBrZWVwIG5v
ci0+YWRkcl9uYnl0ZXMgPSAwDQo+PiBkdXJpbmcgU0ZEUCBwYXJzZS4NCj4+DQo+PiBUaGFua3Ms
DQo+PiBUYWthaGlybw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
