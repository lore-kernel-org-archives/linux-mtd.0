Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1384FC43603
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 08:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D617F20716
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 08:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lxTW12ot";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pNXHXkUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D617F20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lz6QxtqPV8/ujshNnACy+1OWc4HKcVdXfwqGoqCUeOk=; b=lxTW12otz7sGq9
	YUN7GJoYnGVz0s+es1suiNQN/vUgNTSYxFt3WzvQOxTBuaoFKl9upD2l3JNK6S98R4dgesmhroZbm
	uRPGvsgPwpjjHmSvb8DZvKeHL7lAlP475bvQgdz/AojKbe76BnbZkHgz3EzRvYg2j0M5UHhxkVokQ
	jyd3QmuPjVBxPiWb1NdUxqdr5uTSmRWKmmJfHNh8GgAk4hbH9aHB/B+xxO7lJIy79eXvt8bUDz/HY
	VVZKaK31PbGPh927VfDvGh2C1EK4+s7gm3M1R/2G1Q7zy7t+0x7aZ6K4Y2ypXaUdHssv9CaY+zjdj
	LEx7Me0jFpiRgm4WV0Ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiE02-0007r9-AL; Fri, 20 Dec 2019 08:51:06 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDzy-0007qI-IJ
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 08:51:05 +0000
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
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: utGEqFOWwbF6MEW4C8BH+vj+hexgwY/Mg9At53WS+SyQa1n4HC0IUIGwpLTrjh2z/KbDczHBT4
 VrVO+k9aHB7CWRNm9TIM45pQtnkMyF2X4gEwugje+9IDCPmxZIzF8QzSUwCshLDXUA1K7OVpF5
 Ps0aFtKVGPUq7RDNBsHFPvxsCbtOZEElrQp32t40JANK3uJ6eg6BXZ1bMrga+E2R1aVvfkhW0r
 Z63/03MHLzUiKT3RHFKmrJJ2/wfpeOzeuJiQCQu2S9CXv+OHDMg0JyqaFCopqaMDF6HjyE/102
 c6Q=
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="61045760"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2019 01:50:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Dec 2019 01:50:44 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Dec 2019 01:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZURtAF9CDiv3yglhvVd6wWEC2Yv+oY24js0f/UJ5jFQRNpFZOOra6wAoiuTqhY5vClxP/cF19nLH00a+Lrg2CUeiaGq8sT7emEmXZh6PD8nPmjHPuudWo6BV/HkKhIx3xLbed+3l6dwqghRIUKIGxMjwzBYx3snMn6IBaqZYpreI+YjMwNjFbJGceBNh61fCM2EG8csG+dB6rVEuoJ7G7O8TswzPsy3SoXo4hebRHLS9TPvpkuAXTVe7XW/wlsu++ew3KlgwqABur346QeZzPavqhvpRcZuqoJvfOY3fQIvexLVd3UYtTBJB5I8Q+wwN1nxeuhT2r+BSGMKB76Y43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x/OMmfdmofVcxP9WaJmeoAJoyvjxVnbRUh1nVEovIM=;
 b=RuqpYI3YnwvgQGMO6lQPMbVbwq2RuT1bwynwDix0tU2ciYWG04Wc3alaEVcQqNxA6gMGKsSM/8pxggcPoChPZtWiNV4TVixCjEvoyR+V8tiyyntG5rmvO8DvBVMcnzeredPmgd0gGEF7z7jzuDXKIrcicHAvKc/JLhX23OHnYIvAHFRQD+QJl35CzQsdNU2bxFMzXWPn+hxyBmqiMirzymOuqsNOoDcIWRQ7vdra1jyluiGOsjRHggnucmIfAUgduAI/X3vOn/qA9mAZyiVPiN+AlYHEV44s3NCKyVTA0uyBYMQvh80HLCTUJgJKdvqFQYXXU05/lkgv+VBTQeM9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x/OMmfdmofVcxP9WaJmeoAJoyvjxVnbRUh1nVEovIM=;
 b=pNXHXkUCYKeuxLQ0qVZOa17rTjVMFctDuF4XdBlWgMdNB6ApkBwp+/s/kXpgEdyCInYjkLrjQzOfkCxFlsN8Ysv30nilZ6s3sE0yUpSbRVxojqtFa1RfWnWCkWEDkFMMGL2eH+v1jNUykfsOHPLHB1vwPoxHXeP6pDyYmJ6FDiM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3711.namprd11.prod.outlook.com (20.178.254.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Fri, 20 Dec 2019 08:50:43 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2538.022; Fri, 20 Dec 2019
 08:50:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marex@denx.de>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
Thread-Topic: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
Thread-Index: AQHVtxKKbar73gO9z0SAPPf+TfRULA==
Date: Fri, 20 Dec 2019 08:50:43 +0000
Message-ID: <f7bc2aa4-bc9d-e05f-6859-0031e9f9391a@microchip.com>
References: <20191207004855.11334-1-marex@denx.de>
In-Reply-To: <20191207004855.11334-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01632af2-82c6-4198-0dc0-08d78529b2e4
x-ms-traffictypediagnostic: MN2PR11MB3711:
x-microsoft-antispam-prvs: <MN2PR11MB371199154F7A350797C77579F02D0@MN2PR11MB3711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(189003)(199004)(316002)(110136005)(76116006)(54906003)(6486002)(66556008)(64756008)(66446008)(2906002)(66946007)(4326008)(186003)(36756003)(6506007)(53546011)(91956017)(31696002)(86362001)(8676002)(8936002)(81156014)(81166006)(478600001)(2616005)(5660300002)(26005)(6512007)(71200400001)(66476007)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3711;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 61OinogUZuz85BzWvvakcGAArAnO4ZrpLb0R6Yx65zEbEg6bqxpFQvqj/SQzH20wsrzfWlgY3L4d7C2o1BWf4E+61xPGfBoPeBDPR1EiXI9vfVG/HHMGKvt6wFA9KIZWEe1AM5vRdjA7PDGovvCOdoowMDHfmPY7cxRAO1S2xTZT/+Nlbz4HjBwlacmTURoj8q+XwuVK/O5EBrMmEz2bm4M6FvifNn1OylmU/fMTlXbnSZVphmE8J/aEbFAoThdRB3cYEW6e6uJiTFlWV842W1UPtt4Orp/nOyPPPJ1Us4OM7sfOJiLiwCD13dy9cpkhHFb6UXyMGzyrZrMvXKcaDD/hpRporE2VSs8fuN0XSqaLvd57L+LCOfes2gwle0gV2xlYAiOKxzTPRbEUqQqBj2Xo6wHM1UM0Wsj3IOW4RmNkBXFahw6wvecp09hh50sc
x-ms-exchange-transport-forked: True
Content-ID: <82F1D7A679828942A624AB99A54A0B8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 01632af2-82c6-4198-0dc0-08d78529b2e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 08:50:43.6658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSj35bPKSyU4GV9685u7895cyL9u7It7W8xiA98UnoFgVA/K/JC1GWTx+MazxJMlSZgQkhGs4GX1RsgxtLyAz3w82+b3fbL5Ajhjj0BJsKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_005102_663941_C9BAF01C 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 ley.foon.tan@intel.com, yamada.masahiro@socionext.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Marek, Masahiro,

On 12/7/19 2:48 AM, Marek Vasut wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The SPARE_AREA_SKIP_BYTES register is reset when the controller reset
> signal is toggled. Yet, this register must be configured to match the
> content of the NAND OOB area. The current default value is always set
> to 8 and is programmed into the hardware in case the hardware was not
> programmed before (e.g. in a bootloader) with a different value. This
> however does not work when the block is reset properly by Linux.
> 
> On Altera SoCFPGA CycloneV, ArriaV and Arria10, which are the SoCFPGA
> platforms which support booting from NAND, the SPARE_AREA_SKIP_BYTES
> value must be set to 2. On Socionext Uniphier, the value is 8. This
> patch adds support for preconfiguring the default value and handles
> the special SoCFPGA case by setting the default to 2 on all SoCFPGA
> platforms, while retaining the original behavior and default value of
> 8 on all the other platforms.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Ley Foon Tan <ley.foon.tan@intel.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> To: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/nand/raw/denali.c    | 13 ++++++++++---
>  drivers/mtd/nand/raw/denali_dt.c |  6 ++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 3102ddbd8abdb..b6c463d021677 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
> 
>         /*
>          * Set how many bytes should be skipped before writing data in OOB.
> +        * If a non-zero value has already been configured, update it in HW.
>          * If a non-zero value has already been set (by firmware or something),
>          * just use it. Otherwise, set the driver's default.
>          */
> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> -       if (!denali->oob_skip_bytes) {
> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> +       if (denali->oob_skip_bytes) {
>                 iowrite32(denali->oob_skip_bytes,
>                           denali->reg + SPARE_AREA_SKIP_BYTES);
> +       } else {
> +               denali->oob_skip_bytes =
> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> +               if (!denali->oob_skip_bytes) {
> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> +                       iowrite32(denali->oob_skip_bytes,
> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
> +               }
>         }
> 
>         iowrite32(0, denali->reg + TRANSFER_SPARE_REG);
> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
> index 5e14836f6bd5a..34c7c553f3412 100644
> --- a/drivers/mtd/nand/raw/denali_dt.c
> +++ b/drivers/mtd/nand/raw/denali_dt.c
> @@ -27,6 +27,7 @@ struct denali_dt {
>  struct denali_dt_data {
>         unsigned int revision;
>         unsigned int caps;
> +       unsigned int oob_skip_bytes;
>         const struct nand_ecc_caps *ecc_caps;
>  };
> 
> @@ -34,6 +35,7 @@ NAND_ECC_CAPS_SINGLE(denali_socfpga_ecc_caps, denali_calc_ecc_bytes,
>                      512, 8, 15);
>  static const struct denali_dt_data denali_socfpga_data = {
>         .caps = DENALI_CAP_HW_ECC_FIXUP,
> +       .oob_skip_bytes = 2,
>         .ecc_caps = &denali_socfpga_ecc_caps,
>  };
> 
> @@ -42,6 +44,7 @@ NAND_ECC_CAPS_SINGLE(denali_uniphier_v5a_ecc_caps, denali_calc_ecc_bytes,
>  static const struct denali_dt_data denali_uniphier_v5a_data = {
>         .caps = DENALI_CAP_HW_ECC_FIXUP |
>                 DENALI_CAP_DMA_64BIT,
> +       .oob_skip_bytes = 8,
>         .ecc_caps = &denali_uniphier_v5a_ecc_caps,
>  };
> 
> @@ -51,6 +54,7 @@ static const struct denali_dt_data denali_uniphier_v5b_data = {
>         .revision = 0x0501,
>         .caps = DENALI_CAP_HW_ECC_FIXUP |
>                 DENALI_CAP_DMA_64BIT,
> +       .oob_skip_bytes = 8,
>         .ecc_caps = &denali_uniphier_v5b_ecc_caps,
>  };
> 
> @@ -209,6 +213,8 @@ static int denali_dt_probe(struct platform_device *pdev)
>         denali->clk_rate = clk_get_rate(dt->clk);
>         denali->clk_x_rate = clk_get_rate(dt->clk_x);
> 
> +       denali->oob_skip_bytes = data->oob_skip_bytes;
> +

This indeed should be moved immediately after getting of_device_get_match_data.
I share Marek's opinion that what Masahiro have identified worths a separate
patch. Ideally we should fix one thing per patch. With this moved immediately
after of_device_get_match_data() one can add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
