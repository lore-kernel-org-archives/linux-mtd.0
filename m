Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB53C6FA83
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbSBlw/oY7J7v0XMulVPHhvQhs6VVf9ry9uqZkn2t9A=; b=dZPRncmR/rquIY
	t8IlGNqh7aPG2nrUv43/XydN0HVBbAppzk97GvIRpmkKvceAESDAlHKVE3bDbxmIKJykuQv0nK8qb
	v0Ka6KRL7eOzUbu7NtXkTUuJ5RUxOsP8ZOPYLR475bBtJpVpXicZYlvsTMmbZxlXDmW3fR3GxAvWj
	VVD0CPsEHVSblwPCk6b+Ms0zRJ/T2Lb8ubmGsZ4gofV2RADUEG0Pm1KjtjXTKik76RTXbR96/BcU/
	Kkq5cjsJyO3IAPeG+Z4OGOveanidBMPnJTgtYhh9qLp5upF+jAkcQ57C7KmCUXpTzcOsNeSuWrgDD
	+JdBS1RtYBqDqV5It03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od5xL-0099Ow-3a; Tue, 27 Sep 2022 08:28:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od5qf-0096TN-Af; Tue, 27 Sep 2022 08:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664266909; x=1695802909;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+lYYPXqpW2FsanEiMRtst57Vkbx1CUNIv5I+wyzf8iU=;
  b=LEbRBqF1CCyxHBWJT1RV7o/G8uHrH2yp7pUcONNfn0RsNRqaNvjCR37/
   OCKz/oZ/JjSBY9EE1J+QgxVuL35Z+RYT8Y3KOQDN76xMKIyoNSAwN6c0O
   SLh1ajarbevb/c2XW4R1JwCWK7D+u5ke8hTy5b3NAe5MFtiXfdL3jQiYJ
   F9LE5H20CsXslChLxNC3TfeBMrW8P1yeyCtmxgiDZqkC/zQX5w9xPM3Lx
   mbMQncY7N2ziopxanr2IwZt7g96p8HggAXzQ+1ezTlDIlzvSYvu3QEwKo
   DgibnZ+gbb64c73zkE1objaERe/BvqmidFoCHKGy/xX0XNfjD2/RskMb1
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="192634414"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 01:21:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 01:21:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 27 Sep 2022 01:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5aRlorFRjn0FVu4ca9pAdQ1TqCbbA5lkC24b4V2TdLadhc/CfOsquPhT5XQxQZ08vVyHNyO9eGoGZpcy191c96V8n17srPU3wVHWZJtZd32QJdieSOz1V5K1jf7nsf3/svk3ozLmeD9dbMs+QnrCIgdIaEm9lEb6kr27Nf1rD/dcbNf8gf3Tz6+AstIKWycT+ZPzSUrsb0mgGxRP0TNg9e1oYuvQByEIy9sji1lTXXXzqOlE0C4G4DtE+vjMi5/vMYBx63jj88BfZxs/yh1b98/lWo6+yfC7etrsbCpuuYJdXWW8aw9Sns4e2L/9b0YzDkWRnc2ezyGkOSnee0NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lYYPXqpW2FsanEiMRtst57Vkbx1CUNIv5I+wyzf8iU=;
 b=Dm9+Ex540l2g73B4MpnaTzXIvxE9gHX2SUIBovd3kT0AkmA4tpH4/aq9+4tJvfQRvuwi7ixorvXijZB3vA2bWj8RS6Ke1Li3Z4CpPqIht6A4aZAgdnwlbCGdYaciqfvG9Bsm97KVIMMmlMg9u71iV+dBcGBh9O2frRpTgKF7KmwPZWyc+y2gLwbjAR3eEKp45EPI1mAUYV4h+a5msvvLrqkV7BHNaZlbF4nYiMUqRii6oTRZPH0/IP08FBuwDhqybN3S3LXbrucmcolHWuz7x5fxzMTGY2RffB0TbqiPwiR4f0r0yfg+a+glab76ldkUSgJT1XRcx4EMH14x29gk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lYYPXqpW2FsanEiMRtst57Vkbx1CUNIv5I+wyzf8iU=;
 b=dVU4KWf1qtgmtYx21MAUdc1SClDajjo47D6p6nabZoKpOSw1FH9zYfd/kj0UB+xcBo0flgPYEUab/o7RZl1e/7vGOv8ZDPKqdeC+pPFz6WzSGSj3DKK8If+9odRvW9Yo+8bVysrGGcElI/BU+n98dQsRS619s4gPPsKGG/BPToU=
Received: from BYAPR11MB2758.namprd11.prod.outlook.com (2603:10b6:a02:c9::11)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 08:21:35 +0000
Received: from BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::5d0a:7887:8de:b815]) by BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::5d0a:7887:8de:b815%7]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 08:21:35 +0000
From: <Sergiu.Moga@microchip.com>
To: <fancer.lancer@gmail.com>, <broonie@kernel.org>,
	<Tudor.Ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<Claudiu.Beznea@microchip.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <joel@jms.id.au>, <andrew@aj.id.au>, <kdasu.kdev@gmail.com>,
	<han.xu@nxp.com>, <john.garry@huawei.com>, <matthias.bgg@gmail.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<haibo.chen@nxp.com>, <yogeshgaur.83@gmail.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<michal.simek@xilinx.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Topic: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Index: AQHYxgbXv+Ia8IJsckeaEgMIjUdYyq3wyR0AgAC5KwCAAItyAIAA+ocA
Date: Tue, 27 Sep 2022 08:21:34 +0000
Message-ID: <5c67e61f-54b4-853f-d0c7-1c43cebff123@microchip.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
In-Reply-To: <20220926172454.kbpzck7med5bopre@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2758:EE_|SJ0PR11MB6813:EE_
x-ms-office365-filtering-correlation-id: eb9d130e-cc0a-433b-3048-08daa0614a86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ouyjQbmBzzXDhKqRAnLBLOkeggfAP32239om6ncDPV73NPxIFYR5JoRSTzz9Bsm2z1xsk3HtsVLuSNews8XepEsUS7MUJ8xsxiOgas5EPw0uaJfsu5yXs8jfx8cYHfk/DSwceBZaf9vjWbtaVR5YhqYc3OOUq2jodPTsBexjYtFkZjt6S0jgULQI3dRd15EW1ijgKYDd8C1kbp3eCXi2A/LzHbxGMgSSl1+55WdZU8Fh9tHTNDec8nRpqkFI9YiUtUgJbtzWA3+Yzi89Fqj3lSxSA7BVguCLQxh35PMQjgMz/NVWowbGxXWkij4HZQHMGseU46U6fD36XwT+ywZuLgxuN2n1trBxPwYPFVJ5KJSXQAdSFkDXuyLd1pKo3wKDBjglaR9f9lXEwbS6lfWtOos7R/avYn1unBdMDZXTRcEEzqbJ9q5/v2cSVBj4w5+EYvoRPjUUol4/KjBJfvhOOTV0RK1QwT31Ydhl0N++TP5Rx4pUyBgMl/zZ/v49YDerazpOpLf4RdN5a+xIIcT2rphfFhUEtm2nwV8Ye/kbXM8AyJCbtz3cO8cgXprPCc4VHyQn3CdTsWDEWab0rbN2E0HCNRu6bus+/UdlyEgxrmJEFhRcFd+VefeC3EOE0RZB3Gx5ZgLma6cm4FdtghAheVFP68asz0m5HKXIsb+Bfj33ose51J+bFubcMycrEhAxkCq2UJwJ6hr5zv+NW/gokt6VwqNmjr0Wb3e6Ei1yYQc9JkKOY3ZpmddKEHwoy/rMjVpkZk/CpBuM1QWf8bP4jS91HaRhRcsMRRa8DHlgDu4gNR7pZ8MDkuqLXrohfj7c7o/diza5GJ++NkEZjBcGng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(122000001)(38100700002)(31696002)(54906003)(110136005)(86362001)(316002)(2906002)(6506007)(6512007)(38070700005)(26005)(53546011)(478600001)(41300700001)(91956017)(6486002)(71200400001)(66556008)(4326008)(66946007)(76116006)(66476007)(66446008)(64756008)(30864003)(5660300002)(7416002)(7406005)(2616005)(186003)(8936002)(83380400001)(8676002)(31686004)(36756003)(66899015)(81973001)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWZIMHF3a243TUVmT3BUVFBoOVJSSEhwcVoxdzVrZVlSN2lsU3h5WlhPL2h0?=
 =?utf-8?B?WlFzeDJ3TUswRFc1QjdHT0JIUU9uRnBCanNta3NqbzRsTHVYUGlSUmlnTHFw?=
 =?utf-8?B?Mi9TVVExQmk2WVk5dkpLdEtKWmVMUkQybU91ZzV2empjMGorbVg4dTBnUHJ5?=
 =?utf-8?B?WmlqRXlFUTBxTU1lbXp2dzNoVTJjN1BIRVp4NDhmc1M2eXhXckJPeUgwWGpO?=
 =?utf-8?B?RU5nZ2FIc3ZMS0Vhd25veEtpMTE3ZkZWOER0OFBNOVpoSHN2SzhpeThBaStR?=
 =?utf-8?B?d3RlOVY3Rkl5Q09sNlJxaWhtUHl2VExuRkl1VHBlRW1OZnJVOFNmYmdTUk9C?=
 =?utf-8?B?VUxlV1ZIOU9MazFGdUpzZUR4ZERDcG4zd2lJbCt1ZUl5ejljaXJpd2oxRnV5?=
 =?utf-8?B?UWUvem9wWVhMWEh3OTZqYzNBNlcwYkp3S3pyUEFldW1LcGtycXdjQUlqbzdi?=
 =?utf-8?B?amZYb1l5ekMzTDBJUk0wZEk1VkF1aml1aXYzbjN0bXQrTEE1WS9oS2kzNExu?=
 =?utf-8?B?QWxVYjltOE8yNEI1c1JPbk9LUHEwajJoQzl0UlNmbkMwU0M5QW5jS2dsbzZW?=
 =?utf-8?B?UnBtZjFLS1hkMzBBcHErL1MvcDF4ZWxDVDJTaEoyQStPNUZlemU1SG9ud2JP?=
 =?utf-8?B?VGFMMTcrS28rYlpHMm9BVUZkUHpmWVBjL3RlOUluSk5hc1FuOTE1SGpmMXVZ?=
 =?utf-8?B?UzJWbXJpVUJFUkRIMHBjRHdxMld2SHZUU3R5MUhMMExGaG55OE1GdGlsMWtw?=
 =?utf-8?B?aUcwT08vbzUyTE54dTFjcGpxZHpOMlhtWXl2TVd1VVNnRkFOYUZ0YjVJVG9H?=
 =?utf-8?B?bG41RUs5Z21tTUNIbWRUeFVtNmVKUjRLSEl4Q0ZIVDFWNFUySUhiemd1NjZ2?=
 =?utf-8?B?TnB1OVljN09OUzErSlh6NjNtTm1JUnRwVWRYMnB0dVB1MGdhZklCUU4rTk15?=
 =?utf-8?B?RFRIdHNUYmluUWlMYnRXc0NmSHQzbmk4blB5dmRUYmVzamw4S0NOc2hjT1dK?=
 =?utf-8?B?QVRrd05FMkticmgxckU5Y1pwRFBkeVZSWDk2L0JqMHNraURwQVNSeVZwZ1Bk?=
 =?utf-8?B?Qkx3NEtuL2FPa1dTcEQvZDVhWnhodEkxWFdOUlZuNThsWm93eWlPd3h3Q0th?=
 =?utf-8?B?N0pBQ3VqSW51cXhjUklQTmFhQkl4U1Z1ZHFkR25xZExEbkpTS1pHZUhIQ1ZQ?=
 =?utf-8?B?SUp4VWJmRDdvTk1wald5Tm9oN1h0dytqejVpcmt4cnhOSU8rdWM3bzNvM0JM?=
 =?utf-8?B?cWhoUXNoOTBzYS9vMTZObU1XYXVrTEJqeE1venlnWC82QXFWbzBsby9IdUNZ?=
 =?utf-8?B?d09KazRnRVRKaTNTQzB0cDFnclRwd0p4cHgvSWF3bVpyM1hGQ0VCZ0NBcVFQ?=
 =?utf-8?B?YXI5R0NZN3hybnphYXNYb0ZPQzZXNThaZmFFNFJIcXVhUHQ3bmNiUFlhcWJC?=
 =?utf-8?B?SHN0cDFGdzU1d1djMW5FdFkyRTg5OXZuc0U1SDBvUWVYZktiMDFxdnBYdWFJ?=
 =?utf-8?B?U0grNGJFUWFtajBpNVNXZzdNa2lYRnRxZThyRndwK2dpUk5hcGFwaVkvRjlq?=
 =?utf-8?B?QXU5OWN5WWtWU3dTaENuSHpRQnlWRDZpcVVPQ3JycjB6T0tWamwyUC9YenlZ?=
 =?utf-8?B?SVd5OGlSWXMvZ01aRXQvQVloTUJJUkxEY1FQMFFRbVN2Z3RQSldaR01ackhV?=
 =?utf-8?B?eG5JaDUyaGVxR2o3OXlTSDNibmYwazlDY1YrNFJFeVgyOGVxdWQ5akMxbThu?=
 =?utf-8?B?WTZBN25qVmFwRGNUb3dhZnlVZmorTG55VTNLVzYyM1hLdUMvM2lMM3RYS3B1?=
 =?utf-8?B?VlNzb0FNUEpqT0Z0cU4wdDdQQU5qSTNnUVR6WWpiWkgraUFyK2VtbWpBMDVw?=
 =?utf-8?B?dHB2UHFnbmxkcVFlMktPbUE3d1BBV1VHZ0IxUksyVUduczVMTXJINWFSYTR6?=
 =?utf-8?B?cGRCaTE0WTgrd2NVM0phanM1OWNpMnVqQm5IcFkwc1d6TThYOVNUckk5U3Nn?=
 =?utf-8?B?eStIZ21ObVZKbEZXa2ducHRlbWg4czlnNS9kOWN5a2xpQWhKT2FlS2JNVDJm?=
 =?utf-8?B?Q1lLcUc4ODkvdGE4Q1VKZGxtWjhZOHkvcExBUmQ4TkhjRXE5RUw2RnFQaG83?=
 =?utf-8?Q?idqYFHoJwqIG7hcO6lZg5Be8+?=
Content-ID: <197530DCC0AB644297A4AA9DAF8DC43F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9d130e-cc0a-433b-3048-08daa0614a86
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 08:21:34.8457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eXvwwL9aLZ31lxXzC5kz6UzJQdoA5I0q0ByGjixHbdE6P6HS3fuXtjYDpGmA8o2hS9tIZIRHT6v4/uzqMiinsw6P60ZlKXJM3Jyi5F/Drw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_012149_798890_096187BE 
X-CRM114-Status: GOOD (  15.65  )
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

On 26.09.2022 20:24, Serge Semin wrote:
> @Mark, @Tudor, @Pratyush, @Michael could you please join the
> discussion regarding the dummy.buswidth and dummy.dtr fields in the
> spi_mem_op structure?
> 
> On Mon, Sep 26, 2022 at 09:05:49AM +0000, Sergiu.Moga@microchip.com wrote:
>> On 26.09.2022 01:03, Serge Semin wrote:
>>> Hello Sergiu
>>>
> 
> Sergiu, you didn't address all my comments. Please be more attentive.
> 

Hello Serge,

My apologies, I did take note of them :D. I said while addressing your 
comments for `drivers/spi/spi-dw-core.c` that I agree with the rest of 
the comments, as I did not find it productive to say something among the 
lines of "I agree" or "Noted" for each comment separately.


>>
>>
>> Hello Serge,
>>
>>
>>> On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
>>>> In order to properly represent the hardware functionality
>>>> in the core, avoid reconverting the number of dummy cycles
>>>> to the number of bytes and only work with the former.
>>>> Instead, let the drivers that do need this conversion do
>>>> it themselves.
>>>>
>>>> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
>>>> ---
>>>>    drivers/mtd/spi-nor/core.c        | 22 ++++----------
>>>
>>> [...]
>>>
>>>>    drivers/spi/spi-dw-core.c         | 10 +++++--
>>>
>>> [...]
>>>
>>>>    drivers/spi/spi-mem.c             | 27 +++++++++++------
>>>
>>> [...]
>>>
>>>>    drivers/spi/spi-mtk-nor.c         | 48 +++++++++++++++++--------------
>>>
>>> [...]
>>>
>>>>    drivers/spi/spi-zynq-qspi.c       | 15 ++++++----
>>>>    drivers/spi/spi-zynqmp-gqspi.c    |  8 ++++--
>>>>    include/linux/spi/spi-mem.h       | 10 +++----
>>>>    25 files changed, 234 insertions(+), 147 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index f2c64006f8d7..cc8ca824f912 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>         if (op->addr.nbytes)
>>>>                 op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>
>>>
>>>
>>>
>>>> -     if (op->dummy.nbytes)
>>>> +     if (op->dummy.ncycles)
>>>>                 op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>
>>>>         if (op->data.nbytes)
>>>> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>                 op->dummy.dtr = true;
>>>>                 op->data.dtr = true;
>>>>
>>>> -             /* 2 bytes per clock cycle in DTR mode. */
>>>> -             op->dummy.nbytes *= 2;
>>>> -
>>>>                 ext = spi_nor_get_cmd_ext(nor, op);
>>>>                 op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>>>>                 op->cmd.nbytes = 2;
>>>> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>>>>
>>>>         spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
>>>>
>>>> -     /* convert the dummy cycles to the number of bytes */
>>>> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>>>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>>>> -             op.dummy.nbytes *= 2;
>>>> +     op.dummy.ncycles = nor->read_dummy;
>>>
>>> So according to this modification and what is done in the rest of the
>>> patch, the dummy part of the SPI-mem operations now contains the number
>>> of cycles only. Am I right to think that it means a number of dummy
>>> clock oscillations? (Judging from what I've seen in the HW-manuals of
>>> the SPI NOR memory devices most likely I am...)
>>
>>
>>
>> Yes, you are correct.
>>
>>
>>> If so the "ncycles" field
>>> is now free from the "data" semantic. Then what is the meaning of the
>>> "buswidth and "dtr" fields in the spi_mem_op.dummy field?
>>>
>>
>>
> 
>> It is still meaningful as it is used for the conversion by some drivers
>> to nbytes and I do not see how it goes out of the specification in any
>> way. So, at least for now, I do not see any reason to remove these fields.
> 
> I do see the way these fields are used in the SPI-mem drivers. I was
> wondering what do these bits mean in the framework of the SPI-mem
> core? AFAICS from the specification the dummy cycles are irrelevant to
> the data bus state. It says "the master tri-states the bus during
> 'dummy' cycles." If so I don't see a reason to have the DTR and
> buswidth fields in the spi_mem_op structure anymore. The number of
> cycles could be calculated right on the initialization stage based on
> the SPI NOR/NAND requirements.
> 
> @Mark, @Tudor, @Pratyush, what do you think?
> 
>>
>>
>>>>
>>>>         usebouncebuf = spi_nor_spimem_bounce(nor, &op);
>>>>
>>>> @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>>>>
>>>>                 if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>>>>                         op.addr.nbytes = nor->params->rdsr_addr_nbytes;
>>>> -                     op.dummy.nbytes = nor->params->rdsr_dummy;
>>>> +                     op.dummy.ncycles = nor->params->rdsr_dummy;
>>>>                         /*
>>>>                          * We don't want to read only one byte in DTR mode. So,
>>>>                          * read 2 and then discard the second byte.
>>>> @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>>>>
>>>>         spi_nor_spimem_setup_op(nor, &op, read->proto);
>>>>
>>>> -     /* convert the dummy cycles to the number of bytes */
>>>> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>>>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>>>> -             op.dummy.nbytes *= 2;
>>>> +     op.dummy.ncycles = nor->read_dummy;
>>>>
>>>>         return spi_nor_spimem_check_op(nor, &op);
>>>>    }
>>>> @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>>>>
>>>>         spi_nor_spimem_setup_op(nor, op, nor->read_proto);
>>>>
>>>> -     /* convert the dummy cycles to the number of bytes */
>>>> -     op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
>>>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>>>> -             op->dummy.nbytes *= 2;
>>>> +     op->dummy.ncycles = nor->read_dummy;
>>>>
>>>>         /*
>>>>          * Since spi_nor_spimem_setup_op() only sets buswidth when the number
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
>>>> index f87d97ccd2d6..0ba5c7d0e66e 100644
>>>> --- a/drivers/spi/spi-dw-core.c
>>>> +++ b/drivers/spi/spi-dw-core.c
>>>> @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct spi_mem *mem,
>>>>    static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
>>>>    {
>>>>         unsigned int i, j, len;
>>>> -     u8 *out;
>>>> +     u8 *out, dummy_nbytes;
>>>>
>>>>         /*
>>>>          * Calculate the total length of the EEPROM command transfer and
>>>>          * either use the pre-allocated buffer or create a temporary one.
>>>>          */
>>>> -     len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>>>
>>>> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>
>>> 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? Since
>>> you are adding a similar modification to so many drivers what about using
>>> that macro there too?
>>>
>>
>>
> 
>> AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits per
>> byte an arch has. Although, there is no place in the kernel from what I
>> can see that has BITS_PER_BYTE with a value other than 8, you cannot
>> deny that there exist architectures whose number of bits per byte may be
>> different from 8.
> 
> Judging by the way the macro is declared it isn't platform specific.
> So no, the kernel always expects the byte having eight bits.
> 
>>
>> Meanwhile, the JESD216E specification tells us in the Terms and
>> definitions chapter that
>> "DWORD: Four consecutive 8-bit bytes used as the basic 32-bit building
>> block for headers and parameter tables." So it explicitly says that a
>> byte has 8 bits regardless of the arch.
> 
> Right. That's what the BITS_PER_BYTE macro is for.
> 
>>
>> Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macro
>> as, IMO, it does not represent the same thing as the number of bits per
>> byte that the terms and definitions of the JESD216E specification refer to.
> 
> It represents exactly the same in include/linux/bits.h .
> 
> Ideally it would be good to use it in all your updates since you touch
> the corresponding parts anyway. But at the very least I would insist on
> using the macro in the drivers which already have it utilized like
> spi-dw-*, spi-mtk-snfi, spi-mtk-nor.
> 


I guess you are right. I wrongly assumed it has something to do with 
plaforms. I checked with commit f7589f28d7dd4586b4e90ac3b2a180409669053a 
when it was first defined and I guess that yeah, it's not what I thought 
it was, my apologies :).


>>
>>
>>> 2. buswidth is supposed to be always 1 in this driver (see the
>>> dw_spi_supports_mem_op() method). So it can be dropped from the
>>> statement above.
>>>
>>> 3. Since the ncycles now contains a number of clock cycles there is no
>>> point in taking the SPI bus-width into account at all. What is
>>> meaningful is how many oscillations are supposed to be placed on the
>>> CLK line before the data is available. So the op->dummy.ncycles /
>>> BITS_PER_BYTE statement would be more appropriate here in any case.
>>>
>>
>>
> 
>> I can agee with this in the case of this driver, sure.
> 
> Ok. thanks.
> 
>>
>>
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
>>> DTR is unsupported by the controller. See, no spi_controller_mem_caps
>>> initialized. So this part is redundant. The same is most likely
>>> applicable for some of the DTR-related updates in this patch too
>>> since the spi_controller_mem_caps structure is initialized in a few
>>> drivers only.
>>>
>>
>>
> 
>> Agreed. Initially, wherever I was not sure, I just placed this if
>> condition to avoid breaking anything in case the driver does support
>> DTR. The same goes for your other related observations to other driver
>> modifications, with which I agree :).
> 
> AFAICS the only drivers which support the DTR-capable transfers are
> the ones having the spi_controller_mem_caps structure defined with dtr
> set to true or the ones with custom SPI-mem ops. It means that the
> DTR-transfers are supported by the spi-mtk-snfi.c, spi-mxic.c,
> spi-cadence-quadspi.c and spi-intel.c drivers only. The rest of the
> SPI-controller drivers will fail to execute the SPI-mem ops with dtr
> flag set due to the spi_mem_default_supports_op() method semantics.
> 
>>
>>
>>>> +
>>>> +     len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>>>         if (op->data.dir == SPI_MEM_DATA_OUT)
>>>>                 len += op->data.nbytes;
>>>>
>>>> @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
>>>>                 out[i] = DW_SPI_GET_BYTE(op->cmd.opcode, op->cmd.nbytes - i - 1);
>>>>         for (j = 0; j < op->addr.nbytes; ++i, ++j)
>>>>                 out[i] = DW_SPI_GET_BYTE(op->addr.val, op->addr.nbytes - j - 1);
>>>> -     for (j = 0; j < op->dummy.nbytes; ++i, ++j)
>>>> +     for (j = 0; j < dummy_nbytes; ++i, ++j)
>>>>                 out[i] = 0x0;
>>>>
>>>>         if (op->data.dir == SPI_MEM_DATA_OUT)
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>>>> index 0c79193d9697..7b204963bb62 100644
>>>> --- a/drivers/spi/spi-mem.c
>>>> +++ b/drivers/spi/spi-mem.c
>>>> @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
>>>>             spi_check_buswidth_req(mem, op->addr.buswidth, true))
>>>>                 return false;
>>>>
>>>> -     if (op->dummy.nbytes &&
>>>> +     if (op->dummy.ncycles &&
>>>>             spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>>>>                 return false;
>>>>
>>>> @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_mem_op *op)
>>>>                 return -EINVAL;
>>>>
>>>>         if ((op->addr.nbytes && !op->addr.buswidth) ||
>>>> -         (op->dummy.nbytes && !op->dummy.buswidth) ||
>>>> +         (op->dummy.ncycles && !op->dummy.buswidth) ||
>>>>             (op->data.nbytes && !op->data.buswidth))
>>>>                 return -EINVAL;
>>>>
>>>> @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>>>
>>>>         struct spi_controller *ctlr = mem->spi->controller;
>>>>         struct spi_transfer xfers[4] = { };
>>>>         struct spi_message msg;
>>>> -     u8 *tmpbuf;
>>>> +     u8 *tmpbuf, dummy_nbytes;
>>>>         int ret;
>>>
> 
>>> Reverse xmas tree order?
> 
> Please take this note into account. Preserving the locally defined
> coding-style convention is a very useful practice. It retains the code
> uniformity, which improves readability and maintainability for just no
> price.
> 
>>>
>>>>
>>>>         ret = spi_mem_check_op(op);
>>>> @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>>>>                         return ret;
>>>>         }
>>>>
>>>
>>>> -     tmpbufsize = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>>>> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>
>>> So ncycles now indeed is a number of CLK line oscillations. This most
>>> likely will break the SPI Nand driver then, which still passes the
>>> number of bytes to the SPI_MEM_OP_DUMMY() macro.
>>>
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
>>> Generic SPI-mem ops don't take the DTR mode into account. So I don't
>>> see this necessary.
>>>
>>
>>
> 
>> You may be right, but this part of the code does take into consideration
>> the number of dummy.nbytes to calculate the xfer length. Therefore,
>> shouldn't this code block also know if the number of dummy nbytes is
>> actually double the amount that it calculated through the conversion
>> formula?
> 
> Ok. This part turns to be debatable indeed. On the first glance the
> SPI-mem core doesn't anyhow handles the DTR-flag value. On the other
> hand SPI-controllers may have the dtr-capability flag set thus, for
> instance implicitly supporting the DTR transfers. Finally currently
> all the DTR-aware drivers are known to have the custom SPI-mem ops
> defined. So some aspects say for dropping the dummy.dtr field usage
> from here, some say against it. I'll leave it for you and @Mark,
> @Tudor, @Pratyush to decide.
> 



I am fine with this either way. I placed it here at first since I found 
it to be most appropriate here.



>>
>>
>>>> +
>>>> +     tmpbufsize = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>>>
>>>>         /*
>>>>          * Allocate a buffer to transmit the CMD, ADDR cycles with kmalloc() so
>>>> @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>>>>                 totalxferlen += op->addr.nbytes;
>>>>         }
>>>>
>>>> -     if (op->dummy.nbytes) {
>>>> -             memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
>>>> +     if (dummy_nbytes) {
>>>> +             memset(tmpbuf + op->addr.nbytes + 1, 0xff, dummy_nbytes);
>>>>                 xfers[xferpos].tx_buf = tmpbuf + op->addr.nbytes + 1;
>>>> -             xfers[xferpos].len = op->dummy.nbytes;
>>>> +             xfers[xferpos].len = dummy_nbytes;
>>>>                 xfers[xferpos].tx_nbits = op->dummy.buswidth;
>>>>                 xfers[xferpos].dummy_data = 1;
>>>>                 spi_message_add_tail(&xfers[xferpos], &msg);
>>>>                 xferpos++;
>>>> -             totalxferlen += op->dummy.nbytes;
>>>> +             totalxferlen += dummy_nbytes;
>>>>         }
>>>>
>>>>         if (op->data.nbytes) {
>>>> @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>>>>    {
>>>
>>>>         struct spi_controller *ctlr = mem->spi->controller;
>>>>         size_t len;
>>>> +     u8 dummy_nbytes;
>>>
> 
>>> reverse xmas tree?
> 
> Please retain the local coding style convention.
> 
>>>
>>>>
>>>>         if (ctlr->mem_ops && ctlr->mem_ops->adjust_op_size)
>>>>                 return ctlr->mem_ops->adjust_op_size(mem, op);
>>>>
>>>> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>> +
>>>>         if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
>>>> -             len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>>>> +             len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>>>
>>>>                 if (len > spi_max_transfer_size(mem->spi))
>>>>                         return -EINVAL;
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
>>>> index d167699a1a96..f6870c6e911a 100644
>>>> --- a/drivers/spi/spi-mtk-nor.c
>>>> +++ b/drivers/spi/spi-mtk-nor.c
>>>> @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, const struct spi_mem_op *op)
>>>>
>>>>    static bool mtk_nor_match_read(const struct spi_mem_op *op)
>>>>    {
>>>> -     int dummy = 0;
>>>> -
>>>> -     if (op->dummy.nbytes)
>>>> -             dummy = op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth;
>>>> -
>>>>         if ((op->data.buswidth == 2) || (op->data.buswidth == 4)) {
>>>>                 if (op->addr.buswidth == 1)
>>>> -                     return dummy == 8;
>>>> +                     return op->dummy.ncycles == 8;
>>>>                 else if (op->addr.buswidth == 2)
>>>> -                     return dummy == 4;
>>>> +                     return op->dummy.ncycles == 4;
>>>>                 else if (op->addr.buswidth == 4)
>>>> -                     return dummy == 6;
>>>> +                     return op->dummy.ncycles == 6;
>>>>         } else if ((op->addr.buswidth == 1) && (op->data.buswidth == 1)) {
>>>>                 if (op->cmd.opcode == 0x03)
>>>> -                     return dummy == 0;
>>>> +                     return op->dummy.ncycles == 0;
>>>>                 else if (op->cmd.opcode == 0x0b)
>>>> -                     return dummy == 8;
>>>> +                     return op->dummy.ncycles == 8;
>>>>         }
>>>>         return false;
>>>>    }
>>>> @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
>>>>    static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>>>    {
>>>>         int tx_len, rx_len, prg_len, prg_left;
>>>
> 
> 
>>>> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>> +
>>>
>>> IMO it's better to move the initialization statement to a separate
>>> line here.
> 
> Again. The initialization statement is too long. It makes the code
> harder to read. Just split the declaration and initialization up.
> 



Alright, I did take note of it. As I previously said, I agree with all 
of your styling related comments.



>>>
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
> 
>>> Does the MTK SPI driver support DTR? AFAICS it doesn't.
> 
> I'll give an answer. It doesn't. The spi_mem_exec_op() will return the
> -ENOTSUPP error if an SPI-mem op with any dtr flag set is requested.
> 



Alright, thanks.



>>>
>>>>
>>>>         // prg mode is spi-only.
>>>>         if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
>>>> @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>>>
>>>>         if (op->data.dir == SPI_MEM_DATA_OUT) {
>>>>                 // count dummy bytes only if we need to write data after it
>>>> -             tx_len += op->dummy.nbytes;
>>>> +             tx_len += dummy_nbytes;
>>>>
>>>>                 // leave at least one byte for data
>>>>                 if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
>>>> @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>>>                         return false;
>>>>
>>>>                 rx_len = op->data.nbytes;
>>>> -             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
>>>> +             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
>>>>                 if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>>>>                         prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
>>>>                 if (rx_len > prg_left) {
>>>> @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>>>                         rx_len = prg_left;
>>>>                 }
>>>>
>>>> -             prg_len = tx_len + op->dummy.nbytes + rx_len;
>>>> +             prg_len = tx_len + dummy_nbytes + rx_len;
>>>>                 if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>>>>                         return false;
>>>>         } else {
>>>> -             prg_len = tx_len + op->dummy.nbytes;
>>>> +             prg_len = tx_len + dummy_nbytes;
>>>>                 if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>>>>                         return false;
>>>>         }
>>>> @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>>>    static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
>>>>    {
>>>>         int tx_len, tx_left, prg_left;
>>>
>>>> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>> +
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
>>> ditto
>>>
>>>>
>>>>         tx_len = op->cmd.nbytes + op->addr.nbytes;
>>>>         if (op->data.dir == SPI_MEM_DATA_OUT) {
>>>> -             tx_len += op->dummy.nbytes;
>>>> +             tx_len += dummy_nbytes;
>>>>                 tx_left = MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
>>>>                 if (op->data.nbytes > tx_left)
>>>>                         op->data.nbytes = tx_left;
>>>>         } else if (op->data.dir == SPI_MEM_DATA_IN) {
>>>> -             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
>>>> +             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
>>>>                 if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>>>>                         prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
>>>>                 if (op->data.nbytes > prg_left)
>>>> @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>>>>                         break;
>>>>                 case SPI_MEM_DATA_OUT:
>>>>                         if ((op->addr.buswidth == 1) &&
>>>> -                         (op->dummy.nbytes == 0) &&
>>>> +                         (op->dummy.ncycles == 0) &&
>>>>                             (op->data.buswidth == 1))
>>>>                                 return true;
>>>>                         break;
>>>> @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>>>>         int tx_len, prg_len;
>>>>         int i, ret;
>>>>         void __iomem *reg;
>>>
>>>> -     u8 bufbyte;
>>>> +     u8 bufbyte, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>> +
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
>>> ditto
>>>
>>>>
>>>>         tx_len = op->cmd.nbytes + op->addr.nbytes;
>>>>
>>>>         // count dummy bytes only if we need to write data after it
>>>>         if (op->data.dir == SPI_MEM_DATA_OUT)
>>>> -             tx_len += op->dummy.nbytes + op->data.nbytes;
>>>> +             tx_len += dummy_nbytes + op->data.nbytes;
>>>>         else if (op->data.dir == SPI_MEM_DATA_IN)
>>>>                 rx_len = op->data.nbytes;
>>>>
>>>> -     prg_len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes +
>>>> +     prg_len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes +
>>>>                   op->data.nbytes;
>>>>
>>>>         // an invalid op may reach here if the caller calls exec_op without
>>>> @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>>>>         }
>>>>
>>>>         if (op->data.dir == SPI_MEM_DATA_OUT) {
>>>> -             for (i = 0; i < op->dummy.nbytes; i++, reg_offset--) {
>>>> +             for (i = 0; i < dummy_nbytes; i++, reg_offset--) {
>>>>                         reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
>>>>                         writeb(0, reg);
>>>>                 }
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
>>>> index 78f31b61a2aa..84b7db85548c 100644
>>>> --- a/drivers/spi/spi-zynq-qspi.c
>>>> +++ b/drivers/spi/spi-zynq-qspi.c
>>>> @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>>>>    {
>>>>         struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->master);
>>>>         int err = 0, i;
> 
>>>> -     u8 *tmpbuf;
>>>> +     u8 *tmpbuf, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>
>>> Separate line?
> 
> Too long. Split the declaration and initialization up.
> 
>>>
>>>> +
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
>>> Is DTR supported by the driver?
>>>
>>
>>
> 
>> Not from what I can see, but I was not 100% sure so I placed this if
>> statement here just in case.
> 
> spi_mem_default_supports_op() will return false for the DTR-available
> transfers anyway. So the spi_mem_exec_op() method will fail right at
> the start and this part will never be executed if the DTR-mode is
> requested.
> 
> -Sergey
> 


Noted.


Thanks,
	Sergiu


>>
>>
>>
>>>>
>>>>         dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>>>>                 op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>>>> @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>>>>                         err = -ETIMEDOUT;
>>>>         }
>>>>
>>>> -     if (op->dummy.nbytes) {
>>>> -             tmpbuf = kzalloc(op->dummy.nbytes, GFP_KERNEL);
>>>> +     if (dummy_nbytes) {
>>>> +             tmpbuf = kzalloc(dummy_nbytes, GFP_KERNEL);
>>>>                 if (!tmpbuf)
>>>>                         return -ENOMEM;
>>>>
>>>> -             memset(tmpbuf, 0xff, op->dummy.nbytes);
>>>> +             memset(tmpbuf, 0xff, dummy_nbytes);
>>>>                 reinit_completion(&xqspi->data_completion);
>>>>                 xqspi->txbuf = tmpbuf;
>>>>                 xqspi->rxbuf = NULL;
>>>> -             xqspi->tx_bytes = op->dummy.nbytes;
>>>> -             xqspi->rx_bytes = op->dummy.nbytes;
>>>> +             xqspi->tx_bytes = dummy_nbytes;
>>>> +             xqspi->rx_bytes = dummy_nbytes;
>>>>                 zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
>>>>                 zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
>>>>                                 ZYNQ_QSPI_IXR_RXTX_MASK);
>>>> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
>>>> index c760aac070e5..b41abadef9a6 100644
>>>> --- a/drivers/spi/spi-zynqmp-gqspi.c
>>>> +++ b/drivers/spi/spi-zynqmp-gqspi.c
>>>> @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>>>>         u32 genfifoentry = 0;
>>>>         u16 opcode = op->cmd.opcode;
>>>>         u64 opaddr;
>>>
>>>> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>>>> +
>>>> +     if (op->dummy.dtr)
>>>> +             dummy_nbytes *= 2;
>>>
>>> ditto
>>>
>>>>
>>>>         dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>>>>                 op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>>>> @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>>>>                 }
>>>>         }
>>>>
>>>> -     if (op->dummy.nbytes) {
>>>> +     if (dummy_nbytes) {
>>>>                 xqspi->txbuf = NULL;
>>>>                 xqspi->rxbuf = NULL;
>>>>                 /*
>>>>                  * xqspi->bytes_to_transfer here represents the dummy circles
>>>>                  * which need to be sent.
>>>>                  */
>>>> -             xqspi->bytes_to_transfer = op->dummy.nbytes * 8 / op->dummy.buswidth;
>>>> +             xqspi->bytes_to_transfer = dummy_nbytes;
>>>>                 xqspi->bytes_to_receive = 0;
>>>>                 /*
>>>>                  * Using op->data.buswidth instead of op->dummy.buswidth here because
>>>> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
>>>> index 2ba044d0d5e5..5fd45800af03 100644
>>>> --- a/include/linux/spi/spi-mem.h
>>>> +++ b/include/linux/spi/spi-mem.h
>>>> @@ -29,9 +29,9 @@
>>>>
>>>>    #define SPI_MEM_OP_NO_ADDR   { }
>>>>
>>>
>>>> -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)                       \
>>>> +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)              \
>>>>         {                                                       \
>>>
>>>> -             .nbytes = __nbytes,                             \
>>>> +             .ncycles = __ncycles,                           \
>>>>                 .buswidth = __buswidth,                         \
>>>
>>> Please make sure this update and the drivers/spi/spi-mem.c driver
>>> alterations are coherent with the SPI Nand driver. See the macro usages:
>>> include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().
>>>
>>> -Sergey
>>>
>>
>>
>> Yes, indeed, I should have paid more attention here. As I have
>> previously said,  I simply replaced dummy.nbytes with the code sequences
>> you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well
>> since I changed its definition. Thank you! :)
>>
>>
>>>>         }
>>>>
>>>> @@ -83,8 +83,8 @@ enum spi_mem_data_dir {
>>>>     *         Note that only @addr.nbytes are taken into account in this
>>>>     *         address value, so users should make sure the value fits in the
>>>>     *         assigned number of bytes.
>>>> - * @dummy.nbytes: number of dummy bytes to send after an opcode or address. Can
>>>> - *             be zero if the operation does not require dummy bytes
>>>> + * @dummy.ncycles: number of dummy cycles after an opcode or address. Can
>>>> + *              be zero if the operation does not require dummy cycles
>>>>     * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
>>>>     * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
>>>>     * @data.buswidth: number of IO lanes used to send/receive the data
>>>> @@ -112,7 +112,7 @@ struct spi_mem_op {
>>>>         } addr;
>>>>
>>>>         struct {
>>>> -             u8 nbytes;
>>>> +             u8 ncycles;
>>>>                 u8 buswidth;
>>>>                 u8 dtr : 1;
>>>>         } dummy;
>>>> --
>>>> 2.34.1
>>>>
>>
>>
>> Regards,
>>        Sergiu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
