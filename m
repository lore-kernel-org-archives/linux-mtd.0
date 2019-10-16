Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3991EECE599
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 20:27:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4C421835
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 20:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xq9btlmT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="AZ6G8TOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4C421835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.us
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	In-Reply-To:References:Subject:From:To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fh+f11lww8UeTEah6JtN73vGv0mQc2/JSuYB3kVNTT4=; b=Xq9btlmTWUC7/Kb+i+nq8Doh3R
	UMr6U0OvulXD3N0/1Qd8re6gCzZiYHu8MY6iidrO2394jNNMPaI+2Otj/hnmCzkLP4TjjMZcji+ft
	+8EbW6/DmXfWzqTL+AIKRzg2iN7vAUuCDlU4DEGo9hoVjzagN7rtRFqD7etjEQk4UkAPIfRGaTcUl
	MnbkX5yaAxMjhm+D0jtC3zJJWK9hJKuD3MgFaB8XoUHmA/uCPSYzgHp76l00eQgADul024T6Ht3LS
	Ch8J95mD14IHC4X4aKAR1XPboneCtOA3km1bkoJ7boiKu0BKpCg+jK08WdmJvHvdlXltEfroNfH5k
	9niisZrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKpt3-0007Nz-MZ; Wed, 16 Oct 2019 20:27:13 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKpt0-0007MZ-BF
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 20:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1571257626;
 bh=+xdbdDIFCo6GlOO642vZd3Hs5vPcDm41DuE+B/Fv71E=;
 h=X-UI-Sender-Class:Date:To:Cc:From:Subject:References:In-Reply-To;
 b=AZ6G8TOAWMnykpWJEgs+pUy8GwdhhZ0iVemtc8cRqP52xPB3pW3v8wqCHeUOs0LDZ
 TPVBWeN5L8zidW92MeUz9OQQ+n+TAFag8lLU90qKj/kGs05AVqzk4BvmiA5XymIrwN
 1XzI0ADmw/8nGM4l0P4W5GW653TlJkJNdTs9U5rk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from wde002-08 ([67.173.104.214]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MOA3P-1iifDs0ceH-00OUjR; Wed, 16
 Oct 2019 22:27:06 +0200
Received: by wde002-08 (sSMTP sendmail emulation);
 Wed, 16 Oct 2019 15:27:03 -0500
Date: Wed, 16 Oct 2019 15:27:03 -0500
To: Richard Weinberger <richard.weinberger@gmail.com>
From: don311@gmx.us
Subject: Re: jffs2, mtd, mtd-utils and ancient kernels
References: <1N9dsV-1hx2G70tCn-015aTM@mail.gmx.com>
 <CAFLxGvwuW+taURgxp6zX2YKnL0=rFoUN=zocY1rN3Sc+MLxXdQ@mail.gmail.com>
In-Reply-To: <CAFLxGvwuW+taURgxp6zX2YKnL0=rFoUN=zocY1rN3Sc+MLxXdQ@mail.gmail.com>
Message-ID: <1Mr9Bk-1hffmW1bPS-00oJde@mail.gmx.com>
X-Provags-ID: V03:K1:sy99KWGIHC7fQJKp4i4K8gxSSUHQc7Z52BTr7EX2ODD7meDZUdV
 0jgbJS1PlW+VfFz2kLSEumErUVS49ZxV3WsjR6GMlWEhRZ5/hJgXPIXMCX2vqX2lyvu1aZc
 w68kJKtlkMuqYQFIY90h8TNkF9U0IAL+zR587DudqVtwN5kpa0WyDkhTYz7yUm75ja3+KcJ
 oJzxlKSfp2Gj3KNlnkDUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oYwZ8wOFF4w=:PHzTgMvnGBKyvIpJoyDMuD
 NEwFef5qrgJvDtjv+KTzkkKpdIrwH+Rn5HfdqzKnrz7pMi3vElJwKxDwVQIXuS5ft8+uenayi
 p+/L3A4Yp+QwQ4g5udoFs2eMQoMLXwkD4WnAd8cZa+Y8T9DstftD1bjew0c1EdGHrceF7RtOb
 dLa2fCbLFSTBQd53M66ccI3y97gofJ7Q9VtCs9ghZS23iLBS6+UjXmcp+t4FJHS6S2Zo48m3T
 gpuVLksKH/kWipCLYXftt+6Ppa4gdBqYN3Qp29T5/C+qoCwChJY2hpPtZ2B/TbMjt2Ti5RKqq
 oi0Z6gE1poJIbiy3QatEEmMSPXcz22QnB8Y9nrGRMkBxCoojCmjtG4aiV6xnSIdiMlW/IP5pH
 q6E7IB532cFfb233tyA3pBGBK64dMs2IlyI1I7Ozlo9Hsr0gMUSaNW1cChXwbMJXHMpODyUdO
 IOnTD147MH5DELgxwVm3FdQzgQY6JNcAH4LZWE/fQbeLzwhrFnSrUPxt+9nepOSeZKbcemAPy
 fomMPOTrAL9tLVgbxRnJIPpc7ScIB5mEqABOhiITyFzVBxeP27F0MI3bQrONi142IRlbKWfS/
 FYO6+bDVJRJa5GJ8gkyG02bUaMacwB6pAZgE76d515FNC7HaZ0gMRUI99jhSeQgsx6mVg8HNL
 TlLX939Az6WxU7JmUyxbLN9LkEp19XUAEWeuX/IaPNp39dmrPRIRhRy8W6nXist5Isa3ebgyH
 byxBqqt4QLs0JYZAPDlgHDQQNTnzSDaXfX1lEaiKyXJHKn1xYdGawdvhkXozJZiFCqa1ZZ7pa
 Yr1AOJxB312zeGsNksFQK9mnCkCiQEUMT35fzORC+SqeC8jpp2TJtKn9ZkPdR5o/0TEoMHJUe
 3Ou3Jjh6qzvoYfi8k3arOs1SbWEKO5WTKcGNywDg+9HHRQ2+/bld16PIgLPjsxUgmk2j+Tn+t
 X5FuT947M2IMrWXSUFzUQzt9VGEZTS+d0O/soHEL6U3jra107jxdpi8IzJ7WvtYONQf1aYpDC
 Dm2Nrad+NcdBPOIO+4k60lCrn6urBK/weKq1Erp7cExr9z5DR++C+l15FbB67x5k+hHkBDmKS
 zv2M/Ha+/0yannedkVZ/FdXiQRz4buOuGYQUumbIRX4KLtTZiDLHkACITlE7ftRB0HT792Jzg
 islVS9tnlyUA43llgXi8kiFUkQdoZbTBWsMAH03cbWwHhqJjubff74+H6ZFCaYQAW30CtvNFq
 u9Z8cXN579a+LEShoWjXmgZZE6QCruaAwvGFOQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_132710_678069_672EC4EB 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-10-15 21:11:39 +0200, Richard Weinberger wrote:
> On Tue, Oct 15, 2019 at 3:01 AM <don311@gmx.us> wrote:
> > Q2/ Is there anything you can point me to that shows which versions of
> >     MTD, JFFS2, and mtd-utils were delivered for use with each Linux
> >     kernel release?  In my case, I have particular interest in kernel
> >     2.4.26 -- so would it be possible to, say, find the mtd-utils
> >     version that corresponds to the version of MTD and JFFS2 used in
> >     2.4.26?
>
> Usually Debian is a good source for such an information.
> ...or any other Linux distro with long term archives.

Ah, good idea, I should've thought of this.

They don't make the old stuff real easy to find, but it looks as though
Debian jumped from mtd-tools 20011217-3 in 3.0 (Woody) to 20050122-2 in
3.1 (Sarge) -- quite a big jump.  I also tried Fedora and couple distros
that targeted embedded systems without much luck.  But I can keep
looking.

I just noticed that one of the versions in our source repo is referred
to as 20040219.  That's plausible, considering 2.4.26 was released a
couple months after that.  Still, it would be nice to be able to verify
that the code there matches the original release.

> >       - On the backward side, how dangerous would it be to use a 2.4.26
> >         kernel with a new (never mounted) JFFS2 image built with a later
> >         version of mkfs.jffs2?  ...
>
> As long you don't enable newer features in mkfs, it should work too.

Okay, this is the situation I inherited: JFFS2 images that were
generated with mkfs.jffs2 from ~2012 are being used in production with
target systems running 2.4.26.  To me it was a potential "red flag" from
the start (without knowing any internal details), and discovering that
image files generated by differing versions didn't match didn't make me
feel any better about it.  But I'm glad to hear there are no obvious
incompatibilities.  I'll have to check the command line, but I doubt
we're using any newer features.

> > Q4/ The JFFS2 code in 2.4 is also referred to as well tested.  Is anyone
> >     here aware of whether that extends to the area of random hardware
> >     resets / power cuts, such as might be experienced on embedded
> >     devices without reliable power sources?  I see there were many
> >     performance improvements and bug fixes over the years, but are you
> >     aware of any data about relative reliability -- on the same hardware
> >     -- of JFFS2 in 2.4 vs much later / current, say?  (I believe "on the
> >     same hardware" would imply nor flash here, since 2.4 didn't support
> >     nand.)
>
> You *really* don't want to use a 2.4 kernel.

Very true! :-)

The device I've been hired to work on is used in the building automation
and HVAC industries, where support cycles can run decades, rather than
years (or months) as in many other fields.  Some of the issues I've
fixed have been within the client's own software, but some have been in
the platform -- in custom hardware drivers, for example.  Each one comes
with some sort of calculation of cost (typically my time) and risk,
compared to expected benefit in the field.

In this case, I discovered that a relatively high proportion of
defective units returned from customer sites (that were attributable to
failures in this part of the system) have moderate to severe file system
corruption.  There are many possible explanations, but one of my
theories about it is unfortunate timing of power cuts, relative to file
writes or garbage collection, say.  If this was a known vulnerability of
the otherwise "stable" 2.4 JFFS code, dealing with that would be a high
priority; if not, I'd look elsewhere first.

Moving to a modern kernel, while _very_ appealing in so many ways, is
probably not something that the client would buy into for this
long-obsolete (development-wise) product -- at least not without that
cost-benefit calculation showing that it's an overall win.  I'm not even
sure the core hardware is still supported with modern Linuxes and
toolchains.

So the "pharma" involved here is kind of related to my salary. :-)

Best regards,
Don Estabrook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
