Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC80C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 23:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561B320719
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 23:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWntXwXX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcBiw/Hs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 561B320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WAFvlATEpEglbhxsrvmIS+ejQidqm3bz+c+01Jvyi2U=; b=hWntXwXXCkSBUfcQPcJVFeyP2+
	S18CvnYMxXxZnR6yTEExrxev7t65D2Laonzmujx/VGf/uMw0WzQoUBaeOnWrJSs2ozBfeUU+BvRkX
	0zSVeoJwSQ1CTx6KHQ8L8FM7GnkoXRtQfOR0GgdX4DRtXdHlva81Q/k1NeUOBL2Jkwa4YlOZ/oY5M
	oysQW/QtN9FkGjlnAV3PiUY9+Ft2Ed1SQTOLH7VMI3YvopJQR54Yh9OpcFiRa/49/L/qZb833OLU3
	oFFxt4Sf4Dp1rT+pld2dxftjBB48jYYv0gs34eejjrTSga1AmTxwnHogQYOw8CZnptQFqnqi4kx7S
	lABJzcVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGWML-0000ZC-Ob; Mon, 23 Mar 2020 23:19:53 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGWMI-0000Yg-Mr
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 23:19:52 +0000
Received: by mail-ot1-x342.google.com with SMTP id 111so15271792oth.13
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fH1EPOSV+aw8+C6QOLD429KadrenivP2ez5RIj645pM=;
 b=rcBiw/HsitpdNxHKEmmuKupI+wLvxgN4d3IFaKu+cPMi8zQC/ClP9utbeIIqMi1dp5
 U+T48zvyKcvHibkkqNp+fUYZP8EiwQiCyWj/MZTCFXj3JG92M1yAALa0oiZ0B1r2wKLb
 vtcCRw0uu1cZwVgW8OFh0jPClQ2PeJeqc4xNFX+RG1yUCsv9GAMghNILx0q/jlH0hKVi
 JApItkPqmDiV+mLrnmjoP7ZbCVabnKEJCOax4DkY6po6CCMk97pn26c42d1hnP6m+u7F
 3evm5dYo+AxFhCK7YPv8xPTLE0wINiMoZkkRHxp9Pbelxk/mIBPApI2dcNLSVtbCwQq0
 Fgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fH1EPOSV+aw8+C6QOLD429KadrenivP2ez5RIj645pM=;
 b=KrZgg+own6PAHtnZNEqZgtGiH+Xa5vLlIP6AoFWLy5kx3ce6GDAdhu0ytN6BnFUgMf
 lf04M21qec9IEKWeLou7snKllT8ZURJvhv6vnhR6B+XmYlTVP/4Zp7awdybf2LOZb7hn
 6HMwvr08t8XRwEhJ8N0vf/kyijBfJn2OKyqtz2DZo1GcA3HqVQ/gaxehrUIdFfuNlykL
 gxqaic9KZJMCnXFNKLt4PYOUP1P7d1u7FuK34XGsW3NxkotF51sy7nmP2M0OI6VH+YH4
 tkfZ9o865gE/qKAP3jqH/Y7INf5JouApC+1fN7aWAIGFnk1ZQC7GITz26mIfWJvGfZCA
 S6Fg==
X-Gm-Message-State: ANhLgQ0GprMHBPheeRqOi7VOvqU6z8T6iWbSYo0JGvpLrIfnDkkVObfY
 JkuKf/HzpotA8Xp+NQxdfG9gQ4JXHx+fUMFuRVPwBsKj
X-Google-Smtp-Source: ADFU+vu/a4PY3iKGI3RG54T9gNEpJaniGG89+68gxe7/aE8civMNpKIlRJH0l1Fs+ihxLTwGhqPvgkupGiW1w9ZI/5I=
X-Received: by 2002:a9d:412:: with SMTP id 18mr19276568otc.134.1585005589608; 
 Mon, 23 Mar 2020 16:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
In-Reply-To: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 23 Mar 2020 16:19:38 -0700
Message-ID: <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 mika.westerberg@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_161950_749089_D0A2D65F 
X-CRM114-Status: GOOD (  22.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Mar 23, 2020 at 12:58 PM ron minnich <rminnich@gmail.com> wrote:
>
> The MTD subsystem can support command-line defined partitions
> for one or more MTD devices.
>
> The format is:
>  * mtdparts=<mtddef>[;<mtddef]
>  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
>
> The ':' currently separates the id from the partdef.
>
> The mtdparts can define more than one part, in which case
> there will be more than one <mtd-id>:<partdef> component.
>
> On Intel spi devices, the name is set to the PCI slot name,
> e.g. 0000:00:1f.5.  There are two : in the name alone.
> Since strchr is used to find the <mtd-id>,
> in this case it will return the wrong
> result. Using strrchr is not an option, as there may
> be more than one mtddef in the argument.
>
> This change modifies the name attached to the intel spi
> device, changing all ':' to '.', e.g. 0000:00:1f.5
> becomes 0000.00.1f.5. It also adds command line partition
> parsing registration to the intel_spi_probe function.
>
> This change has been tested and works on a modern Intel chipset with
> a 64 MiB FLASH part.
>
> Signed-off-by: Ronald G. Minnich <rminnich@google.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 22 ++++++++++++++++++++++
>  drivers/mtd/spi-nor/intel-spi.c     |  4 +++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c
> b/drivers/mtd/spi-nor/intel-spi-pci.c
> index 81329f680bec..57716e53c219 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -24,6 +24,23 @@ static const struct intel_spi_boardinfo cnl_info = {
>         .type = INTEL_SPI_CNL,
>  };
>
> +/*
> + * PCI names use a ':' as a separator, which conflicts
> + * with the mtdparts cmdline parameter. Dup the name and
> + * replace : with .
> + */
> +static int fixname(struct pci_dev *pdev) {
> +       char *name;
> +        name = kstrdup(pci_name(pdev), GFP_KERNEL);
> +       if (! name) {
> +               return -ENOMEM;
> +       }
> +       strreplace(name, ':', '.');
> +       dev_set_name(&pdev->dev, name);
> +       kfree(name);
> +       return 0;
> +}
> +
>  static int intel_spi_pci_probe(struct pci_dev *pdev,
>                                const struct pci_device_id *id)
>  {
> @@ -41,6 +58,11 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
>         if (!info)
>                 return -ENOMEM;
>
> +       if (fixname(pdev)) {
> +               kfree(info);
> +               return -ENOMEM;
> +       }
> +
>         /* Try to make the chip read/write */
>         pci_read_config_dword(pdev, BCR, &bcr);
>         if (!(bcr & BCR_WPD)) {
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 61d2a0ad2131..261b10cf5076 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -894,6 +894,8 @@ static const struct spi_nor_controller_ops
> intel_spi_controller_ops = {
>         .erase = intel_spi_erase,
>  };
>
> +static const char * const part_probes[] = { "cmdlinepart", NULL };
> +
>  struct intel_spi *intel_spi_probe(struct device *dev,
>         struct resource *mem, const struct intel_spi_boardinfo *info)
>  {
> @@ -941,7 +943,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
>         if (!ispi->writeable || !writeable)
>                 ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
>
> -       ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
> +       ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
> NULL, &part, 1);
>         if (ret)
>                 return ERR_PTR(ret);
>
> --
> 2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
