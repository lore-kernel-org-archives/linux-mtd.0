Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D0DC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:32:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BFE206D4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jgECc1Yw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+SQbJTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BFE206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9enLwOKI2EEmylVeBlH/zgstDSUQMa++k6MBFjKFMiA=; b=jgECc1YweO3+9j
	afGmx8qbgoNXLM8K8wOqlOIeyv9wdacsSDOuo7raU2LGq+lQiAXFGYC3wO8x0qvQvsvQ/FiQakpXl
	Bm3B8DofZ92lheP643npVir/TRoXLTrT2sMbMBKdNWbnWKImlWtuXltasnLRbMItCGIwS6HEpb3/Q
	0yL6fcxXWPeU0RS8eVS/kzvgfMANJLQOKVneZgQW7jz2563xi0VDFsTUQ0UK6zfoE8PZ1Y1B4vJR1
	i579OM8cWWCXo4r7Rz0xiydKe3cqJuixu5kFEPFK2dgliu8DHGKAtjQ7PuKvz9w1HHlMUMYr8qeqc
	JboZ5rbjIQWj7h+1Z4kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTAPy-0001WX-HA; Mon, 27 Apr 2020 20:31:54 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTAPu-0001Vv-SB
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 20:31:52 +0000
Received: by mail-ot1-x341.google.com with SMTP id m18so28618699otq.9
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 13:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHJm8Dow1JUwWVweEAB+eV5JN2e4A7jii5GhXrO+/Lc=;
 b=E+SQbJTw+BfIqh9gBbxrhg7dZl9AL7DGG720N04tqAVFtN6H12qR1B2Sk3wpW2x1v7
 cucxDUk1T79cVHU4NCkOAdr08NtD8T1eN+IWwEUkUNnE0XGhMrvqtkwSSr5JuTMRz2q4
 Q1t2qasI/EfBD+ub2D/XAAQPnbv40sApIxn9sDHs9c+ahFn/rQYTkleLiuXgqWK5kaiV
 oUTPCK9TVrUsxutBBlcudeD212Ynkn5Gidd3ZyLTgNMyvDsam59jTLaNcXOrA5ALf/uF
 HT4ObLSM2IEjpTpbyAQDEUq/KESq89YS0TNoDP3D8jP3STPdfTmi9VOiWkaugMzaRIaE
 ZvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHJm8Dow1JUwWVweEAB+eV5JN2e4A7jii5GhXrO+/Lc=;
 b=K7uuEvnTMiPKBqBGrdIW8iU+gbu1QTq5LXLDl4BXT61gJA6Vc3fwOaknhru/GR3pi2
 RC8JObLV7vKFAGbjnuYTPvAse6IohTrfXbNq2tu39W+2NHjMhqa1pSJQP9sYdFaxRj14
 UXC9sybLCrLRF+G2V4bbJMkAt8e4S250RtElxMZu2acs9bkD5HNAqf8DPr6b+UpEaBq0
 gD05KZ/OOHQ2ZIBMa3iLowSxdqaoeMqLdV5B7VJF90o5xysuuS+p4c11IoSByAN6vBd+
 oK5zFZ92NP6ZYLxlEcGGOA1Ce7JQnDWOHj8j/C+JpCmMZMfG1FDGt144ItSSUO9S+aXY
 xhow==
X-Gm-Message-State: AGi0PuY30bY9LT01/ZYus+c/rWJGE0ZglZWOh54n6ydaQXaSA1eywIkO
 y5xkr8iNWAGnqE4MSeIqrlwfipUeBoH4GTndMXyvHQUW
X-Google-Smtp-Source: APiQypL+OxMWKSWsHfoT+7S33aIb/HGXxQ0CJsGNE2EW7AaPO/RYg+vlfe6bNREUaMl5EHVIrAsG35iZNQAXDSyNqbU=
X-Received: by 2002:a9d:1429:: with SMTP id h38mr20199805oth.285.1588019507182; 
 Mon, 27 Apr 2020 13:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com> <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13> <20200427111623.5f93842d@collabora.com>
 <20200427114954.4fc0e8fc@collabora.com>
In-Reply-To: <20200427114954.4fc0e8fc@collabora.com>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 27 Apr 2020 13:31:35 -0700
Message-ID: <CAP6exYJnKjzvC1g1qa8Odxg=HydD-CVbcz9yPi93Sbdg2K+bfw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_133150_962250_56F8FEDB 
X-CRM114-Status: GOOD (  40.32  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 27, 2020 at 2:50 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon, 27 Apr 2020 11:16:23 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
> > Hi all,
> >
> > On Wed, 1 Apr 2020 09:41:48 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > > Hi ron,
> > >
> > > ron minnich <rminnich@gmail.com> wrote on Mon, 30 Mar 2020 08:53:22
> > > -0700:
> > >
> > > > On Mon, Mar 30, 2020 at 12:27 AM Miquel Raynal
> > > > <miquel.raynal@bootlin.com> wrote:
> > > >
> > > > > Would it be hard to support an extra ':' after the MTD device name?
> > > > > This way would would allow anything inside the optional '(' ')' but
> > > > > would keep the trailing ':'.
> > > > >
> > > > > toTay:
> > > > >         mtdparts=name:part1,part2
> > > > >
> > > > > So:
> > > > >         mtdparts=(0000:00:1f.5):25165824(BIOS),-(squashfs)
> > > >
> > > >
> > > > I thought about that ':' too. It does add a bit more to the code, and
> > > > a bit more in the way of error cases. I always worry, when code is
> > > > going into flash,
> > > > about errors where something looks close to right but is wrong. (says
> > > > the person who just typed it instead of is a few times :-)
> > > >
> > > > What if we did this:
> > > > mtdparts=[0000:00:1f.5]25165824(BIOS),-(squashfs)
> > > >
> > > > Is the "]" 'enough different' that we do not need the ':'?
> > > >
> > > > I kind of like the [] better anyway as it makes the mtdid stand out a
> > > > bit more from the part names? But is it enough that we don't need the
> > > > ':'? Would you still prefer the () as opposed to the []?
> > >
> > > I like the [] as well, maybe more than () because at least it does not
> > > conflict with the partition names. But I really prefer keeping the : if
> > > the code is still readable.
> > >
> > > It is much easier to explain to people : "if you have a : in the name,
> > > enclose it with []".
> >
> > Sorry to chime in so late in the discussion, but I wonder if any of
> > that is necessary. Can't we just split the string per device (split
> > strings every time we see a ';'), and then find the last ':' in each of
> > those strings and consider everything before that last ':' to be the MTD
> > name. That should work even if the MTD name contains one or more ':'.
> >
> > Don't get me wrong, I'm perfectly fine with intel enclosing the PCI
> > address in [] to make it clearer, but I see that other drivers use ':'
> > in their MTD device names (the atmel raw NAND controller driver to name
> > one), so I think it'd be good to make the mtd part parsing robust to
> > this use case.
>
> I just gave it a try and the following patch should solve the problem
> (only compile-tested). As I said previously, it doesn't prevent you from
> enclosing the PCI address in [] if you think it's clearer, but I think
> the problem should be addressed in the cmdline parser anyway.
>
> --->8---
> From 08b30597dd73efd9c4c8d1906ab02a9540875419 Mon Sep 17 00:00:00 2001
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Mon, 27 Apr 2020 11:44:50 +0200
> Subject: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
>  more colons
>
> Looks like some drivers define MTD names with a colon in it, thus
> making mtdpart= parsing impossible. Let's fix the parser to gracefully
> handle that case: the last ':' in a partition definition sequence is
> considered instead of the first one.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/mtd/parsers/cmdlinepart.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/parsers/cmdlinepart.c b/drivers/mtd/parsers/cmdlinepart.c
> index c86f2db8c882..0625b25620ca 100644
> --- a/drivers/mtd/parsers/cmdlinepart.c
> +++ b/drivers/mtd/parsers/cmdlinepart.c
> @@ -218,12 +218,29 @@ static int mtdpart_setup_real(char *s)
>                 struct cmdline_mtd_partition *this_mtd;
>                 struct mtd_partition *parts;
>                 int mtd_id_len, num_parts;
> -               char *p, *mtd_id;
> +               char *p, *mtd_id, *semicol;
> +
> +               /*
> +                * Replace the first ';' by a NULL char so strrchr can work
> +                * properly.
> +                */
> +               semicol = strchr(s, ';');
> +               if (semicol)
> +                       *semicol = '\0';
>
>                 mtd_id = s;
>
> -               /* fetch <mtd-id> */
> -               p = strchr(s, ':');
> +               /*
> +                * fetch <mtd-id>. We use strrchr to ignore all ':' that could
> +                * be present in the MTD name, only the last one is interpreted
> +                * as an <mtd-id>/<part-definition> separator.
> +                */
> +               p = strrchr(s, ':');
> +
> +               /* Restore the ';' now. */
> +               if (semicol)
> +                       *semicol = ';';
> +
>                 if (!p) {
>                         pr_err("no mtd-id\n");
>                         return -EINVAL;


Tested-by: rminnich@google.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
