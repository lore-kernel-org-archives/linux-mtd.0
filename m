Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dPJ-0001Ug-Qo
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:15:42 +0100
Received: from nibbel.kulnet.kuleuven.ac.be ([134.58.240.41])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 190czk-0005tL-00
	for linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 08:49:16 +0100
From: Bob Koninckx <bob.koninckx@mech.kuleuven.ac.be>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1049150862.16365.793.camel@imladris.demon.co.uk>
References: <1049057380.1180.36.camel@pc-002>
	 <1049095079.16365.768.camel@imladris.demon.co.uk>
	 <1049142569.1913.11.camel@pc-002>
	 <1049150862.16365.793.camel@imladris.demon.co.uk>
Message-Id: <1049269724.25405.8.camel@pc086-2.mech.kuleuven.ac.be>
Mime-Version: 1.0
Date: 02 Apr 2003 09:48:45 +0200
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: jffs2 / eCos
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-04-01 at 00:47, David Woodhouse wrote:
> Please don't reply to cross-posts which have travelled via the eCos
> list. The gratuitous and redundant noise which that list adds to the
> Subject line is not welcome here.

Sorry about that. Won't happen again ...

> 
> Also, please don't top-post (except for editorial comments such as this
> one and the one above :)

I am learning fast

> 
> On Mon, 2003-03-31 at 21:29, Bob Koninckx wrote:
> > Ok, I think I've come closer :)
> > 
> > Apparently, it has to do with the check
> > 
> > 
> > } else if (frag->ofs < offset && (offset & (PAGE_CACHE_SIZE-1)) != 0) {
> >   D1(printk(KERN_NOTICE "Eep. Overlap in ino #%u fraglist. frag->ofs =
> >           0x%08x, offset = 0x%08x\n",
> >           f->inocache->ino, frag->ofs, offset));
> >   D1(jffs2_print_frag_list(f));
> >   memset(buf, 0, end - offset);
> >   return -EIO;
> > } else if (!frag->node) {
> > 
> > 
> > in read.c / function jffs2_read_inode_range
> > 
> > The ecos libc buffers only 256 bytes of data, PAGE_CACHE SIZE is defined
> > to be 4kB. The first access consequently succeeds, the second one fail
> 
> Hmmm. I could have sworn I'd already fixed that -- doesn't seem like it
> though.
> 
> > I suppose all that needs to be done (for eCos) is make the
> > PAGE_CACHE_SIZE definition agree with the eCos libc BUFSIZ definition. I
> > am not sure though.
> 
> No because that would mean we never write a node with more than BUFSIZ
> (256 bytes) of data payload, which would mean we take up a lot more
> space on the medium for any given file -- more node headers and worse
> compression.
> 
> We should just fix jffs2_read_inode_range() to handle reads which don't
> start at the beginning of a node. It's not hard.

I removed the above mentioned check and now it _appears_ to work
correctly. Is this all that needs to be done ? Are there similar issues
when writing to the filesys ?

Bob

> 
> -- 
> dwmw2
-- 
----------------------------------------------------------------------
ir. Bob Koninckx
Katholieke Universiteit Leuven       
Division Production Engineering,                   tel.  +32 16 322535
Machine Design and Automation                      fax.  +32 16 322987
Celestijnenlaan 300B                  bob.koninckx@mech.kuleuven.ac.be
B-3001 Leuven Belgium               http://www.mech.kuleuven.ac.be/pma
----------------------------------------------------------------------
