Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gjX6-00021U-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 09:40:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020301035814.6942.qmail@web14708.mail.yahoo.com> 
References: <20020301035814.6942.qmail@web14708.mail.yahoo.com> 
To: Michael Michael <memmel2@yahoo.com>
Cc: jffs-dev@axis.com
Subject: Re: New Release 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Mar 2002 09:52:02 +0000
Message-ID: <6527.1014976322@redhat.com>
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

<moved to jffs list>

memmel2@yahoo.com said:
>  Would it be possible to get some idea of the current status of Jff2.
> What done?

The code in the 2.4.19 kernel, and on the jffs2-2_4-branch of CVS, should be 
stable and reliable enough to use in production. 

> What needs to be done?
> Whats wanted ?

See fs/jffs2/TODO in the CVS tree. The NAND support is mostly implemented, 
and needs lots and lots of testing. Joakim has made some good optimisations 
for speeding up the mount, and checkpointing will be helpful too if we can 
manage to get that implemented at last.

In roughly increasing order of required competence...

Just installing the code on the trunk and giving good bug reports if/when 
it fails is an extremely useful thing to do - don't underestimate the 
benefit of that even if looking at the code makes you run away screaming.
(Thomas keeps complaining that my documentation - or lack of it - sucks :)

Fixing i_nlink on directories ought to be a fairly reasonable introduction
to the code, and quite simple. Track the number of child directories that 
each directory has (you have a d_type in the dirent nodes so you don't need 
to actually look at the children at all) and increase i_nlink for each one 
in read_inode. I wouldn't increase the nlink in the jffs2_inode_cache 
itself, just in the vfs_inode. 

Implementing checkpointing would be good, and should dramatically improve 
mount time. 

It needs a complete locking audit. The 2.5 kernel just pushed the BKL down 
into the file systems, and I _think_ we can just remove it from JFFS2. I'm 
not actually doing that till I'm sufficiently convinced that the locking's 
sane though.

Also, a lot of people would love you for ever if you can make some 
guarantees about the amount of free space required to let GC continue, and 
hence reduce the overly-conservative five blocks that it's keeping free at 
the moment.

>  It looks like a lot of work has been done lately and I'd like to know
> how the core developers feel about the current status of the File
> system.  Should I upgrade now ! or wait a bit. 

As I said, the stable branch is stable. I'm valiantly resisting Joakim's
attempts to make me optimise it :)

The trunk is more fun - we do the fun stuff there. Even so, it should only 
be likely to break on NAND flash - the NOR support should still be OK.

> Also this is off topic but is there a web site group dedicated to the
> "fastest" boot time for linux. I'm down around 2 min. I think its
> pretty good but I don't know.

More than 10 seconds is crap. You must be using one of those horrid sucky 
PeeCee thingies I've heard so much about -- and without LinuxBIOS at that.

--
dwmw2
