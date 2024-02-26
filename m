Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D13C54E51
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BS1m8yabIlp3hI/nhKphO45N+WgYKbkai9dNoIDAE+M=; b=g7mexTzKWH/DN0
	/0GxPiwmhg7s+p2x6XAelw4i8M+BDBrdiGuvRmRmGxhzZpB3IPOrTvfHj3ITkx4dzCNVWA0sgmg8k
	PMO7rdSmUwIs2FvlO7yTMDDjVqNa/mMEBk/zyMaskWN5GzHjY4UzRz1qFIOHCVrRxl5qMKR8veydF
	vdh9OkXmM3d2FqWyrxByS6FaGw7gI+WjzqVSKy/zOlrVK+fjAkr/9hNeNwRwm9t5+uIYY91ION4a7
	omNY8vVN3hk1Afud4pSdvgzlH/MqHkQn9jJCUudHtN7py19UuIbL/BdsKGRefA/tTpN0AzKU847QT
	KMv9ElilGjqAFU3y1jEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZfY-00000000Sei-2s1t;
	Mon, 26 Feb 2024 12:01:16 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTc-000000009Ix-1BrP
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:44:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54FB320008;
	Mon, 26 Feb 2024 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zzSFIT7MUTdqhAgfVj+8pV00eLEvvOdPb3HM2pVYF0=;
	b=jiEJxhHbIty5WaTnlEx2gU2oW7J9sbnyrVqZcZXWQiZMqWd0xrHpjn38KGXf84/c2NC03C
	NkrlSL1/WQkdZTqo/OE9ECtcnrEgYFS4+FQ/rK6GUnnPqcdL9M/8PdDpTCMzPJNCuF8pdr
	VKmjscmbd1q/8bAwtYceFSHlVRsfWCGsSSP3RvozfjDe+oYAze163MrhhvZr7kUwBXuwLC
	mu/w65iJRuqLO0QrUn+2R8XtbyEfW8yZs+beKMfDaZGLdD/zt0rXb/wV4xaEtbEGTJ8ox4
	8RcSxsQ1aT7hxttUiUyFm5cEsYdEVH6sdk++RFtKQt6zBpLbnnjwUeqHzy6+Iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: st,stm32: add MP25 support
Date: Mon, 26 Feb 2024 11:44:48 +0100
Message-Id: <20240226104448.489969-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219140505.85794-2-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c1e04ab409aa0df2f554d7b318d82e8730ac4fa6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024452_823927_4F26CDAF 
X-CRM114-Status: UNSURE (   6.25  )
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

On Mon, 2024-02-19 at 14:05:03 UTC, Christophe Kerello wrote:
> Add a compatible string to support MP25 SoC.
> 
> FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
> available when on MP25 SoC, the 4 chip select are available.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
