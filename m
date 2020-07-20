Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B443C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 21:29:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01433208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 21:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tz+U1mgm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EulKUbZ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01433208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cunPbIDmdBf1256sr4kqVjWoNitbgUdq1phXaYU+rEI=; b=Tz+U1mgmEG3TnTbxgjRSBunO5
	hI/5UDx1qkHZ+1ynX6W4XUOL2h/FFwPM+US+j5VjIwPjUT4izzJ/7dER6JdXvcY/qpJg+0N1WLLWY
	70YNqs9F9c/rYs7SMBRPcEKI+Q+BpRKSZpx/1zUeTDvIQl5Jl7+3SQzBVWMG+P3E9sc0yxvnkxTsy
	/0mNW18cv53T76f6/5Qtu0PZbNmjCQS3yw+bbLj6scnhUzXRZNa4Mh8N9tHkx2yOVLfDc5jdGr3Qt
	w1k4K5I9UCCUWd9uAtr3yNamP2RUANpujMHmIaG0qo1zeE8bYDXd90+5iQK0rJ/vBNEXuv0Kt1M6a
	6NHNVVG7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxdKX-0000n5-7W; Mon, 20 Jul 2020 21:28:13 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxdKU-0000m7-Rc
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 21:28:11 +0000
Received: by mail-qk1-x744.google.com with SMTP id k18so17195264qke.4
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh/KLSzQqnJr0/PMf2DmO5rUtVYfFwMH4ti+obo2a7s=;
 b=EulKUbZ0padoY58Gz7BUn19Q8Hk6KEJaTssCqM4lILM7IAI6zewfZh8oqNUoUyQoQB
 7NTznTeKJycRqCHBebiJHdUDc3dJuXT4oWkSqv7Nd8vAXT58D5mHAgRZrE/rlefmctXk
 iF0R314VBwwyPtZ5vQ9GjPl1jHRYIZxMQkWwbkCU5KpbxSiLWlT5Nqva2QiK7czML7c5
 URTZec+Vmlsd24zt83lXA6dlTzT6u6pS8nCtPCyLiAvWG+LFRFdZ5hizdC/H3ow8Mkn8
 0jt58w1ztanJnkcf9f7qnHKksF3N35HduNlT0BJ1Z5fBq2yUpp1KgYjnlkc1j3tOh7m6
 BfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh/KLSzQqnJr0/PMf2DmO5rUtVYfFwMH4ti+obo2a7s=;
 b=FGbyU61wk8MzTDqIqWqUbcRnsFw33eeoWjd/cFnLkMhwTzPZ69i5dAfLor37W92M2A
 esDjh7bWIf/hG3AAe84B+OTdr+2fvmtlHiBtQ34YGCrXtOnC3t+ISQ9RfYBfpEZXp83V
 P7B3NzqVrx+fl/dHiPEsucHv74DXjVR5MadstNVabl5Fn0PQ9C/iB/3o+pkq1uyYQmSj
 DhSu/zRMfk1Tp9B+bRQg3JHAQfSgOOVYfakq5ltGLoNeibF70KuTD5Knq2V/aLK3BNN8
 7qGzKhKxV9KoFN4bseJ1eaXjlbV4EUXZVh23C+JGd8779nOVqM9qpJ2ZZ/FPd8OXl7Q3
 SjTA==
X-Gm-Message-State: AOAM533ZOsyu90M4euYPbSr5l6lNhlYEw11/VT5ye+jtqToSoYDxYIHf
 0s2+HY46c4kpJxrhVbUsdYVAZP6GWyIt+Ouhnzo=
X-Google-Smtp-Source: ABdhPJzsaontx5ozyXPRUXIspav4OYKL8Yae9yGB7WLujLekyBKPAJ+mXHiIErPXcPeOXd4tel2AAhIoC764A4fM5+Q=
X-Received: by 2002:a37:9147:: with SMTP id t68mr23191512qkd.34.1595280488864; 
 Mon, 20 Jul 2020 14:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200720075148.172156-1-hch@lst.de>
 <20200720075148.172156-5-hch@lst.de>
 <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
 <20200720120734.GA29061@lst.de>
 <2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
In-Reply-To: <2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 20 Jul 2020 23:27:57 +0200
Message-ID: <CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
Subject: Re: [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
To: Artem Bityutskiy <dedekind1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_172810_916071_D9092DF6 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 device-mapper development <dm-devel@redhat.com>, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 cgroups mailinglist <cgroups@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 2:37 PM Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> > What about jffs2 and blk2mtd raw block devices?

I don't worry much about blk2mtd.

> If my memory serves me correctly JFFS2 did not mind readahead.

This covers my knowledge too.
I fear enabling readahead on JFFS2 will cause performance issues, this
filesystem
is mostly used on small and slow NOR devices.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
