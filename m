Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30C7C282DA
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 12:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94927217D6
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 12:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LyS9mq91";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="emfH+eSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94927217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsaU+CywvWu1+/OAV2QomlpbU4FP1Uaflng6kQ797zo=; b=LyS9mq91bdhxRj
	nohDDJivyaJocGXLtu/9iRYEs3r72vu27oqcV3ZatldPX3WrmDzd/YqxFK4T9gn9a7/FjgvmpYXaZ
	j/QEAbY0rQicxcRBpJL5B+AeNsCujTnd9r9B96MK8V4HgCqIDVEfvgN7sHhB8aSnWSVPgvYUxmhNF
	MyYIipwPOUPyK5EybzKOjzi5aT7sbg3PT2IHUkmycBVTm8Fs1R4b/pW8FAbTbYTaoqcXhUv7e5luA
	LuKSpgFihHud2fA5XDHb3GGi4IFdQET7AG0Qlgx1/Nh1gZRbfbW3kq0OWGvbJU6BOHbFYaZQapfzP
	iC26w3/187uVyArx3Wgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqGlG-0004rT-4i; Sun, 03 Feb 2019 12:20:34 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqGlC-0004r3-QU
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 12:20:32 +0000
X-IronPort-AV: E=Sophos;i="5.56,556,1539673200"; d="scan'208";a="26245025"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 03 Feb 2019 05:20:28 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Sun, 3 Feb 2019 05:20:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSuygxr80QQ8/ewvoNhPrOaSIEhvYrXCkBaoKD1DbJ8=;
 b=emfH+eSf6t8bmsdUpLKZoIte+MzBwMfgJHKoKOLBicAyQoPMUBwiKDLocavZ3KQoMEBCmvehv0WCLJRosgziqGtk5Cssd0PI/G3DkHpVBwAbcQc2Cg2k7fC8pAPT0lKEMNc8TOCG3yOPgXdcxuIB3adXbYuWQfvbl1wzdtdaayg=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1969.namprd11.prod.outlook.com (10.175.95.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.20; Sun, 3 Feb 2019 12:20:21 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Sun, 3 Feb 2019
 12:20:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <purna.chandra.mandal@intel.com>, <f.blogs@napier.co.nz>,
 <boris.brezillon@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in
 STIG mode
Thread-Topic: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data
 in STIG mode
Thread-Index: AQHUtsavKRvL8tLgwUyF1Z5VOHqEWaXOCBEA
Date: Sun, 3 Feb 2019 12:20:20 +0000
Message-ID: <82eafaf8-803e-36a9-49ca-83d84c55537a@microchip.com>
References: <20190128050229.44965-1-purna.chandra.mandal@intel.com>
In-Reply-To: <20190128050229.44965-1-purna.chandra.mandal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0009.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::19) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.121.188.150]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1969;
 6:y1NHKvjrj+zJmePT25QGX99NXozkgLqItwP1RHQklJeFlSNabPZ+BeUHArE9zJ7g8X5B4li34D+oTFNrlNheN8WKzGaeyRcqCyXHZMBIBSpS2Yu+hnEitUTv8IaoQMbRRdMqam/3WdZE18c4hGjM/QD67g2GHR0dFkGBqL1bB6LVzWbctYvJON+dYIxPsZld/iq1Z8vySpdeqCUowDwYZ5/GX2vwICZzBjxs/5L5m5DBbC2KH+StUd4VPq7L0avKGKt9E9M7zZI2cOyaOyjOX3Uf5lYTJxDXmQVdqDIO9I1gOCIFeQ8K+3/h0mp0PPyJiFGilkjPjPa4x7cDlp/6Rg3QaHI0itzdbIgx6H//YA1T32+YVLG4yvEFm92TEhcViUQ9yCMAh2bhcRwm/JgK/PSpgdRVTeA9mKvCu6ZLKD95Y9aXy1/8Lps5D9pt7mi30Z/RELDwd/YJX48OjluFCg==;
 5:3XAQ/bM6h+t5MltJ3uUU/avOffnRrr5Wgu3zag9ZFCqmPSMMSrjJWqvtnAygXKGFekUi1bdgVHUt0UD6e6nTEqEdG+37MXNe2pQcbZset11+tpqxWC098N5SCFoeGp6FgUxUDel8cqjN8atANVRjmeRBVwXMqn6yOkmtzc2SVxdIUc4zEtDHx/63PXtP+a6naMIJYj96S5fCphr1CI5Wsg==;
 7:pgrGKnb+8WyOOGgFPE+gSTnOOekmHexFLiokA8NYIYVhHRagwWxKaBa3BPlUM7u+4yfvhKv8s0RmqRYfuyy7f3nacW3n/d5Gy7mKB3LtI3uCSjxQO3QY0zBvs0ZM6A0CppK2xLX+qlML7XtuVi/SRQ==
x-ms-office365-filtering-correlation-id: 05f4b5d5-db63-4fb4-838a-08d689d1f6fc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1969; 
x-ms-traffictypediagnostic: BN6PR11MB1969:
x-microsoft-antispam-prvs: <BN6PR11MB1969DF28AA13DAC39323D0BBF06C0@BN6PR11MB1969.namprd11.prod.outlook.com>
x-forefront-prvs: 0937FB07C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39850400004)(346002)(366004)(376002)(199004)(189003)(3846002)(7416002)(7736002)(105586002)(6436002)(72206003)(6116002)(86362001)(6486002)(8936002)(110136005)(53546011)(478600001)(8676002)(81166006)(386003)(2501003)(102836004)(26005)(6506007)(305945005)(11346002)(81156014)(6512007)(14454004)(66066001)(486006)(229853002)(186003)(2616005)(476003)(54906003)(25786009)(97736004)(39060400002)(2906002)(446003)(68736007)(31686004)(53936002)(71190400001)(71200400001)(316002)(106356001)(31696002)(4326008)(256004)(36756003)(6246003)(76176011)(99286004)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1969;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n0i5Y/GAuPvaunhmN6Mc7G5IDObsqBfDysUd2z1JCUpLDsqHYP9/RKEu+yf2sZmkB2S7zeGnzuloH53IiZH5KIQiv1AKd3ZgWt2dnVob/VajXQJOu664t9X68y9lxLvSVhsInZ3YL3sO2D2K2bB1+uqUiLlzW3NZq9RgyckNUe2lKtNfCGquME5bhtJimZk3mA4Ml/B3nGIjPYHXD0KeuGk0xgD9aXQi1mpN420OzxnU6RBWb3GRNO2Ba4fzPltmjXBiCslmL7PhGXmmr3LziwC+KbbnIHYU81m1KX23Wdi+tEpID2g6tk6owH++dEaCQAUTbYE4EKmyKl+pqDre1hSzuwNNSn9YH4rPWBD3imhjPDgT55eXGGoIEq/zE/u4bENLICvAfee49QQS8rUx5SiXzrGY479uD22XiUhWQYA=
Content-ID: <50D78FB9539C2649A43C2A87BFE657E3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f4b5d5-db63-4fb4-838a-08d689d1f6fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2019 12:20:18.8785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1969
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_042030_973602_37296576 
X-CRM114-Status: GOOD (  15.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+ Vignesh

On 01/28/2019 07:02 AM, Purna Chandra Mandal wrote:
> cadence-quadspi controller allows upto eight bytes of data to
> be written in software Triggered Instruction generator (STIG) mode
> of operation. Lower 4 bytes are written through writedatalower and
> upper 4 bytes by writedataupper register.
> 
> This patch allows all the 8 bytes to be written.
> 
> Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>

Looks good for me:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Vignesh, can we have your R-b or T-b tag?

Cheers,
ta

> ---
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 04cedd3a2bf6..7f78f9409ddd 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -418,9 +418,10 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>  	void __iomem *reg_base = cqspi->iobase;
>  	unsigned int reg;
>  	unsigned int data;
> +	u32 write_len;
>  	int ret;
>  
> -	if (n_tx > 4 || (n_tx && !txbuf)) {
> +	if (n_tx > CQSPI_STIG_DATA_LEN_MAX || (n_tx && !txbuf)) {
>  		dev_err(nor->dev,
>  			"Invalid input argument, cmdlen %d txbuf 0x%p\n",
>  			n_tx, txbuf);
> @@ -433,10 +434,18 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>  		reg |= ((n_tx - 1) & CQSPI_REG_CMDCTRL_WR_BYTES_MASK)
>  			<< CQSPI_REG_CMDCTRL_WR_BYTES_LSB;
>  		data = 0;
> -		memcpy(&data, txbuf, n_tx);
> +		write_len = (n_tx > 4) ? 4 : n_tx;
> +		memcpy(&data, txbuf, write_len);
> +		txbuf += write_len;
>  		writel(data, reg_base + CQSPI_REG_CMDWRITEDATALOWER);
> -	}
>  
> +		if (n_tx > 4) {
> +			data = 0;
> +			write_len = n_tx - 4;
> +			memcpy(&data, txbuf, write_len);
> +			writel(data, reg_base + CQSPI_REG_CMDWRITEDATAUPPER);
> +		}
> +	}
>  	ret = cqspi_exec_flash_cmd(cqspi, reg);
>  	return ret;
>  }
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
