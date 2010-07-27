Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdpcJ-0002uc-W7
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 19:15:10 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OdpcG-0004BT-8t
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 21:15:04 +0200
Received: from h20244.upc-h.chello.nl ([62.194.20.244])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jul 2010 21:15:04 +0200
Received: from sfzhi by h20244.upc-h.chello.nl with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jul 2010 21:15:04 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Zhirikov <sfzhi@yahoo.com>
Subject: Mounting UBIFS readonly - is it really readonly?
Date: Tue, 27 Jul 2010 21:05:50 +0200
Message-ID: <i2namf$mj6$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I hope someone can help me to resolve the following mystery.

I'm using UBIFS as the root filesystem always mounted readonly.
The kernel boot parameters are:
console=ttyS0,115200 ubi.mtd=2 root=ubi0:rootfs rootfstype=ubifs ro loglevel=6

As you can see, there is "ro", which causes UBIFS to be initially mounted readonly. And later it is *never* remounted read-write. Everything seems to work as expected (I get "Read-only file system" error upon a write attempt) except one thing. Somehow the modification time of /dev/console is updated every time the system boots. Note: I'm not talking about the /dev/console located inside the /dev mount (which is tmpfs and is obvously writable), I'm talking about the /dev/console located on the root file system and accessed (probably by init) before /dev is mounted. I'm really puzzled. How is this possible? The root filesystem has been readonly all the time and still the timestamp is somehow updated. Does anyone have an idea what might be going on there?

I'm using kernel 2.6.33.6 and classic sysvinit-2.86.

Thanks and regards,
Sergei.
