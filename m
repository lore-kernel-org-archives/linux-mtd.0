From: dwmw2@infradead.org (David Woodhouse)
Date: 31 Mar 2003 23:47:44 +0100
Subject: jffs2 / eCos
In-Reply-To: <1049142569.1913.11.camel@pc-002>
References: <1049057380.1180.36.camel@pc-002>
 <1049095079.16365.768.camel@imladris.demon.co.uk>
 <1049142569.1913.11.camel@pc-002>
Message-ID: <1049150862.16365.793.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Please don't reply to cross-posts which have travelled via the eCos
list. The gratuitous and redundant noise which that list adds to the
Subject line is not welcome here.

Also, please don't top-post (except for editorial comments such as this
one and the one above :)

On Mon, 2003-03-31 at 21:29, Bob Koninckx wrote:
> Ok, I think I've come closer :)
> 
> Apparently, it has to do with the check
> 
> 
> } else if (frag->ofs < offset && (offset & (PAGE_CACHE_SIZE-1)) != 0) {
>   D1(printk(KERN_NOTICE "Eep. Overlap in ino #%u fraglist. frag->ofs =
>           0x%08x, offset = 0x%08x\n",
>           f->inocache->ino, frag->ofs, offset));
>   D1(jffs2_print_frag_list(f));
>   memset(buf, 0, end - offset);
>   return -EIO;
> } else if (!frag->node) {
> 
> 
> in read.c / function jffs2_read_inode_range
> 
> The ecos libc buffers only 256 bytes of data, PAGE_CACHE SIZE is defined
> to be 4kB. The first access consequently succeeds, the second one fail

Hmmm. I could have sworn I'd already fixed that -- doesn't seem like it
though.

> I suppose all that needs to be done (for eCos) is make the
> PAGE_CACHE_SIZE definition agree with the eCos libc BUFSIZ definition. I
> am not sure though.

No because that would mean we never write a node with more than BUFSIZ
(256 bytes) of data payload, which would mean we take up a lot more
space on the medium for any given file -- more node headers and worse
compression.

We should just fix jffs2_read_inode_range() to handle reads which don't
start at the beginning of a node. It's not hard.

-- 
dwmw2
