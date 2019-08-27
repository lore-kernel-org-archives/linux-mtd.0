Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01994C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 12:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C583220828
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 12:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k84TJ7tm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Ps8dWS8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C583220828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/i0FBQENIuNRh6WiMoK/LX6ln6qtNnX7BRVqukdMv8=; b=k84TJ7tmhYfzfS
	T/Xf0GJcFJbQvtn0cO28ngqU6BJ25mtZFB83AhtbIQrXZ2JpGV7RF2plRlQKaGQgNIy9lvlpVoJtO
	7XoMQSf3AQUJ7WIUJZP2G70BC2xzotE+pkyT7pXziipnklqr9pFBeoYGicnkcxp/SEH7/nr8Y+PNh
	bOM/D8zNwsba9NKNGKsiJ0xR5Zkwblt8BHff39oT5/AoGKv2QhgwkqxuJSCMLXDxdiI90otRFXvie
	S+mowfIr8kRiGt4qKy0nUlXfrL09nAcPjtDRxwPNsIl1bJRjdBdt5qq5eyVJ6aBEZx9dqgZLPkonQ
	b8o2mIKy7zLQjZBx4qsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2aDK-0007CS-16; Tue, 27 Aug 2019 12:04:42 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2aDE-0007Bc-Fi
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 12:04:38 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: EEAjcotZ4RqizZjCkzllaVGC+XXq/OaFvs3CwOpMOBAacnuCoGQKprCOp+uXDr7uKN31qR//Cv
 YWVBfjaks124z82BHd+9xHWi2cQYbuaZPeuQwoOGhAGZma+OOrcn/2J1o8qbMkMWoCDclJOfYY
 0hkxLAFwFvjLZ4vqeTP21aq/og+XfkI4xcTP+bk9VP6yjP2OiZ1MnD5Z2DMRR3xXDHmztWz073
 u4yXwjTJJI8lBJYM60NJkWNgeSznH9JcBFZBZXQiLfQ9BTxfU+ioZc6N4z9Pwtw1qsIp7fh0jE
 VqY=
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="48123617"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Aug 2019 05:04:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Aug 2019 05:04:30 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 27 Aug 2019 05:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjhQUGMGbxtlzf1LETwnuOH9SrA/k92HtXPmXLxqncl+PNQT+8P02LkN6DQRE2GW9EjPJFHf+hX9qM6tQh6BOjqSau2cb/9FIcV2M9h0RUuCAdyUPqWekieLwFgYZgzY0iwgdPN0yPjXJDSu+mzWsDkXaWYyxWgVJYDJubnAWFG0Osls9WzPFfTC0W8gTyfLMwuHWy5LJS7E8sHDLj+tub0ymRMUZoeJfjl0+z/xIKdV7Abdoya8OvT44RMN6xzSG+WHDAwRAqelqdXdxK4aobDan0D/zLLWZfKK6A27Qe4Ia6VR7s6YoNuxoL06KqRQI3weU6d76J0UwgQQi/frGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeQcIuX+KIIlgqDcnD+g7jGEw3FCLGiV0erEJ3pLL5o=;
 b=E0uuvbM76WvTqtNiwIxecE7Vpei9FhKiNq598eT4kNwtekK4SK/M27xr/qmr0dID+TACNh9tVY2paiNWYJq4TdMo7b8xpc7gyptHyKL/yMW+V1dAHY8xbTYAfExK0OWi8XC8XTDx12tLBscnc7yL0l7ATDhfqflbM9VFxvjIrXBqPnv7ZbjpoHpSRKFOKRLUiVfPZk0e5yqXScn4AVcJybbZgkW69ZI7XtFKd33lfGTcri61DqfxrOOR3y9MwoVF/gLZRLScHPlWijQbW8qJPATvY+Ae58VHPBCHuGmQplnq7elVrcaloeXhxzIsfETbIRZVfNqUXNKmeoDwefCsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeQcIuX+KIIlgqDcnD+g7jGEw3FCLGiV0erEJ3pLL5o=;
 b=Ps8dWS8siBezFy9AObzPe3CfpozRCcmDrA0L/PTbtDsAVBaXn3tc1ObeB+NmVNSrIMXKq+W6ju/p+/Oo9fPHEoQYK38DzkmfPeeZhTUtBcZzXxJLXglBFpvnPwvZuYYJVO3+NG84Gi5cbyrX3bcDO0Dnr/jv387gphRB3EqLCiQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3904.namprd11.prod.outlook.com (10.255.180.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 12:04:29 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 12:04:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Ashish.Kumar@nxp.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [Patch v3] drivers: mtd: spi-nor: Add flash property for
 mt25qu512a and mt35xu02g
Thread-Topic: [Patch v3] drivers: mtd: spi-nor: Add flash property for
 mt25qu512a and mt35xu02g
Thread-Index: AQHVUcNYVX8MlxJF80625T3aIY1jHqcO+5qA
Date: Tue, 27 Aug 2019 12:04:29 +0000
Message-ID: <e55cd1f9-7359-5484-d258-1f3ea51584b6@microchip.com>
References: <1565692705-27749-1-git-send-email-Ashish.Kumar@nxp.com>
In-Reply-To: <1565692705-27749-1-git-send-email-Ashish.Kumar@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0165.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::13) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e172b9c6-eea5-4c6a-d85c-08d72ae6b69e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3904; 
x-ms-traffictypediagnostic: MN2PR11MB3904:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR11MB3904ABF3F90BB278A1041EDBF0A00@MN2PR11MB3904.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(39860400002)(396003)(366004)(199004)(189003)(53936002)(71190400001)(6506007)(6436002)(66066001)(71200400001)(31686004)(86362001)(81156014)(81166006)(186003)(8676002)(5660300002)(6512007)(66946007)(66556008)(36756003)(6116002)(6486002)(3846002)(66446008)(8936002)(6306002)(64756008)(52116002)(2501003)(31696002)(2906002)(386003)(478600001)(76176011)(66476007)(486006)(6246003)(2201001)(2616005)(26005)(25786009)(476003)(7416002)(110136005)(446003)(966005)(102836004)(14444005)(11346002)(14454004)(4326008)(229853002)(99286004)(305945005)(54906003)(256004)(316002)(53546011)(7736002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3904;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MR1+Yl2k6FoXerhZ1wn1HePwFUX3b2NaRWeDikY16g5SPU/VqJvT99c7h7yBsUf/JqL3voj1bzH2NjoNtAMAotJfhNAzuiYGR79l7OKRYy/W0wlTkp2wlPmKvwzGW4rZf9ehOitmTHd5S4FcF+EfPm2FwSCDyOKs8fXyPKweGiwNnPqntZ+Z7asNgqvzUpOjpTDN6Pzcq3KYH34BGWlbbkRzoe2gPfhNRN8H6G6wYAq0SM+47bRm3yvucf5tTqRHPPPnq07FFpaEPedVwl2kskU5BkUeFKNJPKM+RVBN5Loe6MrF3FFAoDOulg7r3o6HUUan9qRxTxJ9UuJiZtU2ZOBPTEgdRQWPqUWdBrkFnyvhCDwWSI+xOi/gfCu20XBlsilxlmJBr9S9h9h4u4YFTKkwMr0dcNymiVAaAUt0fhk=
x-ms-exchange-transport-forked: True
Content-ID: <817519E50A773D418D42B6B710A039A6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e172b9c6-eea5-4c6a-d85c-08d72ae6b69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 12:04:29.3860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: di0B5en4YzGn/Q+MOFVvMOUjH6nPtCuvmmk9LF2DA8aMv2NEXWgy2y6MWuM9h6pHvx8xAuYiw6AM5EJsrtYCA1CWZ7dNLMDIDj+ePfOiats=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_050436_709479_E04B081F 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: kuldeep.singh@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Ashish,

On 08/13/2019 01:38 PM, Ashish Kumar wrote:
> External E-Mail
> 
> 
> mt25qu512a is rebranded after its spinoff from STM, so it is
> different only in term of operating frequency, initial JEDEC id
> is same as that of n25q512a. In order to avoid any confussion
> with respect to name new entry is added.
> This flash is tested for Single I/O and QUAD I/O mode on LS1046FRWY.
> 
> mt35xu02g is Octal flash supporting Single I/O and QCTAL I/O
> and it has been tested on LS1028ARDB
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> ---
> v3:
> -Reword commits msg
> -rebase to top of mtd-linux spi-nor/next
> v2:
> Incorporate review comments from Vignesh
> 
>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788..97d3de8 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1988,6 +1988,12 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +
> +	/* Micron */
> +	{ "mt25qu512a", INFO6(0x20bb20, 0x104400, 64 * 1024, 1024, SECT_4K |
> +				USE_FSR | SPI_NOR_DUAL_READ |
> +				SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },

I'm looking at the following datasheets: mt25qu512a [1] and n25q512a [2].
Both flashes have the same Extended Device ID data. What will happen, is that
you'll always hit the first valid entry, so "mt25qu512a", and you'll indicate a
'wrong' flash name for n25q512a. If there is nothing that differentiate between
the two, maybe you can add a comment in the code that says that "n25q512a" was
re-branded to "mt25qu512a" after the STM spin-off. Whatever solution will be, it
will be better if you do it in a separate patch.

[1]
https://static6.arrow.com/aropdfconversion/1a8b08cb08427821f166137d064c4837eca70f15/12682797700728481268266842945946mt25q_qlkt_u_512_abb_0.pdf.pdf

[2]
https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjZlJ_M_KLkAhWB66QKHV6WAX4QFjAAegQIAhAC&url=https%3A%2F%2Fwww.micron.com%2F-%2Fmedia%2Fdocuments%2Fproducts%2Fdata-sheet%2Fnor-flash%2Fserial-nor%2Fn25q%2Fn25q_512mb_1_8v_65nm.pdf&usg=AOvVaw3BSiUIfTgikFZ0FZ7O_D61

> +
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> @@ -2003,6 +2009,9 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>  			SPI_NOR_4B_OPCODES)
>  	},
> +	{ "mt35xu02g",  INFO(0x2c5b1c, 0, 128 * 1024, 2048,
> +			SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> +			SPI_NOR_4B_OPCODES) },

Is there a public datasheet for this flash?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
