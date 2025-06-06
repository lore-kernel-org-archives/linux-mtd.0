Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11236C5AE59
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jun 2025 00:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6r9nP5k7PwqkoWHfR7yFwgjVKKj0hqy+x0qAsD1vFw=; b=TThDN0KxjWOT8z
	LjGN+aT2WaLtwl3QESsLxjVxwLQwNbHtFHgJjFCFOKEghc1bWFBdgeXjN5/x+baA2l0qT1fnGxqIT
	bZABMdzHpnzie/PSUIVaBa8CB7FusfUJDXr3+GhvL7czu/AUYz9VGNtqjkQj0+D/iAcHEMT82xCPD
	49cI5FzPoEt0QX2/WF8+YJGlnBk5lEL6nCfBCXnZRnkd0eQhzoyZ9rKR2NVxsRKNpm789oB9LXJZE
	byp6wA+/KZpI7BRF45jyVvO1L2/AEpg9FBJ9Gh/XYnyWhawi5iWRoKCrzw7wYnheP5bTVnxMq5Px/
	2Cutpo5kNN1XL3XBVBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKYo-0000000Gowf-3b4I;
	Fri, 06 Jun 2025 00:03:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKYm-0000000GowM-3JKO
	for linux-mtd@lists.infradead.org;
	Fri, 06 Jun 2025 00:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3891A4F42B;
	Fri,  6 Jun 2025 00:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525E0C4CEE7;
	Fri,  6 Jun 2025 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168227;
	bh=2qZMMiFf7K4xfAYvwTGOLOc43Kcp/dm/Gr/nmIu6Xd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H71qVmG9ry/kkta1Y+tIyI34e1s2DgTXHVCOUsI6KS1khfFYP7IPt7ph4kLvIrr7o
	 jvSyg3wQkw7gxErwDehufw7rJtUY155V530oQq6Zcvh3MnPhiDiJhcCsdpFpY04dso
	 cuOPN5TJSH90yfUXYd58+BE2CBYqiPxZZCzZ4CeyF/TVwolISzeOgwY0vUS2toXqT9
	 H7HCxYhdZgBXln7SLMW1aGHiDj0WThwD2QcvoZAj6AQqRa6q70GdPNWMBn8Vrv2ct7
	 97qk0TpZojx+Ydv+3+sGiSeQKmW6rdJu+XUgaPtjyoF3Mkey15RTLlR/mI3yWrxUUK
	 7zZcuGuIogaiA==
Date: Thu, 5 Jun 2025 19:03:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert nxp-spifi.txt to yaml
 format
Message-ID: <174916822312.3511589.589270741515200366.robh@kernel.org>
References: <20250602140946.941159-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602140946.941159-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_170348_895955_22D2D58D 
X-CRM114-Status: UNSURE (   9.85  )
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


On Mon, 02 Jun 2025 10:09:45 -0400, Frank Li wrote:
> Convert nxp-spifi.txt to yaml format.
> 
> Additional changes:
> - ref /schemas/spi/spi-controller.yaml.
> - remove label in example.
> - change node name to spi in example.
> - remove child node in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/mtd/nxp,lpc1773-spifi.yaml       | 74 +++++++++++++++++++
>  .../devicetree/bindings/mtd/nxp-spifi.txt     | 58 ---------------
>  2 files changed, 74 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc1773-spifi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/nxp-spifi.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
