From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060418113258.GA4720@wohnheim.fh-wedel.de>
References: <4444C8FD.1070406@inf.u-szeged.hu>
	<20060418113258.GA4720@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Apr 2006 12:00:26 +0100
Message-Id: <1145444426.13200.71.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-04-18 at 13:32 +0200, Jörn Engel wrote:
> Very interesting idea.  I had another one which is more complicated
> and it looks like yours is much better.  Just for completeness, here
> is mine:
> o For every node with less than one page uncompressed size, account it
>   some dirty space for it.
> o Node header is 68 bytes (on 32bit).  Therefore, a node with 1/2 page
>   uncompressed size should cause 34 bytes of "dirty space".
> o Complete formula:
>   dirty_space = 68 * (PAGE_SIZE - ri->csize) / PAGE_SIZE
> o Possibly don't account dirty space if node is last node of a file.
> 
> With this little hack, tiny nodes would be garbage collected for being
> "dirty space".
> 
> Maybe both approaches would make sense, but yours is much simpler and
> should be used independently of whether mine makes sense.

My idea was similar to Jörn's but slightly simpler in the
implementation. We already make a distinction between REF_PRISTINE and
REF_NORMAL nodes, and I thought that we should keep track of those
counts in jeb->pristine_size and jeb->normal_size instead of the
existing jeb->used_size which holds them both. Then we should use that
information when selecting blocks to be garbage collected -- we should
tend to pick blocks with REF_NORMAL nodes for garbage collection.

This would fix the problem which Ferenc refers to, that none of the
nodes are obsoleted. However, it still only means that the nodes would
be garbage-collected in the fullness of time -- it's not clear how
_much_ of an effect that would have -- you could still end up with whole
eraseblocks full of these REF_NORMAL nodes, if there's plenty of free
space and garbage collection isn't being pressured.

So even if we do that, I think Ferenc's patch _also_ makes sense,
because it fixes the worst of the problem at its source. We could
perhaps make it conditional -- only write out the whole page if there's
more than N nodes already in the same page, or if the previous nodes for
the same page are in the same eraseblock _and_ the new 'full' node would
actually fit in the eraseblock.

-- 
dwmw2
