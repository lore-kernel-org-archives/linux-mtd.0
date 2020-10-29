Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157A9C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:24:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B15020790
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SbYRXliW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNX/nO0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B15020790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7cPWRcmwnjrPMRJexUkqlrmxLKVIOVeiJcWYQIw/gDU=; b=SbYRXliWf3UQ537cT7VjS+WqY
	54goG/4TbG8HOk4+Zf/iR/r9o2b6GD+rnwFnX5G9jiHmR8TZgukDmuW/q5i9MHSQ3YRCvax5pWBBv
	MkW6eI39V2quUYjc25/iKIxroZoLkU2CQ2maYaVALAomD1NpJYODyuDGtd9c3YeJeFnt2YrAJs27m
	CzqA3Y9Z3nvnlEdEnZEWigf6fA8IokdlA0YBjjtEYwEwiWQxypH6q6gSfvynnje8ANrsBOsdT+h5t
	KM+iD5RPwkGvdO5WT8YemN3F5773LeSte11JPcm5f9LD8mGZMBSPfHg4CEI0lknFcDTycNvLHI4k8
	sdRt9reew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY55V-0000js-3q; Thu, 29 Oct 2020 10:23:21 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY55P-0000j0-Fb
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 10:23:16 +0000
Received: by mail-qt1-x82a.google.com with SMTP id f93so1464475qtb.10
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X9QXi0yh9GzSDp+3St7dMtekRdzNhqoIUIfHCmOXXoA=;
 b=RNX/nO0TC0C11NqaoqN00hqIBb7rl8JlmK/3NPpmebYqeHmcTW5qHZ2tx3R27LfTKu
 t2ggNVnu001+RLCQPdESsuM9C0vDqsmbER3A7JKAn1ZTla1BrW5mgMrpw0dkvdHhBSTM
 4+bL8nth6mntrcNYpHZpFhj5tquFB3DjEjmtIH5L5CimjVTWTPmzJtUeGufsM74lfcGc
 1Bi+BM5qC4mawNOoWNEunBdfrEwhEoNcMmnZwjFfZ9HgGfh7vi8frAobddYADZa6kykm
 s8LEV0uirpTMnaJMBV8xE/Ajw4DTQ1PD/Cxtevzw/LPjyHzzt3XfMoVXsgZs20UknR+R
 iWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X9QXi0yh9GzSDp+3St7dMtekRdzNhqoIUIfHCmOXXoA=;
 b=Nn8r0a5G+p9+R2qOmrC9bX+OFmwmcEN17BYvujIY0FVfYW5s1q+ijYA4qAjs1gN9UB
 Rnsta/Z5n65nq79GKb9rmrr4bCNyabGnnzCR765y8sJq2tCjjAno2yaWIG30h1tBylfv
 mIryR8PbBqUGRUyg08dIgEgzf5JzAtQqXpLagqACzNGrJ3XkJ94y10L9sIqQtl40tA/I
 IYbSMPhdrq7o9thf2Em/Gimw2cZBe3fJvW0O7ZQt6KmmbN+CpDuPLwXoRgYnQoL5fwHe
 yertom9M2jqLD2Y0gqn2s2h6F3kTzGcfyWdaC9TnES2UXDENqhZdBlAoj7at+D5H3z8P
 FUhg==
X-Gm-Message-State: AOAM533gKhPrZal4rTx6/tTc9kH1Nc2WUnf20SoM8UDxT8oXUBKNUBaI
 yK7P9UzlA6PG39kRB3X7P9M0UO6WQJC7YU+xPXDEmMC1cyoz5Q==
X-Google-Smtp-Source: ABdhPJx4hCfk6douRg7vSM3VDjgCf3HcAds24dSP5Cn6pnqqpMPuyZGi2hvQKoXCvEiEaYSdpkWkJhojftSafkJFHRI=
X-Received: by 2002:ac8:5903:: with SMTP id 3mr2908716qty.166.1603966992572;
 Thu, 29 Oct 2020 03:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <CACxOKoK+JjjbKg9XAEQgyatq=hOjY6ugc+iyQ3trNipzD7snDQ@mail.gmail.com>
In-Reply-To: <CACxOKoK+JjjbKg9XAEQgyatq=hOjY6ugc+iyQ3trNipzD7snDQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 29 Oct 2020 11:23:01 +0100
Message-ID: <CAFLxGvxTkELuzgszLkV6LA7D_qL10i=cP6mxj3sTwCEYJcmLMg@mail.gmail.com>
Subject: Re: UBIRENAME failure modes
To: Maurice Smulders <maurice.smulders@genevatech.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_062315_554557_E981A306 
X-CRM114-Status: GOOD (  16.35  )
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

On Tue, Oct 27, 2020 at 10:59 PM Maurice Smulders
<maurice.smulders@genevatech.net> wrote:
>
> I know that UBI is built for resilience, but I have a simple question.
> This is inside an unserviceable device once deployed, so we have to be
> 99.99999% sure that it is recoverable in a SHTF case..
>
> volume layout:
> - rootfs_0 and 1 : UBIFS
> - linux_0 and 1 (raw uboot loadable linux kernel - NO filesystem
>
> when loading a firmware update, the script creates a rootfs_new and
> linux_new, and once complete and the code is verified to be correct an
> ubirename is executed. The rootfs installation is done in the
> alternate volume, so actual running code is not affected.
>
> + time ubirename /dev/ubi0 linux_1 linux_old_1 rootfs_1 rootfs_old_1
> linux_new linux_1 rootfs_new rootfs_1
> real    0m 2.32s
> user    0m 0.00s
> sys     0m 0.69s
>
> How big is the critical window of this rename? 0.69s or (way) less? If
> power is lost during this very short 0.69s, what could happen? Is
> there any chance of an undefined state, or would either the old or new
> config be active?

Volume rename is an atomic operation, either all volumes got renamed or none.
UBI makes use of the atomic LEB change feature. It alters the volume table and
atomically exchanges it with a newer version.

So there should be no critical window, if so, you've found a bug. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
