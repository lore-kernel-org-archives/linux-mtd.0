Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K2uk-0003eC-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 19:06:46 +0100
Date: Wed, 2 Aug 2000 20:06:42 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: Philipp Rumpf <prumpf@uzix.org>
cc: Markus Thiesmeyer <mthi@gmx.de>, David Woodhouse <dwmw2@infradead.org>,
        mtd@infradead.org
Subject: Re: Is JFFS a full featured filesystem?
In-Reply-To: <20000802095032.A20345@fruits.uzix.org>
Message-ID: <Pine.LNX.3.96.1000802185749.2678B-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 2 Aug 2000, Philipp Rumpf wrote:

> On Wed, Aug 02, 2000 at 01:13:34PM +0200, Alexander Larsson wrote:
> > On Tue, 1 Aug 2000, Markus Thiesmeyer wrote:
> > Well, i haven't had time to work on jffs lately so i haven't talked much
> > about this... But, as currently implemented, writing to mmaped jffs files
> > is serioiusly broken. Of the address space operations only readpage is
> 
> Note this is for 2.2 only - 2.4 properly handles filesystems that cannot be
> modified through mmaps.  I think it might be a good idea to do:
> 
> diff -ur mtd/fs/jffs/inode-v22.c mtd-prumpf/fs/jffs/inode-v22.c
> --- mtd/fs/jffs/inode-v22.c	Sun Jul 30 18:07:16 2000
> +++ mtd-prumpf/fs/jffs/inode-v22.c	Wed Aug  2 09:39:05 2000
> @@ -1562,13 +1562,21 @@
>  	return 0;
>  } /* jffs_ioctl()  */
>  
> +/* Don't allow shared writable mmaps - we don't handle them correctly */
> +static int jffs_file_mmap(struct file * file, struct vm_area_struct * vma)
> +{
> +	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
> +		return -EINVAL;
> +
> +	return generic_file_mmap(file, vma);
> +} /* jffs_file_mmap() */

Hmm. It can't handle private writable mmaps either. If such a thing
exists.

> [untested, as I don't have a local 2.2 tree]
>  
> > implemented. To get a correcly working mmap implementation writepage and
> > prepare_write_page (or whatever it's called, don't have source handy right
> > now) should be implemented. This could cause consistancy problems though,
> 
> But do we _want_ one ?  It basically means files will be modified 4 KB at a
> time on most systems - I think the 2.4 behaviour is nicer.

Isn't it possible to do normal writes as currently done, but mmaped writes
are written 4k at a time. It should be fairly easy to detect when an
append is done.
 
> > because we're not using the (possibly modified) mmaped data when writing
> > directly to a file, we also in some way guarantee that all writes are
> > done to the log in the correct order. It will also be an inefficient way
> 
> I am planning on breaking up my jffs compression patch into several patches
> later today - writing through the page cache is the right thing for us to
> do, even if we want to keep the fully synchronous behaviour.

 Yes, i agree.
 
> > All this, and the fact that the missing needed mutex around the writing to
> > the log makes the jffs filesystem quite seriously borked. It can be used,
> 
> OTOH, we don't really need a complicated locking structure - the vfs takes
> care of managing per-inode mutexes and all we need to do is lock actual
> physical flash accesses against each other;  things are slightly more
  David has done this in cvs. Looks ok to me.

> complicated for asynchronous writes (basically the code to do the physical
> write would look somewhat like this:
> 
> 	if (inode_has_modifications(inode)) {
> 		down(&inode->i_sem);
> 		compress, allocate, write;
> 		up(&inode->i_sem);
> 	}
> ), though the advantages are very interesting.
> 
> 	Philipp Rumpf



/ Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
