Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA5CC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:35:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D531E2074B
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="botIGbE6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HeSMjJTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D531E2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E8xr4n7pUS0uGRhf5U6NyndmJrmOANQWo2nveEFSloM=; b=botIGbE6T+LKWA94wHKNZBdnf
	kSTXnf/o7s7oGgujyT4W4XvTShH/xSNrVe8sJTqbzJlbh7gqlw+9n/0ygFuBgxTw/lf/xFv7G/vT0
	EuLyhJCpW7NZ1Fg3ilYfYM9UKQ7fTfqosZI3JedtLW4hsi+sxPvC38aAoK4mc0UwkikpHBVFEs7f8
	vF7BeU4G057VhsXPY6EY7jJ0lsFmxgZJ70GBOPgcpl+YtdSNgVHT/2+Uto/en5c68w81REI5nIw57
	Xb9f05yo99OuL2vsHUGJSpDjR2fPZA3XtnWgZRIeP3+vCcgvG344EVgaGGVNjp2jjAqJPdfLtF0On
	kLbJ8OEcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNt6r-0000o0-KI; Thu, 01 Oct 2020 07:34:37 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNt6p-0000n4-09
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:34:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0917YTDN032463;
 Thu, 1 Oct 2020 02:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601537669;
 bh=TRbqOzn7ubE4907l7PLq3YbRxbStioDDZZZZr7W6VLk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=HeSMjJTIZ/IxUHCmyFFH2aR2NzZAdp1cOrda9x4wCSFUebQUdSkeVtnGxk7KGLQSQ
 Eimpr3yaWUykO+h6mCzJGo7gsMVi6yGFcfVsfdyROLkEfn3NkbWXupzGqBHc1bH50Y
 YevUCKXAG7ZXspmDtJQYgYZtlSuRBiAe6gxZ6VlU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0917YTlC117202;
 Thu, 1 Oct 2020 02:34:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 02:34:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 02:34:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0917YS6i101061;
 Thu, 1 Oct 2020 02:34:28 -0500
Date: Thu, 1 Oct 2020 13:04:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v14 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Message-ID: <20201001073425.txsfdngrsugsy6uf@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-2-p.yadav@ti.com>
 <5340adf5-1bb2-1eff-3812-6976b3b76faf@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5340adf5-1bb2-1eff-3812-6976b3b76faf@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_033435_218681_A1F3420F 
X-CRM114-Status: GOOD (  23.75  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/10/20 07:19AM, Tudor.Ambarus@microchip.com wrote:
> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > ENOTSUPP is not a SUSV4 error code. Using EOPNOTSUPP is preferred
> > in its stead.
> > 
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The R-b tag should be after your S-o-b. This applies to other
> patches in the series too. No need to resubmit, it can be fixed when
> applying.

If we're using chronological order then I first added your Reviewed-by, 
and then signed off before resending the patches. So that way s-o-b 
comes after r-b.

Anyway, it doesn't really matter. Use whichever order you prefer.
 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 0369d98b2d12..4d0f8d165544 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2281,7 +2281,7 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
> >   *@nor:        pointer to a 'struct spi_nor'
> >   *@op:         pointer to op template to be checked
> >   *
> > - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> > + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
> >   */
> >  static int spi_nor_spimem_check_op(struct spi_nor *nor,
> >                                    struct spi_mem_op *op)
> > @@ -2295,12 +2295,12 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
> >         op->addr.nbytes = 4;
> >         if (!spi_mem_supports_op(nor->spimem, op)) {
> >                 if (nor->mtd.size > SZ_16M)
> > -                       return -ENOTSUPP;
> > +                       return -EOPNOTSUPP;
> > 
> >                 /* If flash size <= 16MB, 3 address bytes are sufficient */
> >                 op->addr.nbytes = 3;
> >                 if (!spi_mem_supports_op(nor->spimem, op))
> > -                       return -ENOTSUPP;
> > +                       return -EOPNOTSUPP;
> >         }
> > 
> >         return 0;
> > @@ -2312,7 +2312,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
> >   *@nor:         pointer to a 'struct spi_nor'
> >   *@read:        pointer to op template to be checked
> >   *
> > - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> > + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
> >   */
> >  static int spi_nor_spimem_check_readop(struct spi_nor *nor,
> >                                        const struct spi_nor_read_command *read)
> > @@ -2338,7 +2338,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
> >   *@nor:         pointer to a 'struct spi_nor'
> >   *@pp:          pointer to op template to be checked
> >   *
> > - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> > + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
> >   */
> >  static int spi_nor_spimem_check_pp(struct spi_nor *nor,
> >                                    const struct spi_nor_pp_command *pp)
> > --
> > 2.28.0
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
