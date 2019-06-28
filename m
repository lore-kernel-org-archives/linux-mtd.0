Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A83C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D10206E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oF3KvaIB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="k8i7AO9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D10206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69kV3v22SbXFqE4dxKZzPzqLpglMQ80gcXEWn3ztz+I=; b=oF3KvaIBSeRcPN
	hcJPQ2/uPXmVcrZIF0+FMYMMwlDjb/fvAb4r4sWe+kB4vI+h8cVki3VzVJ7ouL3mbtbj/+csE5YDR
	wYuXBxO/L/tKgrMWwQSr/mYelHVfP/xRWj/AKEnMuYehloTrqufRZkjJyq5Y7AQ5Spc33PwdTBLa3
	uyZfUDJjNCBGmFAC1njiniaKE1wOL1v7MxbshdGFX0aup2fNI5WfNkPSOPtVJUH6Vle5Shlxd2Uoy
	aZNSBfqpMXrIEtdPlxVj29fNMsT0VFJfDcgVOEDX14yP6/68P7OKRp2V4M24FWuzc1K5GUfe/GWd3
	5Ni11ONXsk3ZeH+aWN8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgmAK-00050J-4j; Fri, 28 Jun 2019 08:23:28 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgmAG-0004zW-LT
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 08:23:26 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="36241967"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2019 01:23:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 01:23:17 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 28 Jun 2019 01:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=r3JFNbwLjG8BwBKha+IVuCxhZ2ghTB99SBaH993dl/nK6Xvi8oa+MzkSB+2J6GJK4wxXfzgzIZanUUXtQqCd0DOLkQy0/yNyvIeHJDhzSa6q4nnIXf5sJ4MfAs7tkY96Y44xqN10qeD+cGq9KCllxr8ki/1wG2hc0yWonMHnxP0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rv6BKJrQ/6eOJX8IyxQAdXhf27M7XATw+FdycBHLYbs=;
 b=q6m5NmbOQFdt9AZZMXScXrBdyxfjt8UurOOp6/iRVOzBN1Vv99hub/YL42P2aXjVnCWF+Jv6DJKoC2pkTzmQVUAqWr3W6X/NBthnrdoP0SFeKjJa4HVx8RnoR85g9YCUxO/PJ08Cl9Hf9QksdJRDtWI+WP3jAT9fWspqhlHrGxA=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rv6BKJrQ/6eOJX8IyxQAdXhf27M7XATw+FdycBHLYbs=;
 b=k8i7AO9bnhFcV59IAVN7PC24uj5SF9o85CAijesaFrdqc5OV1PI2hAjbLD6kCGQ4+g8Eqsej76EZNuiQ02iAWOx3BctuUijVGkX/5s77SnsqyyUmDtRYU56pUBE0KOB+VyC0XXzu00eBVaOR0RecLxXmmr77UnGBrmXjs2sdr9E=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.91.11) by
 DM5PR11MB1402.namprd11.prod.outlook.com (10.168.101.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 08:23:16 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e%6]) with mapi id 15.20.2008.017; Fri, 28 Jun 2019
 08:23:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinguyen@kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCHv6 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Topic: [PATCHv6 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Index: AQHVIdur3cT5P1lXJ0SybjCFjOpNoKaw0bWA
Date: Fri, 28 Jun 2019 08:23:16 +0000
Message-ID: <3d592ca2-65c6-892e-6b7b-bf2cf0495386@microchip.com>
References: <20190613113138.8280-1-dinguyen@kernel.org>
 <20190613113138.8280-2-dinguyen@kernel.org>
In-Reply-To: <20190613113138.8280-2-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0190.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::14) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:112::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c16e11a-22a2-4f0c-e3fc-08d6fba1de84
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR11MB1402; 
x-ms-traffictypediagnostic: DM5PR11MB1402:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR11MB14025F22D806DDF9AD7AE82DF0FC0@DM5PR11MB1402.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(31696002)(6506007)(31686004)(2616005)(476003)(486006)(386003)(316002)(102836004)(53546011)(53936002)(6486002)(14454004)(54906003)(6512007)(99286004)(110136005)(76176011)(229853002)(446003)(6246003)(7736002)(11346002)(36756003)(256004)(52116002)(8936002)(8676002)(81156014)(81166006)(6306002)(2501003)(6436002)(68736007)(14444005)(66066001)(72206003)(86362001)(186003)(305945005)(25786009)(5660300002)(66556008)(71190400001)(71200400001)(64756008)(66946007)(73956011)(26005)(4326008)(2906002)(66446008)(3846002)(66476007)(6116002)(478600001)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1402;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XMlaqP9bnxE0K0HO1MT5xNG6Noh6DfxAY1ak6aHTCeteZQiF5dYpNZyAG8TtmJs8L4sQPQ65M9ofcYAbi/UeGwo7KSkNesrWBjPnyXEINvqU3rFgeyfqyufKNe8lzHj1jwi//ceGNNorPisMNA87j3zGaAFLh5q8u1lC79fc8iGdiTm54MjTeNJlz5a5UL53OUsgG6RwyZnHeBwN6FuCaNwxK5IsYLXc26AyNKawn3+WRu42grCGsiHdFRijlHYUJCpSMF8v9v1oF3qQzmzO2QdI7bhKNTjzdeagFUpqm0l/9JkeOimZeUzPz+qsgOLrE01NOz23ktiVQGiTiudVRi4t9otEiRbSzjtU2O1va62M4fKii+u2jd+e3dtE4roWNzFjmdTu41L8LuiNYMpLOh6r2x7eGwZrexZ+siPnzgk=
Content-ID: <07CCCC1F5D7AEB46A69D1BBE2EF74AA6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c16e11a-22a2-4f0c-e3fc-08d6fba1de84
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 08:23:16.5845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_012324_741251_1F751BC3 
X-CRM114-Status: GOOD (  19.31  )
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
Cc: marex@denx.de, tien.fong.chee@intel.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/13/2019 02:31 PM, Dinh Nguyen wrote:
> External E-Mail
> 
> 
> Get the reset control properties for the QSPI controller and bring them
> out of reset. Most will have just one reset bit, but there is an additional
> OCP reset bit that is used ECC. The OCP reset bit will also need to get
> de-asserted as well. [1]
> 
> The reason this patch is needed is in the case where a bootloader leaves
> the QSPI controller in a reset state, or a state where init cannot occur
> successfully, the patch will put the QSPI controller into a clean state.
> 
> [1] https://www.intel.com/content/www/us/en/programmable/hps/arria-10/hps.html#reg_soc_top/sfo1429890575955.html
> 
> Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v6: no need to check for reset pointer in assert/deassert as the call to
>     assert/deassert is already doing the checking
> v5: remove udelay(not needed) on tested hardware
>     group reset assert/deassert together
>     update commit message with reasoning for patch
> v4: fix compile error
> v3: return full error by using PTR_ERR(rtsc)
>     move reset control calls until after the clock enables
>     use udelay(2) to be safe
>     Add optional OCP(Open Core Protocol) reset signal
> v2: use devm_reset_control_get_optional_exclusive
>     print an error message
>     return -EPROBE_DEFER
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 792628750eec..732323c2adb1 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -34,6 +34,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/sched.h>
>  #include <linux/spi/spi.h>
>  #include <linux/timer.h>
> @@ -1336,6 +1337,8 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> +	struct reset_control *rstc;
> +	struct reset_control *rstc_ocp;

 declare rstc and rstc_ocp on the same line and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta

>  	const struct cqspi_driver_platdata *ddata;
>  	int ret;
>  	int irq;
> @@ -1402,6 +1405,25 @@ static int cqspi_probe(struct platform_device *pdev)
>  		goto probe_clk_failed;
>  	}
>  
> +	/* Obtain QSPI reset control */
> +	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
> +	if (IS_ERR(rstc)) {
> +		dev_err(dev, "Cannot get QSPI reset.\n");
> +		return PTR_ERR(rstc);
> +	}
> +
> +	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
> +	if (IS_ERR(rstc_ocp)) {
> +		dev_err(dev, "Cannot get QSPI OCP reset.\n");
> +		return PTR_ERR(rstc_ocp);
> +	}
> +
> +	reset_control_assert(rstc);
> +	reset_control_deassert(rstc);
> +
> +	reset_control_assert(rstc_ocp);
> +	reset_control_deassert(rstc_ocp);
> +
>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
>  	ddata  = of_device_get_match_data(dev);
>  	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
