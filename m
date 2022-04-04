Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFC1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc4mCJQdNv0N2FhiEma4/DonMYJAW94h/YS1r0Lsphw=; b=MsikDDBle1AUX6
	iuRA+DCn2fJwNdsoMNSUjIUMXe6TNhkdbwpZCPfoMoEtB4NCL8af9G+2D3bdOKTmS5JN3e40xD8sV
	46N7lA0ftgKKlHw4Tds/habDhm1hNF7HEptd8bYeBaDoNwNHW/je2XT84nydAuQYPZGX8jEq+of2W
	PTEkEIE1WDKfRAV99+ysEJRLyyCxS0C7CXVcA+oxZNgJvs66LMNnAagYTdjT91/fErRe5GzQy3qkM
	oR6Go7eEeAn/kU4J4rVnU8UimQ35jod2LNQXnqNkqGv2SAUzZHHcs5Icx4SIxonfoYsVSbVTVTlUV
	b+Zm988Fc8jJgj43ZaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIOZ-00DvtH-7m; Mon, 04 Apr 2022 08:49:07 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIMy-00Duo8-KM
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D7D2C0003;
 Mon,  4 Apr 2022 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CN1L5JMzqSJ+k18AcK0l2a4ZU5bLh8AcVNfN1XQQ0W4=;
 b=R2ej3LROgUy4NFcFjYBZBe2JlZHew4uPRHPCJlb2E68dnyM+RBSvtzwT9tPskEi98Tbibu
 vrft3h3fLHaYKyX+KGKE4CfjkrycZ+8JFJRPXLgPD60tHCWmd0TH3F+SAprzbCvuZgUlYl
 donTKVzKkGCKUP/GYI+h+FYB3zbbZXrqGplqfV3Xzk3VpSyLOyG7dQ92GefsWOp1xOQO6o
 KtzZibzzT6a+rWbnehPL3qtoSh8tu4/YVc7CJ6sN/fnMyYsejLp6fI1KI5UyVXZSpGucvO
 /QT3O9Yboc0UX6tx61vmLOc0UFWCU5pL5zjM4teo+ovuS0kIVQCpZZglzkKsgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 1/5] mtd: spinand: gigadevice: fix Quad IO for
 GD5F1GQ5UExxG
Date: Mon,  4 Apr 2022 10:47:25 +0200
Message-Id: <20220404084725.1203270-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220320100001.247905-2-gch981213@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a4f9dd55c5e1bb951db6f1dee20e62e0103f3438'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014728_842225_6A3C8537 
X-CRM114-Status: UNSURE (   5.68  )
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

On Sun, 2022-03-20 at 09:59:57 UTC, Chuanhong Guo wrote:
> Read From Cache Quad IO (EBH) uses 2 dummy bytes on this chip according
> to page 23 of the datasheet[0].
> 
> [0]: https://www.gigadevice.com/datasheet/gd5f1gq5xexxg/
> 
> Fixes: 469b99248985 ("mtd: spinand: gigadevice: Support GD5F1GQ5UExxG")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
