Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkesV-0000S3-Nk
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 12:26:13 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HkesJ-0007qC-U4
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 13:26:00 +0200
Received: from arrows.demon.co.uk ([83.105.72.193])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 06 May 2007 13:25:59 +0200
Received: from john.smith by arrows.demon.co.uk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 06 May 2007 13:25:59 +0200
To: linux-mtd@lists.infradead.org
From: John Smith <john.smith@arrows.demon.co.uk>
Subject: Re: UBI: Can I boot with an UBI volume holding a root file system?
Date: Sun, 6 May 2007 11:25:46 +0000 (UTC)
Message-ID: <loom.20070506T124743-262@post.gmane.org>
References: <Pine.LNX.4.33.0705042323250.30567-100000@arrows.demon.co.uk>
	<1178374139.3659.150.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind <at> infradead.org> writes:

> 
> On Fri, 2007-05-04 at 23:42 +0100, John Smith wrote:
> > I am hoping to build a root file system and store it as a squashfs
> > image in a static UBI volume. What command line should I should pass
> > to the kernel at boot time?
> > 
> > There are likely to be other UBI volumes in the UBI partition which
> > will each get mapped to a /dev/mtdblock device. Is it going to be
> > difficult to identify the major/minor numbers of the device which will
> > mapped to my squashfs image?
> > 
> > I think that I need to add some initramfs logic, but I am very
> > uncertain of the details. I will be grateful for any ideas,
> 
> I have never tried this and I guess nobody did. But you may try and send
> us a text to add to faq on MTD site 
> 

I can make some progress. With a boot line

   boot vmlinux "root=31:4 rootfstype=squashfs ubi.mtd=0 ubi.mtd=3"

I can boot the kernel and mount /dev/mtdblock4 as the root file system. 
(31,4 are the major and minor numbers of /dev/mtdblock4, which is the mtd 
block device mapped to the UBI volume which holds my squashfs image.)

The kernel has logic in the function name_to_dev_t() in file 
init/do_mounts.c to convert the string "root=31:4" to the block device.
There is already logic in name_to_dev_t() for handling disks by name.
name_to_dev_t() could be extended to identify mtd partitions by name
so that 
   root=mtd:my_squashfs_image
returns the mtd block device containing mtd image "my_squashfs_image"

> One thing for you to keep in mind: use proper volume alignment. I am not
> sure what is squashfs block size probably 512 bytes, then use alignment
> 512. In this case you will end up with 512-byte aligned logical
> eraseblocks. this will make your life easier.

I have not done anything explicit about alignment. Have I just been lucky 
because my NAND device works in pages of 512 bytes? The squashfs block size is 
currently 65536 bytes, though may be the word block is describing a different 
concept. Perhaps it would be best to make the squashfs block size the same size 
as the UBI logical erase block size. 

John
