Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC82C4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJk/h+xvU51+zEqI/ZPhODn60jrWt8b5plLUbHVxbVE=; b=QFTtFhF828QNRh
	ClUDDhsMj+3ot0zZFqMym7JTniaPnmtqd7vQEN2rX3BErkySqFUtxuNFdZ0c3CABVBExeFLW0Jh1l
	4BkP8uUVMiuAWXvgtaef66dxeT2CYOiWRd0J/nXiPmKrgDekww3P38/Pb+9va4auABDduDMrBXd6j
	5ccQNYMFTrD46h6qTfKCI/cs0o1KI5yBTAsxQx1QFv565swSMOGYAR/TagiEMln6QvKOtnk0XdrOv
	RNh6YP07x+vvRZxxoFKqp7hXqlutDyUwHFh8/faHfMvoZNqy8shVi4qAHYQfLAbfF1R1ug0jepVSl
	dErCxUMxwJpDF4Cw99/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqd-005i0o-3D;
	Fri, 22 Dec 2023 11:37:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqY-005hue-39
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 11:37:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7175CC0004;
	Fri, 22 Dec 2023 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703245055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fb0u/bXGwPiKuXrPW+QNxIq15/gSrDeXu28or0EZgU8=;
	b=JHq6XV8jvL4omyconfG2XKfpVjjNjWihSu3ZxdAsZbeM79/uBZRqYV9zqDyzcZE0NXflIN
	WhY9lUA6eohjpJlIP1NyUWv3g5iWBzKqFSihUw8xdPRqPAm55nLqkPIVTS+eRExyOFRINz
	1rpl4N9UVjM3DMZVg/y/plXGl92QuiRaBgA59Joolu7FpGfQlOthxga0fzcfuvMW+Jm892
	HtbzYQ6kEC1rC8/oZzhUwvihXc97w8SZhQWgA+/2DRO4wMtRT7JhVqlaNupDDeLPkOdg7b
	Ly2Lipoh5cjoWd5uYNdEJds1ZBd/5vVQLWL2HvK++k5cymDjUrILtGr5eMhokQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: rawnand: Clarify conditions to enable continuous reads
Date: Fri, 22 Dec 2023 12:37:30 +0100
Message-Id: <20231222113730.786693-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9ce693232813db39ac0e4badbe8dfec09e7e4ac2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_033743_170254_11D20E14 
X-CRM114-Status: GOOD (  10.65  )
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

On Fri, 2023-12-15 at 12:32:08 UTC, Miquel Raynal wrote:
> The current logic is probably fine but is a bit convoluted. Plus, we
> don't want partial pages to be part of the sequential operation just in
> case the core would optimize the page read with a subpage read (which
> would break the sequence). This may happen on the first and last page
> only, so if the start offset or the end offset is not aligned with a
> page boundary, better avoid them to prevent any risk.
> 
> Cc: stable@vger.kernel.org
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
