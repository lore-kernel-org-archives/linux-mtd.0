Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408B5ECE58C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:10:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED6F2083B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3PzTynx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZj3657O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED6F2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7yZ/sX4Ns7K5Eg0vl4LUT/b7QrTs1mjiPPDk74Wohc=; b=b3PzTynxnX2fop
	ZSjwRH/K7H53UVpIJmw5yMehcIe6mF+3JyfscqRoQmhvGLZz990j5JGYWBPj5/NXMnQA5qEONw3K8
	BjG1OZd+nVzr4Jv7Lv0v1s7OTeoxMkjxFpqYqDvV9mLHmGBwisubEwqVBJ3TJQSeGM4Cr3Q4S/5o0
	M+ZcfuB+e9JIZd3we21Vf2rq2ZYxTWbxM16PXEbPGtCP46PmM7I/0i5khmW9UDYj9lcuRPjJM00re
	wHDWehg01ehgxUr92mIkp2hSDffXERaMTalnffMXCMC9FekwMOdOhh//5servJllIqRJyhJoyK5RX
	3EsJaS9RVxtNVFv/7vwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKT9X-00070T-IQ; Tue, 15 Oct 2019 20:10:43 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKT9K-0006qM-6n
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 20:10:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id p30so12813750pgl.2
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=js8Qns6j5BND4HnKBHLkZMeEbDf6k1HnIbaB6Mr8HBI=;
 b=eZj3657OzQv2hRKdtOUsePL8ZE217xH9oK4PyEsaZuWK70s0LGSE8/hA2z9c4egLe1
 UEOGdsHV/bY6keVyoUdPSb1NRHOmDRnwiqBSXQTVimci7JA1Oqs98CyV54R5NbBXerUs
 d/9ch3DABvO3YSJ6x31PWvweXEgS100fCc74NT21Ga/0/mtupy+arBCBcm+eTwTaRK6r
 k8wd7+MqPhFMtnMv4fJmZPP+EHcE6cVbBFUfJUjnKNuyld1Vpm82pK4uYvO/akSyce71
 y7V4urczuO41EqR1WTZMB6xlQeY/dtDBYlNs1yZmHQR+pM7FzfExv5YcuCmzLB3ELy1T
 xwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=js8Qns6j5BND4HnKBHLkZMeEbDf6k1HnIbaB6Mr8HBI=;
 b=dusdMT+M9mGqAcHQXhbJoI1KG2DnqJCiFrVsmk7IfIzLKISlnB7t273Ni3wJzmhDBS
 9wNeIS4DIOjfeaUMmjTxrDdA5sfbuZ4qO/wWLEAfiWVZqxl5r02d+agmzcjU8lUZt1xy
 vIlAxMM+GBWY1VlwpTJbHYeY95drb4HsD7d2PGFEX0YauZrQxsWBDbriMrhZ8PaGi8Nl
 1nYP8klSO/PN1RzZWSaC55/kTL/Fw+F0MVTBbhhJog669TfNffA2L/iU7sNa0dzYk1Ge
 a9lBsqddtAhVkA3pqIi0H/8zL/e6LUlfAmwviD8VHhaA8ngS0SMepirHvXhsw7YDWYan
 1q5Q==
X-Gm-Message-State: APjAAAUQ3lq8z+WyST7w3beJ7cw2fijLftwtUIXZ3opnX0bSon3nuP6l
 gzREOd2ziOTbkfIrLqRJHUfD9i4A631Oy1+ENz8=
X-Google-Smtp-Source: APXvYqzgF/DbjP8Xbow/xP2oTx6eyc6wLDr+5MwSAUjdrlaNEgjGZqXHJXq0rYz/LCU5LPQ1qF2HJOCGdhcynZqEXX0=
X-Received: by 2002:aa7:9885:: with SMTP id r5mr40618725pfl.136.1571170229262; 
 Tue, 15 Oct 2019 13:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAO1O6seC1UFVrDM1FxP09uPrQhAUxp3pU=YUy09Vj98mpcU=Cw@mail.gmail.com>
 <CAFLxGvz8t-oyzkZE-9X=b+f10-no=E8mqhxmct9eJ2PK54bTfw@mail.gmail.com>
In-Reply-To: <CAFLxGvz8t-oyzkZE-9X=b+f10-no=E8mqhxmct9eJ2PK54bTfw@mail.gmail.com>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Tue, 15 Oct 2019 22:10:17 +0200
Message-ID: <CAO1O6sfd3YOnR_7Zm1fcX-Mz-m2pzxA1uLppb78fGxsAdfjFKw@mail.gmail.com>
Subject: Re: mtdswap + ubi results in deadlock
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_131031_398155_7A871E20 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Den tis 15 okt. 2019 kl 20:59 skrev Richard Weinberger
<richard.weinberger@gmail.com>:
>
> Emil,
>
> On Tue, Oct 15, 2019 at 7:00 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
> >
> > Hi. I'm trying to use mtdswap together with ubi increase memory.
> > Normally mtdswap has its own wear leveling but I want ubi to do that
> > job instead. So I removed all wear leveling and oob usage from mtdswap
> > (or really it doesn't do wear leveling if the mtd device has no oob)
> > and am now using it with a gluebi mtd partition on top of ubi. It
> > works good but in some occasions it deadlocks because ubi internally
> > uses kmalloc, which in case of low memory, waits for swap to complete.
> > But swap won't complete until the data is written to flash.
> >
> > Do you have any idea how to mitigate this issue?
>
> Well, if you use UBI for swap then no memory allocation within UBI is allowed
> to trigger swapping. Otherwise the memory allocation goes into
> recursion and locks
> up. This is what happens in your case.
>
> You can try to pinpoint these allocations and use GFP_NOFS there but I fear
> that will case other problems.

Thanks for the tip, I'll try that. But just trying to find some
information about GFP_NOFS, I found this article from 2003
https://lwn.net/Articles/22909/. It says "The GFP_NOIO flag allows
sleeping, but no I/O operations will be started to help satisfy the
request. GFP_NOFS is a bit less restrictive; some I/O operations can
be started (writing to a swap area, for example), but no filesystem
operations will be performed.". I'm not sure how much has changed
since 2003 but if I interpret it correctly then GFP_NOFS wouldn't work
since that can still trigger a swap, which would result in the same
recursive deadlock?

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
