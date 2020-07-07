Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55761C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 17:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B11206E2
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 17:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L1iflsVv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mymgiAKk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PfoR7rJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B11206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H0YQk1GzexQmbQr1fLI9Y4rLjypQrkyTi/botxfFWd0=; b=L1iflsVvuNL7vjk+fLtI6/EyL
	NdNE94OwDNJP1lK4M4V4jGSNdlYle77yDJEfBUuPivAnKMehY4TyJdCZ4k7R++1Sb0pkgDJf2ISJw
	HmM8cP6aeTjp3EoAP0kJLG+wGZhA87srO1QpUl6DEs/J0gq4OghJjvKhePW8VLukCgP1sgLhUdIbE
	eN/ldsoxl6gdL0yuWcj09udSe6JxEZ5XRloDyHa7m/CpUPnAnp3yqMliQClSb9Wt38hzr0ODXaPnz
	G9CnkPf0GgbCug8wzsvxndCQA0AIxLzd4R4qCdg5cxs4KUKjjAuA2y+UNkvfwLs5JL6an0dQPTVxY
	BZEE81Ixg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsrn5-00043m-R1; Tue, 07 Jul 2020 17:53:59 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsrn3-00042y-OV; Tue, 07 Jul 2020 17:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594144437; x=1625680437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xw3S66fEfd0VyI9qKTQXhyZ7GPkfglwR1Iz3vv7GzgA=;
 b=mymgiAKkjpnvxzXPzSMWVTIH8Iddn3lOUuPi+Q3feq5ihoWM6sH71TwY
 eDV7ct70wWxU7m3Wxcd1EaazKZkYqZ//NmQOdl9JW79+kpcTW59Tf1r1l
 ydqkhXXHX5yd3pHhUVviM2TxtpCWFo828BwDkh61WcTv2L2RQdVjyAMo9
 oCMh1NnB++RH6imkaQWa8ZCYJ3hSKeP0DYjhkymYGp2jo9xOBBTBJwti7
 AOyKByHsqG33DSEhfRWTEMhR8VrtsqiuIOdZ5TJMRhSOYw3cKblGS9dsy
 UjhBZ3Gkk9I10XaPbUaq/8nTCOboeGjQs5ShYFuv+QGOUi1I1J51X4C9b g==;
IronPort-SDR: LlC/qQARs+D2uv4qzIglbdwKS9ccHrlKHiXS9fRVPe64hwtkD6NgZO5u/+FXwIQhHbNEPQ2YWj
 VLTbUdKoMnMjI9Ht6touEZEusBO5igjg9Tx776AMjHjT7XxbizBm0IhQrUhhDwekxlYoHV+eeT
 ruw7FDHNLtZwNzsY9A9gvUo4B1qCcslqDbMo4527QkJK6vY7Mivm169oY2gQKUgFSeCuuoFCbZ
 2m+Z1Z/IwsSgfQsaiEo1l48h4Xnzk0XBhftgDpXHFp5LCi2UT0rwdnXs4KYJaklsEavZlM6Q5W
 cis=
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="79051977"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Jul 2020 10:53:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 7 Jul 2020 10:53:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 7 Jul 2020 10:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYWIJMySPYGVtpsZF+3X2S0cn28sPHE0OsuKcz6VfrPHmGTpeNmxt1a02ZRX0VdbRQVDLTmOK1NkPkLrCt49d3SBPJkzSQhyr/rztWu0FrYgHhFKWwem7CUruahVZ4caS6MjBBpcHdg86uuq6395Gnfg5kF7QUpQYSYV+RfJn5D55Aatp/fCscmg9Q+BS2t50jdzf8ao8GkrHhDozOl5IvSeU3BZb6OdTmi9jZFpflgv4bXtEkIUm69GrReed+0nDkdTMmF0KSwU3ibXt60GyzMhPaWa7KfOwoEp1ZpyZkWthfYNYUc+LAuJ8KASOryeXMoDXVmwhtUIQ0JRRut4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw3S66fEfd0VyI9qKTQXhyZ7GPkfglwR1Iz3vv7GzgA=;
 b=W7RahP2UFxw9bWgwYpxnTuEMel9xT7Hvf76uTN+fyIjh1AKRuftZqJdjairoFJ6QPJxODFIEVvFHi/+EWTbnVRzm2LVNT5U6ik9Hrlix/yRY1itXDdWG/3GiVr7WwsuVIUWgEuoVQu1b2itf5E7ibkISXP9FME0evtqBDawx5cYVemT5cahnlkIYX6bQCqKuZPXLIJozEBmWqN8QD/l5vMIz1JsuBXal5BZLUCQohJxbq0SCYBCqyzR+T6Iufr/LgY8bOOM6oFXl+l9dKx7rl9ZPmGG5B49j0w1quQGwONsPGomB/YFtqQXe2UYGt8Z5qxvCiWscRyjwyE9RPJ7P/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw3S66fEfd0VyI9qKTQXhyZ7GPkfglwR1Iz3vv7GzgA=;
 b=PfoR7rJGKAl6oywFcY3r9h/1ekXyBpaPsL658PCKEoIDc2ETP4QQ2ZruWXaoD52PTxAOA4GUnPzEPgoZS7B7Hin34PgEjJsL8MlLHHmoqWoYIb9O8KC3YDXSCjZ8/beRnwKLAxy7ZqwDS44yeHsZYjqxoI1tk81zGT15dk6C1Zw=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BY5PR11MB4024.namprd11.prod.outlook.com (2603:10b6:a03:192::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Tue, 7 Jul
 2020 17:53:53 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 17:53:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 06/17] mtd: spi-nor: sfdp: get command opcode
 extension type from BFPT
Thread-Topic: [PATCH v10 06/17] mtd: spi-nor: sfdp: get command opcode
 extension type from BFPT
Thread-Index: AQHWVIeTPEfqRDg7DkGG9JINhim1sA==
Date: Tue, 7 Jul 2020 17:53:52 +0000
Message-ID: <a8513b6b-4780-e854-897b-6b6364606bce@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-7-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-7-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39db2f43-6be0-4f45-23fa-08d8229eb630
x-ms-traffictypediagnostic: BY5PR11MB4024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4024FA5ADEDDD2C564A4BB5AF0660@BY5PR11MB4024.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vpAcuD5dBQXKtiEAbJ82+2M5SMUt6pItdln8M9giLdEKBIEl4H0zqEtgdR2BF+zXDVjkOHPOwLOGtLSupe4/sspit0RERg4oZPVGpV4xc0p6CVv0CfgDr84pb+tFnXnhVIttaQOTjXYgK12j8cGT0lYhwKV+iVNXf9ZWEltkcT4fuKuGe/MtNM0UkQ1c70OIef2uLfgqZ0S8GevEZMXYSSJoQDtnWL7aNNRmBRV7cO7x1l3RkF7GDFHZ/2gPmM6OxUOLkOvzqCW1BZAAFCeO1OOvqUxZ+KTxzd4JNn3EIlDHBvM5MZh7LEbjqbePios7y7Qg1z3xiuH8svqJTQ7J+/tRmuFo71aE9tmp/qzi1HgGgDzlsBTpjXDfhFnOzBu7S5UAJZYi80NvnzOLZKFNxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(36756003)(186003)(66446008)(66946007)(8936002)(6506007)(64756008)(66556008)(66476007)(4326008)(76116006)(2906002)(91956017)(53546011)(26005)(5660300002)(6512007)(86362001)(71200400001)(110136005)(31696002)(316002)(54906003)(31686004)(7416002)(478600001)(2616005)(8676002)(6486002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: S4OFd/rG725w5ezSO1IwErK2D6K3JRUct1gftNiyGJUL82X1fsPzCvXIMmI7fbpC29apS2bV6A4OGOo1M9fBl+hWC3r/AxijfCJtkJsPBuistgivekZXKQ2sYTpuz345dUG1LLXa17biCXqh05QP/zkAwiSz+9As2LRqcpyh30T/mHQ8ktcoI4KtY7eUgM1kNDtLswyDo7OY1tFp/JvVAOCWCmlst9Ld+FT7T/8ebQVFZxqM/LaVq2pkcGBLIHmQTc6fQYBFSGREAsaGxY54KGUHGGrfEzMma8HSakWbF5hURESflXjPAEr5bidw1aETUoaSSaBpARDj+l0qqRqZ63M29UqrxqvhHLIhSOTJTw/kLbRfcXS3XrCX+hfXtMBYqMoRefT0dtul3pdyAJulyRFQx01DiqnsyF4OlVwTe9qXUDQ7hq0jBElAJA5MhZrIiPj7s/0jR6T4i7cNBdUink8O40qpFxJo7Sn8/fsctO0=
Content-ID: <C4D3E4A1880A514EA9E1287839D56C55@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39db2f43-6be0-4f45-23fa-08d8229eb630
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 17:53:52.8141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3hvH/esMQc5JWC4tVwUmbWlsZmaPR6MC4morxcY/xkizMq/Ud5MPwoK0hP+Mlv4/KAzWe7vcj8B2F/JTEdVn5U/jStHGpDHpQL5HueLBp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_135357_980652_CEC3B35D 
X-CRM114-Status: GOOD (  18.11  )
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

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Some devices in DTR mode expect an extra command byte called the
> extension. The extension can either be same as the opcode, bitwise
> inverse of the opcode, or another additional byte forming a 16-byte
> opcode. Get the extension type from the BFPT. For now, only flashes with
> "repeat" and "inverse" extensions are supported.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 17 +++++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h |  6 ++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index cb6e93a3560a..3f709de5ea67 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -605,6 +605,23 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
>                                                 params);
> +       /* 8D-8D-8D command extension. */
> +       switch (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
> +       case BFPT_DWORD18_CMD_EXT_REP:
> +               nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
> +               break;
> +
> +       case BFPT_DWORD18_CMD_EXT_INV:
> +               nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
> +               break;
> +
> +       case BFPT_DWORD18_CMD_EXT_RES:

dev_dbg

> +               return -EINVAL;

Do we really want to stop the SFDP parsing here and loose everything that
we gathered?


> +
> +       case BFPT_DWORD18_CMD_EXT_16B:
> +               dev_err(nor->dev, "16-bit opcodes not supported\n");

dev_dbg

> +               return -ENOTSUPP;
> +       }
> 
>         return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
>  }
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 7f9846b3a1ad..6d7243067252 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -90,6 +90,12 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD                (0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1              (0x5UL << 20) /* Spansion */
> 
> +#define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
> +#define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
> +#define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */
> +#define BFPT_DWORD18_CMD_EXT_RES               (0x2UL << 29) /* Reserved */
> +#define BFPT_DWORD18_CMD_EXT_16B               (0x3UL << 29) /* 16-bit opcode */
> +
>  struct sfdp_parameter_header {
>         u8              id_lsb;
>         u8              minor;
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
