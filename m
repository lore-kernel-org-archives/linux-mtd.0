Received: from wnifwl.woodsidenet.com ([65.192.186.2]
	helo=WNIMAIL.WoodsideNet.Com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AkUvf-0001vY-5a
	for linux-mtd@lists.infradead.org; Sat, 24 Jan 2004 21:02:55 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Jan 2004 13:02:33 -0800
Message-ID: <3FFBC907DD03A34CA4410C5C745DEB120339A739@wnimail.WoodsideNet.Com>
From: "Pierre Vandwalle" <PierreVandwalle@AirgoNetworks.Com>
To: <linux-mtd@lists.infradead.org>
Subject: deadlock w/ processes accessing jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello ,
=20
I am sorry to bother you like this, I am seeing deadlocks with JFFS2 on =
our
system (we're making a wi-fi system with 2.4.20 powerPC on system with=20
M-system flash, we're using JFFS2).
I don't know if this deadlock has been fixed already in more recent =
versions
of JFFS2, I checked kernels 2.4.24 and 2.6.1 and the issue seems to be =
there
although it might be fixed at other levels of the kernel or jffs2???

More specifically I think that there is a race condition between two
process on the following condition:
1- first process is in jffs2_setattr doing an open/create which require
truncating some of the file's inode page lists
2- second process is in do_generic_file_read on the same file
3- the inode has non up-to-date pages present in the page cache

In short words, "do_generic_file_read"  locks a non  up-to-date page =
present in the
cache, and then will attempt to get the inode's jffs2_inode_info =
semaphore in the jffs2_readpage.
Whereas the jffs2_setattr will get the inode's semaphore, then maybe =
sleep, then will
attempt to lock pages for inode truncation.
---> this seems cause a deadlock on my system...

=20

Thank you so much, regards,

Pierre

------------------------------------------------------------


Deadlock sequence:

The first process (open/create) gets the jffs2_inode_semaphore, it then
allocates and writes a new inode thru jffs2_write_dnode and at this =
point may
sleep (in our system probably waiting in kmalloc on a memory alloc or on =
mtd
I/O).

During the sleep, the second process (read) may obtain the lock of one =
of the
inode's page if the page is present in the page_cache and is not =
up_to_date.
Moreover as it is not up to date the process will try to read this page =
thru
jffs2_readpage, at this point jffs2_readpage will also try to get the =
page's
host semaphore which is just the jffs2_inode_info semaphore owned by =
process1.
As the semaphore is taken, the second process sleeps.

Now the first process wakes up, completes its write and tries to =
truncate the
page lists of the inode. For the truncation to happen, it has to obtain =
the
lock on each page of the lists, this trigger the deadlock (as the first
process has the lock).


>From the code viewpoint:
------------------------

Process 1 in jffs2_setattr() the steps are:

1) down(&f->sem); //get inode's semaphore
2) jffs2_write_dnode(); //may sleep
3) vmtruncate(inode, ri->isize); //needs the lock on pages attached to =
inode


Process 2 in do_generic_file_read() the steps are:

1) page =3D __find_page_nolock(mapping, index, *hash); //get the page =
from the
cache
2) if (!Page_Uptodate(page)) goto page_not_up_to_date;
3) page_not_up_to_date:
                ...
                lock_page(page); //if not up to date, lock the page
4) error =3D mapping->a_ops->readpage(filp, page); //needs the page's =
host
semaphore, do not unlock the page
