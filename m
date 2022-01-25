Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjbkkT9PVPwUjBtM90JcwFUkyGlQFp3j9W4YFelLY9A=; b=IsLtzKlx0Zi8Yv
	k3YkehEGqHyWlno0cqAI6+ue2gZmpweEAwzfNXiwxTe9M8hgW2LlVBZNxioEYooA+ABCKOYZrK3iJ
	n2VBdxUBIosyuEvCWycw5LqVruPRGiYpym2XA25c22IB6uzlgB2adNw+eUpDjx0tAtKfU/teKM3uv
	quCm8RqOyfsQ4Sdfc9AOJf7OxLHyC9uhOdzMYEvrd9wPZtp0ojQ4sBD/Oi42UR6a5K9Ts7dhI3q/U
	c4e3hgXj6rKZVHGoX/vz4Um9gMYE2LCLd4FMaPCqSDaYdSuXkBeyCxxScx59iSB+zkWmuEW5w0h20
	Ww1stBahGu/u62Ddmngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJJd-007V8P-Et; Tue, 25 Jan 2022 10:44:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJJa-007V7q-P3
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 10:44:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id c2so25009865wml.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gue0fJwwcgJTZVNdeX+6H9YxIr2uToB8WYyhrif8Zgg=;
 b=sfzTb+mBqz0CAb/NiDVYEy4M/U6s+cmQivYUZ8T8HCXtmf47TqVlQa1MVrKhdPAMHN
 +6sUu1m8cJkI2leNd7KOBhsW/75lhMRZXi2RgH1od2b4BisBeAPZq26RZk0ojhIeqAvU
 E7sfVfSgMK3D0+Ao8mZk7tESb0rO1VWhWnEa0+IehTUyxqK6eNAffYdfKIAYHypoFwiD
 pGadS7fcpBpZh2iYufU8CZlSmVr6I+ufZREvlxdmNgy/3VdzFUfs4xUN6DJI2EOWZVZx
 sR3jFsHtIpGYVQ+FGBhHrmI6E2cPmgy9vVR/gtFq5LoHmrCwZU65QghzCIWNfZ1cV36o
 INDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gue0fJwwcgJTZVNdeX+6H9YxIr2uToB8WYyhrif8Zgg=;
 b=Cudrz7QoDeU7wllLh8ESV5XmT0ltlsjicGa9zJ+N3TKe0JnciyCHzseYn5tGI3Lazo
 bUPttLlc3yUit0I+BSZnI5Kf0fptZZXFlKxCQJpu91JbtQGjKi4gGyjmANEWZtIhEMB+
 2djDwAMYa9LXHFNKNn8ZJZlEEaSqvLPP/C3kSpQ7Ggnl6sOWuKOyDoHqsIDCYH1VEuZa
 BzZBppeuQ6+bn0+8djPq7AeCqvvuNaxZeANhKd+7TOwmbye8rPUGFlBw8pBfyB6TSnMa
 4X6aJFlz0MuBJrFYm+F+T8szkNywyCq02c9rxmfYQCIakEW34fTE2hLcj65CUbdl55ec
 kB6Q==
X-Gm-Message-State: AOAM531LTCiaoiY2nmDNPmnaKkwGCgs3gdjAU5tRlxL9dy0b90LFVJ4O
 q3cQgw4YjwFx5HDA1zgo45IJig==
X-Google-Smtp-Source: ABdhPJwyyIe2jBpAoerujDirbO4rY9Xe5Cophwwo1PvJt0DtwWdDxkzOGYMcccAJJqr8guZLIXQUMQ==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr2337930wml.174.1643107481389; 
 Tue, 25 Jan 2022 02:44:41 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id o14sm5657228wry.104.2022.01.25.02.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:44:40 -0800 (PST)
Message-ID: <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
Date: Tue, 25 Jan 2022 10:44:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] nvmem: core: Fix a conflict between MTD and NVMEM on
 wp-gpios property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220105135734.271313-4-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_024442_862719_D2659DDE 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/01/2022 13:57, Christophe Kerello wrote:
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index e765d3d0542e..e11c74db64f9 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -769,7 +769,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	if (config->wp_gpio)
>   		nvmem->wp_gpio = config->wp_gpio;
> -	else
> +	else if (config->reg_write)
This is clearly not going to work for everyone.

A flag in nvmem_config to indicate that wp gpio is managed by provider 
driver would be the right thing to do here.
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);

--srini


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
