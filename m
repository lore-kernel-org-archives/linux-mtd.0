Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KxVpI-0004QD-2H
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 00:00:48 +0000
Date: Tue, 4 Nov 2008 16:00:27 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Viktor Rosendahl <Viktor.Rosendahl@nokia.com>
Subject: Re: [PATCH 1/1] Make sure that any oops is flushed to the mtdoops
	console
Message-Id: <20081104160027.d80249fb.akpm@linux-foundation.org>
In-Reply-To: <1225458328.16867.23.camel@viktor.research.nokia.com>
References: <1224688588-2665-1-git-send-email-viktor.rosendahl@nokia.com>
	<1224688588-2665-2-git-send-email-viktor.rosendahl@nokia.com>
	<20081030131734.c74e614d.akpm@linux-foundation.org>
	<1225458328.16867.23.camel@viktor.research.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 Oct 2008 15:05:28 +0200
Viktor Rosendahl <Viktor.Rosendahl@nokia.com> wrote:

> On Thu, 2008-10-30 at 13:17 -0700, ext Andrew Morton wrote: 
> > On Wed, 22 Oct 2008 18:16:28 +0300
> > Viktor Rosendahl <viktor.rosendahl@nokia.com> wrote:
> <clip> 
> > >  void __attribute__((weak)) bust_spinlocks(int yes)
> > > @@ -22,6 +23,7 @@ void __attribute__((weak)) bust_spinlocks(int yes)
> > >  #ifdef CONFIG_VT
> > >  		unblank_screen();
> > >  #endif
> > > +		console_unblank();
> > >  		if (--oops_in_progress == 0)
> > >  			wake_up_klogd();
> > >  	}
> > 
> > That looks logical.  From my reading we can now remove that
> > unblank_screen(), because the console_unblank() will call
> > vt_console_driver.unblank() for us?
> 
> For some reason, we did not think about it here when the N810 kernel was
> fixed. It looks good to me but if you do it, then there will be a slight
> difference in behavior, since console_unblank() will call
> vt_console_driver.unblank() only if the console_sem can be acquired,
> otherwise it just returns without doing anything.
> 
> Maybe console_unblank() should be changed to not care too much about the
> console_sem if an oops is in progress? 
> 

hm, yeah.  Things get messy if we take an oops with console_sem held.

I'll drop the cleanup patch - I don't have time to think about and test
anything useful like that :(
