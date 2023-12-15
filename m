Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97ACC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2CUHMdFSEUILzzZBR6Ty8FYvr2SRJ+I+4EDahycjGI=; b=TyGB7NGl/8t/e1
	RsdjAyt/Lwnuivn+pHM7gQ9AmQh+vjbtr6+H+0l66FL7kCqJhIJtBmZEV9y6qkS4KXzcqzWgVYZQw
	+ViYgAsEtw/GlY/igxGLHhKQSuT6cgrgCFOzb42F0rX8nijKz4oZ5kpbIHFqLHBU5Q6x/LJi8AN47
	s9ly9ztjhAR1ibbiHE4A++AkAAdW2KNAnHKTfAs2jGVKdaV5uPH54BOnZ96MWTAxhX6uGb1u6q3WC
	jqUrZ7U8ArphqCIjwMkVWfTG6ULAdzYxwCzGg2Jg8yE+3RmDpk7sy6Jn0I0q1aKPOVDjn9UZCarKl
	e8WDOF8Bw/LImsNX/a7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5uY-002qFo-0q;
	Fri, 15 Dec 2023 10:59:18 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5uU-002qEv-34
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 10:59:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED4921C000C;
	Fri, 15 Dec 2023 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702637951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvXErZcOvzv1rQrp988oOy9Dg/wWWfRBE7QTFC3IKq8=;
	b=KaQwLUCPz2DPsY0QTQu0XtKICQp5M3Vl3S1dS7mrEBgXaZkFjB/LmUO8GjuMgXLcPvRkUE
	fKri4oPW9xTaJrjL/gbkSS9jUYbA0B+C5whZQ9gdHqjt7Fh9HG0b0pQ9TXPzKsC5izbxuQ
	pbzJ6yx8eN/bdnDRpJ1htGCkhOi8N3lRABUl/cAnHnQJWNBOrexhJrgrUMyzkDePEpTkFK
	lrTqSd05ixwTWisF8Jbyo7GclYkaO9azzfegSVsvBYpzBdtx8oxGlDxUDOkxQg9+vOD8Pw
	WP6sx6TLnhR+QgpddWjUTHps3eInfULAJOyOcRz7tL0AcMNPQCEN9aThGEavNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: ssfdc: Remove an unused variable
Date: Fri, 15 Dec 2023 11:59:10 +0100
Message-Id: <20231215105910.499159-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205075431.13401-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b511e8e05b32d028d8369af3e369c924f98323ec'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_025915_137118_3E402EA4 
X-CRM114-Status: UNSURE (   6.34  )
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

On Tue, 2023-12-05 at 07:54:31 UTC, Miquel Raynal wrote:
> Since its introduction the driver was declaring a "usecount" variable,
> but nobody ever used it upstream.
> 
> This was spot while grepping for usecount through mtd/ for other
> reasons.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
