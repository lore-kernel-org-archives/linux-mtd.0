Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CA5C3B1BF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 00:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA81208C3
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 00:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QvJJsb0q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Fut0ewkJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA81208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RwIvCuO2HwdCxZTI+fvEPUx6ylKycargbe/821G24g=; b=QvJJsb0qRddbxr
	OXpPeUDyHDjfcgsCSLIbbNu8yRiqJx5IzToMGigABH0kpRz4EUMgRNoNZJIYG0HBem/twChJZREpf
	2kNGXWWsUwHdVZC6iROyki/E2boRMFwVqPdosbrL632ldITD1KX9wYgh4BvOOfOzsm+Z4WHKHooOn
	4LyjiZA3hWOMsvvZbym6ZxE0HUZBAsukshC/NG0ksYdXbRXHzFO9qzPuzf5re2i91AGaLgDSGO/Ns
	PSvxYbMBAC4gpZtnEM6SKr4m8evU2C1XzbmYJMVVpX7i5PkUIIex4TxKmqqlnrPkue0Ctp/85rNg4
	4iMWqLQr1L6HafsBXInQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3TtO-00082C-7x; Mon, 17 Feb 2020 00:04:06 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3TtJ-00081g-TS
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 00:04:04 +0000
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
IronPort-SDR: tqbH7x+0r87gLJmdY9BvtFLNdck721Oi0cduoLWML5QG+Cn+QE/OIgzJ+vo+Btzo1P6lLYEFvQ
 QzDA/tECRYUzBc6CItTs5cLzzW2T2K/G86b1TMSdB1iPSYJP3+xrjYdAreOLlc/TZWWHp2WcQl
 GLvUsEkbopXnrw+e/vZtkcCatj3ypCK0lp2brE3uxAsGt7EaZZocBwzG4+DHHIQc9j/bzL5K9p
 OMDxZF7dDdHZidz3On0P+3UkuRfyRhIJG88ce5XUozwr+Q9xOI5fL8D35rIJNV/lCkMf0phEwh
 7e0=
X-IronPort-AV: E=Sophos;i="5.70,450,1574146800"; d="scan'208";a="65631420"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2020 17:03:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 16 Feb 2020 17:03:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 16 Feb 2020 17:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ7O3wUzmhPR5gEr3qcQ2wX3fUGJFMYi9KOQfj7g/xWU3EOuSqZT+Lk5WL27g/16pL7gjgZ/1xJPN54IC1Rlz8paEcSxOhwGl6JhXO6H2oNLtp/rR/Md+4oDG1dPwYdX/droBE8WeB/HH+oFtb64zGWXSgHkQW9HMjf7cf9LUT20W8jHgrOJ1DQwdGJ7j3ClyRMG9J7UTHGTjPjW40uDV04/tzXTQk/HL2OkRbyNnaWoNwG69m5ulPn1SyiVsxgOgL80sXi2yhsdGVfqZ+uWfi8mUKDUC6ZmyVYKVmxjWOkAll8jPDsqf6IJcGhRkArDCbG/UPiGRWJIge81r/ty8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VLYO+3Dzy4elZAu3FwY5b3BQN4sC3FAuCko2r8WydU=;
 b=b8RxueLl1gilCSDrOOhTsqiW+i7/MvuR018XoJ05PFxcg9rkbHKLOwAL0PLr1tBI7EVX+YL6wA7hLOBEEdOLzb+FimM/F1CpTyjB3/uycMEf9vMeHHnhw5H0FaEBWQPq0H7ToK3L0dVtTbScVA2N0p/IbJ7ZZZwMpB2G2V4nfXMUJui1L3sGE4qKlp3V0czmmUzY9VsCoxlbj8MvxqOHbXglCQP3cFwF+EzRxzQp91R0xwFca8xy09PFEJ6dPrHTTv4aaYveqDv1GXLk8588e3Ym2WcwvZXo4nQl9LthcLFS+QdvmG7SkceSbEIiDnSZbx2XL4+P5RJ5U63W6WXUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VLYO+3Dzy4elZAu3FwY5b3BQN4sC3FAuCko2r8WydU=;
 b=Fut0ewkJsv3UpsCggwE53DUvoE7ilC7a34Ss7jePotUytr360/tbK1cKYwomSb3NNMsoExewyHAFA54UtMCOjo6jHjoJ1tGYJ+BkaN/szuSjAz5hNIGOzvMnFbLhonZ6cm1PjZhwcwzIcgoNwjWD+zj9SwEy/YgVJt1jEDKAsbQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3614.namprd11.prod.outlook.com (20.178.250.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Mon, 17 Feb 2020 00:03:44 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 00:03:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] mtd: spi-nor: use le32_to_cpu_array()
Thread-Topic: [PATCH] mtd: spi-nor: use le32_to_cpu_array()
Thread-Index: AQHV5SW4/jIecGhpEEiyx74QYuXeog==
Date: Mon, 17 Feb 2020 00:03:44 +0000
Message-ID: <2959698.SoE86VBEvP@192.168.1.3>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <70ea17c5-c4cf-819c-9b47-5755d821b4b3@cogentembedded.com>
In-Reply-To: <70ea17c5-c4cf-819c-9b47-5755d821b4b3@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9df26454-c6e1-427c-2a83-08d7b33cdabb
x-ms-traffictypediagnostic: MN2PR11MB3614:
x-microsoft-antispam-prvs: <MN2PR11MB3614E9191865B28DE985B83DF0160@MN2PR11MB3614.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39850400004)(366004)(396003)(136003)(189003)(199004)(478600001)(14286002)(86362001)(71200400001)(186003)(5660300002)(76116006)(6512007)(53546011)(4744005)(9686003)(64756008)(316002)(66556008)(6506007)(4326008)(66446008)(91956017)(54906003)(66476007)(2906002)(66946007)(6916009)(8676002)(6486002)(81166006)(26005)(8936002)(81156014)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3614;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VwgdM0CpFCIyZSU5wi9qeclnsEkCp1oEsC6a6pZFeOgn0HBV8QYAX+qyUwxl18KFJOjSIvsX2F3jFIuQ7Nn+F33avIeNzonmAvNn2z7lejGp/zzPPPDLPuMse7uFbvZR1SKN7pg659HCsFUvpUD6H+/NIOjdXpJ5EJQLJKSTYsEpMRCw4XAeDgwxBWw4kJ0bG/mv4O6Rl/dAAzpMvKIjqjh5ZS3GGbrPLlVC2owApviYfYLBc/WRrgYbpppUUM+dkLIiiajloB2uSPuBgnVQjjWpDmnMGWHTHsKyl4LnSUovp9R0+5YdXl4F+oQ/xDT5rm0fEsM3ao4IIj61DnFX+3tsjMSADtor3fRSVm1yNbIrpu19cDrhzFkQdb1EuUfzJ4YkrvIv+OM7pHrXucCk1RI3AV2fJFeng9eQbzPjlJNYhllO90Wd3/JG8GOZv0Zb52YpwiId0uB3lkr1rsoMuOAMVw7FNmWDSFeR2zDRtenQiuqgYhzD2+cfU481+MOg
x-ms-exchange-antispam-messagedata: HPGzAkqitoLayCpCA9bft9YDtek1InETbeQ1zBJhE6Z4veDaFCksSb+JX80c7bkLq9u+xQH27xK/EkLi6ThuwWuNZ+4AXMDdOHe0Op+nRoYbvvpqSiA4x4OyVDPjlEzRJcRtF+XF93h9zdQTTKBTUw==
x-ms-exchange-transport-forked: True
Content-ID: <645B71BF294D804B998C08500DFEA15F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df26454-c6e1-427c-2a83-08d7b33cdabb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 00:03:44.3694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUNNf1z9j5VjO7Wtk3OIzApF6RuwjwBvWmgsGXvBOrwsBWPpE/Ea7wqSKx+zVG/s0ZULPIKQvmhkH6QzM8YT2GvFCxMxpaeTia5vMBPkgI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_160402_010806_2E42CFD5 
X-CRM114-Status: UNSURE (   8.18  )
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

On Saturday, February 1, 2020 10:55:08 PM EET Sergei Shtylyov wrote:
> The driver calls le32_to_cpu() to convert the little-endian tables
> to  a CPU endianness, where le32_to_cpus() should have been called.
> Was going to use that one... and then discovered a whole array
> converter, le32_to_cpu_array()! 
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'spi-nor/next' branch of the MTD 'linux.git' repo
> plus couple of SPI NOR patches posted earlier...
> 
>  drivers/mtd/spi-nor/spi-nor.c |   11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Applied to spi-nor/next. Thanks.

ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
