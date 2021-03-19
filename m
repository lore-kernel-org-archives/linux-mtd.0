Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A764C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 16:58:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9363B6194F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 16:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9363B6194F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tNUUxvnrIuKtK7zuLOIouHK6Wd1mEiODkjxp0LkZ658=; b=SzCtFoy8Os7DEnxj0Y0y7BopC
	7PrM6KOTf+74yeESW9jqCr3vm1LL6cB3LHmlMSufyiVmAEbAwTsKWDmDRnCaEZ2olwCpUkqfGGl7K
	enSDrK5VzFUJxS0WgZTNClMvisrFW3VLW28MLnWB6f3Nd11t0Qw+IaYD42KZwk3Y8BXCIb3lzASCE
	zzom9Sx75f459ns2i9bIvq3egTSMkGLhj5iFjTci2tpWCJHBe62m1ApLoJRiEPAdJNpcvCEPqDdXh
	Ew2nTPKgKdNQiyHrhZm5gajRGnb+UQjXZVNrcfUIBlPtoqyUk8aKkZ7+HE+ptrUC5yH2hbIblURap
	rle+124oQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNIQv-007mJn-5Y; Fri, 19 Mar 2021 16:57:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNIQp-007mHi-9R
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 16:57:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ABD581F46C3F;
 Fri, 19 Mar 2021 16:57:02 +0000 (GMT)
Date: Fri, 19 Mar 2021 17:56:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210319175659.17c9e8e6@collabora.com>
In-Reply-To: <20210319150010.32122-4-manivannan.sadhasivam@linaro.org>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
 <20210319150010.32122-4-manivannan.sadhasivam@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_165703_525396_CFDD42FD 
X-CRM114-Status: GOOD (  12.23  )
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

On Fri, 19 Mar 2021 20:30:10 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> @@ -2737,6 +2783,11 @@ static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
>  	uint8_t *ecc_code = chip->ecc.code_buf;
>  	unsigned int max_bitflips = 0;
>  
> +	/* Check if the region is secured */
> +	ret = nand_check_secure_region(chip, ((loff_t)page << chip->page_shift), 0);
> +	if (ret)
> +		return ret;
> +

I'm lost. Why do you need to do that here if it's already done in
nand_do_read_{ops,oob}()?

>  	chip->ecc.read_page_raw(chip, buf, 1, page);
>  
>  	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
