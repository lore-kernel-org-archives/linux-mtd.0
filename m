Return-Path: <SRS0=dEjv=AT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECEBC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:11:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2A8207C4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wPwgUDGc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HJmi0g34";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="hRxflZnZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2A8207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fE+raYS+M9gdMY2JcPRo/xkdnE3v7pNNqGrd7X9/POE=; b=wPwgUDGcoSvC5rnO5vAThpfFI
	j4baIA2aEBtaLnPcs/QhF2PNTp/blPVVYDiTw5AYwRzJTYHlKlJDLINqVE0unQLyXypvKHGhtdMVh
	d1jFSMw5nu22MfHU6oPR2E0GeTmL1KLGctDV5JrHCNPn9+wgTVuUsi3LR2tAJZyEshCWHLCt0OGSS
	KMpG+JGQoEGtDkw5Nbai/0RrCKFurGr56/mMWzyGbksqK4/xXF/D4i0+3l6dcQ6Z7erYM2puRFkDE
	PIQm4N9FkktF2M8vYXWwtxu/mgCzdr0146c+MNSvjb1oAqVwKxXItITu0d+FtCUjRiy/wcAzOBn6l
	/qi99+nXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCeY-0006yx-OX; Wed, 08 Jul 2020 16:10:34 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCeV-0006xu-IV; Wed, 08 Jul 2020 16:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594224631; x=1625760631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ggM0Ec9o3VtxgaiChxbjiOmWxBjsX71Py8u9L3AQ2n0=;
 b=HJmi0g34C87kGu3DRq4QgnmVWfNvec11cSOjsCMWQElZnsH8xedjFUd+
 qKOoNDGE9eB5urIaSIQ6HEDSQpLgcFwUESAsP2JSlKy1PH3w2RJYksAk1
 psIvFGt4odmAVDG+KvOhSVCpXrP/bSQ0cerJM6wpp9AqGew+1hyBTGj19
 +niQxIYYJqy9C1Qbj93E7TMrpUvpYPw7YDr7fkthFF+rOVe4A7sfvaGqA
 QaFBfgNy9QjcLMzVvUat4734fkms38DWzbzNdyCCtuskIlvwFrDc2Hpay
 J+XDEkLzmRBos/FkWwm3jEZEGL0freqwRTq0TglT7snV2hfbvVMgk71MF Q==;
IronPort-SDR: xv2gLDkjfNArzyNHKPIT6R8llbm1IbIVX8tkZ+TCvLgNp+WFN8TvcFiujx/wZUM363g+MiPZMt
 b99f0PTI5JRFOGbGpTvKZLKHwVZC/o1jjlUKKYwVBlxnwVTyj79xrfHkaucgblAMisN3HIvT65
 Eq/ni6n+oAbI2BlkB9STu0Ukwqx+1E1XRjSrgirEXHRNRJfR6WnSqNfQJJCMIzBNJY9smQ9Cxj
 1CiczylSwrHHtqRjyt40g6BC8VJRIMRlxf7wOdqyuEexVtA+cfmNYGd0LifhYh0x9GFgBrtcXB
 ZuY=
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="79171833"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 09:10:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 09:10:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 8 Jul 2020 09:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbAOFPsy+BKZ5fQ3YaDaTB+ow0CHDJPjnSPdLlkE07Aqf1kFdoZ8Vp835I/7F52EzosTiZsmlkFiOJMZkP6pDiHPNOe3FdcSH5SfUXPk4Ma1lmn3khCAJv/dOhX6ZPYhk911tca5jk/mvbHG//+lwAwoMISttVZ3NXyw6bNEVkU8nLxY5oppfXbgBpKD10cH6sVunN/YI6l45SFswjdw5vCon2Tl6PTnlZTQ/JUq2ZGGkUayJAB0fX7H1y/sopRCg0UC7ig0Izs+7cQcV6wFqbZ7Plqg6gVrtG6bu+U7f9fRkU4YEbvUqN/kGlDiAiCbJKYv5MOIMu/7y4XXUbFfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggM0Ec9o3VtxgaiChxbjiOmWxBjsX71Py8u9L3AQ2n0=;
 b=i4aShXorkbHJWqHOKj0iBrEMs/iMPPOo0USv3PR1i2xVeSfu4mE7obXKvZe8u68zSVWySEBs/KRij9yITcmeGABDO+vNFN0PCtScEE2m6vuLJnnVgr2QyxmebX2Lnnb2CV4Pe9bvnVathyPc3FE6Kye2gdzhx1yiYt0z3h/FntTZKR0Z+ghkeNDkJoO/KdtqINwDNGXiKy3kHR5DMZz6rEuO+WSJqzUmWDmXs730InGRxBjCi2j3++G0ADsv6QwoMcSV4oCkXtkY8m4SFKLtIQZzcotU/Gvu0AixanLs3nskgc201J4PMBbSSfBmRjTlYqtDR0feEqCmfkHKhIhorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggM0Ec9o3VtxgaiChxbjiOmWxBjsX71Py8u9L3AQ2n0=;
 b=hRxflZnZmSjcIzyhzAs6ThW77HGuDtkjd5u/StFYb0wdYfGL3uHlEtztxATcOvJ4AzcolZHB7LKSK4FTpRMRIa0OZnIVbfM3ThL1DqkQHLvUCGhXsjzVlY4hxWuE36PkMrESlvY6bYzA2FJNgmnB2vOFi/qS7DBVbdKGnQh23tw=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3702.namprd11.prod.outlook.com (2603:10b6:a03:f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 8 Jul
 2020 16:10:28 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 16:10:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 13/17] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Thread-Topic: [PATCH v10 13/17] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Thread-Index: AQHWVUJL1YuQPPY7GUeYXQqfS3m8rw==
Date: Wed, 8 Jul 2020 16:10:28 +0000
Message-ID: <ccc128f1-2e7b-e64f-c958-ad5cc272085a@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-14-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-14-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39206fc7-e3ff-4902-abb0-08d823596e49
x-ms-traffictypediagnostic: BYAPR11MB3702:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3702566BEFDE19ED7AB2D7EDF0670@BYAPR11MB3702.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 00kezQSJs2ujYWeGXDcW0vEPQpIPbbLYy/k2v1uCFK4J72IAoZ5wTOILKMM3eR3zm6kHR6jzJM/5nQmZILMHeCaxTHdj7I/hbuYD6Rick/E1BjLZSEv9RJwKGTZn/ijr8okCTNU8Zm9o3nxJzQolv4bhNQD2YQp//jWlhLQ+Z94s8LEcTE0gmtMn9vuvqpmCwAMP5nS23mu8N6UgepuL0/dtUFuEgiYJHOqu/i81LfHVt85rmqyq5mAJyDmkoKr6QlrmiKq3fQje0aa9F//p8rb7LR+urfeix62OFqRFt6ZpdqJPzVL8PnZ3hgL66hwHY4M09HMERpoDcbhaJtu+8qpzMwgdqNRqbuLBwomcRfspBv6kPmko41WSflhGGr7NoJbdVHBlpKejRjIRuOCU3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(346002)(366004)(396003)(7416002)(66446008)(66476007)(64756008)(110136005)(8676002)(53546011)(86362001)(26005)(71200400001)(316002)(6486002)(8936002)(2616005)(2906002)(54906003)(4326008)(6506007)(6512007)(5660300002)(186003)(31686004)(36756003)(66556008)(66946007)(31696002)(91956017)(76116006)(478600001)(83380400001)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Ul7g6+WRaeURLWhU8gG//FWYbStiCkUzAxtnz2XKfHfCcCD0ZtdGl51xzODwvhQ5Hn7jmwGljO9oPpSNVaZcGMQubQZJmmy3SC/HopfhzvhnZQJIGTVrH/t9LmwoScCXP7VxvOL/GtNU6IL+HzK3snnPDF8yisCWC6vPAYhic/zsqahyVecv54MX4a8qsr0RQ6q9WU12++7yorwSnAxY9ruIXSBG9Jo6g+O3gzc8wiViMTJmfrHzv2uzCeLN1VQ1RHnz7vetSp1FIWmBCRm5FBUp+73pFe62+5tTyLUd8Ad5aobZCyQ2z7/O9cnVg9on5YtAyZtxQExFCcgFqFmT58ygEaRmanCu1363SmoA3cy3lPph/s5/qT80YIjcFuKHZUKtMiBMM0u8Dsf3bBbnw9FWqIDcKquFL9NF2mZ4PGnihXnmVchkb0iVehl4JkLoIali+tBq3ysaXYEkOMj8IQmryKqinWSqXOPMKjoBaaI=
Content-ID: <E9AC9FF3E2816148A5D1C98C5A389205@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39206fc7-e3ff-4902-abb0-08d823596e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 16:10:28.1239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9iKJDSSEgmQZdPWSLn6qs6LBGopAzpwma6tNeTydDx5ko5i7B2Sq9TngDfstu4cS1vEdCOL0+eF+Rgt1MujRiAbXamIpIlkUoOlS/DfOem4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_121031_766730_EEA142C9 
X-CRM114-Status: GOOD (  23.62  )
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
> Perform a Soft Reset on shutdown on flashes that support it so that the
> flash can be reset to its initial state and any configurations made by
> spi-nor (given that they're only done in volatile registers) will be
> reset. This will hand back the flash in pristine state for any further
> operations on it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 42 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |  2 ++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4a1f6b343534..27ad9bab06dc 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -40,6 +40,9 @@
> 
>  #define SPI_NOR_MAX_ADDR_WIDTH 4
> 
> +#define SPI_NOR_SRST_SLEEP_MIN 200
> +#define SPI_NOR_SRST_SLEEP_MAX 400
> +
>  /**
>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>   *                        extension type.
> @@ -3201,6 +3204,41 @@ static int spi_nor_init(struct spi_nor *nor)
>         return 0;
>  }
> 
> +static void spi_nor_soft_reset(struct spi_nor *nor)
> +{
> +       struct spi_mem_op op;
> +       int ret;
> +
> +       op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 8),
> +                       SPI_MEM_OP_NO_DUMMY,
> +                       SPI_MEM_OP_NO_ADDR,
> +                       SPI_MEM_OP_NO_DATA);
> +       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret) {
> +               dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +               return;
> +       }
> +
> +       op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 8),
> +                       SPI_MEM_OP_NO_DUMMY,
> +                       SPI_MEM_OP_NO_ADDR,
> +                       SPI_MEM_OP_NO_DATA);
> +       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret) {
> +               dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +               return;
> +       }
> +
> +       /*
> +        * Software Reset is not instant, and the delay varies from flash to
> +        * flash. Looking at a few flashes, most range somewhere below 100
> +        * microseconds. So, sleep for a range of 200-400 us.
> +        */
> +       usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
> +}
> +
>  /* mtd resume handler */
>  static void spi_nor_resume(struct mtd_info *mtd)
>  {
> @@ -3220,6 +3258,10 @@ void spi_nor_restore(struct spi_nor *nor)
>         if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
>             nor->flags & SNOR_F_BROKEN_RESET)
>                 nor->params->set_4byte_addr_mode(nor, false);
> +
> +       if (nor->info->flags & SPI_NOR_OCTAL_DTR_READ &&

Why this limitation? Can't we make the software reset available for all
the modes?

> +           nor->flags & SNOR_F_SOFT_RESET)
> +               spi_nor_soft_reset(nor);
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_restore);
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cd549042c53d..299685d15dc2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -51,6 +51,8 @@
>  #define SPINOR_OP_CLFSR                0x50    /* Clear flag status register */
>  #define SPINOR_OP_RDEAR                0xc8    /* Read Extended Address Register */
>  #define SPINOR_OP_WREAR                0xc5    /* Write Extended Address Register */
> +#define SPINOR_OP_SRSTEN       0x66    /* Software Reset Enable */
> +#define SPINOR_OP_SRST         0x99    /* Software Reset */
> 
>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>  #define SPINOR_OP_READ_4B      0x13    /* Read data bytes (low frequency) */
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
