Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB1AC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:39:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A98920780
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:39:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zJoE5Dtn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kKzQHITC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YJGhXnDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A98920780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vtNJnVCodx6oakmlwc2xqeJsFbgsj0/hU/Ilu3IPFzU=; b=zJoE5DtnxHC76CeMORaCRk6cp
	oSOvag2P/rHYJXeIJyWoeMv48x9sRuQxynVwze3+T/Jw6A+gJJMVed3F8k1irBCi9K6FFu9GrFnQo
	DLhsGUggEnWTecGQ3pLwh/BQGsEi5NZW+yYNhYaAnhSLUBKTu9SX7LpM3rENmfD1IZR26vufdaXIy
	R3QIiU2VMWO6bByFxx3VgIH2nQrcTFX7jpzulFuATHPorc+p1D4zKUkrQNKDPG9b2eXV9bAu6/CHs
	ij6ZB8R9xbGLryVZzxieQ+TI79Ra9RrcZF6gM/WVc7+OtlP+egf5ncAmLjosbkWqlEjNU+q4LI+/J
	pfwcqhj4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNu6u-0004GL-J0; Thu, 01 Oct 2020 08:38:44 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNu6r-0004Ex-6J
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601541521; x=1633077521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5eyBYPWYCYtjUkmT2hxl4sZYifrTZD5RLu8NUMrovLM=;
 b=kKzQHITCcU2jK6yaqS5LxdIa7Br7n0SMK0azruPAbeCGLoZo8qIQc9ae
 4ZFjM7AjRRI+0QSEDbhqHpLvGxgsnnKimP27V0DGRgwal61SQtmsoMfUk
 Vu2eAQz8m+AL7foTPTsAjehDYW0t8gqGfA8Ef4NcWP9oS8E7J7wC8pTn0
 uR2aAeF0aDTZwEFc8qBRXLLfBbdl9pf+/nMdyzqyn5X//Lk6z9h6aPzfc
 vAV/q92ibW8RipafaR0cOH/wZt5s0gSCQO1iCANBMfqUM4K2y2MMinajx
 wFCnVPqOXae8vxoc7af6zCHGum/8NWYAM6nmB24xCyVFf6y0GED2trydW g==;
IronPort-SDR: a7i5zr1xlS/RcbQMERMzDbJE0pM3KS383TxfHcnNtVi4vSLpcXIwYP4YE6vDZWWb+BobVYVz20
 PPFkKKspyxTQzBwzooaO+o0LC5pWuZFRqaFquSNKu97fi6L9nc7tSLzhBrwGV/AqSRD6y8io1W
 j6X7gF4rFcG6okoqDF+49NNuiu+ZRqSZocWupMVr+TYf2OS5XV76CNiOyCqwxnqffHi/yy6L/6
 +SEC5yzaK46tDzIKHwi/4Csp6J42ZKbk6jmaDHV7+mxrKmggvEnCAlBD2Up/6yr7UF0rtA7znS
 uCo=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="28348614"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:38:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:38:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 01:38:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBQiyZtPcbGBBr4gRJzruQXKW3zWZfTJ48SkGwNUIi2WRXX3guAKvbYuI6H4uZGhmXWdOVG+OKTUcZRun/+qZMSc3h6PZ8+/T0XW1vjwKuLKSBfFjjpQGx80n485MS1zy6N+Mov4M/45ystXgEmUnvERKMOP3GzRsa2+5gVxpQYyKJwRqpeuVddIRYwaBz0WGc9IHr8Vgpi32nGV7y9Smk3C033UCRJ9/tqj8eoxSWyipN0gFEYy0eR+RNqGD0ROT5jiNSAA6YqDR+4ojbiUeRAtTNEa7MjQZuko7iEITDcKw48L2V5J8A+2UYrl7LyrzeiBZLoa8x6FOiSvGQzuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eyBYPWYCYtjUkmT2hxl4sZYifrTZD5RLu8NUMrovLM=;
 b=BL2Y3rWigvlwjdUddfPd4G3wTkqZwRXAuzAQbu4Z73IqGbncSS3N6dt0J7PzOXfJfq7lsNgM/dVAr+pDhPlggXK7oDcdS77IUsOuPTVyxyP9mdFHZ2hhvcY7VP3muwRZ4G7+jooTlTca8r4NM32nWVzIYRZiuBmu/Y3HuXoF1iIxI9oUSMUdpttp6kwRElLTtJ/cxT2XDVfKrxoR4Q6JmrERiNkafOZWea4eb3tx5ehiKKbm6uMMtNgsq1n/14wiLTyM44XZTVsSkJs1R7afQ5GFpbgjONKoIQhz4gGF/Zpvlp33JBb8ygPvYfcbOJ8R5Cm7WtJEWfgyaTwzk01ZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eyBYPWYCYtjUkmT2hxl4sZYifrTZD5RLu8NUMrovLM=;
 b=YJGhXnDKqkO8JgHg6Yv4ec2YVHPBhJ7K5+c5AuY0qpvKEHOZkFwXAXv4DofQC8mLTo1t/lQtjMSXA2TXknDpz0hQqNATWwa3HvsbKHz2q2JftBjXP7y4mpvyU8cxMCMCJNn7GxMADpbfr91ZLvImycH6GKNTZk0YyeISQ7fel5g=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 08:38:38 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:38:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 15/15] mtd: spi-nor: micron-st: allow using
 MT35XU512ABA in Octal DTR mode
Thread-Topic: [PATCH v14 15/15] mtd: spi-nor: micron-st: allow using
 MT35XU512ABA in Octal DTR mode
Thread-Index: AQHWl85BnKqqiFKj/k2EkaA2SrTTAA==
Date: Thu, 1 Oct 2020 08:38:38 +0000
Message-ID: <dd899747-f1eb-2253-9677-8d82c9f73ea6@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-16-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-16-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 168a6a54-7902-453d-3d46-08d865e564b5
x-ms-traffictypediagnostic: DM6PR11MB3498:
x-microsoft-antispam-prvs: <DM6PR11MB3498B2C7EA0E08229D300F77F0300@DM6PR11MB3498.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QWghxHQW+XRY+7T0WAVygu4z74sgBNX7vTR40+XAIYN6i7msQzceE8UAveXXHvV2Cyog9QMis4xBW8wyKLqYducMzd3/Q5geCSoKTg8Gq+WmbFKAzSqjK6t0YsY1+K3LMcj+17qGccuGxOf/m5kPcfkZhVSMUPVfZXg/F0VxccUoi5OCtSUL4t2hlthgfmNT8r3nT8K/EJeQDJqx9/kYLD/nHZL4KfccYrKsHiIKWyDeQEG0Zeb33SX6Qkw+dSn/zX/MSYcJ+0RILiLiSGOZ/SvZ7dHjjdAcI8qKLHNyWM+2gTgoFtc2Y+iDNvaih+ZZUqK1HGqLIBaYmbQb26/XB/KDtifApZptz/QJhrdcPGoLxuHQLGd0DVsykzaTvSN5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(366004)(376002)(136003)(6506007)(186003)(76116006)(36756003)(54906003)(110136005)(66946007)(316002)(66476007)(64756008)(66556008)(26005)(2906002)(6512007)(5660300002)(8676002)(71200400001)(31686004)(53546011)(91956017)(6486002)(2616005)(83380400001)(478600001)(8936002)(4326008)(66446008)(31696002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zhyq2dJMSY+J5xekKIH/sgzKY5cBhbY2J6ynrRwC/aLYXc+himGUZfRiBmPLgA+BmR9mcIdGHZCZMFg5bi9nozUDty38v0H6zecIHHVNitzrn5i4iz1/7Jx+CQjUv+pcr5+GVf/4po8uVfbB6L1qP+1vKjmJGdjwkHyMvDFGuE88eU5PyD/QWv3n6if+dw0juyc191aZYiMriRKUmlmh9zMDgKFSiSUXLazmSRtMSjenHWwfCXBRKg10vHtGlIVimz6juAHjPrwHFp6VB1P6a9wO7uHEMnW/Wq0FRb5jcYi6+OIMLawT4jadW/QKlgOw1zn1S1T8ib/ZfeYIVx4KaNqs7OWw7xP2fxdnsmg9qVJaT9Wp49wNxic79627/Sc40QDQC0iTw9dhP0FxdoVwIIZJSDm2+hJH2t677TGAdYjMdWwYnJ2l0x1gdM+/T5umltXJun9W0FXWol7LNwfqqYkt5i/ZXfRpL1eZoEqzDYUty4w+MB1ZCjUur0UCvQsWkbvjqjY6rqHQrRaEhcnKT6A9XBI6GWHRJDxkDXEXjKTunZL+gTg258Bsd6eT+Zq3j8U/zkjz1rtQsZ9mOPofQ3LpInSS4QL7iGrWUf76SxeunYQ8Uy5BifnwPG2UFC2VdCJRFhb7Zrt+RISCxrwnqQ==
x-ms-exchange-transport-forked: True
Content-ID: <D5FF6A9D2F35174FBAE831E513CFE84B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168a6a54-7902-453d-3d46-08d865e564b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:38:38.2941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVKiQo/vAMZoVyE3Ac+n9+xLv73jeS3B6zNH9qeQ0vJ7zFvHJJLNrzoReEKCTC6sQ/hpJGico6eazRIbBN7jYywgOWrALv2hwd5/21X1VVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_043841_434298_AFBBF542 
X-CRM114-Status: GOOD (  27.96  )
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
> Since this flash doesn't have a Profile 1.0 table, the Octal DTR
> capabilities are enabled in the post SFDP fixup, along with the 8D-8D-8D
> fast read settings.
> 
> Enable Octal DTR mode with 20 dummy cycles to allow running at the
> maximum supported frequency of 200Mhz.
> 
> The flash supports the soft reset sequence. So, add the flag in the
> flash's info.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 100 +++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index ef3695080710..b0002c29fd37 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -8,10 +8,108 @@
> 
>  #include "core.h"
> 
> +#define SPINOR_OP_MT_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
> +#define SPINOR_OP_MT_RD_ANY_REG        0x85    /* Read volatile register */
> +#define SPINOR_OP_MT_WR_ANY_REG        0x81    /* Write volatile register */
> +#define SPINOR_REG_MT_CFR0V    0x00    /* For setting octal DTR mode */
> +#define SPINOR_REG_MT_CFR1V    0x01    /* For setting dummy cycles */
> +#define SPINOR_MT_OCT_DTR      0xe7    /* Enable Octal DTR. */
> +#define SPINOR_MT_EXSPI                0xff    /* Enable Extended SPI (default) */
> +
> +static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +       struct spi_mem_op op;
> +       u8 *buf = nor->bouncebuf;
> +       int ret;
> +
> +       if (enable) {
> +               /* Use 20 dummy cycles for memory array reads. */
> +               ret = spi_nor_write_enable(nor);
> +               if (ret)
> +                       return ret;
> +
> +               *buf = 20;
> +               op = (struct spi_mem_op)
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> +                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +               if (ret)
> +                       return ret;
> +
> +               ret = spi_nor_wait_till_ready(nor);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               *buf = SPINOR_MT_OCT_DTR;
> +       else
> +               *buf = SPINOR_MT_EXSPI;
> +
> +       op = (struct spi_mem_op)
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> +                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
> +                                          SPINOR_REG_MT_CFR0V, 1),
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

Don't we need to still read the Status Register here? The same question
applies for the previous patch.

> +
> +       return 0;
> +}
> +
> +static void mt35xu512aba_default_init(struct spi_nor *nor)
> +{
> +       nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
> +}
> +
> +static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +       /* Set the Fast Read settings. */
> +       nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +       spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                 0, 20, SPINOR_OP_MT_DTR_RD,
> +                                 SNOR_PROTO_8_8_8_DTR);
> +
> +       nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
> +       nor->params->rdsr_dummy = 8;
> +       nor->params->rdsr_addr_nbytes = 0;
> +
> +       /*
> +        * The BFPT quad enable field is set to a reserved value so the quad
> +        * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
> +        * disable it.
> +        */
> +       nor->params->quad_enable = NULL;
> +}
> +
> +static struct spi_nor_fixups mt35xu512aba_fixups = {
> +       .default_init = mt35xu512aba_default_init,
> +       .post_sfdp = mt35xu512aba_post_sfdp_fixup,
> +};
> +
>  static const struct flash_info micron_parts[] = {
>         { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
>                                SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> -                              SPI_NOR_4B_OPCODES) },
> +                              SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
> +                              SPI_NOR_OCTAL_DTR_PP |
> +                              SPI_NOR_IO_MODE_EN_VOLATILE)
> +         .fixups = &mt35xu512aba_fixups},
>         { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>                             SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>                             SPI_NOR_4B_OPCODES) },
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
