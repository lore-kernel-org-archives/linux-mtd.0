Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Co3yv-0003Rb-Hm
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 13:09:35 -0500
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0AI9RFJ246408
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2005 13:09:27 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay05.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0AI9Rcf259182
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2005 11:09:27 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0AI9Q9j004506
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2005 11:09:26 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>
References: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1105380565.17584.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 10 Jan 2005 12:09:25 -0600
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how to loopback mount a JFFS2 filesystem on my linux box?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-10 at 11:49, Robert P. J. Day wrote:
>   i swear i once knew how to do this, but it's lost in the mists of
> time.  i used "mkfs.jffs2" to create a simple JFFS2 image, and now i
> just want to mount it on my fedora core 3 system using a loopback
> mount.
> 
>   i have the jffs2 and mtdcore modules currently loaded, and normally,
> what i would try is:
> 
>   # mkdir m
>   # mount -o loop -t jffs2 <jffs2.img file> m
> 
> but what i get is:
> 
> # mount -o loop -t jffs2 hello.img m
> mount: wrong fs type, bad option, bad superblock on /dev/loop0,
>        or too many mounted file systems
>        (could this be the IDE device where you in fact use
>        ide-scsi so that sr0 or sda or so is needed?)
> 
>   i *vaguely* recall needing to do a bit more work, like loading
> another module or two.  any pointers to a URL for this?  thanks.

You can't do that AFAIK because JFFS2 needs an MTD device.  Instead, use
mtdram to create a fake MTD device, dd the image to it, and do:

# mount -t jffs2 /dev/mtdblock0 <mnt/point>

Really though, we should look at making JFFS2 and/or the loopback driver
grok each other.  Would be useful.  Maybe a JFFS3 candidate?

josh
