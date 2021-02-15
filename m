Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6A3C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 13:44:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5DF64D9D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 13:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5DF64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YaXSLTaOB4Cc/HWV9lWrGcW7Uhraht0KQ3+lCjpR8Sk=; b=o6wfuTrqC+XaICOmSWKQrU6a9
	/roUuI964hm/OgbJSgxWcrtAtc5vP6ikPzdvWssC1oyaRW8tRCAGy9SPUz8jv1FlFpIuFgmX5s7Ul
	u+bQSGJBHqitCtEoPbmetXfHJ+7oVPy0x6Atejtszg9R66PMUmxdWX5+A8hU7931dK7y6B6pXAD+9
	YKn5Uo8EVIA/99MsOrrkfFNPKoih+XJgJ+q8x7LZw34ay8pLtMLEqkl0TWwvrAVszYCDZnHrSz/TR
	sWMt2IdQ6QbZVCtX5qs3o1QIa43lTl40trvClimLaMDQ9d7Mv458cVoIpxD56oMctLkEWGpJ8yoMn
	nlOA2esQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBeA0-0002FD-Pc; Mon, 15 Feb 2021 13:43:32 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBe9y-0002Dd-N3
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 13:43:31 +0000
Received: by mail-qk1-x733.google.com with SMTP id q85so6333207qke.8
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2021 05:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dUY/mk1Lc8G78pgBS2Mx3NjfEuV+qgOPeV5BhtagDQU=;
 b=d3oq4pH/F36Pnfxw8LFnft/6C40f2NyuTx5tsiCjUqEJuMfkxR0hMYfxwrsSdiYDLw
 z7jOcR5Dx21ni9aFGTLRqqLZhS3AgAIG5Rj67PA4/Bt+6LNqZyGI+p/jkjh/KsJ1qa8J
 L9PURCEku8u+32fSdUmg3Z5e8GghXQfbDoi761K9lDi7XgsvjP7Z4qJIS9fXZGKXET0E
 /8kRQPjAWSM2zqrNguwD0S5cS0yAz079SdrpN730F6QIXDUfqMdkKo5wZNuKF61+HG7T
 d5VoAmgUcdUBNFrucfXposBo9VKXiAAjyo0NmTvj/5xsx0y5HOVzVCdLzXP/TirzSZLQ
 Mi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dUY/mk1Lc8G78pgBS2Mx3NjfEuV+qgOPeV5BhtagDQU=;
 b=BnN1/EbyzDnuRvp9x/FJxgHsEetrJM+S9ToxjeJg7LQWgSDq6+OBrI0m5kLCLslvUp
 C9vE2cN3LEQIvdGDPK0h1vKHK3tNc8aLPjg0UYSNnlphHXZtK+AW4VeU796GxmXmxznj
 jvTLn4kBTJdNRR6M5mQgQ4YuoI8U5n6fI3y5Hutu9b6Ris0Gkvm+t2N08R17ETm3AMDp
 fxiK4nemJNz2E2zp/UuGsspJV5oBFPPvpGJm8OQOwJpsRM48kLKYNP7ZEgh/0WifoRpz
 MV8caNqh1cLitUY12KVUdsErrapJZ5h6x0Exsa/ArWUPsSWNSESvS2izCrlSpan5mMBb
 GSJw==
X-Gm-Message-State: AOAM5312Me1bQmPsRdjZ8+xAXQaoms6x6FOvAmZ1uKbomNaMpKDyIcMG
 2hD3PgdVgD+6Wm+tUZ5ByuPFocBRp5RMDOYdBY8=
X-Google-Smtp-Source: ABdhPJway5dC8YnY6EDt+sovapZvXabHX7uKu7byF+eRzFpJoTdRrtkbN3oRQ6hjTJKgatfekIJKwiZK0+qpQT/iX/4=
X-Received: by 2002:a37:a20b:: with SMTP id l11mr6003460qke.237.1613396606583; 
 Mon, 15 Feb 2021 05:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
 <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
 <f91d7eff1d764ba7b47f023bc0fafacb@intel.com> <20210128100032.5eb542c6@xps13>
 <10c2e98c393a486cab3bc953e9926e38@intel.com>
 <1363048722.339069.1611865409332.JavaMail.zimbra@nod.at>
 <783a45b0bc04483e9a0a6bb0a083bccb@intel.com>
In-Reply-To: <783a45b0bc04483e9a0a6bb0a083bccb@intel.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 15 Feb 2021 14:43:15 +0100
Message-ID: <CAFLxGvyjLejD8LSGnrEaBHv8=XxD9HH7yeTYjO3Si8+WMCU2Nw@mail.gmail.com>
Subject: Re: [PATCH] mtd: use refcount to prevent corruption
To: "Winkler, Tomas" <tomas.winkler@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_084330_819609_3500510C 
X-CRM114-Status: GOOD (  23.00  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Feb 13, 2021 at 6:12 PM Winkler, Tomas <tomas.winkler@intel.com> wrote:
> > Well, the trick in glubi (and other MTDs with "hotplug" support) is not to
> > reject removal of the sub-device. ->_put_device() is of return type void.
> > The key is grabbing a reference on the sub-device in ->_get_device() such
> > that the layer below doesn't even try to remove while the MTD is in use.
>
> I understand that. But in that case the kernel is in the mercy of user space to close the handle,
> the whole perception here is that of hotplug that the device is  physically removed it cannot wait
> for the user space to complete. What's the fix is trying to do is to bail out gracefully.
>
> > > so we postpone the mtd unregister to  mtd_info->_put_device()  but it
> > > that state we have nothing to hold on as the device is gone in
> > > remove() User will fail anyway, as the underlying device is not
> > > functional in that state.
> > > Anyway I've tried your suggestion, the kernel is crashing, hope I
> > > haven't done some silly bug.
> >
> > Can you point us to the affected code?
> > This would help a lot to understand the issue better.
> > I'm sure we can find a solution.
>
> Got green light on releasing the patches will send soon.

I'm eager to see them. :-)
As said, I'm sure we can find a nice solution.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
