Received: from [2600:3c00::f03c:91ff:fedf:a84c]
 (helo=li107-171.members.linode.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDOmh-0006eh-O1
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 23:29:40 +0000
Date: Thu, 29 Mar 2012 19:29:29 -0400
From: Josh Cartwright <joshc@linux.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] jffs2: Fix lock acquisition order bug in gc path
Message-ID: <20120329232929.GA21848@joshcartwright.net>
References: <20120209185043.GA12089@joshcartwright.net>
 <CAN8TOE-9fxbc8PM8oNVBc_tUdkYBhV6jTG8_M5GdjLNGpLhKKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE-9fxbc8PM8oNVBc_tUdkYBhV6jTG8_M5GdjLNGpLhKKA@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 29, 2012 at 08:38:41AM -0700, Brian Norris wrote:
> On Thu, Feb 9, 2012 at 10:50 AM, Josh Cartwright <joshc@linux.com> wrote:
> > The locking policy is such that the erase_complete_block spinlock is
> > nested within the alloc_sem mutex.  This fixes a case in which the
> > acquisition order was erroneously reversed.  This issue was caught by
> > the following lockdep splat:
> 
> (Bump.) Anybody interested in this patch? It seemed sane to me, and I
> had it sitting in my inbox. It does need a trivial rebase, BTW.

I'm certainly still interested in it, for what its worth :).  We've had
no problems here for the month and a half its been in our tree.

I'll send out a rebased V2.

Thanks!

-- 
                                            joshc
