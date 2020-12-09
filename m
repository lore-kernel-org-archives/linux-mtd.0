Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA06C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 21:35:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD73023B51
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 21:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD73023B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7nZOGojVNrRT8ihxWBgPB7QMc/R7JJ7AfDhYOGX0K4w=; b=JhpJVo6H62kDQtL2wf18kJ3eo
	wRdvpigUXgx3TPXv5OT0bGVaY10p8Ibn1KVhIUDfI4IxqBd60uN3egk23IWoETuurCmVOW+0JjIgf
	3l54i5W5TyJgLd6321/f1WgyPwUJZXjq8Zn8gHoZ3yNXEFwXl5UYupIgWRdjKXrCVGcNbxqCAmnWM
	P6X3CgLMWdbSpms8AdIEGNniAF+GBPnbyS45CRpncYGueWAw8EXKO+w1Glo3E8mU54JlacLJsHgOW
	db5pePRczLqU4F6VjBvV8Uk+W/M5RU+JiQaila3o/4O0bx4iu/29ubQB1A63iSLOo6V0Oe3pl4ya0
	l4KNbVVrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn76Q-0005lf-Nb; Wed, 09 Dec 2020 21:34:26 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn76K-0005kv-95
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 21:34:20 +0000
Received: by mail-yb1-xb34.google.com with SMTP id o144so2211793ybc.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2020 13:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WoBbCW1j0xXBMJt/PT/2gTRPKTDTWPngtH0+ZXt3d6c=;
 b=RwoRHgTy+IuZ6UWgisfK9RVBoQr1osv+GkgdBadEFRg7/Q+XNonWDvgCNCtYa3V2V8
 v0v9DgbyfjusCfAG6DLmY06TjbkZiNwuUYSJtD4NtLOycTapfhuQs6rnNVqw/NuA0cxE
 oqkwx5ceKPOnkpM1W0NWSefUhW89pEwHVqR+Tyi6w/zfACeRkTrQwn6UbAEaNz9nQMiQ
 5/O1qyf5atirDnGT5QYhDXmCbdLvXC2t2poZwxFZbb5YMGltS3pHrKJB1pE+HDte7J3t
 SCzbkN6Yy3FPwCHGD/gHRFTEbG2kNM9M0VKjXu4nBihI6BwJfBu7E17pG4NXSFoBteTk
 JkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WoBbCW1j0xXBMJt/PT/2gTRPKTDTWPngtH0+ZXt3d6c=;
 b=dFzsHD+mlArtH8zRKNnROEt9/8PwO7ji+LGBadtr4I6p18Z8T9ELDL/V6WVAu5+uYg
 ERFNrNeFSSYVznp6Ngaqy1tJsgoXYoQ7vZhDUOvLC6e5l4Rkp0V+J1vE9y0KtFU32qMv
 ct6/aCJuPGAsjATZT9zecuMyF2h3mn4+0WMxTp/Nprd8d4tmlm4z+SHhYMsMEx3zB/Hi
 NiEUODnThWmgmum2ggi5RywGQCrR5DBP9houstS1PC36VC69Jdc0CPpsjK1vEwDoioEn
 UI6ereK7PfL4iQcanG4OXfhpDy3ZrDvKWTYPnytbntyDfcx/2WiZ0ZSAoRldp+tVZpGG
 Qm/g==
X-Gm-Message-State: AOAM530IYbXYx6XFSjHR+qceAw3qrLDlbmKpoocIvRVkyV5yevPbNG5z
 oaqmty1Z53Tdo1u4vrVE+R+ycYN3PDspW54JIv5vMINFuIz8sA==
X-Google-Smtp-Source: ABdhPJwuapOrBFJ9X7Jy0LnnrbSGVSx0sVQ5aZeHVIo3eraDHa2ESu3HF6TKTzB4RAZmXwejsYnjUIRDCFT5PTJ0LTk=
X-Received: by 2002:a25:3ac3:: with SMTP id h186mr6095641yba.155.1607549656265; 
 Wed, 09 Dec 2020 13:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20200429165347.48909-1-rminnich@google.com>
 <2124367.HovnAMPojK@sven-edge>
 <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>
 <2560223.mvXUDI8C0e@ripper>
 <CAP6exYK75zwqhtrMykMqPepPfq=S95UEByy61D136aPKCBBSRQ@mail.gmail.com>
In-Reply-To: <CAP6exYK75zwqhtrMykMqPepPfq=S95UEByy61D136aPKCBBSRQ@mail.gmail.com>
From: Ron Minnich <rminnich@google.com>
Date: Wed, 9 Dec 2020 13:34:05 -0800
Message-ID: <CAPAv03O2-hgx=-5bKcBy9hdK4apb9wzeO3nbLNT_ZJuJgTQWhw@mail.gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_163420_353270_2E713AB3 
X-CRM114-Status: GOOD (  10.91  )
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
 Richard Weinberger <richard@nod.at>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sven Eckelmann <sven@narfation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested-by: Ian Goegebuer <goegebuer@google.com>

On Mon, Dec 7, 2020 at 7:24 AM ron minnich <rminnich@gmail.com> wrote:
>
> I pinged the person again. Hope to hear today. Sorry for delay.
>
> On Sun, Dec 6, 2020 at 11:52 PM Sven Eckelmann <sven@narfation.org> wrote:
> >
> > On Friday, 27 November 2020 19:54:30 CET ron minnich wrote:
> > > Thanks, Sven, for your patience, I will indeed try to test this next week.
> >
> > Any test results?
> >
> > Kind regards,
> >         Sven

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
