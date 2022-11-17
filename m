Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7949EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxJ7e/tJOqegs1WlOgdXYztv0TZ648haqxY7sg5SUac=; b=EujU+CGd7WIMtJ
	cVQvgClDecrWgu2Q1bOdb+Vbd1sp392bZjGNkUWTN4HGA8MpRVXGP2aeRxqkIAfIuoFEaM7IIXIxX
	68zufQ3fq6A4VXOMCuMYnKLpz7WO87fYfTFvZUoVf1BsqHntAfVtIVp234Bge4/Q9v0NywMBDk3lm
	CNTCctYL2otAhoPKiVlaWpZcFijxs8JKFXq7iXfsoSaMuqxXy8WBxpXF/Frt21S9dJi160AWQN+JJ
	bw1PjKyRD3eytrwbv5QNk9CWuHKfms2sNjiL8P04aXE7mq1JJkBrb/GKsp0bmFXqRp3QRySXl2nuQ
	zQ91TpG/5VZ9g9FQCzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEH-00HY8q-G6; Thu, 17 Nov 2022 21:15:25 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEA-00HY0i-UW
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D1ADEE0002;
	Thu, 17 Nov 2022 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xBkXIKIMyDWQcQhLVWjJ2bPthrT+KFCqcoSR8vK1Zq0=;
	b=H9isc2GXcTZ9EdPAhGhCDAl39/pNoyExXN8n6naoCsm/Y6CExKHG9vwDlJhl/1qwk4v4T5
	8bFTsLcmwc3MXJZ9tQylNH4GwGGexG4Kq+GlJGkXekA1+0Myf4jdg41c5ExJCj1W0LIEOh
	WaguRgFznaJA1xgSgZbJDUjVSHtfjTBY0+VIef4WLr6Ue6sXf1cL7VZlfgnf6PsdN9jZkx
	HksRHjXZIQrDuIXAZq7N2A0BWMdJQm+AGcHj0epByOi2E3guuBQzg1WGU4D9iFhYIrVMU5
	hsQPIHZnESRmOIfF3dFycgH8TJSn9VtZQ2IKmRvud+mo4JAiw/kXhG1TqxPNsg==
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
Subject: Re: [PATCH v3 15/17] dt-bindings: mtd: Argue in favor of keeping additionalProperties set to true
Date: Thu, 17 Nov 2022 22:15:11 +0100
Message-Id: <20221117211511.1273260-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-16-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd85cebfbc6f97b38a23527649758521a04b577e1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131519_194143_72779C5B 
X-CRM114-Status: UNSURE (   7.14  )
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

On Mon, 2022-11-14 at 09:03:13 UTC, Miquel Raynal wrote:
> In most cases we try to avoid it but in some cases this is
> needed. Clarify why by adding a small comment.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
