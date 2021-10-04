Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12074C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 11:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0ED06120C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 11:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0ED06120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jv9UsvD/yW/d+UKAy7FizWqx3sz0xYs4/mpN3SCIRUw=; b=H3wmBNX+HjBJ1U
	UFK910aJWLhNvBBZmAxJEV2N9lBzPtxITYx5orD8hagrVcXt6CKvbvJOdhFHk1M54dsaeoVOdnhtw
	1XHkyPOjkL0G8nuanSkvI8rW7XkDNgo/2G8TWj0Pw9Rtwdd8Xd/Y2OhbaMujKvE972dVHiP7Hhv+G
	ztHn6VrcFP+FwbFIZxuNf8V3LuyOoIjzWvu8M/wGZvN+3imppTE9SX6H3fH0BzFCj/MWSrTtP/xiB
	I1/jq9QfMjjQ6j4EkbyMQfvFUBMngC/r7IzqQJSlURk8hZAg+GiWcPNokXhmAfcTmhB+twp7CQ3zt
	AkfCw2vVvaLJOH4xPJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXME8-006DG3-P3; Mon, 04 Oct 2021 11:33:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXM73-006AHF-Cp
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 11:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633346789; x=1664882789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tq4RQxNypt1LwjRP+N0A57ajPMyVAagSGhw5OGb+6r8=;
 b=daMgPu13f4P2nsLSix9jPxkSuIxFUWcwKTUpt9lQ7Kwq48Ox5L1Y26PQ
 JFNn8xxsr5YndB20KBva7yo+1uWzYblyW8wonxRfxuMUaQi/mRUBCihyO
 8I0GH9ACawB17XnLiIIP1QuatxTZaLOCHUNqWv2ooNbNC0kd6lmOW9+R3
 v2ZoWBW/5wWOMOlr29pNRaHKE6Z4lnW475gD60GvRzSQkVy/Coy1AFB9E
 jT/H8XzyUdk+S0vABuqMH5p8nmvJGDP0iLpWGtLUCVLvNs8Zydct02Qf2
 NJj3jnQhlbNTC+RtDVQhTttzLevZ0DgUXK7Kny9CpxQDtMLymXLdRrpMA g==;
IronPort-SDR: KE14AikJEBiUlQ8fnUTWEPXszixF264xJUMGfr+KFxVKwNTaVH1tllTZSA1PU9bRlnVuyyHhkT
 KFozPB6pgfWZHGRfGBy60qSPb6KLQJJbOEF80zBWk/19tK29veGFuwrbprSSU0jcbmSdeQhLB1
 0nOnUGOqPnSSwJtg/GwsiT06spTSXHeAUi+CxkUc1dIpu+j+OywLzOTpYvMpfgFhZArhGwEgEs
 qJuOfPBh/44qR5cSK48KOgXMuE3InnoCI57DeHRKl/ij+D1IqKggGjAdD7rR72Yftl8cwPIt5D
 XIUOfFUPgfwpJW/t8ERwBXcM
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="138356717"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2021 04:26:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 4 Oct 2021 04:26:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 4 Oct 2021 04:26:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzY9tIMeUCqfWiDq3sTWlLBn4s9HUnaiesn5iVqe5oCwnTijprRA+XMS/lALTQ+hzwiyR61ZtKkn3quVqUgayS8AZVl3I08f7QbECVnbWXa1pvEu+4xglJ5FX7hzj62xNxbIM3KmU6mFUPmzHIisbAHm43loH5g+7GTHDFeELytJ003YFIJr4YwyuTTlmpVuiqFj3ARX26l8H6riibErIoMGTxY5jPPXtnQZUIR7Fz3rvSO/xJCi+TYTbS/MYcukjDPEFmim6sbfNU47+J2oeUY7eRR5OHBLlnJUzVlSPF3MOsT1Z4BvE1+wKZ/YrkF3SnhzEVgwqEcAcg6TxKB90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq4RQxNypt1LwjRP+N0A57ajPMyVAagSGhw5OGb+6r8=;
 b=Y7Vlgh3sOd3ZEhWEQWW/3jW7ValPA7YoY+VySVPabNqp1Nk4kzNrC7brS3bIspVeNn9Q7a+bxyBBJOK91sPMYrzxN/yoAuG50/d/1acVD1Rys+Ch1Ie6hw6OX2F70vkHftqcBfFZ/v6ae9f2efsvbRGgxZQSj/fuSDw3H8V7ItPZDdMVg7JufH7airO1dYXi+R8nGJpxZxqizBraoM7oDJGr/EpkOIdurJc52NNNjDn+9k5KZRcLwS/a+3Ab0lw+JhXiPYl9gGT9JxMR+q0FNxNiloRuyusCEnaBzDR6Vcg/bwEzS+feYF7Mca9tR0JdeIrf8W1l1XRKaM3xvRpEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq4RQxNypt1LwjRP+N0A57ajPMyVAagSGhw5OGb+6r8=;
 b=eVkq3fm19FPdZ0JjGYTHTiUusMwX4FvSr2DXW5vEBr6tkufLGCVnPsfX4RBaqw1VOBDf0fahGB04hpGpktdZ9PLsi8FXy4Xl5ioA9SkBkf1ipwmO6uxCn3PS4CUHnR77URvFJapAnuAtc38Zk23R3Zzvm1Fp499QoS4tqmW7M78=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3342.namprd11.prod.outlook.com (2603:10b6:805:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 11:26:26 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 11:26:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Alexander.Stein@tq-systems.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <robh+dt@kernel.org>, <p.yadav@ti.com>,
 <michael@walle.cc>
CC: <alexander.stein@ew.tq-group.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: micron-st: Add support for
 output-driver-strength
Thread-Topic: [PATCH 2/2] mtd: spi-nor: micron-st: Add support for
 output-driver-strength
Thread-Index: AQHXuRKr7GFrLm4rUk2FxXfPSxknrw==
Date: Mon, 4 Oct 2021 11:26:26 +0000
Message-ID: <c3490462-9f07-9f69-ecc1-e51b61622ff9@microchip.com>
References: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
 <20211004111529.211089-2-Alexander.Stein@tq-systems.com>
In-Reply-To: <20211004111529.211089-2-Alexander.Stein@tq-systems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: tq-systems.com; dkim=none (message not signed)
 header.d=none;tq-systems.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783c01ab-1a31-4421-a583-08d98729cdce
x-ms-traffictypediagnostic: SN6PR11MB3342:
x-microsoft-antispam-prvs: <SN6PR11MB3342B37103D27ED318CE7045F0AE9@SN6PR11MB3342.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ABUNQfSvEa/ofFwsDZuz4W+V+z3lJRklBi5204QrRcHuQHpmFytflL7wvpfdt0cf4z9MM7xC/uBKgHHNJKJ+e59aYTAEhQR0Fickcdx/SY3DcdAjx/Hi7T3RwVb5+z12U1xEtm7taU9sGaxao/UZON10N30385PSVqP0DtSbDaic1c5hbhwdwpQE4tUl2LMoczZ7ZU9jXpSlRaylTsds4po2a/q+e5cNaJwDKmm9ORBnyuhKVtAtRAG4to/ZI1QSshFWyFt5/yxW3Cvwpoew+ndiXxyi36QoB1K+KkfoHimtkKVt9O81MsCAeYJqkl8Uhsk7336HjUM70mhVQFMKYdxXrQnRKpUgCW2hmaqao5q0c3HJcZNqYHjzcaVOce+AHMVoMSKfakB3/94mn+1BYKS8l0Uf0bLS8p1H7arMjMHMjLEgquenaKdlj1RDrNRVmWGIAUexf9+yeeOZ4P3HWdlbiGw+gGM204km9xw7abBd4Qgq7Xk2P6EqfJ32HHOsnvngdroODUKm8iIPVDHGkSWYVsd5eyaO/fkU21dXuS1If42+m5kwG16WJ6vSAKyMxvJxaJhVWZ0s+ARudHLBWEbZoSu3g3HQUo8ZfVqZ76U2CENE3c8rGDfRLix5kGGTH/oav+TtHY3KhxHiwEerGHrstwuKoAYAT79TI660vbEmK2YHypGx/MkLwi/M4oJb9PMQoZaw6H19AhUeQvnA4xKCFXVuSWl9WmRXyo4PhQtl11fTCHrIUI1hVtElToEPWlihuoZnfH6EwG0Kp1xaRQOxeoq/biKzslH8KXzG/vs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(316002)(38070700005)(31686004)(36756003)(86362001)(2906002)(110136005)(31696002)(66946007)(7416002)(53546011)(6506007)(8936002)(38100700002)(19627235002)(54906003)(186003)(122000001)(508600001)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(966005)(6486002)(4326008)(5660300002)(8676002)(6512007)(71200400001)(2616005)(4744005)(45980500001)(43740500002)(10090945008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlF2TjBjcmR0bEZRSEp0UEhEbitaY2lWRlIvRitiNWgwVlMyY2ZWRlRWWG1x?=
 =?utf-8?B?c2NERW0wMWI5K2NlUVVFcVQ0cm8wajdFUzdtck1FQmdwQmN1dzROVWR0cWta?=
 =?utf-8?B?Y0VJYWx5Z0RZUENRdXUrb1BaSWtVczd2OE5pVWVJQ0NaRHBpZU02bUh2ZEZY?=
 =?utf-8?B?cDdJTXRvZVRsa05hS1FzTUpCMlk4QTh3MExuc2FTUGNBMTVoSnJaU0lzbzBv?=
 =?utf-8?B?K2xIU2JaVGltZ2dLNjhKb2dtbWh1VnA4OERIQk1reEdGUjkwQnJpc3k3eUF6?=
 =?utf-8?B?TXZjRWVvbmg0VUg5QzMyTGdlMDY5dysvb0tTQ2pkMnJOZmx6VTNKTm42UFVr?=
 =?utf-8?B?STV0SWFUVDl2MkJMMVIrL3NzL1JJWitxUi9MM0FLUEVLSGdNT2NvRzA2M0ZB?=
 =?utf-8?B?YlRpQUwwRCtOZGxKanQ2VFl1VVJ2Y2xzMUFHSkpkejRmeG1wRzd6bkllTEdW?=
 =?utf-8?B?SnNlY0JodVl2RjJ1bjBjcUlwNEJpS3cxMFVJUGYrdmE5NU4rcHYyVU5ZbjZG?=
 =?utf-8?B?SVpiYnBJdGxuNDFwUVRDQ3dFUEJGbmVISjFzSmswWUNEUU9sWG1EbXRieHBJ?=
 =?utf-8?B?ZTF0Nm96cURhUlUwV0UveUZUbXZIUFdpYWl2RGlvS2NSZU9uRXFNcVVncXp5?=
 =?utf-8?B?Y3pUeHdwV29GY1Vuc2srdEpPR1F6N01EYnF6dWlrTlFYc0FNWG1pdzV2OVZr?=
 =?utf-8?B?S1VVMlQ2djMvQXc2RWFKZnRjRW9Nc2M4NUkzdWlaT216YWowdmJ0eHJXSjJN?=
 =?utf-8?B?c01iempxSlgxM1JINCs2akhBWTZMa2tXUHZxakNpY0doRWNSSGhpR0ZaOFZh?=
 =?utf-8?B?Vk9vNXd4THdTcVJQUDcrajNONU5iMnB1ZUMzay9kS3NSUWNWaGNUL3EwcWxQ?=
 =?utf-8?B?NG5ZeUhsTHByMFZ2RnpmUDdQZWlVbHBXcVUvRWk5QXNvako5WFp3bHdGWXBz?=
 =?utf-8?B?eTlXM2FncHpBUTN6bzY3RVhVNWZOOFlnSDc0QUdlWXBnbVFvbC8vNnhKTUNF?=
 =?utf-8?B?aGF6T2o4TjdYcG5SNjJ1K1pyb2xRcmtpYkZUc1VxV0JHVUpwVlRnVTRneFUr?=
 =?utf-8?B?c2lVS3d2VzF2OUNkUGdkZG1QSUNpcFo3dFRHTnhnOXpCWHQ0OWJMOHVsVHJ0?=
 =?utf-8?B?RHIwVVFmeHgrTXYvTlZjbXlWa2diNGs3UlQwUFpBMmdKMm1ZbUdJZHNrUWhl?=
 =?utf-8?B?b1Vua3J1L1pBazRzZjNEWkwrN0xzZUM0QW92aHFKbjJJa0RBaS9NN2NQY2U5?=
 =?utf-8?B?bnFWUnhPZ0dYaUtLUXh2WDBCdjdCNGl2WG1QNE5oMFdzY1RvTWRaZXl6Slkx?=
 =?utf-8?B?dkR1bmxVMWxuN3BvN1gwS3ZTdjBCK0gwQXpzU0dhZTJxbHF1aHA0MWRPcVpZ?=
 =?utf-8?B?YlUycXNqcUszTVNsTHBEdmNQakJyMDE4V3pQSVVYcGpTaUUzTkg0dnh2bGxl?=
 =?utf-8?B?b21PNm9rdXJCV0p0NlZNN0dVQVVId2s2cllqcnV3aVBIaHdsTnhoZmpETEZw?=
 =?utf-8?B?Q29MTmU3UUVKL2k4cHJ3RnNSZUFiTTBNQlplUjViT0VFR3hXTldNNjNEUVZQ?=
 =?utf-8?B?UmhneFJKZGVzNEVEaEFSa1NEWmpOSWZOTXdKZ01qRUF5Lys2NXorK0U3eTQ3?=
 =?utf-8?B?eEpMb1BkOWFJczMrOCsrVVV1Rmhsb3RQaVR2UzZpakRKOVQ0TGN1K3RzQytl?=
 =?utf-8?B?cHNLQldKNmt4ZFUzS3BxYWI3VmZTNkNPbG05RWVqMlF6bEY3RnN2L2V5MlBl?=
 =?utf-8?Q?xFK3QJ+O1/tiZ2HU30=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <CB42DF34B7A874469B20B5DDF71ACEF9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783c01ab-1a31-4421-a583-08d98729cdce
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 11:26:26.4443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syg0CN6RuoyTqKEhH2x27f2w7oLh0W7lKvsbUhJROgNPYN5EU7rjaIoHu8n+T3y9psb0OL2ebDP6bG3iYgD+tR6CfYXi6IXrx9e5JdxgfAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_042629_533777_55F6D175 
X-CRM114-Status: GOOD (  11.97  )
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

On 10/4/21 2:15 PM, Alexander Stein wrote:
> [You don't often get email from alexander.stein@tq-systems.com. Learn why this is important at http://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Micron flashes support this by the Bits [2:0] in the Enhanced Volatile
> Configuration Register.
> Checked datasheets:
> - n25q_128mb_3v_65nm.pdf
> - mt25t-qljs-L512-xBA-xxT.pdf
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Does the micron flash define the SCCR SFDP map?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
