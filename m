Received: from ns.virtualhost.dk ([195.184.98.160] helo=virtualhost.dk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJCye-0003cr-4A
	for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2003 14:25:12 +0000
Date: Mon, 10 Nov 2003 15:23:41 +0100
From: Jens Axboe <axboe@suse.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031110142341.GG32637@suse.de>
References: <37CC93E8710D@baydel.com> <20031110140927.GE32637@suse.de>
	<1068473878.5743.6.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1068473878.5743.6.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: Simon Haynes <simon@baydel.com>
cc: linux-kernel@vger.kernel.org
Subject: Re: SFFDC and blksize_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 10 2003, David Woodhouse wrote:
> On Mon, 2003-11-10 at 15:09 +0100, Jens Axboe wrote:
> > On Fri, Nov 07 2003, Simon Haynes wrote:
> > > 
> > > I have been writing a block driver for SSFDC compliant SMC cards. This stuff 
> > > allocates 16k blocks.  When I get requests the transfers are split into the 
> > > size I specifty in the blksize_size{MAJOR] array. It sems that most things 
> > 
> > Sounds like a bad way to do it. It's much better to prevent builds of
> > bigger requests than you can handle in one go. You don't mention what
> > kernel you are using, but both 2.4 and 2.6 can do this for you.
> 
> The problem is the other way round -- he wants request merging, and he's
> achieving this by setting the block size higher.... and observing a
> crash when he sets his block size higher than PAGE_SIZE.

Yes I know, but he doesn't want requests merged > 16k, right? So it's
stupid to allow these to get through.

-- 
Jens Axboe
