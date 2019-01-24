Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6B4C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBDD218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JF9PiwdK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBDD218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mbABRa4EhN3PjvptxgxgD7StkUMSSlWbomIYn2HmFXo=; b=JF9PiwdKTAFaY1POnWgt2wTDt
	ao54oITPW0UzCXg1aEIxwqCkxkdPREtY7l22DD75bo8KUlnhg6txstJebhBTNjp7v70PnzWZVejLO
	c/TuFIxZGNkVii5DqrjI6ivIqYJRk7Ky5hHSvsB4G0gDFnKNr816NBdSaHY+kbITg4UyrsDG8231g
	h38jPlz8mVTPOfUR6lDqnE1ROfLRH9dw0uhS/xE8WUK4IXXRsy11+of7Rsxat4Sm1C+3vlR22p1k8
	sxzhHAkW/kCE0FkH+98TDd9wZ2IoDEsKPiE2N0eRnV4+jNVSsCP/JpRCKUSW8cIWBLVXC4ZTibRm8
	oJybXCsIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmgvL-0001Sj-Dl; Thu, 24 Jan 2019 15:28:11 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmgt6-0007Lg-DO
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:27:02 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 52FEFA1A38;
 Thu, 24 Jan 2019 16:25:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id xdx0M_fB5as8; Thu, 24 Jan 2019 16:25:48 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does not
 reset the cache
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20190124142007.11607-1-bbrezillon@kernel.org>
From: Stefan Roese <sr@denx.de>
Message-ID: <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
Date: Thu, 24 Jan 2019 16:25:45 +0100
MIME-Version: 1.0
In-Reply-To: <20190124142007.11607-1-bbrezillon@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_072553_472882_B50DCE48 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.01.19 15:20, Boris Brezillon wrote:
> Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
> the cache content to 0xFF (depends on vendor implementation), so we
> must fill the page cache entirely even if we only want to program the
> data portion of the page, otherwise we might corrupt the BBM or user
> data previously programmed in OOB area.
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Reported-by: Stefan Roese <sr@denx.de>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>

Works fine (limited testing only yet), so:

Tested-by: Stefan Roese <sr@denx.de>
Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
