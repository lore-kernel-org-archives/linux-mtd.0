Return-Path: <SRS0=gyp4=UW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B558C43613
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 04:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDB42073F
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 04:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+AWqwFc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="T9nUbM4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDB42073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmaYU3D4lSTa1RNONi+a519cl8yBZMNHzKCwWNTBcOI=; b=o+AWqwFceIU3XG
	SDSpq9MpX8ozi33hr020iPqcypkoA0ID5UzwujdDV+qX4MO5M4YqcQgJsm3XBlzEgyg/smKjdfLIQ
	Z3V87e//W/qhuptuwCOz1D2S4M/rpLGXHZ8GphvctQsZbYTX4l4HIVWvlkpITiLzu+JPuUkAvcnza
	M5EGQ8J8ckGv4tVabEgXcz7a95Gm1gXlKBSA+SOOwMZTv3biIkxi9mwxFWnfF7FyxX15qlYV2D5E9
	RizaEL1UuLbu0orlAVmmrsVPd3xCh+2rURfyYITlAp/u1iOaiIaAgbMvlqJloVNTrAdO0kyLRJFUS
	sT0PoYyB3hF/JbwuBSiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hetga-00042z-O1; Sun, 23 Jun 2019 04:01:00 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hetgP-00042V-Lw
 for linux-mtd@lists.infradead.org; Sun, 23 Jun 2019 04:00:54 +0000
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
X-IronPort-AV: E=Sophos;i="5.63,406,1557212400"; d="scan'208";a="35481739"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jun 2019 21:00:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 22 Jun 2019 21:00:13 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 22 Jun 2019 21:00:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIF/7sC+asvGwvjHSYXwcLV4oX7aVux10C2yJjYgRXQ=;
 b=T9nUbM4+oC+YCQsCSpq63H3eF6uh2+KYcrrKksdudk7XfM6KJBZ3WnCXGwxCZ6puNx1bu4v8YGorZokJYXrfcpH4RVn4Z/fnFvS8WkOuGJ/dTWOhXniGANttC87gp6o1F5ck+jmkNFDr8m5Z3wvqeM3r20Clv2mWtn69MrZokLQ=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.91.11) by
 DM5PR11MB1292.namprd11.prod.outlook.com (10.168.101.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sun, 23 Jun 2019 04:00:06 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e%6]) with mapi id 15.20.2008.014; Sun, 23 Jun 2019
 04:00:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <f.suligoi@asem.it>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>
Subject: Re: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
Thread-Topic: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
Thread-Index: AQHU3+WAOo1QTk5/V0KHCow8ly8T6KapMG8A
Date: Sun, 23 Jun 2019 04:00:05 +0000
Message-ID: <55f74662-c5f6-2cdf-f1a0-c685f7ff1913@microchip.com>
References: <1553172946-2251-1-git-send-email-f.suligoi@asem.it>
In-Reply-To: <1553172946-2251-1-git-send-email-f.suligoi@asem.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0093.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::19) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:112::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.121.6.240]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a3ed1d1-66ff-47f9-b0dc-08d6f78f4667
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR11MB1292; 
x-ms-traffictypediagnostic: DM5PR11MB1292:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB1292D351B505AC6EE40E8943F0E10@DM5PR11MB1292.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00770C4423
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(39850400004)(366004)(189003)(199004)(81156014)(478600001)(66476007)(73956011)(76176011)(966005)(8676002)(66556008)(66946007)(81166006)(66446008)(6486002)(25786009)(64756008)(31696002)(4326008)(72206003)(5660300002)(256004)(486006)(6306002)(8936002)(2616005)(86362001)(476003)(6436002)(6246003)(186003)(11346002)(53546011)(446003)(3846002)(6116002)(110136005)(26005)(31686004)(2906002)(305945005)(6512007)(71190400001)(66066001)(52116002)(229853002)(68736007)(54906003)(14444005)(102836004)(6506007)(386003)(316002)(7736002)(99286004)(71200400001)(36756003)(14454004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1292;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6NciTCiZi/6UNFlHQZVOCz6FVxNa6zMXr9z3E8nlbQJNCGtq4APBHbWmCbUsvW+fzZwS3wAazF5k3oH9ZQHSeoLIhToD7+OVShs0bzgXjahJx0c44hx6dD4otUsMXqRn1vfragnM6twGhEVLjl5ixuM0poXIiiygya+t+22Laawekbx+ZZmHfLZkEF8j5TycDXkUDe8O7mCmHSp/fADENxALq9L9fWnLvpvJ3DYMJcljvYcTi8sb1W9rqUgp2sEoFgRsX3bA3Pw7LpJomD0TMWB+BYR3brEfyA6A99ltzpYBeVv7uiwZUZ1YtbkIOsp9QhucyFYegrhAvUjKMomM6vb67SGd6FGrpbU6QnD/Yz1mTGhnphucsnO2tDwV8ZppU+jyLQVHNAcqxEMqfYL50TChlXYHHJ2LoejOHOxA/r0=
Content-ID: <76E8769DDEB91C4195392924F2F8D77C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3ed1d1-66ff-47f9-b0dc-08d6f78f4667
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2019 04:00:05.6972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_210049_816206_7A0E02D6 
X-CRM114-Status: GOOD (  26.11  )
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
Cc: linux-kernel@vger.kernel.or, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Flavio,

On 03/21/2019 02:55 PM, Flavio Suligoi wrote:
> External E-Mail
> 
> 
> This patch fixes the following kernel error message:
> 
> "flash operation timed out"
> 
> that occurs when a non-JEDEC spi-nor, declared in a Device Tree, but not
> physically present on the board, is involved in a write operation, as:
> 
> cat datafile > /dev/mtd0
> 
> In some cases, with enough quantity of data, the writing hangs for minutes.
> 
> This situation can happen, for example, in some embedded systems, when
> a non-JEDEC spi-nor is mounted using a removable add-on board. So is
> important to find a method to check a non-JEDEC device presence before
> using it.
> 
> The presence of a JEDEC compliant device is implicitly verified during the
> JEDEC auto-detect procedure.
> But for a non-JEDEC device, the presence must be explicitly checked,
> reading one or more known registers, according to the chip features.
> 
> Without any check, if the spi-nor is declared in a Device Tree but not
> physically present on the board, the driver (i.e. m25p80) is loaded anyway
> and the correspondent mtd device is also created.
> In this way any read operation on this device returns 0xff (or 0x00,
> depending on the driver and the hardware used) and any write operation
> hangs until the flash operation timeout occurs, with the "flash operation
> timed out" error message.
> 
> This patch adds the non-JEDEC spi-nor presence check before initializing
> the device.
> 
> Note: currently this presence check supports only the Everspin mr25h40,
>       reading its status register.
> 
>       The support for other non-JEDEC devices has to be added.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index fae1474..d2cb710 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -3981,6 +3981,42 @@ static const struct flash_info *spi_nor_match_id(const char *name)
>  	return NULL;
>  }
>  
> +/**
> + * check_nojedec_nor_presence() - check the real presence of a non-JEDEC nor
> + * @nor: pointer to a 'struct spi_nor'
> + *
> + * The presence of a JEDEC compliant device is implicity verified during the

s/implicity/implicitly

> + * JEDEC auto-detect procedure.
> + * For a non-JEDEC device, the presence have to explicity checked, reading

s/explicity/explicitly

> + * one or more known registers, according to the chip features.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int check_nojedec_nor_presence(struct spi_nor *nor)

all functions should start with spi_nor_*. How about naming it
spi_nor_check_nojedec_presence()?

> +{
> +	struct device *dev = nor->dev;

you use dev once, no need to declare a local variable for it.

> +	const struct flash_info *info = nor->info;

this will probably disappear, see below

> +	int ret = 0;

initialization not needed

> +	u8 val;
> +
> +	/* Check presence for Everspin mr25h40 MRAM */
> +	if (!strcmp(info->name, "mr25h40")) {

Couldn't we make this check for all non-jedec flashes? Aren't we safe to assume
that all the flashes have a Status Register that contains a WEL bit which come
with value zero by default?

> +		/* Read the status register */
> +		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
> +		if (ret)
> +			return ret;
> +
> +		dev_dbg(dev, "%s - status register = 0x%2.2x\n",

%hhx?

> +			info->name, val);
> +
> +		/* The factory preset of the status register is 0x00 */

if we generalize this, the comment will become irrelevant. How about something
like: "Check if flash is connected."

> +		if (val == 0xff)
> +			return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -4158,6 +4194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  			return ret;
>  	}
>  
> +	/* Check non-JEDEC nor presence */
> +	if (!info->id_len) {

if (name && !info->id_len)?

How about moving the entire if block to
https://elixir.bootlin.com/linux/v5.2-rc6/source/drivers/mtd/spi-nor/spi-nor.c#L4037?

Cheers,
ta

> +		ret = check_nojedec_nor_presence(nor);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* Send all the required SPI flash commands to initialize device */
>  	ret = spi_nor_init(nor);
>  	if (ret)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
