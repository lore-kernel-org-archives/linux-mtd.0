Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D7XR8-00089X-27
	for linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 06:27:11 -0500
Date: Sat, 5 Mar 2005 12:27:09 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050305112709.GA7160@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
	<20050302144407.GA18893@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0503031108470.26599@phoenix.infradead.org>
	<20050304162443.GC19598@wohnheim.fh-wedel.de>
	<1110021341.5169.33.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110021341.5169.33.camel@sauron.oktetlabs.ru>
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

On Sat, 5 March 2005 14:15:40 +0300, Artem B. Bityuckiy wrote:
> On Fri, 2005-03-04 at 17:24 +0100, Jörn Engel wrote:
> > Not in English, no.  But a simple design is an indication of a simple
> > implementation - more robust, less buggy, pick your favorite
> > attribute.
> Simple and clear design is certainly of high priority. But again, I
> afraid the performance will suffer too much.

I don't care.  Code, test.  If tests agree with you, you win.

> > Almost.  Unless I misread Read_the_block_summary() and you mean "take
> > the list of erase blocks from ICP"
> ICP contains per-inode information. Physical nodes are placed
> everywhere.
> Summary node contains per-block information, i.e., one summary node
> describes all the nodes in the current block. We suppose JFFS3 supports
> summaries.
> 
> Consequently, Read_the_block_summary() means read the summary node, no
> need to scan block.

Ok, sorry.  s/ICP/IBL/
IBL is the Inode Block List, which contains all erase blocks
containing valid nodes.  It may contain more, but not less.

> > Hence, we should cache this.  Extremely slow iget() under memory
> > pressure is fine, still much faster than OOM.  Without memory
> > pressure, we'd have current performance.
> Hmm. Do you know whether it possible to register JFFS2-specific "reap"
> function ?

set_shrinker

> > Well, I'd still store *some* information, namely the full list of
> > erase blocks containing nodes.  Not sure if that is necessary, maybe
> > you're right and we should get rid of this information as well. 
> No need to create ICP to store this IMO.

Could be.  The IBL will reduce the number of erase blocks to test
(performance), but increase the memory consumption again.  As usual,
we need to test to see if the tradeoff is worth it.

> > Time to code and test things.
> I think it is a bit early. We need to discuss and agree on something.
> Then document it and agree again. :-) If there are several approaches,
> I'd like to design them all :-)
> I'll try to gather all together and document this. I'd be happy to get
> some help :=)

I personally hate to discuss, agree, document, carve in stone and have
the pope sprinkle holy water over something that may not survive the
first contact with reality.  Get some cold hard numbers, noone will
disagree with those.

If the case was obvious, yes, we could go down your path.  But our
discussion already proves, it's not.

> Furthermore, I'd like to discuss several extra ideas, e.g.:
> *	Separate users writes and GC writes between different blocks.
> *	Deletion direntries processing. It is far no good in JFFS3.

Sure.  Seperate threads?

Jörn

-- 
It's not whether you win or lose, it's how you place the blame.
-- unknown
