Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFEAC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:35:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416C164EFD
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416C164EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vLoifSs7dM48y8jQhy0nkCNnyeb5KN2Dt+YM6yCvAi0=; b=A2dPYSwcNVrb8jtN+tSgBlzEA
	VGWBecHhR7qTdvXJeEy7htnZBQKSXWtmm8g6VkHpb+x4mCMG57ZnAHQH3bw1Fbn3GlU/i3r7G0bkD
	HN3RhAOIZkWGWhC3eXymkrkB5hgCX4ISfnaFawOKHUkE9RCw5b+GCV7p4/vHt1NfJaaL+p02cVFX3
	7pTlya/SGzvM31jK0xCkaXDZNsa65GaVoX77y5JWuO6mbIRQicQzBkfHrIkCbj3X2sTRcyBP5FnMZ
	GQAs0hbSvoH0zuOG9yJyZIc28Rt4vfdFWm3Iw3vml07ZW42JFBJ174yj5Mpbf8sOEUzmrBxOtdADs
	tMuRbiwMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYD2-006RSW-Dd; Wed, 03 Mar 2021 20:35:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT6G-005J0C-GV
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LmimWd63WkUfPWADlD3zBnnPZ6h7AIB2oXCZzzXjlJw=; b=YVhwnJSzGz+CTDg1HW/Wj9kHm/
 f3ZnR4zJIFAu+oLbGBA1ZLQcLLJzgGNG/XIg71e7DeNAqOE0Yv6bA61miQ6LIysAd7NxOjYGZiMpT
 zjZjb7Lhgn3G3xAtu/FDw5dSHaRH3HTEtjOhgJ3uW6yfrjn7BqKUoFGbAHdaLflAVEZAMoXmCV/ig
 94xa26NhhQw55TwzQGrycX0UsMTqg8vKk2wj+PZMpjRAFq43COLwIzim4jmFDG884dj7Dj8k6+2gh
 bVOPyiMyPQpm2JxaTQHRJKFU3m1TohPvUNJEtc6Yti1pACXPuhrFsfPE8LHf4M1mtQWpN/HFW2I/g
 +o5eFnbg==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH4S0-00H7t4-3a
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 12:48:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614689304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmimWd63WkUfPWADlD3zBnnPZ6h7AIB2oXCZzzXjlJw=;
 b=mPQMTl8fVDM8qIPI5TkL3p1CaW2GOGMEx9OkvNmBms+ceLRjwgbXn3z390vKN806puhD2k
 cPbmjYXeCCaGE9ANqE0n2RVQRigw7DJw/ZEIEEfKc7+D/QJoydsSU0laPEz2jkqbC1h/5V
 vNprbyefwf+gWEYUGsnXZPAtZlcKSbg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFAE3AF63;
 Tue,  2 Mar 2021 12:48:23 +0000 (UTC)
Date: Tue, 2 Mar 2021 13:48:23 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH next v3 02/15] mtd: mtdoops: synchronize kmsg_dumper
Message-ID: <YD40FzHeLkpMXkxn@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-3-john.ogness@linutronix.de>
 <YDzaYqrk3Dv37uDa@alley> <87tuptq1fc.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuptq1fc.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_124836_360267_17558AAB 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue 2021-03-02 11:45:27, John Ogness wrote:
> On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
> >> The kmsg_dumper can be called from any context and CPU, possibly
> >> from multiple CPUs simultaneously. Since the writing of the buffer
> >> can occur from a later scheduled work queue, the oops buffer must
> >> be protected against simultaneous dumping.
> >> 
> >> Use an atomic bit to mark when the buffer is protected. Release the
> >> protection in between setting the buffer and the actual writing in
> >> order for a possible panic (immediate write) to be written during
> >> the scheduling of a previous oops (delayed write).
> >
> > Just to be sure. You did not use spin lock to prevent problems
> > with eventual double unlock in panic(). Do I get it correctly,
> > please?
> 
> I do not understand what possible double unlock you are referring to.

I was wrong. I meant the tricks that are under in console drivrers,
for example:

static void mvebu_uart_console_write(struct console *co, const char *s,
				     unsigned int count)
{
	int locked = 1;

	if (oops_in_progress)
		locked = spin_trylock_irqsave(&port->lock, flags);
	else
		spin_lock_irqsave(&port->lock, flags);

	/* do the job */

	if (locked)
		spin_unlock_irqrestore(&port->lock, flags);
}

But this is not a problem here because the kmsg dumper bails out
when the lock could not be taken.

> I chose not to use spinlocks because I wanted something that does not
> cause any scheduling or preemption side-effects for mtd. The mtd dumper
> sometimes dumps directly, sometimes delayed (via scheduled work), and
> they use different mtd callbacks in different contexts.
>
> mtd_write() expects to be called in a non-atomic context. The callbacks
> can take a mutex.

Makes sense. Could you please mention this in the commit message?

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
