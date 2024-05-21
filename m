Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366C5C25B74
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MezR6faZ8tzs7LUWF8nQINVO9JBV3C2ag3RjSHgEIII=; b=gJoP8tjAV7TLNc
	AGUew/xRJJXphMmbBQngx3qY7xEQnnm4m2KulxuoGepcQih6N7crOIe3qCN8OKT4jeNlxS8blHLbX
	t2ZiKkOYG1P+kodDfVzKQSFEp1GjGM78CfZvhLsEx16DP90ierdMxNHpWgjEGntUz4+0VR7AcaDhC
	YgX26p4gBNZWY3M0tNTQGFWQLhaRYJFa4LEGSHx1lg9Lgvo0xl206az9e4x3UzABiY5IdI89zmTFJ
	nQZXgmeImaztBNu0ecPCtCRSWfCvMGUyJU6oGrj72KDbcJg3i/VikLt+jufQc9U9ruQQT59wYIKKC
	S5GGdBwZbSNZ6JxWUZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Pz3-0000000049S-2LWu;
	Tue, 21 May 2024 13:56:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Pyy-00000000481-0eKh;
	Tue, 21 May 2024 13:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D927E62237;
	Tue, 21 May 2024 13:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6548EC32789;
	Tue, 21 May 2024 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716299805;
	bh=FFuwVn68atOvznkRM8++lCl3i72ug2UrS29cE+2NwmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvvTKk9+EXJ6Xym4d/wioGZbveQE+jqiYi6+83BgzvRAjrOlEjy/8VTvg99BZzXcG
	 vLQWDrOA/TtYCKwFv+Xr/usXS4A0QVbTWd3YWmitKlk24PevlGNNfvrTWR+xuvDmfz
	 2foYtUKL5FTB6kEixCRk7dNSxfYOhK9R8pnWIPMSc3I3uBjDm6puCvAEmSyrPjlrup
	 Ik2jQ5jJ5BokirZLbo8tmDhggE+vD1H5QTT8Ymb0s7LMjLugOdekAvzvA20/YLOnkW
	 AG35d0weG/j63kX6zuARghq6AJPO5EkE+cjmvdX6VEFSVYnsz6iU58QkuO5VaSTtz4
	 yg4jYzjqV83Cw==
Date: Tue, 21 May 2024 08:56:44 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
	Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mtd: gpmi-nand: Add
 'fsl,imx8qxp-gpmi-nand' compatible string
Message-ID: <20240521135644.GA3953973-robh@kernel.org>
References: <20240520-gpmi_nand-v2-0-e3017e4c9da5@nxp.com>
 <20240520-gpmi_nand-v2-1-e3017e4c9da5@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520-gpmi_nand-v2-1-e3017e4c9da5@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_065648_268888_3A2C1F97 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, May 20, 2024 at 12:09:12PM -0400, Frank Li wrote:
> Add 'fsl,imx8qxp-gpmi-nand' compatible string and clock-names restriction.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.yaml         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
