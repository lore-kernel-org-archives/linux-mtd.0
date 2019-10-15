Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EEFC10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 19:11:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F97F20854
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 19:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RhhflOa0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ/Pe87a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F97F20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wu0IWUk5RgVibH5Bi8R/Ndj0+JX4j1U3I7p4qjrFehY=; b=RhhflOa0m6pSRb
	agAVgu3KUvUZ80cHtWbJmVFCsViQGG7IKkpNg07snXj+BH6hc75jd7gkPaxW61Fd6ZR6C37fqBVzK
	xyL6ah700kEuDD3lgube7qnW+R3Sh8yf5v2e2P88X6dNvMWNlo/p4yJ+XtBYif+piktHMEiRLHFI9
	whxOyu+XNwhtO2E7Tieshs6XV4Qe37kSvPKjs/kfeAzE+x02mme1R/rfV6HwYwsJZ9JyC196UEVxN
	RF66kwqGU8GKIdR11rsBcSdsiOkOWk2CPxs7T9lZi7ODp1fNKRL/dHtd90GvzHe0B4JX5qvxoNtlZ
	xrdaPbj+sD2IX4N2kFjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKSEe-0007tE-Jb; Tue, 15 Oct 2019 19:11:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKSEa-0007sn-4Q
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 19:11:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id y18so15747686wrn.5
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGjkzU9pN9jxFwHQzLofJHMR2wRzSbTGeh5YpFMwC/o=;
 b=WQ/Pe87akDidba+ffYQJ4UH/nx7iOokQ+LsrfOP5IlXFMuTzCNFosFcw391ECa0u9e
 TKAY7X1WaUY5x2nZs7ALJaKoBv5+dfzrKgZLYTT5G+O7cC+g3bOwnalIzCjURSC+HpIB
 ifEa/HYmLngQ//8jDet24aZ0WPOMeuuWyUUefG2PGBKGwomae3U1tU43VMrFzJNzyX7X
 cjEHx8wr2qq7eFU097YCiJlfB8yDLEzc6vKFm9j9LHBHOUnZuqPdMvc/fJ83LnBTaTMF
 rjWtBvcPA1nKUObvjH//XDmVABf2NNH+mIGYQ6/nzLK8hC9//2xGoSAIJsiXr5bOX+oa
 mBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGjkzU9pN9jxFwHQzLofJHMR2wRzSbTGeh5YpFMwC/o=;
 b=D8GMRIr6PkArJJkwGsPkjKzSpMvhKsyN8BapFVTJN2aypEpHGIXVL7tjrCx4vxuRKN
 +7R5XGwxYOpf1b67Q27j2lx+mJ0CiBl/QAbkKjf33xB7LDqws6he5Imei6gm4YdwHqHb
 P/o7c/jI2iRNaCxOma8N4XnJD1h+0cwpUomKZzQKA5pXO+w+Py8Q/JjWh8NhMB/wbTjv
 A9L8wFVVWLCgiJO+CCQXuUEP74wVOO7Tg5pBfFIyt0hKS9nYp6vLOTl0axLkwn11kghZ
 OFI5vK/EeOnNf+cOaLGlfNCAIOz1sudQ5jfroiUqN4eYDI25OLBAuZfnvLmDjwQzzVxb
 u1sA==
X-Gm-Message-State: APjAAAUco0X68XjsX3DjbxbaE+hb+ifNdQtuQbtZZlEI4jMC4OKslXhT
 CjK8bxMtd4o9hsUT1LrPokd6Ey2+uwsdRTyw82rjbBi6dvU=
X-Google-Smtp-Source: APXvYqwBm0Ak7EFIqPlqVF+RBTGceQ2tHYSO3YGA/xsksVzrEnNsPsaLBqr4QVN+qigUS3HviC9ORg9QwgLq18YZvkw=
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr18814824wrj.268.1571166710690; 
 Tue, 15 Oct 2019 12:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <1N9dsV-1hx2G70tCn-015aTM@mail.gmx.com>
In-Reply-To: <1N9dsV-1hx2G70tCn-015aTM@mail.gmx.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 15 Oct 2019 21:11:39 +0200
Message-ID: <CAFLxGvwuW+taURgxp6zX2YKnL0=rFoUN=zocY1rN3Sc+MLxXdQ@mail.gmail.com>
Subject: Re: jffs2, mtd, mtd-utils and ancient kernels
To: don311@gmx.us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_121152_173442_2E0A636A 
X-CRM114-Status: GOOD (  29.88  )
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
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Don,

On Tue, Oct 15, 2019 at 3:01 AM <don311@gmx.us> wrote:
>
> Greetings,
>
> I apologize for writing my first post here on a topic you've made
> abundantly clear, for a long _long_ time now, that you have no interest
> in: support for ancient kernels.  If it helps, let me be clear that I'm
> not looking for "support" in quite the usual sense, but I have what I
> think are a couple pretty basic questions.  I've tried downloading and
> searching through the mailing list archives going back to the era that
> the device I'm working on was originally developed (2004) without much
> luck.  Google hasn't been much help with this either.  Of course it's
> possible I just wasn't searching for the right things.
>
> Basic questions:
>
> Q1/ From what I've read, before MTD, JFFS2, and mtd-utils source code
>     moved to Git in 2006, it was in CVS, and snapshots were available
>     here:
>         ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/...
>     That doesn't seem to work any more (hardly surprising, I guess,
>     after so long), but I'm wondering: Might those old snapshot archives
>     still be available somewhere else?  I don't see any mention of it on
>     the current web site.

Maybe David knows. CC'ed.

For kernel stuff, see:
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/

> Q2/ Is there anything you can point me to that shows which versions of
>     MTD, JFFS2, and mtd-utils were delivered for use with each Linux
>     kernel release?  In my case, I have particular interest in kernel
>     2.4.26 -- so would it be possible to, say, find the mtd-utils
>     version that corresponds to the version of MTD and JFFS2 used in
>     2.4.26?

Usually Debian is a good source for such an information.
...or any other Linux distro with long term archives.

> Slightly more detailed historical questions -- if any of you are still
> reading, and happen to remember back that far:
>
> Q3/ The JFFS2 code in 2.4 is referred to in several places (web site and
>     mailing list) as stable, but does anyone here know/remember whether
>     its "on-disc" (er, "on-flash") format continued to stay stable after
>     2.4?  Put another way, how compatible (forwards and backwards) are
>     JFFS2 images between 2.4 and later?
>       - On the forward side, if one upgraded the kernel on a device that
>         had been running 2.4.x (x >= 26) to something later, could the
>         file system be used as-is?  (I mean, without risk of an ensuing
>         mess?)

We try hard to stay compatible and use versioning. So I'd assume that a
recent kernel still can mount an old filesystem.
If not, please report.

>       - On the backward side, how dangerous would it be to use a 2.4.26
>         kernel with a new (never mounted) JFFS2 image built with a later
>         version of mkfs.jffs2?  (Not that one would deliberately choose
>         such to do a thing, of course.)  I've built 2 or 3 different
>         versions and found that they generate much different images from
>         a constant "source" directory tree, but I haven't yet tried to
>         dissect the images to understand the differences.

As long you don't enable newer features in mkfs, it should work too.

> Q4/ The JFFS2 code in 2.4 is also referred to as well tested.  Is anyone
>     here aware of whether that extends to the area of random hardware
>     resets / power cuts, such as might be experienced on embedded
>     devices without reliable power sources?  I see there were many
>     performance improvements and bug fixes over the years, but are you
>     aware of any data about relative reliability -- on the same hardware
>     -- of JFFS2 in 2.4 vs much later / current, say?  (I believe "on the
>     same hardware" would imply nor flash here, since 2.4 didn't support
>     nand.)

You *really* don't want to use a 2.4 kernel.

> I'd be happy to explain what sorts of colorful pharmaceuticals I've been
> into that could cause me to ask such questions, but I suspect the above
> may be enough flame-inducing stuff for one post.

I'm all ear. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
