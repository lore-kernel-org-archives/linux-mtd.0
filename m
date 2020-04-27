Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24878C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97F8214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2CBXFgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C97F8214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHCKJBz+dhewNbuttTLGEbSJw1eSIW4Fd/j1fkPGS7Y=; b=p2CBXFgmaOWxz8
	PFY0g/HSz5mnTC4vgzmN7v8a3uk5WssJZ9tUKC9upNLlVmYmER6xWb+u7PBCsNAIAkcxiVZ7rR9GW
	99EaMB+GtW0SadA2kNCgVRqBqj+ebR3RcKX4QUU1jlFQHEp2X96bwUcOo98IqXmzuzh/kdCDwmwA/
	3oq8jq7tpiZsL/ARWiHtXEcCrBOq3kR+3mYzeMJ3Nne7c+YmQpcuOyjy8Lgnv7u0ROgncEyZGv+8l
	wQw9rvCrze3ru8MTBGubsrtit0eQFVRSnhUsvheyQT7gI3CIO7c7eWm/trFMle1up1/zGcqDp93rk
	UkIH+rnNWer8AGA3A8nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8U2-00014a-Mb; Mon, 27 Apr 2020 18:27:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8Tz-00013x-Cj
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:27:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0DE162A0D29;
 Mon, 27 Apr 2020 19:27:54 +0100 (BST)
Date: Mon, 27 Apr 2020 20:27:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: atmel: Convert the driver to exec_op()
Message-ID: <20200427202751.5deee49e@collabora.com>
In-Reply-To: <20200427171719.395b84a7@xps13>
References: <20200418194959.1017197-1-boris.brezillon@collabora.com>
 <20200418194959.1017197-2-boris.brezillon@collabora.com>
 <20200427171719.395b84a7@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_112755_563923_2F0B1CCD 
X-CRM114-Status: GOOD (  12.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 17:17:19 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > +	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_waitrdy,
> > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > +);
> > +
> > +static int atmel_hsmc_nand_exec_op(struct atmel_nand *nand,
> > +				   const struct nand_operation *op,
> > +				   bool check_only)
> > +{
> > +	int ret;
> > +
> > +	if (check_only)
> > +		return nand_op_parser_exec_op(&nand->base,
> > +					      &atmel_hsmc_op_parser, op, true);
> > +
> > +	atmel_hsmc_nand_select_die(nand, op->cs);
> > +	ret = nand_op_parser_exec_op(&nand->base, &atmel_hsmc_op_parser, op,
> > +				     false);
> > +	atmel_hsmc_nand_unselect_die(nand);
> > +
> > +	return ret;
> >  }
> >    
> 
> With the above fixed, please add my
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

One, more thing. I'll probably split the conversion in 2 steps to make
the diffstat more readable (add exec_op() + get rid of legacy implem).
That's what I did for the bcm47xx driver and I find it easier to
review. Let me know if you'd rather keep things as they are now.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
