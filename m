Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56DBCCA47E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 06:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igTCWNuuHuo5hXhqONqWXig0Yx/6QWWFnoqxGUKANUI=; b=EfCD5EaaK5b1Zb
	zF1xMm7ZFTr+XOF3V6r1S666ej35pFzcfryFJVHQCfrDrKi5LzDw6cjP7GVeYwSSaj6HHpBDSeT41
	Kbq7Wo8+igBjNyAtjkQHIfUinqYsyN6Fn6MuP+9B4+b862DZJxDwRHfvgWjMAldXvJwb5szYsVhAf
	+5IjThwLTqnh5QxAg0tPm/1E5f10XwPQnLV7KOr/0ioS0JWOqVW7RL0QTrNF/MMbbwueXiX+f0fq2
	77/8Gwlc6fudjKuqImkg2ohVioi+arr0RbdchWNSD/SWwdkRU05bwUD2seXnSP21sm27cPYy+jXS7
	No13TTa81c1c0lZoLMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25Vz-005jSW-CS; Fri, 17 Jun 2022 06:31:31 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25Vw-005jRW-F2
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 06:31:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2436D1BF203;
	Fri, 17 Jun 2022 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655447487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQ0wrFYdrXuojklvNl1658c5ZfBL7raN6sTUE6g4Wvo=;
	b=jM5HRtQcblG3I+IejYt28V8RRQQQkuVicdg2nSebNL1ramoLUFWoIpllPtjAgLfQo9hfCP
	PIq6hRZO9NJWNgehYoPv1q8zzaVNto01sRnVdxNjz4tD0EVQ38kO7ZDllcddDTiB2svRwi
	eVe8820gGhTQBskyxpND4O/WlSlRC6bxRa2PBApgfCEJVo83a9qvERbCIIAdD5urKmAhDt
	h4trIsPqxFCgKrNkdMl32F7GtFyMTqIhnJnOQKRjm27/wpPoTm3q5C79kYh906Yl2u+4Sw
	NFFUTEP5euG8A5UvFoms/dMwgtgQ+HSnzHZEnES2GmdPpvgteDiGwdCb4piEIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding
Date: Fri, 17 Jun 2022 08:31:24 +0200
Message-Id: <20220617063124.446689-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616001835.24393-4-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5278cc93a97f7b7b9e69632e52503e956153d944'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_233128_675348_FF88FC18 
X-CRM114-Status: UNSURE (   6.35  )
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

On Thu, 2022-06-16 at 00:18:35 UTC, Christian Marangi wrote:
> Document new qcom,boot-partition binding used to apply special
> read/write layout to boot partitions.
> 
> QCOM apply a special layout where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
