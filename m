Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5129EC4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:19:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C492087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uELyTRhj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CfOS4j43";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pxfetNRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C492087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BA1pPI0MjC9bPSBs28uo5zgPyVJqdtml2l8rNn+MGpA=; b=uELyTRhjwF28/+yM08djlqtIm
	7aaOVn8JIsD+kcYiM95ByDxs3cGdEBSVyi07PzbCKcHmS3Yud0ngFcBOxQHgDNK2Qd/WCzCAm0OJE
	s+FtkHRbJagzk4B28g09JCcV/WpOlyboATA+0Tp9/nO6xIkIFZEIUhUBOscsWzR4w8/ZpyI4hEUMb
	SIZLlW9e13c7j5u5+ud5Fez/Vhx8HZh7MNiMr8jczWnDFlFyrxSFwtNtLmUkw0BVvLzQyPeePhYhg
	3fhiL+yggAqwg0PPcIhJtEWyS+lQpf0TKRySL3mkBjxODyWWtokL5WskPPeBeD2Njvgnl0FDgV9d3
	cSQZQoM0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtnR-0000zT-DP; Thu, 01 Oct 2020 08:18:37 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtnO-0000yq-LV
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601540314; x=1633076314;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ykpd+a2KNjWB+zQid/7+9iaa62ralgh+DlQIbyXPz/0=;
 b=CfOS4j43J8Y1f16GcwPyUh1SfvEoiz2KvyBVpjN1nxW50SL9kzK1CLe+
 DqSRYiv/JE3YMqJKuQDIaRM8LEM+KrAsb0eoMPzyNUyckVfn1zQJN6ep6
 WeNN4AfHa+vAvvs5L8Ga/dJO/WvSAAFuClV/ZiOQiZIe/6K3LHVeBzHk9
 dSnhjlwgkMuFcgXOn6hdkLuf9bKe6HxByi6Vd7aR9fVDa2r70r0AGuBu1
 RXqQys5eOKPkWO8JuW6p6Rlc8J2ZBkbB+SPCe3op5j9CWPZCEOhcC1yRA
 IUrh1DTrx39uDSxxusj9ZeLEW8sE1vj+HkvVlE2RYD5fxgmCjf3TCB0nT g==;
IronPort-SDR: Uu2pTq4m+iq/XvtB+EuWvQXhYEeg4lpCI8t6nSebA803y9QtXRnLSrDwRZh//AflTNoC6oaKRa
 Dh9QoFRSQDHF+q+IWuNzEjX5rellRqgTTZXyYB2rg40Zz+U7poXNvHE+EOCH3G6MfwzyzbJJkh
 6SvNwVuT+S9LeuL0TGI5zqcpKasDsj1wZ3XCrPfXu0EpFtx1ebrl2YSPN+z8KrOjjbmtrvVbD/
 wLLnA6QEMiBR+SKDNjkOg3B281REudF1d2bitKOTE9cE73g228ye4C3JiCA/amjjLARfH3zJ/T
 2y4=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="93854116"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:18:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:18:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+cM6c1fuKFKAOjZ3J8UTmsC0AM1hwYjRph8soI3+d1q9lgu5/yFegFBay5yYhA2aw+CpUrd6gVzn4mJyvR+wkrQRjbxVVptMvjOKdWi502hGRj03qzAk9EFgQI30HNFQ2xi93/OkwoK5voKRJnRHp9De5qMYwlZURqOYGyMVonVGzViJ6ZuWQHKSJ+rBQ0l4JW3tzWuxasiY3HYt+k1dt8WpvbWxXu6Z5ISRDjrT4+bF+nDxOcgpY+lV6FeUh0q5aZXCloThclG9FvXwwdIm7S3BBXaVaNpxVGgz+MH0HffmpRz4JCygoZQs6yrSS4AmaKMZq058lxG/GYR1HS3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykpd+a2KNjWB+zQid/7+9iaa62ralgh+DlQIbyXPz/0=;
 b=Umy1Kmo4mWGgr47nVYMZEEZOXHi95NXAtDxMVxFryWAf23qqfEwlkOI7s0a6RbOSBUQUHWbSLgVApQk+Kg8xgwEiej1bvTOMBOmwdYbhCrLkQC0A+hlTzDfqYVQ/dJgNH9ByclU7pVY08mv3OnugRlLlJaLRPFJuHz5U1oFRWpmPT8I6z6os9Fk1c6M7G0yZbKGxJsSN5hZIeU0P2yL9iTNiZUB37vchYQ9bawG6J/yUEK4INwzXNTlR/I+QGsr0O+fXS3VSdPTwy/rMAmmZK8dMAOEkWg1/BwBg0FsN5Xb2l1+hw7HehUXriL41YMvBIyHw8MzzfbPiJGCpC3bbGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykpd+a2KNjWB+zQid/7+9iaa62ralgh+DlQIbyXPz/0=;
 b=pxfetNRSys8bjqY0sredHEfL0NzZpW9Puh3w0j2wxLltUJuZ/6OvYYO/rkGoOKMzMqXIWuv9SFphSLd4TcsJ+92RNYH/hm3e/iv+XY6IGZOjlhWHohsIvl9n45IeFw4/keXilcLn2sjh4V49pXCKmHJRNuHxRqc2BGCCGVTikp4=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4284.namprd11.prod.outlook.com (2603:10b6:5:205::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 07:46:30 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:46:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 03/15] mtd: spi-nor: add support for DTR protocol
Thread-Topic: [PATCH v14 03/15] mtd: spi-nor: add support for DTR protocol
Thread-Index: AQHWl8b18X9JWcT5zkKq1MM32MT8Tg==
Date: Thu, 1 Oct 2020 07:46:30 +0000
Message-ID: <67f14906-ef28-ff4c-b41f-3500c9212ad7@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-4-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-4-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: e7252225-b25a-43db-c0fd-08d865de1c8b
x-ms-traffictypediagnostic: DM6PR11MB4284:
x-microsoft-antispam-prvs: <DM6PR11MB42844FA85908F8A1FC37D65BF0300@DM6PR11MB4284.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TQuK/ebNRA0Un8wQrmwrfSzG1nyWJ/7rjIR2FiRRpw6U6cI+ZNrvWY2YqWZMb2exttyFdtc1Y8lOk3YLmwQ+ZGxFulP8U52YDrvjKPgSIz3KNkM8BJMXVv6ROsdl8s3wTI/nF8Q6QQ//ysyW8LESwP/Nq65K3VN6L6ksfvThDa9kMTjWRY5xWEsVCE2OYGn/yOIQkeNkGBT6Q8pyW5GAz9iDhLQ+rmdm+K3Nrdlx0PL3yMgvD6SbxtxetRe5bWkAgwFNXVub02nETmRu/FiY8BW17JUPEvtxizA9H2X38L5v7rk9M6wog5E5vMzKqlpmNhTfp2Cqx3FTItZbkI02bm92M22f70BYEYXzMioGE/yTAGf2gvxcT2PQyNoWJS0yvrlYB3fk8hUeYAiHsFMOGPSUPlslsb2VY7HtPBtX+VJEMq1B2eP/a7+UBxWaVKH3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(136003)(39860400002)(110136005)(66446008)(66476007)(54906003)(66556008)(91956017)(76116006)(66946007)(2906002)(64756008)(4326008)(8936002)(71200400001)(316002)(8676002)(36756003)(6486002)(86362001)(53546011)(6506007)(83380400001)(31696002)(30864003)(6512007)(5660300002)(31686004)(186003)(2616005)(478600001)(26005)(334744003)(43740500002)(579004)(559001)(352734003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: A4M/eEgJFoY/lXX5C1breCdZ6jSDYWPQnkb0cZIPwmnm7ZLEOzAhyFwSIrpplcR4Vyp6bmAMM5c3Ic5MlCU4/K5vsHDu3JCPtRkIQ4bkXZ5vD45aHESyZMTI9R/KRxSd8lzkz48rJojP/QR0n/zTGaLO7eaIqeCB9ZtUFyuEXKz2oqm6So9nJeWbPNYuqvJ5GJgP/jIzybiOxHPTXLRwzkVAKzG5MfqsfwxDGfjHitVIWQBhBQ/U63RPevrAsAS5WuGGWag+zf5dfQjRHaLgZ2LGjpH9fNtz6s+caTmzX3n+SNA/3reLOwCye7N1QZ0YNHIJ2z9e7z17KCDJqW8+3NVZQMRg/1+YPygj3efIhP7rVUtbwPaxhdQ4Jf3LLIow9b4UqGizzEKP2IGggboqMyH1FV9C8taHZZ/Mlc8N/XHmJUgdHG3OlFcGXExcqIjNWyYJ0o8ZsZqW+x/p0K/aNZ2gz7TjI6KeBrjReZ+J78ojr27Sq5zKRNjEm1labTVrkWRugAlRVCKOg2eFCFL/5x6xh+lojtgFFKBGNYJxn2xkXkuJLtwnfnUqZZKWy6gIXaaz1P+H4ZMMWe4fZRlTktwzTvxvGc9Hvq0kORBs0adgE5ps1ioQG1p07+cB2af8HS1SHPGUa1BeGmgQDcUklQ==
x-ms-exchange-transport-forked: True
Content-ID: <2B17410AD423AB44A63ED0C691BCDC8E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7252225-b25a-43db-c0fd-08d865de1c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:46:30.8201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMcqbcUc9LNhEwHPQs7NYsg796cxTlDOapC2H//H549/7BpezSgpBOUZk5cs7UzNYeXIbeY1lUIOGB8KVCp+FAnjVElYPYF/yGsK6Lm/o/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_041835_102915_73F6D1EF 
X-CRM114-Status: GOOD (  26.79  )
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
> Double Transfer Rate (DTR) is SPI protocol in which data is transferred
> on each clock edge as opposed to on each clock cycle. Make
> framework-level changes to allow supporting flashes in DTR mode.
> 
> Right now, mixed DTR modes are not supported. So, for example a mode
> like 4S-4D-4D will not work. All phases need to be either DTR or STR.
> 
> The xSPI spec says that "The program commands provide SPI backward
> compatible commands for programming data...". So 8D-8D-8D page program
> opcodes are populated with using 1S-1S-1S opcodes.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 321 ++++++++++++++++++++++++++----------
>  drivers/mtd/spi-nor/core.h  |   7 +
>  drivers/mtd/spi-nor/sfdp.c  |   9 +-
>  include/linux/mtd/spi-nor.h |  51 ++++--
>  4 files changed, 291 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 7a3bf460a2fa..beb17639dc92 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -40,6 +40,78 @@
> 
>  #define SPI_NOR_MAX_ADDR_WIDTH 4
> 
> +/**
> + * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
> + *                        extension type.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @op:                        pointer to the 'struct spi_mem_op' whose properties
> + *                     need to be initialized.
> + *
> + * Right now, only "repeat" and "invert" are supported.
> + *
> + * Return: The opcode extension.
> + */
> +static u8 spi_nor_get_cmd_ext(const struct spi_nor *nor,
> +                             const struct spi_mem_op *op)
> +{
> +       switch (nor->cmd_ext_type) {
> +       case SPI_NOR_EXT_INVERT:
> +               return ~op->cmd.opcode;
> +
> +       case SPI_NOR_EXT_REPEAT:
> +               return op->cmd.opcode;
> +
> +       default:
> +               dev_err(nor->dev, "Unknown command extension type\n");
> +               return 0;
> +       }
> +}
> +
> +/**
> + * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem op.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @op:                        pointer to the 'struct spi_mem_op' whose properties
> + *                     need to be initialized.
> + * @proto:             the protocol from which the properties need to be set.
> + */
> +void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> +                            struct spi_mem_op *op,
> +                            const enum spi_nor_protocol proto)
> +{
> +       u8 ext;
> +
> +       op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
> +
> +       if (op->addr.nbytes)
> +               op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +
> +       if (op->dummy.nbytes)
> +               op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +
> +       if (op->data.nbytes)
> +               op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
> +
> +       if (spi_nor_protocol_is_dtr(proto)) {
> +               /*
> +                * SPIMEM supports mixed DTR modes, but right now we can only
> +                * have all phases either DTR or STR. IOW, SPIMEM can have
> +                * something like 4S-4D-4D, but SPI NOR can't. So, set all 4
> +                * phases to either DTR or STR.
> +                */
> +               op->cmd.dtr = true;
> +               op->addr.dtr = true;
> +               op->dummy.dtr = true;
> +               op->data.dtr = true;
> +
> +               /* 2 bytes per clock cycle in DTR mode. */
> +               op->dummy.nbytes *= 2;
> +
> +               ext = spi_nor_get_cmd_ext(nor, op);
> +               op->cmd.opcode = (op->cmd.opcode << 8) | ext;
> +               op->cmd.nbytes = 2;
> +       }
> +}
> +
>  /**
>   * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the data
>   *                           transfer
> @@ -85,17 +157,26 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
>  static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
>                                            u8 *buf, size_t len)
>  {
> +       if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +               return -EOPNOTSUPP;
> +
>         return nor->controller_ops->read_reg(nor, opcode, buf, len);
>  }
> 
>  static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>                                             const u8 *buf, size_t len)
>  {
> +       if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +               return -EOPNOTSUPP;
> +
>         return nor->controller_ops->write_reg(nor, opcode, buf, len);
>  }
> 
>  static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
>  {
> +       if (spi_nor_protocol_is_dtr(nor->write_proto))
> +               return -EOPNOTSUPP;
> +
>         return nor->controller_ops->erase(nor, offs);
>  }
> 
> @@ -113,22 +194,20 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>                                         size_t len, u8 *buf)
>  {
>         struct spi_mem_op op =
> -               SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> -                          SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
> -                          SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> -                          SPI_MEM_OP_DATA_IN(len, buf, 1));
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
> +                          SPI_MEM_OP_ADDR(nor->addr_width, from, 0),
> +                          SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
> +                          SPI_MEM_OP_DATA_IN(len, buf, 0));
>         bool usebouncebuf;
>         ssize_t nbytes;
>         int error;
> 
> -       /* get transfer protocols. */
> -       op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> -       op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> -       op.dummy.buswidth = op.addr.buswidth;
> -       op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
> +       spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
> 
>         /* convert the dummy cycles to the number of bytes */
>         op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +       if (spi_nor_protocol_is_dtr(nor->read_proto))
> +               op.dummy.nbytes *= 2;
> 
>         usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> 
> @@ -179,20 +258,18 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
>                                          size_t len, const u8 *buf)
>  {
>         struct spi_mem_op op =
> -               SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
> -                          SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 0),
> +                          SPI_MEM_OP_ADDR(nor->addr_width, to, 0),
>                            SPI_MEM_OP_NO_DUMMY,
> -                          SPI_MEM_OP_DATA_OUT(len, buf, 1));
> +                          SPI_MEM_OP_DATA_OUT(len, buf, 0));
>         ssize_t nbytes;
>         int error;
> 
> -       op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
> -       op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
> -       op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
> -
>         if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>                 op.addr.nbytes = 0;
> 
> +       spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +
>         if (spi_nor_spimem_bounce(nor, &op))
>                 memcpy(nor->bouncebuf, buf, op.data.nbytes);
> 
> @@ -239,11 +316,13 @@ int spi_nor_write_enable(struct spi_nor *nor)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
>                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WREN,
> @@ -268,11 +347,13 @@ int spi_nor_write_disable(struct spi_nor *nor)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
>                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRDI,
> @@ -299,10 +380,12 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_IN(1, sr, 1));
> +                                  SPI_MEM_OP_DATA_IN(1, sr, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -330,10 +413,12 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_IN(1, fsr, 1));
> +                                  SPI_MEM_OP_DATA_IN(1, fsr, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -362,10 +447,12 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_IN(1, cr, 1));
> +                                  SPI_MEM_OP_DATA_IN(1, cr, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -396,11 +483,13 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>                         SPI_MEM_OP(SPI_MEM_OP_CMD(enable ?
>                                                   SPINOR_OP_EN4B :
>                                                   SPINOR_OP_EX4B,
> -                                                 1),
> +                                                 0),
>                                   SPI_MEM_OP_NO_ADDR,
>                                   SPI_MEM_OP_NO_DUMMY,
>                                   SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
>                 ret = spi_nor_controller_ops_write_reg(nor,
> @@ -432,10 +521,12 @@ static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
> +                                  SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -464,10 +555,12 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREAR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREAR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
> +                                  SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -495,10 +588,12 @@ int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_IN(1, sr, 1));
> +                                  SPI_MEM_OP_DATA_IN(1, sr, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -540,11 +635,13 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
>                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> @@ -604,11 +701,13 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
>                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
> @@ -748,10 +847,12 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_OUT(len, sr, 1));
> +                                  SPI_MEM_OP_DATA_OUT(len, sr, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -950,10 +1051,12 @@ static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_OUT(1, sr2, 1));
> +                                  SPI_MEM_OP_DATA_OUT(1, sr2, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -984,10 +1087,12 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_DATA_IN(1, sr2, 1));
> +                                  SPI_MEM_OP_DATA_IN(1, sr2, 0));
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -1015,11 +1120,13 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CHIP_ERASE, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CHIP_ERASE, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
>                 ret = spi_nor_controller_ops_write_reg(nor,
> @@ -1158,11 +1265,13 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
> -                                  SPI_MEM_OP_ADDR(nor->addr_width, addr, 1),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 0),
> +                                  SPI_MEM_OP_ADDR(nor->addr_width, addr, 0),
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +
>                 return spi_mem_exec_op(nor->spimem, &op);
>         } else if (nor->controller_ops->erase) {
>                 return spi_nor_controller_ops_erase(nor, addr);
> @@ -2272,6 +2381,7 @@ int spi_nor_hwcaps_read2cmd(u32 hwcaps)
>                 { SNOR_HWCAPS_READ_1_8_8,       SNOR_CMD_READ_1_8_8 },
>                 { SNOR_HWCAPS_READ_8_8_8,       SNOR_CMD_READ_8_8_8 },
>                 { SNOR_HWCAPS_READ_1_8_8_DTR,   SNOR_CMD_READ_1_8_8_DTR },
> +               { SNOR_HWCAPS_READ_8_8_8_DTR,   SNOR_CMD_READ_8_8_8_DTR },
>         };
> 
>         return spi_nor_hwcaps2cmd(hwcaps, hwcaps_read2cmd,
> @@ -2288,6 +2398,7 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
>                 { SNOR_HWCAPS_PP_1_1_8,         SNOR_CMD_PP_1_1_8 },
>                 { SNOR_HWCAPS_PP_1_8_8,         SNOR_CMD_PP_1_8_8 },
>                 { SNOR_HWCAPS_PP_8_8_8,         SNOR_CMD_PP_8_8_8 },
> +               { SNOR_HWCAPS_PP_8_8_8_DTR,     SNOR_CMD_PP_8_8_8_DTR },
>         };
> 
>         return spi_nor_hwcaps2cmd(hwcaps, hwcaps_pp2cmd,
> @@ -2336,17 +2447,17 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>  static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>                                        const struct spi_nor_read_command *read)
>  {
> -       struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 1),
> -                                         SPI_MEM_OP_ADDR(3, 0, 1),
> -                                         SPI_MEM_OP_DUMMY(0, 1),
> -                                         SPI_MEM_OP_DATA_IN(0, NULL, 1));
> +       struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 0),
> +                                         SPI_MEM_OP_ADDR(3, 0, 0),
> +                                         SPI_MEM_OP_DUMMY(1, 0),
> +                                         SPI_MEM_OP_DATA_IN(1, NULL, 0));
> 
> -       op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(read->proto);
> -       op.addr.buswidth = spi_nor_get_protocol_addr_nbits(read->proto);
> -       op.data.buswidth = spi_nor_get_protocol_data_nbits(read->proto);
> -       op.dummy.buswidth = op.addr.buswidth;
> -       op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
> -                         op.dummy.buswidth / 8;
> +       spi_nor_spimem_setup_op(nor, &op, read->proto);
> +
> +       /* convert the dummy cycles to the number of bytes */
> +       op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +       if (spi_nor_protocol_is_dtr(nor->read_proto))
> +               op.dummy.nbytes *= 2;
> 
>         return spi_nor_spimem_check_op(nor, &op);
>  }
> @@ -2362,14 +2473,12 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>  static int spi_nor_spimem_check_pp(struct spi_nor *nor,
>                                    const struct spi_nor_pp_command *pp)
>  {
> -       struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(pp->opcode, 1),
> -                                         SPI_MEM_OP_ADDR(3, 0, 1),
> +       struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(pp->opcode, 0),
> +                                         SPI_MEM_OP_ADDR(3, 0, 0),
>                                           SPI_MEM_OP_NO_DUMMY,
> -                                         SPI_MEM_OP_DATA_OUT(0, NULL, 1));
> +                                         SPI_MEM_OP_DATA_OUT(1, NULL, 0));
> 
> -       op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(pp->proto);
> -       op.addr.buswidth = spi_nor_get_protocol_addr_nbits(pp->proto);
> -       op.data.buswidth = spi_nor_get_protocol_data_nbits(pp->proto);
> +       spi_nor_spimem_setup_op(nor, &op, pp->proto);
> 
>         return spi_nor_spimem_check_op(nor, &op);
>  }
> @@ -2387,12 +2496,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>         struct spi_nor_flash_parameter *params = nor->params;
>         unsigned int cap;
> 
> -       /* DTR modes are not supported yet, mask them all. */
> -       *hwcaps &= ~SNOR_HWCAPS_DTR;
> -
>         /* X-X-X modes are not supported yet, mask them all. */
>         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
> 
> +       /*
> +        * If the reset line is broken, we do not want to enter a stateful
> +        * mode.
> +        */
> +       if (nor->flags & SNOR_F_BROKEN_RESET)
> +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);

SNOR_HWCAPS_X_X_X is already masked out above. Do we need to do it again?

> +
>         for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
>                 int rdidx, ppidx;
> 
> @@ -2647,7 +2760,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>                  * controller directly implements the spi_nor interface.
>                  * Yet another reason to switch to spi-mem.
>                  */
> -               ignored_mask = SNOR_HWCAPS_X_X_X;
> +               ignored_mask = SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR;
>                 if (shared_mask & ignored_mask) {
>                         dev_dbg(nor->dev,
>                                 "SPI n-n-n protocols are not supported.\n");
> @@ -2793,11 +2906,28 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>                                           SNOR_PROTO_1_1_8);
>         }
> 
> +       if (info->flags & SPI_NOR_OCTAL_DTR_READ) {
> +               params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +               spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                         0, 20, SPINOR_OP_READ_FAST,
> +                                         SNOR_PROTO_8_8_8_DTR);
> +       }
> +
>         /* Page Program settings. */
>         params->hwcaps.mask |= SNOR_HWCAPS_PP;
>         spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>                                 SPINOR_OP_PP, SNOR_PROTO_1_1_1);
> 
> +       if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
> +               params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
> +               /*
> +                * Since xSPI Page Program opcode is backward compatible with
> +                * Legacy SPI, use Legacy SPI opcode there as well.
> +                */
> +               spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
> +                                       SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
> +       }
> +
>         /*
>          * Sector Erase settings. Sort Erase Types in ascending order, with the
>          * smallest erase size starting at BIT(0).
> @@ -2905,7 +3035,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
> 
>         spi_nor_manufacturer_init_params(nor);
> 
> -       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
> +       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>                 spi_nor_sfdp_init_params(nor);
> 
> @@ -2967,7 +3098,9 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> -       if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
> +       if (nor->addr_width == 4 &&
> +           nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> +           !(nor->flags & SNOR_F_4B_OPCODES)) {
>                 /*
>                  * If the RESET# pin isn't hooked up properly, or the system
>                  * otherwise doesn't perform a reset command in the boot
> @@ -3024,7 +3157,21 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> 
>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>  {
> -       if (nor->addr_width) {
> +       if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {

This should come as an "else if". We need to let the posibility to retrieve
addr_width from SFDP, the standard knows better than us.

With these addressed, one can add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> +               /*
> +                * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
> +                * in this protocol an odd address width cannot be used because
> +                * then the address phase would only span a cycle and a half.
> +                * Half a cycle would be left over. We would then have to start
> +                * the dummy phase in the middle of a cycle and so too the data
> +                * phase, and we will end the transaction with half a cycle left
> +                * over.
> +                *
> +                * Force all 8D-8D-8D flashes to use an address width of 4 to
> +                * avoid this situation.
> +                */
> +               nor->addr_width = 4;
> +       } else if (nor->addr_width) {
>                 /* already configured from SFDP */
>         } else if (nor->info->addr_width) {
>                 nor->addr_width = nor->info->addr_width;
> @@ -3254,23 +3401,28 @@ EXPORT_SYMBOL_GPL(spi_nor_scan);
>  static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>  {
>         struct spi_mem_dirmap_info info = {
> -               .op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> -                                     SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
> -                                     SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> -                                     SPI_MEM_OP_DATA_IN(0, NULL, 1)),
> +               .op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
> +                                     SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
> +                                     SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
> +                                     SPI_MEM_OP_DATA_IN(0, NULL, 0)),
>                 .offset = 0,
>                 .length = nor->mtd.size,
>         };
>         struct spi_mem_op *op = &info.op_tmpl;
> 
> -       /* get transfer protocols. */
> -       op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> -       op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> -       op->dummy.buswidth = op->addr.buswidth;
> -       op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
> +       spi_nor_spimem_setup_op(nor, op, nor->read_proto);
> 
>         /* convert the dummy cycles to the number of bytes */
>         op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
> +       if (spi_nor_protocol_is_dtr(nor->read_proto))
> +               op->dummy.nbytes *= 2;
> +
> +       /*
> +        * Since spi_nor_spimem_setup_op() only sets buswidth when the number
> +        * of data bytes is non-zero, the data buswidth won't be set here. So,
> +        * do it explicitly.
> +        */
> +       op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
> 
>         nor->dirmap.rdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
>                                                        &info);
> @@ -3280,24 +3432,27 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>  static int spi_nor_create_write_dirmap(struct spi_nor *nor)
>  {
>         struct spi_mem_dirmap_info info = {
> -               .op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
> -                                     SPI_MEM_OP_ADDR(nor->addr_width, 0, 1),
> +               .op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 0),
> +                                     SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
>                                       SPI_MEM_OP_NO_DUMMY,
> -                                     SPI_MEM_OP_DATA_OUT(0, NULL, 1)),
> +                                     SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
>                 .offset = 0,
>                 .length = nor->mtd.size,
>         };
>         struct spi_mem_op *op = &info.op_tmpl;
> 
> -       /* get transfer protocols. */
> -       op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
> -       op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
> -       op->dummy.buswidth = op->addr.buswidth;
> -       op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
> -
>         if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>                 op->addr.nbytes = 0;
> 
> +       spi_nor_spimem_setup_op(nor, op, nor->write_proto);
> +
> +       /*
> +        * Since spi_nor_spimem_setup_op() only sets buswidth when the number
> +        * of data bytes is non-zero, the data buswidth won't be set here. So,
> +        * do it explicitly.
> +        */
> +       op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
> +
>         nor->dirmap.wdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
>                                                        &info);
>         return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b27173f..5d95b4183a33 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -62,6 +62,7 @@ enum spi_nor_read_command_index {
>         SNOR_CMD_READ_1_8_8,
>         SNOR_CMD_READ_8_8_8,
>         SNOR_CMD_READ_1_8_8_DTR,
> +       SNOR_CMD_READ_8_8_8_DTR,
> 
>         SNOR_CMD_READ_MAX
>  };
> @@ -78,6 +79,7 @@ enum spi_nor_pp_command_index {
>         SNOR_CMD_PP_1_1_8,
>         SNOR_CMD_PP_1_8_8,
>         SNOR_CMD_PP_8_8_8,
> +       SNOR_CMD_PP_8_8_8_DTR,
> 
>         SNOR_CMD_PP_MAX
>  };
> @@ -311,6 +313,8 @@ struct flash_info {
>                                          * BP3 is bit 6 of status register.
>                                          * Must be used with SPI_NOR_4BIT_BP.
>                                          */
> +#define SPI_NOR_OCTAL_DTR_READ BIT(19) /* Flash supports octal DTR Read. */
> +#define SPI_NOR_OCTAL_DTR_PP   BIT(20) /* Flash supports Octal DTR Page Program */
> 
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> @@ -399,6 +403,9 @@ extern const struct spi_nor_manufacturer spi_nor_winbond;
>  extern const struct spi_nor_manufacturer spi_nor_xilinx;
>  extern const struct spi_nor_manufacturer spi_nor_xmc;
> 
> +void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> +                            struct spi_mem_op *op,
> +                            const enum spi_nor_protocol proto);
>  int spi_nor_write_enable(struct spi_nor *nor);
>  int spi_nor_write_disable(struct spi_nor *nor);
>  int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index e2a43d39eb5f..21fa9ab78eae 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1047,9 +1047,16 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>         }
> 
>         /* 4BAIT is the only SFDP table that indicates page program support. */
> -       if (pp_hwcaps & SNOR_HWCAPS_PP)
> +       if (pp_hwcaps & SNOR_HWCAPS_PP) {
>                 spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP],
>                                         SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
> +               /*
> +                * Since xSPI Page Program opcode is backward compatible with
> +                * Legacy SPI, use Legacy SPI opcode there as well.
> +                */
> +               spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_8_8_8_DTR],
> +                                       SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
> +       }
>         if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_4)
>                 spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_4],
>                                         SPINOR_OP_PP_1_1_4_4B,
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 60bac2c0ec45..cd549042c53d 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -182,6 +182,7 @@ enum spi_nor_protocol {
>         SNOR_PROTO_1_2_2_DTR = SNOR_PROTO_DTR(1, 2, 2),
>         SNOR_PROTO_1_4_4_DTR = SNOR_PROTO_DTR(1, 4, 4),
>         SNOR_PROTO_1_8_8_DTR = SNOR_PROTO_DTR(1, 8, 8),
> +       SNOR_PROTO_8_8_8_DTR = SNOR_PROTO_DTR(8, 8, 8),
>  };
> 
>  static inline bool spi_nor_protocol_is_dtr(enum spi_nor_protocol proto)
> @@ -228,7 +229,7 @@ struct spi_nor_hwcaps {
>   * then Quad SPI protocols before Dual SPI protocols, Fast Read and lastly
>   * (Slow) Read.
>   */
> -#define SNOR_HWCAPS_READ_MASK          GENMASK(14, 0)
> +#define SNOR_HWCAPS_READ_MASK          GENMASK(15, 0)
>  #define SNOR_HWCAPS_READ               BIT(0)
>  #define SNOR_HWCAPS_READ_FAST          BIT(1)
>  #define SNOR_HWCAPS_READ_1_1_1_DTR     BIT(2)
> @@ -245,11 +246,12 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_READ_4_4_4         BIT(9)
>  #define SNOR_HWCAPS_READ_1_4_4_DTR     BIT(10)
> 
> -#define SNOR_HWCAPS_READ_OCTAL         GENMASK(14, 11)
> +#define SNOR_HWCAPS_READ_OCTAL         GENMASK(15, 11)
>  #define SNOR_HWCAPS_READ_1_1_8         BIT(11)
>  #define SNOR_HWCAPS_READ_1_8_8         BIT(12)
>  #define SNOR_HWCAPS_READ_8_8_8         BIT(13)
>  #define SNOR_HWCAPS_READ_1_8_8_DTR     BIT(14)
> +#define SNOR_HWCAPS_READ_8_8_8_DTR     BIT(15)
> 
>  /*
>   * Page Program capabilities.
> @@ -260,18 +262,19 @@ struct spi_nor_hwcaps {
>   * JEDEC/SFDP standard to define them. Also at this moment no SPI flash memory
>   * implements such commands.
>   */
> -#define SNOR_HWCAPS_PP_MASK    GENMASK(22, 16)
> -#define SNOR_HWCAPS_PP         BIT(16)
> +#define SNOR_HWCAPS_PP_MASK            GENMASK(23, 16)
> +#define SNOR_HWCAPS_PP                 BIT(16)
> 
> -#define SNOR_HWCAPS_PP_QUAD    GENMASK(19, 17)
> -#define SNOR_HWCAPS_PP_1_1_4   BIT(17)
> -#define SNOR_HWCAPS_PP_1_4_4   BIT(18)
> -#define SNOR_HWCAPS_PP_4_4_4   BIT(19)
> +#define SNOR_HWCAPS_PP_QUAD            GENMASK(19, 17)
> +#define SNOR_HWCAPS_PP_1_1_4           BIT(17)
> +#define SNOR_HWCAPS_PP_1_4_4           BIT(18)
> +#define SNOR_HWCAPS_PP_4_4_4           BIT(19)
> 
> -#define SNOR_HWCAPS_PP_OCTAL   GENMASK(22, 20)
> -#define SNOR_HWCAPS_PP_1_1_8   BIT(20)
> -#define SNOR_HWCAPS_PP_1_8_8   BIT(21)
> -#define SNOR_HWCAPS_PP_8_8_8   BIT(22)
> +#define SNOR_HWCAPS_PP_OCTAL           GENMASK(23, 20)
> +#define SNOR_HWCAPS_PP_1_1_8           BIT(20)
> +#define SNOR_HWCAPS_PP_1_8_8           BIT(21)
> +#define SNOR_HWCAPS_PP_8_8_8           BIT(22)
> +#define SNOR_HWCAPS_PP_8_8_8_DTR       BIT(23)
> 
>  #define SNOR_HWCAPS_X_X_X      (SNOR_HWCAPS_READ_2_2_2 |       \
>                                  SNOR_HWCAPS_READ_4_4_4 |       \
> @@ -279,10 +282,14 @@ struct spi_nor_hwcaps {
>                                  SNOR_HWCAPS_PP_4_4_4 |         \
>                                  SNOR_HWCAPS_PP_8_8_8)
> 
> +#define SNOR_HWCAPS_X_X_X_DTR  (SNOR_HWCAPS_READ_8_8_8_DTR |   \
> +                                SNOR_HWCAPS_PP_8_8_8_DTR)
> +
>  #define SNOR_HWCAPS_DTR                (SNOR_HWCAPS_READ_1_1_1_DTR |   \
>                                  SNOR_HWCAPS_READ_1_2_2_DTR |   \
>                                  SNOR_HWCAPS_READ_1_4_4_DTR |   \
> -                                SNOR_HWCAPS_READ_1_8_8_DTR)
> +                                SNOR_HWCAPS_READ_1_8_8_DTR |   \
> +                                SNOR_HWCAPS_READ_8_8_8_DTR)
> 
>  #define SNOR_HWCAPS_ALL                (SNOR_HWCAPS_READ_MASK |        \
>                                  SNOR_HWCAPS_PP_MASK)
> @@ -318,6 +325,22 @@ struct spi_nor_controller_ops {
>         int (*erase)(struct spi_nor *nor, loff_t offs);
>  };
> 
> +/**
> + * enum spi_nor_cmd_ext - describes the command opcode extension in DTR mode
> + * @SPI_NOR_EXT_NONE: no extension. This is the default, and is used in Legacy
> + *                   SPI mode
> + * @SPI_NOR_EXT_REPEAT: the extension is same as the opcode
> + * @SPI_NOR_EXT_INVERT: the extension is the bitwise inverse of the opcode
> + * @SPI_NOR_EXT_HEX: the extension is any hex value. The command and opcode
> + *                  combine to form a 16-bit opcode.
> + */
> +enum spi_nor_cmd_ext {
> +       SPI_NOR_EXT_NONE = 0,
> +       SPI_NOR_EXT_REPEAT,
> +       SPI_NOR_EXT_INVERT,
> +       SPI_NOR_EXT_HEX,
> +};
> +
>  /*
>   * Forward declarations that are used internally by the core and manufacturer
>   * drivers.
> @@ -345,6 +368,7 @@ struct spi_nor_flash_parameter;
>   * @program_opcode:    the program opcode
>   * @sst_write_second:  used by the SST write operation
>   * @flags:             flag options for the current SPI NOR (SNOR_F_*)
> + * @cmd_ext_type:      the command opcode extension type for DTR mode.
>   * @read_proto:                the SPI protocol for read operations
>   * @write_proto:       the SPI protocol for write operations
>   * @reg_proto:         the SPI protocol for read_reg/write_reg/erase operations
> @@ -376,6 +400,7 @@ struct spi_nor {
>         enum spi_nor_protocol   reg_proto;
>         bool                    sst_write_second;
>         u32                     flags;
> +       enum spi_nor_cmd_ext    cmd_ext_type;
> 
>         const struct spi_nor_controller_ops *controller_ops;
> 
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
