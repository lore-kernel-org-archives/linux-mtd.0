Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC68C7619A
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Apr 2023 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZuWQUVN1fGsqjubOE7o+n85tqow6RwJU+7r93dIY/0=; b=oY4kdM+c1OR2Mz
	vjgYBDcmMe7RgTjlrkUuziMMxprGpQV7M6FL/t4FX/0ejwFw706zhocf0DVsfFXLt0R24jEZ70oTs
	/FQgaQkD529ryyOf65jB/vZNbetew3fi/7Gxkxzt0fvjxA3HFrsqxd/vI9zUP80IjRMcVEfeVY+H3
	YQrjccQXl2Wabitjl6efLtOojgwfiP535jPfhd83uDDUtnmoTzZrS4K4KfY9ZmnblyApAymbWW97K
	3SPzoatRmdphOraEVAaSv+1AJ8Nk2rlK2a6YQd9PSUhUh7rTqGHZkgBwM1sBfZuXnR4cWjuS93LLO
	6rCqEuJ+3YuDuCp5TDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piuna-00CFHO-2w;
	Sun, 02 Apr 2023 10:18:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piunR-00CFD4-2e
	for linux-mtd@lists.infradead.org;
	Sun, 02 Apr 2023 10:18:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id t10so106260323edd.12
        for <linux-mtd@lists.infradead.org>; Sun, 02 Apr 2023 03:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rAiXCax5IEv3GbtrRjNdKeaqlkFvh50Ja+hlmWJztM=;
        b=CZ6AIWc+LYoqh0eKEeSfubGzY7nIZAjyELJDiSiiYYbEOgKtzDqCe3DdPPU2HH7+6l
         XyE76sN9/H2OjdE+O6lBy8jz9tirH524AiHcq1uu6AWrGQVgzo7qvWaxmZKqTdWk0xhq
         cnFbpfbEBkdTCWpkG0xdGy7sedCy1zlVtGLZDH3RJ0nB9toyOSb8AnnyEUDn4EUF8Vtk
         iOAiBOR+Ggh5Q4EdePZCLxCfhws6xkFYnx50q2m/KqpmtBgbz9yCfA70877PIDqFQUfn
         lTbFradnLqyvCRVf2pcUT4UXXy20oY+tZMVT5JF8h9Gvuv37ODIhzGz74Q2d91Tbt8U4
         l1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rAiXCax5IEv3GbtrRjNdKeaqlkFvh50Ja+hlmWJztM=;
        b=OR14XWyvFQXTt/yNn6AY+GksdI9HhB17nUr1jU3wWPjcDYTIXCJPldpbPdGal0Fgpw
         Qh6FSUQ8433W8czNfRTawrp7O+OBu6H+iya1i2b2FLWV2Hg1zi5cvGwMpY6u1p0lSRRU
         M9+MucuvMHQq17ZVfBsTt2EcxeAfl/PoGtaB6bDJH3/Zsw43W152ZSNhTYcfZfFgk9Lk
         /W8v3sjLxo99AmvcqgwJOxMv+bSz+Rx5XdrljffGonM6f0gEMKr0hpNYC//oogy8sLmT
         m4Hp/smTFNv1oQitgGvv56E7mRvBoS4Mx00gpTcBMt4fq4swpa/07PHGsxKQo2oGPjSn
         DKzg==
X-Gm-Message-State: AAQBX9cDWIGqmXEuJ65HRK3YUUOfjG0Ph8djej/+AKArazAdkbJJks3t
	A9UN3UVGaorxUMXd6UJsYo2irQ==
X-Google-Smtp-Source: AKy350a58/ZGMnWVhUq5Dhq9lLiSkEtxFuGyfG7+T6kIeXZ4waLFXxIO23QvKHjBcWD0NzsEIN9V1g==
X-Received: by 2002:a05:6402:cc:b0:500:5627:a20b with SMTP id i12-20020a05640200cc00b005005627a20bmr30009201edu.1.1680430726087;
        Sun, 02 Apr 2023 03:18:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id a65-20020a509ec7000000b004fbf6b35a56sm3133164edf.76.2023.04.02.03.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:45 -0700 (PDT)
Message-ID: <626b9c03-2425-3d26-b088-66412f386657@linaro.org>
Date: Sun, 2 Apr 2023 12:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 08/20] dt-bindings: timer: oxsemi,rps-timer: remove
 obsolete bindings
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_031851_696525_4A2A4A82 
X-CRM114-Status: UNSURE (   9.94  )
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

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 timer bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
