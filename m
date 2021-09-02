Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9951DC676A8
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 16:29:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4E26109E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 16:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F4E26109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIF88qGOlpi/UCQ28mo4E8i4ZTObNRX7JYthDVujb74=; b=X1/bOy3QxZnvt1
	bhtprgEopBfXrzTOMh/eudKPvqpt5Jkn9XT/+r5LhvVrA5bxRjJLE+YdyAD5IQP02H8IIXkcvlQxF
	4TZG1uZPDvgCFuRDEYkf7P+rJTwjgn5RCMr4x30koX8R89AoBncDOddGLk07UfHygSuMRccMPSPvW
	Q+00/Xn9aOpOLBlIWZy8OC0D0r3iBQ4O9EmK0dVpQoN1lxPA4WWH4bo7KpwKpk9uupTuEokRJnRSh
	KQ6daPZyoPHTUgs8zzd1RKtxpM1RiR6uHyICCvn6MvoBWfSvz+cRkemifdH9m4IdRzAN4rDRjDVrA
	ChvtMU7IUdyS6E8T3IPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLpZo-009zKq-5W; Thu, 02 Sep 2021 16:28:32 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLpZi-009zK5-Qw
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 16:28:30 +0000
Received: by mail-oi1-f180.google.com with SMTP id s20so3267929oiw.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Sep 2021 09:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAfF6voZMV5HL2emobgman82UwdzTl9MjI3NYiAvvY8=;
 b=QjQomV9avsY5Kj08IvP6xMJR8K+bvBkRDi6aDxP4ydV1m8JDKXjKUWO366gn+vQQEQ
 VV8qdqvH0L1RCWkUA+VRDCSQnYoZrITl4MG7/UXNq2B8wBdbFhpnu7pq72MDZXABtbIR
 h9MggebVn9O+bADf+VbwvE9CHy4Gm8TW3GQ0/61gBXtEPZfnUuzE8gWr7q52RcakGzpo
 +rwOz9EyzaBgufZlGdhb8rSCUR2lRd1GxWJYX+5kEs3IvPmPJoB17vdyxlYT+T1omOZm
 knVqMIfK6lBMrS7yCghWW1TqghQto8hu6JUn5U0YygDFMdQTh2sxjBFkN/cv1chhX5HE
 Q1Cw==
X-Gm-Message-State: AOAM533UhgSOpcUsWs1NNv+RWFo4V9BCS10Y/OjzAba1g1PqTqoK9CBA
 hk4Tbyq6ps17cNBdUfsjN117X4RPCBBD5bWztq8s3RxPDvk=
X-Google-Smtp-Source: ABdhPJwg0lvNr/QwsNhFe4IobRTfilUwoaE+FI69nZyCe2YopZSoRjuvrS/SxUVf8ud4LCqA44b+ACTfkChQgkY6tt4=
X-Received: by 2002:aca:afcd:: with SMTP id y196mr2831372oie.71.1630600104769; 
 Thu, 02 Sep 2021 09:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083442.210230-1-sean@geanix.com>
In-Reply-To: <20210901083442.210230-1-sean@geanix.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 2 Sep 2021 18:28:14 +0200
Message-ID: <CAJZ5v0j5dMDSDjhuXaZd=_J5JOP4Z09WUXfjWX_iCcT4RDisCg@mail.gmail.com>
Subject: Re: [PATCH] PM / suspend: move userspace freeze before disk sync
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Richard Weinberger <richard@nod.at>, Linux PM <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_092826_924389_4A25FA27 
X-CRM114-Status: GOOD (  25.96  )
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

On Wed, Sep 1, 2021 at 10:35 AM Sean Nyekjaer <sean@geanix.com> wrote:
>
> This fixes an issue where data remains unwritten before suspend.

Well, it doesn't make the issue go away, it just hides it for you and
it may very well expose it for someone else.

In particular, note that you can compile the kernel with
CONFIG_SUSPEND_SKIP_SYNC set which makes it not sync at all during
system-wide suspend and this is a valid case expected to work.  It
looks like this case doesn't work for you.

> UBI tried to write data, before the mtd device had been unsuspended.

Well, that's the real problem and it can happen regardless of whether
or not this patch is there.

> Seen on an iMX6ULL board fitted with rawnand flash.
>
> Before:
> PM: suspend entry (deep)
> Filesystems sync: 0.088 seconds
> Freezing user space processes ... (elapsed 0.000 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> printk: Suspending console(s) (use no_console_suspend to debug)
> PM: suspend devices took 0.030 seconds
> Disabling non-boot CPUs ...
> ubi0 error: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
>
> After:
> PM: suspend entry (deep)
> Freezing user space processes ... (elapsed 0.001 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> Filesystems sync: 0.060 seconds
> printk: Suspending console(s) (use no_console_suspend to debug)
> PM: suspend devices took 0.040 seconds
> Disabling non-boot CPUs ...
> PM: resume devices took 0.100 seconds
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>
> Some explanation/discussion here:
> http://lists.infradead.org/pipermail/linux-mtd/2021-July/087390.html
>
>  kernel/power/suspend.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> index 87331565e505..4ee3fcbb0e7a 100644
> --- a/kernel/power/suspend.c
> +++ b/kernel/power/suspend.c
> @@ -562,6 +562,12 @@ static int enter_state(suspend_state_t state)
>         if (state == PM_SUSPEND_TO_IDLE)
>                 s2idle_begin();
>
> +       pm_pr_dbg("Preparing system for sleep (%s)\n", mem_sleep_labels[state]);
> +       pm_suspend_clear_flags();
> +       error = suspend_prepare(state);
> +       if (error)
> +               goto Unlock;
> +
>  #ifndef CONFIG_SUSPEND_SKIP_SYNC
>         trace_suspend_resume(TPS("sync_filesystems"), 0, true);
>         pr_info("Syncing filesystems ... ");
> @@ -570,12 +576,6 @@ static int enter_state(suspend_state_t state)
>         trace_suspend_resume(TPS("sync_filesystems"), 0, false);
>  #endif
>
> -       pm_pr_dbg("Preparing system for sleep (%s)\n", mem_sleep_labels[state]);
> -       pm_suspend_clear_flags();
> -       error = suspend_prepare(state);
> -       if (error)
> -               goto Unlock;
> -
>         if (suspend_test(TEST_FREEZER))
>                 goto Finish;
>
> --
> 2.33.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
