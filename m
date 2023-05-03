Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33E6C77B75
	for <linux-mtd@archiver.kernel.org>; Wed,  3 May 2023 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzw1Q480hxMgSnHT8Y056vQM0MtmmZiqsBdO4othCis=; b=uUk4p5uQTgDl7H
	SMojwHxxebcghB0zLxBsreD2xLibpmlF3xcZ5y7io0sQWRW8Swu5K3yU34d4al+hqyMjWFEbTkhw6
	zi98sP1d2o0StlFm2RoPNY3RO5HWTcRmJ07mMoo7YadE80kN1P2bxB6Ki0kugaHOHq+SiixbGjRC0
	RDihQZdd0MF1xIg1s0r+ObDS2ueOQ20NdOZOy/VsQrniqsZJJ3DjLfWQq5RQi0rkTt0E+seZO1ZZO
	jFzKgM+EnJw6YGtIepQbr7yJTefhvSBY0y0ztsSledTVvtCLly85u7ytm+piUld9Hir6HFm3L3lSM
	v20VAC8MMtkOT7gDw3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puCoR-004kkl-1o;
	Wed, 03 May 2023 13:46:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puCoP-004kjs-09
	for linux-mtd@lists.infradead.org;
	Wed, 03 May 2023 13:46:30 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so6815646a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 03 May 2023 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683121586; x=1685713586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axb4hsXlmFr83tA4xeoHXLKOgCRNm9SMQj6gN9PpDXw=;
        b=QAzuGmeNB88tZp09MZP0yiysHnaBQL2cCSdPygobX+guQiWepOealJNlfOK+r3g/AS
         rAoFzy4Mm0EOQnZyGC2l86+uKx+sIRltqfAquaHCYPdxCnrJh4xUD4te+D7NG2U9U4o6
         NL45bLJnD6ld8KkSOplfnBwJpOJV9xdTOCpVVKZbumYVHymGGAHiG0Pz60dkvcPpU1Bx
         eVrQtKswaAc3V36t2+egEsImcQtKJ4dDVQMi+sIsVFK1IaaUNNQon1Ywuj9TMh0oTSjQ
         GHlXN+qcqQZi0tLVB3K4f7mCgafvFsFhy/26JnIUNYVfNuMvBY0bf/rQvZOlX6EZNny2
         r8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683121586; x=1685713586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=axb4hsXlmFr83tA4xeoHXLKOgCRNm9SMQj6gN9PpDXw=;
        b=jbQtp6z1DxOypo2IrIFgHCFBIKI66Mi5jrtc24zxX8QBgR0uIC9w+1BcWKrJVoIEh/
         T8vRle8KpBRVXLx653OHbrM9AYG+h2S+WE/Svg8O3WekuLKKeaixaYAjw7AB3MopWFNq
         Ez+5O4y7D2i94jXIWJX82GnDCBXl7wY7/3WJiHEQGXbKK+r+rHmG1WTZlzal7+tIdT0N
         bvxtVxIba8ZUDaeu0kd9dxxVULYpEsLzzczSygVwtaLsxXSa8Yc3gTanQj9Xht1xKPhE
         6WEsZrVmiUsA2VNFLOuCIFnhCej87Sc+tZGcgMHCP/decrda6YbsKzYwW7hCbLp6btrs
         uIWw==
X-Gm-Message-State: AC+VfDxWgjWnz3XPBV2ITL+oWdyV/6U7IzvCsaEQMetDEXNEtYk1SG7b
	ewNugu+T557zVnaP8zBIIk1LYQ==
X-Google-Smtp-Source: ACHHUZ4NuFlJ/Wa7YCqOr30cagS7gjoxX7SmR72GunTu/7lDsfbshb9zK3nhCGjzdoiZaNi7Bm/2WA==
X-Received: by 2002:a17:907:7e83:b0:94e:83d3:1b51 with SMTP id qb3-20020a1709077e8300b0094e83d31b51mr1842852ejc.23.1683121586596;
        Wed, 03 May 2023 06:46:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:db42:e3d0:c55a:8cf1? ([2a02:810d:15c0:828:db42:e3d0:c55a:8cf1])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906bc4c00b00947ed087a2csm17309530ejv.154.2023.05.03.06.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 06:46:25 -0700 (PDT)
Message-ID: <64ce9447-7ae5-efbf-870f-74e45075a748@linaro.org>
Date: Wed, 3 May 2023 15:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] dt-bindings: xilinx: Remove Naga from memory and mtd
 bindings
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
References: <6b4cdc7158599b4a38409a03eda56e38975b6233.1683103250.git.michal.simek@amd.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6b4cdc7158599b4a38409a03eda56e38975b6233.1683103250.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_064629_130191_99E9ADDC 
X-CRM114-Status: GOOD (  13.71  )
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

On 03/05/2023 10:40, Michal Simek wrote:
> Naga is no longer works for AMD/Xilinx and there is no activity from him to
> continue to maintain Xilinx related drivers. Two drivers have Miquel as
> maintainer and for the last one add myself instead to be kept in a loop if
> there is any change required.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  .../devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml   | 1 -
>  .../devicetree/bindings/mtd/arasan,nand-controller.yaml         | 2 +-
>  Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml  | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
