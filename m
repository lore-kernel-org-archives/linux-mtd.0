Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90836E77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/S+tUuD86smA3HVDUTM1RiBLYvnUaUvaWlSWDAYY4I=; b=YrDoCQm1lvl9rn
	k4GhqnR79RqQ4niHWEXFcURaA/o3/vsJYxfuBNJ+ifEPNt2eAYPvrgfYHuXegvl/YJS9cTCrBOmkC
	E2APFdf9sggnKhpeW0sTvon7W29QKK8Pym1zcaVyN4bdaXKPOb98YsHI/IAKYnsbOgxNYg6A95w0v
	4NwHukRJ0GT58dmpf3K0Ds7VTKGyW3sl6bMyEg0iN6/bCPgY3UE2FNRLc3tobqwcgUd3ekvjf+rfm
	YP5Wljn9v3E3tApJlca8bvuFJkdqzjUvRUcTxv7bZNp7QC00Ib4GJD9AAvxY5dMqcjycG4MiPLW5b
	mp9jGn2Fwk439qkiCAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYOw-00000001j4w-1Wna;
	Fri, 06 Dec 2024 13:29:46 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYOt-00000001j45-1Uiu
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 13:29:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFBCF24000A;
	Fri,  6 Dec 2024 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733491779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40Vs0ULjEkgXkx7L8maRSYFXLsDHUPdUjSKwNaSqOms=;
	b=Rlgh4eeZOJRffjbkFpMZNBFtRlStnK7ESv4OdjtwkWsGDWJZ8XPuhOCV4OCKWebwN4GJ1D
	YKWkD/7aPe75tOlvoZ8zddcCgT6aY2dd9SBMyLdv7Q81PoeWYO1mo/Zs56Rm68jYCy/9vs
	HaS0EsozCVGsHykWHx9Xss0z2gXU/zmLm3Fh2cdKB4nH5JU6IXNC+t9BCIMRD3BL6+d/pp
	7TyK7LweHRPF6ZzStkBBGCveCe/pmIzuaagLcm9L2F+8MDMol0FozpVp8y2OIC8961kwD1
	hMT2Yhaia8nLFOuWuEBPtbcVCgRBsP4jfb0VaMS7Z/PLeTIR2cUOcC7xA8sK8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: vigneshr@ti.com,  tudor.ambarus@linaro.org,  richard@nod.at,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: hyperbus: hbmc-am654: fix an OF node reference leak
In-Reply-To: <20241206114740.781053-1-joe@pf.is.s.u-tokyo.ac.jp> (Joe
	Hattori's message of "Fri, 6 Dec 2024 20:47:40 +0900")
References: <20241206114740.781053-1-joe@pf.is.s.u-tokyo.ac.jp>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 06 Dec 2024 14:29:36 +0100
Message-ID: <87cyi5q6rj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_052943_674957_D57E995F 
X-CRM114-Status: GOOD (  12.95  )
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

Hi Joe,

On 06/12/2024 at 20:47:40 +09, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp> wrote:

> In am654_hbmc_platform_driver, .remove() and the error path of .probe()
> do not decrement the refcount of an OF node obtained by
>   of_get_next_child(). Fix this by adding of_node_put() calls.
>
> Fixes: aca31ce96814 ("mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/mtd/hyperbus/hbmc-am654.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
> index 217f4e69233f..3e206bb34287 100644
> --- a/drivers/mtd/hyperbus/hbmc-am654.c
> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
> @@ -174,18 +174,18 @@ static int am654_hbmc_probe(struct platform_device *pdev)
>  	priv->hbdev.np = of_get_next_child(np, NULL);
>  	ret = of_address_to_resource(priv->hbdev.np, 0, &res);
>  	if (ret)
> -		return ret;
> +		goto put_node;
>  
>  	if (of_property_read_bool(dev->of_node, "mux-controls")) {
>  		struct mux_control *control = devm_mux_control_get(dev, NULL);
>  
>  		if (IS_ERR(control))
> -			return PTR_ERR(control);
> +			goto put_node;
>  
>  		ret = mux_control_select(control, 1);
>  		if (ret) {
>  			dev_err(dev, "Failed to select HBMC mux\n");
> -			return ret;
> +			goto put_node;
>  		}
>  		priv->mux_ctrl = control;
>  	}
> @@ -193,7 +193,7 @@ static int am654_hbmc_probe(struct platform_device *pdev)
>  	priv->hbdev.map.size = resource_size(&res);
>  	priv->hbdev.map.virt = devm_ioremap_resource(dev, &res);
>  	if (IS_ERR(priv->hbdev.map.virt))
> -		return PTR_ERR(priv->hbdev.map.virt);
> +		goto disable_mux;

This error path will return ret, whereas it should return
PTR_ERR(priv->hbdev.map.virt).


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
