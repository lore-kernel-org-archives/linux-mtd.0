Return-Path: <SRS0=dEjv=AT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADA1C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:23:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B022067D
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GAVsPJdM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pYqZrjvt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="heIpfoiv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57B022067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BT6k56y+25kxQD7Guki7AQBieUqE4hsw89mhxO/bwik=; b=GAVsPJdM5yCYMOgdGNH+iFB2l
	LXsGLkbHhF/+jmRnbLfsjNWNG8kOKXiaKWmzTOwYqDjywMYzdSiv1k0DMiy3Badbq6YZqD1tDJ7b5
	VF0ST5bKwC9cNE7TTnaWt8zrwcrxUpnqDdzdYTMs4IlY8ICKsTqoR+sY+MdTuAUZ9k1Z0H6ivvpRE
	Ho7ZYtuJE8nIgF7qQKBc+TIPbYOj92nqO/VIfNJ6WP6QOGTE2ZG5p9GTErG0uX8bLbdsm/2wcR6JR
	Xc6hg8gIqekzX83LNBH4xM07xs49LnigH9+UfFj094toOtxKrKA3YllG8MYA9kZLfOqt2Ose26jBt
	U/7Bczecg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCqN-00022E-CI; Wed, 08 Jul 2020 16:22:47 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCqK-00021M-IX; Wed, 08 Jul 2020 16:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594225364; x=1625761364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ix4gTCSof5dy+v+Gil0mgVSTSi2mz8M767Bp24baUS8=;
 b=pYqZrjvtO0axpJipP8jleSp48zWYd0o+zO8FlGL5pJqZ9OuJ9OWmgitD
 2zivJdsWuJngqpfLYPC9hGMdyCOs2uLbn2TyIk6QUHrmoAZ2DHdWUk0Wd
 EEZbYXQDOgzMFLCwSDlqxPhxS7PcO6T10xVqlPaHdIhZu0JhPpU34MGCn
 8Qd3tLS36fhpSNK/J2mZawBO4+HiaCVJ3YQ8vsoUsmZlg1bYduMZ6i7FQ
 7J5EpwyxN5xWn2ggC9Ka8cGbYLfcNz7vz5LG9C/7gTlDXCaPXVjXKc8Yj
 k1BQrQg1ZKT0kxdJpfIFvpL4oyCy96/US33l8PNOdbFnCA5fcyLXawiHa g==;
IronPort-SDR: URNNe5lIz8bdugS41XkoCIJPARLTvqbAX2MUUXa5Uf1EKr1TIqNwFzY4nZWAhKMQYolb6J9aFC
 QXLk3E7nxbNrzgfD6eujPxQZHM9aOvV1kf03BMlc/RnCTwomXjg8tp7JsyBcO4dxmjMBMl+na7
 TQ8r6UwDiKN8l+4OqDdTpk1VrU+7+j3yqAVsG3/MWX73MbDNrmNzchZ3g4x/2tMgUQ/R92F2x/
 R0+JtomnQ9HqkH5VBfDC2yKhGjwcUTmtONwNaWS/qeUko54JNmNdxG/Yqnl3Us5y7jrqoqXoyF
 J4c=
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="79173523"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 09:22:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 09:22:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 8 Jul 2020 09:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeCKkEUnpWO4onYLIHJMhc8najPI+7egm03AnRQokZPoaFDtAjG3iO3YszfuCwtwArK5OwLFhPoOAMb2LtQHc+Dkjw2gLwprkPlfbgJw6Gs31GZNAc0X+f3tTfj2VD+s1TL/f6QQFLCoeL71Nr2a1a9Z2H22gUJwj5wR9BIUZrZkpyrRody6wBGu63n5FeN2T5vCTL4MBS8wJmv2HVALilTQRv8zdO6hjX+KZcqm1fDeT+o1w+ewclflL0AhBC5+j4vXxQpqa8QdmkgCI5tCi3z3S6SDiOekIXYKxLUAc/nAPuXHT9EXn6kJYZbG/IX1Lf+Kc2MsvL6MNarBdlH7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix4gTCSof5dy+v+Gil0mgVSTSi2mz8M767Bp24baUS8=;
 b=KyIQM8xPC7ks8ZykKla4b4urbnVxk2OTsZVvm5WPr7iSyIbUlrgihBcck+ULaQ8iTGY+vqyg7+2e2X9/rzLpNsCNf5cQw/WCEoAGJ8KkBWAOsqylTudVdQDn+6GHtZKB8Snld8hnp+mzfCm6Rpf7P65vFumBOfCnQIkbbe6pd2sL3lEJrxyPJqedJy3kYfVZ5gTukUkPN3f1+ywehQI7frW6h4dejFeZRDwLEllHnw6AL3O84A6onDZpZOdW3utoq1xOUHfv6o0sEwpQ1peY6THjX0Mx6guDRqSnxySjpRsQsLYXRyXQiWKNK9JIYMV9962vKayuCG3kDtFXbbj2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix4gTCSof5dy+v+Gil0mgVSTSi2mz8M767Bp24baUS8=;
 b=heIpfoivxn/cmfB6q4saJ8D3LQS2piVilPZysPkAsn5iGcu6LFoEwZ8R7jQRcFLzEgMr5rv1CuJ7sh847+aUuuqLrMxV4j9ckXq/bFaquAWyp+MMdjqJ3L+rEI2J068jEPtlPWvcEH7ZE2HFSj8HXh8BSN6oZ2DTnwKKVML4YUE=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2870.namprd11.prod.outlook.com (2603:10b6:a02:cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 16:22:41 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 16:22:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 01/17] spi: spi-mem: allow specifying whether an op is
 DTR or not
Thread-Topic: [PATCH v10 01/17] spi: spi-mem: allow specifying whether an op
 is DTR or not
Thread-Index: AQHWVUQAL5FGGK8980aliLC/F11sVA==
Date: Wed, 8 Jul 2020 16:22:41 +0000
Message-ID: <c795bdfb-2acb-1496-9d40-045e00556346@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-2-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-2-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c27ad3d8-b2eb-40b7-1279-08d8235b2381
x-ms-traffictypediagnostic: BYAPR11MB2870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB28703FEBEFA37B3E7397B155F0670@BYAPR11MB2870.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s3vrfTBJU9cIk4zrY9odxDYdFL5l6tF+Ncr1crnAmrddi3KDCcx34hQVbpkyEZT6xBdoj3MhqH+IBQubGQqpwDfOLmXED+epkexRr+XSXSSff6ddhHMDnwqCk29vYA6yb0KXWiOoC4ujFjMMpAhT0l0QPSqKSjGpucutVg7Kt6hahJqMo/y3dcxATJV4FDE+mGrtmUZWB2WSMq3PmilaxDBxUd3VnWjl6HfT0E0x7iJa0ZaKDrM+cUaC0ezWNNzMnC6NyERyHkxKk21yrlVU19kTOM3vAxgukk/63HrpHWZZSxw/IOVY+1hXKJS7URzUiTowtI1ib95aBMXt4wHrpwghgiHhvRc+p5lr+xkat+Qb2Ay/qheVUabR5x4IfeT1rUFp4XyORAT9K5IObTYC+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(39860400002)(396003)(346002)(376002)(31696002)(66446008)(6512007)(66556008)(36756003)(6486002)(110136005)(7416002)(54906003)(4326008)(5660300002)(86362001)(76116006)(2616005)(66946007)(316002)(8936002)(31686004)(8676002)(66476007)(478600001)(186003)(53546011)(6506007)(26005)(64756008)(4744005)(91956017)(71200400001)(2906002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: EzmseE/hKiptJbykOfo8N5tv+ihQWaX+pxLh0ObTIPlXttUlV1IRtnnmlQ8XLZ/lqG/jp50VVR4L9whyaRWsumSqzTPw6je1Jprw6Ra31MRcnCd1tLkcfp976Trj0dOub2Eb/+lGfIfB31PFrfwvd63W7qixdFDTLljT1sS1dRh0dyosmV6YYk2NWF+goM32H5rpzZwMvpsvJf9Ew9qKfpFCYh7aKh+o4aXnPtU6FJK5oViESETRkAJOovCAboeZwSftAYWzcTlfWEmT24MldhDksDuvinPOWk43Z1mtuBHc+yz4p1qe3K81fzhvi3whqvN1cBPQ7q5818S1ohlPCPzKxgm6T4QC5TFuehhkXww0vIO+BMOjHPBRg6cDOFDifgpGvbREFJkydSbJ1fKTduJ3MiCplZiS0i3+milI6G1zlunEvhLcFzTbANBd6PjW8QHV8TCYK5G6izDzl5HdbNmqueK/A/LI9MC+sV+B0fo=
Content-ID: <52435D2550C6564695CAE7098AB19FAD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27ad3d8-b2eb-40b7-1279-08d8235b2381
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 16:22:41.6553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2f5uPbHCZFE+sa2vivsosBWKPbAgL0sKYJz9f4YNWFE8GtABTA50r3j9Kw+yZkt6uX8dZn+9av1/Orq+Jr4nYmk2r/0rhs71BrXDKtIENQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_122244_787343_85E6B703 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Each phase is given a separate 'dtr' field so mixed protocols like
> 4S-4D-4D can be supported.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/spi/spi-mem.c       | 3 +++
>  include/linux/spi/spi-mem.h | 8 ++++++++
>  2 files changed, 11 insertions(+)
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
