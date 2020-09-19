Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F394C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 20:55:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7FF21D42
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 20:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R5kZXm5a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJSKcgDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7FF21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rv5MZ/OQdUpVmaFfL5XlxqL7sngsO/tMgUHg8aFdSgc=; b=R5kZXm5aXMxLa3/vqagxmbmdG
	5KrCdUd8VXsKKFf+mNr1lAZIZzqNM9roQdYcLvUTDKIpsHUKQU9rMSu2ex9HDcUXpud8exh1yWoeJ
	VLHw/kkKcehzm3O4xi7I2snYoDWdSmMZ+jwiNTZ/FUdjdeUIHA6FjRo/aM/vYXaBX5PIz/L23B4QK
	u7OOoznCB00qvbso924s5sy5UaJstvU72Yf3ldcOrH8dkRxEzUkDVkraStSzvK9e4lcvrD0bS2Ehj
	zMnViSealCeyWbG2U+aMvOc36xuxIx02EYs0cE+/N05EMWrKHA/f0tTZyd5H4d0ET5DpJ9/MGqv6L
	s3owsEFqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJjsQ-00075u-Qh; Sat, 19 Sep 2020 20:54:34 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJjsO-00075X-0O
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 20:54:32 +0000
Received: by mail-qt1-x82a.google.com with SMTP id z2so8649156qtv.12
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 13:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gx5+uVfTn6Xx8rcwjPC54kzr84Ys/LeIJsgxWPrnMDc=;
 b=GJSKcgDXyswFjllSclqeneXVa6Jxk0UVFdaeL+bR9Zg6VTlpoI1zfxH1/7MRUGAey2
 fJ0nu0wjNFrGntOkULl6DI+/qwAUc9I6MnGxIcDGFSTw+XcHDUs+QudJz1LcInfl/06L
 jNM6J9O9S1aUzTB6qZRZiiN58Z2g4O12O4PQljy4XDDy8Is4e1s896LS3ISm183Sx9M4
 Mdzx3db461VLAIBJpKFexP+e8jWwBR15l8rsiFu409Cp+evcbskKqnNZAVePeSfl9wO9
 k1C5iHdEzQpbS/BKxGQhJYEYsKL++1GDDCp7fEEMbTA4gKqb4U2mVGbNc/ztHB7+n7oH
 WVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gx5+uVfTn6Xx8rcwjPC54kzr84Ys/LeIJsgxWPrnMDc=;
 b=kx8OW+Q82nAYE0M5OstOoRlZH6J+EuYc8zo6DkcivfKYVZrjtygVs3Wd67NAZdrPD7
 Hy2qqH7HbDR4o74HWLD2Z6QbQnQB1V1byxZEWOpxixBcFqc9TyeO9+vO1Zc+dEYjZ4Rc
 QuPYnd1OcmOxCq+OPyiLgaQM7/0bZUfwktqHeVZNBS4u/Wn+qY9uJipS1VoU8XmUH3ev
 GrfUS3Y6Z9CMKVBt0ydcZYHJ+Cj5mHh1FHQ6FN6o5JIEVUOr7A/Qm41yYC6O5SneT/58
 LPm31ATBkmBWjGM0cy3049E4ISWecP/8+WpDXt0qZVovjeThNrEHlkkd23PxaYcOtWbN
 wvtQ==
X-Gm-Message-State: AOAM531nnoCUlKTTqLwzzlJfCaPj8y4b7K3koKyNnbB1NcmGmKUe5H6G
 8DzrO3Fy1OguEdU+itDo9JICZHk/m5NyEQkdZgE=
X-Google-Smtp-Source: ABdhPJzy47mnMrHjR/aEsJ9hLcKqYwVUd3tmuxjQodXFPVhg1feBVZpernQ2lvgm7vDth+Jm7bfSJPhXavlI5qkvCTY=
X-Received: by 2002:ac8:fa4:: with SMTP id b33mr40865860qtk.13.1600548869275; 
 Sat, 19 Sep 2020 13:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
In-Reply-To: <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 19 Sep 2020 22:54:17 +0200
Message-ID: <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Kristof Havasi <havasiefr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_165432_096314_CE5BE905 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Sep 19, 2020 at 10:02 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Sep 17, 2020 at 4:48 PM Kristof Havasi <havasiefr@gmail.com> wrote:
> > Without "chk_lprops" the panic is only visible after the restart, but if it was
> > enabled the following assertion was triggering an immediate panic:
> > (Should I "reformat" long log lines in the future or leave them verbatim?)
> >
> > UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
> > failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231
> > UBIFS warning (ubi0:4 pid 649): ubifs_ro_mode.part.1: switched to
>
> Hm, the number of bits we ask to pack is smaller than val.
> Maybe we have some subtle bug where a node length is not correctly
> calculated.
>
> From your other mail:
> > >         0: free 0 dirty 255408 flags 1 lnum 0
>
> Dirty is larger than LEB size (253952). Must not happen.
>
> > >         1: free 0 dirty 190192 flags 1 lnum 0
> > >         2: free 0 dirty 255360 flags 1 lnum 0
>
> Same.
>
> > >         3: free 0 dirty 248896 flags 1 lnum 0
>
> Does the problem also trigger with encryption disabled? So just with
> authentication?

One more question, when you mount ubifs successuflly, you see a line like:
UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID
942AA41D-81B8-4F57-9CE6-0548D0D0DCB0, big LPT model

Does it print big LPT or small LPT model?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
