Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nGyq-0003YS-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 10:36:36 +0000
Date: Tue, 19 Mar 2002 10:48:05 +0000 (GMT)
From: David Woodhouse <dwmw2@redhat.com>
To: Stephan Linke <Stephan.Linke@epygi.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: root=/dev/mtdblock doesn't work with kernel 2.4.18
In-Reply-To: <FCEAKDJJAPHPLJFINDAJMEKPCDAA.Stephan.Linke@epygi.de>
Message-ID: <Pine.LNX.4.44.0203191047050.26226-100000@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 19 Mar 2002, Stephan Linke wrote:

> After changing from 2.4.8-pre4 to a 2.4.18 kernel I can't mount the flash as
> root device any more. I'm using the "root=" boot argument to do so.
> The filesystem (cramfs) is alredy detected in mount_root() (super.c) when
> mount_root calls blkdev_put(bdev, BDEV_FS); Which for some reasons has to
> call the release function of the device which results in mtdblock_release()
> being called. The hole thing stops when invalidate_device() calls
> fsync_dev(dev).

Remove just the call to invalidate_device() in mtdblock_release()

-- 
dwmw2
