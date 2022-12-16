Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD02C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 07:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=r/CL2metQnX+tAANt97bs/3SqjOuxdJMJiicMM2TEq0=; b=vxAilcBxXQGZop
	r+RELGB85zKlfNvAlJQnZUSJYoMYdB+gP/0HC9U1Qwc+FU4L6MBRoKhGZGaNhj9XHXEGQo6P/oq/M
	p7q0ZmnylYUyAH/4jAhz0qtuFxDvIu/B+z1uC30J41tNUuwrf+tCv5ucv13pKQF3OYIf5W4AZk+Ua
	vgvTjlsLzewwuHUlxvkjLFnV3K6B4htEgISvs745AGQW2GfTO6UKOvypruo9ZfgQscwp9d8ZkjEJ9
	z2I80xvLepsqRBcVdc6c9Rhfw+mFggFJDiDC91hp8gtNrAqewCcFLmJUkhDaGGB2Mf041vOHkb9lc
	BmxdBPPLu0302nidkWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p65PI-00DQvx-RG; Fri, 16 Dec 2022 07:45:24 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p65P8-00DQrU-CV; Fri, 16 Dec 2022 07:45:16 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id 2FA14823448;
	Fri, 16 Dec 2022 08:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1671176711;
	bh=zfM5i+fNhKMz7UOqan+1GC4MIG+OcI2xAD05WANu6CA=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=K06f7Sy32XOtDUASbzEkFWbQYE5THTGyNrlXLHO97HHLWRXdvfcRDMQol91XRoXc5
	 lbJlD9pTZx39qhs2wScf1U/mYoRxSFzP5Jl8tr9/y7jOK1a6XaUZdrshHAtITpDJco
	 Fr0z3Do2ldfTLjyQkUbH4iixbBnOCndQ07XW6Kf9j1J+tE203hLeEccinr1jP37JDR
	 4WF5HtFQc2mQ/susgR4fc0Q6RWGLPYvRYhk8Nc4ykCdZ1vlHN1lVpH6LwqYQqKbUGV
	 7fihpv0fss07+Q5ILAFt30xi8qP+s/W5FwbCstUl8HCMwpWoypJQLa9qFirtdaUX96
	 PTSZ6RiXzalNA==
Date: Fri, 16 Dec 2022 08:45:04 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215090446.28363133@xps-13>
 <ac50a1ee-4312-48f6-af78-7b95a77e6fda@denx.de>
 <20221215081604.5385fa56@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_234514_595914_62AFF611 
X-CRM114-Status: GOOD (  28.81  )
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

Hello Marek and Miquel,

On Thu, Dec 15, 2022 at 08:16:04AM +0100, Miquel Raynal wrote:
> So my first first idea was to avoid using the broken "fixup mtdparts"
> function in U-Boot and I am still convinced this is what we should do
> in priority.

This is something that was already discussed, but I was not really
thinking much on it till now. Do you think that the whole idea of
editing the MTD partitions from the firmware is wrong and we should just
pass the partition on the command line OR that the current
implementation is broken and can/should be fixed?

> I am still against piggy hacks in the generic ofpart.c driver, but
> what we could do however is a DT fixup in the init_machine (or the
> dt_fixup) hook for imx7 Colibri, very much like this:
> https://elixir.bootlin.com/linux/latest/source/arch/arm/mach-mvebu/board-v7.c#L111
> Plus a warning there saying "your dt is broken, update your firmware".

I have a couple of concerns/question with this approach:
 - do we have a single point to handle this? Different architectures are
   affected by these issue. Duplicating the fixup code in multiple place
   does not seems a great idea
 - If we believe that the device tree is wrong, in the i.MX7 case
   because of #size-cells should be set to 0 and not 1, we should not
   alter the FDT. Other part of the code could rely on this being
   correctly set to 0 moving forward.

If I understood you are proposing to have a fixup at the machine level
that is converting a valid nand-controller node definition to a "broken"
one. Unless I misunderstood you and you are thinking about rewriting the
whole MTD partition from a broken definition to a proper one.

On Thu, Dec 15, 2022 at 09:04:46AM +0100, Miquel Raynal wrote:
> marex@denx.de wrote on Thu, 15 Dec 2022 08:45:33 +0100:
> > Sadly, it does only fix the known cases, not the unknown cases like
> > downstream forks which never get any bootloader updates ever, and
> > which you can't find in upstream U-Boot, and which you therefore
> > cannot easily catch in the arch side fixup.
> 
> And ?

I'm not personally and directly concerned, since the machine I care are
all available upstream and known, however this is a general problem with
U-Boot code being at the same time widely used on a range of embedded
products and producing a broken MTD partition list.

I think we will just silently break boards and just creating a lot of
issues to people. We would just introduce regression to the users, being
aware of it and deliberately decide to not care and move the problem to
someone else. I do not think this is a good way to go.

Francesco



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
