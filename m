Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB86DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:06:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED1A64E89
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ED1A64E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M+oQfwtEpjeZzeFHWOrQhGx/JHMizdJbq+Bl7Dw9aSw=; b=EZqpA5urlmVlisLJf5y1aYAfh
	nwBvPV4xJRyvUw8I6ilCfFMvxnxaKcPhZ02i9LliPefmvC7dDEZsG7UGpoj9cN8YzsgYnY+8HR4gF
	SgoguJdovXtiJmxmxXkDT7hZlgAvZkg/lCjiasnPzNbhPjOB5RME2l9ISD2WJ86lrvy4qK0pDK9Al
	Gax0klAxiP26FeDiqU2+ILjw9u2ztcb7TwGbh7+UIHGkVR5zzA9T1E+L6Ts877gzGEbIviT77UIz1
	Rx1bTAqbuPTMB96rUshn5k9302FYq9K6yFYeLWax1eZgP7GDfS+2Fg1sqpWHGI8eZtWVD2mZCkMiO
	HzmMh6tgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHS7c-0052qV-TX; Wed, 03 Mar 2021 14:05:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS4I-0051x8-IW; Wed, 03 Mar 2021 14:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2zHzG0WPsx3xKiPqPnMCcC9JpT/COf8SAqNxgYPDcwI=; b=YzTYTV2sTztlHKhpzj/9UjHqff
 Ff/t/S5RaEwmIaNPMCtx2srt7smz8fDc97s/f5PT0yxfgncuZMrMaq3tcG9p1xKkAuAKY24YpIVZF
 laYvRHnm/mr7VwbdMHGNNTm8usaopdidXQ3n5fTvr7SY/tsU6Qj6D2jpLZHNCnoMHGGxx1oDrUK7H
 luIYje6qg95aBSBbRfTsrx9HwdSJzMDl68zL0QtjyGXMsm3l+awOFHOXsNQUFxUUUyqh/pgFc0+mB
 0vkfZzwEqDK1PVXDsx2dSo4Pwb+mvFQgA3fYogoO6bMXDbmnTH4wBXiixfVbw1b5/IuHEbTS7hKE7
 XARsZkLg==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH5Uo-00HDej-Kp; Tue, 02 Mar 2021 13:55:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614693328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2zHzG0WPsx3xKiPqPnMCcC9JpT/COf8SAqNxgYPDcwI=;
 b=oL4v99bE7SLyOQloEmxBm5+k/xMRvTkk4pt/OG8qvLA6b9DdiRhtxaD+0nUB4F5N4OQcsj
 Ic/6CdYJx/OPu8rlCqsNQGpM38HYhSfsHpGptacoyamFaVFqs7/yek3tHvqyg/+qcdd+DL
 OfjwuhDgZRqJTg+9ADLiziF6AFqEqM8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5718AAFF5;
 Tue,  2 Mar 2021 13:55:28 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:55:26 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Thomas Meyer <thomas@m3y3r.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Oleg Nesterov <oleg@redhat.com>, Wei Li <liwei391@huawei.com>,
 Michael Kelley <mikelley@microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH next v3 12/15] printk: introduce a kmsg_dump iterator
Message-ID: <YD5DzldNpnzuECaA@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de>
 <YD0tbVV+hZOFvWyB@alley> <87lfb5pu8c.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lfb5pu8c.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_135533_566360_5F39F0FC 
X-CRM114-Status: GOOD (  29.82  )
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

On Tue 2021-03-02 14:20:51, John Ogness wrote:
> On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> >> index 532f22637783..5a64b24a91c2 100644
> >> --- a/arch/powerpc/kernel/nvram_64.c
> >> +++ b/arch/powerpc/kernel/nvram_64.c
> >> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
> >>  		return;
> >>  
> >>  	if (big_oops_buf) {
> >> -		kmsg_dump_get_buffer(dumper, false,
> >> +		kmsg_dump_rewind(&iter);
> >
> > It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
> > in all callers.
> >
> > A solution might be to create the following in include/linux/kmsg_dump.h
> >
> > Then we could do the following at the beginning of both
> > kmsg_dump_get_buffer() and kmsg_dump_get_line():
> >
> > 	u64 clear_seq = latched_seq_read_nolock(&clear_seq);
> >
> > 	if (iter->cur_seq < clear_seq)
> > 		cur_seq = clear_seq;
> 
> I suppose we need to add this part anyway, if we want to enforce that
> records before @clear_seq are not to be available for dumpers.

Yup.

> > It might be better to avoid the infinite loop. We could do the following:
> >
> > static void check_and_set_iter(struct kmsg_dump_iter)
> > {
> > 	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
> > 		kmsg_dump_rewind(iter);
> > }
> >
> > and call this at the beginning of both kmsg_dump_get_buffer()
> > and kmsg_dump_get_line()
> >
> > What do you think?
> 
> On a technical level, it does not make any difference. It is pure
> cosmetic.

Yup.

> Personally, I prefer the rewind directly before the kmsg_dump_get calls
> because it puts the initializer directly next to the user.
> 
> As an example to illustrate my view, I prefer:
> 
>     for (i = 0; i < n; i++)
>         ...;
> 
> instead of:
> 
>     int i = 0;
> 
>     ...
> 
>     for (; i < n; i++)
>         ...;
> 
> Also, I do not really like the special use of 0/U64_MAX to identify
> special actions of the kmsg_dump_get functions.

Fair enough.

> > Note that I do not resist on it. But it might make the API easier to
> > use from my POV.
> 
> Since you do not resist, I will keep the API the same for v4. But I will
> add the @clear_seq check to the kmsg_dump_get functions.

Go for it.

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
