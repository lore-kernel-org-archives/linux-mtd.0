Return-Path: <SRS0=mw3I=EN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52582C388F9
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 07:59:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA7520704
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 07:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nUotc+O1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="USgwjntv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA7520704
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qdTvHizadU4bjt4PR3oSu9UMiA79fxDyJNCghhdjkfM=; b=nUotc+O1cykGaYdjrnp88JeXB
	SppiKB870jpFEQQIfZsXfeFnk+UFTjkWDATA9Z8snAGLOHc0ujITy0eYtb3ifBR1bGt+q3urGRAQW
	/FwxLsQUMlP3GOIgkuU8vy3u7opJ7TOPlBqdu5SQQwGwewlkARWY8ZGmHRStybjIvSU3DUevWrchI
	ZNhJc75phVG/FJTpZKsCYitHc/OEjhbhoCAf0Oi9D360CZ3G+OyYzvWTSORq2G4TQhgm/9fSHcq/n
	YbFPJApIIF3GaZCA5KMCr+XScGHCX87uPyAVHZFK6fIYsMMtxGw6DnmsHEfoTF37Ri/AGG8Dlk+Ok
	LQnroqDcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJ7y-0007Xz-2E; Sat, 07 Nov 2020 07:59:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJ7u-0007Wi-AX
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2020 07:59:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A77x3R2094841;
 Sat, 7 Nov 2020 01:59:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604735943;
 bh=m1ljeRvRQu70/RVn7t4RTCGUhrp33lrcApjaJLu5Ai4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=USgwjntvc/+INV9C8mO0snj3P2//moEB3JE2jxz3fJkO2gLonQVjQVm/PUjOliHFW
 m0MyPqHV2fHBVktNevXvD5QeoBX59Va6zFTlcvT7hfrHv91MJIRWy5xr3CXibgzF9I
 UDDsQYkxFqt4txBtIQip0Brhv3GjCk2lbqWMv5L0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A77x2MW078432
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 7 Nov 2020 01:59:03 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 7 Nov
 2020 01:59:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 7 Nov 2020 01:59:02 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A77wxYD044540;
 Sat, 7 Nov 2020 01:59:00 -0600
Subject: Re: [PATCH v16 14/15] mtd: spi-nor: spansion: add support for Cypress
 Semper flash
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <20201005153138.6437-15-p.yadav@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <7d058da8-90ef-8f71-fe86-cc0b27a2895a@ti.com>
Date: Sat, 7 Nov 2020 13:28:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005153138.6437-15-p.yadav@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_025911_320944_51E7B5B4 
X-CRM114-Status: GOOD (  14.94  )
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

Hi,

[...]

On 10/5/20 9:01 PM, Pratyush Yadav wrote:
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

This delay is no longer needed right? I can drop it while applying, if
you confirm.

Tudor: Could you provide your R-by?

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
