Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7782C4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 08:43:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD41613D0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 08:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DD41613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESsCbstis5cRZZI4bS9o9iWS8GdB81BXUi+c0zULsRY=; b=eu+HsbzJDQjENW
	VV41d5bpEiceOikyLYJNjvsZPmhHVhbzamfFIMlN5tP0npylDB6kvAGU5ZhPTl8IDTmLSiO2DjlwQ
	IbmVtcACkK9ElIWXVDnPmQlHytxqS1bvjVAynIysu01x18ADtqYaeRhkNc/DzAEtxoUBQDX24r7Md
	j6SLOkz//iEm0BucY0JXM8gJE1QoWD9z9eJu7/yGVnsXZrSFJp2mt+aVTqO9nwBoz7HaWJL5KxmnL
	HdrFFWTm836U0bbAFY4JGTckKtH0o6/GL80HNzLCLUpBHrVySb8+NuGTyv2tsJq9JAVXnqS9p62zx
	F+4h+rIoFplLMzBG1QJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMT5-002kAO-1u; Wed, 02 Jun 2021 08:43:15 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loM98-002bc8-Ir
 for linux-mtd@lists.infradead.org; Wed, 02 Jun 2021 08:22:40 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id f15so643171vsq.12
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jun 2021 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8yfjKGpbcry1gy+VbnjIMZhB7vFgB7ByKAj9f3nL3k=;
 b=gGCQTsNl1/mGvD+hdnwMUxBrkG4V9Z5n5U+vVeH6Iuy1vYOwiUw5R38SRw2xT/u72g
 x/PHvf0igbudRwskvrzfIf0YAlydQlzaIOaAEQeiguoB5RdFHxiLZDtMFgvw5jijVM67
 z7nwvsO99p6jtenEUqDAyeNPw1fw6LPuczfqoLCN5TP82DG7fAUxd2VsGy4YdRHUzxuo
 dICZBVi0Xwd6voNntZjHjbMAbpvho7BaKqctrD0muwIsctyyzmgtC77cqG31i7k0TvlK
 uE75rHrg+PPJmoPYYQU8k2z2MePOdGXsAEJxPVze4hvqzq1U8NymXQtlrAZ6XdXy9pDy
 KrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8yfjKGpbcry1gy+VbnjIMZhB7vFgB7ByKAj9f3nL3k=;
 b=atPHN1/fUkCXABX0hwJPmBNyvWs4qjVNT1k8tQRUh/HgUB6qEhmyYyU12QjiEdbkRR
 l2Nmo0JTyQnZl0ajfaGIf0EHyN5peMkEenT87whoJovjhVlCxzn1JstYMgzFc+VQOV8m
 w51sflfeuUZtQ6tu8PPx1+JUJZIq1BBIOAge/XumplFifChCm6Haj+nga5z9OA6EQjT/
 QurLCX9PQzzV52DKj90OgHX4RJK2zds46zKBPbyzmpyGSp1JQL2Bm+66AnHFd77h4ysm
 KFcyyR+2FzZNWuKt0HR7po5Zdp6Joe0A+ukqnHl2rl8kTKXChqCtOv31PkUiw0huC8/G
 QLnA==
X-Gm-Message-State: AOAM5312tZ5EGuBFHZXMTS+kQgCVv9a9H0bXyiuom/PeMeml6Vekq241
 h3iziVZKA3PRC5N+zwtP1Nc9Edot+zERNbDlFM0=
X-Google-Smtp-Source: ABdhPJw1hdO4skd62IajXZeshiWckh7JR9LZvHRyBJlSdVBan8XXPTcJ9FE0IpkUIM7VhV2kGb+LjrellwajlBcbTqk=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr24087498vsl.9.1622622157119; 
 Wed, 02 Jun 2021 01:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <1619341721-5580-1-git-send-email-jrdr.linux@gmail.com>
 <24534cc6-e6dc-feda-1e2f-b9b3501845d9@infradead.org>
In-Reply-To: <24534cc6-e6dc-feda-1e2f-b9b3501845d9@infradead.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 2 Jun 2021 13:52:25 +0530
Message-ID: <CAFqt6zbX0bOgqcp_575p4T+qTcycS2AhEmrAkZ7+hXrC-K4QfA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: Minor documentation correction
To: Randy Dunlap <rdunlap@infradead.org>
Cc: miquel.raynal@bootlin.com, Richard Weinberger <richard@nod.at>,
 vigneshr@ti.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_012238_677251_720760AC 
X-CRM114-Status: GOOD (  20.57  )
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

On Sun, Apr 25, 2021 at 9:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/25/21 2:08 AM, Souptick Joarder wrote:
> > Kernel test robot throws below warning ->
> > drivers/mtd/nand/raw/marvell_nand.c:454: warning: This comment starts
> > with '/**', but isn't a kernel-doc comment. Refer
> > Documentation/doc-guide/kernel-doc.rst
> >
> > Minor documentation correction.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > ---
> >  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> > index 79da6b0..e7b48d4 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -451,7 +451,7 @@ struct marvell_nfc_timings {
> >  };
> >
> >  /**
> > - * Derives a duration in numbers of clock cycles.
> > + * TO_CYCLES*() - Derives a duration in numbers of clock cycles.
>
> Hi--
>
> Did you test that?  I would be surprised if kernel-doc stays quiet
> with that change.

Sorry, I missed this thread. yes it's wrong.
Reason -> I posted the wrong patch.
I will correct it in v2.

>
> [testing]
>
> Yep, kernel-doc doesn't like to see that '*' there.
> That doesn't work.
>
> >   *
> >   * @ps: Duration in pico-seconds
> >   * @period_ns:  Clock period in nano-seconds
> >
>
>
> --
> ~Randy
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
