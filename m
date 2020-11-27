Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65FDC3E8C5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:17:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E99A22245
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3fPekrl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToKoCtwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E99A22245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MijBVD8b7x/rpMSoloNbxyjCIKGH8djSO2KNolqgbMk=; b=R3fPekrltXTHVR+20Ddt3EraY
	omq0qb38V8g6oUUxnkRKJKc4LZlVlvypzlGrChkW4U2hkYC6Ze7m8lJIBLjd01faoWZsXlTaB9/OQ
	t+fDpsYssZqBbBabsT38qLTK0mo/yo0mkwVR2+T2dRrZ/lsmvn9QxxL59+JXYigqPrum4zN+3RA3G
	HsHMIxgeu/XHqI2VvCaRpqWVrhrory4zvjVJC8sa0mVTv5r8k3Lh36Wnqv3wks2vVIIhPdQhWFkht
	tM174/gRYCK4umYK4tbkqC4Z3HC8ujGGJPyr7BsSmfJHK6vj3dS0YHooNi/n46hbn02B7M42xgUWM
	uPRDi0e+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kihMt-0007N7-94; Fri, 27 Nov 2020 17:17:11 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kihMp-0007Lf-9Y
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 17:17:09 +0000
Received: by mail-ot1-x342.google.com with SMTP id 79so5262680otc.7
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2020 09:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fVf1+D1FitCmzDCqljbAyGPy2s/xJk5tkKzZBsWqVg8=;
 b=ToKoCtwL5hrCEbaN1epEGxz/qIabnwThN4AoMKbt9bAZDVg5Ev2ATQfgVdNXlmtvfX
 biCWTB+b1EKb9p8bSEKJWCxN0WfFwejxuMiBuBDeF3xs9oXgcQWfPQSD0V77rU8P5uqt
 SBDV/kA3FIFd390L+H5szLjGIR1oIxiN+56vKhFPEVhLFD85U6KGSSOmVxJkuK1Z/w+R
 uxRXLGINPxkU3SPyVMwZt5e/hY4Uzfi1WME8U9tQMeBmRiLjVMQ1MGHHCTTQleg+dYCp
 b+Ck+nsvHxDZ3FCwLEM/tJhJsg4yfNHwkbgTEFqIy5rD45Z6O2Sh6jrl/X/2ppijiGaC
 4zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fVf1+D1FitCmzDCqljbAyGPy2s/xJk5tkKzZBsWqVg8=;
 b=o8okQxGqfIltJijfhDK9p/TtYghqCnF01VSiq70fD+Svp7rdwM5Gxd9wLi3heu5hxK
 I/tkwUOcRMd9JU8c8QgD6NwferA3u38020QZlqORrb18zUg8YojKTw4W1dMAa9c9aL6E
 KTLuFYtm3sz0sAhUyyp6pV2J6yjwgTzmCf/aeWhOqeQa60PfKfBCw/0E8UR7F2D8SCMf
 gWKEwaL65oF+xIplylx2yJ66T+L8dk5Zg56DUSUdy1SVeUAjIMjNwc6HGl2LWK0kTFL6
 vXUFJDyxAXQf97eRZgcEf4xNvR8RvxcwEufTO9NNCNugp99RE8lL2DblLiOTKVkkSgyi
 P00Q==
X-Gm-Message-State: AOAM532mSv/8uM7C/ZSqv2zIlxaQBBDsZ+jgzC6YQyLjif33H5kJ9UlX
 PNzVvBVz4AmGSLvTL6A8tJGpXQUiwhNvPIKYbWY=
X-Google-Smtp-Source: ABdhPJzxVnhEqWmwFdGU1bsYOr7tgQEutpm8lSGGPb+njqBUECMoiOZ1IA/9ZfeZKoGt5uAgNB1ZyNyKSVqee4Lp/pE=
X-Received: by 2002:a9d:889:: with SMTP id 9mr6794559otf.6.1606497425150; Fri,
 27 Nov 2020 09:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20200429165347.48909-1-rminnich@google.com>
 <7171837.EvYhyI6sBW@sven-edge>
 <CAP6exYKEN-sQXGxTC1CSzfyuYmbbMPHKEosCP7DciFTLOhAFCQ@mail.gmail.com>
 <2666350.AiC22s8V5E@sven-edge>
In-Reply-To: <2666350.AiC22s8V5E@sven-edge>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Nov 2020 09:16:54 -0800
Message-ID: <CAP6exY+hHrVvaMcF2tWUUJT=JS_J9NHx=92DzO=GAN==ACSh1Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
To: Sven Eckelmann <sven@narfation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_121707_637327_1818B6B9 
X-CRM114-Status: GOOD (  22.31  )
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
Cc: Sasha Levin <sashal@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ah ha, I see how different my world is from yours :-)

My world is linuxboot, which means the command line is always under
control of linux, as linux is my bootloader. So this kind of thing is
very easy for me to change.

Let me go back to the initial problem and hope I can make better sense.

The original problem was that ':' was used to separate the device from
the partitions. A problem came along in that PCI device specifiers
have ':', and the original parsing code broke. The patch that caused
you trouble fixed that by using the right-most ':' as the separator
for device and partitions.

What none of the people involved in the original patch knew was that
there would be other ':' in use. Sorry!

But you are right, my idea is a complete non-starter, don't know what
I was thinking.

So it seems your patch, if it works, is the way to go? I can't think
of anything better that lets us preserve current behavior and support
PCI device specifiers?

Ron


On Fri, Nov 27, 2020 at 9:06 AM Sven Eckelmann <sven@narfation.org> wrote:
>
> On Friday, 27 November 2020 17:32:02 CET ron minnich wrote:
> > I'm a bit worried about how tricky this starts to get. I'm inclined to
> > go back to an earlier implementation which used a character that had
> > not yet been used (iirc I used [] around the PCI ID in a very early
> > version). What if we used, e.g, a single ! and searched for that? It
> > need not be !; pick a character. Just something not already in use, as
> > the ambiguity around which ':' delimits the device has become an
> > issue, as you show.
> >
> > Almost nothing in the original patch would change, save the character
> > being searched for. By using a character we'd never used, we'd avoid
> > breaking existing usage.
>
> What? Doesn't make any sense to me. The mtdparts shown in the the commit
> message is as it is. I cannot simply change it because it is in the control of
> the bootloader - not the linux kernel or me. So I can also not introduce a
> different character like ! for separating things.
>
> KInd regards,
>         Sven
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
