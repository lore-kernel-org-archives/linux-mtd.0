Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1047CA9ECB
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 14:28:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7102C2083E
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 14:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZz1/ZuP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="B9EbPqdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7102C2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNcFYXtKxf9txcM0gIHKEXz+lZw0S/IVJxczuln6NOY=; b=EZz1/ZuPd2TJ1n
	whal6LguNS1so/IiN6ueprtWjO+Eb6dre+rBd+RJlDkkZYaBWUShqkd5AP5fYtHV0P4ubZ7gMZDiY
	sG1T2/axZRefXDYWQdmy7CRri/wrFSxm42OCWZozys08+r8rSOvEs3FlX76tHECwItxFX5TXXeS/r
	GoswbobIhEIswVt4EexA9k2tGtMj1D5S8gEHAImh4ENi9sZbrm7K66LgocKrvwKNQofswudTD/x/F
	0SOeQ8aQgMJRs1Y5SsgHvfyhjhba8pUKY27xrFhL20GNRS6IGBGO8l7YXaQKGCPq+UQ4jFhMntorB
	H4JJdtt1EDg4yIlP/+cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQBQw-00070L-8n; Thu, 31 Oct 2019 14:28:18 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQBP1-0005H1-G0
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 14:26:21 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: wwGWFDu7QhdAxv+PF9O2hWrWGT49+t086N/oAzIxIBLQmHvCWMp9GOMSSiJOlvydQIub/LcXJU
 CRZC2NIGn23up2X1RFyNmjAe0vl4Z3yLvAvsYbyVwhtPTF0wXYDjkMVGrFyKsmDvNFFzhbmtbO
 z9pBj7iZ0atP6DeEYEey2FpOZpUDnXC5TtQHHKfdWjnGMsR+P6ei7efg1J67reMDj2GC0emwss
 Jsddp5yXLhBEpzotHUnunJCiwYhuxdM5sgEoilNRa6ZNUa8cufCqs9Z4ttDdgojy9ojj2Yev2N
 70k=
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="52346302"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Oct 2019 07:26:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 31 Oct 2019 07:26:18 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 31 Oct 2019 07:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgqMZaZXXA7kB6knWCMVTxupD7UI2gEztcYB4+KCVb+lu/CPWoRNn2dOfaAAo5EttSgFbYzIwJDEqlXMEV24wn0ASk8MVVNu5Bjf2pRraDzeQbafXutqBgEdhoPk4DkiIlrJ8J6VHwaEAwJIcmyrtVjk3AHVWyDSKVa3vqHMBBuPwGRwfiBYJ2JzddRs79swaGCV8XVXLe1RgWmnxKwpffP21sFpBm0cZ4JqA1zP20jFmT6eeFP2FZ7FzdrE4NlDJe74MwMg1jQJS2tCb9arTw6LH1DZlR4iUPAFWZjjZk3wFNYWXp0Tc+anm8iWIB7mus1fL44uU0EwkQ+dPL5pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a22TJkfWtwtA4OLzYgMIiq0VB27cOFVJTDk7/um822I=;
 b=YElM/UoYZsIEMVSyMGXF8d3Ix9FRWfgIhkQf+btErz4tz39FjFt1MPXWME6xU0dGbfJAbKXWcUCGd3vv6aLENdTYG2UXyPHxusRSLHRbStizKu9QZD/vLj8Mi3GQvMkykOa5uEgjsHwL+SYCWlQCJjUBLeFq76zvAQDT6ZWuMDmYvSXTijOJkHdPW2DcS5s2bt0eG1niJzGq6s6EQGJ0HR2VF7Kk2yXGmtjREkcPcTFZCPYnXAnVvo9SPbkmFc3FiFQ1b3F4OqOEvCExBoFq9KtpIuxcGIlFLoGTZSwjQwevr8WiCSB3RQ0h+7xScIyHWW62KI3YxjL7d1My0yLSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a22TJkfWtwtA4OLzYgMIiq0VB27cOFVJTDk7/um822I=;
 b=B9EbPqdiOwjo4089y4BL4KhRB1RrUahi0GPs2EzKqdfuBYIKKQetSbLP2zqHiDS6wGINJsy/kBJCiCmFTRrtiiKjiq9+S5UuuhNy5HNe092hrUXf4fa0qoe8nTEYVt1hQ9HVJAVsYx7YC5gKmpoRwU4oq+kREoZk3fY+Nqo6KzY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4480.namprd11.prod.outlook.com (52.135.39.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Thu, 31 Oct 2019 14:26:17 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Thu, 31 Oct 2019
 14:26:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 10/32] mtd: spi-nor: Pointer parameter for CR in
 spi_nor_read_cr()
Thread-Topic: [PATCH v3 10/32] mtd: spi-nor: Pointer parameter for CR in
 spi_nor_read_cr()
Thread-Index: AQHVjkpkiF1slcDF2Ua4XfvPGlZW3Kd0l8wAgAA55wA=
Date: Thu, 31 Oct 2019 14:26:17 +0000
Message-ID: <f203cc52-7082-5e89-e6de-9bf44dafebb3@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-11-tudor.ambarus@microchip.com>
 <20191031115856.4dacc552@collabora.com>
In-Reply-To: <20191031115856.4dacc552@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0093.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::19) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34207ea3-7c39-4786-0bfb-08d75e0e4a84
x-ms-traffictypediagnostic: MN2PR11MB4480:
x-microsoft-antispam-prvs: <MN2PR11MB448017B48C11B6B42B49EBEEF0630@MN2PR11MB4480.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02070414A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(53546011)(386003)(6116002)(52116002)(186003)(7736002)(26005)(66476007)(66556008)(305945005)(71200400001)(66946007)(64756008)(102836004)(66446008)(6506007)(486006)(5660300002)(6916009)(71190400001)(229853002)(76176011)(3846002)(476003)(6246003)(11346002)(2616005)(446003)(31696002)(36756003)(6512007)(86362001)(316002)(8676002)(6486002)(66066001)(2906002)(81156014)(6436002)(25786009)(4326008)(81166006)(54906003)(99286004)(8936002)(31686004)(14444005)(256004)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4480;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kpcBR3rhmIjSYYwl4dxtY58FkhvRHuGzckhAfWWYGy9TdR/zqGcBfWeZ5zFaT0Bdq7Fy7GodYMCwWuRi1qIsu78HcgSOkE4vEvMLOdH+4AVqevTyrbbzAao3E9P836iUjWuP8f8APd57vByI5y3o/1iOSX/YFEW81t/OuvYsu5+Lq3B2Xi116zxWTc3zQXXFNAGXWRM32pbZ8ZEde1fO0XgDhZkTI91ErNkxFhaI8TNo5X2qRMrX4DmWDVCJdvXPriwexHcJsVKzgZIG3eoAIR2qAfMnUXckPt02w/D4r5vZLUm3AN/Kf7g1MmEZKcZZI0E3M7iLoRr2tjxFCtp2ZrZnKA8+DBsp3FUEw1q/Y9hlyauZHr0GUrRo7GPEJU8MHLg67CTlL93d5YJDOlMR24W+Na+qqGuYJYtMKEltIkzCKHC1SV6iSCX252BVrP0i
x-ms-exchange-transport-forked: True
Content-ID: <5BF333E6E7A5644EA4F7A7A4F2402EAB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 34207ea3-7c39-4786-0bfb-08d75e0e4a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2019 14:26:17.1913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoZ7J4TYKFQiW02dfBycN8wUiFGeHEwDHGyuM38fXwZZ2tO48kbDN+egWykKC22NJNxG0gFGw8mDZmGAXynek8JmTPMALFLX7Y2ke1p9Vsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_072619_618177_18BC62E7 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/31/2019 12:58 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Tue, 29 Oct 2019 11:17:04 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Let the callers pass the pointer to the DMA-able buffer where
>> the value of the Configuration Register will be written. This way we
>> avoid the casts between int and u8, which can be confusing.
>>
>> Callers stop compare the return value of spi_nor_read_cr() with negative,
>> spi_nor_read_cr() returns 0 on success and -errno otherwise.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> There's just this &nor->bouncebuf[0] that I'd prefer to be turned into
> nor->bouncebuf if you're okay.
> 

I used &nor->bouncebuf[0] and not nor->bouncebuf for consistency reasons, but
sure I can update this. When writing the Status Register with two bytes, it
happens that in the code I pass pointer to the second byte, so &nor->bouncebuf[1].

I'm ok with both ways, and since you signaled it, I'll change according to your
suggestion.

Thanks for reviewing the series!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
