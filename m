Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E777AC41514
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 07:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B82EA2339F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 07:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UywTQb97";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RxyLPYgQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B82EA2339F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssThgLxMpT3LJ9IjeuHtucXB+WWd7uDcbURxnLheI4o=; b=UywTQb97+qlb04
	ZcbMqmFnF0LLK11bpWmDiNpNVn29N+7LWEuicwZ6XB1L4IDHhQioQUT+4LghnckcK75il4WoXaXTF
	ERlPySjI0uRkJER59V2YPBijodhZAtSnPI9NSLpHwdAWVTn0fUjt251XzIpX78Ignsx/9Anf/tN2/
	MUCWnCy2z59NM9/58dJptk91ATFoIdBItlARP27BLS45FVEfA7NRki76VYPEI2o6ZUaRa0c5w0UXt
	QQPoJ8yy91GVLdmt1pJ6wVYpDDPNm57j0klx3XbfCJ9jvlxXl9A50K6AJdbyViiQ9O2fEDyNHUODg
	qnXRCuTaZX5a7pkx83/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0L3o-0004Fh-3Q; Wed, 21 Aug 2019 07:29:36 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0L3h-00049Z-4m
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 07:29:31 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
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
IronPort-SDR: cwuR3BrswxSbXt+XiiUxWMcvGuhNJiHKXuw9oiNhJJj9C28Cz3JfyQtLvYvadqcssv04mdype/
 k1kOd/kHpgpfmP/UGD/mhizFHVWT7pElApmNY1nozow14HS6uqK7rst79n5wX649U2qMRJArPx
 FKWPC4GYX09GSGdyH8Hx7iEe0VeJN7iRie5NWiYF3uvTsBBebdk7Kj8Sozw2DLq0wQnJYCZGJt
 JfH6itSRoxz49C4rFiRGZcoKmIko721c/hWxv1HW3SPTKA0vHZLyAysyeml/JDl7tK/vU/bMBV
 6SM=
X-IronPort-AV: E=Sophos;i="5.64,411,1559545200"; d="scan'208";a="46027795"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2019 00:29:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 00:29:23 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 21 Aug 2019 00:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbKtuuGXkrMyTYcwQR2VCGHH7x/f+AKu2+Cz5pOl6j1zcIAgzHRxtP18/zyLkbG8jbijDkoZEBC1uh346bFcoBTOjou6gjvSPe9fgAPDR7tuR+ua/5O8LdUIWkS+LBENDzUSL5Y0+OKUzOU3vVMvp15IVKRhCAo93hpTeVDYyhaGXB2Vf5bR85RQo0PJiWEzRaYyovHkGPXkpiXDHydFeVIjnuXoJpZt/olkVPTE/YqpcI7k0Wrvw2JoapJDfnMnbCdotYdFhFPuEmTrUshUi6H7XnrVVu6cxuqLkJ0eKO7MfUnkEa9KhvI8O6I5HBq6YjSAMEvUAIMSQCqEYEkILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz8AZ6TmjX0s/Uxxt+xp0ZEOwqshmxwlIQzCw1csZyU=;
 b=DfAhXRQE34mt0OkHtF+DLRQspiw8UKxC4KLTNg8ySLN1qKXwt6dgNzIvHWSPs/ArESDxY7mOGe8XG+g/upvIzTRzs4Vujbv5BYX3GgBm3Ifnn35P75nN9VnV8+xRncN0Rcwk4qGc+6hnQ04K1eix8RV9ByY1vfsEvxz5qr/s8Ia7cgdHERRRU+vR3z4H2TXePkNWqdbhCgsXEl3hwN20/rHhIUTNdEtcyC6ZWfSImkmKUcCCuHWLkzTiZU8dsQdIagBZVqF98lDvxaFBnghQplJ1DTsKef7yqzdoSMVeaRwOstRLqir69/cafaWYv/J2ovOnTgo2dMdeYJXGeM9ACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz8AZ6TmjX0s/Uxxt+xp0ZEOwqshmxwlIQzCw1csZyU=;
 b=RxyLPYgQWTHnsiQz3D3CWt984kC2/smszwDLX4RxRvRG0tdJ+mx7/Uk87G8acciyMcnPRd4Jq+pU6P65tF/LJH9HOSPWae5GwrInUN5YvgeAv4bHHVYZ42I7PKqOBMzkLAnAFu52NJ8codIhnH8rVzZR04uw3wdZYLO1gYzbAvc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3934.namprd11.prod.outlook.com (10.255.180.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 07:29:21 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 07:29:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <thor.thayer@linux.intel.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [RESEND] mtd: spi-nor: Fix Cadence QSPI RCU Schedule Stall
Thread-Topic: [RESEND] mtd: spi-nor: Fix Cadence QSPI RCU Schedule Stall
Thread-Index: AQHVU7xeH2z0neoGB0mjYqq1QJRJg6cFPMmA
Date: Wed, 21 Aug 2019 07:29:21 +0000
Message-ID: <91a99466-62b5-a928-3019-8a198d28fcd7@microchip.com>
References: <1565909736-11379-1-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1565909736-11379-1-git-send-email-thor.thayer@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8343eb56-e483-4f62-62a5-08d7260948d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3934; 
x-ms-traffictypediagnostic: MN2PR11MB3934:
x-microsoft-antispam-prvs: <MN2PR11MB393456E1F496727EC8DD2A34F0AA0@MN2PR11MB3934.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(45904002)(189003)(199004)(6486002)(386003)(76176011)(4326008)(53936002)(7736002)(5660300002)(14454004)(99286004)(6246003)(6512007)(2906002)(52116002)(54906003)(31686004)(2501003)(316002)(6116002)(110136005)(305945005)(25786009)(66066001)(31696002)(3846002)(26005)(478600001)(486006)(2201001)(8936002)(71200400001)(36756003)(71190400001)(186003)(256004)(14444005)(2616005)(66476007)(81156014)(81166006)(229853002)(66556008)(446003)(11346002)(8676002)(476003)(66446008)(6436002)(102836004)(86362001)(66946007)(53546011)(6506007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3934;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g/hAezB3+kWAdEHEAHuTJe6ePAu4/cKWqFSdl13VvwmKuYG5zxFIw+L4FSbjH9ogNeawnKpZV8uuVMS0+lHYxea6rXs7d6qEhRi3XMXIpASyur487HQlyLNIKbUaa6qc7L5UZsrSVXvOT/V7P9bqz7ORQXVN9opVuxEQiTDPYhhx0ePHPVZzOGWQf5wbzCDTkJ+GSocbC00WcL1sAfQYzcCRO3esDbjIuf6OwoT6zTmnVmMzFqm+FF3u/l2+idBLP612ym+BhVouLQw4JCD4qWqUJg8iILbD2sBmaRDbQr6NowqTTCyPkrad/zsgCuB+FalJYPaES1GkQhP/kBzLgPcaG20NcyqRdc2MjmlHGhi1BzeFGe1LQI29GwJfLR6LNI0yz0KtupUwerZ5HmbiqYy+SY8IvpO2JIWpvbmOaI0=
x-ms-exchange-transport-forked: True
Content-ID: <ABC08B6E90FDF6449B6100419F89BF8B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8343eb56-e483-4f62-62a5-08d7260948d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 07:29:21.6127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OnUfI6IPEjw16I/0rwhp5vAXwCTaCJiSEDYiZBVi5aQKFxqjKLDufZFAl8n5PyQFDEcKUhVAxKlIlJrn/w4eum6fDRTl+yLYFFg3BaPEq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_002929_754484_63DE7701 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel,

On 08/16/2019 01:55 AM, thor.thayer@linux.intel.com wrote:
> External E-Mail
> 
> 
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> The current Cadence QSPI driver sometimes caused a
> "rcu_sched self-detected stall" while writing large files.
> 
> Stall Report:
> '# mtd_debug write /dev/mtd1 0 48816464 blob.img
> [ 1815.454227] rcu: INFO: rcu_sched self-detected stall on CPU
> [ 1815.459789] rcu:     0-....: (2099 ticks this GP) idle=8c6/1/0x40000002
>  softirq=6492/6492 fqs=935
> [ 1815.468442] rcu:      (t=2100 jiffies g=8749 q=247)
> 	<snip> (abbreviated backtrace)
> [ 1815.772086] [<c05a3ea0>] (cqspi_exec_flash_cmd) (cqspi_read_reg)
> [ 1815.786203] [<c05a5488>] (cqspi_read_reg) from (read_sr)
> [ 1815.803790] [<c05a0330>] (read_sr) from
> 	(spi_nor_wait_till_ready_with_timeout)
> [ 1815.816610] [<c05a182c>] (spi_nor_wait_till_ready_with_timeout) from
> 	(spi_nor_write+0x104/0x1d0)
> [ 1815.836791] [<c05a1a44>] (spi_nor_write) from (part_write+0x50/0x58)
> 	<snip>
> [ 1815.997961] cadence-qspi ff809000.spi: Flash command execution timed out.
> [ 1816.004733] error -110 reading SR
> file_to_flash: write, size 0x2e8e150, n 0x2e8e150
> write(): Connection timed out
> 
> This was caused by a tight loop in cqspi_wait_for_bit(). Fix by using
> readl_relaxed_poll_timeout() which sleeps 10us while polling a register.
> 
> Fit onto 80 character line by truncating the bool clear parameter
> 
> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>

Probably this is a good candidate for mtd/fixes.

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 67f15a1f16fd..7bef63947b29 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -13,6 +13,7 @@
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -241,23 +242,13 @@ struct cqspi_driver_platdata {
>  
>  #define CQSPI_IRQ_STATUS_MASK		0x1FFFF
>  
> -static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clear)
> +static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clr)
>  {
> -	unsigned long end = jiffies + msecs_to_jiffies(CQSPI_TIMEOUT_MS);
>  	u32 val;
>  
> -	while (1) {
> -		val = readl(reg);
> -		if (clear)
> -			val = ~val;
> -		val &= mask;
> -
> -		if (val == mask)
> -			return 0;
> -
> -		if (time_after(jiffies, end))
> -			return -ETIMEDOUT;
> -	}
> +	return readl_relaxed_poll_timeout(reg, val,
> +					  (((clr ? ~val : val) & mask) == mask),
> +					  10, CQSPI_TIMEOUT_MS * 1000);
>  }
>  
>  static bool cqspi_is_idle(struct cqspi_st *cqspi)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
