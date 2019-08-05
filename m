Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A03DC0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 06:41:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700A62086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 06:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yd6RbC37";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="c1ZXA6Vn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700A62086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIGa6vVkE6X58l8AhKSqMt387jqT5zvlK+r6qcdwuf4=; b=Yd6RbC37zV1gvw
	gW07Fkpj6c65os8YgxOLeK6qJTA0ugxE651+X2+q74LPwMlAxp0LyJhOeDpjEyInT0x8ot1J/OxCt
	wq7VH18mVysxnXDSFyG+YnSJWGMyxFQRXhVMBA7V4AbVkqbAI4MQGqgnfuoDDuwDCNy9laOWsLN5B
	M18ySS6nhayriLZxgOy+87TUthg7EJCMFrc8AKMPgY9VJZGpmUJjMsrnDfo80bDG49fLdUec6+dc/
	sL/yFOcO4+mVmCIRq2vxLtJ7YgDqj27LHH1a/DAsnCiDJAvGmNHDtRwyKz0YwcnQawEKSWLQmGSZX
	s03dcw7XBCELXCq7JWpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huWfq-0002L5-8l; Mon, 05 Aug 2019 06:40:50 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huWfm-0002KL-98
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 06:40:48 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: jPg06cHkJlLrHMGUEJGo+PzOg+Q/38T36E6AOfFnxRFohifijOet3BsP85fINi9Vlv69tvCp2d
 BsoHIMZDUKZJ8m7GfjvHa78ndy2qoofTFFu53iAKMV/mD+46GMWTuGbUvKDhfwTdIHxwWE1Yzq
 1LxDEv6uUSAf4tqGl94AKqJBVCfd2HwiLLr85fhD98wziswOdIAc64TbLYMVNxJ1q+iWPiJ1T6
 8Hs7pumsQLXSvFIfcvL/ebfCFwH3qgUkP0q134cvSVWmI3QaKgpNG62ZwpPbg1x8fJ/3bpLSCu
 L2w=
X-IronPort-AV: E=Sophos;i="5.64,348,1559545200"; d="scan'208";a="45318154"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Aug 2019 23:40:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Aug 2019 23:40:27 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 4 Aug 2019 23:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/LYWyjKDTwFqm2HoFyA2JHzhnuLPo9b3AfxF4YjQJ69xxN2g4jOk5nE2d4NJHx80gpzP3Yv/h5aFHBwaHXZ2b+l7G0RdD+KK5zQa6dJfEmlfmOGCineru5yuXOm8lg8gv9p22/qa91lx1qKje2lTVIXXtxecM6qSR3/zGfhC+pOKB95Pe0B0TmqQapJcv3doqxEUi49LzX4xREQB3N8pzK8O4yg6nhBN6QtQ48RTJNrXQdkDi24u/Veangy8+CQuVCwYlI78hlaylbXcJtiEQLW0q3a/lPbrltklDWxrr2OdyHtXwJLEmRgrOKhrV8vDRt9ANUxHzEkTxlLXh/gIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkavV3oS1aEBVL3Dvrg7UlKu0AN4u9D43ChYs/wIju8=;
 b=JjQzZOgAeR4zjVr48FZP2TmhTeYFEJ5Ar+BU1djI0BFtm5RAkqHXr+JzhJUjzTj2WM0tQxsCIwBArCZAwYmRyX5BmFZy+JehS1YOTL+J6Yc0GEDOTeR88d1mo2BAHzoRubQU2h+znVjg3ISk4W6AivmGXVa207LKlORGABm7RLjTxu8W2Am274hEqkX99Z+j/0TtY5qy4eyEI9hPf9tp+4UwO3R3xp6lQpzSc+VO8jEB17muWwb++LU4Pzp9wpd5+28dTatg4CqJ3wGnYz6R6C0O8AkyFPbf1QEOlrMREdtahs0H8u2xSU7ThTWTMuMn9HNd44rgaw5d7Kz5cVJ20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkavV3oS1aEBVL3Dvrg7UlKu0AN4u9D43ChYs/wIju8=;
 b=c1ZXA6VnZmbokn3wTH22ktD927hCtnlfbfxl/+gg4XKca7NkIhorM1VpP1GN5t6v7lEg2u1br6FfHZsGv733+GQy4BrlQXvurEp9065kLJf9W1smnjaHggiT17082muEEva6HY6ccUS8PeyNjRxaKz7NH/eka7YdCbnW0/0DR80=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4207.namprd11.prod.outlook.com (52.135.37.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 06:40:25 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 06:40:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
Thread-Topic: [PATCH 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
Thread-Index: AQHVR4AMaH6Ddp0nkEGsW9FcCZCHs6bl2Y8AgAZIuwA=
Date: Mon, 5 Aug 2019 06:40:24 +0000
Message-ID: <6241efd1-e016-e8ed-ebc5-5931e23ea970@microchip.com>
References: <20190731091145.27374-1-tudor.ambarus@microchip.com>
 <20190731091145.27374-6-tudor.ambarus@microchip.com>
 <20190801084226.27572bb6@collabora.com>
In-Reply-To: <20190801084226.27572bb6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR02CA0063.eurprd02.prod.outlook.com
 (2603:10a6:802:14::34) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8ce8c1f-c88b-43bc-06d4-08d7196fcbda
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4207; 
x-ms-traffictypediagnostic: MN2PR11MB4207:
x-microsoft-antispam-prvs: <MN2PR11MB4207724FBF95788A8D475932F0DA0@MN2PR11MB4207.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(54906003)(476003)(6506007)(386003)(14454004)(53546011)(2616005)(102836004)(11346002)(229853002)(446003)(76176011)(558084003)(4326008)(71200400001)(305945005)(6436002)(31686004)(25786009)(486006)(186003)(66066001)(478600001)(52116002)(256004)(99286004)(36756003)(7736002)(71190400001)(31696002)(66446008)(81166006)(86362001)(8936002)(64756008)(66556008)(66476007)(26005)(81156014)(8676002)(53936002)(5660300002)(6486002)(66946007)(6512007)(6916009)(2906002)(6246003)(3846002)(6116002)(316002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4207;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bnJig3wOdaKpyPlIH1kYz5jYE1BAcKz7fYJ2RWwcdLmOAPP3Ya68wlxgVFxFBVcz6IZSIFczb4VNNJE8Ufj1FastZmbB+xA+QebnDRAOb+PLEuREk5dOwjnzrS8NoLX0lIMGZZLoD1pZ+jSqn4he8a4mf1PCVskS/U8lm4DpcrZYi48p15o9+K+2xohJpwE4mWWk08TV2OYRP+VbYmmtIHS2WSwWryhOGIMCk8pjjy9FagMBiZa3jgd+4D4WN4Nd0XEhO6HBi3hVm9Jh88A8KldcNFSOFwzQT2Esz6bSklc6jD5vGqf6oRz5dQsVFOFo0kOgM9sC764Ocx6CqivwXECXuQYOlIuwnSqKqtLPyVCDMEcbElwV10Jg7qck9xk/n9NHkFVtGA2341NFhDVlW5PRP5hA/GGAT8hCWHm87bI=
Content-ID: <731435373D1DD14BB97B7BBFB1A98792@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ce8c1f-c88b-43bc-06d4-08d7196fcbda
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:40:24.9831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_234047_736112_E075C425 
X-CRM114-Status: UNSURE (   6.78  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/01/2019 09:42 AM, Boris Brezillon wrote:
> Almost all of this (except the s3an specific bits) should be done in
> the previous patch. So I'll put a condition on the R-b I placed on patch
> 4: some of this code should be moved there.

You're right, will do.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
