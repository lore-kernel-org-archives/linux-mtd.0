Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FA9C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 22:07:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC8C206E5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 22:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="knmQEWLf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFGUbag8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC8C206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+LDnJ2uvPOMmQgiNztRmZEaMjQAFWi9/YvAc5UeP8Xg=; b=knmQEWLfp6IEiAnVJWyKlIh0+
	L8kOeKO3v1oo9rM7cMNoFHrX+n+ZcOipEFbGsRvra5id1++yUYEnEp+bwKe0KlJ+9BWy1cI5e86xp
	8CVLNMQt/T3ntqCq9ajPw3irTmvZmjP85kQ+vr5PEzYGhmsCGkiZMnkGPXen0NWwvq2EVGIDJ4l7Z
	qjmE0k+Sk0tD1QB6CEuErsT+t+vq1JRiSjLJduRxkF6pORNvy6tNcP04oP7+u4xW/CQn56XDPwjwZ
	Ni1mFvbfEPQFKHY6vzQi25fbiNU0EeDWlc3abADXy+oLOwmXWaeeVGQ8uYMwHPcmIPTo8psrXZm6y
	UTa+E/WXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZhyu-0007b6-5C; Mon, 02 Nov 2020 22:07:16 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZhyr-0007aS-H1
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 22:07:14 +0000
Received: by mail-qt1-x832.google.com with SMTP id i7so10342624qti.6
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v20U5fA7VVgogA7cTjLWzU6ZJUwPA13TQ5dN0PfMakg=;
 b=ZFGUbag8zg/ACIhZphdHwjkvI+38s5TSMjHJuT1mdWRAcQnMNdlZ8Bt3O95yF2ABOJ
 9hQd9WAIaJE6rlKvgbytZIFPak0DTDFaJMCInXT48wIUAx5B+ekAT18sdNl6BoCtuzLS
 L2NlryIRIFdQPIqCNJAZ009q2ey6MjBX6i2hUwWx/Cd4KIE3lWXnFzDkLecOx8q2HDko
 AenCz6eTpvoDwKhDYXG+5UZBzI38b5MRFcjBU3BrSldBt+WVV1GRj27JgjYPoEaHs7hm
 cZmB21L2jGoQ4SOmhy1qS5T2KF3Te/vGXtuSN16Jn0x5S0bvMm6+5zFlVbt4gEU4scCz
 v0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v20U5fA7VVgogA7cTjLWzU6ZJUwPA13TQ5dN0PfMakg=;
 b=HPU+vkpIiiSZK1RYxf0qw9KyEazOjOHvXF8paQz2Vj3XvufV1fP2nfqd2sC3h651bh
 HYaoe3+pBBV3iB+pV2f4tv5owJcoh4h/CCGU+kr9wh+Xo9+cb8ScsbDAK//hgtzwFrBD
 h/tQ4NrzB9UgGhmozcm9Qa4hKcqWJuLAWjt6Iaa6s9whFyt+aqw0un8/L1jMqZVEZ3x0
 Nt9n5gx1hXFmo00PE/QybtjwHCy7autExbA2unmvxCF9OB2JOZUnZZtDpFIgk4Vlf/iV
 LDKSTi+lXOqzc1iIS4GKkL4g4aAtQOOaqMoMemlDQ7TO5bhFHVAl38A6iqy+moX+vGBm
 qFZw==
X-Gm-Message-State: AOAM5320FcL9ixUvcz2uA0Cb2q7xZ9WhNPChUr3LH7Z8G1RpRFt80OVI
 I7QKarDu+oXzHy2y6rpWrDvphTDU1zN9GAcDFyo=
X-Google-Smtp-Source: ABdhPJyYAH8AgHvHujCrCE8IB/cHlG/DSWRSkngBtbgWvXgJqrgk3Mt8TQeqP+2VYYLEqPqAp9KY33tlXWI0ntYZzeI=
X-Received: by 2002:a05:622a:14f:: with SMTP id
 v15mr16795949qtw.245.1604354829317; 
 Mon, 02 Nov 2020 14:07:09 -0800 (PST)
MIME-Version: 1.0
References: <CACxOKoJSoOMjeZncUV5Rae8+bbHgn-0viZmAZV2c0vP3+zRMGw@mail.gmail.com>
In-Reply-To: <CACxOKoJSoOMjeZncUV5Rae8+bbHgn-0viZmAZV2c0vP3+zRMGw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 2 Nov 2020 23:06:58 +0100
Message-ID: <CAFLxGvw7cs3sOUvFSVz393kUc3V4C9OvruEQ00gB=GRdZExXag@mail.gmail.com>
Subject: Re: ubihealthd status
To: Maurice Smulders <maurice.smulders@genevatech.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_170713_641118_C5CCEA54 
X-CRM114-Status: GOOD (  18.91  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Maurice,

On Mon, Nov 2, 2020 at 8:29 PM Maurice Smulders
<maurice.smulders@genevatech.net> wrote:
>
> I am trying to determine how to be able to figure out if a PEB had an
> uncorrectable bitflip and expose it to user space.
> It would be good to determine if a specific volume is suspect
> determined from the actual LEB, and have some exposure in for example
> SYSFS. Would the actual volume be turned read-only?

It is a little more complicated.
There are many situations where a block is allowed to have uncorrectable
bit flips. e.g. the last data written by UBIFS after a power-cut. It
can recover from that.

On the other hand if all of a sudden committed data is no longer readable due to
ECC errors you are in deep trouble. UBI can fail to attach then, UBIFS
can refuse to
mount or fail much later, etc...

What situation are you trying to deal with?

> I'm open to suggestions, either I build something into ubihealthd to
> notify user programs to tell something bad has happened, or sysfs (but
> that cannot notify)
>
> The problem I have is that one of the apps i need to support this for
> is commercial - and I couldn't change ubihealthd to a libary because
> it is GPLv2, the other app is now Apache License based I think, it
> used to be under NOSA.  Also UBIHEALTHD doesn't necessarily have
> access to which LEB/Volume is potentially affected.

ubihealthd is a rather simple program. See source and use the kernel interface
directly in your application.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
