Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF42C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 11:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9F56120C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 11:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD9F56120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDVTRZoJoN8szOJLLKrvXVwYZtsU/hropGOeJCW8gH4=; b=Zms2Q5JOa2KtLZ
	//OPziUeOl4UjiZ3SqmgMFITqUt2Gr2OSp1jv+ieJ0YBLWsfWUecCF7lNZTuij/tzJvdI9EExEGtO
	IwakQfCfV6uY/9vL6KjoTx+hlcx77PH7Pzxv8I5B53ViTjzG128LW7pYlxy1XGfggrj93Ef2otpkH
	BAHvSrOzMrulyFB9MAL49bpR/jac/L65iQa8733EFjn7UmqrRcp0D/5dmeYy33Jsq6VNNcewLGF0b
	zVMNDIYxKoO9ZXkE/tZL+EVkKjehXU0IhR/94fO4j/CE+BqBuopsiSfCtUGnqzwjiFHRLOffe+UPq
	lvOLURJ6lSAgq17d7pBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMCz-006CuQ-0j; Mon, 04 Oct 2021 11:32:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXM6C-0069ng-Nj
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 11:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633346737; x=1664882737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/WxbJ0TW3jwL6GDerdPE+/BpVljQmH2HLNccqob5vbU=;
 b=G66nWoDmVFB6c81i7eQDHnPrWMAJACZyTOMDBz2ZuVPiQIhSAvIKoCBq
 LExDEPXdyqmzrZKQd/AJ9k7p4U9KzaxePFERIANEIpNA4Q7nOf/xQSL+z
 MTwODGbKrg1JRfXhJQCTljA2M6Jt6c6IquAjhI9xk+njlaZR97FOS0m0d
 MkzkxeVJ6T7ivKaqTzLWKQ/Vqgz38HdOf8cspHcBhDXR6TpZO3Y6uve0X
 V6Izq8Q1Mp80Tor6t/MVzh+vqSLIhBCw/roAcp980Q+P01nUVBuS3XRPy
 7672DBE9hYVizJALQQVm+VvdRB64mTQxvblZz8fWOUto8gc86HVrNQcMn Q==;
IronPort-SDR: DsPrC8LjHRpo38WFbNYqrO1+xnceJJzQcTvsLOs+y/NYO4A0JLibIvtQ6AbyQ8s5Z2y631R6Wa
 a7HE038m+kEOH2lEU1APZONzuC31OPH4DiuA+Btt3v/FF78vABC2DEh829CwoYt1mLH0D/xHNa
 ZfoX7OuX1VdmSF+iUBUfcZNNR3pAqyYLLG3+pv46YckRyb77rpyFfea8glJj1kdrFo/FT6NrK+
 CPYkUyk+WAdxoZSFTgV1rr1Iq1JqREPaetrTDxm7NJjmnhjDm6/2fG6pRPuuJ8IKfDML9MMoUi
 Xnh4l+sGKv+6/bw/U1JQ0oQA
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="134166187"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2021 04:25:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 4 Oct 2021 04:25:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 4 Oct 2021 04:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d36UiUIvdGMy4Uz85ip9r5e5XgNgCr04bPGYD5BgHBL2vRSgnw3rtzIsgH2VxLRX4dZqJoqoRqiN5SiybaYnRicyXY0zCm4jWfIuyS+xrv9LaLFJq1usQc0WC/pWHBgWpzqxB4Yw+oM6JqluwYzwzBJELMEN6OYzQi9xEbabUuKcYWTa22aLh8vVGZQQa/Zz8Hj/8nJIWLMz/Nd9p3IksS1vVhKBsYtvoV1NWW9rRM3Bw1SDrJyPOVOmlIR2Sy1EaH2FsOpj9NklF+YU8jS1px84MJXW4RX+LNBl83IL9ak15daHbTaQB0AhnpCzuxEpHivjTEmZFZaR63mk+zw02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WxbJ0TW3jwL6GDerdPE+/BpVljQmH2HLNccqob5vbU=;
 b=ZrMqf5j6a/oJR8iUX7/t+0U56i8dECs9gwYY7fzMMxzKNHib7DHhVR3gcM87ugPIkIXprmS3tVSJ9CRDSc4Nh8dFC3MBCIQb4woMiEu3Yx/c59cvidd2iTFN+a6ft+xQf0JcrPzKigkqJtJJN2srEhnb/LvNCvuPEv8P1fXncWZxYCNwpT19GReEFzQPGn2Uh0YEF9x90yv8R58uaL1nrmbXetfsValpFQHA0rpWT4nheDdbrAgKTlI/Dptpn+U9QkjKvQbfxJB4s9JN8sRg3fUGGGrdeiNlHY0wZXhG4ORjaBFgPRPVy0cVXezIxJ++s+J+y7wtIBWS5hesNcwYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WxbJ0TW3jwL6GDerdPE+/BpVljQmH2HLNccqob5vbU=;
 b=fEiCf94c+LRHECVXVst4TebZuEByaUYL/NNAvlCjgZgNl9LRQhzHs1AAytPGiCpgCCZ3nDWKZJVSz9GnQ1fe7LN5LMYFpKEQd4DNnF9GgeFT0Kh0YEqqUmy6Z9IEQso+iA2eUBhQ+/e4gcCDKMoZ+k1JQklB2p8TfIWr1j+8W4c=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3342.namprd11.prod.outlook.com (2603:10b6:805:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 11:25:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 11:25:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Alexander.Stein@tq-systems.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <robh+dt@kernel.org>, <p.yadav@ti.com>,
 <michael@walle.cc>
CC: <alexander.stein@ew.tq-group.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add output-driver-strength
 property
Thread-Topic: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add
 output-driver-strength property
Thread-Index: AQHXuRKJEfK6sY4eYEy/lIjeBL2qZg==
Date: Mon, 4 Oct 2021 11:25:29 +0000
Message-ID: <0cf4389f-cb91-44aa-a4be-48878d1221de@microchip.com>
References: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
In-Reply-To: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
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
x-ms-office365-filtering-correlation-id: 48838256-f9ac-49b0-c251-08d98729ac08
x-ms-traffictypediagnostic: SN6PR11MB3342:
x-microsoft-antispam-prvs: <SN6PR11MB33428CD1E0386BFFEF4A0016F0AE9@SN6PR11MB3342.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qcDilpYpejBdxC0f46is3okD1g+hwLCK+25fSV5wrKTYZE4rQUi47bk8J9dIV0tFD1lPEMYemWu9hT13a8kPbDhZ334BF2drU7HlySNlKfQtYu5h8TR1CsUVBdoseJoYmZmk+XUoozCif5j6h7sONGvrvWaMlsKL1AHfaXOFVcDHhRYEwwwWQwry316qPY/8ti6zrohZu4BzWv9cpZITSYlvpJbbKjhInKcb0mnKv9SZti8ClYnOCkhmOZEImusADWi39FLXXIX9WBpS7ZvMr0Lw6kWurN3mBNanGh5HYDO9lqTaGjve3rD+VpdC5Nt5mGVPQP5Hrk6yuxM5Oe/MSVdqzOf8/MigBuv00jvBSrq2/puWC/YR5IiKA08g4dJy/+wTLzob1eotLB1NV/v5G7ziBoL+3UKcHqtb/lQPf5wYEmonj4cD+2Ay3FCQXDSaxFnpanNqgpjeGzb5GT+tLUz8NthFvrJ9tkUchZ6hIrR2kYAmrdxsGXzWLCGdPAG9aeYOwVqQe+sg+PuIkA8O7L0AVVhob/VeNpCuzgU3BN0WqPk2+i06t8H/j7D9/iIOaJXarbOkOqC+l/3B+CQpta6wEunUECT6VTnd/vNYPxBL6cbYlm326nx69QoIZ9VaxorU0ZZ1TdkkW2xE+TQH5Ce07WOgXKC6Nz4q6pO6Ebr6ZpzS4Nx2p0zq18ltNPCFEC5p+zWuwektEILIvZpw5peiKIbHt/LmInKL4u8pfF+VszpRIw11usoC9PiYoGSK/8K1OSLIaTkuDuH5fK+ia03CoEqGCF4SEP7HfZukmxCRTxgJz+mciJrbnRrxtyQl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(316002)(38070700005)(31686004)(36756003)(86362001)(2906002)(110136005)(31696002)(66946007)(7416002)(53546011)(6506007)(8936002)(38100700002)(54906003)(186003)(122000001)(508600001)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(966005)(6486002)(4326008)(5660300002)(8676002)(6512007)(71200400001)(2616005)(45980500001)(43740500002)(10090945008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjhldlhqckpQS1lpNlIwRHdyZU1tM09lZVg1QjBmRGRnYlRnbTdNOXUrY0tS?=
 =?utf-8?B?aTNXaFlFS3hzUUQzMmw4elg3d21vN21RWWFZRUh1NlZGb2M4WHBuM2Y1YTRN?=
 =?utf-8?B?ZjRhZkF2TEpoZlgxNm9iTVJHVFVSY2cvRit6ZEZUdU5xNE1TaVJ6VVFNcTNJ?=
 =?utf-8?B?elNWTmZ3bUxScW9ka0orNjg3K1VaVzZZYUhXUE1uZW81aEpDcFJ3R0gycjhU?=
 =?utf-8?B?QStzK2s1cStIVy9qNkVubmU1dVRVRTl5dFBmSWcwcFFKTFVNUDIvTFJOVndm?=
 =?utf-8?B?OU5ORm9HY3BuT1ZCVWc2QjBsTWxNTGdXeHRRV3JxQUtWWUZhQUZDdlRYUENN?=
 =?utf-8?B?WUtTK3NiMWtvYkpZTFdlN0pFSmNiQnhoTjR2aHM5L295b2pxd0VCWFlPK0g2?=
 =?utf-8?B?K3QzSXlMcEZkMHRNaGxBMjJpVUg3SHM4amRnK3cxYjdKYzRMUzAvWFg4RzJm?=
 =?utf-8?B?U0VFaXJmRmFlZlY5NXp1WG9GcGV1dk5FZUNwMU9vMVJlM0ExMU5VSFhtN2VQ?=
 =?utf-8?B?NFNpSjk3K3hLQXhTSzg5OWc1ajFSTHQxemlFUHRlS1h6UkZxeUFmRGlNMkhP?=
 =?utf-8?B?ajRQb3E4S1htWHh3ejhzYU1hUWlweWlmd0VtRzdoNDVCZ0p3YlBzOW1VZG5G?=
 =?utf-8?B?MGZGbFNOSFlKTTJwMWZ3WlhLcEZmK2FQSXpvN20wOG5XREEzK3dGWVdOdU8v?=
 =?utf-8?B?Z2Z5eVlzRFUrRDJoTWhEQUJSOXZuRGpiZnVoWlZ2cmtQR0VZakJlRDFYNVE1?=
 =?utf-8?B?eGN1M012dWUyUEdwZ05ZbmpRUmdaaE1rK0pmQXovRDU2SUMxRytZVm5vb2tN?=
 =?utf-8?B?WGJpeURBeVp5aUYxd3BRVWRFS0dxcSt3WDI5eVNRaWJWVk1mbWtBeDVkR1Q3?=
 =?utf-8?B?ZEpzbmZzQnBlWnJoamxwM2hNc1FDS1hSMm9BSWswREpEdU80T2FKZ3JScTll?=
 =?utf-8?B?NlYya2luWGJLVDZnYlA5REJBaFlOUUhycFh0WUxhWHl2bHVacFhVbTVWMkoz?=
 =?utf-8?B?WG0zYUZNRENvYmRYaVhvTGhwODFwSi91K2QraDlwL3lxYUFyVG5YOXF3QnA4?=
 =?utf-8?B?MzVpQmRUVWYrLzgwdklNNzhMZ1JGZStGOXlRVkxYb0dqNkpENTA5TXlMSmho?=
 =?utf-8?B?R0dTM244WUZCeU9BVEdnSGZqVmNJV1lwdUFOUUNXZlBRcHBkUGxuYXBhc254?=
 =?utf-8?B?ZXFrdHlpSW03RnhtYjdqVGlVYmVac0VUT2lBVldpL0NLaXVZVG9JZWxQMUps?=
 =?utf-8?B?R2dMc1hXcm50NHlsY1hQR3d1R0VYdHZ2Q3FnTWpxTWMycFB2aFBSRG00VlRS?=
 =?utf-8?B?MmJtMk04cGRlbWVJeWtNNnhYTWZSWUxMNXcxNlNsVEhSdDhjR2Q5bENVbUVP?=
 =?utf-8?B?VU93VkllZVpmZ1Uzd2xVZjhUUDJRSTRxMGx2ejV4aFRqaFFUVjIvM3l5b0Fm?=
 =?utf-8?B?VTc5WGZHQm5rdWFNSlpXdkw2V2hXSzFtQlE3cXcvemZZb3owcm5oSVpqbGlj?=
 =?utf-8?B?bktrdm5RUmgxTFNtNGJSMVdRbFBBQzEyMSt0Rkw1UEh6dkYxcVVPMXF3aWF6?=
 =?utf-8?B?cmVIQ0VrY0lyQUlHNlpTOFhKeG1mYjZBaXNoVGR6bGkweDRPUzNTTTE3Mlpx?=
 =?utf-8?B?Wk1JTXEzZW44elNoTzR2M0IwMDVXL3BDT3RTZU04S016VUhXR2pGNlk5bXha?=
 =?utf-8?B?ck12a0JrUEtWTW9ldDNiQzBhSTduUGllRG9QUEg5V2w5cHBoU2dkQi9qZXht?=
 =?utf-8?Q?l0nWSguefgg3YH1V4A=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <C7860A79DA284F44B69CDADB4922F0C9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48838256-f9ac-49b0-c251-08d98729ac08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 11:25:29.8045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLNDuQuDfKNMPclvmR+nDE9eI/bJMsoLoeOTljxq9OE4z2MX4r1JctSjiqYjAlJmkEEgSEX0YaoLaP7VCuerIJUgfYhSkp8lY0wUFCN14eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_042536_945941_79774A67 
X-CRM114-Status: GOOD (  21.38  )
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
> This property is for optimizing output voltage impedance and is
> specific to each board.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I checked Micron and Macronix datasheets. Both have similar but not
> identical supported values. Also the register locations are different.
> For those reasons I decided to specify the Ohms value directly and let
> the device specfic driver figure out if it is supported where to write
> it to.
> BTW: Are the Ohm values and the corresponding register bits standardized
> somewhere?

Please check JEDEC Standard No. 216D.01, I see a SCCR Map which defines Output
Driver Strength values.

> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..7d7f20a741b5 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -72,6 +72,12 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
> 
> +  output-driver-strength:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Output driver strength in Ohms which optimizes the impedance at Vcc/2
> +      output voltage.
> +
>    label: true
> 
>    partitions:
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
