Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C94FC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:11:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30E02088E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dbJt66c8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FOqtOMv/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VRIIpnsw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30E02088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erZGyBV290bV4pC7dxmV8DEGuQW9le+2dLho4TuoP8c=; b=dbJt66c8++Tc8b
	57KliyBkS5/uBwnLZTVvLIwvR52BaQs8hKQklKXffXVxxVqDoIaXvRaK2Etk5OjMVLoezxuHqBdFf
	UPE0Idg8k/XmAlwwEYd8CNh2yVm+wYS+lwdYm+VnnNqibCDr0PTxboNRdSdZph/vKpRyI3HLLyugQ
	aTliy7GA7xEvAavhOeOLUlW4W28zP3H6C6weaMBEiW6SNjFJcpoUcjjSuoQ+x8fJahX7qKqUFGSLW
	T4Y+J64hu16SdeqpxDO6U1F8hlqtKmf0z7kWjVcPz0s2mfBhFqglZGaX0DSlT650KuoanC93al8xx
	v9XaQP3qwUqSnBPFW3ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDdM-0005TF-NX; Thu, 28 May 2020 08:11:24 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDdJ-0005Cn-Qm
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590653481; x=1622189481;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oKdG8qun4E8L1I+w6d/B3E3Gp5/SpK3R4gwA7yKPsVY=;
 b=FOqtOMv/Yfu5pS2TPhqzaBH/T3EUo394aRnYI8pwSxKvuuiqkqM+Ie2/
 jGxdY9uprprWzKZvq8nfEgQiXc1iOqaGHaBbCtykcaxQYEC6pohyApH6a
 i9CW0Wji0o++J23eUDqINgTEhMTFZD/X1ov4dvGqOy4pXg9xnOZS2TAGO
 zzOcYMCMWJWQZ34kAI3t0BrDqOKOSuC9MIfBoF5XvZdPJDE1mDb2y4h2Z
 w0H/EJTB9pQ9GAx+X7he3sXvCW+Q5/jp5haloWDusihXeayadDbJvuSL5
 ctWeK+HzTbXx5UKmt0raaQk6lyryEqWBvkkBZPs/YYi7yBB03BQ/SYzHf A==;
IronPort-SDR: 1b4IpLQ2+scldXlSWnEWVlmlumMbyqUKFpmlvwlWddHB2GFyicx8ajzIh2l7PFMboPX906ZCFa
 10dV8P3PuzLJACLQBMUU9foABCgIm6QNVFfoeUIrLAU5OCPske6Wy36iWeCCDVESDaYbync6EX
 fbirX9oavaIJ+fjPbYeDTgMMh2TLWiCu4OwlXxTlxKhvfmtW/eUTCU5adxuP+RV/zo8HmonjFb
 pZx3W+sRbvCRMOXHTsndDKBuMwvkBBGdAxbFVXoIWcVl/g74MzCwgzet5Fq2Q+ybZHkFM1R9DA
 IDk=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; d="scan'208";a="13767578"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 01:11:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 01:11:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 01:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lslMKTJhDXm8uMlfGTg1CPWPVaqSgISnzXQsfaNKeKVk1TnbVjMK6VqyKIOBxz71PwhVWsjmSQGIkXkBmOMK1i8SKRJYrPj0ia9+wEmtSOC0vhNZF6/dZnH17J2jDulOUeG5lPq4l7admYZA7ZuWn27J/ek4hZJNtt3DwvKbq5+tTkpV7AZKviXy6+LCGA3pQKBCYLjfyAiLX44ZCV245tGR5feEUAW+30gp3H7XHIoN2ITqt7OjIJ5cQA3dI7t0y/LycCvIlI3mK5LTKfQdBPD4hec46m7Dhjz1lALwuuLD9gNsIowFNKT7awUbytVNfi8WlQNd2Lgb90IetFZBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKdG8qun4E8L1I+w6d/B3E3Gp5/SpK3R4gwA7yKPsVY=;
 b=Jtuj2B69f7CbOIqzdpCTSXVItF+V0Gs2Xfg1RVnQT1JT2CbGpbYSlvECKujUatkBFATy/RCjnevEWBBfOThEDUGhCOGDC7MzbnWdfUzZ9017B0eX9XsdGQdEE2lQ00I5vjpfngtBzwklvScILLayJHnEbG1/wbYrTv5ZTNGC8Hc5zGa8ZGzFzRFe36HYXYe7bLI/CcUPIDusO6nfjpnwJvUVbW5fy7K7yRuZx/YbXA8FQ5hzLV/wBUUK/DIe8VHsoA9yU5cemjM1H/IhxPYbgKqOETu88GG8w0V8iELqzixFww9IoN4ocbrwGRWFAno/5smXG5yi4a2/gzLb6X/7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKdG8qun4E8L1I+w6d/B3E3Gp5/SpK3R4gwA7yKPsVY=;
 b=VRIIpnswUclVNXr2QJSLhMnj7uKhHCHPKO8gAiJYifHjQupi0lWNhmU8WwlLSSH5pRWhLw6u90ZHOI9uSPjd37+QkENtXodwXCmtQZLaXV6q4YG2K6fUHSnxKSGCwnY6Y9j8k3cavh8ssxqWWDdbAyLQt3q1spX98awnYVXPWhA=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4134.namprd11.prod.outlook.com (2603:10b6:a03:18e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 08:11:19 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 08:11:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
Thread-Topic: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
Thread-Index: AQHWHTmu4YIGhT4FWUWxDhX9JtN6Iqi9VK0A
Date: Thu, 28 May 2020 08:11:19 +0000
Message-ID: <3728086.Ny83poZDQ7@192.168.0.120>
References: <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
 <20200428084739.799468-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200428084739.799468-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd4af50e-0dcf-48ca-edbb-08d802deb3a7
x-ms-traffictypediagnostic: BY5PR11MB4134:
x-microsoft-antispam-prvs: <BY5PR11MB41344BF198845B0F46D17F6CF08E0@BY5PR11MB4134.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:78;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1A2mF2iTikv8lqplGF8zPYtdXxnfQJJ0KIEfW2jf53C/UfCoOZeYN6U/lRw6fu3p+no6TuIRzZQTbfdUsGO/qodLnFBqus4aKnpeqJk93vN8k2MphjPVVi4kZ6g68xEWcDsuzG6vRNoZDplir+89Z94IumXSdUez3Y2pVCGHa+Iy9X9HUBc8nqzVISyEH4llCxN39RhRoldgi8gkRJiw3UR04MN/pO78kgPwRWENIKB1ZiwvjQGCaXDQsVEjWWt3NuRlxvU4Tnh8LFvNZDplQQUJzzxc05XWy/0BMBAIrjwQWNw6m7k24i8sY7u1OarLxXqWDIkZlLT8wXg5P9G4U4qkzKJj4IP9bYPOSIwBBz7X/j9V7871yxtvNpu6CQ1Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(39860400002)(136003)(376002)(366004)(6916009)(26005)(53546011)(54906003)(316002)(6506007)(5660300002)(558084003)(86362001)(71200400001)(2906002)(66476007)(66946007)(66556008)(64756008)(66446008)(14286002)(8676002)(6512007)(9686003)(186003)(91956017)(76116006)(6486002)(8936002)(4326008)(478600001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 3gaUBmEH5wXWlN5FhnmTAV4lveBE3mnGQ9P/iRjQMucQFwFL279ns/Grt+jq2+oRgJhHbvAMUrh3VpeQ80RSGaqvUk+rid5Jey4QtLjxwlg8kUMXH4MS04+wHqSCiMlA+2/2RSnolpvoeB5/iH267DYukueHSNpxbUw8kz1vh8e+oSJXY5mmzUBPznfUwLWbzjSlFgfMMHdGJLT3QJOpBB6pyMu7IUQgglvq1pkYJGaXJlb3HDC7x9GsZWg/4l6Y5mzGJ+if3wsm70a7iojuVEqCc2qzKRWo4A+YplFz9oQ4xnvQ0032K2APCVxwsNC8TVvv87PlyaibM3GZjpfdFw+kGzLaeFXY3IHlB2VbHn62C3fstPij33rn30EAxc0O5pRJVYmrNgluKOx5MuwNZ9BrRzn/SMlYbfPkd7qHFQr1Br9BgkMKoBeqBz+XCjOeKACvRzPDQDMzUZfBehvD2iuJjg1fsHoVvOnfv/SK62o=
x-ms-exchange-transport-forked: True
Content-ID: <E8605C25C204E245B802A5F4C0CB5976@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4af50e-0dcf-48ca-edbb-08d802deb3a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:11:19.1348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9YW65+uld2+vL0rpWf/CaG4/UY04apAdMbxEJk6Uf92vmvwVvtK00hXKHTCauP9SjT5OyW1E3nAm4HsJVQ7BWlXHEMfx2M+lV4x7YLdcVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_011121_946784_BA1899F3 
X-CRM114-Status: UNSURE (   6.25  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 28, 2020 11:47:43 AM EEST Tudor Ambarus - M18064 wrote:
> The correct terminology is serial NOR flash or SPI NOR.
> s/SPI-NOR/SPI NOR and s/spi-nor/SPI NOR across the subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied, thanks.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
