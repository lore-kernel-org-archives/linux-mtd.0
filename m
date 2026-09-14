Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95DAC88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+yulo7opCOuMLxqNpXB5PZW0/tldqF2ycKSz9OB1G0=; b=Qvu1hGbjSqXNFJ
	C+9ZOmLivL/V8H/kuHXIq5OemZFlOCLYMjfrmUsRKPF+33mEubUTXaO/R+yRXLSj9IF6cpFgz+wbV
	vW4V+6uVLOwSRy5VJpE+uYXRhM6wNIgYBESR5nXF0E5qrhbwK1WBeVHl1J7uLrD36WUCqL6IHoAx1
	0AhZupszt8pnhjMb5tii3bzclzHWTcFTWHKwJ03TgMk6AeNepghq4befmm3lwQReVmq5LBwsS7LKl
	VJ97ZwiHlNmRYUyt4MH6juCoDjNHhO0ov2GrMZfu8x6qmngGExDVD5x2OjTYHnR5QdLYf5B+IZlSd
	Opy1MN3ooN5HZMnksm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61jz-00000002fJz-06i0;
	Mon, 14 Sep 2026 08:08:39 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61ju-00000002fIr-0fFD
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:08:35 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-858feccfd09so828187b3.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 01:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373312; cv=none;
        d=google.com; s=arc-20260327;
        b=DpLBxqdp1pnNmJeCumcoi5loX8pwxGdmqI1IKmEq3hKl6pDFcr5zhjk8dDCL7VMA4Q
         zFJK6RCd4kl4G44OcIcrTE5RyGx6CxtnqGTw8sl23Gm7qE0a0JsJWWQqnEnVrFejxGZ8
         Y52/boffwArkbRRsj5khTKkmFTFlpIvzPpbZ71FZtBc+iXsQfrlBNX1PJQn3s3OfZzSn
         iKh7zoqBQ6qnCf0Vek9eug6Zzo7RkHqPna8STHNOJMH4ylQu+juG0B0e9mZnB6R4zxaf
         SxASG4ZuoCjMR3V8eIeqDUQqqkieiQvdO/GpWzX+bpbaa8UyM1tTWbnOogjiKRkohHIN
         bbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ID6c9sfqkpTqIRSRF0HKDo0hSdWLeIijg8HL/+8GapQ=;
        fh=VZrZi8BilrozzWyQ9HmJP+Y9kHTzkLy62+qOYFfiDUo=;
        b=UJNPGAFfFq40An4R6qIXy4d8B1xEiTH4gmGAz89yTn/JxM5qR1iY5lHEP3BOHzc6i9
         jVHLFa0UNwHiS+3zyzGOOz7KIniBMSvlwABFVvHu1YbNffTvPWKwEHzVyQWm8ka+TOkd
         pYFW5IWeDg7RvROgRsULjByPbMb6jgw153uv2oFCuabxhCGmIz+vEvoGH/G/BUpFMZ10
         xOq3PGAlYJAJlwDV5G/nVoyyIQEKibQ8i887tFG6wcvUdAxN3prkNnpw0ds+VwYfsbvb
         bM5lMCKEU5FGKZ73LUrL7jS41S6K+Nj/q5mSoOx6GG3RWnaQl3Az7rb3gLyvR2P8RlNf
         yzEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373312; x=1789978112; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID6c9sfqkpTqIRSRF0HKDo0hSdWLeIijg8HL/+8GapQ=;
        b=htTFieQvHSI6T7HpufQULNiXSr37jDJa204XgeZ7eh8VHvpAIq4MudHB7M5Vz86+J+
         2lwmDJFqASG7ng2CDR9r4e5FoYPxAkEjkt2wOczQNJqQfbFsaZ1qQasVPl+0EeO6Tfg+
         ZvVR2t/iireR7O6iqodw98M+UXXfgYjgEB+ajOiadegWI+GaOTbYvtse72sT8t6LsaRB
         /2dJqu/uqvoSFEdC8M06mfuaepncGAqqbft8wrD0v3H6AM0MFgpl5qzBb6f772tIyYMj
         PDZDog67HwYTr+sGJQCeCfxy3tIwXgepRTDeE8sFINjFOPHfSzGv1LoULTXNOCBbHaXq
         L/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373312; x=1789978112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ID6c9sfqkpTqIRSRF0HKDo0hSdWLeIijg8HL/+8GapQ=;
        b=I8z7m+ZMxt5dV3BLSltCOJBA4Pzwa2JthUJp33ori47ryeMPodifAUOnMhgzDi8Vkr
         p6AyrPstikNkUlG2BOtekwJaD7KlaqRVQ02YzJIxoJqh0zbo9QuHyUMUc5euxt97bs74
         WcA4VxHWH4yZTHk74bp032AlVraORj8llhbz2ofmMT1cAS379CdQx6vhmSOAhQ/1ra2E
         IcdxNnC3dcfuBUe+R/O7HnoEjAzvVD4ouq3N6s/9gFzppS9DteG9Wi6bRY2t71I0BCLG
         0bywOOYKa2irMogOv/RIem27H1GGtanyAxzNyDO61wHe9sXyZVv/bUWuJm+iTuaI4lj8
         IbHA==
X-Forwarded-Encrypted: i=1; AKwUvBzGVex7hBZLQo522sADy1iFmgdephCs4QAxyNUvl/P+vxK6fYYrk1SfhFYnL3PQD4lUnc6EeIOMZoI=@lists.infradead.org
X-Gm-Message-State: AFuF++k3084U5z/QzigQ1jlZ/Xu3F/9z9hTytb4ibGzHuYSRjG9lq/JS
	zI4kf6Xjoy+qbNiEYB8AF7TI1dnnhAQaaj12EGAO89knxjq8lpSsMlWh6kyJc5oD4C3zQIn+3tM
	If+4o19rgpV1gMikE+vvJ91kAzXuYWQU=
X-Gm-Gg: AYBFou1OPRwnneaVpUfK0QmhtE0FeqIK7QApkw9rDHtH6ASg8iOIbYE7osKLcfRgSQF
	UqCLCeyUM4MFmorWsOxDCbv5ZM5St+zol/TOeHEQO7MX+/rDkoR8qMGFmQsZENtYkJBurDh1vGA
	JQ32QwtI9Hn0b10KjZSvQ2e1DyqP89ETa/iHiX7jqR0TgXFC7gYjSOE/iiKYCbTKsy+zCNFD9tF
	YGgF2dQ+fYbDH83DRquui+4ls1lFKVoC5sQ00tdu8WT361fodJHCI549qQsx341QZ9hePTLGtZ7
	tPw8m8ZEq1RcdntYI6NDl2Kb9sZhFaccvBfnQXyG7Y4eOim14x7dnhel
X-Received: by 2002:a05:690c:630e:b0:870:48aa:473e with SMTP id
 00721157ae682-88d19058869mr5623377b3.0.1789373312213; Mon, 14 Sep 2026
 01:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com> <20260910190139.BF6231F000FF@smtp.kernel.org>
In-Reply-To: <20260910190139.BF6231F000FF@smtp.kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 11:08:20 +0300
X-Gm-Features: AcwNN1XT_uCY5gQVeYwBYOZOBIgOpq3-Jnpwf4sQfFYZU8aFfdkLrzHjDiS4GQQ
Message-ID: <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
To: sashiko-reviews@lists.linux.dev
Cc: mwalle@kernel.org, pratyush@kernel.org, linux-kernel@vger.kernel.org, 
	takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, 
	miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_010834_218465_A56C7C7E 
X-CRM114-Status: GOOD (  35.22  )
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

Thanks for the review. Taking the three points in turn: the first is
unreachable, but checking it turned up a real bug next to it that this
series has to fix first; the second cannot arise on the path this patch
serves; and the third is correct and is already stated in the commit
message.

> [Severity: High]
> This is a pre-existing issue, but does spi_nor_prep_and_lock() leak device
> preparation resources if interrupted by a fatal signal?
>
> If a process is killed while waiting on wait_event_killable() inside
> spi_nor_prep_and_lock(), it returns -ERESTARTSYS but fails to invoke
> spi_nor_unprep() to roll back the earlier spi_nor_prep() call.

The asymmetry in the code is real, but the leak is not: the two halves
are mutually exclusive, so there is never anything to roll back.

spi_nor_prep() only does something when the flash has controller_ops:

        static int spi_nor_prep(struct spi_nor *nor)
        {
                int ret = 0;

                if (nor->controller_ops && nor->controller_ops->prepare)
                        ret = nor->controller_ops->prepare(nor);

                return ret;
        }

and the wait_event_killable() is reached only on the parallel-locking
branch, i.e. only when SNOR_F_RWW is set. That flag is set in
spi_nor_late_init_params() (core.c:2981):

        if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
            !nor->controller_ops)
                nor->flags |= SNOR_F_RWW;

Note the !nor->controller_ops. A flash that can reach the killable wait
by definition has no controller_ops, so spi_nor_prep() was a no-op and
spi_nor_unprep() would be one too. RWW and controller_ops cannot coexist.

> Does this
> also apply to the other locking helpers like spi_nor_prep_and_lock_pe() and
> spi_nor_prep_and_lock_rd()?

Those two have the same shape and so the same answer: same
spi_nor_prep(), same wait_event_killable() on the same SNOR_F_RWW
branch, so there is nothing to unprep there either.

One correction as well: on that branch spi_nor_prep_and_lock() does not
take nor->lock at all, so the error return cannot deadlock the mutex in
the way described.

That said, the neighbouring code is not fine, and I would not have
looked without this comment.

spi_nor_rww_start_exclusive() returns with nor->lock held, on both
paths:

        static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
        {
                struct spi_nor_rww *rww = &nor->rww;

                mutex_lock(&nor->lock);

                if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
                        return false;
                ...
                return true;
        }

It is the only one of the ten spi_nor_rww_{start,end}_* helpers that
still uses a bare mutex_lock(); the other nine all use
guard(mutex)(&nor->lock). Commit 03e7bb864d9a ("mtd: spi-nor: use
scope-based mutex cleanup helpers") replaced its "goto busy" with a
plain "return false" and deleted the busy: label that did the
mutex_unlock(), but did not add the guard() that the others got. Before
that commit the function always released the lock.

So on an RWW flash:

 - if the flash is idle, it returns true with nor->lock held, and the
   matching spi_nor_unlock_and_unprep() calls
   spi_nor_rww_end_exclusive(), which does guard(mutex)(&nor->lock) and
   self-deadlocks on a non-recursive mutex;

 - if it is busy, it returns false with nor->lock held and
   wait_event_killable() then sleeps holding it, so nothing can ever
   clear ongoing_*.

That has been the case since v6.15. Nothing hits it today: the only
flash with SPI_NOR_RWW is the MX25UW51245G, which has neither OTP nor
locking ops, so none of the existing spi_nor_prep_and_lock() callers in
otp.c, swp.c and sst.c apply to it. That is exactly what this patch
changes - spi_nor_shutdown() did not take the flash lock before, so an
RWW part never reached the exclusive path, and with my patch every
reboot would. v2 therefore leads with the guard(mutex) fix as patch 1/3
rather than building on top of it.

> [Severity: High]
> If a fatal signal is pending during the reboot process, such as from the OOM
> killer or a manual SIGKILL, wait_event_killable() in spi_nor_prep_and_lock()
> will immediately return -ERESTARTSYS.
>
> Will this early return skip the spi_nor_restore() hardware state reset?

Only on an RWW flash, for the same reason as above: the non-parallel
branch uses mutex_lock(), which is uninterruptible and cannot fail, and
spi_nor_prep() cannot fail on the spi-mem path because controller_ops is
NULL there. So on everything else spi_nor_prep_and_lock() returns 0.

Where it can happen, skipping the restore is exactly what the code does
today when the restore fails, and spi_nor_restore() is best-effort by
design - it ignores the error from spi_nor_set_4byte_addr_mode() and
only logs it, "in the hope that the flash will default to the 3-byte
address mode after the software reset". The patch does not make that
outcome more likely; the unlocked restore it replaces reports success
while leaving the flash in 4-byte mode, which is the failure being
fixed.

> [Severity: Critical]
> This is a pre-existing issue, but could releasing the lock while the MTD
> device remains active expose the flash's modified 3-byte addressing state
> to concurrent operations?

Yes, and this is the right thing to have flagged. It is in the commit
message:

        This narrows the race without closing it. The restore still runs
        while MTD users are attached, so an operation that starts after
        it has completed will address a chip that is now in 3-byte mode
        while nor->addr_nbytes is still 4. Closing that as well would
        mean having MTD stop accepting operations before ->shutdown
        runs, which is a larger change; serialising against the
        operations already in flight is what keeps the restore itself
        from being issued into a busy chip.

The mechanism as described is right: a page program issued in that state
sends four address bytes to a chip expecting three, so the fourth is
consumed as the first data byte and the write lands shifted.

It is not introduced here, and it cannot be fixed here. The window
exists because ->shutdown runs with userspace still running and MTD
still accepting operations; the only real fix is at the MTD layer, and
it is a separate discussion I am happy to have. What this patch removes
is the strictly worse case where the restore is issued into a flash that
is mid-erase and silently discards it.

Thanks,
Itai

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
