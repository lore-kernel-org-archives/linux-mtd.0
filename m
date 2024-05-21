Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4A9C25B74
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qStGqOHTmbBuK3Q3muGGEKTj6x5K0w8hoA4+tuunEcc=; b=hClnA8MYDAyB5d
	gxqSig93+ooqS7QCvmWmo+uAYcHQ7ZtH2LjXw+C2XtW4VqlP6or7bAbbweaK9JgZPv++kslQSYGca
	ycEle8A0E5Xj+FuXWIZoOXD0/lmt0pCGQDK0gViZmYc1Jql6JB0IBdh4eQQriamfzc7VTLzUua+Em
	EUKKrzui4yORi4yxi8aPF9bDxkp5tLbawkxzE9MkyIrmRBSkmJNb0t/Ha6DcNXNVM9OgSy0gQ+OKn
	VaJwctoHIz0Vpzh0RjHy6Ost5j2nLlqkMBSdyCHPu7VgS+KSviGg1/DpUKRsIZrorjPjJXjThXbwW
	M2U/47zw5PU3EBJOKPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PzC-000000004Cg-0WcX;
	Tue, 21 May 2024 13:57:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Pz8-000000004BF-3SXW;
	Tue, 21 May 2024 13:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F38C962237;
	Tue, 21 May 2024 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67384C32786;
	Tue, 21 May 2024 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716299817;
	bh=xVshbswY1e7znH1UPTx4SgJIxRng+OL6cql7RES1tjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCW6osSl45u0s6PY3hWxZwq3eDSVjS8M+xeO5IEc8im0M7hvlbh4pn1zbpIlZDD5p
	 fvdSUmLFW7rduHE+VqbXa7qgN75Fem4PRRmrmRg9ftJ/2jCTDCmO9wN1mWKaa1XdmK
	 IyjwZtBku40zbmMOgvItxlVl+tbLU5abhwFW+do2EmE2wvfhtEGgsjIuWtoeTQ2N4t
	 +vb4qnFF0Q3vfKUqFO4SGACfInaN38jdyCFAlwi21TfO5i+CYkxNxf6S/3XsmspJ68
	 OdB38zqqYnznWQuAUw7eHNUyy8b5A9e5qiRY9Rldvz0ixrkluWZ42su2UyFDBegTOa
	 F/9qZWLUVsmHQ==
Date: Tue, 21 May 2024 08:56:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
	dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Han Xu <han.xu@nxp.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: dma: fsl-mxs-dma: Add compatible
 string "fsl,imx8qxp-dma-apbh"
Message-ID: <171629980867.3956813.9155367287615832279.robh@kernel.org>
References: <20240520-gpmi_nand-v2-0-e3017e4c9da5@nxp.com>
 <20240520-gpmi_nand-v2-2-e3017e4c9da5@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520-gpmi_nand-v2-2-e3017e4c9da5@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_065658_921406_FA408F85 
X-CRM114-Status: UNSURE (   9.68  )
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


On Mon, 20 May 2024 12:09:13 -0400, Frank Li wrote:
> Add compatible string "fsl,imx8qxp-dma-apbh". It requires power-domains
> compared with "fsl,imx28-dma-apbh".
> 
> Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP need
> it.
> 
> Keep the same restriction about 'power-domains' for other compatible
> strings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
