Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6L2p-00029g-GD
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 07:46:59 +0000
In-Reply-To: <20080611071814.GC2432@logfs.org>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
MIME-Version: 1.0
Message-ID: <OFEC9EF05D.17E9BC87-ON88257465.0029A487-88257465.002AB5C8@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 11 Jun 2008 00:46:30 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> > I think I'm in over my head :(.  Are you suggesting that the direction 
we 
> > want to move is to change the MTD layer over to function the same way 
as 
> > the Block I/O layer?
> 
> Either that or move the block io layer to function the same way as mtd.
> Effectively the two should meet somewhere in between, but it's going to
> be a lot closer to current block io than current mtd.  We want all the
> goodies of both worlds, and block io simply has more.
>

Okay, that makes sense.  I think I'm actually starting to understand some 
of this :\.  How tied up in the block layer is the I/O scheduler?  With my 
limited understanding, it seems that is going to be the real sticking 
point in moving block and mtd io towards each other.  If the I/O scheduler 
is largely decoupled from bio it may make this easier than I think.
 
> 
> That's ok.  I don't expect you to do it all.  What I would like is to
> solve your problem in a way that brings us closer to block io instead of
> farther away.
> 

Fortunately, I think I'm well on my way to doing that.  I've taken your 
code snippets (okay pretty much stolen them wholesale, I hope that's okay) 
and started makeing changes based on them.  The changes aren't really 
radical, I don't make use of the struct fio_vec and I'm just making 
submit_fio() a wrapper around existing NAND functions, simple stuff like 
that for now.  That will at least get me working and maybe some proof of 
concept.  I hope to have a patch set in the next day or two for the list 
to look over.

Thanks again for all the help.

Bruce
