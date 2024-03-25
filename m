Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E1FC54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGM6VAyr/0oHyCE8MFJjH2n2ThLhRnASzPrUAWIkeFQ=; b=Hf2GaVJOVK108/
	17X8+z3gyPhMHGaR3q9OV/sf7hKtYsw4mLVZDMlLYtk81Jjj1njgL8pBHKjzuzsCxe/SEoqUtTiED
	cR5PIeLiDo4/mLtFLCzIaxOxbzpX80ByWE7ssNxFTjBZj+7w8V7BD6w0G3KX2ISyMuOaJliDhT+Vr
	C931jZXnE43loREDMbB6QizjAMYXOlUYADkH3G4shhavCmB4/jcif0cKEf9ZWUiOJf7mVhIc3eZUA
	0LFxGHNawgyJ95QO6YttqyMfZNP9Yl0JvlrooyhzuSAouJP1PruEwioOW6UAP8ZeLvDUo5ByUmT77
	5YI8qpQclR6ZuORWlFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roh7B-0000000Gb4o-10IH;
	Mon, 25 Mar 2024 09:59:37 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roh79-0000000Gb1M-0Dnw
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 09:59:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 472731484B07;
	Mon, 25 Mar 2024 10:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1711360765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CamFrT0reqTDJ7jbhj/1NySGwvpXr3L1a1Ko18MM4wI=;
	b=Xyi6vghXh4FTX8vYs+zIjiiogALaahRNb8Cc56dQkwsVwBkWneolgu3D9b5oH9WkpSzQSo
	WlkfY/7V5NvgfWugGODt3oLdnWpkGXsKKOzcPKb2gpbi5PWrxFVzV3px1PM5VblbbZHiXy
	8Hk4lwaZwyBFxjHTOA6uc4KVYr7tkdxbhRxsqwIfECkHQQfTKirrt3u7GoRo/BYM0wRl3h
	YLzciLsQW+/zekSNbvuUzAg2fxwkUbvxkybccTsPHpN4GB/0LlUeWH1qpE0k9FFNhgjBz9
	f0oilnIchjFMWGvTP4k1VzgolnqWYQ/7SuETD/SkMh81+GxqPdzsLXAfk1tqOg==
Date: Mon, 25 Mar 2024 10:59:09 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Dahl <ada@thorsis.com>, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: mtd: nand: raw: Possible bug in nand_onfi_detect()?
Message-ID: <20240325-dig-user-c4b9af6f8ea2@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
 <20240306164831.29eed907@xps-13>
 <20240307-pantry-deceit-78ce20f47899@thorsis.com>
 <20240307181931.440c9c3f@xps-13>
 <20240325100917.502c75b7@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325100917.502c75b7@xps-13>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_025935_355280_3E1EC25B 
X-CRM114-Status: GOOD (  21.98  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miqu=E8l,

Am Mon, Mar 25, 2024 at 10:09:16AM +0100 schrieb Miquel Raynal:
> Hello Alexander,
> =

> > > > > The condition is true and nand_change_read_column_op() returns wi=
th
> > > > > -EINVAL, because mtd->writesize and mtd->oobsize are not set yet =
in
> > > > > that code path.  Those are probably initialized later, maybe with
> > > > > parameters read from that ONFI param page?
> > > > > =

> > > > > Returning with error from nand_change_read_column_op() leads to
> > > > > jumping out of nand_onfi_detect() early, and no ONFI param page is
> > > > > evaluated at all, although the second or third page could be inta=
ct.
> > > > > =

> > > > > I guess this would also fail with any other reason for not matchi=
ng
> > > > > CRCs in the first page, but I have not faulty NAND flash chip to
> > > > > confirm that.    =

> > > > =

> > > > Thanks for the whole report, it is interesting and should lead to f=
ixes:
> > > > - why does the controller refuses the datain op?    =

> > > =

> > > See above.
> > >   =

> > > > - why nand_soft_waitrdy is not enough?    =

> > > =

> > > I don't know.  That's one reason I asked here.
> > >   =

> > > > - changing the condition in nand_change_read_column_op()
> > > > =

> > > > Can you take care of these?    =

> =

> Now would be a perfect time to send these fixes. Could you work on them?

I'm sorry, no not yet.  Have some more important work to do, which
will take another one or two weeks before I can return to this
problem.  Will have to wait, at least from my side.

Greets
Alex

> =

> Thanks!
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
