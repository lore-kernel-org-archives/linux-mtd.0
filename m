Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D17C4CECE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 01:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03132217D9
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 01:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ulGHF0n5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="g+3axoSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03132217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.us
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+ki1TF8PmSAZhkwWx68A1apAcG3iXOlUd0AWSDFYJg=; b=ulGHF0n5mlgqRb
	i5u7Z7olJD5AcOAGlMFn4NyI3leI+ie4lf1fQrcnqeRJXxzQrb5i88MDgwD/tPtlXyBl8wNdq1cBv
	TH0ZdS9x+E+MS8jyJKyB/KjNQPSTsqPg50RJVJNtzem3bitq4YOEz0sqFen+/a9tJ31ojdoGL9AzI
	7HlbZxlHydJhFqH9uGJi5zgiXtoH4NR+GSWcb32l9l1otEpTfafynpaED6e3CCaAMSnIyDILYwKR4
	7gfexnZTB/W2AmqC1nYawputPziIwOEBGEO56uPQnEHei+FF5wCopGfXrX/Eo8bdFGVRCIpf01Kp/
	3LCcUhqNirHTEmapg3ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKBDA-0000s1-GW; Tue, 15 Oct 2019 01:01:16 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKBD4-0000rS-2v
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 01:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1571101266;
 bh=AjsYcAUyMyBw0FSRMUXhbPdEtdwbpvzJlddZzm3BH18=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=g+3axoSaGizGXxsRjjlPBQ4VY0cOMm1nyEdn+GDXnKQKQNZ1FJ+b06kWBsHhEq+95
 Vi7U07O+U0lznE/C2XiFmGpYvrFP8x5XQUbkK+TcCDwZWsPV54kniTWtazDMrFx2zR
 xOw4MtWpxPsmXCZ56ppr1wWkE5TyphxXToYXagzk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from wde002-08 ([67.173.104.214]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N7zBR-1hyg9T43bH-0152VW for
 <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 03:01:06 +0200
Received: by wde002-08 (sSMTP sendmail emulation);
 Mon, 14 Oct 2019 20:01:03 -0500
Date: Mon, 14 Oct 2019 20:01:03 -0500
To: linux-mtd@lists.infradead.org
From: don311@gmx.us
Subject: jffs2, mtd, mtd-utils and ancient kernels
MIME-Version: 1.0
Message-ID: <1N9dsV-1hx2G70tCn-015aTM@mail.gmx.com>
X-Provags-ID: V03:K1:3XGtzv0lkYerOhAbGZtKbYF4boij7pY87K9pUcREDn1IBqfV9vd
 74idEZlJHvJhKqneLsWN/vTbtTQYp/T4rMPLz87JtkFpLGoIg2VuscFJthLVSC+1X5oXCKn
 6WM6i5g4+IMHY2u5K5D98+Bv3U+hgsvmR/Xqwmv+koWhQ7DPDli90+UrvWt1YrrHXmqUO7E
 zKtGBJrRZ18cBaqWhBMnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9KRTxhwbxVc=:2Htv9qlAvQaR4Zc21Q8pGR
 Ck2gH10o8DSyxJQE57Qtlx/XuACB8K8MoQ07DRc5EKpFbRMrHs9ePvnMunfXIgcWQelwojYNE
 gfGDZpiU6dc1SQqsf7wqVVy53ef5RyVBl6UcgUgYfWVDIggtJnzTvGvUetxW4eHL5SAX3t5f9
 xOT66dRkJKDpolbGcgUVn6xUIm8m5R/aaAiX3pcvOoJN6FkKABU5cyVtiq0Gc3duFxZ+/4h4E
 dCW/II+bRMqhhgGWtMB9cOkLrkIi4+wFP33HaVs6im+Z2sErE4na5kyLTwB4StKZurOGnSzFE
 O0Hk4t06AnoGgQy8K1Wm2ovPhhnmi0ZpUose8PSZls1BcbE5EDrz2R/JmbMTXdvMhfW0hKyzk
 Q+44TeYxy1Uv1POUcQWZfjkcP7NnwV5jy4XM/3vIMonw+4fX9bzXKrmjqDPWK1PNUxc7kl7Xq
 IRMvWUUYHBsnOnsSBPATOxFLgewkxGpYsIBrMGe1TmMzSB1L0rA7XxCCQvY00paGueDW121e2
 ch6nYWLWYfauDzE+NRNqX5jfFx2olXbkJis63TBncU4oPOdeyou6WobVg3plIV955T1xzf+iS
 lSqK2uM+1syoviK3JPRatiORuXg/m5MMwDQIQp63OqzP2yDAhmRojfAkxWkvVdvRmUjYyO6tQ
 V2r8Kcp+QS7FuWIY/BbJAjdkiODMEGQG1KpwQtedEnHe5+gv+QIXZSW0v+qGYmpXaNUU7Sz9M
 0I0LB5fo4g17aaYGSDWfTSPrRNHc3A80SSb/elZZA6PKascN6R/T+EXDS1Kaw7i/yZ2bzVIw3
 zrfWCJY6nGkutJbn3LAL6GO36gEEjELXriTCqA3REzsAzWM3kVE4T5NCMY8xVc9B7T+TriMWl
 D2Gf/1N2Wmn/kLlRRIM4OWL7JGBrsUMIZIRldUZhjrgAySKZO+a9o0Fjw9a5wmTjqaAQVFmMg
 nfWV8QcThGgGrjdpbk4BVLu0ZlWDz3DDKYfp8GV04WEMp4KDsILm6bOJ9lmJoNzoEXtOuUtNM
 38HAZpyNX96/g4x3VaJ4SnErbvtcJEP/6DNNydxtJY1AmCqca5wopfaeNnF0kapbuwqdFvC8r
 mbuKBMu6y2WPbD94+XiO8ffVCDkSFCqxcyeyQTzDG3/Aeb5xgD1ELmc0ZGrMlY83RvRfDvIpC
 yh5iXVt5gqXjcOtBJzyuZhbGxSYvkAgQJ+r8My5OIoOSDiJXY+qcT6ELKdzvgQl8+BgZqptz6
 vB1Ofw/CWYYGbhaWR1yXn74Uc6jZuxE0i1o4N/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_180110_423156_864B4DE0 
X-CRM114-Status: GOOD (  16.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Greetings,

I apologize for writing my first post here on a topic you've made
abundantly clear, for a long _long_ time now, that you have no interest
in: support for ancient kernels.  If it helps, let me be clear that I'm
not looking for "support" in quite the usual sense, but I have what I
think are a couple pretty basic questions.  I've tried downloading and
searching through the mailing list archives going back to the era that
the device I'm working on was originally developed (2004) without much
luck.  Google hasn't been much help with this either.  Of course it's
possible I just wasn't searching for the right things.

Basic questions:

Q1/ From what I've read, before MTD, JFFS2, and mtd-utils source code
    moved to Git in 2006, it was in CVS, and snapshots were available
    here:
        ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/...
    That doesn't seem to work any more (hardly surprising, I guess,
    after so long), but I'm wondering: Might those old snapshot archives
    still be available somewhere else?  I don't see any mention of it on
    the current web site.

Q2/ Is there anything you can point me to that shows which versions of
    MTD, JFFS2, and mtd-utils were delivered for use with each Linux
    kernel release?  In my case, I have particular interest in kernel
    2.4.26 -- so would it be possible to, say, find the mtd-utils
    version that corresponds to the version of MTD and JFFS2 used in
    2.4.26?

Slightly more detailed historical questions -- if any of you are still
reading, and happen to remember back that far:

Q3/ The JFFS2 code in 2.4 is referred to in several places (web site and
    mailing list) as stable, but does anyone here know/remember whether
    its "on-disc" (er, "on-flash") format continued to stay stable after
    2.4?  Put another way, how compatible (forwards and backwards) are
    JFFS2 images between 2.4 and later?
      - On the forward side, if one upgraded the kernel on a device that
        had been running 2.4.x (x >= 26) to something later, could the
        file system be used as-is?  (I mean, without risk of an ensuing
        mess?)
      - On the backward side, how dangerous would it be to use a 2.4.26
        kernel with a new (never mounted) JFFS2 image built with a later
        version of mkfs.jffs2?  (Not that one would deliberately choose
        such to do a thing, of course.)  I've built 2 or 3 different
        versions and found that they generate much different images from
        a constant "source" directory tree, but I haven't yet tried to
        dissect the images to understand the differences.

Q4/ The JFFS2 code in 2.4 is also referred to as well tested.  Is anyone
    here aware of whether that extends to the area of random hardware
    resets / power cuts, such as might be experienced on embedded
    devices without reliable power sources?  I see there were many
    performance improvements and bug fixes over the years, but are you
    aware of any data about relative reliability -- on the same hardware
    -- of JFFS2 in 2.4 vs much later / current, say?  (I believe "on the
    same hardware" would imply nor flash here, since 2.4 didn't support
    nand.)

I'd be happy to explain what sorts of colorful pharmaceuticals I've been
into that could cause me to ask such questions, but I suspect the above
may be enough flame-inducing stuff for one post.

Best regards,
Don

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
