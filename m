Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790CEC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA462071E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vmrw27WC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA462071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bw6bRnU8yT8XsubOdI67PKt8JrkaSy0xfBRmFZPzEJ0=; b=vmrw27WCLU+mCuJMBWUyqL4yY
	fFLK+kDQBg2tgsn7z8fHsNF32kuasSuJO7A5AIv/WtBKxIiIX0VPJtO+l4lcegr27ZjyVyS8iVr+X
	qvUZ+NQ/BgzreCsS2gtNavIN7k3m1bK3i/AZviAETPgO5ZLyIvhLNV0jeMrJOPcYO5RRsRiv7ILVV
	4S91B27xVaY2Hcgq+PMXhY70Jz5Wz8KqBq2LFkxwSzmVo4qMdS9XZDJGKhtJqpFLMOSvvnbd+c5oL
	adT6srW2vFrSQi0msoc/xINmFZAYjujg/ZbSUuH9WhbezHG1QKFQ2TT5PFj0bUGwvgtWUpTjnY4DB
	g9jVEHqZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kATDC-0003Yp-Jg; Tue, 25 Aug 2020 07:17:42 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kATD6-0003VI-K7; Tue, 25 Aug 2020 07:17:37 +0000
Received: by mail-wr1-f66.google.com with SMTP id r15so11562664wrp.13;
 Tue, 25 Aug 2020 00:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VUO6i/U3AVhRZX9XkX8wTuXOsuDoxa3aV3dAz0woA4o=;
 b=JGXxN60UHh1hbRbdy9Bs78OUQHnzOkwU7xYzE1qd6cEjfXfYruihaQjXYZTikRilbI
 dnlpJGecwq4fkvM4RD6vb22Cajn6oIeNT4jH/krfyP4eMfGMN1+Dr2Du9WpKxWSkMFRc
 Seh5WFAV3HXUAUZQ2mOs/u7ynW9VEVW8FlZTWgqnPJK8wfiWZCfEb/ko8ZD0RgfjzQ9X
 D6zoL5SswYyMXUG+uh/np4UvAdnbSHDO6aNS3XGSdcWF0uXM2tnFMuZHV4k99telJ8AT
 8J9z9VnlvZORCmWNQHAv9xdf6d9lxagg6POl4xO57lLLGtoaszKlf6SOy/B0FaY2xQKu
 opYw==
X-Gm-Message-State: AOAM530bQxUOMubbjT5ZqYvJUpB0d09jJ9iQxNM7ms4RCwbLvjs68X7T
 tHgnGAUC4cIJrjjo1k4oniQ=
X-Google-Smtp-Source: ABdhPJzJYPNbntZuVXqhHtMzbv8B44RjyoelOfsWDije4BgkxJQBl+U8ambvcHbMGJuX5NndB1iaIw==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr8719602wrr.243.1598339855693; 
 Tue, 25 Aug 2020 00:17:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id y3sm20848575wrs.36.2020.08.25.00.17.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 00:17:35 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:17:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 13/19] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Message-ID: <20200825071732.GD3458@kozik-lap>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-13-krzk@kernel.org>
 <20200825044653.GK13023@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825044653.GK13023@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_031736_716869_75B81C47 
X-CRM114-Status: GOOD (  18.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 06:46:53AM +0200, Sascha Hauer wrote:
> On Mon, Aug 24, 2020 at 06:26:46PM +0200, Krzysztof Kozlowski wrote:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx6q-ocotp
> > +              - fsl,imx6sl-ocotp
> > +              - fsl,imx6sx-ocotp
> > +              - fsl,imx6ul-ocotp
> > +              - fsl,imx6ull-ocotp
> > +              - fsl,imx7d-ocotp
> > +              - fsl,imx6sll-ocotp
> > +              - fsl,imx7ulp-ocotp
> > +              - fsl,imx8mq-ocotp
> > +              - fsl,imx8mm-ocotp
> > +              - fsl,imx8mn-ocotp
> > +              - fsl,imx8mp-ocotp
> > +          - const: syscon
> > +      - items:
> > +          # The devices are not really compatible with fsl,imx8mm-ocotp, however
> > +          # the code for getting SoC revision depends on fsl,imx8mm-ocotp compatible.
> 
> Shouldn't this be fixed? It seems strange to justify a binding with
> existing code.

The fsl,imx8mn-ocotp is actually compatible with "mm", only the
fsl,imx8mp-ocotp is not (although someone might argue that subset of
"mp" falls into "mn").

The problem is that drivers/soc/imx/soc-imx8m.c checks revision only
against the fsl,imx8mm-ocotp compatible, not the others. It's the
pattern used in that driver also for other i.MX 8. Therefore it is a
binding implemented and actually used, regardless whether it is correct
from hardware point of view or not.

If that's preferred, I could adjust the drivers/soc/imx/soc-imx8m.c for
the incompatible "mp". It should not break anything.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
