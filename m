Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IlvB-0003gM-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 08:55:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020614042945.11949.qmail@web21504.mail.yahoo.com> 
References: <20020614042945.11949.qmail@web21504.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: why MTD model ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 08:54:59 +0100
Message-ID: <18178.1024041299@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

studying_mtd@yahoo.com said:
> you mean, it is possible.
> > but that is not a true representation of the
> > capabilities of the underlying 
> > device.
> 
> what you mean by "true representation of the capabilities" ?
> what i will miss, if i use memory flash device as block device and
> merge memory flash device with other block devices ?

Flash devices have large erase blocks. You cannot just treat them as a block
device with a sector size of 64KiB, etc. A flash device can have sectors
erased independently of write operations, can have write operations
performed independently of erases (e.g. JFFS2 does so just to clear one
extra 'valid' bit in existing nodes', can support writes to arbitrary byte
ranges, etc. The MTD API allows you to make use of those features.

The block device model does not offer a way to handle any of that. It only 
allows you to make atomic updates of fixed-size sectors, which is not 
something that flash devices are naturally capable of. To use flash as a 
block device, you have to have some kind of 'translation layer' hack.

The simplest we have is the 'mtdblock' one, which on receiving a write 
request simply reads the whole of the erase block which it landed in, 
erases that block, then writes it all back out again with the offending 
sector modified. That's obviously very unsafe, but it's OK for setting up 
file systems which are going to be read-only in production.

Others are more complicated and safe w.r.t. power failure, essentially a
complete journalling file system in themselves just to emulate a block
device with small sectors. On top of which people put 'normal' journalling 
file systems.

Having a journalling file system atop a journalling file system sucks. We 
do far better by exposing an API which represents the true functionality of 
the underlying devices and designing a file system to make use of that 
directly. 

--
dwmw2
