Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06776C2D0BF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 17:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0A42077B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 17:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hh6tV745";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="FD2vC8pE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0A42077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/f/+o1ATEmqwJugheHFJWuRV4HWIufVDwKzY99bKzg=; b=hh6tV745DeCKNT
	4lPIsqgg049wx4bhZpjmNeip4hsibumpFMHl7/8GE/MEAlf5Bbqf6THXTNUPmVfNbVDFV1YUBeZW+
	+4xh2DB5+hVV8hin9bY/R3hNUBcRIExbiuw8W9uE8N8Dv/4WBHNPWz9xhDCYLdZ8b+XIkQ2lKXFDt
	jwUhBx/7ucNNQv/QDYCpD456YJdC0cS9Gw4W+ltvrtMs97VYCRHYpu5T317vrzppLuURPfpappBZY
	kksiD2kQ7cKxP8vd7LvZrtd7oGe0LncUrw9UBhGXL8fgNamrg6miW3I9ubEeL4zeEsqCoVpLNB4YB
	2MYotWwodKOQmYZmOaBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieisZ-0004eO-D0; Tue, 10 Dec 2019 17:00:55 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieisW-0004dr-VY
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 17:00:54 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 70ky/2HfnOd6p2289zgrMVGqqOm5elFzK9HI61FKpf8XbH9R+z/sIfeP5aIpIkKX2bvBzOak25
 zeIclXeGB1zlLZErhJHBbd2he1g+Z0MjBZ0vAxFhJoKSnnyImDvKxcQEl+NVnDO21t6jwfubcz
 Hhear6cl0ollkGDZMY4scg4TEEZNNMLTUg7IBjX85P8Gp3s97h1bjKff7K0GJ9O15RxN4Ei0QE
 JsYFnQBJ1BZJ9NHXI/ZdcLzZUwiuuEnkFDgnyVqG6hLUwI9EyxxPJnwoEoCtgVTwKZlZsK7n8P
 wDw=
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; d="scan'208";a="59880479"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Dec 2019 10:00:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Dec 2019 10:00:52 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Dec 2019 10:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5uT9TJbnGONltQESYPjImh3pm6Ix0Jlpw/yH56SBa7VjmeNS6xhwm5L2CMApv6hlOY6nCkWzBb1ch//vqV6Le7oyuihKkj3G7konhVP4fn777ClBwyXYQQAx8AExr7X+dZjMXCmJNBoAF/z6UKJLUVA29/mtLoKBjfIYkNerV1uJOiNWoYB9slXSyrk/Fsta023ydCBHF3peirIg7wVduZ+TdBR+SpcxYVZXP9WH7HwGwslpJNUExvOWT7GbmnZLiOXX62zSM5T5Jq3ZZY3OjAnj5W8m4T6fr1wY5H4thA6jYbTqOdU3r3Pd4t1tn9SWMp4BiPxgfvTZqAsZ6A5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/sArT4hm5xgyAyoMROmaMTv7ehRr4ciPTcpEu3b9DA=;
 b=HheV8CxeaFRRgxwYPFejeLoLU7dVAYw7xfcDgQ8drA4Fk9idsCP3xae8k/IdbTn+GqyAd5cvzdl67xBUVq05WgnVUN1LAvdAt2CCC9K0Cz0jSbUG5ZZUsIrr0iwIeJ3kcNq8GTM4NFASbVsvca6ieKfbOy0tc682/KY9es13KBQ5N8UhN/IIb6gvY/nDXlNetP2IhAlRL2hTsTF2R/FDoto++p+m7BR95DfnQztbzdehGS6H0LsiN1kDs2L5Wfkq1+1eaOA4igT2lq8IoH+JBum39kDDqH4dyJ+6JQm3K8LXoA+8/3Kj8lDqJDDcFvd79ycAwBBDPUOMh8cLTrsAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/sArT4hm5xgyAyoMROmaMTv7ehRr4ciPTcpEu3b9DA=;
 b=FD2vC8pE2f8BjFxG44mpzbPRJpyB7jsYi9cHnzdgwcJNVv4SKSuFDdsLiqRfmOGKb/2G0QI6jcAsS3K/p+c1N1sqeDi0JIUGcFxarZHTnatEjRTx/plZhkw0MGDxI0HqNUpPfNnlk6uAcm277cio8JPUIdeUVbhpHb0u0kSdFeA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4510.namprd11.prod.outlook.com (52.135.36.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 17:00:45 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 17:00:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
Subject: Re: [PATCH 0/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Thread-Topic: [PATCH 0/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Thread-Index: AQHVm5L7VyzIMa4LwEmZ6LUHKgpgiqezv4sA
Date: Tue, 10 Dec 2019 17:00:45 +0000
Message-ID: <8f2908ec-6e17-dad1-7f2a-ec22647caecb@microchip.com>
References: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0049.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191210190038828
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe413b73-f0f1-4e8e-7fc5-08d77d927f37
x-ms-traffictypediagnostic: MN2PR11MB4510:
x-microsoft-antispam-prvs: <MN2PR11MB4510C6B3EC937E5FB2B56A49F05B0@MN2PR11MB4510.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(366004)(346002)(396003)(189003)(199004)(5660300002)(52116002)(4744005)(71200400001)(6486002)(6512007)(81156014)(8936002)(53546011)(36756003)(7416002)(31686004)(8676002)(66446008)(64756008)(81166006)(66476007)(66556008)(6506007)(86362001)(4326008)(478600001)(186003)(2616005)(54906003)(26005)(316002)(31696002)(110136005)(66946007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4510;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hc5g0b+X8NkoQYR9k2grD4t9M+U+gqrVGPL2TDfWWMHdcMS95BV/gNcfgWvcqCpbouVW8Nc90KpXw9puXEJJc5VvjWuvlUTm64iAVwWVsef0DHZCTIme9buFnFrUJekkRIjwLUaXX+/CddU+FprlpzVweoYPvXGVsLy0jNxNHmUYLSplSRx+zSsG+/ABJBfcbn9KzebJvueGO6ZwPgkH9gELi8h9kBZDwy8BZwZH+OCJUq0jvuwWgXyTKoXOFYJOIu6aNXurK8U5/S39saHQvljP+Ojp16Bd2ape/g9SLzpY5cG0Ne5DrUWx2W6KR3FbbHOyUmdXr94TSht7BXUz5vnlMWG4EyDQ3eTDE93FcI9uk9p9UWVVk7l/dXkNRdIPfLdhf8fKM7QdGQE3k7h4+zlxF/ebijISbIKhhrNUkeQ3NX8enn6uCoxRF7b5mDnm
x-ms-exchange-transport-forked: True
Content-ID: <3898D962452FFD4FA513E1098B602C40@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe413b73-f0f1-4e8e-7fc5-08d77d927f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 17:00:45.1614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 201sDRL2xOnzwujqSNmZxnEw/lc0XVi9mcX2SSLVPqRwbrJJZOctrZe13qwz8UX4ZoAuVqq62+rVtNwZqQYIlTeomtJ4gGJXljPSJavKa0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_090053_040456_E1F6FD2E 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason,

From the discussion you had with Vignesh, I understand that a v2 will follow. A
nit below.

On 11/15/19 10:58 AM, Mason Yang wrote:
> Hello,
> 
> This is repost of patchset from Boris Brezillon's
> [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].
> 

[cut]

> Mason Yang (4):

Did you intentionally overwrite Boris's authorship? If yes, would you please
describe what changed from Boris's patch set?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
