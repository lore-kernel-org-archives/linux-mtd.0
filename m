Return-Path: <SRS0=DDRD=FR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425A4C4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Dec 2020 22:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D6120798
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Dec 2020 22:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D6120798
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QtDCDtsYrmO01VW6GeY/MaJadf2qWlD8670oID6ptFo=; b=yPj9HSdyoerjtFcAQ9An/LPNq
	QdPutugVk7MnN39xhnLDcTgiFhMm9GlQ6cAYKXoF40qM3kO20R4ttqCc/CeibGGic3Znu3gPdPd4a
	+VMe5+/PtYiHNNDZccCMuagco5EGkfw/PZxgyO6OAfh+K0xPWAxOpSYYpeEo+rPSyHYpboagZGxC1
	FPmEO8omcIkFA1eYJoH1DXwrOD1x+ljOCOnKQkgXBszmBfeimTSTYTiLX3J8M5BHPM8XEJOWxPArP
	5ZDwZY9B4APSBY/dXtTE1nUv3bwOkJhCjH1mDRQTMF5TIk7sQkTMLcPOu4sMnD4O2QuLcKAu7t0o9
	QO6c9tXOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koZlT-0006KH-1b; Sun, 13 Dec 2020 22:22:51 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koZlQ-0006Ju-5p
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2020 22:22:49 +0000
Received: by mail-qk1-x744.google.com with SMTP id 143so14009762qke.10
 for <linux-mtd@lists.infradead.org>; Sun, 13 Dec 2020 14:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5+vLfFDvNakSqCOtqUMmjeuD2oJjrTqFBik/RumbYg=;
 b=pKFQ3rsAVTZGSkKZ56Ej2uDnh3330vM32jS+/M9FHwxxfn/rcSonfF2lEjJC0jd7Lr
 VAOtuRkzWAeqpg79l7PumKyDZEwGvJ8euhkQ7WQSIsRLf6SIvj4STR0jvyzklORraC4d
 8Y1XV9RyiiFYySt3CMlr6inxVr3GOapSMMQJ+EzZCaZyMYRbbZPIL3GU3pXtB4ZfmqVG
 PUMMlT7cMgYX9mnFCHceh8n3tT4TDMmQlZJHl7jMzU8uNOiEXXldlnPZZrR8n1oD3Gup
 h3NiLg8cATH0Fc4eUrtgXU4XjcGAW+H3GA8QUS/mWQdetHvVdCp6qOaxs/cDmg5tsguw
 a/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5+vLfFDvNakSqCOtqUMmjeuD2oJjrTqFBik/RumbYg=;
 b=EgxJIrRvYfai+V1olBkWoNTwoB49lMjECCgoSq6+F+4a26yID994epi/nhfk8u+Td9
 OC28jysUrwbAz7A/6Y3K/Ud2izSTg96tsl4+uFDY/48NotLit/vPlIZnBjKQYfhtfmA/
 wiri7WzAvxW3q2HXHsW86mSdnHTaRdZwbX4++O6bqyzH2Xtt4nyoCqNi55k8slBWnnE7
 fpsNdaAcPvOFJILJ7qG5CrAD19+61FC1v/2FNeAbHOvRCtT+6w3gR9fA1vWOtCsyg+Ld
 PtelXZQoQqsp8NlK5fra9FWF2QUguC5TWFAtBgyiztdJH8uhJQB5llQzX16qQH0m+bOV
 7YNg==
X-Gm-Message-State: AOAM533ymxduhpmba9EfVzavpsk9tHdmeuU6+hHebXYIVjb/t52UJ4g9
 8fZ5uMOJmlwn4GlLWQb077y61QjRJMZK6u+oKoM=
X-Google-Smtp-Source: ABdhPJz8KXbOpPSeBP+31xP0mmE2+4h+400j9puNLy2kH+QGFG8U7j3drWnHtlfWvKPm7KgH8sLGcUHTfN2IM/6RKXI=
X-Received: by 2002:a37:9a4a:: with SMTP id c71mr24828882qke.56.1607898166358; 
 Sun, 13 Dec 2020 14:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20200911102321.22515-1-colin.king@canonical.com>
 <20200911175514.766eeaf1@xps13>
In-Reply-To: <20200911175514.766eeaf1@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Dec 2020 23:22:35 +0100
Message-ID: <CAFLxGvy9LzJmNshqkxoC_kuVLJztgBDhfYPjkBUWtwd1-9UY-Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: remove redundant assignment to pointer eb
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_172248_279334_F58CCAE2 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 5:59 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Colin,
>
> Colin King <colin.king@canonical.com> wrote on Fri, 11 Sep 2020
> 11:23:21 +0100:
>
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Pointer eb is being assigned a value that is never read, the assignment
> > is redundant and can be removed.
> >
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/mtd/mtdswap.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> > index 58eefa43af14..795dec4483c2 100644
> > --- a/drivers/mtd/mtdswap.c
> > +++ b/drivers/mtd/mtdswap.c
> > @@ -1053,7 +1053,6 @@ static int mtdswap_writesect(struct mtd_blktrans_dev *dev,
> >       if (ret < 0)
> >               return ret;
> >
> > -     eb = d->eb_data + (newblock / d->pages_per_eblk);
> >       d->page_data[page] = newblock;
> >
> >       return 0;
>
> Yes it looks unused but perhaps it helps to catch the logic here. This
> is not a strong disagreement but I'd keep it this way. Let's see what
> other maintainers think.

This looks like dead code, let's rip it out.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
