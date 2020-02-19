Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77045C34022
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 07:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D502208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 07:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UuFszFca";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lNr6pxMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D502208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XWuzas3bTHTvjfMFjiF1TSumfcKlW5XRoU5+YTQm54=; b=UuFszFcakGhe5h
	CmPugY/4OLeYwgmeBYEpci8q0Jl4QibbO+QePvXRDh+V3YT4HSCmTkJbsLbRZJCEzdPEUIbj5Jld/
	YRlI4Ludgpzw+CwyuewTPecDD1amSCMVt4rEMupz6rhuUWiTVCdb2OXikxfm/xZ7WJIAidzavMLt1
	U7fpO/VdDXiZ0e7Vay8rx/f5kYJyLxcAeCHD0fTY+KYvzpNFdzVYhfRYXBaa2mYyawAfbwiMpur61
	THmEMNksDkkOFT+ZJ7nFpyamFwneFSCKJBohKPfQx5/TgpQm9wUc2j5bRcHEZd2qMvsrNC+RrVW+Z
	3k0f9mX5/jCR1uGuqczA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4K0h-0007LZ-Hf; Wed, 19 Feb 2020 07:43:07 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4K0d-0007L3-QU
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 07:43:06 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: SXQP2tAgiJ9aCcOrkRL+fCug79vXoc6kq+9giUV1tqXUW6o5Oe+vntfklr4+6ZRCenzvdZ44yO
 RszV8iEczGgV1wuL8rbYBXebd0FIupZwt3XC+IOBh+ZjzDKIdXOg6JJjVXTKG5nQSphtfvb4EU
 /FuWLJ3sR3nElHtAPknipP71mUSSIpvq+5bp/g7kn2BagxXJdk1LGWoX7+1NrKp6PklxFQ0X3c
 AR91HVai9oW78zllbIpKb0XrmeE2dLM0RAmI1zhhlG0YDsXApkaDYgcQCi5G3zwkePjD7dng1w
 BuQ=
X-IronPort-AV: E=Sophos;i="5.70,459,1574146800"; d="scan'208";a="67175292"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Feb 2020 00:43:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Feb 2020 00:42:54 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 19 Feb 2020 00:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVrWRbIQ11YPREQhLJZ+5VYh8WTRSMMP7nJtZFGLi7tapgJm+doNdWkbtzKYkWH2A5owqJKNTMTi3gDeztB1+XXJPu0EStJZtCe4C934M8/1oy8ETznrupUW4lFgsbw3lHh8JabxsSaYMG1HOuCYeT/fxVpmv+Lo/i4P85XlCaGk3RUUOKUF1iDAf+NCxegofyjGbgq/Ze7TXQoLPtTBeAcHiOf9JJuWWh8Tm7XKDKZcb4Hjsqc+pU6dRu5tWz6cZ+JMxQXaPmIUUZ1sI+3Lv/w5bfzBHwAfAO+bqA4M8/sAo/LJKws09DcscsTUZkdVcTR3qzQ1po7dNPS7ATSkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RJN7ecopfm50Z8y6IRpudUPx4Au74Zjt0mOUJFV6wI=;
 b=HCltWNPFcaRjF+jSBitua4XwkxekFwHcQ3sdET+BIPM5x+kCG0Jmqo02Z2gt05+ORrMaX6+c2T8ABeo4UEA3B5OsPxncUtLtHdT3swssKv1mNQEtKn3YD8LXpCKY5UnFQikqdSHyYVmpJCmqe1yFZpzH1qqfyAvfyKO+SIf1qzfr+CdYV8NRnIZy/S32Ki9x4AYsMBJLqcYSs3hQFHe9JnegFzeUIxjn0TWJ0ALWXDYAzijH1v9NHazBcWthF+l2ntm5rq73pTKhy14M7HtEgiwgr/ZDam4aYgoPQyvdcMpNkq47eLIV4eYNivWtglsnacJPPzcvPuOgjL3Nk65hqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RJN7ecopfm50Z8y6IRpudUPx4Au74Zjt0mOUJFV6wI=;
 b=lNr6pxMZnYy+7majVZxlP1jTNr84WbqTfpkxdHu36jL1fd/sNxQw2XRj/OeGb/21yBr8imcj4EaoTl5foPQqYFzJ4HU7lrHcmAJN7dJRoPXtWcclNr4DriDcOr23orDEiYJ3Yrtefl4Z2VBKW/R7IaOa/8DCts+CNlZCdYaT7bg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3870.namprd11.prod.outlook.com (10.255.180.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Wed, 19 Feb 2020 07:41:32 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 07:41:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 0/2] mtd: spi-nor: use spi-mem dirmap API
Thread-Topic: [PATCH v5 0/2] mtd: spi-nor: use spi-mem dirmap API
Thread-Index: AQHV5vgBI9vD8CuQE0aKBaVzyQWuKA==
Date: Wed, 19 Feb 2020 07:41:32 +0000
Message-ID: <9472041.rHBGLJuohC@localhost.localdomain>
References: <707c02a5-fc7b-851e-6f62-6e295d2fb40a@cogentembedded.com>
In-Reply-To: <707c02a5-fc7b-851e-6f62-6e295d2fb40a@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25b1d776-6180-431d-f057-08d7b50f23e0
x-ms-traffictypediagnostic: MN2PR11MB3870:
x-microsoft-antispam-prvs: <MN2PR11MB3870C70471FD7B72223976B2F0100@MN2PR11MB3870.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(39860400002)(366004)(346002)(199004)(189003)(8676002)(8936002)(54906003)(81166006)(66476007)(316002)(91956017)(186003)(26005)(4326008)(66556008)(81156014)(66446008)(5660300002)(64756008)(53546011)(6506007)(66946007)(76116006)(6486002)(4744005)(6512007)(9686003)(6916009)(478600001)(2906002)(86362001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3870;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8G1ojDWrhHFWVzUtUtbdyIpm03goOakHwEadocDRVY5k4R0nligU9U6vO1BcWKO1nV7s7ApIEt/Gq1OOZcJCM5qUEjco4BqXNS+t3qIte9aTplZMabEFlIYyGgWeHHdmakg21N3prs+N/9eCZpAkpgId6cCMIYvIrRa/dFrW5uZV3Yzr3jZOwCKPSGOanCviqLmFpQPT418z4gdzOG8jBLxP4bLyJwaItuf6meEkHs28Gm0ZDxKhv9G+NmJtrhz+u4CiBH7xH3/L4f/UprpUm85FEDv+63QUw0YSHGGTzMPRTdAT4CrjWDcm1CWp7P3YgEb78GNLAOtvngjmWAaoXxUKPdrAm3vzFosVbFrcWzNF907u4VlZ3W11GcC63xFQ+eADqsW8t96w188ChNS1kAS4dtedigkrcaxpK/Kv64nW4Evksauf7Aa6z+xHFyyQ
x-ms-exchange-antispam-messagedata: 6uhiqpOfzAYXatZ/k6HAG4e7h3h/rQzT9+YgMAbHFTq1bU8zRxpWu6O9eYnVYvQxPMVk2Qlf99n4msK8WtD8P1JkyaA3oCYXaHGV7XArmwUbvPH9GTXIAKODlRef0Gm+wns7veldrEgPGzKeinr1Dg==
x-ms-exchange-transport-forked: True
Content-ID: <417B5D7055EF344AA645C9F4A5A5E6C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b1d776-6180-431d-f057-08d7b50f23e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 07:41:32.6306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO0qFbWIoq/IHhc0LWt2oLMkA4dMditt5rPLREMfKP/LxkbDDJHd6OQSMMvzUPTkcfoJaFdEmDm8zdbhgx426Le4WrqovZd2ondEaOmo0E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_234303_930928_5CA11AE6 
X-CRM114-Status: UNSURE (   7.16  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, February 18, 2020 11:16:37 PM EET Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Here's a set of 2 patches against the 'spi-nor/next' branch of the MTD
> 'linux.git' repo. We make use of the spi-mem direct mapping API to let
> advanced controllers optimize read/write operations when they support
> direct mapping.
> 
> The previously posted cover letter had "v4" in the subject, but we're at
> 'v5', so reposting...
> 
> [1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
> [2/2] mtd: spi-nor: use spi-mem dirmap API

Both applied to spi-nor/next. Thanks, Sergei!
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
