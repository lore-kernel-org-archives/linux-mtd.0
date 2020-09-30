Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7385C4741F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:36:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C84E206B7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+LYMHT9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GUOofIAK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="HSTV9Nrk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C84E206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TDvAPq+u1Kpp25iZefFj0VKFI/1h9nMl+8ZITiNiEV4=; b=G+LYMHT9U0nP3Jqt0sOFoaxVq
	n5MS6eWag75YZnS0jjsaG9B2/1bvBBdX6SXoU/4asq+KfyX21iwZxeqOW4ICBmYVDNup3DFQJFH+F
	EMOTu/GECCLV3mKYEl3Fvi3tJjb9i6+ItMH8QPBQMyQRDcZAgdOONgY9WNA3LxMhoaGdEvkSCJ1dK
	QMpsaDNLyS1qxmwA227IhXraGnavB3ABwaLfKq/a+cfSTyRA7z8HWURJNu+brfwnhzP8nC++HOw3v
	7nsE4iB5rUIyJAEZZuIkXCaGDT7SN6QKn7bpL8CxMLVTm3dTYTHoimL53skXC9XiQ7PZ1N5i7jZub
	Eko2+PXbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXau-0005NO-Uv; Wed, 30 Sep 2020 08:36:13 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXan-0005GX-LR
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601454965; x=1632990965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zQc/ZpQpH+70/5Ol70zO6V2q/skgLsNHvwHn0bWqZks=;
 b=GUOofIAKDYuBdVeOMgR7UDDlQad0Dw326ThpIOPnZx617xJcZbmJCYho
 ucO1vpU4YtYkq5oYvFISpiKFMc+xFrphNHfu7YGnEydYpW5zg7W531sGT
 u4jQCEM1mGzcOIR5pnVvrMwo/mkf9JAtCbEWPGTyWXvjPikO7BsGudpbl
 DduBt2I2Wcx4E0YXmDB2IeL0bMYInK+RNGJTaE6F5WT5X7YnyFY8wFI4P
 AuhzX5wg7PWUvQ0865wzVBk5iA00CFXWlXJ5OfNS9UypZWlin477jRgOd
 ngQy++2mN33SFBRWoufCEJCM5ykmWA3YXSwJrLd+OxrYOnyc5jie/a/pm Q==;
IronPort-SDR: mCzrAxbz6YwIngdktXoY0PfqxrKvsP6zCutM5nzHFrXUjlWh7o0iyKzUfvKttXfh1ulniv4Za4
 AzqD4Z5FKaRgnHFpcnLbtMtM0q8oVmtG8aMz6+REbIJXw87nSs7fejIbTepQZNmbnFnvB3wC2Y
 Hqh2wJLkWLrHXCSF6ze1w6CszIMDOyziyfkDqSh8Mw7xa6/eXtFgcFYK+gGV2G/+I2AcsGxmD2
 3IyqjnNBafB077QL3pq71LQob9yeVLskSC+bl6aLlNtQOEoNGIHeekLfzwZAyEIyyoc8k+qXcR
 KqY=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="88640227"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 01:36:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 01:35:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 30 Sep 2020 01:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnqlTsoeX+gpctZea1CsNURiNq+IwkudSzwA0JvmBoyAwF2Y7iXuaK2pqTrlTGvHFjCgtgaTOGzB2HqPYc22OzSQEIyKUPIg9qvGio5jITTHqUYzLjKTjDptFz6zqA18YId7RpJpoYBtX0HF/rJa3RrA0TtQhznB7CRYVhA2iPCYy/Pq0AInMC9iAJv8JFQTy/5jxaO17oFH/j+UpTtElHCqmbO7o6IeyP5mSyWRSlnQrUURSE+IXRlmqlJimEp7ZFEVSrLDEzm+pLyfZP7sX5JFcyeFwi6RlVfPkCdsORv0LhX/Y+PmwnivSUTOaR/CaW/NP7fkWnRanJzeflgd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQc/ZpQpH+70/5Ol70zO6V2q/skgLsNHvwHn0bWqZks=;
 b=AMdx+hmqtj/g28cYTA5kaogzNVj9ypUU8t86YmwBfd1nVONZUUsO8DpnxOcRCCiCLVrxetRjTFo2zB+C4AiM+aSC9g77kNEZajBz5kFgoekwcWE/pDAEWtoVQV38CT2gKueZ/eF24Ank4OQksYgCTWrLyvOzQzxF1ZnXRFBr12XlfKRd0Nd0iWhAl4nV0FY9nU/WcylXS4YIwHtl74X9iGnufq6FAQ6BYhD49IynKaGKcOSgc0asxngP8XW0JjSo33/MAOBR16SOWzAH+kNBH8HuSOyzunzxCLmoKtCgTgv/k4ae3U9EadHTBztbgDO+NYxXGUjmNr+q30Hg/sgiyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQc/ZpQpH+70/5Ol70zO6V2q/skgLsNHvwHn0bWqZks=;
 b=HSTV9Nrk79neLgkPtCfHc/gXdbYzco/dm928ee2l8+ZSlQGdHuhFzVGoUbRzuRQcmFH6W6V07myiXbi6WyZdZACusr577IwwlCFvnsBx4B82vfuR6EyNYROgC9lhplgC0CQMhw1HFcasRM61pozxx6YJAF1AgviE5cLY7ViCfgo=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Wed, 30 Sep
 2020 08:36:00 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 08:36:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 14/15] mtd: spi-nor: spansion: add support for Cypress
 Semper flash
Thread-Topic: [PATCH v13 14/15] mtd: spi-nor: spansion: add support for
 Cypress Semper flash
Thread-Index: AQHWlwS5Xu5j0roZ10ua8s9zHSDjjg==
Date: Wed, 30 Sep 2020 08:36:00 +0000
Message-ID: <b6d35341-475b-03db-f2f0-2625dafc25fa@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-15-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-15-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3119ee54-4c7e-4433-b1fe-08d8651bdc59
x-ms-traffictypediagnostic: DM6PR11MB3913:
x-microsoft-antispam-prvs: <DM6PR11MB3913352FF31024939E48AA77F0330@DM6PR11MB3913.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJmrt8e2vV24PXrK0vWlkkAal2eU4nt1sJrNKFvMPqbIMiUnul89m6lD80FDkya8OvfjS+Rvq5oKL7Gum9FPP5PVCcDxyPXMspMafgOIgNPcCGe/D9bpb52lo1iT0bbIDfKVZtUrWTe9/nDHGDGdTlIHOZLxlCT1cjoO4rKs459jeRLX8ndxFwJR32Jr1hZU2l8Hp1aORpGWFNs7Ku2cn2xt0fs9oGKnTCSndt8p/h7xSU1hFx8h7qq2jGuHfrOXRWROyIxwKmozs/RXEVjXnZdDxMoE1eaDKEXK/7mraFO8sMnry0mEkb0MVSdwnFdRr5GPHt2gHDh+wK/xGl1IidgV17oPdcn0SFft9u0yh2fHiCi54Y00nyk8FjA0LjndPpUz3LBMpj/VdOfiQpdkQ48R5RjJAIL+eof76adnd9BzCGJu9mrmLDcZv6gixzT+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(346002)(376002)(366004)(6512007)(83380400001)(26005)(186003)(2616005)(6486002)(8936002)(478600001)(8676002)(71200400001)(2906002)(31696002)(36756003)(31686004)(66556008)(66446008)(86362001)(5660300002)(64756008)(53546011)(6506007)(91956017)(66946007)(66476007)(4326008)(110136005)(316002)(76116006)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 3dls6xa5ZgZUEcFoVjvVeom5sybfhZGd2PLo83+xf0NBAHsBQ0HONyCDBsXK0bsiSNMxowdyc5CaTihRIgWleIWG148C0SqJjSu5r9aEMZiOxjrfh+quqv+oFQA0Sx5KODRi3eEaczjEn+GzaAFjTjwuXESuuYDQeHz4o8llFUFFHStn6ZbIs76EFiJdT6GRgn3NsrcbB4e1iRpuVKFUxkoKA3+nDaLZeJWVqavCeQcSw3Tm6zo7AZPDGkRUEScTfPxuZMdQn2cqUEK7ZRCPpPrlMAZXBgDjJKzqTQiBFJJdQZdQRoL9wwYCsSLVkmoYTD41yuYUGUQMWUaXN7sDeQN2U5Ip6/puJh0YuBNkwVizMDbAGu4sUsZIpOJMxAHGkOvrkLC3WICm8yJja5tweZpCazOMOfl81CJliIPoOeeqktFBBaSSSuIYS6itwGEHiLp+lJR4b3QlQ0oyWwo3JntcSkH2S+w571kTfzXx2xsvvB7coDR+wPkBEdEVIUIxfZj9VZvzLuVzfo+bpliwpkW+TmTehYFMcKFlXHWzOSywCJMUX4bO6KS0Z/B0PIFRCRJog2SuLok78cpwgF5c+eW2OFUWb1H4VHro1FRXXD/5YXxot9ET8j4QyD85blKnI/AiTWL0w2AWGSwjax765g==
x-ms-exchange-transport-forked: True
Content-ID: <23AA87EF4AF6894CB5DB8B5C324D5844@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3119ee54-4c7e-4433-b1fe-08d8651bdc59
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 08:36:00.7533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wok/JVXgmdBKRSnxtnUog54C+adS2YwkRi96fIHQ09dQLSveCS6WG9RN1L9oYnHhU4w4gFkwilsgrIg3Tetk8nc0JZIW0/8NuYr2AG+3Ay8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043606_105380_E35D98B7 
X-CRM114-Status: GOOD (  31.16  )
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

On 9/16/20 3:44 PM, Pratyush Yadav wrote:
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
>  drivers/mtd/spi-nor/spansion.c | 166 +++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 8429b4af999a..a34e250ea5a2 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,167 @@
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
> +       u8 addr_width;
> +       int ret;
> +
> +       if (enable)
> +               addr_width = 3;
> +       else
> +               addr_width = 4;

you can get rid of the addr_width variable and set the addr nbytes at op init
directly.

> +
> +       if (enable) {
> +               /* Use 24 dummy cycles for memory array reads. */
> +               ret = spi_nor_write_enable(nor);
> +               if (ret)
> +                       return ret;
> +
> +               *buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;

using nor->bouncebuf[0] makes the code easier to read (for me). No big deal anyway.

> +               op = (struct spi_mem_op)
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> +                                  SPI_MEM_OP_ADDR(addr_width,
> +                                                  SPINOR_REG_CYPRESS_CFR2V,
> +                                                  1),
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));

new line please

> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +               if (ret) {
> +                       dev_warn(nor->dev,
> +                                "failed to set default memory latency value: %d\n",
> +                                ret);

do we really care for a message here? you'll get a dbg message from
spi_nor_octal_dtr_enable() too.

if you still want it, use dev_dbg please.

> +                       return ret;
> +               }

new line please

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
> +       op = (struct spi_mem_op)
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> +                          SPI_MEM_OP_ADDR(addr_width,
> +                                          SPINOR_REG_CYPRESS_CFR5V,
> +                                          1),
> +                          SPI_MEM_OP_NO_DUMMY,
> +                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +       if (!enable)
> +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret) {
> +               dev_warn(nor->dev, "Failed to enable octal DTR mode\n");

wrong error message for disable. Maybe get rid of it entirely and return exec_op
directly.

> +               return ret;
> +       }
> +

No need to wait here? you waited after SPINOR_REG_CYPRESS_CFR2V

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
> +       struct spi_mem_op op;
> +       u8 *buf = nor->bouncebuf;
> +       u8 addr_width = 3;
> +       int ret;
> +
> +       /*
> +        * The BFPT table advertises a 512B page size but the page size is
> +        * actually configurable (with the default being 256B). Read from
> +        * CFR3V[4] and set the correct size.
> +        */
> +       op = (struct spi_mem_op)

here you can get rid of the cast, as you have just one op.


> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
> +                          SPI_MEM_OP_ADDR(addr_width, SPINOR_REG_CYPRESS_CFR3V, 1),

set addr nbits to 3 directly

> +                          SPI_MEM_OP_NO_DUMMY,
> +                          SPI_MEM_OP_DATA_IN(1, buf, 1));

I would use nor->bouncebuf directly

new line please

> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret)
> +               return ret;
> +
> +       if (*buf & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
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
> @@ -104,6 +265,11 @@ static const struct flash_info spansion_parts[] = {
>                              SPI_NOR_4B_OPCODES) },
>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>                               SPI_NOR_NO_ERASE) },
> +       { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
> +                            SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> +                            SPI_NOR_OCTAL_DTR_PP)
> +               .fixups = &s28hs512t_fixups,

the .fixups init is not aligned with the other .fixups in the file. Is the alignment wrong?

looks good.

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
