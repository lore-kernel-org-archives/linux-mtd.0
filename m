Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA51C83000
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 14:36:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23712072A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 14:36:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSInmRP0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxKgmh2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23712072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MF97Ln+TF+YIQgTmfznLP4mGcX4DFjA1IKmojQWwYnI=; b=QSInmRP0tDe+M6
	u4u2L+p5Je0WMmxItkob/JFTz2SXzduIt4XaBjocVwZkcTQhmt1AO/sDKH8x+SHA/ZyevWpg884k8
	HjKpP6lhArhQgY4JTdtHKHmK81V99RXrbgINnpqfpsf+/NxfZEHm25G2vmr/rxV9xh5VrBLscmJl+
	Ip+lFKNEuautCNkOqsRJKCjlrvA8VJZB/CHVL9aUKeN5odZQc9IiqbTsPgHAZVCorBeXJv2SPzSDn
	DfWLWZ/NijxIOFw3JPXzqjoyrYPthdMKjG0pUV3SOJby8/0OY0YlKR60fpsEUMn4qZDewO1FdihkM
	6YD5P0k9Y9nhw7eLKBHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUAIN-0007A6-No; Thu, 30 Apr 2020 14:36:11 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUAIL-00079e-Lx
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 14:36:11 +0000
Received: by mail-qk1-x742.google.com with SMTP id t3so5905718qkg.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2020 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyEXwRucx4mm4wQMLcdV/oiMdpSDEqK2+vdd9PnWzls=;
 b=DxKgmh2xnqGaexyYSSV7d38wQ7jyg0HP9vUc1pCva9auVgioqfTGEjn4IA4aUof2Bb
 2sHkuz0UOQ5pjrDrKGVsKzXm9/ZDA8u8knjrsgz4CTO/OfA6rJ6vhYtuYTx4fVnoytsk
 5r1+ANHt04XmCCLIinqXw6wi5yisAjTTaAp42+klKPD8SoY2bJcGY7qXiEBbMSbzfOpV
 aCVM7dzkvq9dIXTMCxP+MvQ6hTrHmvlP6yA6fawFQ3cJBbjvFsCIxKlEzdxO5OgQXkhD
 aUUE+nV9UXzV75v2rYA7ecc6etwmH6wlRBX4sbx4fFQfS7IL9Lu61Hu8XmhO22YDgXRc
 hJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyEXwRucx4mm4wQMLcdV/oiMdpSDEqK2+vdd9PnWzls=;
 b=ahZl/RCYbkCuxeGVkBGuW0wBRMsCrDVH6vaMRYdwcAlU0NdL6DIEtDqac888iwU6kH
 u54SQ2aqaVs8DuT+eU6E+S2Bnrj7ntZZgWZeGujfDdA2vhnKWavLJ/mejug7scyOkNTP
 cj6TQYxcwGFPwRPkEidV/CChOgO4qd9fWpyxoBbqJ6iyYv94vCqGUn6UyLhL8UZKgmtj
 zPNpDjGkiFTN+zhWQq79H5Wg2i3l1CYn+jzaaG9GPHwsvovwOOBIWrTzGnYM5Iqb8N0W
 nyStn1VCSqQyWGaHq6zEXKpkRzhPDtncKRWnb572GIJHedvl5v5USUK4Ti+0jxZ+4hOB
 02dA==
X-Gm-Message-State: AGi0Pubf0K/tQElQ8WcSCbgZiumi9dpbBZX+jINoUfpdv1fwqjVuSgkF
 vjok3lQYuBJqeiFPYdtwv8rn6fbrR6AqUErnCCg=
X-Google-Smtp-Source: APiQypLQHqDUa/AINF6/kfhKskTrRKC+FA3MhzFBdKZw0T6tTmZpnVYw7BjJIa/gZaP9UmfMoJgPCeSzVYfCeSb3sx4=
X-Received: by 2002:a37:6287:: with SMTP id w129mr3864787qkb.34.1588257368032; 
 Thu, 30 Apr 2020 07:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200113145622.18357-1-arne.edholm@axis.com>
 <CAFLxGvzEHdxDKfNnDxMXAd0Fct2Yo1+sJDmKfT8eUwUDukRYXg@mail.gmail.com>
 <6b360811-a227-c32f-f9a5-660bea4861c3@axis.com>
 <24ef4730-83e4-ff91-21e8-739153a44a8e@axis.com>
 <CAFLxGvwNxNkwdiovrWQzDfPNr9t2WnXU2VNyNs5caFNZ1WsySQ@mail.gmail.com>
In-Reply-To: <CAFLxGvwNxNkwdiovrWQzDfPNr9t2WnXU2VNyNs5caFNZ1WsySQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 30 Apr 2020 16:35:57 +0200
Message-ID: <CAFLxGvyTnsk_dGdozQp5OYYyhJCiAD4Yxiy19=-05jRX1oU=Tg@mail.gmail.com>
Subject: Re: [PATCH] ubi: Select fastmap anchor PEBs considering wear level
 rules
To: Arne Edholm <arne.edholm@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_073609_741374_833B3900 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: kernel <kernel@axis.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 4:29 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Apr 30, 2020 at 10:34 AM Arne Edholm <arne.edholm@axis.com> wrote:
> > Are you satisfied with my answers or are there additional
> > information/changes needed?
>
> Yes. In the meanwhile I did more testing and with your changes the
> anchor PEB selection
> is *much* better. Testing took some time and then I scheduled away to
> other stuff...
> Critical workloads are these where a fastmap is not written due to
> heavy write load,
> but other events like volume change/creation.
>
> A good reproducer seems something stupid like that:
> for i in `seq 1000` ; do ubimkvol -N test -m /dev/ubi0 >/dev/null &&
> ubirmvol /dev/ubi0 -n 0 ; done
> Wearleveling threshold is 50, btw.
>
> Without your patch, the erase counter of the first 64 PEBs:
> 4    4    4    4    4    4    4    4
> 4    4    4    4    4    4    4    4
> 4    4    4    4    4    4    4    4
> 4    4    4    4    4    4    4    4
> 4    4    4    4    4    4    4    4
> 4    4    4    4    4    4    22   4
> 4    19   4    4    4    4    4    4
> 4    4    4    4    8    908  906  1
>
> And with your patch:
> 95   95   95   95   95   95   95   95
> 95   95   95   95   95   95   95   95
> 95   95   95   95   95   95   95   95
> 95   95   95   95   95   95   95   95
> 95   95   95   95   95   95   95   95
> 95   95   95   95   95   95   95   95
> 95   95   95   94   94   94   94   94
> 94   94   94   94   94   94   94   95

While observing my own mail on the mailing list I discovered something
I didn't notice
last time on my terminal.
If we summarize all numbers in the squares it should be more or less 2000.
because the test triggered 2000 fastmap writes.
But 95 times 64 is much more than 2000.

Your patch produces almost a perfect distribution, the overall erase count
is three times as much as it is expected.
Hmmm.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
