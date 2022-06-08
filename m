Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76A4C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gAs9w3mHbXsy0KzFgo/Q/WAt23esaQZZeMN2c7FHAo=; b=0yl9wHIpa9JF7p
	BA3DYJXn4/Sxoe9WBKXGgMMTVhKrnxa3lSU/D8JcUNvSX9ngSzaMcBzB+igMINiSsTwHLM5jE0wgA
	A4nuANTLN9L6lob0Chu1KehiFQoDwE4cIbKdfzOBYe3JR+2WdXFlbAYoBJ+O/oMXHM6mWjijZ0ejO
	iJuOKJ595uB0in+cIBuxSqo3jOOc4V+eB1yddLuOXKqr7VH62D5qXJDnSF7Q16ZGFAY++HIBy5vQs
	KS6SIlcmUG0V5PeCk99xK59afxOunqEyn8m3qjrGoJ9NNcUk75SAMH7VzLOL6zRAztZV4rbvoQWKA
	fIhka2i/j/lIfe2VrQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyu2U-00CwQB-Go; Wed, 08 Jun 2022 11:39:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyu2R-00CwPO-0x
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 11:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654688390; x=1686224390;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YcJcQ/+MlinRg03zeZitcUElhw3TMs53rgCPKE/ofBI=;
  b=mu7dwRtG4+nEjPm+48mOTS1PAlGsvpLNrsHONI7Srcw6jTKShMcreGM/
   kKcSc3QnApiou/5rFiUoLkUqovZZpzi9Gd3o9ztFKsFt4MWTEeQWntL8B
   rCGjpSi1W2r7TDnUuMFPteDsdUeahzV/xYHB3DCYM3Mkb6iBwPYCdjLkB
   8KsolRVs7wQBnJNgEkPHptqibY3ag5W8rjV7MRqSnyhsdLlCEZtyBOsGq
   wCEwDipwimxkHSKkmtQ4bi9R3jTUneIleJtA/Z2fPZAJ7lpUuuYWxuaiP
   bzFgu2e843bJmmQSBcAVwbWP5IgIsbjSlmiVtehkZeSaZZKdC2Jq1K1bA
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="177053700"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2022 04:39:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 8 Jun 2022 04:39:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 8 Jun 2022 04:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6GbqUBm7rs0Q4xM8uVLNET1Vwc72DxTkPUx7a4MTxOC3JncSzVlgsy913zgn7O55fXLWGrjOyvC0zsYFjCUj3D4XuH6BcB973vvO7ptSdd+78pdqSDqN1WQhGeqQdfEBWFiQfCZysqVaKVjBdVs3OGZaYI1nllxccM6AGmr5VJu+yHGYi7+gMLilG+EQ9Ne18rbI/K2Lyfr0J6AY8HvIIpyaQI499uiLaWbyasl8CN/Ch3Qte0Yjud6rnCEPoiRVim695xg/ked+d78W++kzTiiPM0TAu1Ovvyif8Szt8OXIIddFZ5e09P+5voq6d++vfu+IVyl0Fc3Box5VdO5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcJcQ/+MlinRg03zeZitcUElhw3TMs53rgCPKE/ofBI=;
 b=TybvJAPxVMe/wXm9oPg4GO0xNZIPxeJGv5BLVxxKwN9UujFe8g85vDqRR7LAYE87bd+DShG/xp4qBTOZIfy85+w8iC9XoywmN4QZJ8Yi3jTSn4wDeoAsO92FAoNr2Opc/i1nXOFP9YBEZ3/7ylXu35NtlCqQKycvB2Od4MsPuzTQzGCZ3Q1djWKFsXNsnLqnT992MKwRZ7eyXKD4C/rmzf5Y76SKX4hvcqfn0MkDMfcWUj//0IAwTFv9QOV8DRzjDRVAwka3INrB00KGUy0o6JvtvbXphrDOtJVPZmCPLe+Wj4t+HFk4NW+bm9I0i/aWJnGrnWgdBHPNoBBo3mYCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcJcQ/+MlinRg03zeZitcUElhw3TMs53rgCPKE/ofBI=;
 b=fucXfED5eAjjPGd7zWb1iCkhhQODZK3TI/Z5QxDHMH4SEPtbHWR4xe2AmOo9epeHj5GdN6s4m8/nAmMVtyWnB6JglhjYrmvWcflbmQnS51H3mT7jueXzNwHof9yErmFiGt5QLi1sLaX/wSDjGQ/Dp4YicL1sf0t0iGctYyI7bjc=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB4075.namprd11.prod.outlook.com (2603:10b6:5:198::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.17; Wed, 8 Jun 2022 11:39:42 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::d9de:be6:d90f:392b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::d9de:be6:d90f:392b%7]) with mapi id 15.20.5314.013; Wed, 8 Jun 2022
 11:39:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYeyxxTEt+bD16DUaYd/6imLQaPw==
Date: Wed, 8 Jun 2022 11:39:41 +0000
Message-ID: <8333ceed-9445-4be9-4483-36c211822700@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
In-Reply-To: <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b445f29-36d5-4bdd-1a1d-08da494393c4
x-ms-traffictypediagnostic: DM6PR11MB4075:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4075C171FF8974B204FFA4CFF0A49@DM6PR11MB4075.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /MKJsebnhnMqr/JTKdnQvmjOm0M1b2WZfDWbhfxUmcx9IbE8504dqJk/Owit229wtK/CFFa7RF/w9LZ8TcShOL5kQFbCfoVsYXEKZLCj6dElMuBH6umoItToF2/Ghl6MY0hEyn7S9Qb8AjNmmfop5mYQlAk4QfEpFHj9UyaUmf7kFsDr906Bw79BP/RbB9kRAvPT2AI6CGfvpCCrY2b1WouLGkICTPsFw5Y+/ROBayW9U7EOK6LFaZhVvrGPCVThN+QOZHw35HfkyKHpbYbqcS/vt/eiirz1tM9cM/Up+K6ygdlvIxsHt8R5oXeWU7/3lOrAeJ+u1AmeMF3Wl/drOi2HYswoBdjzvnruWb/pluoKI0x2YuiSof4SLSbv0xmJbBHmZCbSib2SC8h/q/X0zXvwmywpmF/nRjvXcivAb0F8xtfcyorxnL6VJbv4dJdejFhxSEJCu9AwKVoN1zRZGIyerAT8gxAWT1t8QJMBhQL83E59WARNDMlQP5iBX7C4QUiVAQfpuvQ3hjJ+u+kCai1W1aZhbY035eAASxW5FvGnEvVp/Jg8qMZ7G08v9UCbgKexxE1MklfMJAvI0V1OMA1uYEk59lGFwnQsZadvufvtzPgmhjmQqrJXgivGrKaxLB7IKmDcVgDwy5C0grd5NOD+H755n63E3EjkbxKODwr/azsvJAnsAhGIab1E/CylUhX3rj1lTtIb89ZG0BDDwG9GUOqtxCCVbwNzh2DrFGwimGQYhUct6xlJvLCAyHsKoo/rTvHOU7WHtCWCPJAE3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(53546011)(38070700005)(2906002)(6512007)(26005)(6506007)(110136005)(71200400001)(86362001)(6486002)(316002)(31696002)(508600001)(54906003)(38100700002)(66946007)(66446008)(91956017)(122000001)(66476007)(76116006)(66556008)(186003)(31686004)(8936002)(2616005)(8676002)(64756008)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGw5TUdXdDNvWEVkVlVNZWd3T3BBSjY3UWpHTVRKZlR4OHdjU2pWaUhuaGdY?=
 =?utf-8?B?WEowUjQzYUYramhWQU5KU1Yvd1RaQjFGa21RUGFTbmk0aTF1bjg0MGl3eXN4?=
 =?utf-8?B?aE5UUHFOZnYxVTc3andxbFJuK2p3Q3dqa3FSNityMTJRUUQzVU5iZDlOY2NR?=
 =?utf-8?B?OFJoVFd4blpQdXJXZ1EvWWlUMUhsdXBKbkw2c0pEWE9nbDlZcTg0TzVEbXky?=
 =?utf-8?B?c2o5Uk9VQjllNEh1dXd4NkxjNjlRR0JxWm5odEJIUk5EbWR4em9kcWt1TGla?=
 =?utf-8?B?eUpSaGptUzFZdWtvNUVkRFVLUm9UM00vL1ZKcTh1aXZnS1BRbDlKSm9ta3lw?=
 =?utf-8?B?dk5BN3gxZW9lcm4wNTEzejlIbVUxZkFIZUlFcWVER0M4MHhkUGpCN3l2bWIw?=
 =?utf-8?B?N2NYdXJ4UFVUaDBLTkthNlcrK09GUEdDTm91ak4yMmRLT210TUp6Ti9qd2Rv?=
 =?utf-8?B?WGk5Y2NFQkpHZ3JwelkxSnpHc1VOWjg4SitDYThsa2p4Tk1XdStRZExuMyt6?=
 =?utf-8?B?eHdtanlaY0ZKMUFXOE5VTU1ScStxUWgyYVFmVkhSRDNGNFJzU2M1WWhUTlM3?=
 =?utf-8?B?MkdlMFRXU21nRitBLzExTStTZ1l0NE9xNlg0bDEzcG1vTTFuV09ac3Z4Vi9B?=
 =?utf-8?B?WTBneTZJc01URUZDam5BMEhPYnpiQTdtWW0yMDZlcjNwN3hQZTQ1S0tEcWQ0?=
 =?utf-8?B?VU1ra2haZ2tnNWNhQytjQUkxTkFpeFQ1YVM4NUFUaVhMS1puTlo1UjRRSzlp?=
 =?utf-8?B?TDBTNFEvOWRCanZjdXRXYlZmbnR5TVBBam4wSkRYTUhYZE5vVnJ2SVo1azRM?=
 =?utf-8?B?YmhpWU9HWHk1MVRVYi9RL0FPOGlYVHhSelZ4ZklzejBCQTJPd05SL1V1bFVP?=
 =?utf-8?B?VU80NVRnakVSTWhmdElwRjlKQUdFVDZYakRzc2krWTNQZGNXbDl1Sk55MXp4?=
 =?utf-8?B?TnFWalVvYUtWZ29ac3dSVUl0Vlg2dDZaelRDWnFOaFErUWg0ZFBzS0FXcXZO?=
 =?utf-8?B?VUJyTmpOSFpLN1kyM2tzMXRuWEZHVm54UEpoY0ZYMFdycExBbXhCTktFYmFP?=
 =?utf-8?B?L3dBY25EaEE4YVQvMUFIbCttYjU2emdzQm4ycHFjMjBUWC8wQU43K0tlQzF1?=
 =?utf-8?B?UllhNVdsWFR1SXJRL3Q0RGNHNmgwKzFsYVNKVFBMb1lKVEZDd3IzMnZVQmt2?=
 =?utf-8?B?dTVkeThZQnN1ZFdKMzhTa3pSeG9DYzBpd29oWVVBQ1FKelJFUllIekw5K3h1?=
 =?utf-8?B?YXNobDloUncxcUY1K0JEOGVERjdYQnVoQkkzK2FIRVV0ZEllaGkrbm16NC9u?=
 =?utf-8?B?TjArNk42R3lFd2FHRWh1bWkyZmxVL1hUSlVCN09GTUhrZUgwaWEzdkZGT0pj?=
 =?utf-8?B?aW5rZEF0RTFVQmc5dWZxdXNtaVhJTWNIelhYN25RZkd0QjM0Qzk3bW1CVzV5?=
 =?utf-8?B?MVhnQmhkcXhQdnJnTzAvVGRMR3NJM1NQekRXeVZkWXdRQ0hKdFNTMS9RQzhY?=
 =?utf-8?B?bEZEdkpyV2llOUFzbDBJYXFNd0ZLZVUrNUdYamZoMDhoNW9QdjVpMjdQbkxw?=
 =?utf-8?B?ZURCcWVKOWdtQWZHU1lpcExxeE9hVU8yYTE2Nlgva2N4NkRSQ1dXWGNBaEls?=
 =?utf-8?B?ajhaK1dVNUVlZWxGQzBxYWI5YXUzMmhqUEZFSGp5QzNHUGlZRktGVzFUSzFx?=
 =?utf-8?B?ZEduRGYzVkc4WVdqdS8vQWJNR3dZYnNTOVNkQWR6bU5XN1JZTjBQbVhjS1J4?=
 =?utf-8?B?MGdsRHlacTFPeU02MlU1S0VGRWpkeDNtRXhFWEFXOWlQN1d3V0RFcGNLa1Er?=
 =?utf-8?B?N29wa3ByUnB3Z2I5ZTNIRGJ5NmtzOTcyaG1FYk9zVWRMZGtLemV5NzJaK3lT?=
 =?utf-8?B?QWpOd0NPMEI1ZVVKNFQ2T3ZRVElMR3lPZ0hUWHJzSU1iM3J1Tk5hNDRCWG1j?=
 =?utf-8?B?eVlJRVc4M211Y3VuTWRBZGovWjJIbVZyVzgydHppem04SEpSV2dsL21PTmhR?=
 =?utf-8?B?UW9RRmhIVHNWTnZLdWxWZ2hJS25UbXBobEpUVGx4ZEFDK1cwaVAzN016c2Qx?=
 =?utf-8?B?b25WQ1lMVWl4ZmJGNUtTcUk1OGlsTEl3TkNGTm91eTYzSnhlVUhOTTBGU3Fv?=
 =?utf-8?B?Uy9MNXlpNVJvUUcydmlXU0ZQTzE3dnQyWFA3eGhMZ2JJczRGR1lvSWliVmMy?=
 =?utf-8?B?L1pjL0FFc0YyKzRSeGg0YkhwLzcyQ2NRbGhXSkJPQUpQNGVycjh1L21kTlJ2?=
 =?utf-8?B?VkRPZXkvNUN0SnRhWlAyZGIyME9Cb2hvOWRqNlJDa3ZRZVdhTUlUZkZSVHkx?=
 =?utf-8?B?S0t3QlFId1pOVXJCV2lrQy9OTTUzeHhyWlI1U3k4Uk1mRzBQbnpabzNWT0tD?=
 =?utf-8?Q?Jc1auWIXYXDrdFWY=3D?=
Content-ID: <A5BA21348316DB48BFB1BF43524091AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b445f29-36d5-4bdd-1a1d-08da494393c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 11:39:41.6772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uc5gTFd8Gi545899P2oauDc6jA9Zawobw4jBzDyRk/gbw8VEnljwRYcnSobpOfEHejrtHSgIMT0SJ129H+VlNKBE02q4Vd4N7o5CbRFr834=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_043951_391861_BCA91E54 
X-CRM114-Status: GOOD (  21.39  )
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

On 5/14/22 06:51, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 5/13/2022 6:40 PM, Michael Walle wrote:
>> [btw the subject still has the old name of the addr_width]
>>
> Yes, it must be fixed in next rev.
> 
>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>
>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used as
>>>>> current address mode in SMPT parse later on.
>>>> Mh I'm not sure this is needed at all.
>>>>
>>>> SFDP spec says
>>>>   Variable address length (the current setting of the address
>>>>   length mode defines the address length)
>>>>
>>>> and
>>>>   When the length is defined as variable, the software or hardware
>>>>   controlling the memory is aware of the address length mode last
>>>>   set in the memory device and this same length of address.
>>>>
>>>> We don't set any address mode until all the SFDP parsing is
>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>
>>> Actually there are some devices that have variable address length but
>>> 4 byte mode by default (I will work on those devices after this series
>>> is settled). To support such case, I prefer to use params->addr_nbytes
>>> as current address mode so that I can fix it in post_bfpt_fixup() hook.
>> Are there public datasheets available? So these devices have a 3 byte
> I will send datasheets to you in another email. At this point, only
> summary datasheet is available in website.
> 
>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
> Yes.
> 
>> like it should be fixed in a different way. I'm not sure the "current
>> mode" handling is correct.
>>
> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and check
> the flag in BFPT parse. Once I send another series, please review.
> 

Sounds good on a first look. We can consider nor->addr_nbytes of value 3 as
default and change it to 4 when such a flag is set. But you don't need such
flag in this particular case, don't you? Also, can the default number of addr
bytes be retrieved from SFDP? Anyway, let this for later and respin the series,
please.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
