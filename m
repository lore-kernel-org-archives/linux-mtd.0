Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C6DC001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiYJ7IAiKBr4m6iPI985f6eZx8OTXpsTGeKc2gV52DU=; b=SYSTGiKIhhtOZU
	Q2/w5vwErbPpqD7lL/RnezBWge2zywreDIduqoJ1fJAbjhEcY90JHWi5ZBlRZdfdF4T75oALtAP5X
	n2ysiLqoQmL2zw2f4UB0Hh8sSJB8bkEsC/reBlw5bPs2YOyaZ/G0HJQHKInTtX58ndxNGS+8oSfvn
	RWXieDw/RJBoCKn1Ey8ZM3sbZP/sBz7A5D3c8cv0GdfbTbzUlref5qCWgcxatd5bpmat8qEpWoAsu
	BS2f68dnwqw04cDt0kmRUniGJ/Yk19RYH0Pn26FD626Wl/a7dswqFXTDMwcBk/JSfXdOSEEKstlmY
	wegMJ7t/zgRoAnIf4UZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDV-002JnI-1z;
	Thu, 13 Jul 2023 07:58:25 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDM-002JeM-2O
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E27E20002;
	Thu, 13 Jul 2023 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/j1cYBXUPPHHjAdNDFI/2LZU5KH9fYfzMh0905FV+0E=;
	b=Xua6698gxPHhfxpm8jBScSZC6VdSezcvi9oEr8ijucxiHbVRC6W67THwHNTmly1aF0uYcy
	cJ0pG7KdjZvWo3fOJ9/Mr0Ue4kXGDbuFYmD1BlRa9R07m5zIKBp9sk5Fbca/1T0MDPCU/b
	W3xf4PKXKpBgJFXeJ+ONb2hkOs8DVl+XSmEGlbrO5xnCjQKce55woT8sEULH6d4BgmABuf
	/LTO9OQJmjWOBt2URuGnNb0TRkMlKC7cqd9lU89PVemlD9iLa+2Hf9AakrBUuLd3q2XJK/
	zKby0uhDDgCsPM5n08XHliCLaTDvKZcHk4Bke9Ua3jczngJpa6OeieQZtPOCRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/18] mtd: rawnand: omap2: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:12 +0200
Message-Id: <20230713075812.486278-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-5-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'189175e0c3554434416e75d7687011ef6c185159'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005816_953761_337D6B83 
X-CRM114-Status: UNSURE (   5.72  )
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

On Fri, 2023-07-07 at 04:06:09 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
