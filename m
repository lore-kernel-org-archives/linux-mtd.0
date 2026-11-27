Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF6606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4DjM9Fp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7RRmo75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oyVtt+pte7tQSRKOAZJqySgUBVMXiZ4Jr5M8AhW8cHc=; b=h4DjM9Fp3vhUXJhU/uJHkp6Yb1
	kQowjZUB5qolhXdgyiTbtVXV4PEkxdZpctpf9XA141ttDHG6rIEOKm2QaVtHUp35zV4kqQDaYJ3jb
	FtxhTTKG+qT62EjINv6p8HbyJM/h/DHV3+L+8vwGLEF+M5n5X9wj+GDDq5iRtAf2iRb1a/2o0jR0b
	dEvCObHz0v7+D8X99OYs2pDOm/Hv8bxDyste4hzf+lwLVYfyDcFKLzCozlNLmx+cCSOJjm9OUzI8A
	h8MnhOVASXbwWE9sESV3AJmNc5DnSFVALMGakv3mtXbK+JeRDF2NNKGM8cN536dzQ0c4X821N1a3X
	1/yiggrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtw2-0000000FlSx-05mD;
	Fri, 27 Nov 2026 11:16:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtvz-0000000FlRx-1EqC
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 11:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 120B843E35;
	Fri, 27 Nov 2026 11:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600C01F000C1;
	Fri, 27 Nov 2026 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778166;
	bh=wVIP3V0dASlHnbidW10EsmdFMoz0Im16A967d61lYe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i7RRmo75djd2dNmsU3z02Sahk6nlMdtL+H1okXxRL6sjVqdTKfF5EklMXN9U57ly6
	 xzIvIikP9LGeTC/67DUdc3NxHtn1EXwly/PbMSKwT6EOh6pThyno16NUDfn5/Q9Fzo
	 1EcRreGAdu9IoLs0KDAj3wc4rNx3i6Yg2WF9yWq0RfSt5x+WEEz6FW7EGj8AKPet13
	 sjeMgfCMyaWILWiU7oVxxOFUeocCa/tB/mkBWw7Ep9+cQN6j2rKuUDiJKW2wUXICv5
	 h/mcdC3TPyCuKLdAXTiVEigj3Brlq6C6e3PaTIMPt96OkXDjJlCPm7nq3/X4AiCsnw
	 P2uKYoi6f7mcg==
Message-ID: <c55a06b5-f264-404c-b388-f74a283d123a@kernel.org>
Date: Fri, 27 Nov 2026 11:16:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] nvmem: retain the provider node until device
 release
To: James Hilliard <james.hilliard1@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Michael Walle <michael@walle.cc>,
 Linus Walleij <linusw@kernel.org>, Khouloud Touil <ktouil@baylibre.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
 <20261120-submit-nvmem-provider-lifetime-v1-v3-1-523610652402@gmail.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-1-523610652402@gmail.com>
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/20/26 8:08 PM, James Hilliard wrote:
> An NVMEM device can outlive its provider after unregister. Take a
> reference to the configured OF node, or reuse the provider device's node
> when none is specified. Drop the reference in the device release path
> so the node remains valid for the lifetime of the NVMEM device.
> 
> Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")

Thanks for sending out the patches, Few things to remember.

1. None of the fixes have Stable Tag,

2. fixes should be first in the series, so that it becomes easy to pick
them up for next rc.

I have picked up few fixes with these changes but pl be mindful next time.


--srini

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/nvmem/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 7d4cce8e2742..03ea878874e4 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -570,6 +570,7 @@ static void nvmem_release(struct device *dev)
>  	gpiod_put(nvmem->wp_gpio);
>  	nvmem_device_remove_all_cells(nvmem);
>  	ida_free(&nvmem_ida, nvmem->id);
> +	of_node_put(nvmem->dev.of_node);
>  	cleanup_srcu_struct(&nvmem->srcu);
>  	kfree(nvmem);
>  }
> @@ -973,9 +974,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>  	nvmem->keepout = config->keepout;
>  	nvmem->nkeepout = config->nkeepout;
>  	if (config->of_node)
> -		nvmem->dev.of_node = config->of_node;
> +		nvmem->dev.of_node = of_node_get(config->of_node);
>  	else
> -		nvmem->dev.of_node = config->dev->of_node;
> +		device_set_of_node_from_dev(&nvmem->dev, config->dev);
>  
>  	switch (config->id) {
>  	case NVMEM_DEVID_NONE:
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
