Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC064C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 06:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7shpRxgbJ/JExCSFSDNpm9WtklSKHwgav9QtkXtP+yI=; b=ubTVGx5uYe3mde
	OQhdZN5XWT8pf/k7ad46jWmLMwkthAoaUIogilBguR5/96smfwJEo7k8nztxMz7l1q/K+xDIIYB4i
	AJh6qWbS4QwLl3aZ8qJ4JKH6yYkOiGRBQO7nS1WwGsFdbHLw94ep0WqYjuBmcWlNNW4VsoQd84N0C
	N7dxB5zlb5iS7W/pcj2rcgz1+v/oIRpvMeP00YxP2EhOYxf4LNICiomJYZtzZ9QOSE+A0xNLehIWl
	U8ZFMfXbieNYCTphlAmjoOf/JfuPkIeOFmjMfmAEgKZEvjIjXfEoxBIwyN2BtTSujJtEJIeRyTJpD
	yIIQhGd1LuKAQfIj0zNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMioP-00000009Ph8-1OeI;
	Thu, 27 Jun 2024 06:40:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMioE-00000009Peg-44Pp;
	Thu, 27 Jun 2024 06:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4JVbwBMrJBsF2RiES/eofL7TJIZJsypozKg6acb8498=;
	b=GYRR4FqzDkNp1v7oDKqNrfn9aTuYTBcS9pYvjMeIJk0GfmCpOvdr9diNXmUFDF
	tJS8yBHis8oy2IxK4vyninFJi+/AAlhZ4jJvsiDlc9840Rlmwl9VrAr6IFENjVEE
	iM5l9zBkUZJ9GJ+RB1iq8DZjfvoWQQxAPZm+3JpxUx3gw=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3vx6aBn1m1VYZAA--.51586S3;
	Thu, 27 Jun 2024 14:28:44 +0800 (CST)
Date: Thu, 27 Jun 2024 14:28:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
	Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/6] arm64: dts: imx8dxl-ss-conn: add gpmi nand
Message-ID: <Zn0GmUVgk1Plj5mA@dragon>
References: <20240520-gpmi_nand-v2-0-e3017e4c9da5@nxp.com>
 <20240520-gpmi_nand-v2-6-e3017e4c9da5@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520-gpmi_nand-v2-6-e3017e4c9da5@nxp.com>
X-CM-TRANSID: M88vCgD3vx6aBn1m1VYZAA--.51586S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVaZXUUUUU
X-Originating-IP: [114.218.218.47]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRwLZWZv-cwmbAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_234043_351534_D4E59B17 
X-CRM114-Status: UNSURE (   5.94  )
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

On Mon, May 20, 2024 at 12:09:17PM -0400, Frank Li wrote:
> Update gpmi nand and dma_apbh interrupt number for imx8dxl.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
