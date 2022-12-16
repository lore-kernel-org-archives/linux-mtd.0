Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0293AC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYADK4Y19cJgajq9+IFhv62scw7r7TWUKOOOYUek5sQ=; b=Lvh3Uq0KO1kxxM
	yZGbolWjERVszem9i+QkCW3M6pvzQwt8wfGwSOJH2ThIczETFOmJa2KFQ7ECkjmpzCNmxsIGmfvPI
	iOtjeEFv2t9V4jw/xGBvNB1Touq0WcVy8zC8HXqI3fuOCpElr3dyo2AOtY3hqZ5QSC0zZPscUz/eE
	Z0PpfpfaQAArVRBKVdauQnjrrr5U4ttZhIV8BAcu4u/mLi/zXsRxDibbgVHtT8b01iSZV2CuOA9ti
	HmjKSUNCUGVHF/VOAn9L35yIclpyv26gBJa+Mj/cnDpUJoApM30OaCEHHjjj6HrAZgHTTzV4MS1TW
	gRt4WwB76rINPpnZSBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Dbm-00GRdz-N2; Fri, 16 Dec 2022 16:30:50 +0000
Received: from smtp-out-07.comm2000.it ([212.97.32.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Dba-00GRaw-LE; Fri, 16 Dec 2022 16:30:40 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-07.comm2000.it (Postfix) with ESMTPSA id 58D0B3C91BB;
	Fri, 16 Dec 2022 17:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1671208233;
	bh=QuD3vviGMYLaRssF2NDncqKGvsdSjgCqIPf7dKm1D2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yNFxzyoEkLGlHwXnBp/qUPl7/BCI8EA5FpUjJxSHwFhLmerOkD1q4gKyK45wTXPbY
	 LE6eOEAe1chQ4U0CzzLBYx+XOM84Mo0UV+q4QJeGNa3repaD+gsLiF4N0V2UjbBaAj
	 vQJuzJ0qcytsu9ocezcDjdaPY5bBOEJByBYQBvOmVjWnFJQqdKFXzckQFAUOXqxWPq
	 o/meSmfxeojrdtbcbm2VgKcsix2T6watQg5oTeruHzfnOYxWWHH2rfjQrkosb9Mrs+
	 hpd9VP2v1ftYvExo0539VM71YXetFBx7jJFPQmryjPtOR3HjUFcQZUfzUU5OXHbqtF
	 SBtCvkJFgUnQw==
Date: Fri, 16 Dec 2022 17:30:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
 <6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
 <20221216120155.4b78e5cf@xps-13>
 <Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
 <20221216143720.3c8923d8@xps-13>
 <fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
 <20221216163501.1c2ace21@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216163501.1c2ace21@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_083038_873346_C80CFF4E 
X-CRM114-Status: GOOD (  18.05  )
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

On Fri, Dec 16, 2022 at 04:35:01PM +0100, Miquel Raynal wrote:
> marex@denx.de wrote on Fri, 16 Dec 2022 15:32:28 +0100:
> > The second part of the message, as far as I understand it, is
> > "ignore problems this will cause to users of boards we do not know
> > about, let them run into unbootable systems after some linux kernel
> > update, 
> 
> Now you know what kernel update will break them, so you can prevent it
> from happening. 
> 
> For boards without even a dtsi in the kernel, should we care?

Would caring for those boards not be just exact the same as caring for
some UEFI/ACPI mess for which no source code is normally available and
nobody really known at which point the various vendors have forked their
source code from some Intel or AMD or whatever reference code?

IMHO we should care for the multiple reason I have already written in my
previous emails.

And honestly, just as a side comment, I would feel way more happy
to know that the elevator control system in the elevator I use everyday
or the chemical industrial plan HMI next to my home is running an up to
date Linux system that is not affected by known security vulnerabilities
and they did stop updating it just because there was some random bug
preventing the updated kernel to boot and nobody had the time/skill to
investigate and fix it. [1]

Francesco

[1] this is pure fictional, I have no elevator in my condo and no
industrial plant next to my home :-), yet I know that this non upstream
boards we are talking about are used every day in such environments ...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
