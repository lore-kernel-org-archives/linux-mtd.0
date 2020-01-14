Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B76AC33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 10:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9F824672
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 10:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCQI2jdl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="uhZnmQtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9F824672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNPQ6MlsgV/b8/xJ6HqfUG47pqXANcH9s/lOGd00gA8=; b=kCQI2jdl/wCCoq
	K+wvLFboRh0g4JuZNKCNkr8vwZDVkkaaT78jVGgjPgus2xS99TgppReFTxEjrUQig2DkcDO0pZ7MY
	C0Yxm0LFR+xjN+/rQZ9alF2s0gL3JOhSFzXI9V7ir3Xxc5VQ4YtOpBlQyqWByK+4FNNOaQNjppbLg
	DkpHyiobx5qmux4p4DbYcO97CC2dHyByZC8pAHA6qPH74213z26F7ykg53GKtSExEHmMd3QJ71XsV
	5jVOovYoRghOxsAqaUXoDSb0Uh6UckdO2VNYgMoJGOosniP5O2cYntqd8pMmSgFZo2XwY0CHLc/fI
	SNZrSqv5j0DwaWC/QIZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irJlY-0007hH-7U; Tue, 14 Jan 2020 10:49:44 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irJlR-0007gY-UN
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 10:49:42 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: SZt+yGYF0g3Y8hQSz53ExxMZPmfImvpIL8H3U5bzk9yAFrOpyO9Ca+zmH9UfG7Ie99XB9xEMtc
 Jj5Ham3In7QaDs3TPpkXEQ4mi/cID+Vl13y0bfoyWNm8D56nXhPcX1+jy+52VTRrSBx1c3Gtob
 ga6fpvKFbf+YGzlxU4iblEJFCiQGHA7ThkGpipeVJ0gez9WzuWKpIwWYEuMAc5ZocITdGFi1uV
 dLZ4dUFm74cequZxqXdIBUZOqTPJwt0yhF/VEJZQUhGtUKR8xxW0dh+U2e7SRKB34W9exCRBQk
 wlw=
X-IronPort-AV: E=Sophos;i="5.69,432,1571727600"; d="scan'208";a="62554206"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jan 2020 03:49:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Jan 2020 03:49:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 14 Jan 2020 03:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nShN5QwHF/gBGOY9lPclVjyqxqaC/ZPybBhFYvfPNeWiR94+BerwFhmdWgWs9n/hUP1l46hYD/bM6dm72RBTnW6PuXEwkXCPsNw0r9hUtnIoMLcRXdSYJcBJc32E9mX2tiEMTdp+rl6oAddhrRrGsP/iAdZQhvhkML/8wfancIVgywhxd65TS/Xt7aJ6aH+jvupLPB7+Y0BedG8qcvYh25BaZWFdTR1muKpyfdlmyYMhYQvAh1fS/nd2Wna7Ty7n3HwE+8cyxoFB1wUqRJ94Vl9BQiHJnJVEmGFDeCcnsxT9mr7fFjxkeEVKTsaqQ8MunYS6w/xDiquAOQCINnXvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBkyvNA9hk3nVQKTpirfBAse4EgkEu2fDkZWWJSNg3U=;
 b=V2QWKFGrsAbXKhCZdlWELv2Ac3BCkvEa7v4pSRX9OgrWp35Vn4ItSE7DqRvxnkD9kp/edYUZ+RXm/OW+BGKfTGYlkvnyQWJHIiniZJUGxE6vjONhceFUCxjgulmPSM0pRkTOF1YGd0leSusVkIiSylC7smFIJhnTmkoEzoNDotjXSR/9HLAP5ufDEBO/6bc+X5drLfBptpxEisgJY1PVav9NYoTa0pY90v5Uj9k8Xvr5dxHWkO5/H0/1SJVD7r8BkfxIeBuFgJWeU89JFdtEpD3fFY+H6iHGT4B/+fx/HA5xnD5Dn79VHQULC4Hbs1ykqW+A7vUpw5VRS7OPvM/hmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBkyvNA9hk3nVQKTpirfBAse4EgkEu2fDkZWWJSNg3U=;
 b=uhZnmQtTj7PR78L+1j5tiKD42r8xiWQ//xj0zY/meMpRUJ2q53Kx6pZAD9XN5ZC2ZKgJrvh2Up2zrKC/IrF2uNRMEVjgwDUGgekglR3aY2+9aebULgOnUtg1yf+8VbArUihliF96j21EwGCnFWe++wVt6q1yGw1PE8JyuZVcwyQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3918.namprd11.prod.outlook.com (10.255.180.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 10:49:28 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 10:49:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHVyshKi2pGqMNGHESG9Z9T0h6ocA==
Date: Tue, 14 Jan 2020 10:49:27 +0000
Message-ID: <3703036.Ns4Yp6NO8s@localhost.localdomain>
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
 <20200113055907.9029-2-js07.lee@samsung.com>
In-Reply-To: <20200113055907.9029-2-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e2ada90-d119-46d2-2b7c-08d798df6d78
x-ms-traffictypediagnostic: MN2PR11MB3918:
x-microsoft-antispam-prvs: <MN2PR11MB3918438D538DD9CA33D13E4FF0340@MN2PR11MB3918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(366004)(396003)(136003)(199004)(189003)(6506007)(2906002)(71200400001)(53546011)(26005)(316002)(54906003)(186003)(66556008)(8676002)(8936002)(81156014)(81166006)(5660300002)(6512007)(91956017)(76116006)(66476007)(4326008)(64756008)(9686003)(6916009)(86362001)(66446008)(478600001)(66946007)(6486002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3918;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Kaw1/aoRvRSRbCTXVubppbe70RXTPA19+GwjiI3kaH+xU/orDoFH+UiSb7swJ0jbLWFXfBD6I/8t8cGRNTL7d7cHiLM7X0l2U2vNToe8211zgCX+ESJ+2ymuKBIDvUK8GcgiV5mHH6nAzP6s61yHpZc+0cO1XXCLZinRffwAZbFNtPE/MUMTwvvspzQfKttqkl0E+TCXgonLgh1TmZtrxw77eexBmQoXbG/YIkXljmPCRoBLMGvBgshwkqti+lY7sRsXLha1uUHPlve2GcPYJ9h4Kt3mk9jOPXxa8UDbx2FyOM2gFMQGG20UmTWZEbAVPz0ULtlSTjqOtQSqslGVxItNJ8qXbLWKLr1LGYO+QCf+oawf8Y5tdcpEASNb9i38jFkv7PjKxtTBT9YtPkRh+f8Rn0FsvBsQuwi7BtivwilOOdpe1u8xW/KxSDpoIN+irx7uEipjvUMHiyM/BS+b+oM5NZ5afqq/hQYAPdM+zTPe6Pgsa0c4uaG0fD0MI9G
x-ms-exchange-transport-forked: True
Content-ID: <136AE5860030E2419F5111A5273F90BB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2ada90-d119-46d2-2b7c-08d798df6d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 10:49:27.6706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJ+xfEkCvIkixEWlPa2MaNdhgqbsouAAYvcOHaGkOhlbo9ZKlObAcxDnq+Chxrd0EnXw+OreZ9/ptz+FX9F2R3adxYpPT++jOS0ZthHim8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_024938_016991_5E030805 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Jungseung,

Thanks for working on this.

On Monday, January 13, 2020 7:59:06 AM EET Jungseung Lee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Currently, we are supporting block protection only for
> flash chips with 3 block protection bits in the SR register.
> This patch enables block protection support for some flash with
> 4 block protection bits(bp0-3).

Some? Isn't this generic for all the flashes that support BP0-3?

> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
> v3 :
>   Fix wrong ofs calculation on v2 patch
> v2 :
>   Add sample table portion about 4bit block protection on the comment
>   Trivial coding style change
> 
>  drivers/mtd/spi-nor/spi-nor.c | 127 +++++++++++++++++++++++++++++-----
>  include/linux/mtd/spi-nor.h   |   8 +++
>  2 files changed, 119 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e3da6a8654a8..7e8af6c4fdfa 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -238,6 +238,14 @@ struct flash_info {
>                                          * status register. Must be used
> with * SPI_NOR_HAS_TB.
>                                          */
> +#define SPI_NOR_HAS_BP3                BIT(17) /*
> +                                        * Flash SR has 4 bit fields (BP0-3)
> +                                        * for block protection.
> +                                        */
> +#define SPI_NOR_BP3_SR_BIT6    BIT(18) /*
> +                                        * BP3 is bit 6 of status register.
> +                                        * Must be used with

Are we safe to replace SPI_NOR_TB_SR_BIT6 and SPI_NOR_BP3_SR_BIT6 with a 
SPI_NOR_SR_TB_BIT6_BP3_BIT5? Or maybe with a SPI_NOR_SR_BP3_BIT6_TB_BIT5, how 
is more convenient?

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
