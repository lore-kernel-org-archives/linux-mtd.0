Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B3DC43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 20:30:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65432084A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 20:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="af05S/ho";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="v5c8EusF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65432084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rtuIYBpglHNbLm52cNNtczyL7kzV7CF1BEyR2ilwAc=; b=af05S/ho+G0iQR
	Kq8Gh/f9l+1c1mnNDSUY+jr492DtSQ+gpt8tGB5xpt8TMgWWIBndcwDIynEFhV/grMGLaj3ygNM0m
	/OE1lLDkjsHgasaxTf11R1qSwx55ZCB+gcuxBnxmYNRGpK+aGxvrDZ5Xgx8iZ+YPLdVQyZlM5OgHI
	eYObrFnN7Zi+dgnqcyZnFaRqHPhGHMBwnOsOXaSmPAftAHEMImAFmNcXIUICwxpezVwaooV/ZcNDQ
	HCUWeGLLoZq4BD8rqoXcAn5eIZFZIg/Z/zBfauWKIaADOF3mnpdBwFJHPPB1thK5MDOASXb4gsg3F
	kVuXQBviYujy2A5/ts8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he3h4-0002az-IE; Thu, 20 Jun 2019 20:30:02 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he3h1-0002Zl-1N
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 20:30:00 +0000
Received: by mail-pf1-x442.google.com with SMTP id j2so2300581pfe.6
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2019 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2JEFir2f91v73nekkwcA/r3dp6L112/g4gH1PpqAdrc=;
 b=v5c8EusF9ITFTP4DK08HqE6nXYSl1rHuc1AHqHehPJx12PE3Zc2nHCkX/AWSdZ6FZF
 nQmrtwYX9mvK74iIh/t7AJdwKr/ILOsZftB+QSk4XRjzwt9ZCkxO3d0bvLu0E0NziXOl
 cWxHDGYAYDxM62VFRLzgZGnB+r2Zza1EXnWoVeO0h1o/iPsLdfMTlaWLCnDLurQ5GIqX
 jJDzIC8A9KSE3naGVZmDZRqldU9EZFXFww8hJz+qfnqeppgUePTRjE6yLrBTsf/q0+9s
 +mFkOY/xucJj/h1hsXJzyh6iWZJXpp98u4R6rbaQEcLR+h87PqRwHT3L1l/Ak60kqga6
 XBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2JEFir2f91v73nekkwcA/r3dp6L112/g4gH1PpqAdrc=;
 b=KGksFBYJepEmTewsFwjGlwbAfQs7m1U9wkcFO2Di4iAHLEYD+Mcn79k+6aSqdeE8/W
 mTsUipeojQeGtSd2jFRMhYGlDyo7Ou1XPpexUTm9yx6JC+GhV9CmdP4MDkn59aQw44lu
 wt2yDJBWBPJXFXEXJEta2X14f7Oc2t34p2L0ERk36nQU6x9s5YcaI82bW7L+4Maxg20E
 tNMI4oiAtivgprDHh3qb6qaInfjNFkRXV5oSKXvz0YM4H00l9fxGrsxGJ4chySTg7Aeh
 bEKGL6JWBUHUoDVH8nQpZC60/9Q9dZ8irZGUcEc8zUwx/jcRaco8+CZUUDWVLTou1vx3
 p2RA==
X-Gm-Message-State: APjAAAXHiPVo8vE9MFpS9CV1wowOY7n9FUaw+cbGjOx2tgfofaGUokfr
 Jj0sf865uAtzF1U9nTC0a8lPdP5Cgu6gshpZ2wn5hQ==
X-Google-Smtp-Source: APXvYqz9YdnYhDW70Z3csaomKtslVjyTnCmLX2S88WyqkoxdnVU1AOktxDryJSI1sQQGT7nNmjuI/WkfAL7KmOM2fR0=
X-Received: by 2002:a17:90a:bf02:: with SMTP id
 c2mr1529248pjs.73.1561062598008; 
 Thu, 20 Jun 2019 13:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190620155505.27036-1-natechancellor@gmail.com>
 <CAKwvOdk7ZTcWEXPTBASPzk1SjOdnONawtQJkR-jU=REFSo1hVQ@mail.gmail.com>
 <20190620201549.GA65397@archlinux-epyc>
In-Reply-To: <20190620201549.GA65397@archlinux-epyc>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jun 2019 13:29:47 -0700
Message-ID: <CAKwvOd=okFdfSfGpXTAUqyF=vfnaZFgdwHC-i+CnaFxGSh2Thg@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd-abi: Don't use C++ comments
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_132959_105645_EBE577E8 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 1:15 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Jun 20, 2019 at 12:56:58PM -0700, Nick Desaulniers wrote:
> > Should there be a fixes by tag?
>
> Normally, I would have added one but this issue has been present since
> the beginning of git history. According to Thomas Gleixner's pre-git
> history tree, it would be:
>
> Fixes: 7df80b4c8964 ("MTD core include and device code cleanup")
>
> but since that hash doesn't exist in the normal git history, I don't
> think it is worth adding. Of course, if the maintainers want to add it,
> I won't object.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

LOL good point; I wonder if the stable maintainers have thoughts on
that or how they expect us to signal that case if we even need to do
anything at all.

Either way, thanks for the patch and
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
