Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E2D107BCEA
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 23:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+12pTZRW/qIjoiMVYw3IVKQAULe2bNR755qcRrisFc=; b=SrZEZ+rYXraZZY
	j8tulQwqHfvY2s61J/dbkMUFdE25kVfaHHeDHkL+bOk5EsrUw3KwUs/A9/seQbWmcYFlXxfTFRvh0
	6wCUSJp8DjDe/MGPDO6MF9pEYtOLtzynGbHoL5kFi3Yc+uQjb8wVF0umXBzdusVON4bauuQHRqEjh
	//AqvugOacUzCiOS1O/Ma5jB0HZagfBnmanO/XOyLX3/MtzYYzqDhkQ5M8Axr2+gOZLPnwqcSkVHo
	r1AyuQ6lPNvbMBHWqt5HcAZOIxrdwvseM0AZGdo8wTLxzzayUS9+vuFVUWsX8S99jV/LqZupqNz1x
	IZIfKr8Lq4BLRPOIX/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1C2K-00000001K1l-0t9P;
	Fri, 13 Mar 2026 23:35:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1C2I-00000001K1P-1lH8
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 23:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D12760008;
	Fri, 13 Mar 2026 23:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0F5C19421;
	Fri, 13 Mar 2026 23:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773444916;
	bh=/hRUwsYm4PqkFEYuYuH/bF8g5FukaPINPr1mQ2EpLd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iiYuf8OCjy3FA5DJfnpKJKsFGOSW+MsCTynuS9J5P8aWOhuiAnfulwJDxF2CJl6sd
	 FyiSMXVt+QIqvYUkuYsVqG+aZ2Gt7mIRcfwuscTsJCQqwsUw5Gh57HpDNM/YWGEwlG
	 56iIAd1u2HzJrriILyCmMvc/ecr4pXr/EF/ZJcy/CJmHHbNdDU1EAWIDqWS17Fm+93
	 wqLRbGqdSHJPwI6kshTemjqyQIM+syq9nOBjpuLP3cv4yd88DvHdb6WntDeFE8zYLT
	 kJE3TYEiw949dA8DT8WEVH7T5OglaVXELfyhLGNgCTc44eyvbgNCtEzMZFo9G96NKb
	 Yo8o0MoaUXCag==
Date: Fri, 13 Mar 2026 18:35:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: gpmi-nand: ref to
 nand-controller-legacy.yaml
Message-ID: <177344491470.3643846.3861418038445425892.robh@kernel.org>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
 <20260309200351.1791162-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309200351.1791162-2-Frank.Li@nxp.com>
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


On Mon, 09 Mar 2026 16:03:43 -0400, Frank Li wrote:
> Ref to nand-controller-legacy.yaml instead nand-controller.yaml to allow
> legacy DT layout.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - none
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
