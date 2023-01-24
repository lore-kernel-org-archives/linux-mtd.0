Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DA3C38142
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35fpjszcppRoSbJIh6zKeWXyq2IzX2sURm5B62edlXU=; b=4dqUs29D6FOccP
	uQs8UlumsjYnEu2Aj8w+x0/dverybz6gPvz6G1PeeBgFM0fMeJ/vCEp7R1xZmsQKToEMqBZfXZ6AG
	fUeV97FVTWnT1RuhC0Ewn3E/N3UJ97ucAdJm6FEKqyctojJRoQi5H+6w3Vdn53XIZwKnZ6fkHmKD6
	y5GDPpuyESGW3bUvxHtCRv1otODCV0vaAb+LU18rA/JXHVgI5J75HZDFT+3FhZmHhkiykQx6pH9x1
	QoySyJjnLcNmH9Cjo/uwHzJ0I7jiF7et6ljj88/7mrF+8JSsfrbG9dspISibG8ppgJHHPoihRq9kV
	4p9qeKDMDzFq3u3fxpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGf9-0039o0-Im; Tue, 24 Jan 2023 10:36:23 +0000
Received: from smtp-out-12.comm2000.it ([212.97.32.82])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGf6-0039li-BN
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 10:36:22 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id CFF7CBA3DBB;
	Tue, 24 Jan 2023 11:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1674556562;
	bh=/XdyYB6IAyCKtdBDIn+omS7z5hJmbDbO9iC88oMkQZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n+Jktu5Vb6N//GFEjkbMo52/K8TqOl/RsmBpUI6bPeXRm5lLGE+TbHizTlC0o57gn
	 jV4tuG6RcHy3TUJNNxZ2nasvT4HOj8hPJMkcZX0F3l0WSTPo8FNz3zvTXnY2uXIOFi
	 qeZVugI6q/UU2/cXAorU/3FrbiU15cV508TyDaQ1ylhYFflRfZCqoP7tGKhIYjCYr/
	 +SqSrc9Yu5zxJOx+eUyiTWMjylvJDZ6EaTTIW95pWzkTMzuukvNrgxHsIJWsfLMzhA
	 ca/vqtW7dkaw9UOTHm9suNALbbm3pGPwamaCl2CkMjr+FkBT9JlVFu3JbcT0pINPLI
	 OCK4CWxSz8Oaw==
Date: Tue, 24 Jan 2023 11:36:00 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y8+0kM+cg57EZjMr@francesco-nb.int.toradex.com>
References: <20230124083500.321369-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124083500.321369-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023620_542454_A517084A 
X-CRM114-Status: GOOD (  24.98  )
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

On Tue, Jan 24, 2023 at 09:35:00AM +0100, Francesco Dolcini wrote:
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
> index 192190c42fc8..5077000a00e6 100644
> --- a/drivers/mtd/parsers/ofpart_core.c
> +++ b/drivers/mtd/parsers/ofpart_core.c
> @@ -122,6 +122,25 @@ static int parse_fixed_partitions(struct mtd_info *master,
>  
>  		a_cells = of_n_addr_cells(pp);
>  		s_cells = of_n_size_cells(pp);
> +		if (!dedicated && s_cells == 0) {
> +			/*
> +			 * This is a hugly workaround to not create
s/hugly/ugly

> +			 * regression on devices that are still creating
> +			 * partitions as direct child of the nand controller.
s/child/children

Miquel, let me send a v4 with these fixed ...



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
