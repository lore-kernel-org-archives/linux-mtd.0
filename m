Received: from an-out-0708.google.com ([209.85.132.250])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDml9-0007sn-Nq
	for linux-mtd@lists.infradead.org; Sat, 12 Jan 2008 20:15:23 +0000
Received: by an-out-0708.google.com with SMTP id c3so336025ana.99
	for <linux-mtd@lists.infradead.org>;
	Sat, 12 Jan 2008 12:15:13 -0800 (PST)
Date: Sat, 12 Jan 2008 14:15:08 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080112141508.22b19686@vader.jdub.homelinux.org>
In-Reply-To: <20080112100343.GC1497@shareable.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jeff S <jsolman33@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 12 Jan 2008 10:03:43 +0000
Jamie Lokier <jamie@shareable.org> wrote:

> Josh Boyer wrote:
> > The open call doesn't cause any writes, and close
> > is supposed to flush all pending writes before it returns.
> 
> Oh, that's interesting.  So on JFFS2, fsync() is unnecessary before close()?
> 
> (On other filesystems it's necessary, of course).

To be honest, it doesn't really matter if it's necessary or not.
Writing an application to do as little as possible based on implicit
knowledge of the underlying filesystem seems like a really bad idea.
Particularly with the behavior of the filesystem can change based on
which config options you have set (writebuffer, etc).

Write you applications to be portable and cautious and you shouldn't
have a problem.

josh
