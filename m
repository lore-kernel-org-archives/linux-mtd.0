Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B01C10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 11:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0130206BA
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 11:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPvd3LN3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="zSFiF/rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0130206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIQunphuj+A/Git81DaHznutRiEYHITW9n0w0EQ07uw=; b=dPvd3LN3J+kZ9W
	jwSYM5OJ/5DfUcfkzeo1NGFimp5/W+RrmLjHDC3d00/b5nf03JT0y8+ZVzWM95NLrYQJcfxfOcOzf
	RX4j5OHXfmn6Kaia+59bLxqSp1HYHOKlqGgAhSeN2wCoKjvHjt5QOnJUhQPqunCX+7B1PBov8RqIX
	HOkJUD2GvxDZBNkFHCf89TROndeXCvjmgYmEqcm8+Tc7qUjBvGYPaoe5y4IKI5h5XMbh4A9R5EosG
	X+6l0vOBnXyk6DmoYNYCY0k5AU9Shlv86m1hBSqUkj3z6DbG2S0HFuCxHWnplywHGJs2jBowaDqdd
	ApqEV47mnFb9OV+mLdLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG0GU-00021N-J8; Mon, 15 Apr 2019 11:59:10 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG0GR-00020f-Nx
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 11:59:09 +0000
X-IronPort-AV: E=Sophos;i="5.60,353,1549954800"; d="scan'208";a="28358025"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 15 Apr 2019 04:59:05 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Mon, 15 Apr 2019 04:59:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQEGQ+Ntcw9VR32H1zUTkWjDHXLHAOWzGC1WHCx+/sM=;
 b=zSFiF/rbJibbbF5bpHK7BXCavxFGemJTjr3mXEm3Em5YLnNldWRlbFKRzEYH57JPSZuNGSj5buvNemRN0e4j+XhTDpsRGmAGVF5uBAEGImVOb2E9lNqNToHhMjSqZu1upp2UwmZiiWn+0W52MeE99YD1Jb9ov/bCO8LZ8lPuH2o=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3876.namprd11.prod.outlook.com (10.255.128.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Mon, 15 Apr 2019 11:59:00 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 11:59:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <bbrezillon@kernel.org>, <marek.vasut@gmail.com>,
 <richard@nod.at>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Rework hwcaps selection for the spi-mem
 case
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Rework hwcaps selection for the
 spi-mem case
Thread-Index: AQHU7vFzIg53lLHkV06Pj9Z90zbOsqY9J06A
Date: Mon, 15 Apr 2019 11:59:00 +0000
Message-ID: <6876862c-7c04-4338-634f-1a2abdd75672@microchip.com>
References: <20190409162651.24593-1-vigneshr@ti.com>
 <20190409162651.24593-3-vigneshr@ti.com>
In-Reply-To: <20190409162651.24593-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P193CA0020.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::30) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae6c50ba-f134-4f03-2794-08d6c199bf06
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB3876; 
x-ms-traffictypediagnostic: BN6PR11MB3876:
x-microsoft-antispam-prvs: <BN6PR11MB38768B004F2D77DD9C1F8C89F02B0@BN6PR11MB3876.namprd11.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(366004)(396003)(39860400002)(199004)(189003)(386003)(53936002)(53546011)(102836004)(6506007)(71200400001)(71190400001)(52116002)(186003)(97736004)(6246003)(5660300002)(31686004)(3846002)(256004)(26005)(14444005)(68736007)(76176011)(478600001)(36756003)(14454004)(72206003)(305945005)(86362001)(66066001)(8936002)(2906002)(6116002)(25786009)(6436002)(99286004)(7736002)(81166006)(81156014)(105586002)(8676002)(110136005)(54906003)(6486002)(486006)(2616005)(316002)(229853002)(476003)(31696002)(11346002)(446003)(106356001)(6512007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3876;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LF/R3My2gQ44dMeGQwy/BJ9Me6qO0LpEvizF7cOXiJ4Q26j+flM5Jx+DefTJdyyaOPwSJ/EJ4LcsESRedoBFXy1VrI58vwtEM6u/G9Ruaoo+Dwy6NRZDhjbRnjDy31ERCVSeQ+E2+Tfkn9f1OJEZGKvFC6nTqSW9/IWR4FJoaK/Us8fnkEv+dMSTVv2a0f0Qxg6LXu8s+ESaK098ws/FuhVsb2N4e8gz/ESJ2XFFBVoN9tZ3Ik4g8/mLou8bOcmID6xF1o1xhKtJhxd6FKfFMpYj825Sp8OLh+/+D73BSH29jf6IOF6uhpoO/MAQdsD/2Tg4uGLKIxNAP44KbKjiGeKrh/yYxLP2NuAMvIM4xcZMbIBiuuLcOdJbf6v5QnX+bys3g3po277/8EHjNTJzpZc1sWjO/IR9gYfdvYkFZ/c=
Content-ID: <689B1C83BA369348BBD50E5CD20BE50C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6c50ba-f134-4f03-2794-08d6c199bf06
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 11:59:00.4047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3876
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_045908_007464_CA24A93F 
X-CRM114-Status: GOOD (  25.72  )
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
Cc: frieder.schrempf@exceet.de, yogeshnarayan.gaur@nxp.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 04/09/2019 07:26 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> The spi-mem layer provides a spi_mem_supports_op() function to check
> whether a specific operation is supported by the controller or not.
> This is much more accurate than the hwcaps selection logic based on
> SPI_{RX,TX}_ flags.
> 
> Rework the hwcaps selection logic to use spi_mem_supports_op() when
> nor->spimem != NULL.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> Chagnes wrt RFC:
> Fix checkpatch issues
> Rebase onto latest
> 
>  drivers/mtd/spi-nor/spi-nor.c | 164 ++++++++++++++++++++++++++--------
>  include/linux/mtd/spi-nor.h   |  14 +++
>  2 files changed, 142 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03c8c346c9ae..d48ae3c9661d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2852,6 +2852,110 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>  	return ret;
>  }
>  
> +static int spi_nor_spimem_check_readop(struct spi_nor *nor,
> +				       const struct spi_nor_read_command *read)
> +{
> +	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 1),
> +					  SPI_MEM_OP_ADDR(3, 0, 1),
> +					  SPI_MEM_OP_DUMMY(0, 1),
> +					  SPI_MEM_OP_DATA_IN(0, NULL, 1));
> +
> +	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(read->proto);
> +	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(read->proto);
> +	op.data.buswidth = spi_nor_get_protocol_data_nbits(read->proto);
> +	op.dummy.buswidth = op.addr.buswidth;
> +	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
> +			  op.dummy.buswidth / 8;
> +
> +	/*
> +	 * First test with 3 address bytes. The opcode itself might already
> +	 * be a 4B addressing opcode but we don't care, because SPI controller
> +	 * implementation should not check the opcode, but just the sequence.
> +	 */
> +	if (!spi_mem_supports_op(nor->spimem, &op))
> +		return -ENOTSUPP;
> +
> +	/* Now test with 4 address bytes. */

shouldn't this be verified only when the previous check failed?

> +	op.addr.nbytes = 4;
> +	if (!spi_mem_supports_op(nor->spimem, &op))
> +		return -ENOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int spi_nor_spimem_check_progop(struct spi_nor *nor,

s/progop/pp?

> +				       const struct spi_nor_pp_command *pp)
> +{
> +	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(pp->opcode, 1),
> +					  SPI_MEM_OP_ADDR(3, 0, 1),
> +					  SPI_MEM_OP_NO_DUMMY,
> +					  SPI_MEM_OP_DATA_OUT(0, NULL, 1));
> +
> +	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(pp->proto);
> +	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(pp->proto);
> +	op.data.buswidth = spi_nor_get_protocol_data_nbits(pp->proto);
> +
maybe we can introduce a spi_nor_spimem_check_op() for the block from below to
reduce code duplication

> +	/*
> +	 * First test with 3 address bytes. The opcode itself might already
> +	 * be a 4B addressing opcode but we don't care, because SPI controller
> +	 * implementation should not check the opcode, but just the sequence.
> +	 */
> +	if (!spi_mem_supports_op(nor->spimem, &op))
> +		return -ENOTSUPP;
> +
> +	/* Now test with 4 address bytes. */
> +	op.addr.nbytes = 4;
> +	if (!spi_mem_supports_op(nor->spimem, &op))
> +		return -ENOTSUPP;
> +
> +	return 0;
> +}
> +
> +static void
> +spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor,
> +			     const struct spi_nor_flash_parameter *params,
> +			     u32 *hwcaps)
> +{
> +	unsigned int cap;
> +
> +	/* DTR modes are not supported yet, mask them all. */
> +	*hwcaps &= ~SNOR_HWCAPS_DTR;
> +
> +	/* X-X-X modes are not supported yet, mask them all. */
> +	*hwcaps &= ~SNOR_HWCAPS_X_X_X;
> +
> +	/* Start with read commands. */
> +	for (cap = 0; cap < 32; cap++) {

maybe a macro for 32?

> +		int idx;
> +
> +		if (!(*hwcaps & BIT(cap)))
> +			continue;
> +
> +		idx = spi_nor_hwcaps_read2cmd(BIT(cap));
> +		if (idx < 0)
> +			continue;
> +
> +		if (spi_nor_spimem_check_readop(nor, &params->reads[idx]))
> +			*hwcaps &= ~BIT(cap);
> +	}
> +
> +	/* Now check program commands. */
> +	for (cap = 0; cap < 32; cap++) {

can't we use a single loop for both read & pp?

> +		int idx;
> +
> +		if (!(*hwcaps & BIT(cap)))
> +			continue;
> +
> +		idx = spi_nor_hwcaps_pp2cmd(BIT(cap));
> +		if (idx < 0)
> +			continue;
> +
> +		if (spi_nor_spimem_check_progop(nor,
> +						&params->page_programs[idx]))
> +			*hwcaps &= ~BIT(cap);
> +	}
> +}
> +
>  /**
>   * spi_nor_read_sfdp_dma_unsafe() - read Serial Flash Discoverable Parameters.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -4259,16 +4363,25 @@ static int spi_nor_setup(struct spi_nor *nor,
>  	 */
>  	shared_mask = hwcaps->mask & params->hwcaps.mask;
>  
> -	/* SPI n-n-n protocols are not supported yet. */
> -	ignored_mask = (SNOR_HWCAPS_READ_2_2_2 |
> -			SNOR_HWCAPS_READ_4_4_4 |
> -			SNOR_HWCAPS_READ_8_8_8 |
> -			SNOR_HWCAPS_PP_4_4_4 |
> -			SNOR_HWCAPS_PP_8_8_8);
> -	if (shared_mask & ignored_mask) {
> -		dev_dbg(nor->dev,
> -			"SPI n-n-n protocols are not supported yet.\n");
> -		shared_mask &= ~ignored_mask;
> +	if (nor->spimem) {
> +		/*
> +		 * When called from spi_nor_probe(), all caps are set and we
> +		 * need to discard some of them based on what the SPI
> +		 * controller actually supports (using spi_mem_supports_op()).
> +		 */
> +		spi_nor_spimem_adjust_hwcaps(nor, params, &shared_mask);
> +	} else {
> +		/*
> +		 * SPI n-n-n protocols are not supported when the SPI
> +		 * controller directly implements the spi_nor interface.
> +		 * Yet another reason to switch to spi-mem.
> +		 */
> +		ignored_mask = SNOR_HWCAPS_X_X_X;
> +		if (shared_mask & ignored_mask) {
> +			dev_dbg(nor->dev,
> +				"SPI n-n-n protocols are not supported.\n");
> +			shared_mask &= ~ignored_mask;
> +		}
>  	}
>  
>  	/* Select the (Fast) Read command. */
> @@ -4591,11 +4704,11 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	struct spi_device *spi = spimem->spi;
>  	struct flash_platform_data *data;
>  	struct spi_nor *nor;
> -	struct spi_nor_hwcaps hwcaps = {
> -		.mask = SNOR_HWCAPS_READ |
> -			SNOR_HWCAPS_READ_FAST |
> -			SNOR_HWCAPS_PP,
> -	};
> +	/*
> +	 * Enable all caps by default. The core will mask them after
> +	 * checking what's really supported using spi_mem_supports_op().
> +	 */
> +	struct spi_nor_hwcaps hwcaps = { .mask = SNOR_HWCAPS_ALL };

const struct spi_nor_hwcaps hwcaps = { .mask = SNOR_HWCAPS_ALL };

Cheers,
ta

>  	char *flash_name;
>  	int ret;
>  
> @@ -4624,27 +4737,6 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  
>  	spi_mem_set_drvdata(spimem, nor);
>  
> -	if (spi->mode & SPI_RX_OCTAL) {
> -		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> -
> -		if (spi->mode & SPI_TX_OCTAL)
> -			hwcaps.mask |= (SNOR_HWCAPS_READ_1_8_8 |
> -					SNOR_HWCAPS_PP_1_1_8 |
> -					SNOR_HWCAPS_PP_1_8_8);
> -	} else if (spi->mode & SPI_RX_QUAD) {
> -		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
> -
> -		if (spi->mode & SPI_TX_QUAD)
> -			hwcaps.mask |= (SNOR_HWCAPS_READ_1_4_4 |
> -					SNOR_HWCAPS_PP_1_1_4 |
> -					SNOR_HWCAPS_PP_1_4_4);
> -	} else if (spi->mode & SPI_RX_DUAL) {
> -		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
> -
> -		if (spi->mode & SPI_TX_DUAL)
> -			hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
> -	}
> -
>  	if (data && data->name)
>  		nor->mtd.name = data->name;
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index ac16745f5ef8..1d56c437f553 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -523,6 +523,20 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_PP_1_8_8	BIT(21)
>  #define SNOR_HWCAPS_PP_8_8_8	BIT(22)
>  
> +#define SNOR_HWCAPS_X_X_X	(SNOR_HWCAPS_READ_2_2_2 |	\
> +				 SNOR_HWCAPS_READ_4_4_4 |	\
> +				 SNOR_HWCAPS_READ_8_8_8 |	\
> +				 SNOR_HWCAPS_PP_4_4_4 |		\
> +				 SNOR_HWCAPS_PP_8_8_8)
> +
> +#define SNOR_HWCAPS_DTR		(SNOR_HWCAPS_READ_1_1_1_DTR |	\
> +				 SNOR_HWCAPS_READ_1_2_2_DTR |	\
> +				 SNOR_HWCAPS_READ_1_4_4_DTR |	\
> +				 SNOR_HWCAPS_READ_1_8_8_DTR)
> +
> +#define SNOR_HWCAPS_ALL		(SNOR_HWCAPS_READ_MASK |	\
> +				 SNOR_HWCAPS_PP_MASK)
> +
>  /**
>   * spi_nor_scan() - scan the SPI NOR
>   * @nor:	the spi_nor structure
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
