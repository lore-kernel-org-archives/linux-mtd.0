Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50370C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 12:14:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C8D64E83
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 12:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C8D64E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0At0BlRR9LStWk9zJK9es/MiNy0pEUpkUwGO47mIfdg=; b=QQZt3LoJKpmZbQ/2cut1QUJzK
	s3S9AXZmMZUndu4/MPOkIoPg8ve6G4pSMIVT+gNY1ZclJ2gMu9mq432XnREcTx0fMti51cqPOVdK6
	vRCltvFYYpfAd8S8nS1Wg1rvr8Nj6SaZgp99ZGnVnYWjMgkUF0q/1Cca8NCu1hdqgIW+MOyrp5kdX
	lyu028srnF2Y16bXCc/iJZahWfRLQjPqtxMNDHBfilyE3PjbOHFSO751KO1hq06dSoZlwQa5dDw2h
	P6Fpvd0NSsE3GPUFcD+xNl3NbgA+rHP0zcB1ZDfwg7/Epf3kLz1YstAL8XJDSOBwvp9TpNoAQl41k
	i7tnQMQlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLm65-00Fo4v-N2; Mon, 15 Mar 2021 12:13:22 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLlr7-00FjRl-P5
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 11:58:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FBvjQo048839;
 Mon, 15 Mar 2021 06:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615809465;
 bh=f/R8sG7Jztu38gqUvCHncKd6M+ZCGyQKulY2E0Bwm7k=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=QZDtz0myII67z+q3h/J1Xae9BD9jlMZCItlAOnJTxGhpKpKLJXBSE96TY3yt+s1sx
 5sOvlAn6HY3shhIk5tCk2XSBS00yPS82LtAgEP9AL5IHwS26chu5pPT0FLqq4r9AV9
 zDelNhaOpvCa/oQOzQKDid0nKIVjJtO96nL6rcm4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FBvjcb055115
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 06:57:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 06:57:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 06:57:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FBviWq080346;
 Mon, 15 Mar 2021 06:57:45 -0500
Date: Mon, 15 Mar 2021 17:27:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 5/6] mtd: spi-nor: spansion: Add status check for
 multi-die parts
Message-ID: <20210315115741.u6ci5v63kwjsoxuz@ti.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <1fa9ac4c5f3d66dea51549458a1d32823b06bb10.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1fa9ac4c5f3d66dea51549458a1d32823b06bb10.1615523176.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_115754_755423_005C03E9 
X-CRM114-Status: GOOD (  25.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/03/21 06:44PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The multi-die package parts from Spansion/Cypress require to check
> the status register value in each die to detemine the device is
> ready. This patch adds a helper that queries status of each die by
> Read Any Register command. The device specific ->ready() hook will
> call this helper with the number of dummy cycles and die size.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - New in v3
> 
>  drivers/mtd/spi-nor/spansion.c | 46 ++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b5b5df4836c6..5742212fde2e 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -10,6 +10,7 @@
>  
>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
> +#define SPINOR_REG_CYPRESS_STR1V		0x00800000
>  #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
>  #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
> @@ -179,6 +180,51 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
>  	return 0;
>  }
>  
> +/**
> + * spansion_mdp_ready() - Query the Status Register via Read Any Register
> + *                        command for multi-die package parts that do not
> + *                        support legacy RDSR(05h)

Same comment about the use of "legacy".

> + * @nor:	pointer to 'struct spi_nor'.
> + * @reg_dummy:	number of dummy cycles for register read
> + * @die_size:	size of each die to determine the number of dies
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
> +{
> +	int ret;
> +	u32 base;
> +	u8 sr;
> +
> +	for (base = 0; base < nor->params->size; base += die_size) {
> +		ret = spansion_read_any_reg(nor,
> +					    base + SPINOR_REG_CYPRESS_STR1V,
> +					    reg_dummy, &sr);
> +		if (ret)
> +			return ret;
> +
> +		if (sr & (SR_E_ERR | SR_P_ERR)) {
> +			if (sr & SR_E_ERR)
> +				dev_err(nor->dev, "Erase Error occurred\n");
> +			else
> +				dev_err(nor->dev, "Programming Error occurred\n");
> +
> +			spi_nor_clear_sr(nor);

This will clear the error flags on all dies. Ok.

> +
> +			ret = spi_nor_write_disable(nor);
> +			if (ret)
> +				return ret;
> +
> +			return -EIO;
> +		}
> +
> +		if (sr & SR_WIP)
> +			return 0;
> +	}
> +
> +	return 1;
> +}
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
