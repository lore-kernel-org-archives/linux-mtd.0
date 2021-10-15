Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95387C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 11:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5825860C41
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 11:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5825860C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41mt78mYZnMcggXBwN05HRP//d7ghwwEJbybvkGCO78=; b=K22JelOigXl0pK
	9oPinl9vhu/Sb7W28R4tdSIEGm2NfJI/GBmEi4zjU9/IoiHEviPQMaLYYjgVJt/KSqjzmimz/I60P
	P1sW7Ykm+nmEWy1jcVUJp5ADyxb4nvaZzTnNCQaHUxZNvDPW8fnUNE/xRole2MIqY+yDqfAvL1bzA
	dzQOZeYfeK8nmLN+HFiSFoQejFae5ZsxUg46xg8TTdmkFovakhVYaVw8ODsvKlkcup51WhWIBDyub
	S1uX/aWRjArfWwjNe/eI2h+QZ+5cgGeVNwgPr6nEYj/ruc7r1ot3VeJ9i4v/vDJhWMylVZD2F2YCK
	LfIzjtJ7tAyBGmvlRA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLCR-006fUS-QB; Fri, 15 Oct 2021 11:16:31 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKWa-006VCZ-KL; Fri, 15 Oct 2021 10:33:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F2A7EC0012;
 Fri, 15 Oct 2021 10:33:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 2/8] mtd: rawnand: Let callers use the bare Hamming helpers
Date: Fri, 15 Oct 2021 12:33:13 +0200
Message-Id: <20211015103313.950354-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd8467112d645ec56760c78928e1e5a3f6faa9b74'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033316_885991_5DCD487A 
X-CRM114-Status: GOOD (  20.78  )
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

On Tue, 2021-09-28 at 22:15:01 UTC, Miquel Raynal wrote:
> Before the introduction of the ECC framework infrastructure, many
> drivers used the ->calculate/correct() Hamming helpers directly. The
> point of this framework was to avoid this kind of hackish calls and use a
> proper and generic API but it is true that in certain cases, drivers
> still need to use these helpers in order to do ECC computations on
> behalf of their limited hardware.
> 
> Right after the introduction of the ECC engine core introduction, it was
> spotted that it was not possible to use the shiny rawnand software ECC
> helpers so easily because an ECC engine object should have been
> allocated and initialized first. While this works well in most cases,
> for these drivers just leveraging the power of a single helper in
> conjunction with some pretty old and limited hardware, it did not fit.
> 
> The idea back then was to declare intermediate helpers which would make
> use of the exported software ECC engine bare functions while keeping the
> rawnand layer compatibility. As there was already functions with the
> rawnand_sw_hamming_ prefix it was decided to declare new local helpers
> for this purpose in each driver needing one.
> 
> Besides being far from optimal, this design choice was blamed by Linus
> when he pulled the "fixes" pull request [1] so that is why now it is
> time to clean this mess up.
> 
> Enhancing the implementation of the rawnand_ecc_sw_* helpers to support
> both cases, when the ECC object is instantiated and when it is not is a
> quite elegant way to solve this situation. This way, we can still use
> the existing and exported rawnand helpers while avoiding the need for
> each driver to declare its own helper.
> 
> Following this change, most of the fixes sent in [2] can now be safely
> reverted. Only the fsmc fix will need to be kept because there is
> actually something specific to the driver to do in its ->correct()
> helper.
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-mtd/20210413161840.345208-1-miquel.raynal@bootlin.com/
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
