Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D5BC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8E82467C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQDyLkWH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Dy6ghsYN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="X9d0z1mI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8E82467C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m9rfcrtLQ2JF46FJyowhY42QiaUx/MyDa1xT9O/1WS8=; b=lQDyLkWHcuEAvdo9OAqGew8h7
	4Dc+ExSotlnPEKaNuojFATCAu4dIfPnGoTgNxvKQiYLGGEz+ivku6rsZpfXhGKmKo4ud7ZQp4J4aI
	BtgInxa+hjMzmwgleJgVHQdgc58qOKi3hF7fCvhjOM6VVTM/SxoxjA55JbeO3Frg/2EZzyLsqwd3d
	ebztM8xLzcOKFGta0NXnxXmbZzwtfbieVdujg6hnowcqVLvNho3KRH/8NksF35Oga8Skt/F97+eSP
	cLjwCCb6KSLEM+uO9e8LVxJxoI5b5MvOQyouqD4T1Jp+nKACKz7FsjgpqJ9e/Mya4pmIL0rgXvqN8
	UDceCPxLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXiXP-0006bv-I4; Wed, 28 Oct 2020 10:18:39 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXiXM-0006b0-9U
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 10:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603880316; x=1635416316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z5jyUEF0NU9/b8JaUKYYGGwUYIZbyQtjAEl+wgIST8k=;
 b=Dy6ghsYNy9+sbx6ffdy33FnFsgfEJuAF8R0joBQemxFH3Ts4LCV6cqVP
 8nEhDz9OWagVM4Le6x0oCC+e5rstPppqhushZThomuScKY97GDo1QaUgB
 CRubTL3yqXT2NcePKienjrKyMQ3lZ1QWpGiKYAg9ABNZi7Hf3pC7KHjA2
 WCMfw27u+exQk7tpZPRLTrq0aC69Im8j3VniDdPk+fVthUNqbLoyMZeXG
 ya2C//NT5TBxJf02SVqeXi9nSyrpFPFedY/yyUfoiimCm0/4Z3NSITAhG
 yoOd0RkE3rm3fAFhaUezflzAKBRlEMaPIuS12pns+GW3jpeSnCX7QXVj5 g==;
IronPort-SDR: hdThovlQTOusEQY0IrFEi4jOMStY/DzwddaPKLbT7t9VPtc5mKKG+wTib7Rhb2ODFiI+s8Eipt
 z3MR5PhmgJ4jPD3iOQKsO96GNa8jK+mDSRL2ZZu63sraAvdq675fKiCL+BkkG+YYuM4cyBpu0L
 dFs3Rxf5gOTsbuJGLrVntfgmttNPbcRfNsyCO3crjl/5uylPZr9bjOaVZuXCWk8fvAbrVnC4kR
 QwdveHTvBkDifxe4g5gwQC+sznTAJiwQxUmUSHgYTIfWG0RRf5KDVOUMq9nDkvluj28LFob+68
 ObI=
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="101244737"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Oct 2020 03:18:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 03:18:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 28 Oct 2020 03:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsCCAG3qiypm8BXZFWHmJTroqgkzrX1jo90K/wfiIyfupaT17RvmTNTOFha4Vu+EhTSK7T9CjrDfpSffTnYkz7fDRjU/rH2fusfzbQLL6Jyz8skSQgAm9RHJt8pwB4liR/Ft6SJql5In5y/BU+3FFyF/Ok6D9RLzKJevyzCYIa5vwn9bRsfzsX8H+ivSb4ruqvXbGjZQ6A1Euk+VkM/Larbyz03ZYRGvP/pNQIFHmLdmFc3iNRd6k48cj2q9+eomxBySSEkkWSivkpggC2bYHnYasY9xaejPov4unZltw6YyvtS0Xw0rWURsKHlITM8Jxb+UWGQv8SJfM6zNGLWITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5jyUEF0NU9/b8JaUKYYGGwUYIZbyQtjAEl+wgIST8k=;
 b=fuFod6siNb6ysdDbyWmoP8YZt7VwrVl8ric9FNSgW6rte86Qa7SYkw515wl01G3eZ3iJwiy03RwbrdtV7gnDp9GWBEeWVrSVsY+m2xaHzIuG4ZLDQda0/xLf36NAC38HjB0LzVvWvmtcGeEv9JuWPCchllHEV5r9UrJ5ym1nrQOqJf2mMGDWNChkFpHHMU+0MuL+e/u52qv9Lt5ksVZVu973JOMallmBUE3PMQyxRxXuCYH0L9IDf/Fm+xRdZXmwffY4s2kazAMcatn6na9yqyC6Uo30l4VVMu/QfFsmIjVIJulm6KiLoZ+cIwv3KL9CM9kBbUQhhfSyuSx+mtv4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5jyUEF0NU9/b8JaUKYYGGwUYIZbyQtjAEl+wgIST8k=;
 b=X9d0z1mIUFx9m7UT2+RpHq14Q3myKxMfS7hPcZYIBUgfkI+PE6IWUHFL0Ee5Du7S/Va7fWBtf4LR9e2PQqZ0/+ZNp8MtlCR6MIxpvsQVC0RI0o4PX2lGuZmyPLJmnPVone0FP5z01K2UGPe45/SG8ACNsi0YfgiJKUSyP0Tzr2E=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR1101MB2302.namprd11.prod.outlook.com (2603:10b6:301:5a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Wed, 28 Oct
 2020 10:18:30 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::413f:1b5f:5cec:3bb4]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::413f:1b5f:5cec:3bb4%7]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 10:18:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 4/7] mtd: spi-nor: core: add configuration register 2
 read & write support
Thread-Topic: [PATCH v4 4/7] mtd: spi-nor: core: add configuration register 2
 read & write support
Thread-Index: AQHWrROufKem0XTf5EyIwQkm7wZSGQ==
Date: Wed, 28 Oct 2020 10:18:30 +0000
Message-ID: <a6f65077-f435-4c8e-994e-38e2f5d437b1@microchip.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-5-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1590737775-4798-5-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b0baf3b-2eeb-4ebf-8b34-08d87b2ad165
x-ms-traffictypediagnostic: MWHPR1101MB2302:
x-microsoft-antispam-prvs: <MWHPR1101MB2302B5C766407029B4D1B107F0170@MWHPR1101MB2302.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kaN1uAtbtzXccxxSBl+RuWT7PpMMHnYf3y8w2fO4xbnvYmSKAx+5nUhYV+oUNWhdJgqCQpCEXsBRMULQzjX3ez1Xz0mIQn0IewtagR0LPJTSpQaJeUgM6OC66oI8qKRV9ST3RZVK80evbTGS2x++kBRZJG4NoILkymaFsYx2nCdntCynoBX/BeplCz1QQKf2l+pZ8SVTgr8dFfK/kjiBgixp3+XywsoLJzi5Ojh26EXv/h1z/phNDBBE1QEqkXshLWkMGUwwhSkJD6+CddQy+NrmNfr5VF7bp9NxoRx5HUU6hsYlwTho9e9f2VMibA+4AKtxHOFomiJhDY/kR85NtIvjmcMXgoMq/DgAzME6jIzCx5OhEqZGVp+3ZUtKdmk9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(2616005)(66446008)(478600001)(6512007)(7416002)(76116006)(86362001)(54906003)(316002)(2906002)(66556008)(91956017)(36756003)(8936002)(110136005)(31696002)(6486002)(5660300002)(66946007)(66476007)(186003)(31686004)(26005)(64756008)(53546011)(6506007)(71200400001)(8676002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: q1FmSPUWENbq8gCyrdt1wWHjKYeC7YOl8Qv8vVJMqaCVUQTatx4NDd4kPjaygmyonk2V9VxWNygECvkvWaUQYzfynfsckGSsxphUiFZ9Ru5bGTkdZqdRv91+VXNr2UWq4HH7Rb+VlsXcFqe21llhDRUs+uEjgHLe4B+UPbNe0PzGZq8NqXCSymLY9pg22GFarXDriHZdN+h0VSathPbX/pmS5Bj3V0beJ6vWxEUG7VW/gASk3H59Lf4sI70eVvRgamiy9tmhLmgRWznLieOuSCXuaCP3RTRAN63u0wrs4KpOJnEUup7xXNcPr0/6+iJtU1FPp96P+JLaffioGOBSOrJ/34e4cFHUupu5MY7iNKqyoyHU5ZR1i9UPKDV3MzivXhmwhUq5sTzQINDQkKoXl1C+C4QnSJSuMJTs9m+hkd/GtX0alU03AmIC1OEwXKMJlTby6o1gQ1SVUdZAcXKd0cGE+0OqKnoNtEyLkEKttqnLYU+vaSVEpYDcoGLVjIOtMIF/TCNJeRsoOpj3LckkThhcc2eGXzSRnl38qcDGZV14kO8Yod/U4aOPbYQKtFiFeiNaxSHjXc3Ig11Z4UYILVy3zuR393HKaIG4gDnDIkCMNZg99/x2XUVTf7fzDIH4mJsFCgZEs2TMnDReTqFWmg==
x-ms-exchange-transport-forked: True
Content-ID: <F9FC21D946428248828746ACEE54FAD8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0baf3b-2eeb-4ebf-8b34-08d87b2ad165
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 10:18:30.3546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNalHdPT6wapfaBN38hvElQQDCkTgBUtK2XgXb8KkOp34rC42OLGohNzjmB8rhuXpsArnoBaUKYgYSZfQXSiSNc28XVi5E1jWf9k/xMDlF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_061836_529983_A7B83CA8 
X-CRM114-Status: GOOD (  22.54  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason, YC Lin,

On 5/29/20 10:36 AM, Mason Yang wrote:
> Configuration register 2 is to set the device operation condition like
> STR or DTR mode at address offset 0 and DQS mode at address offset 0x200.
> 
> Each device has various address offset for it's specific operatoin
> setting.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  2 ++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3799417..fed6236 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -269,6 +269,84 @@ int spi_nor_write_disable(struct spi_nor *nor)
>  }
>  
>  /**
> + * spi_nor_read_cr2() - Read the Configuration Register 2.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @addr:	offset address to read.
> + * @cr2:	pointer to a DMA-able buffer where the value of the
> + *              Configuration Register 2  will be written.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_read_cr2(struct spi_nor *nor, u32 addr, u8 *cr2)

spi_nor_read_volatile_reg() please

do we need to pass len as an argument?

s/cr2/buf

why do we need addr for register interactions?

> +{
> +	int ret;
> +	u8 cmd = nor->params->rd_reg_cmd;

you'll need to redefine to rd_vreg_cmd.

> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(cmd, 1),
> +				   SPI_MEM_OP_ADDR(4, addr, 1),

nor->addr_width?

> +				   SPI_MEM_OP_DUMMY(4, 1),

nor->read_dummy?

> +				   SPI_MEM_OP_DATA_IN(1, cr2, 1));

SPI_MEM_OP_DATA_IN(len, cr2, 0)?
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +			ret = -ENOTSUPP;
> +		else
> +			ret = nor->controller_ops->read_reg(nor, cmd, cr2, 1);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d reading CR2\n", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * spi_nor_write_cr2() - Write the Configuration Register 2.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @addr:	offset address to write.
> + * @cr2:	pointer to a DMA-able buffer where the value of the
> + *              Configuratin Register 2 will be read.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_write_cr2(struct spi_nor *nor, u32 addr, u8 *cr2)

spi_nor_write_volatile_reg() please

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
