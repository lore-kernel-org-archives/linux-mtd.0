Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDGRh-0002MC-Ux
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 17:16:58 +0000
Received: by mail-lb0-f178.google.com with SMTP id c11so3378106lbj.37
 for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2014 10:15:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140801165607.GM18016@ZenIV.linux.org.uk>
References: <1406909172-7219-1-git-send-email-jharris@westell.com>
 <20140801165607.GM18016@ZenIV.linux.org.uk>
Date: Fri, 1 Aug 2014 13:15:45 -0400
Message-ID: <CAGMfbUPOMKVkZuZtzoN-w5pTpjHMzYhrdaM2WuBdm7RSMsNYAw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Re-enable write-buffering after filesystem sync
From: Jeff Harris <jefftharris@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Jeff Harris <jharris@westell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 1, 2014 at 12:56 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, Aug 01, 2014 at 12:06:12PM -0400, Jeff Harris wrote:
>
> > +     spin_lock(&c->wbuf_dwork_lock);
> >       cancel_delayed_work_sync(&c->wbuf_dwork);
>
> Umm...  Usually ..._sync in function name is a sign of potential sleeper,
> and calling those under a spinlock is a bad idea.
>
> And looking at the definition of cancel_delayed_work_sync() turns up the
> following call chain: cancel_delayed_work_sync() -> __cancel_work_timer() ->
> flush_work() -> wait_for_completion(), which definitely isn't something
> you should ever do under a spinlock.

The jffs2_dirty_trigger function calls queue_delayed_work under the spinlock.
I suppose the flag could be reset after the cancel so the dirty
trigger would see
the false value.

>
>
> While we are at it, you follow that with
> > +     c->wbuf_queued = 0;
> > +     spin_lock(&c->wbuf_dwork_lock);
> which would be broken even if cancel_delayed_work_sync() hadn't blocked.
> That's easily fixed, of course, (s/lock/unlock/).  cancel_delayed_work_sync()
> under a spinlock is more serious...

Whoops, sorry about that.

Jeff
