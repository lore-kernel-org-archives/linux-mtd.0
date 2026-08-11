Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B83C5CFCF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhqgHc0kI7CzEcjbpEfQsj0Kz6kVjolRYtmD72wqy4E=; b=LLU3kUCIvFGKdV
	wePTnRO2rvFvxCCUN4BGB8GsEGheSExZfTon3uegASavdRjYRYoIE9wh2ssLWineMSKpRcWwP+qPr
	eDMsjpUw6WpsXE2hJsQ8ic2aLoBft5/6qBd7jGZJ/ECv5MlgBrbNDV8OjQMY0j0JbbjCm1G67hvUv
	IWwNX0EhTlDIs+8vmrKqz2DxnkpfdL4nm05T0LU/o3EkgzlEjOMuPk/T2PdzoQtF7cvZ7Zjz3Jp9+
	7IrEv6PKmUtYvBYgzGBrTsUPjrsPYZs2a2i7QjS2+2natmuXTBHUURQixFXz75Su1PvfOfOX+JkRz
	g+f6NaPctP7jkaS9A4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiBV-0000000Deiv-39Bp;
	Tue, 11 Aug 2026 08:50:09 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiBS-0000000Deid-15Mm
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 08:50:07 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AA1D4116;
	Tue, 11 Aug 2026 10:50:03 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 11 Aug 2026 10:50:03 +0200
Message-Id: <DKLZHP07AA40.X5MMIPHUZEVX@kernel.org>
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: scope the exclusive RWW lock
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <jianhao.xu@seu.edu.cn>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
 <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_015006_475148_B900351C 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi,

On Tue Aug 11, 2026 at 6:13 AM CEST, Runyu Xiao wrote:
> spi_nor_rww_start_exclusive() is used as the wait_event_killable()
> condition for RWW access. When RWW is busy, it can return false while
> still holding nor->lock, which blocks spi_nor_rww_end_exclusive() from
> clearing the RWW state.
>
> Use guard(mutex) here so nor->lock is released before the condition
> returns, while the state flags still hand off ownership to the caller.
> This keeps the mutex scope aligned with the other RWW start helpers.
>
> Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

There were questions in v1. Please answer them. Don't just ignore
them and just throw a new version of your patch at us. We put time
and effort into maintaining. See also [1].

-michael

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
