Subject: Re: Garbage Collection Questions?
From: David Woodhouse <dwmw2@infradead.org>
To: John Harbold <harbold@glimmerglass.com>
In-Reply-To: <CF3B33450CAA7449920664A1B6F11E6B03C29610@postak.glimmerglassnet.com>
References: <CF3B33450CAA7449920664A1B6F11E6B03C29610@postak.glimmerglassnet.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Dec 2009 03:04:43 +0000
Message-ID: <1260846283.21426.104.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-14 at 17:57 -0800, John Harbold wrote:
> 
> 
>             I have some questions on some JFFS2 scenarios running
> Linux kernel 2.6.10. 

There have been serious bugs fixed since then. Update.

>  These scenarios have to do with the state of a JFFS2 partition while
> its associated garbage collection kernel thread is running:
> 
>         * What would happen to a JFFS2 partition after a power failure
> when,    before the power failure happened, the garbage collection
> thread was    obsoleting nodes?

Nodes are only marked as obsolete _after_ a suitable replacement for
them has actually been written out. So the only problem that could occur
here is that you write out a new node, but crash before you manage to
mark the old one obsolete. And we cope with that just fine, marking the
old one obsolete when we remount.

>         * What would happen to a JFFS2 partition if while the
> garbage   collection thread was active and the partition was marked as
> read-      only?  Would the obsolete nodes be obliterated?

We kill the GC thread on remounting read-only. No garbage collection
happens on a read-only file system.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
