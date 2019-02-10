Return-Path: <SRS0=jA3O=QR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40882C282C2
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 13:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6A920823
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 13:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QklIBQio";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZW838DE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E6A920823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVenS2FzBqjbj9aIhy6+7x9cahR0KOZhG3qjHdhbuWk=; b=QklIBQiozoVaWT
	/vuDHa8srzf/kQUMOcRzkSN2PR2zerbHt58UyloMsMcj2aJMqawbgycfbWfu17DD1RbHkeKSHU0D6
	KwMpjjlJ8MERszEOSuhrwu2e1kF74NWKXEquJzam0ZwuFvdxrVTaauFQzE6UaySAUni88BZRgeaYH
	lmAYvoD0fQMcaPwcy1M2OnnRekhTf5qBczQ5/f7mrDKpo++GZfIxsgiHpntOodSKUkUxuYUGZzRvq
	AoUSTiNqiEVQAkPXWh0djFCUpgiPJRKp6E5GW0lCyDB09qwTBI/ntGTf50hhtzCOilv6zJUBb+nYP
	ltkI7ilj6ivAUUweUGhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsp12-00077T-Ox; Sun, 10 Feb 2019 13:19:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsp10-000776-8x
 for linux-mtd@lists.infradead.org; Sun, 10 Feb 2019 13:19:23 +0000
Received: from localhost (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B474B20823;
 Sun, 10 Feb 2019 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549804761;
 bh=343Y5jqNu9hTotntAX76szvN4bzQBg4yioPZQLl1+Hk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hZW838DEFimHjyCBKny2rCe6zbAb1MIEGUfJFFnyCN5Q9CtUql6IY2scXLADH4ITR
 vTGtRUIdsFA/XAxEBhcoLkfquR2ty9htGs8lKw/FWfvaRKrLUFRAqc0t4VjGdnEkfx
 P1xAyHp5LFvBbWPAeRJTQxNmM5E1zlHgWvCY3DKU=
Date: Sun, 10 Feb 2019 14:19:12 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Message-ID: <20190210141912.1da19db6@kernel.org>
In-Reply-To: <daa35c21-195e-eeb5-8aa2-cf42eff6a554@ti.com>
References: <20190128054935.4972-1-vigneshr@ti.com>
 <20190128054935.4972-3-vigneshr@ti.com>
 <2efbca08-c4ab-34ea-0e34-05aed7168df8@microchip.com>
 <daa35c21-195e-eeb5-8aa2-cf42eff6a554@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_051922_354309_B5AD7E2E 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 5 Feb 2019 11:43:46 +0530
Vignesh R <vigneshr@ti.com> wrote:

> >>  static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
> >>  {
> >> -	const struct spi_nor_hwcaps hwcaps = {
> >> -		.mask = SNOR_HWCAPS_READ |
> >> -			SNOR_HWCAPS_READ_FAST |
> >> -			SNOR_HWCAPS_READ_1_1_2 |
> >> -			SNOR_HWCAPS_READ_1_1_4 |
> >> -			SNOR_HWCAPS_PP,
> >> -	};
> >>  	struct platform_device *pdev = cqspi->pdev;
> >>  	struct device *dev = &pdev->dev;
> >> +	const struct cqspi_driver_platdata *ddata;
> >> +	struct spi_nor_hwcaps hwcaps;
> >>  	struct cqspi_flash_pdata *f_pdata;
> >>  	struct spi_nor *nor;
> >>  	struct mtd_info *mtd;
> >>  	unsigned int cs;
> >>  	int i, ret;
> >>  
> >> +	ddata = of_device_get_match_data(dev);
> >> +	if (!ddata)
> >> +		hwcaps.mask = CQSPI_BASE_HWCAPS_MASK;  
> > 
> > Now that .data is set in all cqspi_dt_ids[], maybe it's better to print a
> > message and return an error here. But I guess it's a matter of taste, so not a
> > show stopper.  
> 
> Since, driver data is kernel internal field, I guess there is little
> help in printing out the error to the user when its missing. I prefer to
> keep this as is, as basic Quad mode is supported by all versions of the IP.

Well, if all compat entries have an associated platdata instance we
don't need to support the !ddata case, right? I think enforcing the
presence of such a platdata is actually is a sane thing to do (which
implies returning an error when ddata is NULL).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
