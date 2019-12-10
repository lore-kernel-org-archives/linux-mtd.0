Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2510C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 17:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD0D2073B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 17:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t/96nXh7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="q/1XuyUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FD0D2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gX+0gjecfJs3Ah3lfCiAydq85D5REiyQUlZ9FmNFVpQ=; b=t/96nXh7bjGpH3
	KSyL5PHTMctZUpsDlMMu2PvZan/s+EzTjN1vtjbjXOoHE2eYTFHkUtYcYWsZY9XOUlC2CHcoL7bxP
	1oyJwWySDl8U+uI5ZROlj0XYP4tBET8cP/NGql/vjgPlHWCcwT59cfRa4SrmhXQo/X5kX7b5V38EN
	jduudL63XLyLVnS6pZOxUVKCvh2Lz/LK/bpodBrokEOMJsxxjodfwkHi0pEGHfqkY0qQEsVJFJaiD
	m7vkxGg8rVgrHJFEodV8UPVDsAT/uC0zhx2+MLXMZlCawc0vKsmfHuZ1fl3cRV79e6e9T2vMvc43W
	8C2cgNOUpn6GPyvbW3UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iej0E-0007Qf-Nl; Tue, 10 Dec 2019 17:08:50 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iej0B-0007Q8-OX
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 17:08:49 +0000
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
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: NdosQDR4gqA7630ttRMKOYGkJnfZzrNkEq4DIidtPVYuH7Mu6Df7ALc6b9oXetgrprhRetY5h0
 bwAXY583cyoESZckUp14lK5GsBsmeD3e/H50IudNyFtlgUD9tzpG8aEyMvgnnVzdKWuBLFJCzS
 z2GJy+uTddIU+c1BdJl7B3EMrCwIixqfujE6R14fA4xKFXyiw0AbCil5QTvfBc28PJjYmTCDSy
 nn/lkobb3wOkOSYUG+i2IRktfnw202vjr3KvRxRMHCRHtbr3K3V3El+Y7Gpllp0G3eLMgsGVv4
 tW0=
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; d="scan'208";a="58477626"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Dec 2019 10:08:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Dec 2019 10:08:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Dec 2019 10:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntOxJGuipvdLSLRBatl9iXxOPW+F9wxXeFTi9TsEQasjMJYzn/OLQNFRZ8zrOuKq4BGAogU9KGFhb3lBVs20iHYM2l8jDkQeoRe87L4Mb6M9w3NIVkVOCnWFLkBn/4tQgJ22rhn3Nob6+RGGNVlrJ9ZOWQK2QC1LR6ekd0TP65nKZ6tmwaMuC5Gi60ZpwxoDBxWcK4zyU/P4TwE7oC9LiOBNECuRQ7C6dKN/5bqDrTbnsNqsoHonWIGmZ16O+1s9WtB4GD98eLYfAF5yJ0wna43p0wJDCT9LBuadL0o2oNPWI3a3tllmKXIkCZcVskf7zt0jmlJh1ewQQf+JSfhIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXEl5qPMhV8xeVJBpf2KNuWKzzkibGTYSpba3Da3maw=;
 b=G31qdDsXjZfM6kNmIZf0ylY9M6bluV4BSPP0F2Hb35IS8ADX76kjnyA8wtFROE6bh2DHieOIrI/egblCdsvFe9hcxaAQ2AdoFun5VoCqkPIlytvK2JI5RaZYIm+vqjYjmIbNbnSiNociuWlYMehEk+4f6Xk9AY1N4mViAYMncwuV3vXv/8QPkL26SfsAsPoCfXjFW5ELNM82585U4B0wvfPyXtCUZO6HwpzFCzMN71G2fDlA3xFydxW9QgqH4ypgz7dyCNVh1h5NFumWj64YUbBg2XXnM3ZHkqBlgY2zFvJE/VzcDCAbFrkwE+ePvjhwR+e1yzTak0tZIx8U3KHxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXEl5qPMhV8xeVJBpf2KNuWKzzkibGTYSpba3Da3maw=;
 b=q/1XuyUEBPrN7Mv1qkHM8DuNYLymJ7ioFzwgMboKbe8I0NEP6dFSEGJwwWmR8Z07xcaIh81kvYa6wgaTE6janmti1vsCtTfCVhkTfw80t3LOaXWKax1eoWem5Kc+vjgr+7N2d28CkTDkOUSyQCLC+LmjnvSyyjsd1yrd73QIUZA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3677.namprd11.prod.outlook.com (20.178.253.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 17:08:36 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 17:08:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <js07.lee@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
Thread-Topic: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
Thread-Index: AQHVqNq9Axjcl6bGXU611YNR9WJnyKezpy2A
Date: Tue, 10 Dec 2019 17:08:36 +0000
Message-ID: <1b5b1748-500b-7027-40c6-b51ecf7df3b4@microchip.com>
References: <20191202063507.21311-1-js07.lee@samsung.com>
 <CGME20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8@epcas1p1.samsung.com>
 <20191202063507.21311-2-js07.lee@samsung.com>
In-Reply-To: <20191202063507.21311-2-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0033.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::46) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191210190829566
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a18879d-b3c3-402d-35b6-08d77d9397bf
x-ms-traffictypediagnostic: MN2PR11MB3677:
x-microsoft-antispam-prvs: <MN2PR11MB3677E1452598B08CD267866BF05B0@MN2PR11MB3677.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(376002)(366004)(199004)(189003)(8936002)(6512007)(52116002)(81166006)(31696002)(53546011)(2906002)(81156014)(6506007)(31686004)(86362001)(2616005)(5660300002)(4744005)(66946007)(71200400001)(36756003)(64756008)(316002)(66446008)(186003)(110136005)(6486002)(66476007)(8676002)(478600001)(66556008)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3677;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9t8IE9FMQ1A+FqpwML4jzczjVUJPOhnddKtz7VTm+bbXk96UHWSen3kPYPGBD+ouV7q0yMKGT5U5fJZ2zBR5lKuo1xsrVzh1kTPbMhuvlU9Vsn3S8NGmOdXzgkScSuPxLsi1TbzzT21Axh+fIB8Mb/gRMgxzuIAAAFqVobkvZQ0kcbflkqrPXm0QHzmAMfzAJjEnkoCGMEHddOtQqOFIAoxCNyVF1c7NnPBDoEVQoE+vN/PC5qZZbHxvveC6kDBx8oxgqlIPteI43je3Se1vnl9vDYLkjW9JFX3w8RcqjalxvDumbimz1lNGhqfSmPClcNLLlC60kAHeZo0b9fOLBCT1B0Q1P9Lnsnm/wqeBamt3/LgO0ndb7hT/37P9Sp2waj1wUJmDdP+2vagVW3dxSFU72PYnCtxPJ3Q+qbIUGbf77OSa+r2zv9Gt4sz4N0tc
x-ms-exchange-transport-forked: True
Content-ID: <9FEDA03C99A53A40A5DABFF728EE7A28@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a18879d-b3c3-402d-35b6-08d77d9397bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 17:08:36.4144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XlFcqy/HepbpsA0DyE6p0ONtYaNNjDcKtLejF+07hpgLopvjjGIN6V8MnBuRMpAeRr0Yg8RJU//ouHvQ0tBDdHpoKGKC4N7X5AOE631sK1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_090847_809613_728DA434 
X-CRM114-Status: UNSURE (   7.50  )
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

Hi, Jungseung,

It's great to see this happen :).

On 12/2/19 8:35 AM, Jungseung Lee wrote:
> 
> There are some flashes to use bit 6 of status register for Top/Bottom (TB).

What flashes are using the 6th bit of the SR as TB? Is something that we can
generalize per manufacturer? I'm thinking of using a SNOR_F instead.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
