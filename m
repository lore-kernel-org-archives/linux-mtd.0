Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HfweW-0005ug-VO
	for linux-mtd@lists.infradead.org; Mon, 23 Apr 2007 12:24:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HfweI-0006uz-8S
	for linux-mtd@lists.infradead.org; Mon, 23 Apr 2007 13:24:02 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2007 13:24:02 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2007 13:24:02 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: What is recommended way to partition mtdram device - workaround
Date: Mon, 23 Apr 2007 11:23:50 +0000 (UTC)
Message-ID: <loom.20070423T131831-161@post.gmane.org>
References: <loom.20070327T102458-920@post.gmane.org>
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
> I require a partitioned mtdram device for system emulation purposes.
> 
> The documentation says that the ways to partition an MTD device are:
> 1) boot cmd line
> 2) table of data in device
> 3) create a map driver
> 
> If mtdram is to be loaded with modprobe (desktop Linux), that rules out 1).
> 
> So can I create partitions by dd-ing a partition table at the start of the
> device ?
> Can I create a map driver for the device to describe the partitions ?
> 
> Thanks,
> MikeW

Finally used '--bind' mount option to remount different parts
of the current filesystem ('/opt/mtdblock0...n').

Allowed initial testing of the filesystem mounting and partition
allocation.

Just a simple compile-time #define to switch between
/opt/mtdblockN -> /dev/mtdblockN
flags=MS_BIND -> 0
fstype="" -> "JFFS2"

Good luck.

MikeW
