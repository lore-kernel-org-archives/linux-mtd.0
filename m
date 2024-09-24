Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BA3CF9C6B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 20:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+WCrFpDm6VjHan6erHEU3/6IJPMF7kXrPv/k7PGwTs=; b=YXMa9xfrlyGlRg
	a8GVdmYmAgyldgUIgQagVWL9TUYzuE1RJT+1iAwV15tgJ9QO2sqys25qHSnnYtoUY2oK+86M19ZTW
	7g4GxprxYRpzBYcaUuALY/cRG6RmIWUmfKOfdhS6szYgwT2a1NTkFA7TMCBs23THo/IzmBC6mpDGF
	7lq5LPFH+QJG1jHnHFsr0MdU72UvBfhuiQIQa4foybYPBvi5omo1NQcxjJziMlw0el+/PClr0/Ek/
	EzyYfx5pjGSYb9UYNg3iWOl8dFkZqYIz0TsyScphGedttBFid/whdgWo5lz5eBOmz6O/mz5/bmfQH
	k/6jbWHRNCPr3BC2SB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stCF3-00000003G8Q-4355;
	Tue, 24 Sep 2024 20:34:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stCDl-00000003FmH-0Ptn;
	Tue, 24 Sep 2024 20:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37B26A4251C;
	Tue, 24 Sep 2024 20:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CB2C4CEC4;
	Tue, 24 Sep 2024 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209995;
	bh=McE1ehFOOaO9ZsLkHofB1vea/POcgDPEQ4Svju5Kh8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bodrovcqo2at7klVob1pQ8dfshpDN3ftJaleaWJhqKX0QyftgtY0HZBhdiSUEnQOj
	 NRDpHVdnC4XJB+AfXU/uqU3dVQosPVr7u/SE+x6LOyY0m5vpBCFVR8h8gr1rifkNkn
	 9WfOZp2Q4p4/MoWfLZTvJSsHgbuAwjwNweWvNTgsTwyKUPiiZmq1BYC6mLETTLwKV5
	 EXtHoYpgZJqalgyxmGMYDstfj2SkYzOWwGqissDa2154PZuGHbYlOvkI31Iouoh3Eh
	 J9EBYeakfhnX6EGA+KyXAQQJPum4vuSkO7UNUQNn/9kGmFzfcVL/i5sD3fvgdd1G4W
	 4L0lF1Ti8X/7g==
Date: Tue, 24 Sep 2024 15:33:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
Message-ID: <172720999440.288956.7630447926663790865.robh@kernel.org>
References: <20240920-spi-v1-0-97f220c2e10c@nxp.com>
 <20240920-spi-v1-1-97f220c2e10c@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-spi-v1-1-97f220c2e10c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_133317_224279_91BF4802 
X-CRM114-Status: UNSURE (   8.43  )
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


On Fri, 20 Sep 2024 16:54:06 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Introduce optional vcc-supply property, spi nor flash needs power supply
> to work properly. The power supply maybe software controlable per board
> design.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
