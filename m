Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA919C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vad0rTDD5ro97JfcxH1ERQHw2om2ZEM93tSBINvuvFE=; b=41WWxz1ccjf1XE
	wQmdw3sgO1F0mxAheiy/bEEpD5DsJLSRnta8uGa7a/tngIGRn/RSzj2HuMPlq0eLgamw1vS8WpJV4
	k30tFNIPE/LznIosRxxd3HUudM5KzCd1/xuNLutkQ8V4lopwMm0WxlgOLH/1bv2HTPPlNuuWnVjnY
	YI9rPSs/SCS84xSSE78T813nadmZCvFSNuYyf/VQir1k0SZG8ewgzITfhQITm5S4e/aqi+QWSlKd2
	Vaj/FlG+g/xiMAHO1evNFm0KPwR0TBdxIfscSTI/wqv9gYZzLjnnywJdxw4fO/toj8szHcZhOsx1E
	f6HLlpLwFoDb7LepXFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOUW-00G8c3-36;
	Mon, 03 Apr 2023 18:01:16 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOUU-00G8aS-14;
	Mon, 03 Apr 2023 18:01:15 +0000
Received: by mail-ot1-f43.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so12907195otd.3;
        Mon, 03 Apr 2023 11:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+2HyVBZpgIAk4A8UQ7TPXHjOeuEm1wa0e7V0v5arzY=;
        b=AZ1ZXSP09566mjPnna9xKmngSoCzmLgssZNrsv+py2T+siFBSUAARN8W2Ga2uycsIN
         Ky5/znZ4eWsQtIEvJOj+6QIyFXnJr1dSBXDIf310dfu8X7KA51i2pRnz7uAoTKdoF6dU
         GOaOtdI22ueRqnWRfALtZuH+Lb2cyt4xqbQVSyJcfBHyb7GX/63VxawZYTqrXLpE7t5E
         ZVPQsg48Wbew+ogA8rkBq2zdbV9nvsA6lmvIUD7oOmVuLEzEHxFBfdQkaiMKEZyVBnY4
         a7vLp2XI8v/BI92Jq1WQhelmVDDTQ/51OeVg/izc0vWgSePVc98TCSnivL/pjnx8w1UI
         wb/Q==
X-Gm-Message-State: AAQBX9cC5zn3ALkjY2PvLkpAwvKmJDwNNwDKOmeC9Jzyw3nAnzfGQQzp
	cptyQX5He1o/++elGOlUEw==
X-Google-Smtp-Source: AKy350YbposOHjUqSKPLp1r0c5pZmS2vrYBOO8PRSBJMRbIsZ8g5xLashYmoygD9IWOODdA8MPrzFQ==
X-Received: by 2002:a9d:63c5:0:b0:697:a381:a8f8 with SMTP id e5-20020a9d63c5000000b00697a381a8f8mr41722otl.3.1680544871315;
        Mon, 03 Apr 2023 11:01:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d11-20020a9d5e0b000000b006a3170fe3efsm2707835oti.27.2023.04.03.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:59:56 -0700 (PDT)
Received: (nullmailer pid 1164679 invoked by uid 1000);
	Mon, 03 Apr 2023 17:59:39 -0000
Date: Mon, 3 Apr 2023 12:59:39 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove obsolete
 bindings
Message-ID: <20230403175939.GA1162106-robh@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_110114_367720_97366A15 
X-CRM114-Status: GOOD (  11.02  )
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

On Fri, Mar 31, 2023 at 10:34:44AM +0200, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,

I can't spell it either, but checkpatch tells me it is: maintenance

> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ----------------------
>  1 file changed, 28 deletions(-)

Always great to see fewer bindings. 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
