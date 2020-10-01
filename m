Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175FEC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:35:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8887B20738
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZfYg8sdO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Jurj4CvM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="uALpnx+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8887B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fR+qAub6LiDjdhZ0+N6L+u82xilOewiSV5X3rnn1QUU=; b=ZfYg8sdOZwTRtOeyozChd3+0W
	7ObEfvN9YIYGC3DkfVFHZ4Q7ArWqsRK6d7kMPwJ/qFjCjz8Nad0BWuUCX/pumtyTNfBsRX5rHda3H
	gZU2LoT5qixvpT3c/6X7oQk9Ee0D6D+Vu6Te0D7knnMkQwjvXd1jD1u36TMxCM4e1TeU5/YslP4p/
	y3T8Za/qLDMtuSJA6Wk45SKiab+vOeeNDrVh28bQ7y9CRSvhSmBUKLJz5aCpi0L4Og7VOY3fupefO
	xLF6KgwDf7ulq3VWI6td+/wvDToGEqHbRcpt4MzHQwtqzqsSjBDRvM1tJaU8jf/ZLoZe/GYnUzZk0
	BW6rmqFCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNu3V-0003ch-KJ; Thu, 01 Oct 2020 08:35:13 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNu3S-0003cA-Au
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601541311; x=1633077311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/N+c5UxjAOfa9YrPOWTFSTyzZjfY8cOum+3oKSshtWQ=;
 b=Jurj4CvMXL8x9tVwZYeYXCzOejubNEdagyatA98KcDKefcAtIbufnQ5Y
 gEFN3LnWiayUZgkhjHuno8OzApEc/Cd/SQ5NpiNqIsnBHAaNvpND6/Md9
 +HD++VE0+wGox/Y/OaLj2+dhZ9+PgznVOkgx1XelmuDd2mK8AzJOSCKh1
 GotWLSqFL7ZXGL8JaJ/GK/hV6hDBh7kBJYCFgjXPMWFPEgsZuhQa0sr/E
 5ORz+msPf3P/qIiRPb/mDec/JTvudpwSLhOmNXql7FuBFeesjhUM+W09z
 Svc2Gx6KPhZT3Nl88IK6XRKiJDtO3Slbd17uDerXgpRpSi5sZo9jEz2Fs w==;
IronPort-SDR: SitEvLsNnctF74WmaN3bGlD2faBjHvae45YlrhtH62z7f4G5Utl7kT1V7ABHJBRj/VSjKlJ1lU
 jb/mp3ZFh8FTtoWqChCOEQqwZuv+69mUkvf8hVtkX40ztDTf+mfvX7s/MAxj4SzIwc8xuqESR+
 rbPg1CAft0y6hpZfFOdLCF5qMp9c9ZU2sGcCRRUjt/bw6NVxv74CplfTKhg9zzVYuIIqzshDjv
 rtskvaGvOaCUVinE80El7bF+WS4moDoYAy35kqEj/2FCn9xrXEXp0EIPmDCvlI18cXCv9f5JQy
 V8c=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="93044372"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:35:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:34:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:35:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWi3jH8Vuhgdf4aUymylg3xAkGGbI4sEhLUpgm+3k/Epi/RdKNeIQxWdkYrYCDEZEYhvcwoIZZ0q9UFnhW/x46O+z5xOnl3VIAN7pzgsVxJYxZ8QAHHZ69Qrtd0OKLbIA2Fsen95/nhcsQJCLbXnKWsdhWoKHW8gCTZFi+ztCUGITtGo9u0BQNPEp9WplxpXPVn8c6E0W5xwocMZw4ABwhHrpCbL2lM/47ly0PjekfEaexKMbIgB6p68hzBZh+B7w3blKcPMU/75IF2B2UyMEjH0LIxyOhDZsd/bPyhaP7XTj+2D+Tt2rz7fmNWT/lyTkEkkKfmZGqFJRfr8fs7UCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N+c5UxjAOfa9YrPOWTFSTyzZjfY8cOum+3oKSshtWQ=;
 b=cgh5huk8ZXS1J6jo10alM0ah8e3Za5YDYvTcSeQnCRUfugR3yNqQmpt6Sm2sWlIna4lC0Nao5zsN9T7LijnZdD8cGHig2DrmTRfmb+bIbN0zv/BgiBRgCj4zQx42ID+xkYmwpKmXW7eJ6MDEEVmxOcinfkwHcLS6VvmNJlY1L2ZzWOuFbCWxtBxIGFLyDr9x/xyZxfN9REWhzr14SircPVMKTTQ71JBOpbjPflP734UcQiiYsYw/HVabOQw4gSuNxxAua0YanbMZdPfEWhmskXobxHBDGIye+GusrHKRD3ecSv8/QNf+RGVHsD1Ig84KN6TAs9xqRoSLXBhxydoZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N+c5UxjAOfa9YrPOWTFSTyzZjfY8cOum+3oKSshtWQ=;
 b=uALpnx+ELdZB8xZnXFQmONb831lpDuMlJ/zz8c15l24IJgV9MH+sRuscKe1+jLcmFvQqwQi1+9g29oNqh99VnaMjtC4k52sVT6K5Xxel9YIO5HOPGkwJes/acWvsJgkC3rGLTO+vTw6AbDPzduVi5yqDAkvkgG6ysi4+0l622GM=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 08:35:06 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:35:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 14/15] mtd: spi-nor: spansion: add support for Cypress
 Semper flash
Thread-Topic: [PATCH v14 14/15] mtd: spi-nor: spansion: add support for
 Cypress Semper flash
Thread-Index: AQHWl83DTXjWYxo3bEmDQEKhOT98Hg==
Date: Thu, 1 Oct 2020 08:35:06 +0000
Message-ID: <b5663e72-b67c-cb2c-e46c-62262a65cd44@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-15-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-15-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be4a4f2a-4ff5-4bc6-adce-08d865e4e676
x-ms-traffictypediagnostic: DM6PR11MB3498:
x-microsoft-antispam-prvs: <DM6PR11MB349889428FB43D3D43BA9187F0300@DM6PR11MB3498.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wX6gozdm0ES934kOSH47195rcpFzKacFXaw7aamgQCa27xPcoDK+3ccyrg2r8XxGXwv/PdcHj99pGp+le88XqcGBObo2FcXgQA6GBhtjl5Dcv3iYlh6Oj5hiQ95wnYKe/xU9BV6Ex1JCV2OyngbrV4phGd5NPbx6aLiv4LDdCJvq0ST4zfU3CJKNNzB/I/5igfGixvdwZlc0xz3X8xQ+ApQSFhx/5DYfBjx13+/G5Y5tUYOvrAwqaAMqkJzKFCNOWo8avsTCNXb7LBRHTWBQjvteLDocDqLZXmNryT6WGRuW+1K33ADuaWw+xZrw9NHN9bpqGActjZn8Ac2ppfe0NUILPhYAM+DWJkKar4XHA7iCb45QjDMI6QqS8tRUsULI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(366004)(376002)(136003)(6506007)(186003)(76116006)(36756003)(54906003)(110136005)(66946007)(316002)(66476007)(64756008)(66556008)(26005)(2906002)(6512007)(5660300002)(8676002)(71200400001)(31686004)(53546011)(91956017)(6486002)(2616005)(83380400001)(478600001)(8936002)(4326008)(66446008)(31696002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1wWlzpY1caRYxXhynvKvPZqPgKlstmakwfQoJ8l0RM+GEW9W0/urom3u8NQUigoY1QE2deGyiNSFtPn/0c1f95vqr+/VcpRnC0Juog/9t1xhhuX9zQyCeYC0g998kC5dqkNdSMh05hMEYVns7G5vsGq/pO0QEAjS2pesAJBB5n0KubXSjFkOnhhQY9J4BN1yun21CSFNg1HNw3gK6R3BPFdFDSXBDoHf4ESlFKk4DFowFEzMb6sZ1TOwc6WsHDcQwDYc/ZKP1II+FnTscRGY4RpO6OH6VQ1MyhND+UXV0aBZ1G/2aobKXNJ9puM5I1TdobLUEhi6XF55+Pwwc2RWl1+K8Lsgp+WQZuOKqlmjXOGUcvqKkp+1xN73ttM4HINVemsNeEKHYzi72ja8wxlBjh9Cgt8V4vsjCZOgnp+3+pW1XD+Xgmr0v/H2iYSYxLApNxkzsfOXa5cDt+SkCCYi0oHXbiy4ma5giRIgGL/GBWLIdQCJ3dRCIttuEfWBK1lUI0jgO1zEcjsNCWXkUfIXEucbz15FTHnRZ30bBsktktHLMGFQsb9BVzH5GtFmELqikN9vFEFZYUF9JB/4rxKvHfLkC7JHxSRRPap+Q9b7YD56tDaUn4KBf2N099IK9R4bLQf3ajMz+0JC626lo41mbg==
x-ms-exchange-transport-forked: True
Content-ID: <1729137663AEEA49B24A03F3FA302DDC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4a4f2a-4ff5-4bc6-adce-08d865e4e676
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:35:06.5661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mkoSJAPGd07A5DdJKTjMU0ZxU8MCVp3q7s8ttMMcU/pMsX109RvauAHNsWm57/X6Rdg3vS5oaGQSLgoa10Sv9IjYGCBN7B3dOxYRix0AITY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_043511_018491_7CB02B59 
X-CRM114-Status: GOOD (  32.78  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Cypress Semper flash is an xSPI compliant octal DTR flash. Add
> support for using it in octal DTR mode.
> 
> The flash by default boots in a hybrid sector mode. But the sector map
> table on the part I had was programmed incorrectly and the SMPT values
> on the flash don't match the public datasheet. Specifically, in some
> places erase type 3 was used instead of 4. In addition, the region sizes
> were incorrect in some places. So, for testing I set CFR3N[3] to enable
> uniform sector sizes. Since the uniform sector mode bit is a
> non-volatile bit, this series does not change it to avoid making any
> permanent changes to the flash configuration. The correct data to
> implement a fixup is not available right now and will be done in a
> follow-up patch if needed.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 160 +++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 8429b4af999a..dc6b14aba405 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,161 @@
> 
>  #include "core.h"
> 
> +#define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
> +#define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR2V               0x00800003
> +#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
> +#define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> +#define SPINOR_REG_CYPRESS_CFR3V_PGSZ          BIT(4) /* Page size. */
> +#define SPINOR_REG_CYPRESS_CFR5V               0x00800006
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN    0x3
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
> +#define SPINOR_OP_CYPRESS_RD_FAST              0xee
> +
> +/**
> + * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @enable:              whether to enable or disable Octal DTR
> + *
> + * This also sets the memory access latency cycles to 24 to allow the flash to
> + * run at up to 200MHz.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +       struct spi_mem_op op;
> +       u8 *buf = nor->bouncebuf;
> +       int ret;
> +
> +       if (enable) {
> +               /* Use 24 dummy cycles for memory array reads. */
> +               ret = spi_nor_write_enable(nor);
> +               if (ret)
> +                       return ret;
> +
> +               *buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> +               op = (struct spi_mem_op)
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> +                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
> +                                                  1),
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +               if (ret) {
> +                       dev_dbg(nor->dev,
> +                               "failed to set default memory latency value: %d\n",
> +                                ret);

Why do you consider the message important? I'm asking for consistency
reasons, below on the next exec_op call there's no dev_dbg message.
I would get rid of the dev_dbg entirely, the error code should be enough,
but I agree that this might be just a personal preference. So, do as you
prefer, but try to be consistent across the code.

> +                       return ret;
> +               }
> +
> +               ret = spi_nor_wait_till_ready(nor);
> +               if (ret)
> +                       return ret;
> +
> +               nor->read_dummy = 24;
> +       }
> +
> +       /* Set/unset the octal and DTR enable bits. */
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> +       else
> +               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +
> +       op = (struct spi_mem_op)
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> +                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
> +                                          SPINOR_REG_CYPRESS_CFR5V,
> +                                          1),
> +                          SPI_MEM_OP_NO_DUMMY,
> +                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +       if (!enable)
> +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret)
> +               return ret;
> +
> +       /* Give some time for the mode change to take place. */
> +       usleep_range(400, 600);
> +
> +       return 0;
> +}
> +
> +static void s28hs512t_default_init(struct spi_nor *nor)
> +{
> +       nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
> +}
> +
> +static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +       /*
> +        * On older versions of the flash the xSPI Profile 1.0 table has the
> +        * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
> +        */
> +       if (nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode == 0)
> +               nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode =
> +                       SPINOR_OP_CYPRESS_RD_FAST;
> +
> +       /* This flash is also missing the 4-byte Page Program opcode bit. */
> +       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP],
> +                               SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
> +       /*
> +        * Since xSPI Page Program opcode is backward compatible with
> +        * Legacy SPI, use Legacy SPI opcode there as well.
> +        */
> +       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
> +                               SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
> +
> +       /*
> +        * The xSPI Profile 1.0 table advertises the number of additional
> +        * address bytes needed for Read Status Register command as 0 but the
> +        * actual value for that is 4.
> +        */
> +       nor->params->rdsr_addr_nbytes = 4;
> +}
> +
> +static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
> +                                    const struct sfdp_parameter_header *bfpt_header,
> +                                    const struct sfdp_bfpt *bfpt,
> +                                    struct spi_nor_flash_parameter *params)
> +{
> +       /*
> +        * The BFPT table advertises a 512B page size but the page size is
> +        * actually configurable (with the default being 256B). Read from
> +        * CFR3V[4] and set the correct size.
> +        */
> +       struct spi_mem_op op =
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
> +                          SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR3V, 1),
> +                          SPI_MEM_OP_NO_DUMMY,
> +                          SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +       int ret;
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret)
> +               return ret;

no need to wait after CFR3V?

Cheers,
ta

> +
> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> +               params->page_size = 512;
> +       else
> +               params->page_size = 256;
> +
> +       return 0;
> +}
> +
> +static struct spi_nor_fixups s28hs512t_fixups = {
> +       .default_init = s28hs512t_default_init,
> +       .post_sfdp = s28hs512t_post_sfdp_fixup,
> +       .post_bfpt = s28hs512t_post_bfpt_fixup,
> +};
> +
>  static int
>  s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
>                          const struct sfdp_parameter_header *bfpt_header,
> @@ -104,6 +259,11 @@ static const struct flash_info spansion_parts[] = {
>                              SPI_NOR_4B_OPCODES) },
>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>                               SPI_NOR_NO_ERASE) },
> +       { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
> +                            SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> +                             SPI_NOR_OCTAL_DTR_PP)
> +         .fixups = &s28hs512t_fixups,
> +       },
>  };
> 
>  static void spansion_post_sfdp_fixups(struct spi_nor *nor)
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
