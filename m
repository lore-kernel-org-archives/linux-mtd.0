Return-Path: <SRS0=H28k=XK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB074C4CECD
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2019 20:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB112067D
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2019 20:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DE7xJf+i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fortanix.onmicrosoft.com header.i=@fortanix.onmicrosoft.com header.b="ELJqTX//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FB112067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fortanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CYYiB4EEkI1mdQWyC7H/Glu8pt2UgAb/5L2leZgbFk=; b=DE7xJf+iHJPMyF
	2jpNAEQ/rnY72ophSxWLbYohHipuCO7YbIf3sBD0i/WADqUJkV72AlYlZ7RNSBhWT6lszMbNiimOZ
	0OqD3hHn14WVVzs3RNoCXDy12b/8BqDWdm66qrxTQdNF0E/L6S87iNvVYg0XW1BMsWA+2jOjo/BZG
	v7PLQMvF7ZEXv6q422utFCZdgSJ5Pp3aeHFPptn25MTN3ws83yKwOj5uIGZ5mkzW+49dAPIpYdPX4
	XoZ3RT4yI2QdhZlNg6iMyrn+DYc0gk1itebcesfmmN9hPmdNkbp20x277zJ5SQZ9U7vUO2oWoTVIm
	58bWOZerY/6/QHbwlSgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9bLR-0001yO-6W; Sun, 15 Sep 2019 20:42:05 +0000
Received: from mail-eopbgr770111.outbound.protection.outlook.com
 ([40.107.77.111] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9bLL-0001y0-4m
 for linux-mtd@lists.infradead.org; Sun, 15 Sep 2019 20:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVdoNZu7THVUDQjR+1K6KibHFWNwvqVfSRTOpxRXV0VwJaEEMDdLUK2cEnFpe1zfmiqv3htlVjH0u613Oz+9V1/p5ryz6ZdDlSetMmyZzL8o5Iib2qg6ro13OlgztFxLkr0PwugqneRGOI6kvqomDCXO3Xy2AJQj20AkhYmBU0EriVwSSnabe1uv0zwULAotATeKNS/lJqglaGzm+5qoXTRUpjItFSzSq0DiiqQmFA+vfNJ1uNYWiySorao+Oawc9zfpZ3zUO/ZnajtfZeXu7SBtgLAgeKTX+/+MFB6iX0dGYptMkL+ifADkUOjcWfuAoYs532CsWWoEb0kn6dCyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tG+ifsCHzLRBvbHxjq5uQWC8tRm8GJgkwrsKJusbeE=;
 b=gL1ogpYKB6Rrbba+j6hGgVtbRB89iAcLkKjLW3FSvFvV9W1765deIuXeWxnpAmCERxlRrRSOtHEhxD8yPnHTigUHUPNQKWHrv7eByZ21Dq/8FIfmjZ49gVkXXSvyUIWRd8lp5yyJmELY8bl+AT65CrLd6z4Y4NLdfknLvmcfqnDm1ej+1QgCYl0a3Zvl6CNHHr7bVhrvp4ADiRNpFsp6zZT//7K9JmtB2sXoxhLWpzwmzQrtsISCfuo3Uc/YRhPxY39/ZIB2BH1XAJM9iR9vK1pe137dHn0uE8T8MU0rxWpoCOyLa3i4OadREJ9+S4MTeXVxDHL0I4dEXrYqVj0fzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fortanix.com; dmarc=pass action=none header.from=fortanix.com;
 dkim=pass header.d=fortanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fortanix.onmicrosoft.com; s=selector2-fortanix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tG+ifsCHzLRBvbHxjq5uQWC8tRm8GJgkwrsKJusbeE=;
 b=ELJqTX//uKVT9ZRHjGwco/nMdvZlKwurHMp0awcaBwjiCQ0l8RE0r8TUaD4WLSbf165+O/dThj7DJxtUQenXNcPy6rKEkbNzh0dyhSI3KNWCwEzTu+aco4/jxfeDPf8FYqjwI8yK+fgNzHx3tma6Dk25Oy4sBm7mZvIN+kK+WgU=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM5PR1101MB2172.namprd11.prod.outlook.com (10.174.104.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Sun, 15 Sep 2019 20:41:55 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42%6]) with mapi id 15.20.2263.023; Sun, 15 Sep 2019
 20:41:55 +0000
From: Jethro Beekman <jethro@fortanix.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Index: AQHVYr406/tKUl7vTUifobCqeM8uGactRn4A
Date: Sun, 15 Sep 2019 20:41:55 +0000
Message-ID: <32ab6570-c3b7-4eec-7a0b-69bc2f7f76dc@fortanix.com>
References: <69f4a8e8-7889-8b00-0adc-7faaef6b42e4@fortanix.com>
In-Reply-To: <69f4a8e8-7889-8b00-0adc-7faaef6b42e4@fortanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::13) To DM5PR1101MB2348.namprd11.prod.outlook.com
 (2603:10b6:3:a8::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jethro@fortanix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [84.81.201.191]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 614b18f7-ed99-4d7b-7e47-08d73a1d251f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR1101MB2172; 
x-ms-traffictypediagnostic: DM5PR1101MB2172:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB217269734CC6BED5375D2605AA8D0@DM5PR1101MB2172.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01613DFDC8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(136003)(396003)(39830400003)(199004)(189003)(386003)(6506007)(53546011)(478600001)(102836004)(25786009)(26005)(2501003)(14454004)(66066001)(186003)(4326008)(81166006)(8676002)(81156014)(256004)(14444005)(52116002)(31696002)(76176011)(86362001)(6116002)(8936002)(3846002)(446003)(99286004)(5660300002)(2616005)(476003)(11346002)(6512007)(36756003)(53936002)(6436002)(31686004)(305945005)(2201001)(110136005)(486006)(2906002)(7736002)(6246003)(229853002)(71200400001)(107886003)(6486002)(71190400001)(66946007)(7416002)(66556008)(66476007)(66446008)(64756008)(316002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2172;
 H:DM5PR1101MB2348.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fortanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L8c29mkgJmhEiPcVWV65NbUTLW4oCKBgist7lY6+N0su5elfpUSnP5Y/3PvOs7loHzab5z+/gHDQOpV03mw8t4ZSDMq/5BgQs5wjg5v3zxdoaQ1AjejVaQhOm7rny4fMvTq6lnkKfYFbEc/x5SMLO+R9GS5gfoHYIJeDTuuiuI+EyDza7MJS6ADM268aRVQvwjuCVgC3BinPVNAfoV9ArBWkQ6EQhJGcr+IgmobepUCxjr3/32zmVVISEkbTh4YgrM2ypb/MMaopLxGT55BL9n8tYzs+qCEsyCv8wjdi4XeMOsscutaYfR22j3r3XeMHGfgfHIyREl1eqT7gasozfRyP0BWx+Cj5d5kKKh+nnTBbp74gK0UwPVQCjZ2xy3KZcLpSuzT4JymE+wvwajeHUJQFP430F+NI95UFMuiB6mw=
Content-ID: <D5859958FD3DCB40BA2A4C5F02A326ED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fortanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614b18f7-ed99-4d7b-7e47-08d73a1d251f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2019 20:41:55.0776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de7becae-4883-43e8-82c7-7dbdbb988ae6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBFvIgYxF1ZNEpj3fcKQu58sjHwNF4B1/YQb3EMnJmN+7QY3wYxQrQDZrAjaQ4Bhhm4iGGmF4BlYs0BXIq4qYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190915_134159_249263_2FA8F374 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: Jethro Beekman <jethro@fortanix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Could someone please review this?

On 2019-09-04 03:15, Jethro Beekman wrote:
> Some flash controllers don't have a software sequencer. Avoid
> configuring the register addresses for it, and double check
> everywhere that its not accidentally trying to be used.
> 
> Every use of `sregs` is now guarded by a check of `sregs` or
> `swseq_reg`. The check might be done in the calling function.
> 
> Signed-off-by: Jethro Beekman <jethro@fortanix.com>
> ---
>  drivers/mtd/spi-nor/intel-spi.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 1ccf23f..195cdca 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -187,12 +187,16 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
>  		dev_dbg(ispi->dev, "PR(%d)=0x%08x\n", i,
>  			readl(ispi->pregs + PR(i)));
>  
> -	value = readl(ispi->sregs + SSFSTS_CTL);
> -	dev_dbg(ispi->dev, "SSFSTS_CTL=0x%08x\n", value);
> -	dev_dbg(ispi->dev, "PREOP_OPTYPE=0x%08x\n",
> -		readl(ispi->sregs + PREOP_OPTYPE));
> -	dev_dbg(ispi->dev, "OPMENU0=0x%08x\n", readl(ispi->sregs + OPMENU0));
> -	dev_dbg(ispi->dev, "OPMENU1=0x%08x\n", readl(ispi->sregs + OPMENU1));
> +	if (ispi->sregs) {
> +		value = readl(ispi->sregs + SSFSTS_CTL);
> +		dev_dbg(ispi->dev, "SSFSTS_CTL=0x%08x\n", value);
> +		dev_dbg(ispi->dev, "PREOP_OPTYPE=0x%08x\n",
> +			readl(ispi->sregs + PREOP_OPTYPE));
> +		dev_dbg(ispi->dev, "OPMENU0=0x%08x\n",
> +			readl(ispi->sregs + OPMENU0));
> +		dev_dbg(ispi->dev, "OPMENU1=0x%08x\n",
> +			readl(ispi->sregs + OPMENU1));
> +	}
>  
>  	if (ispi->info->type == INTEL_SPI_BYT)
>  		dev_dbg(ispi->dev, "BCR=0x%08x\n", readl(ispi->base + BYT_BCR));
> @@ -367,6 +371,11 @@ static int intel_spi_init(struct intel_spi *ispi)
>  		    !(uvscc & ERASE_64K_OPCODE_MASK))
>  			ispi->erase_64k = false;
>  
> +	if (ispi->sregs == NULL && (ispi->swseq_reg || ispi->swseq_erase)) {
> +		dev_err(ispi->dev, "software sequencer not supported, but required\n");
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * Some controllers can only do basic operations using hardware
>  	 * sequencer. All other operations are supposed to be carried out
> @@ -383,7 +392,7 @@ static int intel_spi_init(struct intel_spi *ispi)
>  	val = readl(ispi->base + HSFSTS_CTL);
>  	ispi->locked = !!(val & HSFSTS_CTL_FLOCKDN);
>  
> -	if (ispi->locked) {
> +	if (ispi->locked && ispi->sregs) {
>  		/*
>  		 * BIOS programs allowed opcodes and then locks down the
>  		 * register. So read back what opcodes it decided to support.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
