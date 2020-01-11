Return-Path: <SRS0=phPz=3A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B72EC282DD
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 15:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0A4206ED
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 15:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6Sraodr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ALIIaTKk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0A4206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCY90xaMBp4gm7SdpIJBiyYfPr+qDocclycJSVbmHfo=; b=V6Sraodrsu/PAu
	Nh0defXNA4vip8xnSPUzTA2zIvLRY40Xl5GP1sHhIBFLH9RLViD5QnOQk8tLJIt80AbzRw+JOcTkQ
	5cXZ/iFYfeYNs2ZIt4i+spxP2+dHGpERsoCXfwMx5c/G+qLvUeuyVa0/i0cqAb9Iw+kdgb22xBl6Y
	dHxQ2U4A2I2QViWINXW1zh1SVx9hS6W/2lQWdWd/xRkjOl59ao3HmcQhkAAwu+Tk8Hclxdp8oa2ho
	RMVx6OInjBjHU7k2ggOkeNjxFietyDtAfMWR5MrtLuseAkepUOQ6vgT+cvQLjqcAoYuDWExVuGe6D
	FONmMY11Dxcc0O8Trimw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqJ43-0002sJ-0D; Sat, 11 Jan 2020 15:52:39 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqJ3y-0002gc-HX
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2020 15:52:37 +0000
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
IronPort-SDR: WqAky2Qpf27bmfmEOOoDlVLV96+DA61zOuyomPaHvZd01xPC+MnDNA1cicu6vrxsMT6OvTxqhn
 EQuLl8i33qCBWAsGaaTRg2GIyn9yNo8MxUYJ0qDq7I0fUSxH8qsLuF5d/YHwgKw840GinWZn5w
 cqPTlJr/e0D8nl8DzW0tlLwrZmVYswDH2TFphsokCwxPpnT3ufxiCMqGZWMn5ZgaLoZ5QE1XyD
 +zvkEuaigcC1eabGwWLarMwm+VqASMM6A2r1xKi4cpvtCt+3iE9zh5G6pEPXDRMIcY5/Ymi2nT
 XjY=
X-IronPort-AV: E=Sophos;i="5.69,421,1571727600"; d="scan'208";a="62963300"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jan 2020 08:52:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 11 Jan 2020 08:52:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 11 Jan 2020 08:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9vnbiR/vJgxLeQxvVY1qkWomYCoThnUv5qDeJxGelVWsozqx6G1gmuWwfcMzSbgxl1iPkURXeVwhrvz4rE8PhwjCasJB58VmByx9tntj18stli3ecyFRqkkSsXFManfBnM6ykUWikWB2Ct3jREmUB9mvoXTFCa9qjcZPmAZeq11cokzhUVBYw7jvPeey/1tFmSrfDSkjrtnWBPK/bF8SIgl8FsaKgZ1/H5wQCUhV9Bxx2dkgrxydPNlpWZonD3koQr0g3Bki6NBMe0E7nN2dVSf/hLpwujOLfSX3GV1Ub74JNwqeIZmORY8SAZunYXS1uwZL0t+4F3y7NbrSc6cmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRsnW9hlKlvqARQw1N3f0KgowYdBuqIVYtRkSBGqF+4=;
 b=jHPAUZYcrX2pbfFA6DK6gpYKkka4VW3w/0Ksu2RLzBXwJ9y8rgA+8kBG23dTds8Mz8Ip/8YQIsyZTxqeHANybdNI6EfgW+H+mAVy9n0CZAjkHtkX2NMGMWLDY5NbH4X1gb11LS1+ovzoHkzZVa7wC5JyrB00KDiWzazuNDIZdAirDUFcLgU+452eBoxMunl3tuXZAJVJlvV3IcZKTImR6zsV1wEHZL8A4UJY3LnIlDCHlIPtavMaBvNGeqWcOY3JnN4DtTYEmp7cyNfJlbQIq7KDlMv+pF7sMMqhVCfJFTwpf3FY1N85agCtOpO4LI3IFcGbuSXagm3grXal0SMyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRsnW9hlKlvqARQw1N3f0KgowYdBuqIVYtRkSBGqF+4=;
 b=ALIIaTKkg46ScGrK7PHLDdPpRkuJt0YCqrVyJbPkjBwZ1VTiP8kFtw9pRVzOrbLrz7G8aPzF3b7PXBgFwq6QSffRBatN90AOgg7JM3AmGYzRB2vJfhPbb+DmnMmem3AOpAP03TFHtGWk9Kylc+8eDgqZdS4Wt7PQBL/0c4oqsJ8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3726.namprd11.prod.outlook.com (20.178.251.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Sat, 11 Jan 2020 15:52:28 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.013; Sat, 11 Jan 2020
 15:52:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: add support for GigaDevice GD25D05
Thread-Topic: [PATCH] mtd: spi-nor: add support for GigaDevice GD25D05
Thread-Index: AQHVyJcfgkL09MGJRkKLG+5kNZEISw==
Date: Sat, 11 Jan 2020 15:52:27 +0000
Message-ID: <1873152.psFcFxbH5H@192.168.0.113>
References: <20200106124624.28779-1-koen.vandeputte@ncentric.com>
In-Reply-To: <20200106124624.28779-1-koen.vandeputte@ncentric.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dc33cec-a848-4215-2512-08d796ae4266
x-ms-traffictypediagnostic: MN2PR11MB3726:
x-microsoft-antispam-prvs: <MN2PR11MB372654C03A2A76B7DF9F2FDFF03B0@MN2PR11MB3726.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0279B3DD0D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(76116006)(91956017)(64756008)(66556008)(316002)(54906003)(86362001)(66946007)(6486002)(66446008)(6512007)(71200400001)(9686003)(478600001)(6916009)(2906002)(66476007)(6506007)(5660300002)(4326008)(8936002)(186003)(14286002)(26005)(81166006)(8676002)(81156014)(53546011)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3726;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J1MpAK8THnJNPbYMnc+4vuQDcfbvuctZz+3eat3V7Z08YSbnTD5smm9n/oq+4te9IcG1iwbJuEaa+8PrxUjbSsskcCAJnLJd7tAdMajYBGXI0B52CG80gVwonEHTDXMdfejEiajemdQFBSjogiAhuWy+Vek/PW0kC6Iq4n6JMOTeV24/nnehpmNr/1Nx1BOJ0Jn0BWkZjmteDrxpBy0FcEm9PcK4hbGWuIZNdHzIkNe2VNWt1OOYx8NkTPKBkB9F5juiFJi+Hp3BwOAzWOD2wWOQVwDqKvgjLCryyhpHu7Qh8v+xZsxNp0tcvH8kU9A92XxcDNIHSp/NtLHUHoJpaZ4BdFr6KjAX2dK4plTF0/1rUvoBt0BXh+lUyhRvv6I7KbMl/WirnWlwiCyIHuXz6pYoKaOCYz1oGhoLLpFHni23E4PyJ5G/88S+GNDW0UaOvudaLhL64Ze/IO4EwNcD83QP4MfHeYsJpWYDExEbddO0tgh52o/ACym93jpA4cVV
x-ms-exchange-transport-forked: True
Content-ID: <ADB088A3BC45EF4EBDED2C34BE55225B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc33cec-a848-4215-2512-08d796ae4266
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2020 15:52:27.7111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGeerzQmDtQikwbngiGCARcFDEhnrDoy8GePclJvm41dXRYI1jbP4zN7lEALfkxcpMOuOp3EY3jTN6iPXcoiRSIAEgeZxdGxATgzLn9Sph8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_075234_654223_B1EB47C6 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: richard@nod.at, vigneshr@ti.com, koen.vandeputte@ncentric.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Koen,

On Monday, January 6, 2020 2:46:24 PM EET Koen Vandeputte wrote:
> Tested on a MikroTik RB912UAG-5HPnD r2
> 
> [    0.641714] m25p80 spi0.0: found gd25d05, expected m25p80
> [    0.649916] m25p80 spi0.0: gd25d05 (64 Kbytes)
> [    0.655122] Creating 4 MTD partitions on "spi0.0":
> [    0.660164] 0x000000000000-0x00000000c000 : "routerboot"
> [    0.667782] 0x00000000c000-0x00000000d000 : "hard_config"
> [    0.675073] 0x00000000d000-0x00000000e000 : "bios"
> [    0.682613] 0x00000000e000-0x00000000f000 : "soft_config"

I'm afraid that this is not enough. You'll have to test all the flags that you 
advertised. Typically one should do a read, erase, write, read-back test, and 
then to exercise the lock and unlock features. If you want to be exhaustive, 
you can force the controller to do the reads in single, dual or quad modes, 
but if you choose to test just the best supported read mode, it is fine too. 
Please specify in the commit message what you tested.

Cheers,
ta
> 
> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f4afe123e9dc..a34fa42d47a2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2346,6 +2346,11 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) 
},
> 
>  	/* GigaDevice */
> +	{
> +		"gd25d05", INFO(0xc84010, 0, 64 * 1024,  1,
> +			SECT_4K | SPI_NOR_DUAL_READ | 
SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
>  	{
>  		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>  			SECT_4K | SPI_NOR_DUAL_READ | 
SPI_NOR_QUAD_READ |




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
