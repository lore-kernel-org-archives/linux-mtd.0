Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D7XZy-0008Tq-BC
	for linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 06:36:20 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050304162443.GC19598@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0503011627270.19992@phoenix.infradead.org>
	<20050302144407.GA18893@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0503031108470.26599@phoenix.infradead.org>
	<20050304162443.GC19598@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Sat, 05 Mar 2005 14:15:40 +0300
Message-Id: <1110021341.5169.33.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 and RAM consumprion reincarnated
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-03-04 at 17:24 +0100, Jörn Engel wrote:
> Not in English, no.  But a simple design is an indication of a simple
> implementation - more robust, less buggy, pick your favorite
> attribute.
Simple and clear design is certainly of high priority. But again, I
afraid the performance will suffer too much.

> Almost.  Unless I misread Read_the_block_summary() and you mean "take
> the list of erase blocks from ICP"
ICP contains per-inode information. Physical nodes are placed
everywhere.
Summary node contains per-block information, i.e., one summary node
describes all the nodes in the current block. We suppose JFFS3 supports
summaries.

Consequently, Read_the_block_summary() means read the summary node, no
need to scan block.

> 
> > We risk to end up with extremely slow iget().
> 
> Hence, we should cache this.  Extremely slow iget() under memory
> pressure is fine, still much faster than OOM.  Without memory
> pressure, we'd have current performance.
Hmm. Do you know whether it possible to register JFFS2-specific "reap"
function ?

> 
> > But yes, as I wrote earlier and as you has affirmed, this is fairly simple 
> > and elegant idea. ICP is not needed here at all while summary nodes are 
> > obligatory. And this fits well to the idea of superblock which is 
> > distributed and encompasses summaries.
> 
> Well, I'd still store *some* information, namely the full list of
> erase blocks containing nodes.  Not sure if that is necessary, maybe
> you're right and we should get rid of this information as well. 
No need to create ICP to store this IMO.

> Time to code and test things.
I think it is a bit early. We need to discuss and agree on something.
Then document it and agree again. :-) If there are several approaches,
I'd like to design them all :-)
I'll try to gather all together and document this. I'd be happy to get
some help :=)

Furthermore, I'd like to discuss several extra ideas, e.g.:
*	Separate users writes and GC writes between different blocks.
*	Deletion direntries processing. It is far no good in JFFS3.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
