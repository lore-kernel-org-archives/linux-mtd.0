Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE88DC43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 23:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843512071B
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 23:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HqvDEmED";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsFEgnYW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 843512071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAm6M/eb1MiTTTVO5WXj9rpa5UdVJGpRYYzJRlKqdd0=; b=HqvDEmEDe4tTMe
	FekHQZzcJ0NgWl6eNrmYyrX72heSgEgFqpARMV5d0wAsbEqE0ujTBhAy+7FAiWJbf2PQT5lPS4Z7j
	qa1yOgCtAjmgiZXHINkeSKAuy6zVkplSJcjBhvWzfwJNK/EHnm2rqfRDMNMNhRn7vrk9D0luupQjj
	l109vde2rLKeEvr6S+Qj2CbhxRBSFk1aD/PcVWfz5XG84+sNiS1P80G9P4SzZS+FGiP/7vA9P6dLk
	StUwgdpxgnZLP1KSyAGVgGYH+L6lPAgZ7GW3wN/bZXKkLW1y5480rbJM2Fy2jg5v/pIYuVhRwBNja
	bNoRAAwSOKOhRdPfotAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHynM-0001vK-4L; Fri, 27 Mar 2020 23:53:48 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHynI-0001uw-5t
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 23:53:45 +0000
Received: by mail-ot1-x341.google.com with SMTP id t28so11664752ott.5
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2020 16:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpS4kZvUD2MseUDA3I2yHsqj6O1iq/YpSdfztbWAfdQ=;
 b=nsFEgnYWjD6w7/zTGN3/QMD4yhtoA6OU4clpQgmFbg2KGVNOo+RvqC2yu7a3JXAj1D
 8AOiYGMY78b6Z0BYk8kyg8N0ABqzO+eXIQ4Ljmii0lRBhrtk9p1DCzughRInctkuK6lZ
 +IWYD2M5kLq1zyAWEeYUx8w6pPkikfuFtz8BGCSseNqPViPd/cQlgIBjXeTkcb7NT0Sj
 QcBoTv4v6cb1BP5/c2XS3MgZeU+rnJjN+Yf4sCaoyddogV3hS70/HUSt38Nz/Stl805+
 G4L+ygYFCb6aRCfKqDTZJKpRGw1qYLRyqZPZnYpkySSEbwWhvjlfcVG0SpLygpsQvxWw
 /Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpS4kZvUD2MseUDA3I2yHsqj6O1iq/YpSdfztbWAfdQ=;
 b=T9M2iJ3+BDN0scPSPd77/834F/Vu/dQL5CoCgScCzIg8cfiB/5Kh8jTRKM38QXERVQ
 w0gLv+IyQhHKh+6PLBOgCj7WyTguBzbkzj7GzBgC0juL6d3yGSAIQC7DANzaqjVPlkMZ
 ewC9v4TtYG2l/qthJal303L62NOEXMqRhrzg6rTLhEc1oawr2Lr00Ya3GU/hddUX5uj/
 w3a33R+MWSN5bNH5msk6eqsKFvs254QXzX9dQHvNcayfGfSSkbwo5/msrDnGp6kHYOY9
 7akThTOXEjMRbDsAx+zp0L/qRt+kzt6UU387rfdmhmc8PpvfKAK989CJ0h2nHAVfIbzG
 mO2A==
X-Gm-Message-State: ANhLgQ0+N3D0cU2ey5Do2D5E6DOb2zfZrTvlJKbfNlfjlbwV4z3Ytjuj
 WqMKdTDpvVh24w7hf2SONPjQfoIhg5HcmbfCpRU=
X-Google-Smtp-Source: ADFU+vtLf9WbFFy/EDrkIqrRzDIMWLkJ1SHNzp1uYIvzdla3Re7CV1P/nn03A8vqddZOAt+g59+vRqcpmI4Z6w+gjgE=
X-Received: by 2002:a9d:414:: with SMTP id 20mr969737otc.300.1585353220054;
 Fri, 27 Mar 2020 16:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
In-Reply-To: <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Mar 2020 16:53:28 -0700
Message-ID: <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_165344_246165_A813B3E7 
X-CRM114-Status: GOOD (  19.90  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

OK, I've done a quick prototype of using () as one way to specify the
ID. The mtparts can look like this (tested)

mtdparts=(0000:00:1f.5)25165824(BIOS),-(squashfs)

The text in () can be pretty arbitrary; only ) is disallowed.
It's about 10 more lines of code in cmdlinepart.c and that's it.
Further, the existing syntax is still supported:
mtdparts=id:parts

what do you think?

thanks

ron

On Fri, Mar 27, 2020 at 10:39 AM ron minnich <rminnich@gmail.com> wrote:
>
> yeah, :: is not so bad, but you've got a lot of corner cases as you check for ::
> mtdparts=0:
> for one example.
>
> Covering all the ways things can go wrong gets messy. You can pretty
> much guarantee all those corner cases will get exercised ...
>
> And people are going to mess this up and end up with hard to debug errors:
> mtdparts=0000::0:1f.3:parts
>
> That could be a hard error to spot.
>
> I still wonder if we should not just define some character as
> available in addition to :. I realize | was pretty awful, but ... is
> there some other character we might use? I kind of like the simplicity
> of the current scheme; there really would be no issue had it been
> almost anything but a : :-)
>
> But if the sense is that :: is the way to go, I can give it a shot.
>
> ron
>
> On Fri, Mar 27, 2020 at 10:16 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > On Fri, Mar 27, 2020 at 10:05:52AM -0700, ron minnich wrote:
> > > I did try the \ thing but found it a bit tricky to work with, with
> > > lots of potential for simple errors.
> > >
> > > It would require cmdlines like this
> > > mtdparts=0000\:00\:0.1f:etcetc
> > >
> > > A lot of these mtdparts definitions are produced by scripts and
> > > Makefiles and there are many, many places where \\ have a way of
> > > vanishing.
> >
> > Right. One option would be to use the printf() style escaping and make
> > :: to be literal : in the same way %% is literal %.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
