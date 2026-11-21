Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDD606A320
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLjJ8zzh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxv4eaCp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3lUTo+pX7MTegfXbWm3ufi8Y/URac/tZS7ymxjrLjv4=; b=dLjJ8zzhidDcnsFZfKU84a5XhA
	LHEeMArLIi+xAeDefHTS/XzRE7efOlUOJpVov+Sii3aR4Zqo2S8J2Qnc1PoRnJcyKgbPwcHvKeH8e
	bmcahJZZcSSksv6PsMTPjfkkOkvrvFY+Xg0VX/rHwgZalMGNOQVH/AsjxH3lJNRyjZvUtkZm5rYhB
	gFwkv/sBnbGe77nn9jhkOyL4gG3VIWklMteM/DkwLQn+qmXcMgka710dcLfTkESJGkbmcuThRB/45
	Wfz4+simNAKToniMCzg8HZv3oKaCz0o5zqIbFb4BzsTVJh5l5KVn/bt4f1m0R9ka8cujyio0lI4vy
	iyN/qxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUh4r-0000000GyuT-2zcX;
	Sat, 21 Nov 2026 09:08:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUh4q-0000000Gyu9-11xU;
	Sat, 21 Nov 2026 09:08:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 067F24057C;
	Sat, 21 Nov 2026 09:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B563B1F000C0;
	Sat, 21 Nov 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252087;
	bh=v/KSonE9ptOXxsuc9pp4torUv+e/nHP0QcHgDnUNcJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cxv4eaCpbXRq6+v7J1sHTC/XE2qAAtLQj83KoTTDZefr9jTQzjqRiqZh4HC71E79v
	 Vlt8Av7KJ7IrypkZtZ1Cn9eiJuRAAf6TGWckhX742luMP83OZydl05emuuerW4iGFi
	 bFOSua99qcr/sduVAr5VNWinteptSmxaZPzwlnyor2FHbFTbclSF0DHjxJ9g11cBGV
	 8YBV7YlXxwhF0fR8e6yXSTtoxEUtc/ysgrmo8r7TaXZq+/r3cToH+fHVRKC523F5Y2
	 YRDhDq614icNC0D1dMZrkIXCdTNckyawppSsihWKW3aNBEgG5dMD9FE/rzxkoB1lhv
	 WIf3Bn9VA77Aw==
Date: Sat, 21 Nov 2026 10:08:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
Message-ID: <20261121-active-pudu-of-flowers-ddfa8b@quoll>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
 <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 06:10:46PM -0700, James Hilliard wrote:
> Normal NAND reads and writes worked on H616. Fault injection exposed a
> failure when recovering from an aborted internal DMA transfer: the
> controller's soft reset could leave the first subsequent read displaced,
> sometimes without an ECC error. This was not observed during ordinary
> I/O.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
