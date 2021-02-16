Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FE4C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:12:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0AA64D9F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0AA64D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iKN0uYrYUJ9i+6xqFA0zdAaffJf+HCJOnFMH8Sxn3BY=; b=E3ufga1fK6JxnEQdv92lIpyme
	iLwiuWBbDIleMoaqxmIEcMUYFxTv6CcL2jzvFzmc4InNr8OEcOPTK9/lLq5k6bz1HqdUoBXlyx5J3
	W69iKmhnW+GjY1WuwZEd4j/aRGkoDbrr8sNdHs+Rta978bn+dZ17ageU7qa65IIBuTYO+XmFaspLF
	3qvmall7gXMT0x/dquZm5uDLaFLeSQY/lfBPA611J8zpDQxZHzVTPSyKUCdaTc3WryKuWp5EPmbkF
	kC8ky2otnMjoKlk43wfYfTrunvfomgp0DReYD2C8OMmvu2XjBLV6tWcVROV5ZH8GWYqO855g76lct
	kUzrs1FGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBwOH-0008Jd-7I; Tue, 16 Feb 2021 09:11:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBwOF-0008Ip-0E
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:11:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id z15so5761764pfc.3
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 01:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PdNZztHmJx28lm1YqPNW9/HMTJK3XzFZq3cJHhEcHYE=;
 b=YduCyImG8fvCNJ0Ln/GZcl1hAv48xJw1jreTDfYpxVD8y7K1Pha+O1+bP1I9k4a4Zg
 wdSwcd7xqamfxneaxTHx5RXG8zl2MiTItG4Arbrb69mF4CrIhqcMMPzRxWlrUpCVFmes
 Hb5vhimAiIZVj/msqenF0msWoqk1IS3iP2FYKDZ1WxNeoq7SGNNwHtFMsgLQyUNeeoXe
 yr2joY4unXXLA+b5h23YqqCJz/rFtcVoWFelo+e/R4CZSeK6Y2QeR6mRkm3iyymyrETm
 jqAkHGzScg1XnuvvdZRXQ3mr0oYvHJDvd0BlRxfgUbabsQE1K0x3WnHedaw8V2q6MW0a
 Fj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PdNZztHmJx28lm1YqPNW9/HMTJK3XzFZq3cJHhEcHYE=;
 b=eoKXV6O1iUrkHnPPnpYF211lZ9LZ3lLAjFrHWXxpewOOSe44B7xuKbcW+284MrnMvf
 OcRMV/tDwgw0aP4e1l+eNKCtuxZZs6FZQOgg7ISVLUzsYRXS6d8eEIlWLgOPDqGTcJlK
 UQHZ23lx99dZ6KqhxNjPmZVez6vsgTrj74rZnruVQhVO4rlZN0bOY9fqYVEM/k0QQxaA
 sm/j3aoRX1UQMydiU8IOvTZjJRGDwHz8PiFif3MzjMIUxwDULwMM3DrX4Lfqms2osmn9
 XjpmEXkg0pAbdgpuu3aehmyV4svxAcM+8JdUFqpb/AXpkM0+pj5qKOYQgL/crk5BN2rE
 KYGg==
X-Gm-Message-State: AOAM532UArPZFD58bDP54Ovl0U9ssRVUvrny+RZg+W6UtjED4Yn4tIQ2
 yZzs1NkKEiwDEMiJyTTQOsoMusXUgh0qAqlW96E=
X-Google-Smtp-Source: ABdhPJy0x8KyOvfVQ64PSQs8w5E55gpQxMn2DaDOG4tqdJnQrhRnAVxYyCUWBUdqxAUIJSGNmaK4x42OCc3U+rJNNew=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr19254746pfk.73.1613466684665; Tue, 16
 Feb 2021 01:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20210216072334.7575-1-jbe@pengutronix.de>
 <20210216072334.7575-2-jbe@pengutronix.de>
 <CAHp75Vcha++UUE6hw0n_pBnA24q_uJQekABSSktmjCoinfpSoA@mail.gmail.com>
In-Reply-To: <CAHp75Vcha++UUE6hw0n_pBnA24q_uJQekABSSktmjCoinfpSoA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Feb 2021 11:11:08 +0200
Message-ID: <CAHp75VftQ6y58w+D6=nSwx3DRcLH3iwfx3RT8yv6rgS8O6OWHw@mail.gmail.com>
Subject: Re: [PATCH v2] fs: ubifs: set s_uuid in super block to support
 ima/evm uuid options
To: Juergen Borleis <jbe@pengutronix.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_041127_062109_1684BCB5 
X-CRM114-Status: GOOD (  21.00  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Cc: Stephen

Stephen, do you have a check in Linux Next to catch the problem that
Co-developed-by is not being accompanied by a corresponding SoB?

On Tue, Feb 16, 2021 at 11:09 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Feb 16, 2021 at 9:24 AM Juergen Borleis <jbe@pengutronix.de> wrote:
> >
> > From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> >
> > This is required to provide uuid based integrity functionality for:
> > ima_policy (fsuuid option) and the 'evmctl' command ('--uuid' option).
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> One issue below has to be addressed nevertheless.
>
> > Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > Co-developed-by: Juergen Borleis <jbe@pengutronix.de>
>
> According to the documentation [1] above has two issues:
> - all Co-developed-by *must* be accompanied with corresponding SoBs
> - commiter must provide his SoB (but it will be implied by the
> previous requirement in this case)
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
>
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  fs/ubifs/super.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > index 138b9426c6c1..a8383ca39a47 100644
> > --- a/fs/ubifs/super.c
> > +++ b/fs/ubifs/super.c
> > @@ -2230,6 +2230,8 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
> >                 goto out_umount;
> >         }
> >
> > +       import_uuid(&sb->s_uuid, c->uuid);
> > +
> >         mutex_unlock(&c->umount_mutex);
> >         return 0;
> >
> > --
> > 2.20.1
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
