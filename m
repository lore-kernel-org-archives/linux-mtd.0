Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoJwN-0002ue-Kk
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 09:53:21 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HoJwC-0005Tx-Hq
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 15:53:08 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 15:53:08 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 15:53:08 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Opening flash device for update - support for SPI device
Date: Wed, 16 May 2007 13:52:47 +0000 (UTC)
Message-ID: <loom.20070516T144905-293@post.gmane.org>
References: <loom.20070516T111938-933@post.gmane.org>
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

MikeW <mw_phil <at> yahoo.co.uk> writes:

> 
> A utility program cannot open a /dev/mtd  in mode O_RDWR - permission denied
> (/dev permission bits are OK)
> 
> Presumably this is because the device is locked.
> 
> OK, there is a MEMUNLOCK ioctl - hopefully this can be called
> on a device that is only opened in O_RDONLY mode ?!
> 
> Regards,
> MikeW

Having checked MEMINFO flags=0x04, type=0x0E, I now realise that this device
(ST M25P32) may not be well-supported by MTD, and does not appear to be
writeable using our current MTD driver.

Regards,
MikeW
