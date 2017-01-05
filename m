Received: from avasout05.plus.net ([84.93.230.250])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cP9ac-00075v-SS
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 15:04:28 +0000
Date: Thu, 5 Jan 2017 15:04:02 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: goliath <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
Message-ID: <20170105150402.GA3931@mcrowe.com>
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
 <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
 <20170105141834.GA3198@mcrowe.com>
 <20170105154824.5c9e97ee@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170105154824.5c9e97ee@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 05 January 2017 at 15:48:24 +0100, Boris Brezillon wrote:
> On Thu, 5 Jan 2017 14:18:34 +0000
> Mike Crowe <mac@mcrowe.com> wrote:
> > On Thursday 05 January 2017 at 14:38:23 +0100, goliath wrote:
> > > If your boot loader seeks to a specific erase block by counting
> > > only good blocks (to load the kernel or some second stage?), what
> > > happens if another block in between goes bad? Does that just brick
> > > your board or do you have to move the data around all the time to
> > > account for that?  
> > 
> > The blocks in-between don't get written so they can't be marked bad.
> 
> Maybe not the block in between, but the first block used to store your
> 2nd stage bootloader (or whatever your store at this offset) might
> become bad, which means your data will be moved to the next block (or
> possibly farther).

In our case we always write the remainder of the partition so any bad
blocks that develop will shift everything else down too. You're correct
that this would be a problem if we attempted to write in the middle though.

> I think this request is acceptable (even if I don't like the option
> name :-)), but I'll let Richard and David decide what to do with this
> patch.

I'm not particularly attached to the option name. I chose
"--skip-bad-blocks-to-start" in the hope of being as clear as possible, but
I agree that it is a mouthful! The confusion over the meaning of the option
was also one of the reasons why I originally implemented the feature using
a separate offset.

Thanks for the review.

Mike.
