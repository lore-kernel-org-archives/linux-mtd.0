Return-Path: <SRS0=Xvxm=DK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A462C41604
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Oct 2020 11:41:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1096206C9
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Oct 2020 11:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TA7SHk6V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XMc0S3QS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1096206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=niWPxgVZBGl3g3fCL5T3N9fxon3hyxpR0+tANwVbZ0Y=; b=TA7SHk6VxXHZqWRxdiEWL9uxA
	8F+gg+zT2qHzCsoK44pTXpdRBrWtr80Yw8yELnG1/o/cdw6ZBvgwzKF1mZ31hb6uIpFcdN+XppVVk
	m+l9KcXNL2QJWIO0/veb+XYfZ0SJy7gk+dQrmr6QuqtGehGiy9P//y5dw6MnkYDSAG7GUuvypNq8R
	2Qb+sOSQUO7EaLuFPgdrl0SHJ0Ww0sO5QL26+MeQSjJLjSRehNV7jZo/TQtGb2mU4GOZLyy+l5dnh
	VWZLt+E6nysVReqN+L51X8rXdBSLfBS0326NqYAKR+MTB03ox1E7MywwLdObeva9Dy0q9qpgG612v
	az3YpsY/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOftu-0001Bz-Up; Sat, 03 Oct 2020 11:40:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOftm-0001BW-Tq
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2020 11:40:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 093BeE4v060421;
 Sat, 3 Oct 2020 06:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601725214;
 bh=FTAaKOrroH90dUpVpyn5QsXNTRmWLKDF16lL3JfcpP4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XMc0S3QS2J2KV5MaWFv6m67pffjX4P8ZW1ashIwLRXxNvxqJbicJZQlxzWPZNL2SC
 O1mZ5Z4mJtH3uSUB2Bf768LCR2qOXYGZjRjfaD1z9FHpQ3tjujWk2nDcXHnQTR4T1B
 B7ZDUGidgl/wMH1I2W7I7g3r4BB6aAiZiBB6eNQE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 093BeE9J039175
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 3 Oct 2020 06:40:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 3 Oct
 2020 06:40:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 3 Oct 2020 06:40:13 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 093Be9LR090992;
 Sat, 3 Oct 2020 06:40:10 -0500
Subject: Re: [PATCH v15 14/15] mtd: spi-nor: spansion: add support for Cypress
 Semper flash
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20201001202045.21499-1-p.yadav@ti.com>
 <20201001202045.21499-15-p.yadav@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6690e22f-b2e4-7c89-397c-2c1aafb0339a@ti.com>
Date: Sat, 3 Oct 2020 17:10:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001202045.21499-15-p.yadav@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_074023_078144_3B0F4C5E 
X-CRM114-Status: GOOD (  19.84  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

On 10/2/20 1:50 AM, Pratyush Yadav wrote:
> +
> +/**
> + * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @enable:              whether to enable or disable Octal DTR
> + *
> + * This also sets the memory access latency cycles to 24 to allow the flash to
> + * run at up to 200MHz.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +	struct spi_mem_op op;
> +	u8 *buf = nor->bouncebuf;
> +	int ret;
> +
> +	if (enable) {
> +		/* Use 24 dummy cycles for memory array reads. */
> +		ret = spi_nor_write_enable(nor);
> +		if (ret)
> +			return ret;
> +
> +		*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> +		op = (struct spi_mem_op)
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> +				   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
> +						   1),
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +		if (ret)
> +			return ret;
> +
> +		ret = spi_nor_wait_till_ready(nor);
> +		if (ret)
> +			return ret;
> +
> +		nor->read_dummy = 24;
> +	}
> +
> +	/* Set/unset the octal and DTR enable bits. */
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		*buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> +	else
> +		*buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +
> +	op = (struct spi_mem_op)
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> +			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
> +					   SPINOR_REG_CYPRESS_CFR5V,
> +					   1),
> +			   SPI_MEM_OP_NO_DUMMY,
> +			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +	if (!enable)
> +		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		return ret;
> +
> +	/* Give some time for the mode change to take place. */
> +	usleep_range(1000, 1500);
> +

According to datasheet, it seems switch to Octal DTR mode is immediate.
So, I don't think this delay is necessary. Instead as a confirmation
that mode switch is successful can we just read back
SPINOR_REG_CYPRESS_CFR5V in Octal DTR mode and see if value reflects
what was written?

Same applies for 15/15 as well.

> +	return 0;
> +}
> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
