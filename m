Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D7Fba-0002cV-Qo
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 11:24:47 -0500
Date: Fri, 4 Mar 2005 17:24:43 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050304162443.GC19598@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
	<20050302144407.GA18893@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0503031108470.26599@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0503031108470.26599@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 and RAM consumprion reincarnated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 March 2005 11:09:12 +0000, Artem B. Bityuckiy wrote:
> 
> > I agree with tglx, your approach is complicated (aka horrible).  How
> > about something much simpler:
> Whel this is on of approaches I've already proposed :-)

Ok, sorry.  -ENOTIME, didn't read all previous postings, just your
references.

> > Disadvantages:
> > o Whenever we need to check the full node list, we take a few more
> >   indirections.
> I'll elaborate your "whenever" - this is iget() call at most. The 
> per-inode list might also be required when we have deals with 
> deletion/deleted direntries.

Yup.  Thanks for checking, I was too lazy.

> > Ultimate advantage: Design can be explained in less words. :)
> I don't think this is so important :-)

Not in English, no.  But a simple design is an indication of a simple
implementation - more robust, less buggy, pick your favorite
attribute.

> Again:
> > o Whenever we need to check the full node list, we take a few more
> >   indirections.
> Well, this might be serious disadvantage. Conceivably, there is a large 
> file which is distributed over a lot of blocks. The iget() of the relating 
> inode assumes:
> 
> for (all blocks relating to our inode)
> {
> 	Read_the_block_summary();
> 	Identify_the_position_of_all_the_inode's_nodes();
> 	for (all the nodes found)
> 	{
> 		Read_the_node();
> 	}
> }

Almost.  Unless I misread Read_the_block_summary() and you mean "take
the list of erase blocks from ICP"

> We risk to end up with extremely slow iget().

Hence, we should cache this.  Extremely slow iget() under memory
pressure is fine, still much faster than OOM.  Without memory
pressure, we'd have current performance.

> But yes, as I wrote earlier and as you has affirmed, this is fairly simple 
> and elegant idea. ICP is not needed here at all while summary nodes are 
> obligatory. And this fits well to the idea of superblock which is 
> distributed and encompasses summaries.

Well, I'd still store *some* information, namely the full list of
erase blocks containing nodes.  Not sure if that is necessary, maybe
you're right and we should get rid of this information as well.  Time
to code and test things.

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
