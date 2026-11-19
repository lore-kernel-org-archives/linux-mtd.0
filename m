Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F1606A333
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhN+gU4G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqpfWz/7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x/bP8pCme0E7Lr4EnrVSrAUjw56elWkQ+FnvG7b34kU=; b=IhN+gU4GxL7hK+7v67KvSYmn/B
	MPXKNlfylNhCt8rB0HQgaAytFKIpPqNlX1XBy/W1JsvEc7EVUmqpIG/2qfem6NEffkUb6Hy5Pt8uK
	0lRtmNORI+6gMgFBaXgO1VhXMVpMCkwTjPnRi3ByfVDB1thLQfyAKIMq/qlM1/Vug4E42HtWBlfwX
	mTMK8FN4yXxRqheXrm7SbitJwKnxKLqsyek0N5T0gvIzXcoQf4ZiZfQPqPivJytKWtaHl71OAqXde
	P//gNzJkHJyaYgDLXPosV1uZbGcsX6tFXMm3dCpd/0TjEph136BMF719SJL/bPpLOL4AcelfGY9up
	cG9hc2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Z1-0000000C82i-0X4z;
	Thu, 19 Nov 2026 13:52:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Z0-0000000C82a-1nY0
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 13:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 47BCC637DD;
	Thu, 19 Nov 2026 13:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 509271F000C7;
	Thu, 19 Nov 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096353;
	bh=UKOQ7E14OsMkUnf+EX/rvNDiSBgYSQs10TYnXzahgPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqpfWz/7n3t7+hLvZXP0jy7XcjLXOhJCsEmBiRDMB5fJhAbDFRVwG0Jh0J3qBHRF1
	 z5pjZRVvJ7hH3dLAdgjm9nUJhvJ7sQr9O4kOeujR1xveGMbHQr+EvosiRb2DPf96rn
	 Ey/FgSplm8ZpcFdaibpOFTK2z50jBKsX7sUeN2aDxMicVrleQ7uXq42v72zjX77xMV
	 FLOHbwy1RK3iM9k1XILJc6gZLAUKNPO8ZPjta/cnVsPz6RJ6TyWHihiiD1jqJDXqcN
	 /JMX/wAQ6xwiy0pTRxxbL15B2tTL4qduYaI3Saefr+HiNbIxK77ZxODaJGcL3SSv4H
	 2G8f0grAS+QmQ==
Date: Thu, 19 Nov 2026 14:52:29 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 01/11] nvmem: retain the provider node until device
 release
Message-ID: <hgntc5ggkvhu7xuq5d3hzeufyxugy25lcqmot2d3q2idysmhhe@if5i3oixucea>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-1-3cfbd48812b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-1-3cfbd48812b5@gmail.com>
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

On Tue, Nov 17, 2026 at 12:38:08PM -0700, James Hilliard wrote:
> An NVMEM device can remain referenced after its provider unregisters.
> Keep a reference to its OF node so retained devices do not depend on the
> provider retaining the node. Drop that reference in the device release
> callback, including registration-error paths.
> 
> Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/nvmem/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 7d4cce8e2742..802637f375f8 100644
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
> +		nvmem->dev.of_node = of_node_get(config->dev->of_node);

While at it, you could switch to using device_set_of_node_from_dev().

Bart

>  
>  	switch (config->id) {
>  	case NVMEM_DEVID_NONE:
> 
> -- 
> 2.53.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
