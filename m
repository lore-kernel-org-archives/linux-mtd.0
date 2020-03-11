Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF6FC10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:13:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C98208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uas93NSL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="sxXyHTgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C98208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xdPQCBxZBKqCQ1q7C9U65ex2C6pVMun5Vr7lLCDPdw=; b=Uas93NSL/pEh4n
	wPnCwWCUa2kx69kODpqcHrRAUOj2EP8Cl48jJAmDYHsJEOQ4JDqdp74SEdw78IzFKMa80ZrhPn8uh
	1+bY1+fpxGMz0Ajo5iH0clSASUyh3FWyn6xpekbynbmoL+tpFYOUcpLl1gpx/O+wd9d+WZUFKoE9e
	0gVqJZo1tcOmNPmuoxyvJtj2M2Nb0FazLPi/nU8MUPK/hj3VI4IxOEqNllnna/QvOFKVXJOsCmn0t
	m1Lbx4lFNrPDsY/BlWTeoMMUxdTG5fyenx82xg8cPeWa/2Ul5Zfq9JRG6lF4zEhMw0sEDLVRnQ5Yb
	lP8bFy/W/azpOqOtWf1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBvXt-0003VJ-8H; Wed, 11 Mar 2020 07:12:49 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBvXp-0003UQ-2a
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 07:12:47 +0000
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
IronPort-SDR: KBuo4xmGoy9JMIroik6W5PMJ1d5PRWhgVVV8WETKHDUPAIP2A7bwvfatCKncLpD5qcqPSkSR8G
 kUV5B1uTWpvfokSMDLZRpgkxcVHY2TRfWxxl0cBUXfnxTES77Guv7mTEZ8SqP2oBb7tNGdYUhd
 5bR9qXzo+lCw4wPwnBloP51oEz+JF86jSIIkukn0a/sE9ACfNA3//GEtHJ5Or3FFT73+ehZ45+
 1QX5wj6eQEQXsQn43va76Aqw0buers9NEPk6HxRwvS2rnZKA+SS3mN79zFybe2GiG7kRQ/BByz
 ERM=
X-IronPort-AV: E=Sophos;i="5.70,540,1574146800"; d="scan'208";a="68412405"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2020 00:12:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Mar 2020 00:12:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Mar 2020 00:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGYqP0ndaxuED/glV3SMgdNL0Blx1F7F6q7smaEw8Kr+TmIxfbijtb1lvRbB1ie/hkQZIuVHixB8R/azfx2M1fdG1trSOt4GNkhKDmIqfQkG0t4G81pBnOvPL5Nnlw3htqM05+DD3bzBpdHFKIIAHlAnX1pFnTrA9T9aE7ddIEDwipzAkGbplmENY+gGiXsi2fi5Wro3ubD2YRiMJvsIeOsxrZVM5Tw0XPeOTVnUeo07DCWfI/s7pnFJfvyOkMAk45lEqdA04kN4D8WbvDZMnzULF0jXUG04RnwORiB1Scn9tYZU7FXPsNFk4egcR/M/ZanqCM1uwHMyINWHSSU9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTE0Mz61j1LyDrioCQmF9Ipv+Z/7lJdPEA8rTfo+oBo=;
 b=Gas/kaQwBL9iYbSjsdFvwe/mH8U2NtLsPTke6EpuQFA5AWlwpb6vnib1XQYZveyPVfQN1k4k88JQPQGzZuXktjhcvdE/q0Bb0shGiL1aqSo1mBJYtcuUDmqs7r60vCwaGczOVr6RvZ8m5jYSzUczdCe55hyiinf4P+pAlP/dQ7JRHWlhMDGC2/NvOsNYLxz8BBrX/A/0euzVgQeCHZGG8WKEBReF4I7bZnDFraFms589trnBJ01uTLHYjzuv6P1fZQqVubAVl0+RC5TLTNPW9NOiEEMVa+c75fzKSmwN1AxLQWEEJyLIAL/RXASl9W4LEi1rnjElta0b5lofwBCD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTE0Mz61j1LyDrioCQmF9Ipv+Z/7lJdPEA8rTfo+oBo=;
 b=sxXyHTgUATIkPaGfJYC7+sWC7U4Fgg5u2T9Nc7qfgBd2s+o6W/14OPwYeqInxbRlmnEO9Sgzpr06g4ml8gvQOP6dao2CHm8AMt5nFK0gyBn/gogANHtMg2Mm6VPIT2LnE15/ROiaWS8E6yYOBMKh+qtSIUb7TBiO3k4KZP/9blQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 07:12:33 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 07:12:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
Thread-Topic: linux-next: Tree for Mar 10 (mtd/spi-nor/)
Thread-Index: AQHV9umG6iGQEkUFMUqHF2/S9iCu0A==
Date: Wed, 11 Mar 2020 07:12:32 +0000
Message-ID: <1993805.xNpbgTSjYd@localhost.localdomain>
References: <20200310201923.24e34363@canb.auug.org.au>
 <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
 <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
In-Reply-To: <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e737ec01-fe67-4a6c-dbdf-08d7c58b91ad
x-ms-traffictypediagnostic: MN2PR11MB3934:
x-microsoft-antispam-prvs: <MN2PR11MB3934D7FCF44AF8C9CB460177F0FC0@MN2PR11MB3934.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:328;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(186003)(6916009)(4326008)(9686003)(26005)(966005)(8676002)(2906002)(81156014)(81166006)(8936002)(6486002)(5660300002)(478600001)(54906003)(316002)(66556008)(6506007)(64756008)(4744005)(71200400001)(66946007)(66476007)(6512007)(66446008)(91956017)(53546011)(76116006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3934;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ttnrUy1JPPsqHbj0O+IU4GTdaHKuCardEGKxlbgAAdGhhc/2/mjan8Iz1TyZVoxP6FtUKJ9/5BT0lxfVP9kn+ZpPqIGdXZfFRiuOV1xLa8EA8oefGhPnyayoHQqCi5d7s5KHIVIjUxQU1Q/VBenMLj8yX65fDB2OPyImo1SY7M4Bxd+Ay9CwLAlwZb/C5vGzVHRnlP/Pe+Yx7MJ+P+wHwXwlJrGJrBit8cBLxQgk9aEEw2f05+xZb+ZZrT1rp3d6uVAPUcz4T/NbwxCh2gBbbuYVR3iMfEGIcV56gP3+KU1wuGExzGkZr1wKUgZdzVN7HvJMDQftJMfUN6p9+E4O87rWoEgkNhWHiAlKleYMgknGliz/h8BK3bO0Uc8rFQpEMUO0Fu0jwMpVPPkVivCwtSHXIuA4iYtRHJ9zyyQnBh0Ntqlo4F6YZB+24NvDlCDYoD0CPznLzkl/XpCJWn/Fddxnu870GuNBYjZFBTzhR9hKhsYE/T4sk+MRaqhjn9R7OypZWFgnOO6tNT+Of/OBIA==
x-ms-exchange-antispam-messagedata: tF4KNY6aroBLPcgGcKdsaPAxsicU+MV6Ex8nAP79OPsrA63yE6yXG+beZUWSwn+uKQ2Q+oeFg0zPyJZF+5S0qmclrY0EAt4V9FASV7y/4caVL7F7AXn1IBYOIsjFfxBuvDq8h2ObhsBgKlw4zak0Sg==
x-ms-exchange-transport-forked: True
Content-ID: <FA5CD9EBE21FC94A85FD6469B2E6E25E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e737ec01-fe67-4a6c-dbdf-08d7c58b91ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 07:12:32.5704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSuStEGTCVe5krFnpoweobZsQC8l/qJveeJeeoaI44Hb2+vGT0FDMFmnm0UxYGQ5Be/Ym+GlsJmRAujyUCszlXDAXOXTpW6csbcCFWiyVVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_001245_151279_E848F941 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: sfr@canb.auug.org.au, rdunlap@infradead.org, broonie@kernel.org,
 john.garry@huawei.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, joe@perches.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, March 10, 2020 7:14:13 PM EET John Garry wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> +
> 
> On 10/03/2020 14:37, Randy Dunlap wrote:
> > On 3/10/20 2:19 AM, Stephen Rothwell wrote:
> >> Hi all,
> >> 
> >> Changes since 20200306:
> >> 
> >> Removed tree: nfc-next (abanboned)
> >> 
> >                                doned
> > 
> > on i386:
> > 
> > WARNING: unmet direct dependencies detected for MTD_SPI_NOR
> 
> Uh, so kbuild honors a "select" of a config option which has unmet
> dependencies:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Docu
> mentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143
> 
> So this looks introduced by:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/d
> rivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e8

Hi, John,

Is there any need to select the MTD_SPI_NOR in SPI_HISI_SFC_V3XX? Can't we 
just drop the select?

Cheers,
ta




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
