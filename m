Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46288FA374B
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75mskXqnXBNF3CshAoAaFh1URq7WhnqtnnJ24gg7Fks=; b=R0RXvWl50xtPeN
	Cs+QN9G+vrT9+7vifKdbJguIpKgA0aTzvyfWKcOAJ5CRh0WolWN7ZsisMDMvUdX6gr7Y/LFfQ/PoC
	vFNfVBapydP6lf9Aejx1lXNAaQcJrCwqxnoR8lMXUUEQfJ3kGjfy79SDxP6YR0nSKBPu6CZ9FiKOp
	szIH+5F2cl5l3oQJTVC+Et2J3LhZmhMdS6MHkxpykstIYhg6zAZ13KF6XmCJdAag4Wh2FzFmPJXGb
	demg1h+ZaZqdRdf9c5R+K/CfbMFD7rtWImoFu9hGPkQKNIOZlFX/m/UJReXt4dseqEnRKy7EIRgW4
	mHyuHxhEMkpcxvvdvM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfIA-00000008IRc-37Ru;
	Fri, 02 Jan 2026 13:34:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfI8-00000008IRW-3ey7
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 13:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE95760128;
	Fri,  2 Jan 2026 13:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4BDC116B1;
	Fri,  2 Jan 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767360847;
	bh=VEKovfwgFEFRzqHc5DA9b9dzuLkYiDUuroCM/My6HyM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oX9ohkCyii+h1e50Z5Vh5H4f8tY5Hjzw2EJNiqKkZGIUgaR7R/mIaFZXZBwb5vhJM
	 SgLWl0oO7tgHbtuBMNojb0n5pOMf3VSKVYyg9N6ciT4RlQ7vqsFLdD3sv0AH5EZiPU
	 i77Zvm+ioMEZ8bbotFuuP0ofa9rORe0hgH3mOpzQOSdd/P0/K8oN3gg/CxTXvLYG14
	 7JIFhjYFTrTLsn0wEfzCfHyiJ8wxH4h920buPp4NGFAPL5TIGNQLPPB5EK+Our1pDG
	 t/blL6bFCwatW0blrIAuLcb14M4dUpSC7kkURwIlOsokBF2FDkHTZM5+E+TohOX5tS
	 4oyBTGzhNVS6Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Brian Norris <computersforpeace@gmail.com>,  Kamal Dasu
 <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Paul Cercueil <paul@crapouillou.net>,
  Manivannan Sadhasivam <mani@kernel.org>,  Stefan Agner <stefan@agner.ch>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Nathan
 Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
  Justin Stitt <justinstitt@google.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mips@vger.kernel.org,
  linux-arm-msm@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for
 each OF child loop
In-Reply-To: <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
	(Krzysztof Kozlowski's message of "Fri, 2 Jan 2026 13:49:34 +0100")
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
	<20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 14:33:59 +0100
Message-ID: <86a4yw87g8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Hi Kyzystof,

Thanks for the cleanup.

On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.

Nit: the commit message is a bit too dry. I had to go and look what the
difference between the two variants was. I could make an educated guess
by looking at the patch, but still.

If you end up doing a v2, a one-liner explanation of the difference
between the two loop variants would be nice to have.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> index db948da2c4c5..54c49a8423a2 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -394,15 +394,12 @@ static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
>  static int hisi_spi_nor_register_all(struct hifmc_host *host)
>  {
>  	struct device *dev = host->dev;
> -	struct device_node *np;
>  	int ret;
>  
> -	for_each_available_child_of_node(dev->of_node, np) {
> +	for_each_available_child_of_node_scoped(dev->of_node, np) {
>  		ret = hisi_spi_nor_register(np, host);
> -		if (ret) {
> -			of_node_put(np);
> +		if (ret)
>  			goto fail;
> -		}
>  
>  		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
>  			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
