Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57A1C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/pkuFIN/ymfUdYrhfmlfiOirSsQhr2Gej+A3tEzKDE=; b=pGNGvl4EsZ9j8I
	nn7RfjIFwHxYnVNerO4CMEYuBr9WbTk4UX912V2Bf0+Y3dQvYQacHZH3nbHPkY1Rt82V4JMgeQ11h
	Ty5Zz86UoMoM1wlNDJH3UO9ZPFLk/iuuRw8QhMa2hwXOTUlVnRfkxBJApzzqoes2U9My3j3L929kb
	w43IdJLC9e7E3SAVsEUaePWwFA7QMBDG3w6MRulsGxElLgwoSGChfEf64lIUmLVbMQ36U2yqU5DSZ
	9TMYMyURXY2IN6YHBApdpjg4q/z5XGwX9CWh8tDBkfrIbCwpODw0y9MrEFd208EzryvM/gn8EhlDn
	n4TPg+yBRc5WXxOj98aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBevw-0017q0-0e; Sun, 23 Jan 2022 15:37:36 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBerm-0016dH-Uz
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:33:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C326100003;
 Sun, 23 Jan 2022 15:33:12 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:33:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 krzysztof.kozlowski@canonical.com
Cc: vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Prevent invalid configuration and
 build error
Message-ID: <20220123163312.31866853@xps13>
In-Reply-To: <20220123152301.529360-1-miquel.raynal@bootlin.com>
References: <20220118123525.8020-1-rogerq@kernel.org>
 <20220123152301.529360-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073319_252803_8B58182F 
X-CRM114-Status: GOOD (  10.88  )
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


miquel.raynal@bootlin.com wrote on Sun, 23 Jan 2022 16:23:01 +0100:

> On Tue, 2022-01-18 at 12:35:25 UTC, Roger Quadros wrote:
> > We need to select MEMORY as well otherwise OMAP_GPMC will not be built.
> > For simplicity let's select MEMORY and OMAP_GPMC unconditionally as
> > this driver depends on OMAP_GPMC driver and uses symbols from there.
> > 
> > Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Roger Quadros <rogerq@kernel.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Pushed on mtd/fixes, actually.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
