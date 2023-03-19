Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742CC7618A
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Mar 2023 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LR+IkdDlpkcb8w1rt6ugFx16GTkFz4vFCPHS8SApNU=; b=FZDoghnmR7at4e
	K/arAhZwiB+TzJcI0CuLP/gQd1gqXJWNEpe0S6fxuu5si6yBOoK4W5LxMPLDqOxGcpxkpQZLHkT2Z
	KmphXPUanFwJovdBisYUjIZra7qRUa7VAPTtNDsKc2uqsG4w1Nv8/wA/i6j4532KSUBVLfgtxwHyZ
	4IbTB1I49SsHkEwTQvATdwtBc6KV831B2AIte2Aj3xccw+Z7MraRixz9TMP2TYxRoKAuz9RtTrdt2
	XtwG3PSCZ5/x+3Aqlla8X0CL8D5yTJD/zpYQ+0pQ5/uNvqtpQjrpxM5UkX4KirO2lY0ijpZ3Yurgu
	9cIGVOGYLFsm5W7LeIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdroj-006ct3-2q;
	Sun, 19 Mar 2023 12:07:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdroe-006cog-2g
	for linux-mtd@lists.infradead.org;
	Sun, 19 Mar 2023 12:07:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id cy23so36695623edb.12
        for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2023 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=TzAXlqE8TgfprcWtggNsM5B4SQJQtCXYoRCn8uqjU6Dppl3AIp4F/El+x+T+cy9/Hp
         oAdm77wfFODxSKeyHAiXXUxrdkhRop2rDx79qH1f2hq0fJQiR6YqC0/5p587b7PhB50N
         Az1pLOxhlA4adj+8SICk15XWO3UofGCHYaEdHmQfeW5uy/uSbfi0mu2/WOM2SoE5NwK9
         XKhHart75hNrLBOJU0s4puBzvV/H170DSekttmS/Ku+kn8xvWyBxg94fAif55VGfJ2lc
         s8ZrCs9dbcSnm0K6ktftWRN9UtNVNOy7IHzXjQI/cq3HVT1durOmcBipUAdQzSZ9tz+J
         7FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=z8RTSCzPhjbxK7eq+IbOupG9QuZ29jRDvnC0qxuD8MYNb2IHG9cGlk7VHCiJs+vB+2
         ciA6wO01nnhQpHMNSF67cDZSKlPBRcXz6QdVBOE062RgisnTE/GIy4gfFrN6mEgb+olr
         JOr7innVHnUaVNGcVNiOOQVNHo8BZObu0q8pyu9lt9wg2E250uD1YTD/TfgYBOZtKzrT
         gkns2ftIqUgioUkaMdTQi9KSpa7z56hxV0Rhou1hyVdADbCxQiiJXJa/TgUuxU0Q9BTy
         GD/P/Hk7zXW5pAf7R8mqW6vtM1uei7B+7oha3OI48Jy/4gj3bGoMtJbCAUY5TrcrbY/I
         Piew==
X-Gm-Message-State: AO0yUKWS0eoJEnmf94Frm6zxJfAR1pcOUZADEYLegHBR24/eEsmKgZ5p
	EtH3QuW8DxNzcF5K22gAqMG9bw==
X-Google-Smtp-Source: AK7set8ojqGhOAjmBHwzN76QhQtwOWV8Psp9NGV0PffUGEU20N+02MFB5rvCOFkPKNTFQrrwRiSzoQ==
X-Received: by 2002:a17:906:40c2:b0:91f:32f9:82f0 with SMTP id a2-20020a17090640c200b0091f32f982f0mr5542602ejk.29.1679227630370;
        Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170907984400b009323f08827dsm2744307ejc.13.2023.03.19.05.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
Message-ID: <68a5d8d8-b70a-e58e-e38e-5f185121e01a@linaro.org>
Date: Sun, 19 Mar 2023 13:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mtd: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230317233631.3968509-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_050712_871174_661730C0 
X-CRM114-Status: UNSURE (   9.57  )
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

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
