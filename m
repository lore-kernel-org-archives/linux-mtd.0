Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D49DC43217
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCESAS+2L+AojC6xOsJcisoREia9Xl1bO+iPidbmLHw=; b=JLLzra8XQEHpbd
	ECuB+jdYHVb4dmajB0VQ6W62/MTlk/Fsc6sEBPphxdRp/CTvMrg5p/OGoNQ1in/oKxRyc5oYsaaQ3
	jonm8gPMWSjVWdDbeL7ciaK6JBQT8CFXt6Pnx+NNTOUCqFAjfovlR0DyCtaZr/IQSLeBVvDb6umZA
	DD1fOUbD0eH0P0KQETX/shAmJgt60dJB3/YIHkXv6Sly31yCvqaB5t/6nbafryQtUbQoCd7OE+c5Q
	NjsLDqm+XIESQA4k4bU0rAdVYWfHoSfEGbxQwzcimLDPVO5Nuc35unxTaQ4Ua1jvW/MIwXLB2jwyj
	FCNBVSxf9pz4snZ3zdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeKp-00Cakb-CO; Wed, 23 Nov 2022 01:13:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeK8-00CaLb-4W; Wed, 23 Nov 2022 01:13:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5445B81CBD;
	Wed, 23 Nov 2022 01:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4363BC433C1;
	Wed, 23 Nov 2022 01:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669165990;
	bh=nvLUP9mKSfVjV3lDJNVSERheXpEUfGI08VlUDbu2V1U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fYR7QAuTYuyTQ3I+trdHHxC3zRyhJ1Mse1I2JpTfYlRa3gvQvYv+/0pj8Bx+1nqXG
	 zwAECCgZ3VqRDDl8UKxF1/eHRntLPB6CqDrehC+JvPvmOWhMQSG7CKhV/6EP4A0UL4
	 HB9WEL9PA1dcdp6wt/k/TMxBkiRQtKjf4C8eQCytExXCJHeDeVny/rQhEiY1eqPD84
	 HzmqSRXmy8bFBt89jjjJbvN9l7haj/qKjAIKI+ehNDbfKAnZkec+aFxWowTbLQ2lgj
	 B2/K2iW+5hyPUXYJ5syIizDZt7Alg4nUj2o3AIXd7UrgsmVP8zL95OcdrKcfy8E1Vo
	 sTcJNu+bxk3Bg==
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-9-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-9-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 8/9] dt-bindings: clock: drop redundant part of title
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:13:08 -0800
User-Agent: alot/0.10
Message-Id: <20221123011310.4363BC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_171312_376648_DC2281D3 
X-CRM114-Status: UNSURE (   9.26  )
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:14)
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
> 
> Drop "Devicetree bindings" in various forms:
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD]evice[ -]\?[tT]ree [cC]lock [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2 Clock Controller/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [cC]lock [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2 Clock Controller/' {} \;
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
