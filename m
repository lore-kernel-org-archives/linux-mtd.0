Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19psbz-0001dE-Ve
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 17:48:36 +0100
From: Dave Dillow <ddillow@idleaire.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1061283276.9943.1160.camel@hades.cambridge.redhat.com>
References: <1061236980.14477.20.camel@dillow.idleaire.com>
	 <1061283276.9943.1160.camel@hades.cambridge.redhat.com>
Message-Id: <1061484464.20666.27.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: 21 Aug 2003 12:47:44 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-08-19 at 04:54, David Woodhouse wrote:
> On Mon, 2003-08-18 at 16:03 -0400, Dave Dillow wrote:
> > Has anybody used the INFTL that is the CVS tree and can confirm that it
> > works for writing?
> 
> Yes, but only on the DiskOnChip Millennium. There may be some incestuous
> knowledge about what to put in the OOB area which isn't shared by the
> DiskOnChip 2000 driver. 
> 
> Actually, I suspect it's possibly the reverse -- the doc2000 driver
> brokenly inserts the '5555' marker in the middle of the oob area, which
> should really have been done in the NFTL code instead.

In a related vein, was M-Sys's TruFFS being loaded at bootup? So far,
I've found no obvious problems that would keep it from working, but a
very odd problem.

I create a test file like this:
modprobe doc2000
modprobe docprobe
modprobe inftl vfat
mount /tmp/inftla1 /mnt
dd if=/dev/urandom of=/mnt/testing bs=1024 count=128
sync

If I unmount and rmmod modules, then reinsert and remount, everything is
happy:
umount /mnt
rmmod inftl vfat
modprobe inftl vfat
mount /tmp/inftla1 /mnt

The file testing will still be there.

If I reboot the system, it goes away. The best I can figure is something
in TruFFS does not like something we do, either in VFAT or INFTL.

-- 
Dave Dillow <ddillow@idleaire.com>
