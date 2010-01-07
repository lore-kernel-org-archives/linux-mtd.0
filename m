Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSljx-0000MH-HM
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 06:21:06 +0000
Subject: Re: vmalloc used for BBT scanning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David MCKAY <david.mckay@st.com>
In-Reply-To: <200912151802.49153.david.mckay@st.com>
References: <200912151802.49153.david.mckay@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Jan 2010 08:20:36 +0200
Message-Id: <1262845236.21915.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2009-12-15 at 18:02 +0000, David MCKAY wrote:
> I'm having some problems with BBT support.  Commit
> c3f8abf481c2d2b221b028f7369bc6dd39a9590e changed the BBT scanning code
> to use vmalloc() rather than kmalloc() to scan for the BBT.
> 
> The hardware I'm working on uses a DMA engine, My driver expects to
> be able to do DMA on the buffers it is given. It's not very happy if
> you pass it a vmalloc address.

Yeah, this problem is very old.

> It's very similar to the issue with the JFFS2 Summary blocks, which
> was fixed by b7600dba6d4fbf3897e517b322d006986cce831a. I fell over
> that one too:-)
> 
> If I change it back to a kmalloc() all is well, but since this is 128K
> erase block + OOB , that is really too big  for kmalloc() hence the
> original patch.
> 
> I see there has been some discussion of this and related issues a few
> months ago on the list, it appears that ubi also uses vmalloc() in a
> similar sort of way. 
> 
> Most of the usage in ubi at least is of the sort 
> 
> {
> 	vmalloc(erase_block_size);
> 	do something with it()
> 	vfree()
> }

Right. We know about DMA problems, but we do not change this because no
one complained yet, and we prefer someone else to do this :-)

> One solution I could think of is to use a special mtd specific
> allocator for this style of usage, with the memory coming from a
> pre-allocated chunk rather than vmalloc(). I think something like this
> could be done without too much effort or massive code changes, as it
> could default to vmalloc(). It's not terribly elegant however.

Special allocator for mtd sounds ugly, yes.

> Another way is to do what the omap onenand driver does and detect that
> a vmalloc() address is being passed in and do something. However, I'm
> not convinced that the driver is the right place to be doing this sort
> of thing. Also, as Russell King has pointed out that code won't work
> on many arches as it doesn't take any account of aliasing. I guess the
> OMAP2 platform doesn't have aliasing.

Yeah. OneNAND way is a hack. But it works. Also, I did not really
understand Russell's point, probably because I'm not very good in these
ARM cache issues. If you understand the problem, I'd appreciate an
explanation.

> Or come up with something more clever in the higher levels.

Yeah, this would be an ideal solution.

But I'd suggest you to just change the BBT handling code. Just change it
so that it would not require a contiguous array. I'd try to make it use
an array of pointers to pages instead. At least this is what I would try
to do.

Also, Documentation/flexible-arrays.txt can be used. I'm not sure it is
really useful for these purposes, though. But you may try to use it to
allocate an array of buffers of NAND page size for example. This will
allow writing BBT page-by-page. But I really did not look at this
deeply.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
