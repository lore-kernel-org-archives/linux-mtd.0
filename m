Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KxaOC-0007wa-2c
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 04:53:08 +0000
Received: by fg-out-1718.google.com with SMTP id l26so3013400fgb.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Nov 2008 20:53:06 -0800 (PST)
Message-ID: <6b5362aa0811042053hc52788h9ae5ec14c035f29e@mail.gmail.com>
Date: Wed, 5 Nov 2008 10:23:06 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
In-Reply-To: <1225188544.18031.172.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6b5362aa0810212338k80de19ci893b9fb4b7802ce4@mail.gmail.com>
	<9c9fda240810220042g186045a5rba39d6b4006906c3@mail.gmail.com>
	<1225188544.18031.172.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,
  Sorry for the delayed response.

>> >      I have gone through all  the mailing archive possible. Kyungmin park
>> > had reported the problem,
>> >  but I could not find the fix.
>> >
>> >      Here is the mail:
>> > http://lists.infradead.org/pipermail/linux-mtd/2007-April/017979.html
>> >
>> >      Any idea,why this BUG occurs/occurred? Is there any fix available?
>>

>
> Does this fix it?
>
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index 8adebd3..3cceef4 100644
> --- a/fs/jffs2/background.c
> +++ b/fs/jffs2/background.c
> @@ -85,15 +85,15 @@ static int jffs2_garbage_collect_thread(void *_c)
>        for (;;) {
>                allow_signal(SIGHUP);
>        again:
> +               spin_lock(&c->erase_completion_lock);
>                if (!jffs2_thread_should_wake(c)) {
>                        set_current_state (TASK_INTERRUPTIBLE);
> +                       spin_unlock(&c->erase_completion_lock);
>                        D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread sleeping...\n"));
> -                       /* Yes, there's a race here; we checked jffs2_thread_should_wake()
> -                          before setting current->state to TASK_INTERRUPTIBLE. But it doesn't
> -                          matter - We don't care if we miss a wakeup, because the GC thread
> -                          is only an optimisation anyway. */
>                        schedule();
> -               }
> +               } else
> +                       spin_unlock(&c->erase_completion_lock);
> +
>
>                /* This thread is purely an optimisation. But if it runs when
>                   other things could be running, it actually makes things a
>
> --
> David Woodhouse                            Open Source Technology Centre
> David.Woodhouse@intel.com                              Intel Corporation

Yes this patch fixed the problem.I have tested with fsstress for 2
days.I could not reproduce the BUG again.


Thanks,
Brijesh
