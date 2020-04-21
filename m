Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B0C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 04:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D2F2076C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 04:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JTkm7pDo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ARBLR3Qp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lFyx0C3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D2F2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XmUCMZOQVOTKF6wH9MG616B3iRbZ2TEBdOKJ613bqI=; b=JTkm7pDo6x1exy
	LWbZlZaEqURXo6gaocYiC02ZvnDnfLSEG2+IOtrXqlyGiHt3cIGs7dQIEgkRuo7T6Xlr4Xx46Pzsw
	Zy6e90cntPyfIYIhm2FAI7xLPeB1em+g91PIzlCRR89W4fitS3+uQog8iZ/XWxZjtvERibCtqbaw/
	7MmdzsN67lXni6ayXouOT39imvteKD1Hh7KDXnMppLGY7xma/qbiJi4tFzO34ZNN7TJ253HPWKPNs
	AWvDRs83FVBqpxqa9atDfeF3219t1woEwLZu8NDhyYnnBwXQGqy3bKgHFZSYmJUdDbYN/kLhQrrxw
	7dH+325Kjy/wYOgVZ6KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQkkV-00042S-QK; Tue, 21 Apr 2020 04:43:07 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQkkT-00041o-C8
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 04:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587444185; x=1618980185;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ztxtoGEanXv8YfJLmgNGteXhmh4G+Cd/QTGGSwJQ7M4=;
 b=ARBLR3QpovzMq8GScJe69O+sIspvD6Uk5UNSW8D8v9YeFFKQYfTh0Ps/
 p133rd/s+b2l/89Yex8nUpsGAxQRejb4IZOCVlZiH4eejAHqbUkcunVzc
 eu00p1z9I+MP8rhxVM26io58iHZdDK6V0WwtOK/+xcuRMfhHBqjFQJREP
 2xmGIIGuASzFlFWLRRxLtXws6O48XriUSoyCq8OmbEy3KFxt4H2QoSwGO
 VfK0AmVfCZQ6T+OcY2yk+rvMpJY24vcOeRVM+elr/zTMLsm7O3NFG/XUl
 sDmlvUoxcEQDXJtpiipg/LbGu1buPVmkJw3xv4MCmFITvco7QwS10uFQg g==;
IronPort-SDR: vQ2lpbk9M0oNXaXKldLpTJy1T4WPNj3n3+K60sswvp5qXAU1L4VuQnYRbY1x/iVVG/EAGfggcq
 eFeOAk0rvp3+AzDUYKdR2ln0++Koawo7dSa4jlZH+HdLZ6z3xVHIUjIt+aIjtzaqxcagz71yU+
 8gyczl1LhwibycCIukcloNOvCSt0go6516IE/9tbOFy5tHCOwUgTXWJ73tPIWlc1Qo7OseJ0jF
 dehm4wY1t3IIuHJiULc89TivaaXsQ/rbNs9N8Pd4mDPNLEt4IPdIGAanuQxgcwracLZwBLAcLr
 zDQ=
X-IronPort-AV: E=Sophos;i="5.72,409,1580799600"; d="scan'208";a="73978523"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 21:42:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 21:42:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Apr 2020 21:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKoUMTSTkRHPczVwm/a4QiXcbCS7H2tYd2721M3+ObvPCv2UsPC5WBikuW0LuPg1P2hwgjDozDUYYH/JcZzyJPqDXD9ch4AjvKhuymTaw2ORQ4OwJ77SMt5bN0LY6QD17DFRkaAmxRry6aX/LQ310bhYkqejm1F09gCakIpn7cp+0LoF9KpVhDcempaqNRpdRAcaJBwVPT+RnL3AymHLSyhfrkwLlZZtqufI5Y7qX2nSEezfb49bynfqy9BT4ozxfLi1x8J5GvoE8kSrlHPFp2NfJlFZrcnqpZrLpbtCOIYnVD7GwhhlS71Tqhr3uPQRwF2I692YQyTQotD9x5bXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IEDrxoBQiQLMr04D5f0dIR4nIDoGeiPNaWk+4ecGEo=;
 b=NkvhESsoyQ6nhCCJb2Crjn/WzMveYSYAA9znd0z8WyADdYJjIfOUjSkF0RuycI28RWxlfzzoLtH47/QjH4oo9YH++k0BkM2q18W8wWk4OvHxgFiCDehfv8zmxFDuF0vQfRx2PiUMFrC2F3zb7FTTVV7x7kieAlnD4bEOikpwZYw+Ccn+m95DiyjZK0rlGHE+ZE+uPMYyM+B4eEqTo9LFHh02DhGJ8l+W2pVbOA/c0hZB3dqUQHgssb72A+J4ilDahoJymlE0TNh2memkAmKLaiAePbX7Y7nenqUGw3QBorTUsKYiN21XhLGuSNOU1x1qBVk+SQoGQ4flI0Ax3pl74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IEDrxoBQiQLMr04D5f0dIR4nIDoGeiPNaWk+4ecGEo=;
 b=lFyx0C3LYd0N1WKV84upWZJMzoThkj21jlm3qrEfx7NYvxQEkdhHsEECqyH8AEOmnnJtXHAaTvlmNLuKWFjBhg9LCMUjJQSGLM9AzlPn0XItDMVKqt4u1n8aDAP32ngz7KIzGWnbWWrKI1uHVV9prLtp0JOrex7DrQYYvwbjH5g=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4483.namprd11.prod.outlook.com (2603:10b6:a03:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 04:42:58 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 04:42:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <shreyasjoshi15@gmail.com>
Subject: Re: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Thread-Topic: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Thread-Index: AQHWFrKxoM6aHp0yskKh9iJVNA8DIQ==
Date: Tue, 21 Apr 2020 04:42:58 +0000
Message-ID: <4649698.1y6FczgeVi@192.168.0.120>
References: <20190919014916.1303-1-shreyas.joshi@biamp.com>
 <2776438.Slas4mmtxa@192.168.0.120>
 <CABY4bmrSwLdnUMa5vJhfi2Hvbq4FHxU=hcXJX90o5dFXBi1Q4w@mail.gmail.com>
In-Reply-To: <CABY4bmrSwLdnUMa5vJhfi2Hvbq4FHxU=hcXJX90o5dFXBi1Q4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e42c8fed-b8b2-42fe-e39f-08d7e5ae7720
x-ms-traffictypediagnostic: BY5PR11MB4483:
x-microsoft-antispam-prvs: <BY5PR11MB44835C87BB45ACBF3F69F105F0D50@BY5PR11MB4483.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(376002)(39860400002)(346002)(396003)(366004)(136003)(8676002)(6486002)(76116006)(91956017)(9686003)(6512007)(2906002)(6506007)(186003)(54906003)(14286002)(71200400001)(53546011)(86362001)(4744005)(66446008)(478600001)(66556008)(4326008)(966005)(6916009)(26005)(316002)(5660300002)(8936002)(66946007)(66476007)(64756008)(81156014)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FxGT8lBP/ze2ojbgnKIq44Cwo5AH9R45wCG2aKnpKq0LKKuzUHJW1tWmDBN1xM0t3TIAWXoA4Sytxq0aLjoyWqdTbs5iRxU1hTLxGJr+ZA9SzxbVj4cMcznLPcDT54KwHAXxrv7gBx0dCCGQ7g7dQaFqWl5uzaPtZ7O0rG5wRVkfK1mnL4BTz3avUDWU0OVRElhl9tPM4iitWrR5Sz/8/Ok0DZ1kxKdLvw4apveQBuqysYG7WGS2aKyd166jjsF3Aj9uZxMlHGt37vVkRHk/2fZCQV8RfYKGQhwZ9DvlJWoAcrfqPD99Y13vn9Zv6hNT/XLts3pz0w4YU/EdXhO4G6bNxizHf9STbL1XKZ4SWXWHk2z8OKlm840NqCdTVu9F87hI9vuqYe8VxkhA8Q/vRNDr8gykNjxvA01klPNWGMIpcYljHtLfHs0lSuEJDYL4yxKuEpZfppOofHd3W8jLAbvMRv3q5g1DuY6WX9nn8oHFA7SIrll2A+pff1V2t5JFzsIaAqpjZQgbYOYc7qutujsz1frlEYqWYECq35hKYas3Ax/VgEq/hqqnGdSMuEIP
x-ms-exchange-antispam-messagedata: Luo51/yH8txLoMNaU6+PAJn611YEEaDqiWs9NZ2lg4p+lkqs/mY6wtEEYcFKwIL9vis+C7ACb+NhMSUPcjLp01KwmyZGlhOo/bXttB9O0ZYTPTj83ZzOugTTmY9fok7+e8j31dpni/XsaNSUJBA53A==
x-ms-exchange-transport-forked: True
Content-ID: <A771470DC82BAD42AB3DABE7211999AB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e42c8fed-b8b2-42fe-e39f-08d7e5ae7720
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 04:42:58.0379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRM87YTnj1mvgF9Lpo0q7wAkh1TWKRmDr8NmT9yMHRX6Ywp7UOyWCCAESIkxPLzave8zjRBqWBMcAZhNDkIu3n23w7knDqm4qjudSPN1it8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_214305_421721_FAD0D5CB 
X-CRM114-Status: UNSURE (   6.38  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 21, 2020 2:42:29 AM EEST Shreyas Joshi wrote:
>  Thanks, it works.

Great! Can I have your Tested-by on that patch?
https://patchwork.ozlabs.org/project/linux-mtd/patch/1587103677-244754-1-git-send-email-chenxiang66@hisilicon.com/

> I wish, I could have assigned this bug to you but I am unable to edit this.
> However, I have added your email now.

No worries, I'm sure that someone will update the status of the bug.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
