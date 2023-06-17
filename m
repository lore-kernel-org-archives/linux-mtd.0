Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113B0EB64D9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Jun 2023 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxmT0KnFYn9iuhLxi1a1D+oWU/vQ1IVw/mSoyLmfP2I=; b=lZDIt5Io5ZBUyj
	FofobuBwBn9SKm8lRFN3zjJ4Fn4NppuhuzfFd1+HnXSko+8keOg6+X45ZRwD8sxtvd/HdAAnH/0o8
	LEcfM4SLelx6MYiOqTrBW6ytPxQP51mW+SEZXJbOEYdfK69Tk1XcPqnEXyyBwZydLEok2z7949Jrq
	dlo9kWa0AWTC25U6rbRnLJNQiqBDOi2sE8qrLBe6bYmGuU2yd9wSAKa3dtzfc5cpmibzEpVtJsAao
	hHZcXl1KtyhVbtb4Zs/u6V+zO69+dH1V8aotxzMzAnj6Gg7RTnJASDjMwJCllGTeDIuMyWVBuWn06
	kdgyYg7P3RppeYZ3e/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAQlT-0032Ly-15;
	Sat, 17 Jun 2023 07:54:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAQlR-0032Ip-0U
	for linux-mtd@lists.infradead.org;
	Sat, 17 Jun 2023 07:54:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-987accb4349so39105766b.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Jun 2023 00:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686988467; x=1689580467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1a2NLdlqDkuoOaRV6zLf1eeeGbnu0E9wrw5eqdmSuIk=;
        b=YNBGzaLcZT4x3XYAUmgL04+Ls0IyGXBihnzAjn6/XjhnDguQo4OVshOs3+H2Sy8UA9
         IDXi9+cCfvZhn1xr2pwo75RItG3gyyXWBYeZ3BBpze5J0MbdCqc0M5/k0yC0x1elOKoB
         mXM2BjxtPF/MuE997PrF7IsxzYLSYjbFb2cS9uOAbrp81okGhD3WnPQZJcNhrGBGooUk
         mplGCWdv/HDqbhTxwrEFoIr6k62VK5H3+0qSjx6qqmudjX5XZBGzSAwSIOH+dYU4sthN
         HXvZeSzNPuRkFd5uZgCMpmRT3GrnWqOPFknGFvK8C8uOSmTeCuiKnVw7KcBwJUNoc+aF
         BgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686988467; x=1689580467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1a2NLdlqDkuoOaRV6zLf1eeeGbnu0E9wrw5eqdmSuIk=;
        b=OGZ6dfStEi5xGgeEBSE1i4mXNv0/Q6gxxynbMQXljC00x8ELniMAywmXZ0qLuCVxNQ
         P3cul11i4MpIOpk6uRD1ey45bYkJO+S6lmGlFBSG4ghY8AB3be6Z5cv3RbAvxtjjr2hw
         hw+cop63UfC/nlRrfB3OZX8LcNmDjFAExXJrJev7pe93Kq1ROm4/A3TtGoxhQrXu4KGt
         7yJcRTz6tuAmcjeHM8mOcHV5DYgjT+G9+AN8FZKV/DHB+E3ZdxAMYgcpJUn/WzRmnK0f
         vjS0MYTnBgebOeBf31YhvQlzB8c0N66Yea742A30JXUIJoXUxC7/o0fy10uXX9gaEG0e
         7y7g==
X-Gm-Message-State: AC+VfDwpBkN7Ie476jCUWjwzD2VQNJUjJTv8UbQPLRqO6jXoY1i4aC4H
	p+TS2jBw48JiEm+HscDOeMNQKQ==
X-Google-Smtp-Source: ACHHUZ4Lkg/BJcbaRPN6LTKZ/mQ4kHOChdTK9Bnn+7FhqfhATyMF72kKfvoR3yWqjJw8tD3xJfjQxA==
X-Received: by 2002:a17:906:9b91:b0:982:227e:1a16 with SMTP id dd17-20020a1709069b9100b00982227e1a16mr4425627ejc.13.1686988466822;
        Sat, 17 Jun 2023 00:54:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b6-20020a1709065e4600b00985ed2f1584sm1915268eju.187.2023.06.17.00.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 00:54:26 -0700 (PDT)
Message-ID: <220815bc-3c45-ebe9-277f-0c81d27c9832@linaro.org>
Date: Sat, 17 Jun 2023 09:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: clarify the need for spi-nor
 compatibles
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_005429_232979_4E1963BB 
X-CRM114-Status: UNSURE (   7.79  )
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

On 16/06/2023 16:00, Miquel Raynal wrote:
> Most SPI NOR devices do not require a specific compatible, their ID can
> in general be discovered with the JEDEC READ ID opcode. In this case,
> only the "jedec,spi-nor" generic compatible is expected. Clarify this
> information in the compatible description to (i) help device-tree
> writers and (ii) prevent further attempts to extend this list with
> useless information.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
