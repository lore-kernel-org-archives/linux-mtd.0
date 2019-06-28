Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF38EC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07B9206E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYp0Kmbo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YL6DyLgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07B9206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZRQmmqj8TiZ5LctzJ1g3uncJazNubT2021kYxfGVuE=; b=nYp0Kmbo3/jbOz
	qAEW2gMyTXB2SQOJwdjjBfx3Wk6y78WM/VZdyQA1HMoptG+bypS9sbZ8yi+LOL+FSRfVm3gBjH6cn
	/PMdeobVDSfyLocKqYjwjO9j4lkOVoVzDvnSWJi9byXx2U8S3PwfB2UirKDn2XfTcTv83kfkfPt0p
	g0LNEArq7vAcK/Cn2OiOyEHkrVcSrfQEWWPDwp7T4OUGbMeuiHS5of9re9YMdzECv4Jn8cM0YSphj
	jrN244tEjJV8z3hATTN/sgYq4S4ZsTVOna60YfPk1E9ex8Zb590x80/GdCYzuht2sNqpZNEB9rWsp
	l/4vrZ61tgZJ38AhVFOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgm9W-0004gg-Nk; Fri, 28 Jun 2019 08:22:38 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgm9T-0004g8-TG
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 08:22:37 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="37732729"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2019 01:22:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 01:22:29 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Jun 2019 01:22:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=Ko/LJjAtKoFUmYGEo+yC+b2FV5DKhdFVFidTvYmJopc5hh0/z+rS8JjhqZ8CerEzZuGU1u6lJTmEsE97z/iMlKY9SuEU+gJYusoFuPIRzvXPvtYJ3HhKS9UxsltJsQhs6xSIauHCUm3sA0dQ8HA+5lTT1IaNBU0+v/Ju/vjSGa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeOCvDbn5z7N6RB4NJLa91vkE0r1Ne9633Mw4o7CcHI=;
 b=bptdyjD69OfcdkKOagwwY1sQ+E2GkAGb5xOZG6NSZPTPUvDD77Qft2Gs0BL7W6QvRqapMkb14nJT/oxqqiMbGP1g8LXOmDomi7oj+uuf05HzPeargyKcynLFMzhg7xhIczmsudQBe8lBMYBGGSx0RPneVEAbR7jysNf0c36fpwg=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeOCvDbn5z7N6RB4NJLa91vkE0r1Ne9633Mw4o7CcHI=;
 b=YL6DyLgmkZeg2YYpPn0muV99SBARDe5oVVOvrQ0mFBWxDUnjp5/OglR9J6CLI5JsiR7bSSrHKYjMa/2fB+8mNt64ct9xQvXfCyyOtm1Tvx8zvMUFJ8CTVAyr13dTqDWgR7EPa60LVHiYuJRaDmPD07iiCcNf2E7qKXMlpVKMy0E=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.91.11) by
 DM5PR11MB1402.namprd11.prod.outlook.com (10.168.101.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 08:22:28 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e%6]) with mapi id 15.20.2008.017; Fri, 28 Jun 2019
 08:22:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCHv6 1/2] dt-bindings: cadence-quadspi: add options reset
 property
Thread-Topic: [PATCHv6 1/2] dt-bindings: cadence-quadspi: add options reset
 property
Thread-Index: AQHVIdusqBYcLDcbq02njfD9Z3kc16aw0X0A
Date: Fri, 28 Jun 2019 08:22:27 +0000
Message-ID: <c4a7d10d-6c14-a184-4d53-6bc743c85552@microchip.com>
References: <20190613113138.8280-1-dinguyen@kernel.org>
In-Reply-To: <20190613113138.8280-1-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0120.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::22) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:112::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 995c577c-7456-4f0d-5086-08d6fba1c1a1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR11MB1402; 
x-ms-traffictypediagnostic: DM5PR11MB1402:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB14021DD049D8B1C67229FED7F0FC0@DM5PR11MB1402.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(31696002)(6506007)(31686004)(2616005)(476003)(486006)(386003)(316002)(102836004)(53546011)(53936002)(6486002)(14454004)(6512007)(99286004)(76176011)(5640700003)(229853002)(446003)(6246003)(7736002)(11346002)(36756003)(2351001)(256004)(52116002)(8936002)(8676002)(81156014)(81166006)(6306002)(2501003)(6916009)(6436002)(68736007)(14444005)(66066001)(72206003)(86362001)(186003)(305945005)(25786009)(5660300002)(66556008)(71190400001)(71200400001)(64756008)(66946007)(73956011)(26005)(2906002)(66446008)(3846002)(66476007)(6116002)(478600001)(4744005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1402;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lUEED40Td+k1ppGaPd3wuy2dDpnsVdCpIDLGaBIlPxwJUkYofUu3p3Cmh894ihjvJDOBBoskZbgUAuZXElsFbFgX6E4wRgKXVG6O4bLt7f5ux14dp4Oc/IKupkXYuBh3PFEdBI4X598gCECsiw0RPlBnJcc1luNd1PsqKYRwVW/Csz/dOoMsOvUjSkCd9eN5y6r0RCODlvdHN5zL3Sc59trs6ZhEelBEbhXneQ9pHo+p+XSeJBB6qkTodhhTFOjroihCpzemHVjXxVyGBTThMnCuVqHimV2rc0hH8Bv+rFGP3g/rfXUOuf9lEqsmeRKxIg8CbgYHAWMQvuC24+mdFhvIBBqCvrNpbmUXGp7H3vBDG6e9g9MYKX8R4g7JoQVAgjqv5Lg12eFerSR1QPwsi2VT57JFZTYZF4JGZ03LHQI=
Content-ID: <3795FB291EA7484FBE75D76029B16ECC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 995c577c-7456-4f0d-5086-08d6fba1c1a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 08:22:27.9747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_012236_054454_9B83CF6F 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/13/2019 02:31 PM, Dinh Nguyen wrote:
> External E-Mail
> 
> 
> The QSPI module can have an optional reset signals that will hold the
> module in a reset state.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v6: no change
> v5: document reset-names
> v4: no change
> v3: created base on review comments
> v2: did not exist
> v1: did not exist
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
