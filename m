Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BEBC33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 11:05:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8BD20730
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 11:05:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rhOL4XJL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mwvgq/I1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8BD20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Giiw77ozFHDsGrGZygPmSFOi4HYDjE50cOd4swwO8M=; b=rhOL4XJL1OBwDS
	3P1S8tYb+nOXTodmiWPYlThZ6CutBPQaHqUwe0bC3huaho9MvsZ28DOJWjmIzNIK7QcWRN/JJ+S4Q
	IG6mQp2yyH31bjOVM9QtcYJ/o+T8G5cJRsCjGlqTQFlN9RSqC42V3tQGCaWBIkO79U/sl5l3Joux2
	fQayhfNxiDzJRU++Hb7E4/g0Afu2UtZihqDBa3E5eCtWd2lDKTc8uOS+RqeXvVdPal0eoPF5o1qDB
	/5w+nvqsZf6PEa6ScFdxA1M3itB7/3UXLCRP+a+E8a3toW/9fBjxxGUL8q60uBcm+m4ygv2Lp/u+H
	GQL154yCrAtbKY0mxrPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is2xk-0003bH-Dc; Thu, 16 Jan 2020 11:05:20 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is2xe-0003aL-A5
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 11:05:18 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: CNZQJPyYx29IOtsBBX6S3uXJRHXtOc/YBCn7AdPcPjPlrY8k2cP4JK3bSYobqc3QZ864777D9d
 WhB2sc6gDCQ6HpcTUjrR9Us+pI4tce+7Vu52my5yAOfpJUig1uW8ZXbNLcDwmGPlRlXUZSLckH
 fNDXLnSI/JSzZeEk9OczFnc2pukD/gCXLjA7s9l6K9vsCG1+oOyqJnwBbXv9Xiwe+J3g29fNl/
 oe4keJ/bKaLF8eEtJbeuuFC+dSxC0jMVDznizK1/aQ6hu0S6Gs9yLjinvtcPIBhSuua7SFL6Rl
 /Z8=
X-IronPort-AV: E=Sophos;i="5.70,326,1574146800"; d="scan'208";a="64949955"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Jan 2020 04:05:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 16 Jan 2020 04:05:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 16 Jan 2020 04:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUMYB/VirNTTZdCHPJPKhLuO6Nn3DaqaohWZLAREVkvWO2+ysxnPM21OP0+pieVCHv310b7IckxqboWYj461c+9Ukh2dMyJttW+BC88rO3mijS5bEAXLzv9jL5mz4mBOt/yNOfz/T+Ln+AlUoGby/sPGHDfmX8beRfAxU8qcbNAHQxWzZp6r1gjYd8LSw3DiXKjZfB3wUvfCLRlbAqz8okh1fXBIjlyJpPRlqAmVAd189cdosSNOuLOuPa52TstgIJPo4rm7Oilf7CP9/jCVOPWphPozT0v/6N9GyDlxZzjGCYYhNmtxrJjrfx99GpuEBVw0JlBuLzTIiJLAlWKLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFLOcLm7HxDjXIwMnXro1peudZ2wdWB0imsRLpDPMHc=;
 b=HuwYMb5VtqbRK/gpDt2Ji782Ke7ijxZRZJo+3EOXqf7CFmG17EYKGArfxAgTI6ZlQbVronXc/3n59D9S/mWekq3C5Twm+FBAjrP8F5xn4rfmBXnkRyr8huEANGYnZIynyraYDm2LsHmJc/9TyDk/2lHC77DFyCSk0C+pUTcC62VgGgRdAyGokJSsscXjDAAyqxMz8BJbi3EhYroGUTEuaEeEVJU/Na6Nj5IgecFWZf3LuJ3wmGWkMAWvqMnsJkwwBStp/GAmczAybADqtKg+31Ozrk6fJw+fInncQ0aO/Pp1pfN4MusAa4RfKUciprHnKlCffj/juBleBQcuJzNlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFLOcLm7HxDjXIwMnXro1peudZ2wdWB0imsRLpDPMHc=;
 b=mwvgq/I1aF6j7k6TZSglT1vW8C3nFcExO9B7RJnA4hUOS2FPauElqKMiSNZXTS6pep5kpcRNna/L4VmnbMpVlHv1iunPCgSBIjUpdr7ojNaosA8UkmHASfyuXRvz42h/oD4454rSe51SXXP/lt02doTOGjCQczBFAV0DN2xdVRo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3808.namprd11.prod.outlook.com (20.178.254.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.11; Thu, 16 Jan 2020 11:05:06 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 11:05:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Comet
 Lake-V SPI serial flash
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Comet
 Lake-V SPI serial flash
Thread-Index: AQHVzFzPSQGWRvacSkKr485VsJ76yg==
Date: Thu, 16 Jan 2020 11:05:06 +0000
Message-ID: <121896979.7jbVTq2xsG@localhost.localdomain>
References: <20200109121402.16272-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200109121402.16272-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 778c5560-bf85-444e-c484-08d79a73f1a3
x-ms-traffictypediagnostic: MN2PR11MB3808:
x-microsoft-antispam-prvs: <MN2PR11MB3808D47340DD8B63909C7094F0360@MN2PR11MB3808.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(366004)(199004)(189003)(86362001)(316002)(8936002)(9686003)(6512007)(54906003)(5660300002)(81166006)(81156014)(6486002)(8676002)(71200400001)(91956017)(76116006)(478600001)(66946007)(6916009)(186003)(4744005)(6506007)(64756008)(66476007)(66556008)(66446008)(4326008)(53546011)(26005)(2906002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3808;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GMf8r+GSTYQ+qKHZHWy0rbslKS/La3iDeDvZk8XizWi8/TMPFsxqJ/QZRl2Vt2VO1Zk2V9K/MgCYuqrcsOhYtXf+rqRXmUHZTgMVawyvAEr08TiLM7IRLn+5W0Ine6kmv8a3grIWodkNI7nfDpEJtwzzceJicbEvc7ajKyHYuiWgqWgL2NNiTG7vHTfcq4rQCCb4L9Vf5Ymf6E/dhRzx6gDkcjN5D3XVFHqAn5pC35fNPtUqGWzLYj1EUVFwZXvieN+fo+brctJzo0gYqXBw8Mse3VyG41fqWFTeQyWxGrT1wZOcX3nlvEk96enxfG7KvF4ReQB5T9l3D52DFI6bZnIiFm1hhZ6bJLCmkfYIu+ci5A2Y66gjFEungPW6Lo5KlniGljeb1rffapiPMfpn/vMurN4D12lpT4xFsL3WsMRe6Xzr0qBLo577TqNc+oi6cFZ7NFEXJfY5Pyuc5tCXBiTQ5FGFKB1MLNdPhu7pJGzWLbLV37FSJLNucT+ooL66
x-ms-exchange-transport-forked: True
Content-ID: <7754C06FC112AB41816158CE160DF9E4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 778c5560-bf85-444e-c484-08d79a73f1a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 11:05:06.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCmf17bLi5c4wj9H2PG5nHM2trznW5dcc2fN8OST4txn226/U82hBjgoICWatBBYQYj9gkvDrNNGSAPQ38T4PHUdOjLqNB+Mr7jCB3XbjUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_030514_358529_30EE93BC 
X-CRM114-Status: UNSURE (   6.28  )
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
Cc: richard@nod.at, mika.westerberg@linux.intel.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thursday, January 9, 2020 2:14:02 PM EET Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Intel Comet Lake-V has the same SPI serial flash controller as Kaby
> Lake. Add Comet Lake-V PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied to spi-nor/next.

Thanks,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
