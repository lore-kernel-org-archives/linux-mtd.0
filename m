From: dwmw2@infradead.org (David Woodhouse)
Date: 14 Mar 2003 16:05:10 +0000
Subject: [PATCH] Fix stack usage for amd_flash.c
In-Reply-To: <20030314154642.GC27154@wohnheim.fh-wedel.de>
References: <20030314154642.GC27154@wohnheim.fh-wedel.de>
Message-ID: <1047657910.14792.153.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-03-14 at 15:46, Joern Engel wrote:
> Hi!
> 
> This patch reduces the stack usage of amd_flash_probe by a couple of
> kByte.

Urgh. That should never have been on the stack in the first place. Make
it static. The comment about being deallocated when the probe is done is
bogus -- where do we think we get the contents of the table from when
_entering_ the probe function anyway? It's elsewhere in the kernel
image.

>  The target of freeing the memory after probe should be reached
> with __initdata as well. Untested, though.
> 
> Is it ok to apply?

No. You can't make that __initdata because the functions which _call_ it
aren't __init. You can load map drivers (e.g. pcmcia) as modules which
try to probe for all kinds of chips.  

Also note that all but the CFI-based drivers are deprecated. We have
old-style probes which allow us to use the CFI back-end drivers with
non-CFI chips anyway.

> J?rn

Btw you're sending out 8-bit mail with charset 'unknown-8bit'. What
should be a ?? isn't.

-- 
dwmw2
