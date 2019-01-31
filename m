Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64C7C282D9
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 11:32:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DB9218AF
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 11:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tbVdq+lR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="swMG2U+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DB9218AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=xf10AVrlxOWg3bnsE6zPxqQ69PQ5X6oKOPpd91QU2/8=; b=tbV
	dq+lRQuc0GfxbOhWkC5woK78CM3L3KHn7NJ16kyBbQVclYJbOAxX7m6tXRlxhrPfcpkvWwz0mYfQI
	PaQiv4m2iM31kpingQm4awxmo849WS0NNE6NMS+qhAvI6S6wXrX/9OYp8kIFLKrAmICLdmnvQat1E
	hpDFrcHvB214sItgVi6INvvZN2A4JcWQWh6d0Pb4MaCC9rIVsJWqcPt/ezfb1mVtyIeB5QHt1OOP3
	1ZlPdMfyLlo5C3bzjk/GDvdhQFzRjIKdSHyB3Nw1dTSlpjZVSqtAp/+YfvbOz9iQvLqgCRIRaAia4
	8TMaU6iPCwfIEzs4y2ChWn465OML90w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpAZb-0004zf-IK; Thu, 31 Jan 2019 11:31:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpAZY-0004zG-Tb
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 11:31:58 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E921218AF;
 Thu, 31 Jan 2019 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548934316;
 bh=CFNbtJd+HTIcAODO15KHtEXEDRLG5gvGDaSJGKxRtQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=swMG2U+eYiKpOIJ5IIzZfqxj/JckfF3BCKo3CE9zmVtrVxh2t8AaO/dO3vTbcCrdU
 zN1Kk5gkojHtnjlW2yKPrLLbG8rY1k1KwYa2IuSr4CvgjO6j0pPdLTu+ic42C1ku/7
 gsWkjLTCKbMX5x4U9w78aPqg7FuUvFLcurpn1zWg=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: mtd: nand: fix kernel-doc warnings
Date: Thu, 31 Jan 2019 12:31:47 +0100
Message-Id: <20190131113147.18826-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b79bbbfec3a0b70f7f5c460ba58458baa499332e
In-Reply-To: <21d5edd7-1335-2731-6d53-5b15d053462c@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_033156_973847_85AEACCA 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2019-01-28 at 02:21:42 UTC, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kernel-doc warnings in drivers/mtd/nand/raw:
> 
> ../drivers/mtd/nand/raw/nand_base.c:420: warning: Function parameter or member 'chip' not described in 'nand_fill_oob'
> ../drivers/mtd/nand/raw/nand_bbt.c:173: warning: Function parameter or member 'this' not described in 'read_bbt'
> ../drivers/mtd/nand/raw/nand_bbt.c:173: warning: Excess function parameter 'chip' description in 'read_bbt'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-mtd@lists.infradead.org

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
