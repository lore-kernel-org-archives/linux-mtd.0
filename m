Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14WM83-0006Ff-00
	for mtd-list@infradead.org; Fri, 23 Feb 2001 17:35:39 +0000
Message-ID: <3A96A5CF.82BDE33E@danielind.com>
Date: Fri, 23 Feb 2001 12:02:55 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does not r
 egister block device!
References: <3A9595A4.D98A5CF@danielind.com>  <Pine.LNX.4.30.0102222154410.7303-100000@imladris.demon.co.uk> <20965.982916696@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> vmalik@danielind.com said:
> >  Are you saying that you'll not fix this "bug" for me ;) Would saying
> > please help :)
>
> Heh. Of course I'll help. Not sure how best to go about it, though. Init
> order dependencies are ugly. rd_load() should probably be one of the last
> things in the boot sequence, rather than an initcall. Can you add it to
> init/main.c just before mount_root()?

Ok, I did it in my kernel and that worked too, but that's not the permanent
solution is it?


>
>
> > > We'll have JFFS2 (with compression) ready to roll out quite soon :)
>
> > Well, there still would be reasons to decompress a root file system
> > into ramdisk and run from there, namely:
>
> Definitely. Just pushing my new baby, that's all :)
>
> >  3. Compressibility: I would hazard a guess that the compressibility
> > obtained with compressing an entire file system image would be better
> > than that obtained with just compressing individual inode data.
>
> Yep. Actually we only compress a single page at a time
> in jffs2, not even the whole inode.

Do you have any figures as to how well it compresses vs say gzip -9?

Do you know why nobody added bzip2 support for compressed root file systems?
bzip2
does a better job at compression. Size of the code?

Vipin

>
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
