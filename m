Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFxTJ-0008P7-91
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 20:05:58 +0000
Date: Fri, 18 Jan 2008 18:39:01 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080118183900.GC21136@shareable.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<2B52FCEB-D871-4D9B-81D1-E03F7698AF96@logicaloutcome.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2B52FCEB-D871-4D9B-81D1-E03F7698AF96@logicaloutcome.ca>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Glenn Henshaw wrote:
>    I found a similar problem on an older 2.4.27 based system. We have  
> a 64k JFFS2 partition (1024 blocks of 4kbytes). As the file system  
> fills up, the time for any operation increases exponentially. When it  
> reaches 90% full, it takes minutes to write a file. After a cursory  
> inspection, it seems to block doing garbage collection and compressing  
> blocks.
> 
>    We gave up and limited the capacity to 60% full at the application  
> level.
> 
>    I'd appreciate any pointer to fix this, as migrating to a 2.6  
> kernel is not an option.

Yes!  I have exactly the same problem, except I'm using 2.4.26-uc0,
and it's a 1MB partition (16 blocks of 64kbytes).

I am tempted to modify the JFFS2 code to implement a hard limit of 50%
full at the kernel level.

The JFFS2 docs suggest 5 free blocks are enough to ensure GC is
working.  In my experience that does often work, but occasionally
there's a catastrophically long and CPU intensive GC.

-- Jamie
