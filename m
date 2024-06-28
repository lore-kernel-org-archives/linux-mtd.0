Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB91C30658
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 21:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGz0npw9gUrrXdiYiEyuEBPTtY9TZENN1Bziq8vtmm8=; b=yDvM3E42qENest
	ggLufsmbkmQPaExvuJq2DjLfOsNyV6I4/DWqLHc40UNzAJ1L8L6KBD6GqQMQ9sYPwHL86jBqo1ewC
	kZgQ6dZd9XySbABPkbkt061k4q3VqWrjecggq2yovE9TntswiJJcvKtjKeTXzyxYj4j00PYXVlVck
	tHpsTqIkLT4/AtYdxkwKf4C27DjosKq16Dsp38ao+bM4ygIEPv3pgsyBQMh5qF4Ahnh+ChcmTyopG
	A8KVW6fXF+hqJci5yUk5AwMhWxPqihIKaLKQZDj8G/jUVO5apa/bON4Xjp88msHhUQ6ZK/6c4toKt
	zdnZpwZqoR28CmY39ueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNJXc-0000000F5E4-11ev;
	Fri, 28 Jun 2024 21:54:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNJXZ-0000000F5DR-2Top;
	Fri, 28 Jun 2024 21:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24ED2620F0;
	Fri, 28 Jun 2024 21:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F2BC116B1;
	Fri, 28 Jun 2024 21:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719611633;
	bh=WcshtjSqHHVhmIBO76+DfRQx30aQY4R3HPwLd14k22E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtN5dCO2I35JCVc1GH9W+SlqlKfkmWFQygB8uqBD3iyYwQt/O/Neb9C6D37IBdANa
	 4SSmVf2GraKNQfMlSJdWAhry+2YIdJLKDQpzIB+UzWoPlduqjSY660NKkcSSTYVcz3
	 LaeuNi3gRNuQiEWwP8yWC1UPqO0PugY+DM/vai+WiFovnvsta1ApISRoBQL7O0U/xn
	 YDoxNfQYaVc+bTUzUyjuUmAyL3gzP/8PZPsEvu/JVYH6sHh1yLnfKpz0NG7/FE8MQ5
	 j5b4JgHIods4YJNlUqc+d/PJdd2tc7Mm84/FpgBurw2MWifZ/uvVzWM08U5/dQZ7fM
	 pQEb5I1EuTYBQ==
Date: Fri, 28 Jun 2024 15:53:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: intel,lgm: drop inactive maintainers from
 intel
Message-ID: <20240628215350.GA267712-robh@kernel.org>
References: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_145357_719759_03734B57 
X-CRM114-Status: GOOD (  11.67  )
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

On Wed, Jun 26, 2024 at 12:18:09PM +0200, Krzysztof Kozlowski wrote:
> Emails to chuanhua.lei@intel.com, mallikarjunax.reddy@intel.com,
> yixin.zhu@intel.com and vadivel.muruganx.ramuthevar@linux.intel.com
> bounce with the same message:
> 
>   Your message wasn't delivered to Yixin.zhu@intel.com because the
>   address couldn't be found or is unable to receive email.
> 
> The Intel LGM SoC was apparently part of Home Gateway division which was
> acquired by Maxlinear, so switch maintenance of affected bindings to the
> only known non-bouncing Maxlinear address: Rahul Tanwar.
> 
> I do not know if Rahul Tanwar or Maxlinear want to maintain the
> bindings, so regardless of this change we should consider bindings
> abandoned and probably drop soon.

No bounces on this? According to this[1], Rahul is not with Maxlinear 
any more. Maybe an address in that thread will work. But seems like it 
is abandoned.

Rob

[1] https://lore.kernel.org/all/20230519044555.3750-2-yzhu@maxlinear.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
