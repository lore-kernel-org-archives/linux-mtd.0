Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521C7CA0FFD
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 05:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfZ0kpChuTIvPZTECOrUXfe2DMpN3BCVuPZU+ucw6jc=; b=2tFzHc24uksq+F
	fuYS+zhi7fkvzpQKjTaWqgG5q14Tdt9SowA1rIrLWkl5ej4zz883TrDOHUDwVljPriBSDj0kiauKP
	L6iTGpY2EeBz5l8YNkcLDudS7J2N85vwZudNFEhv8gTgBoO70sh+1DMEkwL9nbgHhNDLgGDINzeo7
	orYUgD86ETLS5gSttnkDOLPoBkUyl6iVDreAdAVAsfrIPePTXcRkU4v6n3tEDlATzN/+1YxGM7nJp
	6fu5NWJ05q0B8UJkz+Cr6us30fWtzGXgck2nyKsp5DWe/3FIfN3dOaXBr6KTyiLVQcHat7+aPclHD
	LpLSh0dCIsmq6/6G4bUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswsO-0000000BBx4-0rJd;
	Mon, 01 Sep 2025 05:14:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswry-0000000BBwD-1zkl
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 05:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92AAB601B8;
	Mon,  1 Sep 2025 05:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74792C4CEF0;
	Mon,  1 Sep 2025 05:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756703657;
	bh=YBqGrC4KQDmdh1k6F/p7nJAbGIJ6Ho2IPZIUotlJCag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkfQsN2LjsEBlZcVV8uu5i5D6Gqwa2u90xzhZ2zwKIFPVl3BBEc//gQx1Yb+ZZ4bg
	 oLLdD4ygHAcQCi6zMoQ90vANF6cAy5m5SXfZ0Bm7ysuaqRy4wgdTR/stSPlyDurzwu
	 9zyufXPbXhRkAS5eiLEgIp9BfdF0hR3wS6CrGgDUkFsqOzYPs31815/9B2Ce9V4Msw
	 bIMWZqAlLqFf9BzjBJOo6H+Vy5Q2pB18ZWIYpY3ClZsTjYwFULS7j+2QAi8as4Tlpf
	 rwwjqG17jsJ/+o2DGEpUQgPaT5bE1Y/96a+EHew4gqyC0nIbuibyO+ohUDLAoetbcD
	 XUNjlmyTYDY1Q==
Date: Mon, 1 Sep 2025 07:14:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add realtek,rtl9301-ecc
Message-ID: <20250901-spiritual-lime-dolphin-1dfc0f@kuoka>
References: <20250828143408.2511086-1-markus.stockhausen@gmx.de>
 <20250828143408.2511086-2-markus.stockhausen@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250828143408.2511086-2-markus.stockhausen@gmx.de>
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

On Thu, Aug 28, 2025 at 10:34:07AM -0400, Markus Stockhausen wrote:
> Add a dtschema for the ECC engine on the Realtek RTL93xx SoCs.
> The engine supports BCH6 and BCH12 parity for 512 byte blocks.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> ---
> Changes in v2:
> - change cells from 2 to 1 (only 32 bit hardware)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
