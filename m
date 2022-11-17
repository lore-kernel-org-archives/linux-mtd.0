Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578C1C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvSAtpF/YtRuFSdGoB9l59C6PL1DB86zbWRkItTk7q4=; b=UExwy/J3sij/KZ
	IomggL+Lb+r18/ithx2WGWZdBvNcr4kXk335Fo+zv41Il6+JeDua8JL2+OD5IdTMVmTziWxS5oJLF
	4IVLlGdIrKcwOojxNO/1ZFzPezaPZSyEvGLiK1chGKz1hSTkd2w5bDBqSj5uSs1xcAu1NV8USxhbB
	fFIMpPiIycPLDTNYn0dyF8r2+y/noESkNwrUudOB//8wtxvpCSkiqkxBrCo7YUWBFvwW/5hupXt+H
	GPZw8CiiG8BhrZKg2lZ8lNtVcsqtK8P8P/b03MLrtm2K6oIt1hNxWVL5eLYU64eANjoJeHmiwEak7
	7mDpOmhz5GpYbR34eTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEW-00HYLj-HX; Thu, 17 Nov 2022 21:15:40 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmER-00HYF8-Mr
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4816C1BF204;
	Thu, 17 Nov 2022 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=maEcsFKRmFPFcaTystw6MDV6AJk7t42kSZ4Dzy8Hr48=;
	b=DAilUKy4AF1x1959BQFMuZ8OsBA8O/jPkf+JFucmC30wIDtv3z7dUxX7d4h0XFnxxPfQpy
	aacYoBYizL+i2KyQmS2uQBbNX+vv0UO+qJdzYtN7VwoW8YPLf8BUrpIXkWS/apESf95i3w
	FloGIVgMFKhJRFlH5Bhp/yB26QeY56G/qQHJjm1gNFNCO4Ww8/UroViSDIkGP7FfvNwsif
	Icaiaf8E+fWmFywCv8riDMotEeqxGUqnAkWYqHFtfvDxH9mnNrrTA3K9vCfLjzYJckz4tr
	FBEz+S4Er1xglGEHxHBcLJHvQwBrISkYR8zSzNDmqV3N2tdwxoD3NyRsYqgtyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 12/17] dt-bindings: mtd: partitions: Change qcom,smem-part partition type
Date: Thu, 17 Nov 2022 22:15:29 +0100
Message-Id: <20221117211529.1273348-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-13-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e141ee8234d02727b421058df56f5959b7dc0ed0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131535_935925_B7958D39 
X-CRM114-Status: UNSURE (   6.44  )
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

On Mon, 2022-11-14 at 09:03:10 UTC, Miquel Raynal wrote:
> As described in dd638202dfb6 ("dt-bindings: mtd: partitions: add additional
> example for qcom,smem-part"), the aim of documenting the subnodes was to be
> able to declare nvmem cells. Hence, the partition property does not
> really apply directly here, let's instead reference nvmem-cells.yaml
> first.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
