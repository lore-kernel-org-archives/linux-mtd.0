Received: from sj-iport-3-in.cisco.com ([171.71.176.72]
	helo=sj-iport-3.cisco.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho9Ou-0007Ay-W0
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 22:38:07 -0400
To: =?iso-8859-1?Q?J=C3=B6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
References: <20070515151919.GA32510@lazybastard.org>
From: Roland Dreier <rdreier@cisco.com>
Date: Tue, 15 May 2007 19:37:36 -0700
In-Reply-To: <20070515151919.GA32510@lazybastard.org> (=?iso-8859-1?Q?J=C3?=
	=?iso-8859-1?Q?=B6rn?= Engel's message of "Tue, 15 May 2007 17:19:20
	+0200")
Message-ID: <adar6pho5n3.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

There are rather a lot of of FIXME comments, including scary stuff like

 > +	/*
 > +	 * FIXME: this cannot be right but it does "fix" a bug of i_count
 > +	 * dropping too low.  Needs more thought.
 > +	 */
 > +	atomic_inc(&old_dentry->d_inode->i_count);

and

 > +int __logfs_write_inode(struct inode *inode)
 > +{
 > +	/*
 > +	 * FIXME: Those two inodes are 512 bytes in total.  Not good to
 > +	 * have on the stack.  Possibly the best solution would be to bite
 > +	 * the bullet and do another format change before release and
 > +	 * shrink the inodes.
 > +	 */
 > +	struct logfs_disk_inode old, new;

are you going to change the format?  or fix this some other way?

I think a sweep through the code searching for FIXME and at least
rewriting all such comments to look like stuff that can be deferred
would be warranted ;)

 - R.
