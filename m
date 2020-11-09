Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A13C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 11:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A88C206ED
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 11:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOgAYlRh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qUq2RvTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A88C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yKEx1lIeWEs0T1tPrB6rOoFIYFkb++CwhnyOrQghHHo=; b=gOgAYlRhTblYOEKSRMwLy8qoU
	fgWZjjBTWLN9QgPhZ5wCYLJx75ejiYQI1w10Z4B2IPbDkmbcORwX1Vr4HeAr9YlZPJ/5aE8eVXXDw
	gfEsQg+JJHNfq15nw4lzjCr3UPoNikXHLUDTfyc6kcybY68d5F19uzQwTrkLqrsHqsTYeyW8TRim1
	7OY3nqQagxT2fMyVwbKbytXOIFAh7SxDvGEyEfg9UX8hxLwb/Z+GM8G7COKVe8VH2hAtaLkzYtyT9
	UeMthkIJHXdrMg+/L6VRuExiw/SEOOF8sJorC7gzAZEyZr5cTdUhZDc1dgVKQV2aZ2oFkYbZYm4Fw
	anvTLiiRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc5dS-00037G-Nh; Mon, 09 Nov 2020 11:46:58 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc5cN-0002dl-LY
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 11:46:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9BjiSG009421;
 Mon, 9 Nov 2020 05:45:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604922344;
 bh=NNwBY8g5f0FY29nACv1fAakM+XMumhmixbP2pLqwiw4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=qUq2RvTShgzqsdopPtWkYwQMLTz4mNM8c5/u2FLqd4FxlRtwGA4hNT1hto2XBgFkw
 GnPVa1/FtIWxw6VU8FAQVdjFLrYpaNKmx5ir9411GpGM96FrD7kvdQFDITjyfNxGcI
 +AmOyWpAQjEHeYjCAqSnTdHcXrznPfcUS8iMDngg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9Bjibb127564
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 05:45:44 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 05:45:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 05:45:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9Bjh93079202;
 Mon, 9 Nov 2020 05:45:44 -0600
Date: Mon, 9 Nov 2020 17:15:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v16 14/15] mtd: spi-nor: spansion: add support for
 Cypress Semper flash
Message-ID: <20201109114541.g6phaz36glhkpajz@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <20201005153138.6437-15-p.yadav@ti.com>
 <7d058da8-90ef-8f71-fe86-cc0b27a2895a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d058da8-90ef-8f71-fe86-cc0b27a2895a@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_064551_896775_71B4BDF1 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07/11/20 01:28PM, Vignesh Raghavendra wrote:
> Hi,
> 
> [...]
> 
> On 10/5/20 9:01 PM, Pratyush Yadav wrote:
> > +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
> > +{
> > +	struct spi_mem_op op;
> > +	u8 *buf = nor->bouncebuf;
> > +	int ret;
> > +
> > +	if (enable) {
> > +		/* Use 24 dummy cycles for memory array reads. */
> > +		ret = spi_nor_write_enable(nor);
> > +		if (ret)
> > +			return ret;
> > +
> > +		*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> > +		op = (struct spi_mem_op)
> > +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> > +				   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
> > +						   1),
> > +				   SPI_MEM_OP_NO_DUMMY,
> > +				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
> > +
> > +		ret = spi_mem_exec_op(nor->spimem, &op);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = spi_nor_wait_till_ready(nor);
> > +		if (ret)
> > +			return ret;
> > +
> > +		nor->read_dummy = 24;
> > +	}
> > +
> > +	/* Set/unset the octal and DTR enable bits. */
> > +	ret = spi_nor_write_enable(nor);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (enable)
> > +		*buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> > +	else
> > +		*buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> > +
> > +	op = (struct spi_mem_op)
> > +		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> > +			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
> > +					   SPINOR_REG_CYPRESS_CFR5V,
> > +					   1),
> > +			   SPI_MEM_OP_NO_DUMMY,
> > +			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
> > +
> > +	if (!enable)
> > +		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +
> > +	ret = spi_mem_exec_op(nor->spimem, &op);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Give some time for the mode change to take place. */
> > +	usleep_range(1000, 1500);
> > +
> 
> This delay is no longer needed right? I can drop it while applying, if
> you confirm.

Yes, this delay is not needed. Please drop it while applying.
 
> Tudor: Could you provide your R-by?
> 
> Regards
> Vignesh

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
