Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A218C35DF9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 08:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2282176D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 08:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STdyJvtz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="hd0wvuWi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2282176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okOQPL3YaAIzZSm672a6s4Od+yEG1vYJExtTDL2urs0=; b=STdyJvtzo/bNH2
	erFanjMrTrkstfCSE7x5MvRdlnCi9LlG2r17NSuPa1HF2TOZf+O+vNTWtdGuU/kw+JoRZioFUZMXL
	7hQHb7YkhKNM+dQZ6622us/FrgvylaVkQ7GgOKMTu5sX8j1H1W7BonrF8Hjn5ggNmSz76yc0yuYd6
	OuC1XMYqrAZJSbU9I5U6PnQmRU6P+j0VyvhW4tA38UpWNrmEoQh5VrWu6ANmctmCQ5W+Q3Fgm8Mqj
	/9sRzELDGZpzIVuVywe3LPsTFmGmcKYNdAOQS8rfKEjZm8okKOpAsAIA027sPPo3tVRRm/vmJ8GPv
	onWNphl816/A9yHVHPzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6VS9-0005kd-O6; Tue, 25 Feb 2020 08:20:29 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6VS4-0005jr-Kd
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 08:20:28 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: K2V6530OccNkmeUIJ4WyEeVEqNjfc/VAgJPFu1zqC4g8WkGbDxBdy+e3EcdPaVEme4mTezr0n+
 WyrhlfYnzlFOAFWIAOmbDSkdUuol6pVKzvNlP9my5crsUtD7KSeM+mKJAxFbVA7t9/m/uptdmh
 NZsJM/d9If7R/KGfpSZKRCJTqXTWMIaFZnaXP0LTT8857wuh5GGDDZ5G28Ndruzia0N/TciC0a
 R28HBw9KpXUlrj0mE89h2AvEZyRjfqjL8lEgIWy5/jnV4mLeNlP0a1dPso7r8rnR/6cRzxWjEI
 DAg=
X-IronPort-AV: E=Sophos;i="5.70,483,1574146800"; d="scan'208";a="69681606"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2020 01:20:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Feb 2020 01:20:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 25 Feb 2020 01:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCDARck4RhzPOp7wfHtCBIkyt97cZFYFuqCnAom4xzRYKRqKjeUHItH3/AiImcctd4ma9vzsIyX/mpnl1fe3+M6Qcp6Zfu15qThBZERHT6D9HGiNo+rWtrdSznqTs6pyBKb8ls3jNN1He4iz5QvOGa9YwOhAlijh3qMtGn3knR06c+DLc1EO5f7guMOAxl/TVVpoD/bELU5QTDEVLhd0jkQa28uq6B/ai+vvDvPW6wzwRi3igB1hY+QQgRjVZ117ZohoCfvWeIYAaTDwSdEprZj0neXslS0VvptqoYxP1mxzdNcSEyG8n9HmII143/yx5n997p7HMAMMo5iWeSfu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtroghnZQSssaWncA3QwkknM+kzvrf2+Qnlssd8I07A=;
 b=KRLSZ9E4Pw2LxF1x/BYDoMLUw6rZZRu4+wvUJF6C1pDoTOdjUqVxRky0YUqh9hAqVTVH9K8OHj6QSpRUeZkem6svDsoIUv8fJ70s7M8ujXMxXeSPS7eFJrcGuKXj4qX8DcEiLsT8zH/oH9+2gld3Os0iTaun9BxBT/lsEy6zHn4YZwIYdV4CkSrYw1PmD4Oe7z26sYeOOxf77Y6D/bRX2oT2W29ENytl/axEZxKbF5LZF2piyiTyz88mzppEKw6xBInNEvDzHGD8pfqAlq8kk1r4A26I81Qq+AMvuhQSmQFTjfqYr7+9VEnh8vrvbPYbVYHb7htuUtNFK9wNd1loRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtroghnZQSssaWncA3QwkknM+kzvrf2+Qnlssd8I07A=;
 b=hd0wvuWiO2/Q8bpPUOTzYeIT+i7vtSlt5g/2n0yV+AzhlOWsrEQ5JM85wW0mh6e9gxXy8rpH+ifXk8fvRhJCEmNP5kckKDhub7XSoUnmV1yw0eEb4GXe5iEp0ZxwbIZ+X9SSsseV3tn8vZ/arWaBAtJhYYsnuHwHsrlvmifFKlI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB3744.namprd11.prod.outlook.com (2603:10b6:208:f5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.29; Tue, 25 Feb
 2020 08:20:19 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 08:20:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV6JmIi2pGqMNGHESG9Z9T0h6ocKgrl5+A
Date: Tue, 25 Feb 2020 08:20:19 +0000
Message-ID: <2047987.JN3mLKOXZX@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <9aaabe654603679dffdbf4c57bcfe0ff@walle.cc>
 <21102931.kdR8orL0iI@localhost.localdomain>
In-Reply-To: <21102931.kdR8orL0iI@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 390b72d9-d188-491b-8b30-08d7b9cb8d41
x-ms-traffictypediagnostic: MN2PR11MB3744:
x-microsoft-antispam-prvs: <MN2PR11MB374485AA89296636A9E39E3FF0ED0@MN2PR11MB3744.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(6916009)(5660300002)(478600001)(186003)(6506007)(86362001)(26005)(4744005)(316002)(9686003)(76116006)(66556008)(71200400001)(81156014)(53546011)(66946007)(8936002)(8676002)(54906003)(81166006)(91956017)(6486002)(64756008)(2906002)(4326008)(66446008)(6512007)(66476007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3744;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w+wtetox89l9o9u3sYcH8S47DS78HI0X086STHxMVyVPSdZrIaxwG1935J8jruvWM3DmaujJYmSyOtq7zXjHBTlYBK8IlCnNjHaRl9HWYDZzV9I+y3GNJsLdEt0GbzOD2E5c5i5/kTvTf2JRTETJxCT52iuZS/g5qU1hibJcv2oQH/rsT9O9YF1AG+J21iC8oqlaGgAqAEpibpXPmOqFScNYjmsC0qm1DHLbtfNhqbYnK8TWUqEilYh8xoT0I4gGckbS65ikeQZU+RVC3hn16AaH2IJEw3B7z15OleJegJfhM3xGtShp9qJ5lunJhdf6zjHGRkGZPLQhKs/2p6NAPIcndQz32C8gSh4eZxHSZYikFcw16K49qqEerYJQGf5uPwayJeOuVsLT9oix3DflgCUWIxf5nOQCLRvMe1SaYqKk0kDGZCETdXQQofqmu+VDOIJBt2MpUaswxkDEIqcfpz6tjc/Iq6aO7MJ03sFguAG4XKJzGu+MJXTO/ilHuxGt
x-ms-exchange-antispam-messagedata: IinJAZQIognabquTjeNL/3zOJXog4X3/s37jCFsmtbLzDOSirq33edhH/kodNb6LLzI73PGDl338l4jyrpVADtwa5ii6MX3z/Edz5l27ipKPAal/8TzewvOmad9O/waWK3EO/sjaWkdbWhh/8mV5oQ==
x-ms-exchange-transport-forked: True
Content-ID: <BC99772CBABFDE44A83E83BEBCD674D2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 390b72d9-d188-491b-8b30-08d7b9cb8d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 08:20:19.3408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3R9toQfuTc4pX7FT7boPtKNiA4UUKH2cS2aaYw72PnDo0TPIYMvwZIBdxA6v/oYBbhrmuUtl1ttWkUxRrtAKDcjSeE+myXveQIwQe7Fslk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_002024_686810_A9C69D28 
X-CRM114-Status: UNSURE (   6.76  )
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
Cc: michael@walle.cc, js07.lee@gmail.com, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, February 21, 2020 11:30:22 AM EET Tudor.Ambarus@microchip.com 
wrote:
> Jungseung, are there any other caveats that you found? Would you work
> towards implementing this generic bp lock proposal?

Hi, Jungseung,

It would be great if we can have the BP series included on this release. Let 
us know when/if you plan to work on this proposal or if you need help. No 
pressure, don't get me wrong, I just want to schedule the biggest features.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
