Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CvJk5-0008BR-16
	for linux-mtd@lists.infradead.org; Sun, 30 Jan 2005 13:24:15 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
	<1106873065.21196.168.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
	<1106903029.21196.216.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280914580.11160@phoenix.infradead.org>
	<Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
Content-Type: text/plain
Date: Sun, 30 Jan 2005 21:23:40 +0300
Message-Id: <1107109420.18794.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-28 at 18:57 +0000, Artem B. Bityuckiy wrote:
> Hi,
> 
> I have recently described the JFFS2 memory consumption problem. David has
> suggested several ideas.
> 
> The best idea is the write-back cache, I think. But this touches the 
> memory
> consumption only by implication. It is really about IO speed improvement.
> So, I think we may discuss how to implement this WB cache in another 
> thread.
> I think this would be *very* good JFFS3 attribute.
> 
> Another David's Idea about the maximum inode node size augmentation is 
> also
> pretty nice for me. The idea to implement zisofs-like read is very good, I 
> think.
> I've noted both of these, hope this will be in the JFFS3 design.
> 
> But I have another, more radical idea. It decreases the memory consumption 
> better
> in most cases. While we currently have the linear dependency on nodes 
> number, my
> idea changes this to the dependency on inodes number.
> 
> Most often the nodes number is much larger then the number of inodes. But 
> there are
> exceptions there and my proposal will not help in these cases much.
> 
> Before describing Idea, some definitions:
> 
> Summary node
> ~~~~~~~~~~~
> The node which describes all other nodes in one block. Summaries are 
> placed at the
> end of each block. For each other node in this block summaries contain the 
> following
> information:
> 
> node offset within the block
> node length
> node type
> for direntry nodes:
>         direntry name
>         direntry target/parent inode
> for inode nodes:
>         inode number
>         data offset
> ...... may be something other.
> 
> Thus, if we want to know the block's layout, we may just read its summary 
> node.
> 
> Inode checkpoint node (ICP)
> ~~~~~~~~~~~~~~~~~~~~~~~~~~
> Checkpoint node describes all the nodes related to some inode. Checkpoints 
> may
> be placed anywhere within flash, as any other node. For each node related 
> to
> the inode the ICP contains:
> 
> 
> node offset within the flash
> node length
> node type
> for direntry nodes:
>         direntry name
>         direntry target/parent inode
> for inode nodes:
>         inode number
>         data offset
> ...... may be something other.
> 
> Just almost the same as summary, but the per-inode information.

Alternatively, in order to keep ICPs small, we may store in ICP only
references to all the summary nodes which contain at least one reference
to the inode's node. Thus, we will save some space, but lost some speed.

This means, say, if some inode has its nodes scattered over blocks
1,100,1003, then ICP's data will contain only these three digits.

> 
> 
> The Idea
> ~~~~~~~
> Imagine we have file system, where each inode has ICP and each block has 
> Summary.
> Then we may keep in-core only the positions of ICPs for each inode.
> 
> In this case:
> 1. when we need per-inode nedes list, we read ICP and we have it!
> 2. when we need per block nodes list, we read Summary and we have it!
> 
> No need to keep the per-block and per-inode node_ref lists in-core 
> anymore!
> 
> The per-inode list is only needed on the iget() call. After the iget() 
> call
> we will have the per-inode list in memory (say, in form of fragtree or the
> dirent list).
> 
> The per-block list is only needed for the Garbage Collection.
> 
> When the file is opened and it is changed, wee build the ICP of this file 
> in RAM.
> We flush this ICP on iput() call. Summaries are also being formed in RAM 
> and
> flushed when the block is almost full.
> 
> So far so good. But there are a bundle of problems we must solve.
> Just count some of them:
> 
> 1. Unclean reboots. In this case we will have no up-to-date ICPs and 
> Summaries.
> I hope in this case we still will be ables to use old JFFS2 algorithms.
> I suspect this case includes situations when we have no flash space to 
> flush ICPs
> or we are out of memory while forming it. We will just not write them then 
> which
> is similar to unclean reboot.
> 
> 2. GC tends to merge non-pristine nodes. So it changes ICPs, and the GC 
> process
> will be slower.
> 
> 3. Since we form ICPs of opened file in memory, we will possibly need to 
> reserve some
> flash space to be able to flush these ICPs on unmount. This needs very 
> accurate
> flash space accounting.
> 
> I believe these are not all problems, but think the biggest ones.
> At the first glance all of them are solvable.
> 
> Thanks for your comments.
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
