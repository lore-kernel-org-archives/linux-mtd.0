From: bob.koninckx@mech.kuleuven.ac.be (Bob Koninckx)
Date: 31 Mar 2003 22:29:29 +0200
Subject: [ECOS] Re: jffs2 / eCos
In-Reply-To: <1049095079.16365.768.camel@imladris.demon.co.uk>
References: <1049057380.1180.36.camel@pc-002>
 <1049095079.16365.768.camel@imladris.demon.co.uk>
Message-ID: <1049142569.1913.11.camel@pc-002>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Ok, I think I've come closer :)

Apparently, it has to do with the check


} else if (frag->ofs < offset && (offset & (PAGE_CACHE_SIZE-1)) != 0) {
  D1(printk(KERN_NOTICE "Eep. Overlap in ino #%u fraglist. frag->ofs =
          0x%08x, offset = 0x%08x\n",
          f->inocache->ino, frag->ofs, offset));
  D1(jffs2_print_frag_list(f));
  memset(buf, 0, end - offset);
  return -EIO;
} else if (!frag->node) {


in read.c / function jffs2_read_inode_range

The ecos libc buffers only 256 bytes of data, PAGE_CACHE SIZE is defined
to be 4kB. The first access consequently succeeds, the second one fails
...

I suppose all that needs to be done (for eCos) is make the
PAGE_CACHE_SIZE definition agree with the eCos libc BUFSIZ definition. I
am not sure though.

Bob


On Mon, 2003-03-31 at 09:17, David Woodhouse wrote:
> On Sun, 2003-03-30 at 21:49, Bob Koninckx wrote:
> > First I tried mkfs.jffs2 version 1.32. Mounting the filesystem did not
> > even succeed in this case. Apparently some magic number that needed to
> > be 1985 was read as 8519. Some endianness problem I suppose.
> 
> We broke the endianness support in mkfs.jffs2...
> 
> > After upgrading to version 1.35, the filesystem can be mounted.
> 
> ... then we fixed it :)
> 
> >  Files
> > and directories appear to be present (the same fileio1 test still runs
> > sucessfull and lists what should be present). Opening a file on this
> > system seems to succeed (fopen returns a FILE * anyway). However, when I
> > try to _read_ from the file, I get EIO errors.
> 
> Compile with CONFIG_JFFS2_FS_DEBUG set to 1 (in os-ecos.h iirc). Show
> the error messages you get before it gives you EIO.
> 
> > Has anybody successfully used mkfs.jffs2 for making a filesystem image
> > for a powerpc target system running eCos ? Am I doing something obvious
> > wrong ?
> 
> You're doing nothing obviously wrong. The endianness support in
> mkfs.jffs2 was temporarily broken, but that led to the failure to mount
> which you first saw -- it shouldn't be related to the latter problem.
> 
> -- 
> dwmw2
-- 
----------------------------------------------------------------------
ir. Bob Koninckx
Katholieke Universiteit Leuven
Division Production Engineering,                   tel.  +32 16 322535
Machine Design and Automation                      fax.  +32 16 322987
Celestijnenlaan 300B                  bob.koninckx at mech.kuleuven.ac.be
B-3001 Leuven Belgium               http://www.mech.kuleuven.ac.be/pma
----------------------------------------------------------------------
