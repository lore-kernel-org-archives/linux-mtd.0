Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7273FC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:41:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8FCE2071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOehc1aS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Xt+BvMDE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fAya8VdW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8FCE2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7rv0AKepKlj4kXW5F36WHQn9JvZ1tapqrG+2td9agmw=; b=NOehc1aS6/GbYfpuUUaF/Zkrt
	xnRiFfS37FWryjk2g8ibKGw+Vz3cIEUN/QgTfAAL9qmN/PZEcn2AiFk4bxc68KqpVhnqj7+V3wdpi
	Lc9nyiNrFS0p3lzUFc/63g6yY2hBAf40yKCWm02hQ/zovcuRmrgTK5U66Xl1v8gx/4yYoKpfbBkrQ
	NtgHsQvP9DL1h719pPwm1FL6e3LgfAIl14iEGVmdIJcrHeYKiBA1CgN8ulPPnSyRRPayCmnVExvXn
	UHnIq9jTtgSQGPKhKyRfmp7V718gC1dOzSEz9WvZ7wpCU7xg+IpsRjGn+8vGn+cRmSKexfy9jEVlf
	5VOpsVrSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWja-0003Zc-4O; Wed, 30 Sep 2020 07:41:06 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWjS-0003Yg-Sp
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601451658; x=1632987658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5FlqP+XYyPNwwB4qDnPtXL5W9AEvsibPqZIo9a83wv4=;
 b=Xt+BvMDElT0pvNKTInLWUnd+S68uWxnEbCctMl4vGF79eFZ04agVWSFy
 mP7Lsjd2T62HzGr7fSfLtOW8Kz1Q+ko1vfW8MKWp/R2kCgf61vnSrXg6X
 RSwlouaRoc1lbR5ZxSCwUYSe2mK27x9NCocZzwo9EBfG7PBBx8quAqAxG
 L7/v7xr9UKjFDQ0m1NlzKCn7H9vCyxrQctESb3JRFLSMvAt+y3mpyCnSc
 YLP/UDEmoldvmi24T/g1WfGuq8PFto4Zjk9RjkvK5zFKYZUPSZab6D1mh
 tubeSzE0T0rmtLiatlP0u5PQYC2rf77kQ0xShNxjViZiZmuzakUL01BET w==;
IronPort-SDR: cVF2ehwGq3B5/NH/YdVp7+dJY5sOgYIpQvlZnA+74tRjXqRUzgwf8Qzm6Hy+Ddx700l8xpkV9a
 7GhkYFD00qhefzElGo4PaVQY9Cdn9MZe52IBz10q1A03HniJ0ES1zclBTeuiFzEM5genzy07Ov
 B1SMy8i+SMyk0X67ff0agZKsN5sTJltPzN1a+WxmtWdEH/HiHCd9OfdXnzwkdWYiCIljtWr/py
 VvPXEGpReo9z/vqnNZ/nOXxnHGg5VV9tHiZVO7UAco5c0sRHZLx2tJUPp+QlVTpoUKi2Gb3e/L
 I6w=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="28189665"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 00:40:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 00:40:57 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 30 Sep 2020 00:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of8pl4yi9P6jhc3s9s+mM972B0iQXsDsJYu+cAHM842j+GIzxL2WU2X9aQ+AKGQ7K9XUZeHMu9mzB4zckfpqAozhzV2GK+CsfIGo5iOH+Zd8Q1m6ONx5xPNfc3lRONDxjKwVXgcnif8k6fzxQpxgKaNtWTO6sTl68kS+K7cFUNgeBE3jMeDF66PjxhMEz9sDqiYyBgKQE4sVqLWUIiSUK6BlYPeGEHj7pk5JjvH3UngC30mL6VmJYQhwDNF1+9hEpfKPaenbymbOGauPKwUPWRylwcMONC3N/S92cwf+KuboW9HfBqXc9Kd3MEkx7+bZzt+LPUEGsjq90aqZr0vW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FlqP+XYyPNwwB4qDnPtXL5W9AEvsibPqZIo9a83wv4=;
 b=n7KfBcHrIhAf+HC6taVReN2hDDf0JE7xms1bXISxNWFVWGJ8Nokdn/1+H+HtSj4qXeS1NB7LoszUKSy7UuhBcej+7BTN6kwqUt4GxfmuMNOcsq1fhorQ++2V8NI3qmQ1GjfAlFywJ8gZ0qbXTMd77GCXAJ8dzNVspCuqr61XbGpRvKCYD+FTpHh8lX6binW5n/2VDrJV1KJTQG/2FtRt+VMU7Kv4xbsWxveGL2zayEVYepqhr7w09f2eE7D7zrZ3M+aYKDuQAZ2O9D1q3O5JSgEsfWKQ2DijqtvVoWVmqvopJ/w8QPaqfq1E6XdCLh7nPLR8o+8HnVqq0B0NPVx3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FlqP+XYyPNwwB4qDnPtXL5W9AEvsibPqZIo9a83wv4=;
 b=fAya8VdWZsCWVrEVQlRQDDJudj/hzYzBuZtYJFnpTd7oXx5wh7hNp2s7KvmvciDQIKJIAmXRxm5ObAGewto1TPGZNRhRQ1ivRvXK9JxmsOiF0nLx46QWM0hmEutM2ChBhyT2r9MRp64gPGvcgz6tTP3+LLsn2nUBmsyi1GRakfQ=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR1101MB2074.namprd11.prod.outlook.com (2603:10b6:4:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 07:40:56 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 07:40:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 12/15] mtd: spi-nor: core: disable Octal DTR mode on
 suspend.
Thread-Topic: [PATCH v13 12/15] mtd: spi-nor: core: disable Octal DTR mode on
 suspend.
Thread-Index: AQHWlv0H7goVZLYyPUWUbDDOwXtQ5g==
Date: Wed, 30 Sep 2020 07:40:55 +0000
Message-ID: <83e9675b-e60b-6fe4-619d-9e81b26632ec@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-13-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-13-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: b1a561e6-bc87-4e5f-38fd-08d865142a95
x-ms-traffictypediagnostic: DM5PR1101MB2074:
x-microsoft-antispam-prvs: <DM5PR1101MB20746775447D781A0397C82EF0330@DM5PR1101MB2074.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tM4IhxBIgluA1UEmxdMAdAMJQW/pAIW/VE7N3h/59Zko0lQ9rnbDok3wspfBqRgV3rr4UI885LUam0FvpGoP+ShNUpUkFgp5pyCbiRipK/+CtfcKe7A8GsTt93aw+e2G8kSeaVkf79ECKIT2XVxinglCbJKFXWUryV5O2PDL2UV2hSiGt7jwlBIoiAxFqXy4epVH1XeY6078FXnfSefrLnb/r0I2DynptjqM/O40+5Bk/q1GEv8B+kan0xJbOjsGdZpRx/mLHlN8VOc2uOUo9NnmPGj2gT4o99j7ncm6muLGcF0MZgvm8Qk6dqFOWSnqDwQSYUsuortm0Yu1qwW5pGnkKL1k6+i4YEGfo8E1c+hoby51YPNNg42uJw9wCW9t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(346002)(396003)(366004)(2906002)(91956017)(76116006)(5660300002)(8936002)(54906003)(26005)(110136005)(86362001)(186003)(83380400001)(53546011)(6506007)(71200400001)(2616005)(31686004)(15650500001)(6486002)(66946007)(66476007)(66446008)(4326008)(316002)(6512007)(8676002)(64756008)(36756003)(31696002)(66556008)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6U4E0mmWuxi/aUHAwJBTobnLgp5xnVElVk+H6WrODNsM14DrVDR82YkUdwBOV/LkV3kTRvJ93Y7OMAUstEhZj/r+poZyiICz7/jNvgE6KZgfhkP6sWEWEtnbwPIKLV7PC4i3jEn13MxNPGWgqdlQg0AgDuMAps2jpLDedEcrobO1NkiBmnZKSkTsNWDtZZA8J6VyPpsgjBIfwMlT8WNdhUZmcCa2xprdF3Hw/iGYT7k9nhKEl8Qng9U1bzgQ9UuNGyfNpieFu/I+5JDstaYs65G4fEd0JnMVKZmi+m9xSIxqHa9ziHftLxtSN50LcE4h69RKIo8p4Q5lBIdac3Ov80ZEHlZ2JZfUBPD3uhNg1kaXlUW7qsNXjWumUzVdrfUP2ZJ9k8kemaufqZW8ujsRNVho1zra9RyfjADbPeMHg9iIb94biJsLqCaSVgDrAiq6z/VtMGrWGINR49LZVnJGke+Q2s7Fazrk+i2ncNRc1vhb1nTRpMASTrZgvSYi/fbSR23cnFM6IB5/RZ0XzApyX8qwx16FcTGyDcDJlQIML/jOaD7bgr4OYaLFUb8aI+psbsoG3Z3OM71hdPwnQyGWGtVg+P/8qDnhclIbEWw6zc2iDX8yajuARZ4lBwR+qU1OjFq469jiDUT6wIs9zLu+mg==
x-ms-exchange-transport-forked: True
Content-ID: <6FB715C56CA245489C49DC6C7BFC0D44@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a561e6-bc87-4e5f-38fd-08d865142a95
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 07:40:55.9959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfaCNLvgXe3BRvWAKwrvq83rajPyDc58KBCwZdZ4uqQAQBCY42nJ37vxTyl/yLIqiFeiYM0XdsCNbhEjsPV+xm3zlXVj1cp6rGphW2KEkZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_034059_060121_62D7EA52 
X-CRM114-Status: GOOD (  20.85  )
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
> On resume, the init procedure will be run that will re-enable it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/core.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 853dfa02f0de..d5c92c9c7307 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3212,6 +3212,23 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
>         usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
>  }
> 
> +/* mtd suspend handler */
> +static int spi_nor_suspend(struct mtd_info *mtd)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       struct device *dev = nor->dev;
> +       int ret;
> +
> +       /* Disable octal DTR mode if we enabled it. */
> +       ret = spi_nor_octal_dtr_enable(nor, false);
> +       if (ret) {
> +               dev_err(dev, "suspend() failed\n");

we can get rid of dev local variable as it is used only once. you can use
nor->dev directly

> +               return ret;
> +       }

and maybe just return ret; directly. spi_nor_octal_dtr_enable() returns 0 on
success.

Looks good.
 
> +
> +       return 0;
> +}
> +
>  /* mtd resume handler */
>  static void spi_nor_resume(struct mtd_info *mtd)
>  {
> @@ -3406,6 +3423,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         mtd->size = nor->params->size;
>         mtd->_erase = spi_nor_erase;
>         mtd->_read = spi_nor_read;
> +       mtd->_suspend = spi_nor_suspend;
>         mtd->_resume = spi_nor_resume;
> 
>         if (nor->params->locking_ops) {
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
