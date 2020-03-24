Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BA4C43331
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 13:48:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D8A206F6
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 13:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j+nXOkhf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="LsBp5I1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D8A206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rT4QD7czGEq3WRPmd9d5IvJE1mtfMWRK6lEcKEq37+Q=; b=j+nXOkhfxlAcQJ
	+EhOmkRjr+KvpgF9kIDTi78xavUyKRP7wbsrrNUrSBer4tF5fBVEJI4gKec9/R14QCdV5cgJDCiAA
	r735HCMjruYuf1qHShnMjd3b/K+Ezwy/f848BWbGjHqLBbhYxV0ojnAW5qFl/MXMZr2e5Dtg+2TJ6
	Sj6LFBIzB2RckhmmtoBTnYv2zUwVYMK2Odfu2PpU629vO2VGmzc0MOdF6AiRTjbaHaSNahRsHlmtr
	CImQdUbLY35mV1JMaacpEJus30gwY13LgFBpxPG/ECEdKSzlbbEzoDLbREPigd5od6QooAmGDxUxc
	DuTwOFP/ehc3LlVdCCfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGjuU-0008T4-Op; Tue, 24 Mar 2020 13:48:02 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGjuA-00081O-BL
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 13:47:46 +0000
IronPort-SDR: 7u64FX2sF+WIbCEoqtZz3Ea3aSmURplJXlWlz8ij6TTC0qh+zNiGpE+6Ot1Paj409dN76mR5A+
 AT+Ebp/IVdea7nclQ2bFreEB9ZeeAslqJfNNFBG9ub4JVJENvHIsTqv8fEFdTXUbBfOkPa+iVs
 IieiPL8r/fkDjOirQ7/QlOXz+prJMEfnMHwv5I6JCv4vlE2rloVL568FiMbTGjKPbBomA+OFfe
 4BMKdo3m4ndyT+hEuGzPwg++6IOHvSHG14ga6CcLYuKsOZkz6VT1IYA7kbv2gr2RTKkLVSR+fF
 Gfk=
X-IronPort-AV: E=Sophos;i="5.72,300,1580799600"; d="scan'208";a="69983567"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Mar 2020 06:47:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Mar 2020 06:47:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 24 Mar 2020 06:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiTSsABf/IWgo2PyvOUdNCBrUG9zge+55IvjSD3usbaPtAZC5oxEo/8qH/0CUz8DWkK3mU6HDeSu2EAQp2cJI+z9kIif/C4e56JS690gF6ubNqAOb9J98LZSXhWqt+zM0FT7gTe8xKlrar38jhDJCjK3oZMRZatzGoatgwq2ZXwgrXvkB1dkXbPIyPEblq6QWOSMw4tcoAAYwi8Y4PoLGdEZMVAQyR7QVAEqv677npgle+UrHc89rryVtUjwiLVihIXje86nca9UOTd+JOYLa/h9jWKXow5dnD5J03q5Lw21nnmBeHvwoTGy8gHYzU7LxeGU/A+gs04+MOWAZ5lqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMf6HDAvh/8XLncAtiMU4EYPXrlhEYhEoPuktzYSQt0=;
 b=dbjVi1agp4Y0aEIhf+mTP8z3XXJuRza2LOtymijnvxWp6NYkND403SL+Kfhe19hvQXlwTuZ2B9ybVT2Rhgki6RsxhRe1cokN/f2Lggf/DIZ8kiuYLVUdRKqTHCr+Yw2dj9RZkxPqtfGZx7yUjLPYnfzwe557ubA6lI+8Pvw3qP8Ravwkwg3HRIFrVSLx9TQdF6fmLdpwizPqLBxVbWtS++PchEYVhUnnEX6nWw7eq0l3eUnKdJ13YypFENfEh2R+PxzMZ1s5htzT4YuGYi28T3mYavyBrhQeVfEtVIH0xyosPOzebkUkB0KveyWB22H3fXB3pOwXy44lmfn901vEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMf6HDAvh/8XLncAtiMU4EYPXrlhEYhEoPuktzYSQt0=;
 b=LsBp5I1cJBADrNWrULeOpuiwxcq1X5+OuqDk7QHyzw05WYQTsySj7KtmjW7bKW9/d+W9j9FQLfUBl7n4P2kiaPQJZahkLbiScsgT6WWbjYUpX1OaDKlPSCWaHn+u9UdjYALX+usWT4JWbcgx9YmZUoFE58dBHjQN7OFq3cdn3Dw=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Tue, 24 Mar
 2020 13:47:32 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 13:47:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH v4 0/4] Add SR 4bit block protection support
Thread-Topic: [PATCH v4 0/4] Add SR 4bit block protection support
Thread-Index: AQHWAaGoEQ+/CjYqWU25daOPN99hf6hXwkIA
Date: Tue, 24 Mar 2020 13:47:31 +0000
Message-ID: <3224870.kY2useYu5I@192.168.0.120>
References: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 521a9b1e-9fd4-4c3a-dab8-08d7cff9e6b5
x-ms-traffictypediagnostic: BY5PR11MB3895:
x-microsoft-antispam-prvs: <BY5PR11MB3895847076B62D7945F18591F0F10@BY5PR11MB3895.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(366004)(136003)(39860400002)(6506007)(53546011)(26005)(186003)(54906003)(71200400001)(316002)(66556008)(76116006)(66946007)(6486002)(86362001)(66476007)(66446008)(91956017)(4326008)(64756008)(6512007)(14286002)(5660300002)(4744005)(2906002)(6916009)(9686003)(478600001)(81156014)(81166006)(8676002)(8936002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB3895;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xPh3hnGhTZeDHQIkH5nn41DknJzSFZsFNExPm9kFPSH7je33P/d7rA/QbMD80sT/YV75a3tCD5hpS+R0XcU0pbFbX9cQk8W320J8nAC6CnChYs5RjYXEfHAJ3Zn03r4YDPW317pXmOZfG3HvLSvj8pPfHu837Q1D+M6wU8uTPzDsm29xspiMZwlW0M5rYdAI+rHKhFQ/1QZX2vKMRcwdrKD9uooPfZ5kBSRD/mqWxdndxCZYZjv2rCmWZXo5RgfvWKMPjGjtA7m7ZZWxUdu/mw3GcxmRhl+kVcVsQ7fTnzRo01h3o0A75eC9PQKI9bZg/t4JGyHxj349k/q5cR9faYcW2Op6kukUeFYworXXnUn478CCqQ8BX4/CtCgLWeJYA0FFP48xyrHybbarl+zkzMkyh6bksWlxOROMIuuNuSkMjU1i0satTziC9hXKDuIZSU8sUO/uAVI4NY6soRLle/HeckSrQvh8UQEshmf8PXOvHXX5aXMA4OdmfFRGiYn5
x-ms-exchange-antispam-messagedata: Kn8/5KWHwjFrGT4f7zPwTAvlZQ8gT8Q2xdcqzG8rOWIifSmXQSCz0qry5i7KajXjIDf4Pj+jfK2JuArpRdEUsftANqaFRkg6C5Rq/c/NGifO6QSsOl/QMbPLaBX+oHx7V2BClyfZuAHvgREW6AEgeA==
x-ms-exchange-transport-forked: True
Content-ID: <059AA65B4184504097A5CB847D57D1FA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 521a9b1e-9fd4-4c3a-dab8-08d7cff9e6b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 13:47:31.7920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9dJxytOpRSye3ykpgEjLwNlAZWKcZGW5/Ll/eaKLWk8rbz+mhyGFFH1ephLrkUd8ADDT4kXz1hEUyYNELqcU8CWAXazUAssSKLINw9re9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_064742_563027_B4DF46B9 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: michael@walle.cc, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, March 24, 2020 8:01:27 AM EET Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Hi,
> 
> In v4, I dropped patch 1/5 and stripped the changelog that I had
> above my S-o-b tag in each patch.
> 
> Jungseung Lee (3):
>   mtd: spi-nor: Add new formula for SR block protection handling
>   mtd: spi-nor: Add SR 4bit block protection support
>   mtd: spi-nor: Enable locking for n25q512ax3/n25q512a
> 
> Tudor Ambarus (1):
>   mtd: spi-nor: Set all BP bits to one when lock_len == mtd->size
> 
>  drivers/mtd/spi-nor/core.c      | 144 +++++++++++++++++++++-----------
>  drivers/mtd/spi-nor/core.h      |  10 +++
>  drivers/mtd/spi-nor/micron-st.c |   8 +-
>  include/linux/mtd/spi-nor.h     |   2 +
>  4 files changed, 113 insertions(+), 51 deletions(-)

All applied, thanks.
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
