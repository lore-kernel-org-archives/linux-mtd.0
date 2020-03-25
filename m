Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DF5C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 09:44:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161BD20663
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 09:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uf2SbHrN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mL/lGh+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 161BD20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMLLhul5zxpBF9PrC6TxyAzR0GeVRY+zr/kkN2RdTd0=; b=uf2SbHrNQQKST2
	UczASi3QUzf3APEAyh18dtqvEJJcMwM1zrO6dJuC5RkbolGL6zz2IwXdoBZyJf5TDVj1YbaYSQPqU
	hKCluuYyq329H8PrLph4UeqcqfIAMUZe1YRo8B6rqq1ZB5O0tHlmfHKgeJ7GPnqxTeEVjy6sXh+Rg
	oLMHOTILiDsk/24xtzedjoWX60vq3iuIViL2Ki9FxQAIQfUdAR1eo2mkoII6cDhzyNiFmR+fXqfA5
	BLRRoN/Uzffp0V6p1Ppoc0JdprpPIqj9W7l9e4gwchiPMYzg/meK3PrqsRSkPi+WpNQa1KiLCm55r
	o0Q42Xok4vRmOzfS7Xiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH2aG-0003hG-2e; Wed, 25 Mar 2020 09:44:24 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH2aD-0003gt-DH
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 09:44:22 +0000
IronPort-SDR: mEvWdlGpLNp6LF/vmOZh71V6R5paa5L/y4fW3MmN1iAVSUY/PjYdUVZz64+jkElR0RmZ8GlBbv
 gz5A9ruk6Y4AEIpyjY4091aHOnxZcEmSf/B2HWQ9ilw315Irc9C+3gFy3jLw3plcsnRLMmxTCC
 evgFAM8DwYE3VTwKqYMqAgJ1mTkS6UeNJZJ+yUimSIHBFgIIyah/8OVOi06nR/FVtQHg/gvwEK
 BywLDAE8yy9SCTfRxyPMet5iIRJ+s5KfN5e4HvsgfTsFsLeqWwdqr3cGantjPmIkdIH3jq/mxa
 M7c=
X-IronPort-AV: E=Sophos;i="5.72,303,1580799600"; d="scan'208";a="71185840"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 02:44:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 02:44:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 25 Mar 2020 02:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL8rY2xjwdGA6us16/NGNIcaMtCD9kFkHfnaL5j0aOZXyeV5D4W85Qj3fiHxyNHeH67q54gEPi+trarl3rBfbs90HPkvpSaMz6HL5RlW4JwbHymmoWXO+HdHrdGssfE9Yx/Tddfp8C1h74mh0PUZNbXXrr09NS6v+mhTxojeIqD1VaMApOaL+MHUJPpn4W/yoHzQTi0b75asA8wDBOa8SVFgG+riFnGJ4TM/XQtVn1NX/Qc2j+CkLZ7XUw9I82nJk8pc4VQNvJkkmPLJ0yBJXmbcG7AfHH5fmmDjXUJ0nTeuLUS+h0f+hoJ+BLVIw3szW0yRR0KjUO6/9QTBqWXvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ5Rs2dyIRT9Qz51PGNffT1SbblMTdDNUCfG08uveuA=;
 b=lgtaZg74VAf2nXJTba9btBsjoGJZaTERy70GXexQl2EXywKMpugona+ddR8Xw3ZXLgrqkmejLogU1hdwAXzYz7bxpd7c0xQ79NRlqniE+wt+2es3YkN4NRVdq8UTvG4dGRBxTTqs4Q6EFxpNeiXZEQE1xK+BjpCyCM4/IrYKdtQK5xjzsgoHqFgSqMniAqlJYoOn9edL08rkQRax+gIjcFxv7UTa4eEZ08JoxSbr+Mz2sZhTZdHFAfvHCmdb1ozW0XFBRntaMMrPWNzudwZ/C2poEKhiYymwHSCGLlBM9NvWnIxMFHqZj2fy30SZyABfgPW0nHoY8BK40kaZTs42ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ5Rs2dyIRT9Qz51PGNffT1SbblMTdDNUCfG08uveuA=;
 b=mL/lGh+IjrhKe8a/BOfZH6hvsoM7TN1oKeqosHSRPCFLtKs7N3UvPeymbKAi6boyK76SLg9xojRj3GYV3rzAT9P7/RThcDkAU0HR2/Y2WTqjF4sZxYjSqrtCP+mjflGnxUp/RKEuLYxuA/pJgHLEJUO+PxJc8rjfIIVU0cwdNuw=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Wed, 25 Mar
 2020 09:44:13 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 09:44:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVP6hWSi4A
Date: Wed, 25 Mar 2020 09:44:12 +0000
Message-ID: <159969915.yDvMZjxacr@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-2-tudor.ambarus@microchip.com>
In-Reply-To: <20200323092430.1466234-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ffb8040-4234-4fd3-e3f2-08d7d0a11388
x-ms-traffictypediagnostic: BY5PR11MB4370:
x-microsoft-antispam-prvs: <BY5PR11MB437006DA08C2ACDA772AEC77F0CE0@BY5PR11MB4370.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(366004)(71200400001)(14286002)(558084003)(54906003)(26005)(86362001)(6486002)(316002)(6512007)(6916009)(9686003)(4326008)(66476007)(91956017)(66946007)(64756008)(478600001)(76116006)(66556008)(66446008)(8936002)(8676002)(53546011)(6506007)(5660300002)(2906002)(81156014)(81166006)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4370;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DSMrjGeyV+BIMd4f0xfIzpsob3LM+JU9qcq0/ZLonNwhSicaDQHG5PtC/9tiZzD6IxFuDuRTCaBPS6OIwz3T7qzFEL1unXGZxn1nOGmpYboTmrNQ7L3+vGzH19tzqUQrlKL/WBuuNj5zMJfNp78cwRP2gmvhuqB6KtbA6dmFUM8D1YszYKEq2fSWWgFCUziEjueP4CNIUr7v7+KuTblTBfQpSFOdltERrpasew2dwafQ6GYS5Tw2OIVdKgBWID5YkbtkTn5GLYDIkBte8qiQY8gp1EbxyDjriG3U6tmgZ1Mi9qWS3bYU6MglnNNskejuzw5BVs1vAGkPVnjM+VYKW+EZJRMMmb5bdO7eXlcQTO13RCIl/kfe0uTVRAfTeUawkdCQ36s+HnZGKtNp+Gs6mW/xvkFomplRmIVBe4PbcvP2sWoCWXTlR+DTF4wAMATv
x-ms-exchange-antispam-messagedata: 2TZYcSiu6BrHYyH3RBENMrH2Cjv/HJxkBC0PfTdIJ0ZaV+dLnqoPQNqDF8DvvUXfyTf5KGKGuox+/900MG6I1Asiz/VCQN7LFONoKq88zMwc1m9+ywDSm8GaQd43ILFgvW1aBo9fjJnUBnkK3W2ndg==
x-ms-exchange-transport-forked: True
Content-ID: <428DB526F1CAF142AD620EDF5B4A900C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffb8040-4234-4fd3-e3f2-08d7d0a11388
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 09:44:13.0455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C97EVCaCOpG7cNyGz/LwLTg8BdfbcLjsrvykrWG8o/+ERMM3MsP9cynGqLx/Q0/96S9DXzS0XER+5iBnPAlN1M6HeU2xXfiRJbxrrUDZ18c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_024421_546097_71A35675 
X-CRM114-Status: UNSURE (   5.61  )
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

On Monday, March 23, 2020 11:24:33 AM EET Tudor Ambarus - M18064 wrote:
> For the unlock operation, read the number of blocks column as
> "locked all but number of blocks value". On a 16Mbit flash with
> 64KByte erase sector, the following changed for the lock operation:
                                                                                         ^
typo s/lock/unlock




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
