Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5903606A687
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R8egBplK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aT2Zur7O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wx4K2g191sNmk7Qqze1aX3KuslK6WxPsPt4gkODy5Mw=; b=R8egBplKthhdaS1SMnpiXreGHT
	R5EjDY4U11p+ArQlyTWxSGmE8Rydmpyuihtf5skm1BDS0HTySl1cZRmCRIykYiacT7zwq2hoszVn5
	b2Jnt/uSJ/gACz9A8UqPe9ul/zTDZlrixsPgwPXL/rU6Ngx4DpfV+STUCNpbT9bWq8ZhHC/xoRST+
	09etVI1gCu+3kRDcu7UFKNeKkOAGVViab2+zB576vFPRVPM6iD1BELEDqmkm9WbicqD9ZjMfVKu8+
	2vOZlnP9I0BHjoHnDGJJn/ATSa4hr4iL6jpBOxTEWk410QbZIlkGt6cMDNZkWXGnxyA2enxHnIVpA
	K3ySg3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCXP-00000009uV2-040K;
	Wed, 25 Nov 2026 12:55:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCXM-00000009uS4-1ORD
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:55:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 50D371A17E8;
	Wed, 25 Nov 2026 12:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CE5260480;
	Wed, 25 Nov 2026 12:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D2D011E6962C;
	Wed, 25 Nov 2026 13:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795611344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Zz8pRVPj1m/x6K4VKaV8LSIz7Bt1hMO6SMJiNKydZSY=;
	b=aT2Zur7O4lBtxYQYfwKuAvhcn1SgPWKsRujduPByUAXeP7cKx2bXz2rl25hJECg1c9PDCg
	n+jnwNyzkzWLHec2eToEEeqCDvglMfIN/J4VrrSIh2DV23apCc23WBose8SXWZLvxawhzk
	q1oqb+8JaZkeC+qb3qv4XrxIpbkU2yZYAjnZFeDfjeeU3ILUhMgjxa9RGYLB1q1JbFtmjx
	ZJiEPwJ0CxcMHQ9qSIqTuGtfys4S3K9M5OCrb9NMvOwGopqc5yNWLPguFsnVzHr24EwDTR
	lha/uisEzrpIH7afHam8627TMN68SCVDBmGNl6O1Dl/2pJEZcttHFpXiIMcMZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261125122135.44696-4-leeonion.muyu@gmail.com> (Ping Li's
	message of "Wed, 25 Nov 2026 20:21:35 +0800")
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
	<20261125122135.44696-1-leeonion.muyu@gmail.com>
	<20261125122135.44696-4-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 13:55:41 +0100
Message-ID: <87cxrtyss2.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045549_259794_7FD241BC 
X-CRM114-Status: GOOD (  16.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 at 20:21:35 +08, Ping Li <leeonion.muyu@gmail.com> wrote:

> r852_do_dma() feeds the buffers provided by the NAND core straight
> to dma_map_single(), which is only valid for linear-map addresses,
> but the driver never declares NAND_USES_DMA.  Because of this,
> nand_base cannot know the controller DMAs these buffers and never
> bounces non-linear-map ones.  Such buffers are not hypothetical:
> mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
> LPT buffers.
>
> Declare NAND_USES_DMA so that nand_base bounces non-linear-map
> buffers through chip->data_buf, and advertise the hardware's
> 512-byte alignment requirement through chip->buf_align so that
> misaligned linear buffers are bounced as well, like the other
> DMA-capable controllers do.  Both only apply when the controller
> actually uses DMA: the PIO fallback path does not care about
> buffer addresses being linear-map or 512-byte aligned.
>
> Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
>  drivers/mtd/nand/raw/r852.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
> index 92c47d351c27..c5a3622cddf6 100644
> --- a/drivers/mtd/nand/raw/r852.c
> +++ b/drivers/mtd/nand/raw/r852.c
> @@ -640,6 +640,11 @@ static int r852_register_nand_device(struct r852_device *dev)
>  	if (dev->readonly)
>  		dev->chip->options |= NAND_ROM;
>  
> +	if (dev->dma_usable) {
> +		dev->chip->options |= NAND_USES_DMA;
> +		dev->chip->buf_align = R852_DMA_LEN;
> +	}

Wasn't in this driver a bounce buffering operation that is no longer needed?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
