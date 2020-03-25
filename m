Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8EDC43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 10:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8CC2078A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 10:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHMUTgLc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nOSz+0uP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF8CC2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnAOEScLzEFNB91NX4CC2OXGHQ6s1oWL9GxxLfHRt7w=; b=jHMUTgLcDaW9hm
	JQki3DPr+dSt+lXx3VmkG51nreuUyJieGuqtiSOwba7GKQGdvJx2nt22J2f+NfX6eWY7HssyezWxr
	fj4kal3hx+uk7A9i7yPePUvkK+WQ4yoERlfoGsNlkRv0553CtD3dwnzE52G3dctZEmNsajHWzVmH7
	PdExqz7pBGJYPi6HofavXS8P/xhHcnXptEPrVoudXyZBSQpH5tSHBqGTf2t3Fd1C7j3oRL6vCnFLq
	mdW0ML3B7RStlpDRnMZzkpp/5HBXDRi0RXfMySxK/JvIeRJDCYSkyZxJ2+ZYxGvSj080RyMPd35Kn
	ADDbSRG0fGwqMCKqsylg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH2re-0002Dn-1A; Wed, 25 Mar 2020 10:02:22 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH2ra-0002Cz-LI
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 10:02:20 +0000
IronPort-SDR: rcV+30ziVSUHsB9BScavFXMKzz/6JbvoMPWbQarWLTX+dccqioGnGSzxmZSqqypHYgJzUxeINt
 Wh3zzLHQRpBK5FaABdWs/8thVrTEUauy4KcdaUX2LQ5vTpEnksbC+LfTzbEhsY17ykM2olNBHR
 TE2zeT/pywLoCjSjZxJPnYvgwDrBVit9M8pp7DkCq02P2wcIU5qCrvfAl4Hdzrg6UoqnUgYo3b
 Q6rNiDfuFk2GeLM8ghroj7SbQEULechVMA3OLr4ETFC61aVtDpY+2CPHwezmOsmKrPo1hmnyZI
 1tI=
X-IronPort-AV: E=Sophos;i="5.72,303,1580799600"; d="scan'208";a="70116469"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 03:02:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 03:02:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 25 Mar 2020 03:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdMIYgoYPdMN+J/AWWhdxMMcn/yeTE//Sa9j53QvlaL1Wp8BTnic4nD821bbCuIjrjPF8qiOhLNcw6epRUKz5dQGAfGlp1zQKpChq+pQI4jv1rsb+tykszVX/PGqk9dDNYFvJS64N2eqXRncTRaXSUhyfjLWgVbPCgpaeILBPqGfls2kataTw1YQlfcQAilWFHzc57u8YWzBAJFmE+EEnwhdA+6O/SlrKb5DUabZ/dsVxwOIkqLUvoa0+HgbupggX1tVKD/g+VI4BkGQ35weNo1BvK0OJZPkME/sMRBZ8YFyfUNby8+u9IBy5g100pr85GNU9QLWtXSbrQYxiIk7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eZtqzJLP7K49CLJZL2/wAlu4C/uMPA3TTAvEHJHn9Q=;
 b=BLwHKeV9iTqqK0ZZJ6POKW6fwdy3SZAFGzhZMv3MXBxVpchBhuOlwRMUaTBQ2Ocojb0geSBdJxvnWKa58PaIXTYngi2AXc+yycVgegetduSjeYGx2bER3XT8LbQvMOj8kjEu4a8gbPFkMwIlkX9uRyaqQXSbSi5y9STdSWb35LHC4zGQVR1iHNkGZ/jvoG/8uKI/PpXZMjqMfIlF7W1qKpDMq+EBcnHE5TJ3kpwCZdCpcECweG25RZU92uGLTNxcQDUDHAMhR0seiI7t6AHnDRkqBkVElrpJMG/F1C3FHC6Srxn6CBcz5pvhrQUF/vu9FT3U0Zkk/3na/h4OCrB3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eZtqzJLP7K49CLJZL2/wAlu4C/uMPA3TTAvEHJHn9Q=;
 b=nOSz+0uPRlou+V2Fj9htghboLYC4Z+z2a2+BSBGViLGiohHkiyJKUnqWQa6F6pNsGBMC20mzWGnLfGqCd5EU8KgAa8dDYMmXSgW7pNbSSLfyQH0du5qeeZYJxlRuTz5yI5dwIHV9A0qmRcwuQ1BxNR6F3zxP+BW0lpSIQk6p8Lg=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4070.namprd11.prod.outlook.com (2603:10b6:a03:181::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Wed, 25 Mar
 2020 10:02:15 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 10:02:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related
 subsystems
Thread-Topic: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related
 subsystems
Thread-Index: AQHWAonVXc8Ih56XF0O/r9YkJEY3pqhZE9YA
Date: Wed, 25 Mar 2020 10:02:15 +0000
Message-ID: <6445550.R9AYsZg3I7@192.168.0.120>
References: <20200325094319.35841-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200325094319.35841-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d7420fe-2338-40f3-90d3-08d7d0a39870
x-ms-traffictypediagnostic: BY5PR11MB4070:
x-microsoft-antispam-prvs: <BY5PR11MB4070195EE8438F6E8C899542F0CE0@BY5PR11MB4070.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(396003)(346002)(376002)(39860400002)(66946007)(66476007)(76116006)(66446008)(64756008)(66556008)(6916009)(26005)(2906002)(186003)(91956017)(478600001)(4326008)(53546011)(14286002)(6506007)(9686003)(6512007)(316002)(54906003)(6486002)(81156014)(8676002)(81166006)(5660300002)(71200400001)(8936002)(86362001)(4744005)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4070;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V08mNmDlDSGrzzxTSqYJi+ZBVS3anEEYVRxPng0jIHmLA/WEEfb5JfJe45Bx9ddrjuvitwzfoeIKlThgHq4HSLggJl5yyN7g3efrt8y3pLEt5nkF7OOCBQEkjTd9944RzgGAoB+s3p7UFOt0LRbYO/BCemVo/2Vq9g5D2jH6rDIbVQ2LMsch4nymuPPwXSzDDuNcsSDG+wGM8BoOAsy9eB8Cf62X1IqTtvZsxq6h4w38c8H0qDEZOtj/F4AAcMkODFIOMF1dQz6sI9hwP6NTu+KT5FHQ7zVj6tAhaiAXVomE+6rHjBnih607GRS++/7M8IFlSTvlvXZWmQgGK2OLSAJXJbi6acWuC0ChAXgJBTwI8/eE9TSukvbtsFnhDPfCPGmcJuSBvw+bHQzLoHUQCd8A8uCJy8uEOaqnoihNqeTtkT8ZW4/opJg6q4nW8nsKvej/i62IXdPAhyV1cFernWi5q0ty8qBrV9osI5S0VhSO7YWUqxNfVMdGG0g9hfe4
x-ms-exchange-antispam-messagedata: fk+iFOezSNAk/m1ADCJ44JbLv5HeaCBhF5rcoOP/7Jp60f7qiZBdHLsegFFYf6rWsUOKi17bancQhS14qgdpx2w/KNcMs4gRTFfFfggXf+R4+/Qght0qLqcDznNcyFo5axtqpR7LeSkxJXV8PbMsUA==
x-ms-exchange-transport-forked: True
Content-ID: <6CC480C60AE36D479BB878C36763E245@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7420fe-2338-40f3-90d3-08d7d0a39870
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 10:02:15.0256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZ8J4/7KOdSF2lk0aCvbakyTIy/HXdoLQjdCo/dimDY91MY6qvS62Sk4x50QS45xTUAjD7O2QKdmAx0A4wmhB8Jz4LqA1CnpD6aqQgmEfC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_030218_774780_4C660B78 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Vignesh,

On Wednesday, March 25, 2020 11:43:27 AM EET Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The #mtd channel (on OFTC servers) is being used to discuss MTD related
> topics. Add it for better visibility to the HYPERBUS, NAND and SPI NOR
> entries.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5143e248170..8124d8faa8f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7769,6 +7769,7 @@ F:	Documentation/ABI/testing/debugfs-hyperv
> 
>  HYPERBUS SUPPORT
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
> +C:	irc://irc.oftc.net/mtd
>  S:	Supported
>  F:	drivers/mtd/hyperbus/
>  F:	include/linux/mtd/hyperbus.h

I saw that the Hyperbus entry misses the L: and T:, would you send a patch to 
add them?

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
