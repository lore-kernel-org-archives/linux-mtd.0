Return-Path: <SRS0=HSOd=TJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D83DC04AB2
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 17:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2652821783
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 17:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eRo2qj7i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdWshXc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2652821783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6dGQ4A1r1bBYgSYRe8XNCU/7YnXHlTrOrxcmO/3eZE=; b=eRo2qj7i71m3XT
	OSSwu46es7g0r8bppxpIByo5JEjn6+jGopTHQC7bD6K/KlbEsvlNQAJUYCZCm6pwmL01tVgfaK4RZ
	6zqvz1H2+FNJiw9cIBKNFTvPEvYti+AvTVsZ3DTP+scbZem0CAjnLuhRZYk+rwS0mtH6Ic2s7S4ns
	P5F7jadAQdJCiXmmd87hAf5na09ixJ079WwEurUzn/2oodQ3jsYpYZ4IUFa3mBlLVxfKMFPOxieHQ
	YR1LWcERBc9a+U4P7NTI84PZuCKQkZgrgZc6Zwj5+fEgqEZ0Kx45+QEeY1Xr/XPeZ6ZlYlgkLJM8G
	8Mua7dTO56FOmY8oYATA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOnDL-0001pQ-B2; Thu, 09 May 2019 17:52:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOnDH-0001p3-Nz
 for linux-mtd@lists.infradead.org; Thu, 09 May 2019 17:52:13 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 394A22089E;
 Thu,  9 May 2019 17:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557424330;
 bh=Q+NEUhEfesdtpbm997jYCs46930hctabkdnGWE26v/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QdWshXc1IKQ3jOa/reEouhy0vBf7qUNuNhtYUSpRy9xhiwp3m5iX87nBkwRxpOQRD
 0fI1jvsLUCsOZlAEZoGnUt49Jfo7nzu9/aVpPTfB6f26TUpbY2VbIngqR3IN1vcpsx
 Ukj+yokejJzjx/zaw8dCU5x4cJzzgNKWUb4w23/M=
Date: Thu, 9 May 2019 10:52:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: BUG: soft lockup in kvm_vm_ioctl
Message-ID: <20190509175207.GA12602@gmail.com>
References: <000000000000fb78720587d46fe9@google.com>
 <20190502023426.GA804@sol.localdomain>
 <CACT4Y+YHFH8GAhDaNdNNTVFFx6YfKSL19cLPx2vpP-YngzS6kQ@mail.gmail.com>
 <CACT4Y+biO9GEN16Rak_1F+UdvhTe3fUwVf_VWRup2xrgvr9WKA@mail.gmail.com>
 <20190509031849.GC693@sol.localdomain>
 <CACT4Y+bz-aFJ2PbqJKL7veWavZkLw5nq+RFnnTveXMowRMVY4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+bz-aFJ2PbqJKL7veWavZkLw5nq+RFnnTveXMowRMVY4Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_105211_818976_B4D8B1EA 
X-CRM114-Status: GOOD (  32.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Ingo Molnar <mingo@kernel.org>, KVM list <kvm@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, jbaron@redhat.com,
 Rik van Riel <riel@surriel.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, adrian.hunter@intel.com,
 Steven Rostedt <rostedt@goodmis.org>, David Miller <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>, syzkaller <syzkaller@googlegroups.com>,
 linux-mtd@lists.infradead.org, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 syzbot <syzbot+8d9bb6157e7b379f740e@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 09, 2019 at 04:22:56PM +0200, 'Dmitry Vyukov' via syzkaller wrote:
> > > > > Can the KVM maintainers take a look at this?  This doesn't have anything to do
> > > > > with my commit that syzbot bisected it to.
> > > > >
> > > > > +Dmitry, statistics lession: if a crash occurs only 1 in 10 times, as was the
> > > > > case here, then often it will happen 0 in 10 times by chance.  syzbot needs to
> > > > > run the reproducer more times if it isn't working reliably.  Otherwise it ends
> > > > > up blaming some random commit.
> > > >
> > > > Added a note to https://github.com/google/syzkaller/issues/1051
> > > > Thanks
> > >
> > > As we increase number of instances, we increase chances of hitting
> > > unrelated bugs. E.g. take a look at the bisection log for:
> > > https://syzkaller.appspot.com/bug?extid=f14868630901fc6151d3
> > > What is the optimum number of tests is a good question. I suspect that
> > > the current 10 instances is close to optimum. If we use significantly
> > > more we may break every other bisection on unrelated bugs...
> > >
> >
> > Only because syzbot is being super dumb in how it does the bisection.  AFAICS,
> > in the example you linked to, buggy kernels reliably crashed 10 out of 10 times
> > with the original crash signature, "WARNING in cgroup_exit".  Then at some point
> > it tested some kernel without the bug and got a different crash just 1 in 10
> > times, "WARNING: ODEBUG bug in netdev_freemem".
> >
> > The facts that the crash frequency was very different, and the crash signature
> > was different, should be taken as a very strong signal that it's not the bug
> > being bisected for.  And this is something easily checked for in code.
> >
> > BTW, I hope you're treating fixing this as a high priority, given that syzbot is
> > now sending bug reports to kernel developers literally selected at random.  This
> > is a great way to teach people to ignore syzbot reports.  (When I suggested
> > bisection originally, I had assumed you'd implement some basic sanity checks so
> > that only bisection results likely to be reliable would be mailed out.)
> 
> 
> 
> While I believe we can get some quality improvement by shuffling
> numbers. I don't think we can get significant improvement overall and
> definitely not eliminate wrong bisection results entirely. It's easy
> to take a single wrong bisection and design a system around this
> scenario, but it's very hard to design a system that will handle all
> of them in all generality. For example, look at these bisection logs
> for cases where reproduction frequency varies from 1 to all, but
> that's still the same bug:
> https://syzkaller.appspot.com/x/bisect.txt?x=12df1ba3200000
> https://syzkaller.appspot.com/x/bisect.txt?x=10daff1b200000
> https://syzkaller.appspot.com/x/bisect.txt?x=1592b037200000
> https://syzkaller.appspot.com/x/bisect.txt?x=11c610a7200000
> https://syzkaller.appspot.com/x/bisect.txt?x=17affd1b200000

In all those, the bisection either blamed the wrong commit or failed entirely.
So rather than supporting your argument, they're actually examples of how a
reproduction frequency of 1 causes the result to be unreliable.

> You also refer to "a different crash". But that's not a predicate we
> can have. And definitely not something that is "easily checked for in
> code". Consider, a function rename anywhere in the range will lead to
> as if a different crash. If you look at all bisection logs you find
> lots of amusing cases where something that a program may consider a
> different bugs is actually the same bug, or the other way around. So
> if we increase number of tests and we don't have a way to distinguish
> crashes (which we don't), we will necessary increase incorrect results
> due to unrelated bugs.
> 
> Bisection is a subtle process and the predicate, whatever logic it
> does internally, in the end need to produce a single yes/no. And a
> single wrong answer in the chain leads to a completely incorrect
> result. There are some fundamental reasons for wrong results:
>  - hard to reproduce bugs (not fixable)
>  - unrelated bugs/broken builds (fixable)
> While tuning numbers can pepper over these to some degree (maybe),
> these reasons will stay and will lead to incorrect results. Also I
> don't this tuning as something that is trivially to do as you suggest.
> For example, how exactly do you assess a crash as reliably happening
> vs episodically? How exactly do you choose number of tests for each
> case? Choosing too few tests will lead to incorrect results, choosing
> too many will lead to incorrect results. How exactly do you assess
> that something that was happening reliably now does not happen
> reliably? How do you assess that a crash is very different? Each of
> the choices have chances of producing more bad results, so one would
> need to rerun hundreds of bisections with old/new version, and then
> manually mark results and then estimate quality change (which most
> likely will be flaky or inconclusive in lots of cases). Tuning quality
> of heuristics-based algorithms is very time consuming, especially if
> each experiment takes weeks.
> 
> There is another down-side for not "super dumb" algorithms. Which is
> explaining results. Consider that syzbot now mails a bisection where
> the crash happened and a developer sees that it's the same crash, but
> syzbot says "nope. did not crash". That will cause reasonable
> questions and somebody (who would that be?) will need to come and
> explain what happens and why, and how that counter-intuitive local
> result was shown to improve quality overall. Simpler algorithms are
> much easier to explain.

What I have in mind is that syzbot would assign a confidence level to each
bisection log.

Start at 100% confident.

If multiple different crash signatures were seen, decrease the confidence level.

If the crash is probabilistic (sometimes occurred n/10 times where 1 <= n <= 9),
decrease the confidence level again.  If it ever occurred just 1 time, decrease
it a lot more.  OFC it could be a smarter, more complex calculation using some
formula, but this would be the minimum.

If bisection ended on merge commit, release commit, or is obviously a non-code
change (e.g. only modified Documentation/), decrease the confidence level again.

Then:

- If bisection result is very confident, mail out the result as-is.
- If bisection result is somewhat confident, mail out the result with a warning
  that syzbot detected that it may be unreliable.
- Otherwise don't mail out the result, just keep it on the syzbot dashboard.

Yes, these are heuristics.  Yes, they will sometimes be wrong and cause false
negatives.  I don't need you to go into multi page explanation of all the
theoretical edge cases.  But they should reduce false positive rate massively,
which will encourage people to actually look at the reports...

It seems you don't want to be "responsible" for a false negative, so you just
send out every result.  But that just makes the reports low quality so people
ignore them, which is much worse.  The status quo of sending reports to authors
of kernel commits selected at random is really not acceptable.

> 
> I consider bisection as high priority, but unfortunately only among
> other high priority and very high priority work.
> Besides work on the fuzzer itself and bug detection tools, we now test
> 15 kernels across 6 different OSes. Operational work can't be
> deprioritized because then nothing will work at all. Change reviews
> can't be deprioritized. Overseeing bug flow can't be deprioritized.
> Updating crash parsing in response to new kernel output can't be
> deprioritized. Answering all human emails can't be deprioritized.
> 

So don't be surprised when people ignore syzbot reports for the same reason.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
