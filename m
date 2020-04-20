Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEB1C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:36:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B7420A8B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kUd/AmQo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Pb3klAmB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Y8gYda1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B7420A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVdhkP66auovSBZcjUcBRE31fMtC3oQ92XXKf6KwtII=; b=kUd/AmQoQRW8G8
	Sd1BUY72IiPkuyUVuz+O07DmSIvPs3gMsemEjmNLR9v1PiwzhwJSigtESME/ktEMTLHcoxW7Zt+9d
	nAQiXBCqCWQCqMFky8FoRIRsMl/Tuu9V9u4pnoKowjhYZYJEp8kPX9+MGw4lygP+gcvuEzPZgsLBO
	H0fouviuPzEK6Jn7HDfb1uwrYIpuNqAJhxYJVpjsi6LnFFs6HDc2QhCVtNUlRG6UbyDtayRSJJ+tu
	y7EPMVYemLApR+JBRuC2GQAdkDCv6sD1X52CxmQCGghXitpGO0PZZ74JSn44kAJrHvzaTOsCr34r8
	UxaoxVYjplzmxrLlrHMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQSqR-0004L8-88; Mon, 20 Apr 2020 09:36:03 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQSqO-0004Jv-Lz
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 09:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587375360; x=1618911360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eWRp7dc8PQzpoHxXll+zj/hyaaQvRZMwYGQn6XqZ+3Y=;
 b=Pb3klAmB33jq+POfmd0s1l544nbXwFc6KS1S6XL7cBkGqqf+xOC35Kc0
 j5aT2bQGTq+UkgL1Nj4CrtJNwgKet/j+RWk9PAhTRZmawdqEZ0RJhBu8l
 /2FLkVkEZ+EoPxeRJKo+BZzDKDH+wrRf2yb0LhnIix0wAdc1v7Ax1ipD2
 B80nR4QAU09Zaxj895ywFiI3v5ZbkLBo6WEQpjjVzkviJ8VW/WpDl2zAv
 R4hxoWm9iFRS77JTt1cXNe3A/jbupQiS4Ms6tOWFLqcoKOxf/GR70AzT+
 f3NVCP9/wA1h4CLUM5nKdjTUHaKhQTn1tXVQmYI3cDXvp7FTq2vpwupD7 g==;
IronPort-SDR: JzvYa3A+WROH8OFyOvLHuZDU0UAz7P/+0LNplLjwdmfgHsGKKSStmPMqjNW7Ho2qCDqNs9SwIF
 hlhHvqyyIm+F7QR1npr1gJduHpq+cH4r7h2af5XmgcQjOHI2OaX2mUdNWK9R9pR+syl6XGzgLN
 ysazqEz8MbmMwUeM9pV01opMIyfwLfYgUFI+5q6F3VItRtiXu1w7KUNmizAGh6Sd3mABnYD2gq
 Lb6m9e1c809r/sJxqQzQmTfw0s+mU6cH6q+ejl6d3Hzv1ZTayqN1ES/aanBwSqDKBidDQpRDJk
 7ok=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; d="scan'208";a="70881089"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 02:35:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 02:35:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Apr 2020 02:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzl9k8e50EJpctgnvZItbUfPLbzKVCdagzhPmuAY7WXiqPSlZUkJ2iQOtvsX+2N4/JSNVZAjnyx/tL5ACXJWfywWgeUOzQi+d5rc3h3UkfS4CtZZ6JASwbIuAEI/nrEfDr7elXv/IN0SXeLKRUcalzxiEb+DdgvUEeY5X6EutV6HItOHYT5NM+yvvtslP0apj26N9H7pl1Y8uXf7boVneYFO21h37LFAxjyViXfl4ybITXsZOsNJdZS2CtuMg6lhQPlaYcl0XmRFJ96OUDe/sNI2VAtiFfl3mFc/Ge9FSJmjka20MjLlaR73VJIkGlIPb0I9yP7yXNp1J3PyQCr5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iggME8aBPzpqQie96nspSOF0t79Pm5D0vA4P35XCAPE=;
 b=E1QaEs1Sb9PUf2U6qDe+HIZEHHMxs7fMS3zjWs2BxMjisRxOiFCAK1e5ER+7OZ6lndKEc+Yu//CUVYiY1JL061HO0YeqZoOWn/I/91GnEiurtCzdnO8jCWGLKdXs2E+Ol3AnlmNhw+R/gG6/lT0h8gc7+7lHf11T9Djyrh808g3r/RK3PxjJ+LOUZjWNFgc/Ar6ZFjAUfg88zuDXVGCQpHpffbaQjzSWVC2S1dT4pj9hynU7rmj/LnaQIefH17i+/glP0KWwQdzi/zaoSRs1EGitgQy1PRfRlMkjcGZm4duEJlcXTCxv/rNESAK++UoxSy2WKBshmhO7QhWdlHBUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iggME8aBPzpqQie96nspSOF0t79Pm5D0vA4P35XCAPE=;
 b=Y8gYda1BVbTExwvESVmpmKZJFmiHOyCAwyNTArCSkHBm3TDFAJ5v0gMp+V0ix4RprNeD5dLv9vQ1mxRIvIKaEASXfg1UlfIkjzVQw0incNH+4wXGhDbfDVU1JMohn0woiQjVj8upC2zBvoRxQB6cYP1Xm70ZgG7AoAdZmnRKIu0=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3896.namprd11.prod.outlook.com (2603:10b6:a03:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Mon, 20 Apr
 2020 09:35:55 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 09:35:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] mtd: spi-nor: move #define SPINOR_OP_WRDI
Thread-Topic: [PATCH v2] mtd: spi-nor: move #define SPINOR_OP_WRDI
Thread-Index: AQHWFvcXyG0gyCRoAEiFHXwQo2DqIw==
Date: Mon, 20 Apr 2020 09:35:55 +0000
Message-ID: <3366000.Mec7sAu2MN@192.168.0.120>
References: <9f654612-54a5-41d1-01dc-8196f334bffd@cogentembedded.com>
In-Reply-To: <9f654612-54a5-41d1-01dc-8196f334bffd@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccd35165-5d80-4ab3-e491-08d7e50e39ab
x-ms-traffictypediagnostic: BY5PR11MB3896:
x-microsoft-antispam-prvs: <BY5PR11MB3896CDB9530215CF0DC140C6F0D40@BY5PR11MB3896.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(366004)(346002)(396003)(136003)(39860400002)(376002)(71200400001)(8676002)(186003)(8936002)(316002)(4744005)(6916009)(66946007)(66556008)(76116006)(5660300002)(53546011)(6506007)(6512007)(81156014)(64756008)(66446008)(4326008)(91956017)(66476007)(478600001)(14286002)(6486002)(54906003)(86362001)(2906002)(9686003)(26005)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aN3Tc3aFSNNdvykQT3SZPSN+hIvSzXSP5/Hu8KlPC4+dciYAU3RE+WJWuHuEb+iMgMCUBllL2za2rUZAqrfSObokDTW7J+9hrWn1gKyD3glON6+x/rMuUZGAx7kqxqHEOWIMyhJ2cBB766hoJJw8NIEjJtGiXd17eqmJb6OY+ZqtqaXRRrl5r18siKX3vycCT1hsbVwFhX9btKH41InjnzgfJ6K6VN/LKYQyYXHofWrOPX1U+vljRwI0b5mmbAPx4sLM42B/PT+Aj6thxz8qvm+IKNb/hCK8UlW5XIFejYq9xka/Yamlfg3IfnT/q+IrW1ulcZjh1z86jx40pUQ964VJl044VWkgHmIdc6K0xWRsRroGLHvSTU7Y2NZy5dpRcPcvb8/QOWFWlHvf/V9L8LoGANn8hWEVzAsbDlnt5ApHUy1BsacUzM7yfLRG68MYO0/Xy+DrQfNeU9qx7q6oLuvhAa+VKyVkt9Xb78ltbRfVxRQT+4PfK8qo6M27Bsws
x-ms-exchange-antispam-messagedata: 1ykJvl1JtKXyJbaIsk2TBh+cLSh7BDnJUtJquv2TwAwRK3nTEqVqM+TTiLImSeNw6vLcFga8JXtZ+KUYVVS9SFAJIE676SvuESm4kzwrYx+U/E3Tkv1phc2DQa+4tixzN3yM7g/r40+A1inv5oBPKQ==
x-ms-exchange-transport-forked: True
Content-ID: <EE850470E7B1624BA07A020CC3C5536E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd35165-5d80-4ab3-e491-08d7e50e39ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 09:35:55.5064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUlSoxpZpaVOTNMrGs+0bJR9yZ7sXVtUoETyAU2O5hdRCO/I+AOPd0uRlJ6EMbYWBt2RyTMdiDC5RM9bKBTxJCl4cgZYYGVAQ3vZ3BbLP6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_023600_768109_7AFDBA2C 
X-CRM114-Status: GOOD (  10.02  )
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
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 7, 2020 11:56:43 PM EEST Sergei Shtylyov wrote:
> The write disable (WRDI) opcode is not really specific to the SST flashes
> (anymore?) -- move the #define to the main opcode group, just before WREN.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is atop of the 'spi-nor/next' branch of the MTD 'linux.git' repo
> plus 5 kernel-doc fixes posted last week...
> 
> Changes in version 2:
> - Fixed up the patch description to match the code.
> 
>  include/linux/mtd/spi-nor.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
