Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvdN5-0006gP-1t
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 10:21:48 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0VFLgFM012263
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 10:21:42 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0VFLga6127498
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 10:21:42 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0VFLgGd008673
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 10:21:42 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 31 Jan 2005 09:21:37 -0600
Message-Id: <1107184897.7567.20.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 10:14 -0500, Robert P. J. Day wrote:
>   just for curiosity's sake, after i build a JFFS2 image using
> mkfs.jffs2, i want to mount out to verify its contents.  to do that, i
> use a recipe i patched together a while back involving loading the
> appropriate modules, creating /dev/mtdblock/0, dd'ing the image to
> that device, then mounting it.
> 
>   however, this morning, in trying this with a larger-than-normal
> JFFS2 image, i get:
> 
>   # dd bs=4096 if=soefsimage of=/dev/mtdblock/0
>   # dd: writing `/dev/mtdblock/0': No space left on device
>   1025+0 records in
>   1024+0 records out
> 
> IOW, it dies after 4M.  is this a limit imposed by the ramdisk limit
> in the kernel configuration?  is this a configurable parameter at
> module load time?  thanks for any pointers.

If you are using mtdram.c, it should be a module parameter.  Try setting
total_size to something larger.

josh
