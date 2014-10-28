Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.227]
 helo=cdptpa-oedge-vip.email.rr.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjAY9-0000Ik-KI
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 17:27:18 +0000
Date: Tue, 28 Oct 2014 13:26:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 7/7] docg3: Fix miuse of seq_printf return value
Message-ID: <20141028132654.7d020288@gandalf.local.home>
In-Reply-To: <20141028171409.GH1193@ld-irv-0074>
References: <20140929124246.3e39dac8@gandalf.local.home>
 <cover.1412031505.git.joe@perches.com>
 <c1a1138f1b05e87a3fbd8737af2f2c0be6e2724b.1412031505.git.joe@perches.com>
 <20141022082916.GD16128@brian-ubuntu>
 <20141028111301.22481f2a@gandalf.local.home>
 <1414511877.6643.12.camel@perches.com>
 <20141028120552.63c2324c@gandalf.local.home>
 <20141028171409.GH1193@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.cz>,
 linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Oct 2014 10:14:09 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Oct 28, 2014 at 12:05:52PM -0400, Steven Rostedt wrote:
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
> 
> I'll keep this in my tree as-is for now. Let me know if you still need
> something changed. I can give my 'Ack' if you really want to pull this
> into a separate branch.

If I get to a point where I can change the seq_printf() to return void,
then I'll want it, otherwise without it, it will cause my branch to fail
to compile on that code.

That's why I would like it. If we keep it in your tree and have that for
the next release, it will matter which tree goes into Linus's tree
first. If mine goes in first, then it will break his build.

Now, that's assuming I get this ready for 3.19, as I'll need quite a
few Acked-by's for the changes that I'll be making. If I don't get it
by 3.19, then it wont be an issue if that change goes in with your tree.

-- Steve

> 
> BTW, I just noticed the $subject has a typo: s/miuse/misuse/
