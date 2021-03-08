Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F82C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:03:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A02E65130
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A02E65130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V6VU261H9BVGZ8XB1Lc0FBi/qMrxkHDhtImiMSlb9h0=; b=glkoXckToeNRDc/4wobxgiUnn
	2yTfopwUid6dSdyQP50z+mFJwnYNPZZpcDZgJrwQYAXoTRC0gL8By57Qb+h84avYcWX+Q3/b0p3IG
	iG9UPPJUVCfCWO4gljrxaIHgDo23hfvgHPii5T0ahS7wwc4FakFyR3OEhgDTaNtHXQpUt8w96GXzu
	99tneP18nAcupPXM9DalL0feSlB4cU2dRT51c+57A4kGWYHPdbbdsFbrwLgRY6x6X/dO3J9XMAYMn
	/X5oPEbL39JkzOwG8DFmw1estvfgM7ssvph5N9irDy6dD0POC/IY4KpsTkUsuCrtlsRtV8nl+72VM
	qQt+pjY0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBmz-00G4FN-QM; Mon, 08 Mar 2021 09:02:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBmv-00G4Dh-AX
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:02:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 661831F4500B;
 Mon,  8 Mar 2021 09:02:51 +0000 (GMT)
Date: Mon, 8 Mar 2021 10:02:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210308100247.4aba657c@collabora.com>
In-Reply-To: <20210308054447.28418-4-manivannan.sadhasivam@linaro.org>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-4-manivannan.sadhasivam@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_090253_566925_D11E6FA8 
X-CRM114-Status: GOOD (  34.17  )
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

On Mon,  8 Mar 2021 11:14:47 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> The regions are declared using a NAND chip DT property,
> "secure-regions". So let's make use of this property and skip
> access to the secure regions present in a system.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 72 +++++++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 87c23bb320bf..8027f7cb32be 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -431,6 +431,11 @@ struct qcom_nand_controller {
>   * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
>   *				ecc/non-ecc mode for the current nand flash
>   *				device
> + *
> + * @sec_regions:		Array representing the secure regions in the
> + *				NAND chip
> + *
> + * @nr_sec_regions:		Number of secure regions in the NAND chip
>   */
>  struct qcom_nand_host {
>  	struct nand_chip chip;
> @@ -453,6 +458,9 @@ struct qcom_nand_host {
>  	u32 ecc_bch_cfg;
>  	u32 clrflashstatus;
>  	u32 clrreadstatus;
> +
> +	u32 *sec_regions;
> +	u8 nr_sec_regions;
>  };
>  
>  /*
> @@ -662,16 +670,27 @@ static void nandc_set_reg(struct qcom_nand_controller *nandc, int offset,
>  }
>  
>  /* helper to configure address register values */
> -static void set_address(struct qcom_nand_host *host, u16 column, int page)
> +static int set_address(struct qcom_nand_host *host, u16 column, int page)
>  {
>  	struct nand_chip *chip = &host->chip;
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> +	u32 offs = page << chip->page_shift;
> +	int i, j;
> +
> +	/* Skip touching the secure regions if present */
> +	for (i = 0, j = 0; i < host->nr_sec_regions; i++, j += 2) {
> +		if (offs >= host->sec_regions[j] &&
> +		    (offs <= host->sec_regions[j] + host->sec_regions[j + 1]))
> +			return -EIO;
> +	}

Hm, not sure that's a good idea to make this check part of
set_address(). Looks like set_address() can be used for ONFI page
access too, and you definitely don't want to block those
requests. I'd recommend having a separate helper that you can call from
qcom_nandc_{read,write}_{oob,page,page_raw}().

>  
>  	if (chip->options & NAND_BUSWIDTH_16)
>  		column >>= 1;
>  
>  	nandc_set_reg(nandc, NAND_ADDR0, page << 16 | column);
>  	nandc_set_reg(nandc, NAND_ADDR1, page >> 16 & 0xff);
> +
> +	return 0;
>  }
>  
>  /*
> @@ -1491,13 +1510,13 @@ static void qcom_nandc_command(struct nand_chip *chip, unsigned int command,
>  		WARN_ON(column != 0);
>  
>  		host->use_ecc = true;
> -		set_address(host, 0, page_addr);
> +		ret = set_address(host, 0, page_addr);
>  		update_rw_regs(host, ecc->steps, true);
>  		break;
>  
>  	case NAND_CMD_SEQIN:
>  		WARN_ON(column != 0);
> -		set_address(host, 0, page_addr);
> +		ret = set_address(host, 0, page_addr);
>  		break;
>  
>  	case NAND_CMD_PAGEPROG:
> @@ -1615,7 +1634,10 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	host->use_ecc = false;
>  
>  	clear_bam_transaction(nandc);
> -	set_address(host, host->cw_size * cw, page);
> +	ret = set_address(host, host->cw_size * cw, page);
> +	if (ret)
> +		return ret;
> +
>  	update_rw_regs(host, 1, true);
>  	config_nand_page_read(nandc);
>  
> @@ -1943,7 +1965,10 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
>  	/* prepare a clean read buffer */
>  	memset(nandc->data_buffer, 0xff, size);
>  
> -	set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	ret = set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	if (ret)
> +		return ret;
> +
>  	update_rw_regs(host, 1, true);
>  
>  	config_nand_single_cw_page_read(nandc, host->use_ecc);
> @@ -2005,12 +2030,16 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
>  	struct qcom_nand_host *host = to_qcom_nand_host(chip);
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	int ret;
>  
>  	clear_read_regs(nandc);
>  	clear_bam_transaction(nandc);
>  
>  	host->use_ecc = true;
> -	set_address(host, 0, page);
> +	ret = set_address(host, 0, page);
> +	if (ret)
> +		return ret;
> +
>  	update_rw_regs(host, ecc->steps, true);
>  
>  	return read_page_ecc(host, NULL, chip->oob_poi, page);
> @@ -2188,7 +2217,10 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
>  	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, oob,
>  				    0, mtd->oobavail);
>  
> -	set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	ret = set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	if (ret)
> +		return ret;
> +
>  	update_rw_regs(host, 1, false);
>  
>  	config_nand_page_write(nandc);
> @@ -2267,7 +2299,10 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
>  
>  	/* prepare write */
>  	host->use_ecc = false;
> -	set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	ret = set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	if (ret)
> +		return ret;
> +
>  	update_rw_regs(host, 1, false);
>  
>  	config_nand_page_write(nandc);
> @@ -2830,7 +2865,8 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  	struct nand_chip *chip = &host->chip;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct device *dev = nandc->dev;
> -	int ret;
> +	struct property *prop;
> +	int ret, length, nr_elem;
>  
>  	ret = of_property_read_u32(dn, "reg", &host->cs);
>  	if (ret) {
> @@ -2872,6 +2908,24 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  	/* set up initial status value */
>  	host->status = NAND_STATUS_READY | NAND_STATUS_WP;
>  
> +	/*
> +	 * Look for secure regions in the NAND chip. These regions are supposed
> +	 * to be protected by a secure element like Trustzone. So the read/write
> +	 * accesses to these regions will be blocked in the runtime by this
> +	 * driver.
> +	 */
> +	prop = of_find_property(dn, "secure-regions", &length);
> +	if (prop) {
> +		nr_elem = length / sizeof(u32);
> +		host->nr_sec_regions = nr_elem / 2;
> +
> +		host->sec_regions = devm_kcalloc(dev, nr_elem, sizeof(u32), GFP_KERNEL);
> +		if (!host->sec_regions)
> +			return -ENOMEM;
> +
> +		of_property_read_u32_array(dn, "secure-regions", host->sec_regions, nr_elem);
> +	}
> +
>  	ret = nand_scan(chip, 1);
>  	if (ret)
>  		return ret;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
