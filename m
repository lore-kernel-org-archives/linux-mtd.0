Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE4BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijG9FxETD7V12vFiNvNfsgfwgTEK9r0IqrB0A5xCJes=; b=4FQj5p7zWYu7J0
	qpOmuCi8yGNCnqol5+8XgW96hbz1X8Ht07xYyQL4XB2mxSJlyBcwTF+WLYZORrAXBclk4N5kGmjvL
	24ufF3nJedjPbuufHrAB7keEOCpLkOPgEyShmGluZlL5RQub/KP9LaGDWTzyhA5VzFBteDTUjfw+O
	pAI+NycX2HQv7s3+WW5dpn0CjoIYjmLtWf9rpXxOjXelgOihqgBcpFfOkJHEZiSX04r3pD2zhCLC2
	HbCD3kxtZd6tssgxOVydSmvLnNIbQ5CkV2lj/ODLZ4XsiofXwhzH8E/ep4YJCQv2myD9Mj8hqUicr
	qAt2h8KktZW63AsvbLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3P1-00FauR-PQ; Thu, 27 Jan 2022 11:57:23 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3Oy-00FasQ-7N
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 11:57:21 +0000
Received: by mail-ua1-f48.google.com with SMTP id y4so4298029uad.1
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 03:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tvGDpT8/9f6NY+qTA9tlw75Wn9As8gwMs90t0hZ73HU=;
 b=xATjr5Y7eIWWu/YshNiskkl4kadBBWUJZa9Okftj7Fa1qJwe/psrcN4Qptyhmn6pRj
 iz6CUha10tiEmO/rKE3Mk5bIGMZriCeAGlRUZAfztfIMNXtFmdfUu8UWmrLnbez0W6cB
 yTkioSROSmiQhots9NQTvK4ntpGD8X1vVIy7818BlCqtQu/H5xua+b5JfcLOz3e5GE/Z
 Z5IzWPRHFKYyTJj5UOqMLKCihN/7VV88CI7SZrSEZPnIg5z/8vmpilFTzw1xygOAVs4X
 ggX8Z/Laqx74AMvI77oyKeQLVmCHgmQL4vOixuJ+n6LMhfxfFbQpXqWhUSbn2F/4jfN8
 njgg==
X-Gm-Message-State: AOAM533AiV5IgHMopqQuZ4AjJFARm02e5UGvc70BZr9CqWm5DFaDC+nE
 AAYOR9rvyNR1udY5wLm3Besd/Gx05Zlbug==
X-Google-Smtp-Source: ABdhPJyYtrEIku9XAhpJeICQgTwxZXANMSJLUbT7Qoo09zKokofkUhj1feYpCGlmZd7YjoYuas5nuQ==
X-Received: by 2002:a9f:36c9:: with SMTP id p67mr1366741uap.19.1643284638685; 
 Thu, 27 Jan 2022 03:57:18 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id 4sm498185vsv.22.2022.01.27.03.57.18
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 03:57:18 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id l1so4221420uap.8
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 03:57:18 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr1434119vsj.5.1643284637952;
 Thu, 27 Jan 2022 03:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
 <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
 <20220127114647.0ec44ced@xps13>
 <CAMuHMdW0hKqk8aGiNy1Pd50aTu_rb_ewdiV9GXTkPJOm=zA+HA@mail.gmail.com>
 <20220127121851.68d1c91e@xps13>
In-Reply-To: <20220127121851.68d1c91e@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jan 2022 12:57:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUG+FNUmxi2eSiCeyjr-a1ZHoBi4BFVGuFczq4E0Hjd3g@mail.gmail.com>
Message-ID: <CAMuHMdUG+FNUmxi2eSiCeyjr-a1ZHoBi4BFVGuFczq4E0Hjd3g@mail.gmail.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and debugging
 purposes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_035720_289698_383188DF 
X-CRM114-Status: GOOD (  31.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Thu, Jan 27, 2022 at 12:18 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Thu, 27 Jan 2022 12:07:31 +0100:
> > On Thu, Jan 27, 2022 at 11:46 AM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > > What about letting drivers/mtd/mtdcore.c export a simple function
> > > > mtd_check_expert_analysis_mode() that calls the WARN_ONCE(...) if
> > > > CONFIG_DEBUG_FS=y, else providing a dummy?
> > > > The backtrace will identify the caller anyway.
> > >
> > > I took the time to address your comments. You're right a single exported
> > > function is better.
> > >
> > > However I don't see the need for a CONFIG_DEBUG_FS check here, if unset
> > > the boolean will stay false forever, I believe we don't need to bother
> > > with it.
> >
> > If CONFIG_DEBUG_FS=n, there is no need for the code or the export,
> > so the check can become a dummy.
>
> Agreed, but I truly don't like using #ifdefs when I can skip these, I
> think they darken the code and prevent good build coverage.
>
> Using if (IS_ENABLED()) is an option but would not bring the memory
> savings that we could expect with an #ifdef, so I don't see the point
> here.
>
> Should we use unlikely() to give branch predictors a clue about what is
> going to happen?

That will be thwarted by the out-of-line call to the exported symbol.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
