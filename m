Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7884C25B50
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJTdudxV/FydEMpxb7OD50Y7sb08i/O8Ut9/U30qGBo=; b=JOOMg4q6Lk1hHV
	FP3Fi4puYJjyPOcBxOj0wqiKBORs2XRRfG0XuTKIZIjZqFNzI3nyYX6Fdmy0zHHRgfTd6M8lAc03E
	KREUQuhzspg59PtZ6YCDrMtBKTYk0r0f3wr3Wp7lf6PQFGWMvHc5DJxLYd0LatSwzk2NB6aP+7XTy
	KXcWdGBaDfCVjD0G/fKNTwQyYKsWZ8iIQ9TG2iz7ISmwwpf5HWWGevCKxDi+CYQOwCPP2oJekzoHT
	XArciywpH7GzahTT+cAdkxsN0xrK7JzmhqFBy56GcMjHS1EDBhEV4wN0ktfjxqR8aPVF2NscznFLB
	DMuFEysgBumvNbw7aYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuLE-00GswC-EO; Mon, 23 Jan 2023 10:46:20 +0000
Received: from smtp-out-01.comm2000.it ([212.97.32.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuLB-00Gsv5-6X
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 10:46:19 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id 13AB0843A0D;
	Mon, 23 Jan 2023 11:35:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1674470142;
	bh=0iEJ0WqkL4EWVqwlDQRqN90q9YdSc+HZcUgbTvKemVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nl6QUBkLSMT5pxfgIvVLhJwglmbv305ZtxZtrOq3E+lNm08u99tIWvJdOBeLemLaN
	 u36xYn9O8RR0q9uLY5fpPRt0pEt4vVlEpv00U5xWZb/KRzAzwuwmdWxO4q8svdVPJb
	 PWst6OSoLYUsHhoVTbL/6hu3+pXE0H9hpMUjydFd8Fg9bA6gb3hh/0Fhqu+fkiAWrC
	 OZ06BHHDCChOjvghd9Eqsl5b1zEYSp+NiC9AXwl2VahRoShkmgD0YyCj8gE4dyFQt+
	 bRe7WRPVdd2MyO+ejp+u0gIH9MOex98iJh1OhwzNgtbgcb4VIpfj0TjF/db2VHdTlo
	 ug+3cDz5/xTuw==
Date: Mon, 23 Jan 2023 11:35:37 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] mtd: parsers: ofpart: add workaround for #size-cells 0
Message-ID: <Y85i+R79AWvAUAj7@francesco-nb.int.toradex.com>
References: <20230113184556.487405-1-francesco@dolcini.it>
 <20230123112808.6340a016@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123112808.6340a016@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_024617_424103_9477D8BF 
X-CRM114-Status: GOOD (  20.67  )
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

On Mon, Jan 23, 2023 at 11:28:08AM +0100, Miquel Raynal wrote:
> francesco@dolcini.it wrote on Fri, 13 Jan 2023 19:45:56 +0100:
> 
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add a mechanism to handle the case in which partitions are present as
> > direct child of the nand controller node and #size-cells is set to <0>.
> > 
> > This could happen if the nand-controller node in the DTS is supposed to
> > have #size-cells set to 0, but for some historical reason/bug it was set
> > to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> > as direct children of the nand-controller defaulting to #size-cells
> > being to 1.
> > 
> > This prevents a real boot failure on colibri-imx7 that happened during v6.1
> > development cycles.
> > 
> > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > 
> > Miquel, Marek: I do not expect this patch to be backported to stable, however
> > I would expect that we do not backport nand-controller dts cleanups neither.
> 
> Okay.

[snip]

> > +			pr_warn("%s: ofpart partition %pOF (%pOF) #size-cells is wrongly set to <0>, assuming <1> for parsing partitions.\n",
> > +				 master->name, pp,
> > +				 mtd_node);
> 
> Why mtd_node on a new line?

For some historical reason most of this file is like that, so I did the
same for consistency (to be honest when I did it I though it was _all_
like that).

> Otherwise looks good to me.
I can send a v2 with this changed.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
