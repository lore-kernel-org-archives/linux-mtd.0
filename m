Received: from h1462.serverkompetenz.net ([81.169.155.122])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CHjMa-0000Sh-Ay
	for linux-mtd@lists.infradead.org; Wed, 13 Oct 2004 09:40:21 -0400
Date: Wed, 13 Oct 2004 15:40:14 +0200
From: cdlinux@koala.de
To: linux-mtd@lists.infradead.org
Message-ID: <20041013134014.GB29207@koala.de>
References: <20041011112017.GA22376@koala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20041011112017.GA22376@koala.de>
Subject: Re: Loosing grub mbr after mounting jffs2 image with loop0 and
	mtdblock0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 11, 2004 at 01:20:17PM +0200, cdlinux@koala.de wrote:
> 
> I suppose, it has to do with the way I mount the jffs2 partition (as I'm
> actually mounting the entire image as loopdev/jffs2)...?
> I'm unsure about what would be the right way to do this.
> 

Sorry for posting this on the wrong list.

For completeness sake:
The solution was fairly simple, all i had to do was set the loopdevice up
correctly with the right byte-offset inside the image and forget about the
erasesz-option to the blkmtd module (eg):

  losetup -o 5881928 /dev/loop0 file.img
  modprobe blkmtd device=/dev/loop0
  mount -t jffs2 /dev/mtdblock0 /mnt/cfmnt

  ...

  umount /dev/mtdblock0
  rmmod blkmtd; rmmod jffs2;
  losetup -d /dev/loop0

After that, one can safely dd the image to the cf-card w/o loosing
partitionings, grub etc.

Sorry again,
chris
