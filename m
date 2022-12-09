Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12862C04FDE
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuePjhHh+/gF6G1zmAMaN/7eF8BClyseSSKNqVN6948=; b=ROA0NQphVETBD1
	JSeedjxuZN42ZHmQmsAMv/hmcZ+PV/u17ttzXJFOl1ukzH7kgDh4iPAFG/cC9d5In8jHAF1W8fXU0
	I4bFAEstzAN8/D7xo8iMsUeV2lgS4mIw/ZUYc+he9xxt6mnKEkUnG4bhXBxI1MMVE+aPvytTKbQoX
	zemk/iCu0z5PugTIi+FZuMQDwvgrbO+XJqDgSWnMoBUfzaCUgh4EyyHMOSezvUw7VjJisnKChy6T8
	anoEV+2/AYq2BYIx6tjIehlPYaDLbKdPSIH4zf6L9xkxyI5KA6QkvOnBB8S0H2Jb+AALP9IIKpVry
	FoknbJqTe5P+9s0UHThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Z7j-0060Wg-0t; Fri, 09 Dec 2022 08:52:51 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Z7f-0060Uo-HF
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2022 08:52:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id c1so5996705lfi.7
        for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2022 00:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8D1QHQCpi29rzUZgRP89fJD5YqRNF7ocoA5T9SiKjU=;
        b=cIiLqmfm+vYdVKmG+GNYNX5be0nbheIFzXVWtAlhWk+RkRzT7DmA5ieXvUPqdLNHJg
         7qKKpuS8ObSV0MARDlnM5CAo+7MDTX4ak8jXAHFIS0mwxsbjEh6pZXJaa5jxfXT/uZL4
         MGplh7lO0U5fL0q1KZIf6j9+8p65W1FDt94xvRdrW8kjyd89qAvLVK+gWiIX5yZ3Os2D
         phjLCO4Rjv9T5HxiLUb7PLxZ1moW0LtDI4OdEbwwKryEji5GMBwNNeSkBKt4Gk9UX5JJ
         mbMesFVcZTlLQFBYv+zCzyyYw5Wjis1uudk2Z0hR3i+EWE0JSofRkSx+MA8lLXRhvjcf
         oDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8D1QHQCpi29rzUZgRP89fJD5YqRNF7ocoA5T9SiKjU=;
        b=jq93h5XZHPZtToJrHaPIqlJh7OsQ1IgKl1za1LyzERdE4iuUfe8McNyYZ+SIWTmK1m
         gerfqtwM2v6iBMkWqaAoMEyihYBbO7O5YsJy8+6wHTSZQdAMM9oejhNbRrEMdcOWDcok
         bOXpnjxYtf9+6bl+NPoihuxmem6WzXy9FUr0ysCQ9ErDcm9OjXykL0VLhafGmyBzyoz4
         a3w6ci5xVl5zrrLcr/dw9Fw3p3cqbFkfr3JQw3M9SrwoVSVN9FjiLpuCu/JhnhJ/ciT6
         Ku/3DjqcnsPknI5pN1hRIsHe5iHWbnyDh6ckdFPI0if5aboJE4p3DAPn6JOCWQZKjuqz
         x1bg==
X-Gm-Message-State: ANoB5plJzyfsEmaL5FHULbHuGLmqyH519fvI622g/3GdRMeysw5HTWWz
	dwWZSl+0WSRizUJyk2J4bcb0HA==
X-Google-Smtp-Source: AA0mqf4s8dwZrPgP5uaIipu4vmk7CP2r3nM7cQ0pGxmNAWVLRsr7PWOLyYeq0TYAdB7CiUq+wPdd9g==
X-Received: by 2002:a05:6512:10cd:b0:4b4:b8b9:e304 with SMTP id k13-20020a05651210cd00b004b4b8b9e304mr1712294lfg.22.1670575965824;
        Fri, 09 Dec 2022 00:52:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j7-20020a056512344700b004a100c21eaesm172948lfr.97.2022.12.09.00.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:52:45 -0800 (PST)
Message-ID: <500f9bdf-0de1-d6b2-1f09-11128699ce3a@linaro.org>
Date: Fri, 9 Dec 2022 09:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-8-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209064317.2828-8-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_005247_676497_C52BDF2E 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

On 09/12/2022 07:43, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
