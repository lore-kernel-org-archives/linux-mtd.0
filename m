From: dwmw2@infradead.org (David Woodhouse)
Date: 14 Mar 2003 16:43:30 +0000
Subject: [PATCH] Fix stack usage for amd_flash.c
In-Reply-To: <20030314161916.GA23161@wohnheim.fh-wedel.de>
References: <20030314154642.GC27154@wohnheim.fh-wedel.de>
 <1047657910.14792.153.camel@passion.cambridge.redhat.com>
 <20030314161916.GA23161@wohnheim.fh-wedel.de>
Message-ID: <1047660209.14792.211.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-03-14 at 16:19, Joern Engel wrote:
> On Fri, 14 March 2003 16:05:10 +0000, David Woodhouse wrote:
> > On Fri, 2003-03-14 at 15:46, Joern Engel wrote:
> > 
> > Urgh. That should never have been on the stack in the first place. Make
> > it static. The comment about being deallocated when the probe is done is
> > bogus -- where do we think we get the contents of the table from when
> > _entering_ the probe function anyway? It's elsewhere in the kernel
> > image.
> 
> Ok, done.
> Is the new patch ok?

I'd probably have left it where it was and had a one-line patch just
which made it static, to keep the size of the patch down and avoid
conflicts with people trying to add new chip idents -- but since I don't
want people adding new chip idents anyway I suppose that's fine.

> Right. But since 2.[567] is going towards 4k kernel stack, those
> drivers should be fixed or revomed. If you don't remove it, I'll try
> to fix it. :)

True. Thanks.

> > Btw you're sending out 8-bit mail with charset 'unknown-8bit'. What
> > should be a ?? isn't.
> 
> Correct. I noticed that my inline patches were getting screwed up
> somehow and played around with the character set. It turned out that
> lkml is converting my mails to QP, no matter what I do. So the
> solution appears to be to include the important people in TO|CC and
> ignore the QP problem.

It's not converting to QP for me. My response to you, for example,
returned via lkml with...
	Content-Type: text/plain; charset=UTF-8
	Content-Transfer-Encoding: 8bit

Er, on further investigation it seems that Evolution actually _sent_ it
QP, and it got converted _from_ QP to 8-bit somewhere en route. That's
just bizarre. 

-- 
dwmw2
