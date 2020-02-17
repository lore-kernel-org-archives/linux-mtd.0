Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E0EC3B1BF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 00:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 069CE20726
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 00:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GO53so1d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PcOnnB6r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 069CE20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qBXw4CfpDZ/ekUhBwRq5wNzhbTiEiCaN3RZ4S8FF3I=; b=GO53so1dJ9KJQb
	JgiJhhoFnIhoOlaZHPwJKg3tuD5alS2pGpTbclD4zHYxD9ce8Zf1PJM83SuTpEs/+rSk8ScmbPGq5
	RFUqdvFMZbody9BnsoLHVUv0V8kdKDJdZe60G7YdOhUVLliugp8e/QU258oeR0QD3W4BG3ST/A8eB
	JHfLfrw01PU2sx6/lCpN3xbWCMyt4QfnphjdaLBK/80qRLhBvzYGcmAIkSA+7XZ6yBkYINmTOuJd3
	15PVNxmEGrZG9838rYcV7AEBwnMxFut6RKvgpt9FXgpNAEE5Iw9J7yR2PmIQmeZQQ+C4i5F8bfB09
	R23pt69IDud6ryESXWxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3U7I-0004HV-QH; Mon, 17 Feb 2020 00:18:28 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3U7F-0004H5-Ia
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 00:18:26 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: rcVCgmPcE3xhHIc4JIHQpdUW2gOx6/TYGY7lfsas9kUSgsJx+2lwpLoc8jzTmmHAzLzSbqp6pp
 msWQWR1LiWqI+7rd6QyGfxKqvYPiCuEhbkHjIiH19HdEYlLuSRa2z8arvgf6L5rjCuqp9j0wX9
 xk1C4ZKiYkHzWOoxWLWvWPIuMhm63B14tnoMc6OTLMsJnv6Q3I4rVFcv+ZcRQU0klvs/eOr2Ep
 LKUozq25rtF3ByyFXQI4PdBTpZa8L/xoIz/hwFdTQkAqf4WD1HKd9O+SAbwN/hwDCy1QUkY/HO
 +eg=
X-IronPort-AV: E=Sophos;i="5.70,450,1574146800"; d="scan'208";a="65632132"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2020 17:18:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 16 Feb 2020 17:18:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 16 Feb 2020 17:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT92S0r9o2ClNetp8dpS3e5ZiYmBf4ygtVwS88krJpfLOW7sIxv98oER2U2B5fON+TSk6/r8jQn0ME71450LXR8L1vcjP+96xhwcOeTcjcubFFe6uAunTKeyUmts0UODX5JxJzws1Xt8ZJSjdzoI/wx6XbFiWmwMiB6cQAvQg1TsRPgz9BaXex7zoZLEzTroiaRrF9RgdM0xxchIwJNcEx+tMB68qpcFkQBJXCCjp0BH3W6Bdqk3DRnz092FE8vkb/+fu5ahHVKViYuQEAChcXshYxiQtUNp01g4cRqd7vs9r76MUbd4q26/W9LwVkxR1/f6sn/jCMQ7gVnsMJFjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOIa7lgZsid9qgxCv24hsXnziqYev8z09JK4xPXqNLk=;
 b=FZmuywZnY4RLrRHScKT7bhRc+3liVZQNXw9/CZ07vWgNn/asJVzjz7pddkxGiF5a3qeZ/X0lDuDlUjZRmgFp5KwWlMEZvqN0RC5W5f46W2W4e3vLcgiTg9/FXZ8DcO1dn9sSpVO6vgOP5qrI+qvLfU0HvGDD1qUc9PlCPQc9cDlsKigl2Yb4eAfmR5BBOo9sD02YuSTLmJHxbXm79FJgrsptYEeDTFeCtij03eqDURY0Hao0yvKlfows1/I9hXp4m1wtAYLG+LLLBzklQqB8WWdxR6ED4t0OtLTWoOJxrDY2bvtQG86YmwglynDEVYxLtY6i5XjjRi7tY0MDmWm+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOIa7lgZsid9qgxCv24hsXnziqYev8z09JK4xPXqNLk=;
 b=PcOnnB6rFxT6IFr7QsJ/XOQqSsVU4ZOOSna97TlahBGtSE34nNGC6lxApDN0yCaO5ueETBOEj8trEbDVZXVvPF9ncIA4CfEOEPv3z95yz8Y0x2fFXkodcM4rqUyTrTWo9FUIbSEpNOC1bNAq9zq7unCFqG2duJHVOeH+Dsho1fk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3965.namprd11.prod.outlook.com (20.179.151.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.26; Mon, 17 Feb 2020 00:18:23 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 00:18:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: introduce SR_BP_SHIFT define
Thread-Topic: [PATCH v3 1/3] mtd: spi-nor: introduce SR_BP_SHIFT define
Thread-Index: AQHV5SfDYQHzoD7B1kik0XQNkmzFVw==
Date: Mon, 17 Feb 2020 00:18:22 +0000
Message-ID: <4127241.UCFpJy1NnT@192.168.1.3>
References: <CGME20200113055910epcas1p4f97dfeb465b00d66649d6321cffc7b5a@epcas1p4.samsung.com>
 <20200113055907.9029-1-js07.lee@samsung.com>
In-Reply-To: <20200113055907.9029-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 492cd727-969e-43e0-94bc-08d7b33ee666
x-ms-traffictypediagnostic: MN2PR11MB3965:
x-microsoft-antispam-prvs: <MN2PR11MB39652F22959F53DD7ECEC91AF0160@MN2PR11MB3965.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(396003)(39850400004)(376002)(136003)(199004)(189003)(66446008)(81166006)(81156014)(8676002)(2906002)(54906003)(64756008)(6506007)(66476007)(316002)(8936002)(53546011)(9686003)(76116006)(6512007)(66946007)(91956017)(4326008)(5660300002)(66556008)(14286002)(478600001)(6916009)(86362001)(71200400001)(4744005)(186003)(6486002)(26005)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3965;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tXmiw2GJm2ueniTa88dHaj4v6vtact7BeKQTx8hD7TaU1FZnOzM2LNn4+54qk7PSO2xfUk5yukW+hrkgQTxk5RX+Hftw9tPTJYEgZBOxqXpjlwY2fzRfHvdiKDjSi7yuw4qBPEVwW0o1sF6G9IGaEw91JolMZCs/PVXoYp2R01HZ+KbUyMtO+8zE019IkxAZEAiPrEynlnRQH04t6eKuatgJqJ5Mh2jKeg0CIAwRh0D9sa7qXPlmpvcaRY9baEIBmcWEN7HYifzXUWZx5yneneD+80nxYvoPKrwa05J8oF7UIYf4139GtmWwBElQPluZtlwNNoepUmDsvKBr5Y7i8DGLIKHxvhg3iYxs9rFykk6q/bvGgBJ7d7PBiWrnriACEXglrpMGNRjv+HHk1GH5cUtnF6nGwSZ8E9xKYxK8HMriUt3B3NIe8C7EdpO3ZWw9nUmYBgi7NTzu0iLa5Ob1xDj7uxnTvC/CnA5TNA3rWBaNdTSLOutfg0czm6Eu+rYx
x-ms-exchange-antispam-messagedata: r/EGq4kzmHRXKXtYVKUooO6weYYvsndWoBEFmN12jTCfPPYVQxa3SvV0yJixODQOTVUMPoRU1sQ1lczAtvBTDdOzzhsivC4N3UMbk8MU4kh0dVWZipZxByQmcyq0MSyzhHjgDG0aSuQlp0pz8yHsKw==
x-ms-exchange-transport-forked: True
Content-ID: <19F9AA9F92720348A14B38A631F29C5A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 492cd727-969e-43e0-94bc-08d7b33ee666
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 00:18:22.9262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K07BxWfABmMpX1unAj6XyfEk72LdN8HIYX+KFZJBe4jGkzih5qZ7RSN7hvoNLFQfEsQiEa/wAbnBtyGjKg2Aqhp86u5+WN7FExFE1AP/V8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_161825_663462_EB556217 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, January 13, 2020 7:59:05 AM EET Jungseung Lee wrote:
> The shift variable of SR_BP is conclusive because the first bit of SR_BP
> is fixed on all known flashes.
> 
> Introduce SR_BP_SHIFT define and let them used by stm_* functions
> to replace ffs operation to get shift value.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 11 +++++------
>  include/linux/mtd/spi-nor.h   |  2 ++
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to spi-nor/next. Thanks.

ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
