Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD92C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDX38x1c+6VT7B3xOR00oj9KAq352XM9nFcxwYqciL0=; b=iaGfNeitpjuxW+
	J6Gp/Hbug+pj1JftaJimdxGMgdWQpfvRIyeqw8gK6qO9lkODeBmhhClzylUgP9eizIvp8KwZEI+Su
	DVz+CtFrqLsSrn+z/9RPptg2hdvTv5n67nEtyezGjvMJ2YnqWk4xQvDeVr5qy+6TyB/CLToFZTBBQ
	x8o2QIiwCVycgYfyhE4m/dGrVWPBfrEbwgWVFVbjE+hWuCZHPN3hHvP15j04xeB1F6ar9accA2rJc
	0D5M8umxTKy4hMsPVLD8Owb1dFsscrwFkvSlxgDw7zIMZIrWQhCjyIlBnroPUyZAZ+Z9TA7G4hy5L
	4Ve46GsnpcfOndSh10mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeqs-0016Fk-1i; Sun, 23 Jan 2022 15:32:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBeqJ-0015zw-QR
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:31:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5981FF802;
 Sun, 23 Jan 2022 15:31:42 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:31:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix missing put_device in
 ingenic_ecc_get
Message-ID: <20220123163140.557a251b@xps13>
In-Reply-To: <20220123152332.529757-1-miquel.raynal@bootlin.com>
References: <20211230072751.21622-1-linmq006@gmail.com>
 <20220123152332.529757-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073148_061391_FB2C1987 
X-CRM114-Status: UNSURE (   9.37  )
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


miquel.raynal@bootlin.com wrote on Sun, 23 Jan 2022 16:23:32 +0100:

> On Thu, 2021-12-30 at 07:27:51 UTC, Miaoqian Lin wrote:
> > If of_find_device_by_node() succeeds, ingenic_ecc_get() doesn't have
> > a corresponding put_device(). Thus add put_device() to fix the exception
> > handling.
> > 
> > Fixes: 15de8c6 ("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > Reviewed-by: Paul Cercueil <paul@crapouillou.net>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Pushed on mtd/fixes, actually.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
