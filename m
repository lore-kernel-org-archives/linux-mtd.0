Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoHr7-000448-FW
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 07:40:22 -0400
Date: Wed, 16 May 2007 13:35:20 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Roland Dreier <rdreier@cisco.com>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516113519.GC5472@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<adar6pho5n3.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adar6pho5n3.fsf@cisco.com>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 May 2007 19:37:36 -0700, Roland Dreier wrote:
> 
> There are rather a lot of of FIXME comments, including scary stuff like
> 
>  > +	/*
>  > +	 * FIXME: this cannot be right but it does "fix" a bug of i_count
>  > +	 * dropping too low.  Needs more thought.
>  > +	 */
>  > +	atomic_inc(&old_dentry->d_inode->i_count);

Any thoughts on this would be appreciated.

> and
> 
>  > +int __logfs_write_inode(struct inode *inode)
>  > +{
>  > +	/*
>  > +	 * FIXME: Those two inodes are 512 bytes in total.  Not good to
>  > +	 * have on the stack.  Possibly the best solution would be to bite
>  > +	 * the bullet and do another format change before release and
>  > +	 * shrink the inodes.
>  > +	 */
>  > +	struct logfs_disk_inode old, new;
> 
> are you going to change the format?  or fix this some other way?

I would love to put my inodes on a diet.  It is just a matter of time
and priorities.  To me the 512 bytes on the stack are unfortunate, but
not a show stopper.  Crash behaviour is, so that has priority.

> I think a sweep through the code searching for FIXME and at least
> rewriting all such comments to look like stuff that can be deferred
> would be warranted ;)

Are you asking me to hide known problems under a rug? ;)

Will see if I can easily fix some of these.  In particular the
eat-your-data FIXME that can cause LogFS to not survive a crash.

Jörn

-- 
Correctness comes second.
Features come third.
Performance comes last.
Maintainability is easily forgotten.
