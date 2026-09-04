Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FB3C624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxQ7vJy1aMYHg05KrpPMCvyR2yptTPUNcZt34jhXdKE=; b=TQ2/MUqnFUZ8pj
	NjJpj22niqWv/BMiqjOBTrud5zFtIr9oWxYFSCaSxw8wNoNyV45TiPwQmvmnVoD2rF4G4SrKMvGLC
	l6iQce0DbpA7KvkGWDDoPcVEe7U3N/KuwV9xgJpt1ZIxhkTa8C3OpCxHZnAetF/eFX1zyu4ToAJ18
	jmDCj0K1DQmh2h+LNTI4cVPO1XzN8WE7DTii+dAoMSVM8SCEvHxAszX/dVVCghD21AjzD3h52DjCm
	TzfKPkTkwgnXrdq7ESWUcOSg56JVKTfBP+WuBkIrTD1WW90rCkwSvk4mhGdtoVIaIYbDOsb3mXRHk
	+ZKicL4VDR3umKAPsVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9r-00000002FwN-3OY6;
	Fri, 04 Sep 2026 13:40:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9o-00000002FtA-0d3r
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 13:40:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97A3660218;
	Fri,  4 Sep 2026 13:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7431F00A3F;
	Fri,  4 Sep 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529239;
	bh=W3ARUUquBVjLU+1vMyfZoZfrmendLIctkuhpFI/Kg7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jb6dn99SHoZzyXuXQRPUgv51JwOKuRj63FzJ9QsNmwpWPZW59VzrQe5sLB5nW1ynl
	 52dTvtZco7ZMyjnJU9qFvzPwEbNainZpIq1STMEungRbCRJhe+QBtsGPDtpu0HfmGs
	 EeH69FrOq2ZGihfizt8SO766Wow/ZPu6WODJQ+4vzdF9dFPQb+LHNRAXFtpNvrW195
	 /RrHRwq8zLHsh/UMdFzvHuRPjZM45Ul4+Uk//1BeTneS0yrzhI2epLmcUs/eundO91
	 d4rgJnOHGIbufQqzttFBt+0TOhlOMbhZhzByelI0+AIHUE2skIgikiE2s3Zd+E8j1s
	 L0sFuzThX/NMQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Takino <stayer.opt1f@icloud.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260811064512.42520-1-mwalle@kernel.org>
References: <20260811064512.42520-1-mwalle@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: xmc: add locking to XM25QH128A
Message-Id: <178852923736.3340372.17741813626485935143.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Tue, 11 Aug 2026 08:44:44 +0200, Michael Walle wrote:
> Add support for locking to the XM25QH128A part.

Applied, thanks!

[1/1] mtd: spi-nor: xmc: add locking to XM25QH128A
      commit: 3c2464c70284eb5443a18ea7ee2f815a06d91a5b

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
