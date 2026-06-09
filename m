Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8670CD8C85
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bLx2z89WiOa+lHFeFgL7znvPtZDhDD2rrDU5si7DP8=; b=pPRSMbk0FsKOcw
	qGBVQqr9jwhawslq+P7+Ah0Jgd7bRzbhaBMpRNLXQM3iaB3MuZaeuWKtuUm49MDv9ojda/6mO+5Ar
	NcKQokYJhW3PpgYnPB+a9hg0eghh7QmzKq9AQvJ0RodmrkeTbTsFGxwGRkgDYX6p/GJUcSQOeYV3c
	fGaaVXpiupAI4AOKDdUQHoN692aY+3YygO8BYF9kcEIboxzmdvxHdZqRs/xi4cH0bTJPeygnixBaX
	Qyt4qV6wuw6Zg3oZydgZ4TBEAsEKEJmgVMaWIiLOX6DkY+4J9LZP+gA79MnOkySCNM+xV1O8WpWoN
	gHXdRQ9c0Ql/Mq4H5V1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqox-00000004xbA-3BP1;
	Tue, 09 Jun 2026 07:24:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqow-00000004xaz-0gE1
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 07:24:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDCCD43D00;
	Tue,  9 Jun 2026 07:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FC91F00893;
	Tue,  9 Jun 2026 07:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989861;
	bh=nP5nc6+ayGjvJcpkjtBre/TACIZYVnCWBbFhPz6C0I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCG6KX2mqGLppONKgLkFr8y1dFex0IQlMofSyGGxuaNR2StBlQdS6vlKHF6LtK3w6
	 WbTaEJTwvRKl6nGCXoZ7d8I2rO8JCvRr4PNJO0XBYwWDDkouxpSeuHp7a5XPGN0rQl
	 Sg2IcHcSJff5DI1XfuqpmTo68nK5mm1Zk63J2/JD2xgXISi8jT9NEJ8HR95CNmJtD0
	 P3edsicUK602/nV91losjMsu6lw8t/uzuSwnriCIyLc10CZcR5j3vobapJ7AaDo4Cc
	 CRPDwT8nch9UYXBm0yQHhqeLdzdpjHM3SeJWXPQzLRffX20ZUujV6+0nVct9ovl2Fw
	 JfPd4c0aaNhWQ==
Date: Tue, 9 Jun 2026 09:24:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Message-ID: <20260609-aloof-healthy-condor-c3ca92@quoll>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
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

On Mon, Jun 08, 2026 at 03:20:23PM +0200, Stephan Gerhold wrote:
> Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
> clock for the NAND controller. The actual clocks in the hardware are
> managed by the firmware and turned on all together when needed. In this
> case, there is no separate "aon" clock that can be described in the device
> tree.
> 
> Make the second "aon" clock optional to avoid an error when it is missing.
> For platforms that really need it, the dt-bindings are responsible for
> validating that.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
