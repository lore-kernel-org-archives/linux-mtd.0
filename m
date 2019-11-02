Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88F1CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CA220679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnxKYLZR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="IOs8/6wd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CA220679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPBykBNGOEA60t8hKefCKjmN07T2pEg+AFq7ulNAlF8=; b=pnxKYLZRvEFo7c
	pFQyLTsbIRSdclgRLcASAi9OwwOYlSVUHmsVBCfCF4fos6BYlTwENuN+gUjNrXU4MkgejTYIKSaxO
	Z/vKKVH8Jncqw/rjgYl/2i73ARvpC7M25Tg0sKPWI1J2V5qvU4uC4ViL3B/m4FR06rilddpS6p9kc
	0Vkq/gnAroK+ZifVax8HoeMuyxazoahpUQFNy2zl1nDUJSt/IF7njbLKbu3gLjJU2rUNswzL/hE4+
	xtVgil1hKgRHyVdJcNQb55BgiDh7jPOUed3HhxwY22LXEEzTDglKD1KCgC6B/zVwuPqVSGwgbSfL4
	1I8KILFSaiDZczOfXjeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqpB-0003oL-Kn; Sat, 02 Nov 2019 10:40:05 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqp8-0003GY-6F
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:40:03 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: LbguTN5WMEbtWrdBNOjMOQW2nTY6w19Lvj/Znh9EtTCkvZEQFg+BSpP+sx1/31okXgFsGw68lP
 Eqpisl6nEVpVJk/lH5w5dGYu1RJe55C1SP/j8fB7lZtR/4kUI6H5igKoLks17cZipTwknKTNmU
 5kgVB3RqKCJfIyYWL902e0Dr+KbZ17isWJa+bh/diWuQts6uDjyi+CTOUxm9L+3AoVY64bUgvd
 XXZREEeLmiVh/CS5KYLxjBME92vkeTwgcI4D3Vg9OkcuX4ro8tTSaFZiBo4yzNcdsH1B6wBDWn
 sXI=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53899251"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:39:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:39:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 03:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjqYMqwF5Hue2GZj/HZjSoos8i8DTJeI3LZqsZJnzkR6sv2RrUaawp13zcBZ0ZTFK/ijViAQNl/Pq9eUEVpNCs6vYdw8YFNMnRgg8ySJoEnv9+U34UJNmU0FEMZ8V4EeOi6k8DsjH2zBE0/TRadA48WaoSq3rEA38C+LvIBEB3rQJTR9FXUGI4bOIgamMIg4y+cWpPFOLbSR1wWClzpqCtHErDHWEvN+FGodaib60LUmgEuy8pODaYyakMcCxmAHdcmMTflMsWRcRF2kVgwqGFSyfInpdbpQbOW2JtPhiyEh3SB/BrEch0822WMPW99F9IexJN7q+84w6d3qfcW84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enGcgbVaOcm/J2ijwcCc0FwzhaD6Jfx7JqXEp2osA2Q=;
 b=RwhaBCQ/tDnMkD6fJeXIR+eSJqSRUl9+Urg4oGJ0zP3g/DFxQQugYV9H53LejX5lkPmwC4mZEPn3yPQxg/UCETysq+5LHEHeu3Fj+fKMRmLi+ZBnmlAm4G3owa4dQvHIh7z7nZK6fhx3BIw1eZkt5rXWAXdQtCv0MjQYTHXKdI5QSjA/a5dI4EBdQKufXxEjvyeeOfUeUIUGX7wyS8P4YvmhUeJJLB26LGR0veLFcGVZo8ThtB3FLkPO4b2XibyWIIWEXTFgrNtBYBnwbIFObECHgedNu5T+WVKFPQAk3H07NrqYDUC/1D4Rk7NW1RQfupU3crAcAyGgAFiJgLtdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enGcgbVaOcm/J2ijwcCc0FwzhaD6Jfx7JqXEp2osA2Q=;
 b=IOs8/6wdq1BK1PaX7GxPnw8kdFY/ExHRBvFVjy8zZAgkpGCr4zXe//80uLwQAOtppDI8mLCe32RHR2M+zVCqa7HRPhN0LsYZkp9Ut92TXBCS+WPienmjl3MuOUaxGImmRARxUTw1Djxzz5xtyNv50x4NH8d84sX/mQ54I09MNnI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 10:39:52 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:39:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 07/32] mtd: spi-nor: Don't overwrite errno from Reg Ops
Thread-Topic: [PATCH v3 07/32] mtd: spi-nor: Don't overwrite errno from Reg Ops
Thread-Index: AQHVjkphLyVSrUAb9kyKn0dz1sgAkad3txOA
Date: Sat, 2 Nov 2019 10:39:51 +0000
Message-ID: <b27682eb-412b-7507-6da8-c670202b8852@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-8-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-8-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffd39e8c-3299-49dc-4712-08d75f80fdf6
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB3629DB587613D740484C35F2F07D0@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(39850400004)(136003)(189003)(199004)(66946007)(66556008)(316002)(66446008)(52116002)(2201001)(86362001)(76176011)(6512007)(53546011)(386003)(14454004)(305945005)(6116002)(229853002)(31696002)(6486002)(446003)(71190400001)(25786009)(36756003)(4326008)(66066001)(6246003)(6506007)(102836004)(2616005)(99286004)(8936002)(478600001)(71200400001)(11346002)(8676002)(81166006)(66476007)(81156014)(2501003)(256004)(3846002)(5660300002)(64756008)(7736002)(31686004)(6436002)(186003)(4744005)(2906002)(26005)(110136005)(54906003)(486006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3629;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sH0Jk3sc7weYWEMwkblqofb/XCxapEiLQ+gUIDHHfRh2UPYbDTIbF3twayKlwb6+rGfKgRMfBnAPXl0jcBrEDAIP6N1tC9II6iFF1kZ60gPQnHOarkdlEAqZPg/GSsX6NjGdzecnEx1peN5WImYKrtarDZrPqZ/8GgywECc+VWN/RFBn982vjP1FnONiFdY7LnqHiX1JvsJ6hvfSNDZPRsbrPnDtMJI/x1y7zFXXjwhFLnGvC1kJloIgZuldXaV0dG9wRS7GUoIEEYmi+TxN1vMUTlhlXM9xCompHXpyMtdai2GbtMm6x43dg55R7XevIEpRV8502KWTSxtN+IvTGXyBHzskotQKX5o4T9GqxrcBk2T6z7rxjUQ8ekUP/U2A/Ep6/a7eBbHH0hfqnLxhAmM/WabX2IsmmLRHUfAvQO+8QrK65xk7C/TD5FGIlhTl
x-ms-exchange-transport-forked: True
Content-ID: <CA1B3E1450C72645B0FA6B1F54066F1F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd39e8c-3299-49dc-4712-08d75f80fdf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:39:51.9511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZ/xgWsm2qifMHuILh6daHX7FbKUCbz0KHH0KDBbTVgrLRzxzYu7CxPC8iwsTS+d+8HI2XdInUIKCQmFCZou9v/q3CUoMvN6Fe4L8xBQNDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_034002_323288_0239856A 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/29/2019 01:16 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Do not overwrite the error numbers received the Register Operations
> methods.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
