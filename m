Received: from gate.epygi.de ([212.126.211.241] helo=epygi.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nd1D-00055i-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 10:08:31 +0000
Received: from pcstephan (pc-stephan.epygi.de [192.168.13.32])
	by epygi.de (8.11.2/8.11.2) with SMTP id g2KAJgM24626
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 11:19:42 +0100 (MET)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: <linux-mtd@lists.infradead.org>
Subject: RE: root=/dev/mtdblock doesn't work with kernel 2.4.18
Date: Wed, 20 Mar 2002 11:18:40 +0100
Message-ID: <FCEAKDJJAPHPLJFINDAJMELGCDAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.44.0203191047050.26226-100000@passion.cambridge.redhat.com>
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

Thank's David! Now it works.

>
> > After changing from 2.4.8-pre4 to a 2.4.18 kernel I can't mount the
flash as
> > root device any more. I'm using the "root=" boot argument to do so.
> > The filesystem (cramfs) is alredy detected in mount_root() (super.c)
when
> > mount_root calls blkdev_put(bdev, BDEV_FS); Which for some reasons has
to
> > call the release function of the device which results in
mtdblock_release()
> > being called. The hole thing stops when invalidate_device() calls
> > fsync_dev(dev).
>
> Remove just the call to invalidate_device() in mtdblock_release()
>
> --
> dwmw2
>
