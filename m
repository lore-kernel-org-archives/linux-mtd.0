Date: Thu, 27 Jan 2005 17:35:55 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1106730647.6480.190.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 Jan 2005, David Woodhouse wrote:
> We can also look at true write-behind caching, if we're a _lot_ more
> careful about free space than we are now. To have data outstanding in
> the page cache, we need to be able to guarantee that we have enough free
> space to write it out, and we need to be able to write it out _without_
> allocating memory. That includes any memory which might be required for
> GC. Doing that would allow us to coalesce writes so we fill a page (or a
> full node size) more often.

How do you think, if we implement write-back caching (I do not imagine 
how yet) then will we still need to distinguish between "pristine" and 
"normal" nodes?

Since JFFS2 is now write-through, we do write small data chunks if there 
are few changes in the cache. This is for space efficiency, right?

In case of write-back cache, a lot of small changes will be merged to the 
page and we possibly may just write it fully. Perhaps, we might not bother 
writing only part of page.

The agvantage of this is that we will not need to overcompicate the GC 
getting it merge "normal" nodes and produce "pristine" ones. All our nodes 
will be pristine.

On commit_write request we may really write several neigbour pages either 
if they are marked dirty, thus having nodes with several pages.

If we have only 4K-multiple data chunks on nodes, we will even save some 
RAM (both in-core and fragtree).

Comments?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
