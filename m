Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qUFW-0002mx-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 07:23:06 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020328054604.BFC5D2755@sitemail.everyone.net> 
References: <20020328054604.BFC5D2755@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Whats wrong with my jffs2? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Mar 2002 07:23:04 +0000
Message-ID: <14146.1017300184@redhat.com>
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

zeusj@firstlinux.net said:
>  Thanks, I have checked the devices.txt, so I got why the odd mtd
> "permission denied". But if the device nodes with major 31 ,mi 0-7 are
> ROM card (as the device.txt said),why my flash can works without
> nothing wrong? I think the minor number should be 8-15 , isnt it?

Hmmm. That's out of date - I reused the major number. I thought the change
had propagated to devices.txt by now. We don't actually distinguish between
flash and ROM 'cards'.

> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0014: 0x552f instead

Did you erase the flash completely before putting the JFFS2 image on there?

> VFS: Mounted root (jffs2 filesystem) readonly.

Add 'rw' to the kernel command line (and/or remove 'ro') ?

--
dwmw2
