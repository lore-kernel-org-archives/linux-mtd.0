Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B6CC38142
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPsMEP3+/ufj6XZg1dR8+V2kRJDLeyrTDmo68Hr26bQ=; b=x1xi6/lEzJgDa4
	H0hEKSyiPCZXISzPPO8FYp/+euRsF+yyLlzr2LKgLQpcfp3/6uIquJxc4rOTySdfAoCfqXD/1292P
	SRWrh6A+fXP4rkNse7etYAIQck//t2fXuEyoI1DX0wadKw7w8N1+EJrw82o3Rw+RwvHn9QMG4YneZ
	iQnB7AwlFngdnnOzw5CeJpSwLrtQoeI9fC2pHdRrNNvdbEoEFNVKD6/auIxTeWwVLuGN5g7inIPy1
	2aSiuySH5EXSwQJ1t3svxhx/KefwPlystdLGIgO1A1Z/abjSOzwD8I+yItVvAFyEN2lIthJgsP2KD
	nzITL83YYv7If9Mg0V0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLO9-004YvD-DU; Tue, 24 Jan 2023 15:39:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLO6-004YtR-2z
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 15:39:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B621612A8;
	Tue, 24 Jan 2023 15:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C4CC433D2;
	Tue, 24 Jan 2023 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674574744;
	bh=K8rSKstfnfyNR50ihOqUtAhWl6rM/U28BAHGWsl/l+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ye3dRlJRvcUKZPdo7YFa8kBuY0jGN4tDNzEkE2CFPmRYEm5bdC+QMZKVsyIELufCG
	 gadKSuqndArXcEolrMPx52O54Cq8iFaccQgGV0tJIPIwGIo1D7MGb39rxOPRUs2BDf
	 wtYQ6wLGS+gNids7WigKJf0+ZIojb0U//59d+KjI=
Date: Tue, 24 Jan 2023 16:38:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y8/7k1HHjJbHvWDB@kroah.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124104444.330913-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_073906_223534_536FF4CD 
X-CRM114-Status: GOOD (  30.09  )
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

On Tue, Jan 24, 2023 at 11:44:44AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add a mechanism to handle the case in which partitions are present as
> direct child of the nand controller node and #size-cells is set to <0>.
> 
> This could happen if the nand-controller node in the DTS is supposed to
> have #size-cells set to 0, but for some historical reason/bug it was set
> to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> as direct children of the nand-controller defaulting to #size-cells
> being to 1.
> 
> This prevents a real boot failure on colibri-imx7 that happened during v6.1
> development cycles.
> 
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> I do not expect this patch to be backported to stable, however I would expect
> that we do not backport nand-controller dts cleanups neither.
> 
> v4:
>  fixed wrong English spelling in the comment
> 
> v3:
>  minor formatting change, removed not needed new-line and space. 
> 
> v2:
>  fixup size-cells only when partitions are direct children of the nand-controller
>  completely revised commit message, comments and warning print
>  use pr_warn instead of pr_warn_once
>  added Reviewed-by Greg
>  removed cc:stable@ and fixes tag, since the problematic commit was reverted
> ---
>  drivers/mtd/parsers/ofpart_core.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> index 192190c42fc8..e7b8e9d0a910 100644
> --- a/drivers/mtd/parsers/ofpart_core.c
> +++ b/drivers/mtd/parsers/ofpart_core.c
> @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
>  
>  		a_cells = of_n_addr_cells(pp);
>  		s_cells = of_n_size_cells(pp);
> +		if (!dedicated && s_cells == 0) {
> +			/*
> +			 * This is a ugly workaround to not create
> +			 * regression on devices that are still creating
> +			 * partitions as direct children of the nand controller.
> +			 * This can happen in case the nand controller node has
> +			 * #size-cells equal to 0 and the firmware (e.g.
> +			 * U-Boot) just add the partitions there assuming
> +			 * 32-bit addressing.
> +			 *
> +			 * If you get this warning your firmware and/or DTS
> +			 * should be really fixed.
> +			 *
> +			 * This is working only for devices smaller than 4GiB.
> +			 */
> +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
> +				master->name, pp, mtd_node);

This is a driver, always use dev_*() calls, not pr_*() calls so that we
know what is being referred to exactly.

I take back my "reviewed-by" line above, please fix this up to not need
pr_warn, but to use dev_warn() instead.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
