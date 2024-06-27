Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CF4C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdN1aMSBFtkgsHuQ9FTrnTeIDTjCM0Xz+tTNdpxHSO8=; b=lqvIhuZZ0zZYr4
	HIl+I+Cat7shEKq7aPmQKTg2oNVmCD47Xl6+Xhr1FCN7Y91rsYBaskBFFRXehg2FSm119CvNGJYNA
	PFakz/hb1lpZJvjAFNgFlpRvY7c4b3gxks4DHiYEDVLU5leJQRgfgxF0orJu6UsxU6gttBiKPrV1C
	VwwMFuihk69a95bvkgPxKEdUjVymDLamrS8A9rNhF4I5KIlzXWSOkBotNIdLon9Eh6tL41E/3abvv
	DocCvwOcNB/oQ55kkRPWL9ptQwnuW0rXHf/pcA+i/vw8tw7wiRVbv2LUZxQRX1N7qy2h0OuGHeJDQ
	ptvFfNeP5uc/DskxczGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMioH-00000009PfR-1B2x;
	Thu, 27 Jun 2024 06:40:45 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMioE-00000009Peb-0SOD;
	Thu, 27 Jun 2024 06:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4E9CM/5/mBeIexGZwjxuNqelU9W/5r9P19OkUaKlST4=;
	b=dfzvGqDhDzW8CIUfGN8u6wD8w3rvXo2pAA6zlf+rQX4lPDA5QpbZ/I6YFCAH/R
	AtSNZnRznbzJIxQX9GYN1yCEM9d2DlnR33U0XRfkg1QxcmeuHPWSm5pAfp63ZeJY
	YZZj9WZvf9XhghQZl3e5rxftZCaCaIcC0bxl20ZTq6rCI=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXP5t6Bn1m600aAA--.26605S3;
	Thu, 27 Jun 2024 14:28:12 +0800 (CST)
Date: Thu, 27 Jun 2024 14:28:06 +0800
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
Subject: Re: [PATCH v2 5/6] arm64: dts: imx8-ss-conn: add gpmi nand node
Message-ID: <Zn0GdvvigLqcGXxn@dragon>
References: <20240520-gpmi_nand-v2-0-e3017e4c9da5@nxp.com>
 <20240520-gpmi_nand-v2-5-e3017e4c9da5@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520-gpmi_nand-v2-5-e3017e4c9da5@nxp.com>
X-CM-TRANSID: Ms8vCgDXP5t6Bn1m600aAA--.26605S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaK0PUUUUU
X-Originating-IP: [114.218.218.47]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBILZWZqryB7ewABs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_234042_603895_8A68B5C1 
X-CRM114-Status: UNSURE (   5.50  )
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

On Mon, May 20, 2024 at 12:09:16PM -0400, Frank Li wrote:
> Add gpmi nand support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
