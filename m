Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vR3o-0001XE-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 22:54:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AEDE11C.94AC9A22@vhbtech.com> 
References: <3AEDE11C.94AC9A22@vhbtech.com> 
To: Jeff Smith <jsmith@vhbtech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 May 2001 22:55:09 +0100
Message-ID: <17429.988926909@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


jsmith@vhbtech.com said:
>  I'm running jffs2 on a PPC/855T board. I mount the jffs2 and have two
> (2) test scripts that "dd" various sized files to the jffs2 flash. I
> seem to be running into a race condition or something.

> My 2 scripts just "dd" a bunch of files to the jffs2/flash, "ls -l "
> them, "rm *" them and then "ls -l" the dir/mnt point again in a loop.
> I'm running 2 of these and they always reach contention fairly
> quickly, ie. they lock up after 5 to 10 iterations. ps shows the
> processes sleeping. If I remove the "ls"portion of the scripts. That
> is I just "dd" and "rm" - everything "seems" ok.Anybody seen this? 

Sorry for the delayed response.

I've seen similar, and I thought I'd fixed it. You may have found a code 
path which I hadn't considered, and which still has locking problems. Or 
you may just be using the code from before I fixed it :)

What's the output of 'grep Id: fs/jffs2/*.[ch]'?

If it's still happening with the latest code, can you make sure you have 
SysRq enabled in your kernel and show me the backtraces of the offending 
processes? (SysRq-T and ksymoops for decoding)

--
dwmw2
