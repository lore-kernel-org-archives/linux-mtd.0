Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EE5CF9C5B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 07:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=we/zdqsFWlQVUnJdHv+T4HIKYvCxXdideqbcaF4y1Qg=; b=bqJFeApcXCa0y9
	j4Ws/hVtEm9/9omUpePmLaTILrDM/P4uD0h/XaLt0MBggvkh9UDPXz6oDTra5Dv74DqgWWqIL9CHd
	z/v9iW/0VNLAI8CfwVA5mZF21uasZYa6gE/V/5BBLPbzn6+SPpNvrzHvPbDoYVx3yOD1KSrCe8Drd
	LvtWNEdUyXVTwr/WsviSzItRiSVNVCMxaNExpBEcXsjYsJTUydbyN+3QbI/9v/jspET2li0+npKTo
	X6EnbLTjbRa6dffMkuGMy5L1i9kNAi5NB73/g8cD7Ixf0lIuBQ4IgURQskVtWzh5aBCB3t18NdJUJ
	ngY34hOxK2a79bGWzOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssdKq-0000000GVUY-47Fm;
	Mon, 23 Sep 2024 07:18:16 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssdKn-0000000GVTG-2IPU
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 07:18:14 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4C90C4CF;
	Mon, 23 Sep 2024 09:18:02 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 23 Sep 2024 09:18:01 +0200
Message-Id: <D4DHAZ1MIJV2.1G810GI4K5DVV@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "AlvinZhou"
 <alvinzhou.tw@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal
 flash
Cc: <chengminglin@mxic.com.tw>, <leoyu@mxic.com.tw>, "AlvinZhou"
 <alvinzhou@mxic.com.tw>, "JaimeLiao" <jaimeliao@mxic.com.tw>, "Bough Chen"
 <haibo.chen@nxp.com>
X-Mailer: aerc 0.16.0
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com>
 <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
In-Reply-To: <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_001813_749035_68C3D846 
X-CRM114-Status: GOOD (  11.75  )
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

> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -200,7 +200,9 @@ static const struct flash_info macronix_nor_parts[] = {
> >  		.name = "mx25l3255e",
> >  		.size = SZ_4M,
> >  		.no_sfdp_flags = SECT_4K,
> > -	}
> > +	},
> > +	/* Need the manufacturer fixups, Keep this last */
> > +	{ .id = SNOR_ID(0xc2) }
> >  };
> >  
>
> Could you please elaborate why you need just the manufacturer id here? I
> would have expected to see a specific flash entry instead.

I can't find the thread anymore as this is going on for forever, but
that was my suggestion. That's a catch all to have the manufacturer
fixup applied for any macronix flashes instead of having to list
each flash id here.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
