Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB02C282CC
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:52:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C35E21872
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uEYZM68J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="1vOCd98m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C35E21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2+TEYxzbFR105eTTr/LDIlhnu47yWoyIfMx5qdxTYk=; b=uEYZM68JU0Zvgs
	WyxNcOvR8MHuLOCGpcK/ENrTptGiVyypDSvUWwCNdeKzMai2Q9WFRJ1XDZcmMd7/uDt5UNY2fTnpR
	LSQHk3fm7mGwrbUT7g9udSkwt7khA+YnHf6IyNBnlc1hG/dHucH39ddwhMEbw2fQ//BwvMcx8gj19
	cKwGxrOZ8gdc5YHXuInSSNH5Xt989azItfD5TuNSN7yssTrALNtQ7Snj8MMQkt1KfpJCTf9oX9vRg
	6XsuF+jJoNqg32Tyiop5rrW78zSlGjyv3neCkxUdr7TEiIk7XSnkXYyGFf9BPrcqHb4e3k7LzYeHO
	0F5JOzIzA9KHDstwxsYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grhIb-0006Ff-7K; Thu, 07 Feb 2019 10:52:53 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grhIY-0006FJ-96
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:52:52 +0000
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x17AqYxf009772
 for <linux-mtd@lists.infradead.org>; Thu, 7 Feb 2019 19:52:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x17AqYxf009772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549536755;
 bh=tp5hPxpdOTL0M9fI0rFqN9RTOyPm39PjBpdl2kMLPRs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1vOCd98mgVXOfQ6PKRtY4731x+vOBf7XVT6Kx0Sp2pEt0rmW0vltNQQTOK7mdMW+w
 QRzFcVLCh9pi4WHfnn5A6ryMDpS5xHkGmDECs0ypSA36fv0wxxKbFyF9ZtlBvlnSjs
 fKEFKCxfcZ/zxqYEsC/SbKbVz42j0uuzesGsM5oj7RTifSpgm/M/YvSUFnd/Egp6tX
 YJ7RkTe7WC7el4BmpwwIyIQkWIYEez3SEBnyCOlO0DfDzP/rRiAB8BQO8CwID770pk
 e2TXK1qifCAJGqcF1ExlFW0kCAbpQLnGBr3HGkvBQ0OtP/ljwMrAP8jDHL/v1l8fvz
 yr0PDz7EJG2gw==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id u19so3299853uae.4
 for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2019 02:52:35 -0800 (PST)
X-Gm-Message-State: AHQUAuazkWEeX68SXBjc+J9rDER4hGhU8GHQoPYf/4yxA40QmYBNTyP/
 SqojYb46j+tZpmbKFZ02eQiM0Ch3E2NZpTyj6Po=
X-Google-Smtp-Source: AHgI3IYhwsF+N0VInuOQiPghIM+VBrPUGdVnCy1tH4q9L0fGVW2mnDaSxgG2oC1O1ecqHXjUnKJVEfv01UZqLcYPlx8=
X-Received: by 2002:a9f:3f41:: with SMTP id i1mr5339535uaj.42.1549536754472;
 Thu, 07 Feb 2019 02:52:34 -0800 (PST)
MIME-Version: 1.0
References: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
 <20190207111606.6b72dc34@xps13>
 <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
In-Reply-To: <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Feb 2019 19:51:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-QR3tYJMOLfTssD+tbrsy3G-DZtUvx4g7aC=sxgxtgQ@mail.gmail.com>
Message-ID: <CAK7LNAT-QR3tYJMOLfTssD+tbrsy3G-DZtUvx4g7aC=sxgxtgQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once again
 after nand_detect
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_025250_531655_698B8CE6 
X-CRM114-Status: GOOD (  17.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 7, 2019 at 7:46 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, Feb 7, 2019 at 7:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > Hi Masahiro,
> >
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Thu,  7 Feb
> > 2019 18:57:56 +0900:
> >
> > > nand_scan_ident() calls onfi_fill_data_interface() at its entry
> > > to set up the initial timing parameters.
> > >
> > > The timing parameters are needed not only for ->setup_data_interface(),
> > > but also for giving the correct delay to NAND_OP_WAIT_RDY, for example.
> > >
> > > If the driver sets the NAND_KEEP_TIMINGS flag, or does not support
> > > ->setup_data_interface() hook, those parameters will never updated.
> >
> >                                                             ^ be
>
> Will fix (if v2 is welcome)
>
>
> > >
> > > Before nand_detect(), we never know whether the chip is ONFi or not.
> > > So, onfi_fill_data_interface() has to assume the worst case, i.e.
> > > non-ONFi.
> >
> > s/ONFi/ONFI/?
>
> Will fix.
>
> Looks like I was misunderstanding
> maybe because the letter 'I' in the logo
> (http://www.onfi.org/)
> looks like a lowercase...


http://www.onfi.org/ says

"Discover the advantages of an ONFi world"


Perhaps, is ONFi also correct??

Anyway, I will align with the majority.

There are only three instances in the kernel tree.


$ git grep ONFi
drivers/mtd/nand/raw/nand_legacy.c:      * a byte. The ONFi spec
(Revision 3.1; 2012-09-19, Section 2.16) reads:
drivers/mtd/nand/raw/nand_legacy.c:             /* EZ-NAND can take
upto 250ms as per ONFi v4.0 */
drivers/mtd/nand/raw/nand_legacy.c:             /* EZ-NAND can take
upto 250ms as per ONFi v4.0 */


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
