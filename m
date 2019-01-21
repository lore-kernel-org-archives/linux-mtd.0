Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F76BC282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 09:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9D22085A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 09:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y08DXFXe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="CMgVxL5z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9D22085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8iBmNQMBjGUDApb+PRI79GPrfMB6W4IYz7tAL7bjsg=; b=Y08DXFXezi6bEg
	+HfArvxDaFmEaRq3r5YzFqJS8NTQcnDXp6jwsGRBt1mA65Jn5szYkLtaHdcijiJoolOh9oe+3Vsm1
	26ygKsKK2JTYE80hWRu1H9+k8+Ijz52TcvgPIpXtQiOCtU1F2Bf+18FwMj/L6ln2WJZOr1JVBjXP4
	pgQdR5a83PrhfHbjTfljUdklwVEhRTEeffqNkOCYLdI0JoM198vZbqtEgJ+0FXUxONfqHkmP7QToB
	D7taTe0kX6wo3nFodlmEk7FNCgb3kgQSYxtBMFbf6XEppPkoOt0BpDSl1bv26SQG2a2/L69pBydl5
	UvwiYMz+unaB6AGw9vQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glW1K-0008GH-Jd; Mon, 21 Jan 2019 09:37:30 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glW1G-0008Ee-Vb
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 09:37:29 +0000
X-IronPort-AV: E=Sophos;i="5.56,502,1539673200"; d="scan'208";a="22846784"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Jan 2019 02:37:25 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Mon, 21 Jan 2019 02:37:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5D5mI93SZIikoPsQBmgC0+wDvabakb3w8/+y1cH8nU=;
 b=CMgVxL5zqtXqDE39XxLBlffNdXXrh8zQfZ1Fo9wlJxVtpdtuDLQmA8T4hhWEW08EAcfPnavFtWu1AitKsHVFnep+kp55uXAWO3P2UbaU78pqnFBVSo02yKLLYWvhHSvKItw+l1grUXwQ8PId8CDWFKPy5aUrqQsSRwe6TJeMk8o=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.99.146) by
 BN6PR11MB0017.namprd11.prod.outlook.com (10.161.155.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.31; Mon, 21 Jan 2019 09:37:24 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa%4]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 09:37:24 +0000
From: <Tudor.Ambarus@microchip.com>
To: <purna.chandra.mandal@intel.com>, <f.blogs@napier.co.nz>,
 <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in
 STIG mode
Thread-Topic: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data
 in STIG mode
Thread-Index: AQHUk1NWYhjGe5LUyEiH2UgF0if0A6W5sxuA
Date: Mon, 21 Jan 2019 09:37:24 +0000
Message-ID: <c627314d-fdf6-7e69-7c54-03a513f563fc@microchip.com>
References: <20181214021516.43609-1-purna.chandra.mandal@intel.com>
In-Reply-To: <20181214021516.43609-1-purna.chandra.mandal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0502CA0028.eurprd05.prod.outlook.com
 (2603:10a6:803:1::41) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:103::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB0017;
 6:1FnJ3r3ybtRJPFNNPYRzxPm8JIUHzLjfZKsjV+ZYPgfaVHu4ZSBMyUrMwo1ALXlugkokN9v0+3fH3cLi4IFm5JYkWlINOMgzaDmWVYooO8uY/JSWyZZcAtwauMxCEXQerBoXKyWcLfhY/jChgZ7hMgtFlMTlAGW+0h6sGqwPSOngQ8jPoQUnoLLJTtmAP9YB54GB3uTguFXjyVFJ41RlrNkynmxk7mVGBH+YWlDEhFfb2NEcv48hzte9zkrKLRHm0lg/aRieyxZIKBpXaMJeRWfuwIYyBMA/3aNwyrCVYB+DuK1zgsXiM/voorJ7LYaUywFuAdKxnvY0r/0DQPtXXy+TZNNhhWAmuDsNapDkOsuWw9BXBrXYTunDOrUJ9qbY3HL5RjBJqn9xNn2WXkPERoNl4PoqBDgX41Hj6mz2JZQTDBXuonGjEIPDtnBtIfZgCL5WbU6A5h4u5OT+z12azg==;
 5:gG8fjpK4YVnaV6I6RUgBjX9g2nRrpSZuJiXRvDh59yTaAowfUQGUd0EnLQzcNWS0ixDJsNfzrGdyBMs7U6865+Ioeh0UR1tuN5NIfkPa89r4POczvqkU21fx9Er8OBAOUoCcJo8WQ/Wnwdnh4xkR/TsYHRhUXKwJovkgq+It6xUvgAOJ1qeqKeXdEDzuiC+y/WOGlgF6Y/xFhgCMA70okg==;
 7:zKuMT937JpMExSLFVWe5bxcW3rLDDn1ApGecF+eY7/N2IrcCCy+kXivgwocoOobUYXRCoMwA1Dpve+KYcZep3EOK96HdS8nZZregEzNtT4XYDpavbRRPXp/FhAcFhZirGRoFwTi7s+EXm0rar/dq7g==
x-ms-office365-filtering-correlation-id: 4487b4f6-eef3-49c7-3468-08d67f840c60
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB0017; 
x-ms-traffictypediagnostic: BN6PR11MB0017:
x-microsoft-antispam-prvs: <BN6PR11MB0017DF1B48D1FC1A78BBBC63F09F0@BN6PR11MB0017.namprd11.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(54906003)(31696002)(7416002)(36756003)(106356001)(99286004)(110136005)(86362001)(53936002)(316002)(97736004)(31686004)(72206003)(478600001)(6486002)(105586002)(8936002)(6512007)(229853002)(8676002)(2906002)(14454004)(6436002)(66066001)(68736007)(81156014)(81166006)(386003)(6506007)(102836004)(3846002)(76176011)(39060400002)(186003)(7736002)(305945005)(11346002)(26005)(2616005)(476003)(446003)(71190400001)(6246003)(4326008)(14444005)(71200400001)(6116002)(25786009)(52116002)(256004)(53546011)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0017;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DD0ZFCQ1CpITeeHdz9MfrKOio76LiVk36OBwTpQxEHaPhIP3Z1BtirvCDshx/SQb5pUn8V9kqamXRGaT5WhwNVo87b/EomfsZVL4iRTxriYQQeTeij6Dxd5b2rdfPMbv5FkkBTS1qJC+c11uknJuFjZy2gBRnM8nOoDMQb9JzS5qoXKhGGDKI9qTzF5VdSMJAVIPsSSZl7jZ1jT7jenN8Oa2vZh3ETLTKzDdF11+h6J73Ss/MXTingxdaUQd47hpH1pLTslFt7DN+Fg8PqWoCJ9jBBvnAyaR5+O9h6U16LgDapLhlnzbdJTcu6SSXr4fM1/kF6L8vVcnJKWshkfySwlMTMybnZeB0usxPeIgMGOWu9hgjLza88/trTdbtGHf4QbCbipZqsXFhh0gXlp12ST0ls/WASLKW8rYvZu47bg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <6B1B585C65BC6A40853F1315AD1E0952@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4487b4f6-eef3-49c7-3468-08d67f840c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 09:37:21.9429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0017
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_013727_097220_775DE326 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Purna,

On 12/14/2018 04:15 AM, Purna Chandra Mandal wrote:
> cadence-quadspi controller allows upto eight bytes of data to be transferred
> in software Triggered Instruction generator (STIG) mode of operation. Lower
> 4 bytes are written through writedatalower and upper 4 bytes by
> writedataupper register.

Is this supported by all versions of the IP?

> 
> This patch allows all the 8 bytes to be written.
> 
> Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
> ---
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 04cedd3a2bf6..990934387fea 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -420,7 +420,7 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>  	unsigned int data;

I know that this is not your change, but data should be u32 and not unsigned
int. reg too ... probably one should submit a patch to change this, I see that
the same error is done in cqspi_command_read().

>  	int ret;
>  
> -	if (n_tx > 4 || (n_tx && !txbuf)) {
> +	if (n_tx > CQSPI_STIG_DATA_LEN_MAX || (n_tx && !txbuf)) {
>  		dev_err(nor->dev,
>  			"Invalid input argument, cmdlen %d txbuf 0x%p\n",
>  			n_tx, txbuf);
> @@ -435,8 +435,13 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>  		data = 0;>  		memcpy(&data, txbuf, n_tx);

You should limit what is copied in data, similar to what is done in
cqspi_command_read():

write_len = (n_tx > 4) ? 4 : n_tx;
memcpy(&data, txbuf, write_len);
txbuf += write_len;



>  		writel(data, reg_base + CQSPI_REG_CMDWRITEDATALOWER);
> -	}
>  
> +		if (n_tx > 4) {
> +			data = 0;
and then:
write_len = n_tx - 4;
memcpy(&data, txbuf, write_len);

Cheers,
ta

> +			memcpy(&data, txbuf + 4, n_tx - 4);
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
