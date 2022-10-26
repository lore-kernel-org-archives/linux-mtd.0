Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D5C38A2D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Oct 2022 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihqijT6wUx+bWrZEXJKJfpOyvH8TMKYBiZz4wMWkgzo=; b=ub1hJsoDiDikT9
	aKTZRiYbXnuHIYxRtUsbtzOnWx1i1QWyhYFrnYZo/gEKnC985eKEQ+fjAKRBmjTVOqTm8F1XtSY55
	Ub7qqN7AnvNRn0RD/RcI++EFNSrFlPQ0HR+m7Dg8/wQjEaMK6UaJrf82zUanzApCFYMt7EZoRkfW3
	a2hb10dCX76MqJ86BBiJuY4Uxpj+xQbGlsg/Rzyg+XuUatR/LmGbPZzWQ1mouj6mugIc0TRsWIgmx
	YW+rM/UJsc2lHMR39ENygtrreuGaBqyeQicLpra0hmVv5e9NT5tZPP7Gp2Eq868oizZihb9qu7Ypr
	4l0dTdz3EhYfzTXze48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondzG-008xtG-KI; Wed, 26 Oct 2022 10:50:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondzD-008xrf-5F
	for linux-mtd@lists.infradead.org; Wed, 26 Oct 2022 10:50:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 42519CE21AE;
	Wed, 26 Oct 2022 10:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F93C433C1;
	Wed, 26 Oct 2022 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666781405;
	bh=boEsi/InFJxTy/pvk2Wx3Sg5dSCvTStHGPubud3/XZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E73gpQqoj2SSQ8SlybIg4TAqhPtJrfUKkInUvbQTdh1srRaGsu/kjcrt2eThGY0F/
	 mXAeSAuf/j1LFvdJtMFlMjk6IAJNFfg0zprcchkbzWyXM9jmy1I/2s3RaSnbhAkztM
	 aBDy0oBZAWI+KjxC4irldbB6YHV1ZY+uOzuWtlro=
Date: Wed, 26 Oct 2022 12:50:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sasha Levin <sashal@kernel.org>,
	torvalds <torvalds@linux-foundation.org>, Han Xu <han.xu@nxp.com>,
	kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>,
	k drobinski <k.drobinski@camlintechnologies.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Message-ID: <Y1kQ2/u1YLSGEmLK@kroah.com>
References: <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com>
 <20220715074631.GA7333@pengutronix.de>
 <YtEdIujszEKSprbF@kroah.com>
 <770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
 <20220902090252.75285234@xps-13>
 <CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
 <20221024100114.627f87bd@xps-13>
 <CAJ+vNU2R=FVSpRVWh8RBJ7XZmRRjkqHce1WTGXDKrjeHRbuzSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2R=FVSpRVWh8RBJ7XZmRRjkqHce1WTGXDKrjeHRbuzSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_035016_235317_506E6241 
X-CRM114-Status: GOOD (  35.52  )
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

On Tue, Oct 25, 2022 at 03:02:27PM -0700, Tim Harvey wrote:
> On Mon, Oct 24, 2022 at 1:01 AM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> >
> > Hi Tim,
> >
> > tharvey@gateworks.com wrote on Fri, 21 Oct 2022 14:55:15 -0700:
> >
> > > On Fri, Sep 2, 2022 at 12:03 AM Miquel Raynal <miquel.raynal@bootlin.=
com> wrote:
> > > >
> > > > Hey folks,
> > > >
> > > > richard@nod.at wrote on Fri, 15 Jul 2022 09:59:10 +0200 (CEST):
> > > >
> > > > > ----- Urspr=FCngliche Mail -----
> > > > > >> My IRC history doesn't go back far enough, but if I recall cor=
rectly
> > > > > >> Miquel is on vacation, he would have picked up this patch for =
linux-next
> > > > > >> otherwise.
> > > > >
> > > > > Exactly.
> > > >
> > > > Indeed, I was off for an extended period of time, I'm (very) slowly
> > > > catching up now.
> > > >
> > > > >
> > > > > > Ok, let me do a round of stable releases so that people don't g=
et hit by
> > > > > > this now...
> > > > >
> > > > > Thanks a lot for doing so.
> > > > >
> > > > > > Hopefully this gets fixed up by 5.19-final.
> > > > >
> > > > > Sure, I'll pickup this patch.
> > > >
> > > > Thanks Greg & Richard for the handling of this issue.
> > > >
> > > > Cheers,
> > > > Miqu=E8l
> > > >
> > >
> > > Hello All,
> > >
> > > As Tomasz stated previously 06781a5026350 was merged in v5.19-rc4 and
> > > then was picked up by several stable kernels. While this made it into
> > > the 5.15 and 5.18 stable branches it did not make it into the
> > > following which are thus the are currently broken:
> > > 5.10.y
> > > 5.17.y
> > >
> > > How do we get this patch applied to those stable branches as well to
> > > resolve this?
> >
> > It is likely that the original patch (targeting a mainline kernel) did
> > not apply to those branches. In this case you can adapt the fix to the
> > concerned kernels and send it to stable@ (following the Documentation
> > guidelines for backports).
> >
> > Thanks,
> > Miqu=E8l
> =

> Miqu=E8l,
> =

> Thanks for the pointer. You are correct that this patch which resolves
> the regression does not apply directly to 5.4/5.10/5.17 stable trees.
> I'm looking over
> https://www.kernel.org/doc/html/v4.10/process/stable-kernel-rules.html
> and I'm not clear what I need to put in the commit to make it clear
> that it only applies to those specific trees. Do I simply adjust the
> 'Fixes' tag to address the commit from that specific stable branch and
> send one for each stable branch (thus each would have a different sha
> in the Fixes tag) while also adding the 'commit <sha> upstream' to the
> top?

Please send multiple patches and say below the --- line which stable
tree it should be applied to.

Note that 5.17 is long end-of-life, always check the front page of
kernel.org for the active kernel versions.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
