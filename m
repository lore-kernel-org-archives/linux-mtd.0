From: dwmw2@infradead.org (David Woodhouse)
Date: 11 Mar 2003 14:18:15 +0000
Subject: Atmel SyncFlash
In-Reply-To: <OF6621D5E4.E0D771BB-ON80256CE6.004D87F1@zarlink.com>
References: <OF6621D5E4.E0D771BB-ON80256CE6.004D87F1@zarlink.com>
Message-ID: <1047392295.24808.108.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-11 at 14:13, Rob.McConnell at Zarlink.Com wrote:
> Hi David & ML,
> 
> Here's a URL for a datasheet of a SyncFlash part (AT49LD3200) that should
> also be considered if we are going to support SyncFlash devices as well.

Basically in order to support synchronous burst reads, we need to have
the dcache enabled for the flash -- we have to have somewhere for the
burst to _go_. 

And in order to read flash through a cached mapping, we need to know
when to _invalidate_ the cache. And of course we need to _write_ and do
polling of status bits through an _uncached_ mapping.

It's not entirely trivial but it's not too hard either; it's been
discussed and we think we know how to do it. Nobody's yet actually
stepped up and provided either code or the right form of motivation to
Red Hat to make _me_ do it :)


-- 
dwmw2
