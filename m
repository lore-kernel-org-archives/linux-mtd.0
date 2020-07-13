Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2C2C433E2
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:35:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D23E20720
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3PI7BSQW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aRnjhCSV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="COgY1lSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D23E20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qxtFoi4KCJ8NbvowBhR2WHmLWo57D5f5DjZGuDZBgq8=; b=3PI7BSQWIdjuU59j7sFxCSyQh
	4RoKeCH7sJ/SRPex7DoD2R//SESEsNbwaTL+MFCm/FVGeWovsOs44hOjkE+Mo4LkjPoi/7yhlBa9G
	t8o6KuBxxnldVPP39kLmSstnBbOIBereJgQWDTLwBJp1ZazYwre091UMCNJAblGp/9g9HfNHNqLsr
	J586XAL3mxGXZD+SqtMOKm+8UHQ+TD0nta/zZxQ4KG7jil4QLOLT3TgusvMcMkqoaPOMwybNK0KRQ
	v9/+ByNS1ooWmMTKBFhmWsnn10C8JTr0LkJdrILn1kXY6vPolb5at0h5AzjZb+3TNIWo0oSDf2Z5n
	9m9oQkWWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jus2f-0005Mu-OX; Mon, 13 Jul 2020 06:34:21 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jus2c-0005IR-Nr; Mon, 13 Jul 2020 06:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594622059; x=1626158059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HnDMyw3QbHSMXA22QxZVKiRNwhrx8NJYze23R7afQeE=;
 b=aRnjhCSVjqStcfbU933h9nDvHbDqpmY0AU4JddtexwiCi1DCLmS5JT1O
 ggS6cZDdv/VPkuER9Kxz+ukDD2t5Kg9KNPQhIFrhTqiN28FK6JyGqo3zr
 naIwtoIl9aDpxQmBKrDTZrhLHhUW2THKhNXeAdo1mPJGSdgt+2RHACsDM
 +NhAB/NlcWK9Wdg6WYBIqUcqVDH71yB2Eq+lz8MDpBWNHA8sFukRm4rds
 mN58TbIJjMaw70IN1t073FNJlIQ/e6x81SpVmoFGTYmzVVbXxIyfsgt7N
 SdL9fRar7Y6f5uCdjs+LirHgZcFfGOu3jSe3UHom+kqKusBUPW89/ILGc A==;
IronPort-SDR: 5EunmS7PQ/kq8/op4zlHgx2bmEi+Ar7+qQTW5rF/89RTAjbwmTHaxeWNjEvqIBF4nm2L185bpw
 rcJrcp57c3X+hoL5ui3Zl55biZe9ftSZ0RwPB76Pj4iaNZTBzhelnAU69JHDpGXUoiSU56t5iA
 QJ2Y3YgZYU5AY3okncjEDhMhadCmKWxxgJYTJYb3UffVb7wbpQNHfsLBHEaHVpVhEpKYa8p7MR
 O3AcmhJkiAeNRZsPi0Mv5Pesn30JIDpig8aaue2T/1J661DanyWdoOcMhaoT/LfD3tjPcxke2V
 BAw=
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; d="scan'208";a="82843199"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2020 23:34:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 12 Jul 2020 23:34:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sun, 12 Jul 2020 23:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxH2hqCLWyp4YQUcHsDDoHQ3ZKThcllacFWbHvGp204WWLYJ9A82EwoJMAT83or8JKXV+M4rtHWU3/t7skK2Yjb5AAB7R6gR3zprL6m7I5E4NhiroLLI6WSgAuEXjFwEDIrW9fiAvG25dgu+Na1AOyxnNACewVuZSDI+i01llWSBNNI/dfjpZOmy2VWTROkwy0EiuzG04bNC5nTsL7FXQz7POjl2JcvCu0DJc9o+hukadIpWbN86ab/A3LnkOKqeYv7bqemIh4Grx5P7IW2UcL1MkcGraOuse7xYVJauC/Us8t7qsuFvethQFzJGlu5ZPSXLfgr/RuvzBPy5Yzr9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnDMyw3QbHSMXA22QxZVKiRNwhrx8NJYze23R7afQeE=;
 b=oO8QuTtcsa4tugbDx3mjm7WjT20y6QfQWTaP8PqZc0aurimFrae0/eQesugBhWqJx2BvhhzuuWj+wSClOgX6XbCHPomyw/wyZbmU0lrnd8iTaSLzLMLtpiXdZZqClGtX0Wgg1oIeBF298Ou40AKhAwEBdfBnzjq58Wvea8z75t9sMh2x0pEP/0qDoI7fGzKtBbBRWjU3OHw13fEDhZqNeu5vmN3tpKlCWa48Hbgxq0zvNTav2DpkQqpkuXRERTiqyHCFBGnrIf6DeclL8ZB03lfGHwWAdVAoJqnwTjZL/Zzhp3cbzYM09Zy6wO4OzuUvd9yJc+dzy1pbGaOIeoUmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnDMyw3QbHSMXA22QxZVKiRNwhrx8NJYze23R7afQeE=;
 b=COgY1lSmWVUMT+RRvySIQGU1NYarcvAtKyyVsZy5JKIpuyhqx/CBxWamrPOe9rYDvQahgr74Iw4DhBghibJ3dYh/WjxjKXucrjvkpC9xWXhK742aJvlWUieVEifImfJ3rnQfrbgmqgC02lpvFIpVIP4ps8+5cKlJW1HbMdQIuIY=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BY5PR11MB4209.namprd11.prod.outlook.com (2603:10b6:a03:1cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Mon, 13 Jul
 2020 06:34:13 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 06:34:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <boris.brezillon@collabora.com>
Subject: Re: [PATCH v10 00/17] mtd: spi-nor: add xSPI Octal DTR support
Thread-Topic: [PATCH v10 00/17] mtd: spi-nor: add xSPI Octal DTR support
Thread-Index: AQHWWN+dU3MRlEjPj0CyeRCYqGYmmg==
Date: Mon, 13 Jul 2020 06:34:12 +0000
Message-ID: <e6d4c015-b70f-40e3-2275-89d245e817e8@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-1-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.120.242.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82e21053-3635-43dc-2c7f-08d826f6c1ff
x-ms-traffictypediagnostic: BY5PR11MB4209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB42095D53685EE8AEDE279F42F0600@BY5PR11MB4209.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QijyGuGI4OEbBQqMQV1xedgHIrLvrv+dRHFKtO3fLb3C2xHx1XjPowtaVOmOjHVhMPmjDLPSIh2PcI4bHUqvpKCsgBNIWluQu1ShVx41G7nZ62TJ3QS00uw+RYtu2xEiTxuloouxh8rQLiJUBrmG1FKEbt0Ubo9fzR9BpO/v0hIuQZOiGVOqdl/kewjcyPtyBysIhgw8l7t2F6Jtv/JRm0v9QaaD9Razx5+FUjUdOkLLGL9cIUiBwT/Dk0d8PipABkcu+5QMWD1JDJGboEg+ufwDK+RGEUXqjKV/EA1k4QXkOfiJNi5gQ87EJ7Epq7g34cb+aWPuFIpqZe46tbjo6DoFlyDf7H4MAMLCk8rJAfNoTjBBmH6XTPrgTW27yg0G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(366004)(346002)(39860400002)(376002)(5660300002)(4744005)(86362001)(36756003)(66946007)(66476007)(66556008)(66446008)(64756008)(31686004)(91956017)(76116006)(186003)(6486002)(26005)(2616005)(31696002)(7416002)(71200400001)(2906002)(4326008)(6506007)(478600001)(8936002)(6512007)(54906003)(8676002)(53546011)(110136005)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NybGGYnjduU8DXGte2aLD8aoaOzP1tQl5NWVvMG6kmkD40GgigChXBRWXdwiNlEy2jX1hK36VOTmkV5qJ1ghM96pEbbtt2dQMxv0ksKVQvM1xvuL0dX6f1ld1lQAX6FkhQmHvjGgMzqhwr1Zd4xN97R5k+9ngxQ7fvw57jENZR9JfX/SnRqoIR4jDQLMEWNpndRu9aC62RO3FKNSRDbApERfmULJg6rh8aw9Nm+3Z8ekZQJTq2Z2xqy6saSM87rnWmPnOHDug12Gn5itwq6O8/fV1rrpV+dfR8nClxy2vdVx7+/QyMFlS13pALWEhv6n4yCd7oZyo0xsyWk0IMd3VKk94RHpm6vhfueyPZnxCp5fuf1H2DDqbHTy442T8wzYAWt7xQ2Cw1RuvrIlj/Z+JVHsczK2Q6wu/i3XtW6S1iBtKlOuJl70Cgl8qPd6uV7NNPLgrSvgwJltvLTWKaOlQ4yLkvnRLwYUutOLu6q1D5goK8Yt3lj/cEBy8lMmfj3D
Content-ID: <39ABED06096FD34F84A063A46A2DB065@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e21053-3635-43dc-2c7f-08d826f6c1ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 06:34:12.9862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a67yzXmwzKTAvOg7BD+09iwnrmxUf5qassXLlskJr03u0QtgfTdwiwr1kVpYsCUWBC/EdZ4+Hia4i+hjMdfckDTVsvFYzd7k+8S3yySIIs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_023418_925615_2C22AFF8 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, richard@nod.at, nsekhar@ti.com,
 Nicolas.Ferre@microchip.com, michal.simek@xilinx.com,
 Ludovic.Desroches@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mark,

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> Pratyush Yadav (17):
>   spi: spi-mem: allow specifying whether an op is DTR or not
>   spi: spi-mem: allow specifying a command's extension
>   spi: atmel-quadspi: reject DTR ops
>   spi: spi-mtk-nor: reject DTR ops

These four patches are looking good, I had just few minor comments.
If you too think that they are ok, would you take them through the
SPI tree? If so, I would need an immutable tag on top of v5.8-rc1
preferably, so I can merge them back to SPI NOR and continue the
development on top of them.

Let us know if you want us to resubmit for those minor comments.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
