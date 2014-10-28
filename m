Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.231]
 helo=cdptpa-oedge-vip.email.rr.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjAdw-0003Ki-MD
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 17:33:17 +0000
Date: Tue, 28 Oct 2014 13:32:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 7/7] docg3: Fix miuse of seq_printf return value
Message-ID: <20141028133253.223e47f7@gandalf.local.home>
In-Reply-To: <1414517260.6643.21.camel@perches.com>
References: <20140929124246.3e39dac8@gandalf.local.home>
 <cover.1412031505.git.joe@perches.com>
 <c1a1138f1b05e87a3fbd8737af2f2c0be6e2724b.1412031505.git.joe@perches.com>
 <20141022082916.GD16128@brian-ubuntu>
 <20141028111301.22481f2a@gandalf.local.home>
 <1414511877.6643.12.camel@perches.com>
 <20141028120552.63c2324c@gandalf.local.home>
 <1414517260.6643.21.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Oct 2014 10:27:40 -0700
Joe Perches <joe@perches.com> wrote:

> On Tue, 2014-10-28 at 12:05 -0400, Steven Rostedt wrote:
> > On Tue, 28 Oct 2014 08:57:57 -0700
> > Joe Perches <joe@perches.com> wrote:
> > 
> > > On Tue, 2014-10-28 at 11:13 -0400, Steven Rostedt wrote:
> > > > I'm going to be working on changes to remove the return value of
> > > > seq_printf() and friends.
> > > 
> > > I'm sure you know all of this, but for anyone else:
> > > 
> > > This doesn't need to be done in a single pass.
> > 
> > Yeah, I took a look at all the places, and I've decided to take it off
> > in chunks. I'm starting with the ones you posted, and will try to get
> > acks for them. And then go after other chunks as I have time.
> > 
> > I would like to get this done before I do my merge of trace_seq and
> > seq_file, but I'm thinking I may have to do that in parallel.
> 
> I think the most important thing is to get the
> seq_is_overflown (or seq_has_overflowed or whatever
> other name is chosen) function added then the rest
> of the patches can be applied whenever maintainers
> (or Andrew or trivial or ...) pick them up.

I can get that in without much of an issue. But the merge of trace_seq
and seq_file would be easier if I didn't have to worry about return
values. Which is why I want to get this in quickly.

-- Steve
 
