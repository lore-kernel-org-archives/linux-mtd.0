Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLjOX-0006fy-E3
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 11:03:10 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050413T160136-559@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
Content-Type: text/plain
Date: Wed, 13 Apr 2005 19:02:36 +0400
Message-Id: <1113404557.23175.23.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-13 at 14:22 +0000, Sergei Sharonov wrote:
> I will try that. My log data is comming in 1 kB chunks, so in order to do
> 4 kB at a time I will have to implement some sort of <power fail safe>
> buffering.
It isn't obligatory to write by 4K. But if you write *intensively*, it
will be very helpful. Otherwise, just stay with 1K. And of course, the
best way to try both variants. You may try 4k without the "power fail"
things and decide whether it helps or not.

> Hmm.. ls is not a writer but it is blocked as well.
It may be blocked but for shorter time (checking one ore few inodes, not
all). Do you have very big files or directories with a lot of L1
children ?

> # time umount /mnt/flash/
> 
> real    11m25.534s
> user    0m0.000s
> sys     0m0.250s
Well, this is bad. I may suggest where to dig:

on unmount jffs2_stop_garbage_collect_thread() is called, sends SIGKILL
to the GC thread and waits for it. Meanwhile, GC thread revolves around
at jffs2_garbage_collect_pass() calling jffs2_do_crccheck_inode() for
all inodes. Theoretically it returns after it checks an inode and
processes signals (background.c:115).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
