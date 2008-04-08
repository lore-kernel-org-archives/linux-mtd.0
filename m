Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjAxd-0007s2-DY
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 10:21:54 +0000
Date: Tue, 8 Apr 2008 20:21:46 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: choosing a file system to use on NAND/UBI
Message-ID: <20080408102145.GA13741@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron>
	<20080407051259.GA3584@cloud.net.au>
	<1207552429.8040.33.camel@sauron>
	<20080407073227.GA6317@cloud.net.au>
	<1207555006.8040.76.camel@sauron>
	<20080407112010.GA8942@cloud.net.au>
	<1207570534.8040.94.camel@sauron>
	<20080407122253.GA12359@cloud.net.au>
	<1207572259.8040.107.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207572259.8040.107.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 07, 2008 at 03:44:19PM +0300, Artem Bityutskiy wrote:
> On Mon, 2008-04-07 at 22:22 +1000, Hamish Moffatt wrote:
> > My idea is that you can "ubiupdatevol /dev/ubi0_0 myimage.gz", which
> > ubiupdatevol would decompress on the fly. You could decompress it
> > somewhere first but it may not fit in RAM (and writing it to flash
> > temporarily would be slower).
> 
> So you want some kind of "live" updates? You have your device which is
> running. And you want to update one of your UBI volumes. You copy the
> update image to the device and want to use ubiupdatevol to put it to the
> volume.
> 
> How do you copy the file? If you have network connection, may be you
> could teach ubifs to take the image from the network? dwmw2 also
> recently added an utility to mtd-utils.git which _seems_ to be doing
> this, so you could teach it to update the volume which should be very
> easy (see recv_image and serve_image in mtd-utils.git).

Not possible in our case; our firmware image is a composite of the ubifs
root volume plus some firmware for other devices in our system. Plus we
want to check the md5sum of the parts before starting to ubiupdatevol.

> > Looking at the code I see the main issue is that you need to know the
> > file size before you start updating.
> Yeah, that is right. This is what UBI update ictl expects. But probably
> gzip has this info somewhere in its meta-data.

I think you need to seek to the end and then rewind to get a definite
answer.

In our previous application we had our root on compact flash, so we
could update using "zcat image.gz | dd of=/dev/hda1". And I once patched
flashcp to use zlib. Is it possible to use flashcp to UBI's emulated
/dev/mtdX device in place of ubiupdatevol?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
