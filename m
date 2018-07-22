Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhEms-0000sT-7B
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2018 13:52:40 +0000
Date: Sun, 22 Jul 2018 14:49:58 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Theuns Verwoerd <Theuns.Verwoerd@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] jffs2: Provide jffs2_sync files to track gc POLL
 progress
Message-ID: <20180722134958.GE30522@ZenIV.linux.org.uk>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <20180720000431.GA30522@ZenIV.linux.org.uk>
 <b2b2e3e0-14b7-9f46-434d-2134d1d0cfad@alliedtelesis.co.nz>
 <CAFLxGvyTmz8JQVn-OJFSVdns74o49XgdWbhGpPsqYe5S2uahYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvyTmz8JQVn-OJFSVdns74o49XgdWbhGpPsqYe5S2uahYg@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 22, 2018 at 03:17:07PM +0200, Richard Weinberger wrote:

> On Fri, Jul 20, 2018 at 2:54 AM, Theuns Verwoerd
> <Theuns.Verwoerd@alliedtelesis.co.nz> wrote:
> >
> > On 07/20/2018 12:04 PM, Al Viro wrote:
> >> On Fri, Jul 20, 2018 at 11:50:12AM +1200, Theuns Verwoerd wrote:
> >>
> >>> +ssize_t jffs2_sync_file_read(struct file *f,
> >>> +          char __user *b, size_t len, loff_t *ofs)
> >>> +{
> >>> +    struct jffs2_sb_info *c = file_inode(f)->i_private;
> >>> +
> >>> +    while (c->tidemark)
> >>> +            schedule();
> >>> +
> >>> +    return 0;
> >>> +}
> >> Brilliant.  So when that gets called with c->tidemark being true and
> >> need_resched() - false, we shall...
> > By my reading, schedule() will happily force a reschedule (once) when
> > need_resched() is false.  Every time the process is granted a time
> > slice, it'll check the condition and surrender if not ready.

Except that the task remains runnable (and not using its timeslice up).
It won't sleep; there's nothing to drive it into TASK_NOT_RUNNING
state.

Try it and watch what's going on when you trigger that loop.  That's
really not a good way to wait for something to happen.
