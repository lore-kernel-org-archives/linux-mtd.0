Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B685AC31E5B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 22:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C89520657
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 22:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PKkzSYuZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY49b7Wk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C89520657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37K1vY5mKYD7SPH84JTOsZKX1LpnFZ5/ogtn0Le2AYs=; b=PKkzSYuZrmxUgm
	ZwDavljUsguv80Ih+GEAWCsjSaZRzB0LGj/juI04J2MQFzsitDsx5zQBb6BmuZ9efTH3w7wMshk9l
	gHlqZ/IQkgSG9YlVXGIazUqq9Q1aIaoZwQtGa1u3G8SXCA2hU8hXldQAe7fXaFDevPuaLneFjJyIb
	c6gyhLQFt0/9wCwepF1da8hC2xVLkNg3W/KP2Wvbg911CvxWeQftBAsWLVSOrHCYxlGH5WSgFnD0S
	V/Gu8X7ttKZ7jOjhv/Yk3vEuIhVdB62p6Su9EWvtwWLOMmAKCqoMbDacLgsZuZm/rFlzscRsxy0Pw
	9xuq5hjoGfxUznIPo/ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hczuT-0005LX-P3; Mon, 17 Jun 2019 22:15:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hczuR-0005Ko-Cu
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 22:15:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id p13so11665243wru.10
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2019 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOxrv4Z+duhzHk+Vvgki6wKRY9I+T3teV7bGXJE2hg4=;
 b=aY49b7WkuTfBi9s+q3YkqPFoksMYySMOhjBU6L7c9cc3C7zQp4p2+UV4mY95F/0+JH
 tL2UKDIzzhClKL9WqK/0Xcgf5BKsw0fpZTFv4wGWckmU7Bj/9XiimGYc94tZJV6KoFnl
 beS12Vz7LfpA7sRaj1tu2a0eGRfqM+Vka0dXZ83xvafIRlOdvEhQIXWECXaxI/fR6zaA
 hwTrx3seR9v6J6808XBpeexTzC0DeRJO3yWEKo945ztZeW0s/8p43ED0XsQdd7h3kqk5
 acZlzLfwvorsKhYzrGPaUSAchILthJH/N4thVd/F5xGt6QCD91vonSWuuI5keLuP7Dab
 6okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOxrv4Z+duhzHk+Vvgki6wKRY9I+T3teV7bGXJE2hg4=;
 b=LDFVmNglFMZqdAFZNmPurySNbpEH0mrKkrcd8n9AZgl5g0uGDIUbwvIqg9SlbdP7xW
 Yfj7GOJih8cBIwKtZcUioTEEwxoVt8AYEUNSfvFV9Mt8abK56/Fii+6mqqWQsH4KW/6F
 ZeXgXw6QXYnZihPJaOZBKgusoNQcT7/AxRYNnp43aoeHgvBtPThMKI9lYhgQhMDlzD2y
 B6yJEtG5UZDFrr3UcOdmKhZlo8CQzHQBVmQcrvKOVqm1GWS3dBwcKnQCG2XnIr74kYJA
 AfmbvxRzqN15ebcIvS4hsuV2wYPbmmIH0+5UQVDijiIVChkwsiZoMiGqPDRojRd0UsMU
 bxJQ==
X-Gm-Message-State: APjAAAXWgV+uoO3wevtlFG9iCkbBCpLkcAfBwFjM9AfgFQC1p4vXnHy4
 g9yS5B9R6mFU6BK5q46eaAU5cn0cgjNFpJfizTc=
X-Google-Smtp-Source: APXvYqzIRENvbCsYIcq6eR/PMaPMcy9DkvAWKBfar8wlTlCUFzrbGjxFQHJKL/sWdXUH34woXRKOQ0zdzM7JxnWZL1U=
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr33675436wrm.100.1560809726001; 
 Mon, 17 Jun 2019 15:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <1558024913-26502-1-git-send-email-kdasu.kdev@gmail.com>
 <CAFLxGvwjqo27VQ092WV9=6N5RJr-M7aL0HYVWkeaCYbY3XWa1w@mail.gmail.com>
In-Reply-To: <CAFLxGvwjqo27VQ092WV9=6N5RJr-M7aL0HYVWkeaCYbY3XWa1w@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 18 Jun 2019 00:15:14 +0200
Message-ID: <CAFLxGvyGFtacE3mgZ03zrOeF2S24KdtGj+Qy-3kmA2wbRhNJYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: Add flag to indicate panic_write
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_151527_466600_05A7F52E 
X-CRM114-Status: GOOD (  19.20  )
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
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 17, 2019 at 10:08 AM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, May 16, 2019 at 6:42 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >
> > Added a flag to indicate a panic_write so that low level drivers can
> > use it to take required action where applicable, to ensure oops data
> > gets written to assigned mtd device.
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > ---
> >  drivers/mtd/mtdcore.c   | 3 +++
> >  include/linux/mtd/mtd.h | 6 ++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 76b4264..a83decd 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -1138,6 +1138,9 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
> >                 return -EROFS;
> >         if (!len)
> >                 return 0;
> > +       if (!mtd->oops_panic_write)
> > +               mtd->oops_panic_write = true;
> > +
>
> You can set the flag unconditionally.
> If it is set, it will stay so, and setting it again, won't hurt.
>
> >         return mtd->_panic_write(mtd, to, len, retlen, buf);
> >  }
> >  EXPORT_SYMBOL_GPL(mtd_panic_write);
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 677768b..791c34d 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -330,6 +330,12 @@ struct mtd_info {
> >         int (*_get_device) (struct mtd_info *mtd);
> >         void (*_put_device) (struct mtd_info *mtd);
> >
> > +       /*
> > +        * flag indicates a panic write, low level drivers can take appropriate
> > +        * action if required to ensure writes go through
> > +        */
> > +       bool oops_panic_write;
> > +
>
> Maybe we find a better name for it.
> panic_write_triggered?

ping?
I'm happy with the overall approach.
So let's target the upcoming merge window.
Can you please sort my two comments out? :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
