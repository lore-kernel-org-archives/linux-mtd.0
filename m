Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D40CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73E420679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pgmw1c9P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="I5Due8/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73E420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuYaojSE9OCGA8OGIPKNgbvT2Uerm3jKxFisPRNJPtg=; b=Pgmw1c9PjLu695
	VxaM2cRlUIYQpqJEeZe4Cy7Z/uVRXuVGk7UJhDED6i8Jg3UklOSZqISZFLH6Ce/sfNph2HdZFbDjT
	mXoPkrZTFImsL2JoHBJrwgXV2/AnzS2Dp4MOensMwy6SFGogAHjivN89QtEsfAg/VzjkdoOaLinVU
	8HnUNNwoETn+buStVviRq/k+V4FzpJ9p+gMQqQmZiKA4rEwjHKdC1wpHSRUhaPxXl3DIz1Muh8/dI
	FzSBOVqleb1SSdmOLR4dLS6nPYEdj9j/hEM5KVbWeAVimG7V8cIBdtC11tHlCJA7rwEWKGhIqd0Og
	FtMsUM4n0EaUEzScR83w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqmP-0002PX-7w; Sat, 02 Nov 2019 10:37:13 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqmM-0002O7-Jr
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:37:11 +0000
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
IronPort-SDR: bEys7KM6o1qYNwa/fMESzDL5Jlj8pSdGdQ454jUDrnoZcbEK9c6JLiaYgMD4/RbUj3MkP2BEOB
 jAqe8cIeDqpFBu+kXBCpfpfjH+HKAP88Ctkaeq8NWskeTEbaD50KM8Muea3NlopZdVpP0F5Lbt
 WbzcSSWez5u6PfqZmgTcnX9hFRyJ3XQaKZotXy6R32XwZg0fT7a1B/UR73p15olaKEdNDpdcnT
 Sziw3WtzqYGod9vg6I/A1z92Lri/UtGFny6ZNVH5sgrGnsOS0wCwlJCjUzHxKW0Pdh5XwdF6DZ
 Qb8=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53899190"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:37:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:37:04 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 03:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9iwVbe8r0VbZbg/ZmjNLvpY38tqhAK3AAdhfM4PWDvSvt74QDFT3W/xr4dL3936lTajud5WwqJb1jvvHnyxEzwWw/wE7zshWnBs2fwexJQV9f+puxUzVmrRBJLMRlqTkJ8epz3+VoMm/WPPuwsMCgaTn/bYWJ2WnB4y8E9xs53GNjD+nYJ8ztCVdkp22SsmOWsv8Q7OaLqJkPDpHgIhR7D8XGHPXnv5Axnn4gONgkzU2DOqUjnzTL1fhqFnT33Bh5LXK6qAWHGxya9I1zyCSX+ZF/HjYN8GI81/3qXPPIK3oStvxcHLq6HiypSpwM+LPisqV10Psn4iDfI6xCoQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULXnrUy0H8Ml6ifVtzB0/sE2DOcIVE7ZIxgCyuZ+/48=;
 b=aiLqu0sVvQtvJXA8l3fWtzZHh9MWFv2ayEGqPkKNI3bMwkk6KkHbVKEyiSZA4wlslGStdpkDANLyUr8TB6iC8iP0t1ojH16YMt2qLLdMZeNbwrqJIxHL8WqumkI8XYlXu1vIcZGGpS3JyahHlbqZ5sit+uT+czeips/nbHJ9An6d3u5AYB8kxyC7WLXKnOLrxheLKsY6wqYEjkmL/D9iaVTuT5WmvqrtuoABc0i+e2zrGdTBiZVgg7L3HQHipKpEL5XIXh5IGcIiP0G2xVNghNMGXQjq1T4bZfD++getySvyb1FyodMH/cuQyJaAd9y4dvnQB/sVcP3DaD0/5UIBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULXnrUy0H8Ml6ifVtzB0/sE2DOcIVE7ZIxgCyuZ+/48=;
 b=I5Due8/ht+crec2aBv0cIbItRqAd+EhPigi5kW+W5JtfyBxV1q8zD1aUC2lZi8s+tsSQ+Dp7P0nunk6iaeQeRp63p0miKkOrixTV5Xd51vNpPby3smzqx2+YygMMI/AOjD/+rgFR+UKvs3UK7vNc13YfWn3l4rIFSJ/TZGXguDU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Sat, 2 Nov 2019 10:37:02 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:37:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 05/32] mtd: spi-nor: Drop explicit cast to int to
 already int value
Thread-Topic: [PATCH v3 05/32] mtd: spi-nor: Drop explicit cast to int to
 already int value
Thread-Index: AQHVjkpf8ywexjKiGUe8CuXMeClSh6d3tkGA
Date: Sat, 2 Nov 2019 10:37:02 +0000
Message-ID: <bcfc11d5-51be-4e57-7331-4c6acc2dc12e@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-6-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-6-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5460e42f-9143-40c6-672a-08d75f80991d
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-microsoft-antispam-prvs: <MN2PR11MB42235718B63F8484D6BC6BFCF07D0@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(8676002)(6436002)(5660300002)(52116002)(36756003)(81166006)(81156014)(486006)(71200400001)(256004)(7736002)(229853002)(71190400001)(25786009)(476003)(99286004)(6486002)(2616005)(54906003)(558084003)(31686004)(478600001)(3846002)(6116002)(2501003)(11346002)(305945005)(2906002)(26005)(446003)(14454004)(186003)(64756008)(4326008)(6246003)(66066001)(6512007)(31696002)(110136005)(53546011)(6506007)(76176011)(66446008)(86362001)(8936002)(386003)(2201001)(66946007)(66476007)(66556008)(102836004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 35mCUavY+FRwhwB58QYtcW4im+06DyXtWMajSg6Y6z3s0kffD9EbqL2assph2zy3dQvzTM5Nagb06GwXV0pWCt4mvlNxiLBGyetrxUFw5lez3BhlAbR7Yax3OXfhAlDF9h7IU17t8ESvi1658AWM+8LWqwK4ynz7NAQMqGG+je2PdGn1FKGZV1fMFIVYJQWQWPcRG/Wxb0SDKl2eMD6vutDV+NWum1DsWRShQkUARJ007uW7p3eF0iGHBPwqcgi+/tjY232WEcEDTo5S/dyhFrk5s4RhwEvptz2YbYHS+jlNQV4pA7H3VB6KzaHUPvUEyMYjRbUhXIqB4PkXb+prZi14GzZniU2E8uoRLSX6nYi7Mi8IjQ1EnFjD0NROyW/qVUjGLMfOnTgtyLiGECtBcwjx+dVK/YPT4thRKXW4T+W9iv/m1QAKVBjKNZPBS4AX
x-ms-exchange-transport-forked: True
Content-ID: <A8205AB1856AD84AA229BA65795145DC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5460e42f-9143-40c6-672a-08d75f80991d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:37:02.8066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f77E6Yr6sJMMTxS9JtyrhUwkktp73BgijxToRNGyTmFfKxszcW9Q3w2P3+JXtt31EbPZRZSFI/NT8ReVW9XflLGseG+K2BnzgV/vCFvlV0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_033710_689755_8B656D26 
X-CRM114-Status: UNSURE (   7.80  )
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
> ret is already of type int.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
