Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K4Jc-0003vL-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 20:36:32 +0100
Date: Wed, 2 Aug 2000 12:36:23 -0700
From: Philipp Rumpf <prumpf@uzix.org>
To: Alexander Larsson <alex@cendio.se>
Cc: Markus Thiesmeyer <mthi@gmx.de>, David Woodhouse <dwmw2@infradead.org>,
	mtd@infradead.org
Subject: Re: Is JFFS a full featured filesystem?
Message-ID: <20000802123623.C20345@fruits.uzix.org>
References: <20000802095032.A20345@fruits.uzix.org> <Pine.LNX.3.96.1000802185749.2678B-100000@biffen.cendio.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.1000802185749.2678B-100000@biffen.cendio.se>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, Aug 02, 2000 at 08:06:42PM +0200, Alexander Larsson wrote:
> On Wed, 2 Aug 2000, Philipp Rumpf wrote:
> > On Wed, Aug 02, 2000 at 01:13:34PM +0200, Alexander Larsson wrote:
> > > On Tue, 1 Aug 2000, Markus Thiesmeyer wrote:
> > > Well, i haven't had time to work on jffs lately so i haven't talked much
> > > about this... But, as currently implemented, writing to mmaped jffs files
> > > is serioiusly broken. Of the address space operations only readpage is
> > 
> > Note this is for 2.2 only - 2.4 properly handles filesystems that cannot be
> > modified through mmaps.  I think it might be a good idea to do:
> > 
> > diff -ur mtd/fs/jffs/inode-v22.c mtd-prumpf/fs/jffs/inode-v22.c
> > --- mtd/fs/jffs/inode-v22.c	Sun Jul 30 18:07:16 2000
> > +++ mtd-prumpf/fs/jffs/inode-v22.c	Wed Aug  2 09:39:05 2000
> > @@ -1562,13 +1562,21 @@
> >  	return 0;
> >  } /* jffs_ioctl()  */
> >  
> > +/* Don't allow shared writable mmaps - we don't handle them correctly */
> > +static int jffs_file_mmap(struct file * file, struct vm_area_struct * vma)
> > +{
> > +	if ((vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
> > +		return -EINVAL;
> > +
> > +	return generic_file_mmap(file, vma);
> > +} /* jffs_file_mmap() */
> 
> Hmm. It can't handle private writable mmaps either. If such a thing
> exists.

It doesn't ?  A private writable mapping means all the changes the mmap()ing
process does get thrown away after the munmap, so it should work fine as long
as readpage works.

> > But do we _want_ one ?  It basically means files will be modified 4 KB at a
> > time on most systems - I think the 2.4 behaviour is nicer.
> 
> Isn't it possible to do normal writes as currently done, but mmaped writes
> are written 4k at a time. It should be fairly easy to detect when an
> append is done.

Possible, sure.  I'm just not sure it makes sense.

	Philipp


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
