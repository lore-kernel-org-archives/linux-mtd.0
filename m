Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BA0C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 07:28:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715722077B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 07:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cUUskWMK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fOCuNIRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715722077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLU47aXcIYmmgLE4VB0NCZbCc6MplifSD8fI1te5gQs=; b=cUUskWMKdqwa30
	Ki6Sdlz8T4WRYFXpwus2URjgFiQUOkML+TAEtNtsrVtauecrNL3DqaaJ2DyfhVuasqO1rXMsfhIn+
	v6gqXK4C9c6pH/U0B+n0+Msfy0HVc7xu/Yb26KAzyGH081p+R50Pk6+O8xWrn8gR4sAvkznxzWB4l
	9n69UVYWuGGYhtGoEXnaTk7w1huqi+escju5l84QzgLJpnLbd25MnTpUyxG4WlroAlN3vpUThfsBb
	ss6PO6VuPUNlNPz6YkDp9a8hR9d/Sr3QUqN6KDpZpBu1iUCqXYgiqGyrcVveXixmrhyyzzwJWqFPp
	qfBrnZL/dDwEqUDwqjsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iewPr-0001DR-Uw; Wed, 11 Dec 2019 07:28:11 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iewPm-0001Cp-FE
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 07:28:10 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: zKfuoIBzmk4K1ZCOV0lUbo2mPx3+mlu9ADvm+QFJJubkN4WM85TjfBnAEBXlVfA+ZXM3aBeeeB
 QP15JaGxzk66bHgj9ZaNI3eLDMsn3bI0upf3X+q6wd8UXsDeexn0Muqy9r6Xz20ZZAJxgYbHfV
 VuBLk+PnzyShb1/0y2UspLdUTtOBxLs4uupzrc1NZtJDJv0AJBT+hWN1IEQOzN+81JMJu1J+ap
 VibXpl0qMBDpHDst2GOfb8pl2A8slEo0s5WXnJda8cxMGFOb7YtiOTmPuZJckrwo8HlZxSf7kV
 wj8=
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="57336005"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Dec 2019 00:28:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Dec 2019 00:28:02 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Dec 2019 00:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4gilTfjT+yCVjwzJR2SkIrlfmgIgrDTVPtreANxoo0gYAd4uJFl97llirBfthdftP+3gCenfKKY0ewBXBB9hC4jiX8rmDMh/MmnrkEbyieaM5qvxadK3rQPHjhNTqtI60eUvncKw6pWZsjT7kXKFSpTdYRWyJSK6/O0YijxN5SX9DZZd/5g/0bvYiIsJhYjbntptA+zyej5jGebJfBjJAAqZ/65Prap/mUMUkdTDEaarmAhxPdZV4Ayp4cdfFa76waL9+gVsCD3KUFnhEdHp/KRaT3UGDTXQpz5nF0B6JfUO/mlgzORAg4T3opvTPT9AwuT3XxKFzzEzBTUA4B/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bmIYC+sPNrB1vBGoXykxBPHwR6JcpGCTLp9hIUtlGU=;
 b=oKAqgaahWOKSOywC8+GGHUn8yjdHfWRDhkHnuc1sl+igKITSLI8CIilOo2krUnEf0YYFGgby6hAKCSr3XYW+8f4yqeF6ottLJ8t7CQG5Wbgkbc5y04ukWG7IQnU1WffWJazhqT1ntSZSM/4x5JrTbyJdt4ztrBv0GyXomEG5ugDNzdw+26MaOHYbmM2u98gsUoTYMR8N9p4oZbUP2zpmcZL0haj4yn48QyYeBuhLIjGWoZjKsT+H1J65s/k36lvEcXG0TrPJOFvjoyf1vVJkY2AZJ+wdCHdxGXHIP4AHmALQYkmFlkTjShlea0OQ00e+EVvrv3AzoFOByyzyMRnb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bmIYC+sPNrB1vBGoXykxBPHwR6JcpGCTLp9hIUtlGU=;
 b=fOCuNIRELY2JGJlYVqBSOPn+F25tu9GEyG69iHjvcexViyaxN+frLqV/RK1aNvFjAAOv21NLgj/Y7ghcBqerUT8bhLtfRbGS0wjCpMX3UM+FfP+TSXVRjXyS2UUM1Va96K89KqNgIT7OkiZj1YsIkyQXKGV6XSHAzzeVZOXiMaE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4432.namprd11.prod.outlook.com (52.135.39.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Wed, 11 Dec 2019 07:28:00 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 07:28:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <js07.lee@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
Thread-Topic: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
Thread-Index: AQHVqNq9Axjcl6bGXU611YNR9WJnyKezpy2AgADku4CAAAtZAA==
Date: Wed, 11 Dec 2019 07:28:00 +0000
Message-ID: <03f2eb36-dc5f-b5c6-53d2-7e24d1d90861@microchip.com>
References: <20191202063507.21311-1-js07.lee@samsung.com>
 <CGME20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8@epcas1p1.samsung.com>
 <20191202063507.21311-2-js07.lee@samsung.com>
 <1b5b1748-500b-7027-40c6-b51ecf7df3b4@microchip.com>
 <6310ba957fe2cf54ac308d3fec9705183066aeef.camel@samsung.com>
In-Reply-To: <6310ba957fe2cf54ac308d3fec9705183066aeef.camel@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191211092746868
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ced67a2d-281b-4ae0-67e0-08d77e0ba6cc
x-ms-traffictypediagnostic: MN2PR11MB4432:
x-microsoft-antispam-prvs: <MN2PR11MB44329B907E187EC02391EB9CF05A0@MN2PR11MB4432.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(366004)(376002)(189003)(199004)(66556008)(64756008)(81156014)(31686004)(26005)(5660300002)(66476007)(110136005)(52116002)(66946007)(31696002)(2906002)(81166006)(86362001)(66446008)(8936002)(4001150100001)(71200400001)(36756003)(478600001)(8676002)(186003)(316002)(53546011)(6506007)(2616005)(6486002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4432;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 28flXrXpvLCdvMx9L4pVK99y0xqi76BWapb+HKV5BvtLPpAjQXJ2LIv8sMvgc6OqGPLSYB24Fy2xwpvt5k6QY1UKQMUzMMpEwf8RL/EzEEHlRYZ722FP1Ys+U9KU2zBon8Gk9CPxNiyu9Exa9H1adRVp+LFEEBMNlI7I8+pHj774kC/261i3pRUnpyArKUt3ROmMRZEPqCK6uUGt6NG5kSekV0tz/N6n7QanUKkg3E2Tdt+NyVY8KV2VdaxpH1LDKKsp1KHv1I1P8YEWyxtR5/tL+BGewoPtirvHPpo9wFlEjAPQbw1TMwFf9gNszAUcCUvTLjN0vd3canBwzEFZj4/HTOR5FDgA/JI8phoEYxjCZjqZl86WGvM+re7jSuaIilxBi4zE5a5CW75uAZK1301v5S/TcXVfxWTSOM/hIyviYv9Gv7tiZnWChUKOroCg
x-ms-exchange-transport-forked: True
Content-ID: <4AD85C6566D47249A6B3C1C7493CA8E7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ced67a2d-281b-4ae0-67e0-08d77e0ba6cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 07:28:00.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GoApQN7ivyVSNe8XZihThlUUfGe5Ett5QDvLhchZIt4dZwsOrK7XqAlrhrBOyocmEtFadBXX2QsTJAu6A30ulOZlB3up0F9uZS7bOmsHnzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_232806_563985_531DC90D 
X-CRM114-Status: GOOD (  16.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/11/19 8:47 AM, Jungseung Lee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Tudor
> 2019-12-10 (Tue), 17:08 +0000, Tudor.Ambarus@microchip.com:
>> Hi, Jungseung,
>>
>> It's great to see this happen :).
>>
>> On 12/2/19 8:35 AM, Jungseung Lee wrote:
>>>
>>> There are some flashes to use bit 6 of status register for
>>> Top/Bottom (TB).
>>
>> What flashes are using the 6th bit of the SR as TB? Is something that
>> we can
>> generalize per manufacturer? I'm thinking of using a SNOR_F instead.
>>
> Thanks for your comment.
> 
> Actually, I failed to find some generalized way to know which bit is
> used for TB.
> 
> I was able to find some pattern that it was affected by capacity.
> 
> Winbond : Use the 6th bit from 32MB capacity
> W25Q20EW, W25Q50BW, W25Q128V - TB(5)
> W25Q256JV, W25M512JV - TB(6)
> 
> GigaDevice : Use the 6th bit from 32MB capacity
> GD25Q16C, GD25Q32C, GD25LQ32D, GD25Q64C, GD25Q128 - TB(5)
> GD25Q256 - TB(6)
> 
> Micron/STM : Keep to use 5th bit
> M25PX64, N25Q128A, N25Q512A, MT25QL512ABB, MT25QL02GCBB - TB(5)

They keep TB at BIT(5) and define BP3 at BIT(6).

> 
> Spansion : Use the 6th bit from 16MB capacity
> S25FL116K, S25FL132K, S25FL165K - TB(5)
> S25FL128L, S25FL256L - TB(6)

While spansion defines BP3 at BIT(5) and TB at BIT(6). I hoped that at least we
could made a correlation between TB and BP3, i.e. assume that if BP3 is defined
then TB will be at BIT(6), but we can't do this. What a mess.
> 
> Some of manufacturer use 6th bit for some flashes, that is probably
> some cases to need additional BP bit (BP3).
> 
> Anyway it was hard to find anything that could be normalized. That's
> why I add SPI_NOR_TB_SR_BIT6 that could be set on each flash info.
> 

Yeah, makes sense. The explanations from above should fit in the commit message,
but I think I can amend it when applying.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
