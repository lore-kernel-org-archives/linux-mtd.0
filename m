Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE42C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qjXj/FYZjssS/m/n8hoN8voJSOCf3KLGWJIe2dF2Yk=; b=lcoSREtVcGmlMk
	m4I2YDmdDBFLwCMXIlLqbUMyxCOGUr5RPyyQgBL4pslR6hqPEcxbKTMLXFvdcaoSxWTSZcTbiY7GM
	U0znLEUcc0cNR+lzcNRMYbOVffMCxHUyByuEyB8wK7z1mvSZUWsR6TlkkS+L1XRUMYK2bnSDEmau6
	VaXV2KXUm53CLXJ9YtalVjJSGmN+N4UkDjGeWkUfoWlA6J3xUieN1wbqyg57iGiGZxxmGIbg5STkQ
	9TNKyRrhmMN/ljjKBasUwWdzHirh8Wc/21zYQAnA+17tg6RHS7bqDudfupRJYaG8QRrnAio+F3asv
	30sE40odlI4GJ3lBmhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kJ-00FlHI-2S;
	Thu, 27 Jul 2023 15:17:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kF-00FlAZ-2Y
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:17:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92A40FF806;
	Thu, 27 Jul 2023 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHbaHQtfSw85aARKWOfMOyJNz803y9RsTzGIH1lyXFk=;
	b=jXTAISrKKe3dhaln7MEYli7ghpFwp9K+yvsgPutbOyG2nK3AGrcdai6FGEkmEiFiF2CiPt
	ZmkYOSewHY/YTILZ8cAeD2f2L6k5aKJ3xQwtkcTtUH1C3Yg4tfYkP60EwCUvUM+2X8tZyF
	0mPl4XL7Ngn4Hg7pyeuGZJSjC1N3PNnV5SC8sM7XdQ0OTXLEXWZQUroZzpHiO7W8khG07n
	wOVg+Ys20sa3i21vRCv06W1eQZkzoWtvcOmV9KR+u3fGCWqytpMkKxJ1qhPfnZtugl/mzU
	4O0uetdzmI5JJi85Zf6Z4Tg47RpYPjMOacQWDiXql5OZENTcVMgdqVeN2VOKIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in fun_exec_op()
Date: Thu, 27 Jul 2023 17:17:31 +0200
Message-Id: <20230727151731.586307-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c6abce60338aa2080973cd95be0aedad528bb41f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081740_298658_BEE1F265 
X-CRM114-Status: UNSURE (   8.72  )
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

On Wed, 2023-07-19 at 21:55:01 UTC, Christophe JAILLET wrote:
> 'op-cs' is copied in 'fun->mchip_number' which is used to access the
> 'mchip_offsets' and the 'rnb_gpio' arrays.
> These arrays have NAND_MAX_CHIPS elements, so the index must be below this
> limit.
> 
> Fix the sanity check in order to avoid the NAND_MAX_CHIPS value. This
> would lead to out-of-bound accesses.
> 
> Fixes: 54309d657767 ("mtd: rawnand: fsl_upm: Implement exec_op()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
