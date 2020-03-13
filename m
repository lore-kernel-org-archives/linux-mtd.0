Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187E1C10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 15:22:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD61020724
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 15:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gtLY2d0D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ss8fs3ab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD61020724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfK3WiQ+MPPoIbI+DffpFxv6A8qk8E89trMIwCKH9pI=; b=gtLY2d0DZP7U9g
	aSRnfqFrVh3LF7HF5rnbNr4I1YwtYy3zrig/w/+hFig/C80VSjUg86gFU1JpjFeS1W4UjdnX46GAD
	yjM17+ZGL4rbbLt7NRZEoqX/ALanv79izUrXOU8ooFFvRbgkvTG+eZw+nP0wy3x5yNLOEUeJNu11d
	BG1GJ7NI/ilQrbqcNiT8GORF5siiIKQwmD+rrVPg3sGR4l7soxnpyIiaNPbdI8qaxaCStPg2BAjUn
	r4eFg12RT+v3wneG6Sy21VwY/pL40gH3nsQa7K9D4Jvze64bynEa+dRmMBYziLhzZMglbvlBPvCuH
	tbCPhxJecC6LDRP+7r8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCm8S-0005ad-Nm; Fri, 13 Mar 2020 15:22:04 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCm8P-0005a9-51
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2020 15:22:02 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: kzajzksKEmwvaN899wCzTGNm3TJseGNDvBeMc1Emb4O8Y3w4nYM8gFCYgl+AkDxRVvtkW1TVPt
 YQXgx1UAP/UFNSbttmUx1IxrlCoUiT6uGSqkZt4mbb3A2RMgwBfk/AcHSlsZcIud8ZjGfF7Ir/
 kA8QwdJR3WwlE2Xnre0eMzFEvVGP9BrzdYrU5tIvVqw3oG68v/RZZwYm5CU63uvXhavkZzKwUF
 DZFg76Pf+TwOXl2OYjfAYEcf5Sl6KbeQq3VJjoIkRPxfbJpfFyNfZYmy9c4V0rAi0hLU8BGg6x
 nh0=
X-IronPort-AV: E=Sophos;i="5.70,549,1574146800"; 
   d="scan'208";a="5573086"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Mar 2020 08:21:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Mar 2020 08:21:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Mar 2020 08:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCHdrRl3o2bHC+Of6GnGO5mqGrviyfRU5EL656Sp2kxisClN46wnrhLYmOock2/N4TuKU2Q8FoPFeK+nVLuI+GxmpCitpPUZVWccnY0mwt0oaTna36yO3Agdc9mbMZNvvgfoyOCGlUK9dZgbYacqj7aUMDS1poxmU8O/5WLvaTrhGaQF2K3lfHdoEwhk4rI5kqGFbqAMwb0zW626KwtZyDKWzU7cHU6XrQHALYN7NLH0pbLOEl1h+m3LEq+9vqk9LQCa9LyOBJHnIyM8FBE6mvkuOpCn2H0FoipZWKznRG1UyfZf67R52C50DTvwQ1Rrs1kZGJ+Pq35akROQD8bP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUGnCL+LyAKWnONO9n/CzVL3eABja22oxJKqmfOmwT8=;
 b=SCeP+ZroPAws28Kqnseu3RfjrXTy4tMoqCtL6Kp+d2/Z/xyIDS7zrKdf5jnJs+pCs1kIAXRCstCgt3IpK0pj9lQPZnM4Xeb6O4PTugwmF210GfRGGw94P18OQJ8/C0koSNeQHPHvQSS1PvvF/4YPwhL3LX4kWfl4lQT1HOIuuc/0/guEJQUbaaV4fjMHkhjANidzEEnpB0Cwe0df9PkTGaIt+vhR51Zb4NB8L9g3yDP5BoXf0VSQBEGz5lt2fPlfAewYk/qoG6mEGFyBl49aEps0fl6lqe2EzE3yaNXv7TautX7E9sd8HGarySzdZIwbMSe4oh2bY6wECrXeiTHSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUGnCL+LyAKWnONO9n/CzVL3eABja22oxJKqmfOmwT8=;
 b=ss8fs3abEoy4B5Hihj6C6bfd7mVq2LALrt4Z9flHjuimNTLEKzmZr+5vx/i036kZPIGynq6SFDOWOg/g3rPboZViIW+g9FIifcpSRkmh6FSbkIkZQQ+ummBzT8pRAWMiyKApzG38gVjyJpoS77oiSNRqfla8sbxYrUSKkjXZMa8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Fri, 13 Mar
 2020 15:21:58 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 15:21:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: reimplement block protection handling
Thread-Topic: [PATCH 1/3] mtd: spi-nor: reimplement block protection handling
Thread-Index: AQHV+UsiqAlBEP6Wn0OP4+25NqMp3g==
Date: Fri, 13 Mar 2020 15:21:58 +0000
Message-ID: <2264052.42fd6meZLV@192.168.1.3>
References: <CGME20200304110830epcas1p168bd480847959dc497ac5cc272fa2f80@epcas1p1.samsung.com>
 <20200304110800.20658-1-js07.lee@samsung.com>
In-Reply-To: <20200304110800.20658-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a6ad7ad-3161-49c9-7efa-08d7c762457e
x-ms-traffictypediagnostic: MN2PR11MB4696:
x-microsoft-antispam-prvs: <MN2PR11MB46966AB57C964E0D6D57CBC3F0FA0@MN2PR11MB4696.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:SPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(81156014)(5660300002)(8936002)(81166006)(91956017)(66556008)(66946007)(66446008)(14286002)(86362001)(66476007)(478600001)(76116006)(64756008)(966005)(8676002)(316002)(6506007)(2906002)(54906003)(71200400001)(6486002)(4326008)(9686003)(26005)(186003)(6512007)(6916009)(53546011)(533714002)(39026012);
 DIR:OUT; SFP:1501; SCL:5; SRVR:MN2PR11MB4696;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRGbaQKCFTEwV+twnCFeHcvfZi5vWNYztw1xyrNR75lftpvdiuYvI6ReasXA8mQlxyCwjcnsn77zG32TOaVpDDMx2NKPGJPRWcPSwVxd4c1bebU21AOGZHRSi/i4De0JZKqZDuCVVQNRJKk2q3ZlHs8Oh+NzmYI7DkMtuwG3tzaNl+C3FYoqATKrTgjo0NbGADfVFSkVEp3ywHjXcD4aVTorLxVB+hrOp3ALKlqG1ABcEsIVZg02V2firOvD+o9XaXSvgM5q2sZNdD/aCs6lh1TuS2YBlqTutmxz25LYF/G7EeheLHoXbCy7vNFXkXdEtBmjSfs6TEMnUQPVDmG1HKqle99hH7KM3dv8wIF0HW/t5tlfthBAl83EJCENA7TgwRTvF9sCfScSQ6e5e0WlwoCDFCkJIcLhCtRezAWtHWROzn8Z9Z2D2E9DLInQ2YzXqC4xzkxqajeujcqRnWJgVjPlfHFMule4CiH9I1BztpCexTQLQfUVi5sic7WbLnkEd+2X59+6oyECU0DuoiI6Pd13C2weCUSJeLpS+FEt9BKgHm8Z3TmAw7oIKQWEiXyp2whvertnSN0nAxu7mJRmm2sDsD0+mfeCV/6MwEgvCrEP6z3ZS2Ul6qfXpyTluTdCfbgZtHT2qb0NyzkzkUA6dm+GmF959VFmT63JpOxRwSyhTcvPez2ib6T4QGZjmpTDOL9lshU61AgEgEmMRwNsPanm2Ecx8u11ZKlR0Ccu9PgxaMSXX0t6pBbda/2Jy8ZtgGiJG3X3JRKRuNJNdAA8W08zHAbbYcnkVXEGDDZkeFaYMMAtVTF0LhGCH8dmtIFK8RPfLSdT8K9HuWqnFYoGxtiHBNSjoZPUqN/Ev5JLbABs3UnzXeVNNji9C241Utw5
x-ms-exchange-antispam-messagedata: HktV2uDXuxPiMvSFC6nJ4a/9q8cpxzR728zFDdIwtMSV11wDxL+URnNY1OfaKkUPOIox1m2djZ+6Z1XbV+8JSAeiH6PIrlu/RpHb6l5i3JTXu2rx93n+IdTxFMAPRG1KhkUWXZJBQ3X+l6D71Rryyw==
x-ms-exchange-transport-forked: True
Content-ID: <D2CB3C5B86891A41BCA0100A8DC6FD88@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6ad7ad-3161-49c9-7efa-08d7c762457e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 15:21:58.2075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wvJhqswkeKzNe/aoITvCzS2Z2HxbuzPGgWd1/7sIckhvNc2tNKtJqZ5WvZH0o1v192XC2/In+65GS4p0vMQHumPXUILn8hqkkkA+JALiHN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_082201_227862_EA023C08 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: michael@walle.cc, chenxiang66@hisilicon.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Jungseung,

I'm going to respin your patches on top on the what will be the manufacturer 
move v2 series, https://patchwork.ozlabs.org/cover/1247794/, I want both 
included for next.

On Wednesday, March 4, 2020 1:07:58 PM EET Jungseung Lee wrote:
> The current mainline locking was restricted and could only be applied
> to flashes that has 3 block protection bit and fixed locking ratio.
> 
> A new method of normalization was reached at the end of the discussion [1].
> 
>     (1) - if bp slot is insufficient.
>     (2) - if bp slot is sufficient.
> 
>     if (bp_slots_needed > bp_slots)    // (1)
>         min_prot_length = sector_size << (bp_slots_needed - bp_slots);
>     else                               // (2)
>         min_prot_length = sector_size;
> 
> This patch changes block protection handling logic based on min_prot_length.
> It is suitable for the overall flashes with exception of some corner case

What corner case, do you refer to EON? Are you aware of other corner cases? We 
should be more precise, for easier review and understanding.

Cheers,
ta

> and easy to extend and apply for the case of 2bit or 4bit block protection.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2020-February/093934.html




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
