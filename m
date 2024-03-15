Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E0CC54E67
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 16:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCn8gApUYVlwzJzv8o9APDopsTcvljQiBT1DYPNmwNY=; b=VoxhiFeN5TXy0+
	VpDvyJeK8ZFtYZDKE6/gsTBPRhkPlqMl4Z68VwOzP//ICC6qhC7XpN8m3SUADfXqji7xOjOj8rmRm
	3YR6ab+OQ4P0z+14IzWItE7BF4CqKtVXojb8XVNLD8J1wmhKFZIpXYH5HpKLPfsOwwNqZLiUbKgnO
	gmpk0TYc0u9TXYNolnvjzyjvd0G6k7yYwKjm8PZzSvgjOC+jC7vU4fubFuu+JCOugeu5nFVPKA9FV
	e4KRFCniY5teGOVqt5qz9dXCIdTPFSvELamc2JZLFjf3Qfk6uN770eucpkAUCI9aB2RY43pQmkijl
	oZ03l9uC9rYFfBQAzbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlAGh-00000000muu-3HnF;
	Fri, 15 Mar 2024 16:18:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlAGe-00000000mtq-2Z9A;
	Fri, 15 Mar 2024 16:18:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95A1BCE1F96;
	Fri, 15 Mar 2024 16:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF912C433F1;
	Fri, 15 Mar 2024 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710519525;
	bh=I4yiGMKxs0fQ59nZ33YMS14pXHChscnJgtcJ520E6iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxtVPwY4vfEneiTk0m6zTkW0Ro2JARQvje9ayWwneQB4/q/b6bVXmqjyYxdzbvEfF
	 kS85xsStpchgmWCbsMVyRVguKK3uyntKlDEPrmp89rkPbVc+PIOlz/ENPUSmn8AJ/K
	 ArcWe+q7UDMl4EL4bpfXrsMZeTKV5J4kBHRdpmc6n/9dyIV2gTpmfqLfmvfVWdu3xB
	 uaQPNirGXjUFa4AuVpwevZA87e9wApe/sN9tuBekd9G19u58b5cv4O/H4Vos99RBmC
	 yJoJD0GRYvC3fMAwFqIAetSJgkUozpgKtMpyV0CwKpAh6W51VTHb52J8ksxv+omq4g
	 t0zXMWoGS1LBA==
Date: Fri, 15 Mar 2024 10:18:43 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-samsung-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add Samsung S5Pv210 OneNAND
Message-ID: <171051952297.1435235.12756745883937589239.robh@kernel.org>
References: <20240313184317.18466-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240313184317.18466-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_091848_865660_45159841 
X-CRM114-Status: UNSURE (   8.23  )
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


On Wed, 13 Mar 2024 19:43:17 +0100, Krzysztof Kozlowski wrote:
> Document binding for Samsung S5Pv210 SoC OneNAND controller used already
> in S5Pv210 DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mtd/samsung,s5pv210-onenand.yaml | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
