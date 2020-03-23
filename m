Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D96C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 17:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC1820714
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 17:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rKEoWo0G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="FqRcSIZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BC1820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hITAjG9b9KhOnQL9c0wukA58to8vgAVsBvzOMcjnCeE=; b=rKEoWo0Gur4q60
	PN7Fl9y5Z5dL1sjd8ffEzsZVV0WDMvxqDeTmwmTdP24flaieFN3brs5E4qou7BCnQSmFmIv40uZCS
	+sAGp4+0Omy9msU3mKG28RWrPRFevlCbKkSjxZr0wgBt0t+9vPw8mwH/Dbx0J3ACfUUr8Cqm1K/YX
	4y6zSyA+xnoYOWoxmQDQS7HUc/XR325NMiryzfe1T7Tm0fWLA3DEBXzWMRsmm2CSSICCMDSg8OWA/
	y0Vk2PYG4Jgj7vEu6ZvWRdBJd7RQprGsIjuTusuv9rnpPFJo+7cw62VYh94SYRZUA4iZgdPIynHrZ
	JTlagTBGXsfH7Ls2JStg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGRL3-0004gG-9d; Mon, 23 Mar 2020 17:58:13 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGRL0-0004fw-Fz
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 17:58:11 +0000
IronPort-SDR: +Aku51eMl9OIvt1zrizhkjqk4k20+Dv+GRYM+AxjoSUzS0cajbgNb93fAMc/oYxeI3Q/XGvvaz
 08DPEy31eBKGXZumrNSsG4OEF6B0LgeXxKm4LdMchcfRS6emG33VhIPXpR3UOHz76gzgZuwuPb
 +PGavjq4F/js69PWZrvD9Sju2ywwWemOkWaRLSeEfKfmaI2kywS/F53rdeWRrUlH/PojYPUMk6
 58Vr/mpXcG39Hekz+GoIPjJklnK2ui/vqkA8kb7qxpjpVfxey0HH1pJkvrpRs9EaubN8eU6y3g
 uz4=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="70964947"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 10:58:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 10:58:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 10:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuYJHAEJghqDi4LDGz+tYdHaJDnbf7IuZ7xCuCituI5iPqBVLh3SI7uAdKa+Yd1L7fY511YITeZm6uefw1DCULxHPWvRvyqNVDO5pZmaVMB+8frM8Xx7uND81nW09Gs2+ZIyjYHJOcYCzDDFX2kwqtQ0Y1l9anT+LkmbTk0IlG2vjC9t314fuYcnlAvwMZchOWe24y0gj6o5/HplxIYllz0Fhf80lHKjIh6lMXBd9p3GXdfd0ZnZ3lfbEpDq2Yv/YW9c8bS0h6W/NefmuM0RaWc4BjSXdn6s0r9D+Yz1r1Pu7lxl0M+P9GQRuhiaTxhYypjUibAtWwL/ffik2OYq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE1tQJpYz+6JwqwcN+J7Mp00UDatXSlFLGIcJ7ivPc4=;
 b=h4b6/OEWd0RR8VoS065qdo6eet5bpYGKLo9JFAUMMTrgduFGlfjwT7FgpbFQBItS9oKOMRZh4PzOIykdUk2bfptoOoQAaPJ1cURKB5h7OoeC1fgLWnVmdLKyERU0EU4qCWyblMYzdplcEGtzE/niovL0kK4n1TLenSLI9k3hniiXT2llg1SEvwybMjZxtRxs4d/8JIvyOmjjSi9ymVho0GHCs0CLhPfNReMphmcmCNWOaYLMDQNBuIac7nhCJCZ3Fmewb31c6CXO454v2oSpCcBLysJdVbhFMY7nUxQ/um/bdGgcQvdTP3xZAsmHQyUxLM5iOXJjqwEaESkKbnT5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE1tQJpYz+6JwqwcN+J7Mp00UDatXSlFLGIcJ7ivPc4=;
 b=FqRcSIZH51+Lko5GlH/lkTQxBqPkWCsrHuFAgt5DKP5r4AHciq8NxQknJb2w5IG3Pyt2phc5wRg9upar0p04O5Rh0DkQGvJz9eBJlgpVZBsuW5gMhR4W1h7xNom7oyGtzdPwpbs7Dr7ohd0IVzU2w0W1Prf8+m9scrFikHk9iG4=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3925.namprd11.prod.outlook.com (2603:10b6:a03:182::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 17:58:08 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 17:58:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [RESEND PATCH 1/2] mtd: spi-nor: Clear WEL bit when erase or
 program errors occur
Thread-Topic: [RESEND PATCH 1/2] mtd: spi-nor: Clear WEL bit when erase or
 program errors occur
Thread-Index: AQHWATycB968eUpqDEmgqMTmveA5tg==
Date: Mon, 23 Mar 2020 17:58:08 +0000
Message-ID: <6870304.rLyiOig2ma@192.168.0.120>
References: <3245882.KdgdznRmvK@localhost.localdomain>
 <20200309101501.191530-1-tudor.ambarus@microchip.com>
 <3499f977-e176-52b0-63d1-23e1b4d67b7b@huawei.com>
In-Reply-To: <3499f977-e176-52b0-63d1-23e1b4d67b7b@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d030eba-970c-4832-145c-08d7cf53bedb
x-ms-traffictypediagnostic: BY5PR11MB3925:
x-microsoft-antispam-prvs: <BY5PR11MB3925389204EC07A18D178E16F0F00@BY5PR11MB3925.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(366004)(396003)(39860400002)(199004)(6512007)(53546011)(9686003)(81166006)(8936002)(86362001)(316002)(478600001)(2906002)(54906003)(186003)(26005)(66946007)(66476007)(66556008)(66446008)(76116006)(64756008)(91956017)(6916009)(6506007)(71200400001)(14286002)(6486002)(8676002)(81156014)(4326008)(5660300002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB3925;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6uRGWF8EjTVVrbCW5vAlIWrifhFwVkSv/YcD7H1TXPccpxpTzlkzUWQ9SpofWK67/gg1GW1Tu9Hvt5MhsHtY4r6r0e+g9XmQVQnxMKXoVKLqKCMXijzgbSfSCoLxSbLaCDwTEuBnYrKGhu9q8Ae96hoOZu+zmIIxddflIKhNU8CqWSoGa3kashnN91ja9hedyAk9rntgamhjGeM50ydFFKiFCeVUIJPEG8xjeIDsBtHUyBjH4ixJgdRvg+U1THKAB/NLLczuXKtNyV6eRuyoTiPnyzNNRg0oWSMM/QoG7FleSXTDaSRdyswBTY6B+8MssmYXPZn8sWcIBRpllr8CwcuvgMCuzIQtOumaE+y3XSsb1J/emMBb6IiSCnGk9lgMoKfR34oSP/Ot/cDBXh8T7169Mt4WfDJKDo6mXLzjnyeMQe5+/LBleKnRlfiUlKx2D1yQIrU2XOej+uRp7Gd3jpgya6oKiPSYf1h/6AFk+SKL/4/fddOZiwHMosWJfnm
x-ms-exchange-antispam-messagedata: 02BMescRl4ZxyfSNGtFIEoj3nI5G0wJO5fCqqI6L7O3jMbiBZHLeye26nuPyEiCJs47XX9E0KUE3uT/3+LWeU4wGwXT6lqHv1hLZIrwLwbGjzFUpVRO3uIXXyXt9CQIiNmPsnTf3vKATMZPcTor/cg==
x-ms-exchange-transport-forked: True
Content-ID: <CB5356BB8EA1F84E8892B9F50F457023@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d030eba-970c-4832-145c-08d7cf53bedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 17:58:08.6398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOEL415CCej8pKDSClaKgeDy6UblD6FWVpaxsFzt1y65SsIgixDrCs81bbnqADM6MdcEpkRtCLpn/7th0Alwbqz2m10CHBvtIzaBgV0uuLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_105810_576461_5AFF59B0 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: js07.lee@samsung.com, john.garry@huawei.com, vigneshr@ti.com,
 chenxiang66@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 9, 2020 5:04:53 PM EET John Garry wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> On 09/03/2020 10:15, Tudor.Ambarus@microchip.com wrote:
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > When an Erase or Program error occurs on a spansion/cypress or a
> > micron flash, the WEL bit remains set to one and should be cleared
> > with a WRDI command in order to protect against inadvertent writes
> > that can possible corrupt the contents of the memory.
> > 
> > Winbond, macronix, gd, etc., do not support the E_ERR and P_ERR bits in
> > the
> > Status Register and always clear the WEL bit regardless of the outcome
> > of the erase or page program operation (ex w25q40bw, MX25L25635E).
> > 
> > Issue a WRDI command when erase or page program errors occur.
> > 
> > Reported-by: John Garry <john.garry@huawei.com>
> 
> Previously I would get this unlock complaint:
> 
> root@ubuntu:/home/john# flash_lock -l /dev/mtd0
> root@ubuntu:/home/john# sudo mtd_debug erase /dev/mtd0 0xf80000 4096
> [  167.458647] spi-nor spi-PRP0001:00: Erase operation failed.
> [  167.464248] spi-nor spi-PRP0001:00: Attempted to modify a protected
> sector.
> MEMERASE: Input/output error
> root@ubuntu:/home/john# flash_lock -u /dev/mtd0
> flash_lock: error!: could not unlock device: /dev/mtd0
> 
>              error 5 (Input/output error)
> 
> Now, no such issue. Thanks
> 
> Tested-by: John Garry <john.garry@huawei.com>
> 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> > 
> >   drivers/mtd/spi-nor/spi-nor.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)

Rebased and applied on top of spi-nor/next. Thanks.
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
