Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sOtv-0007lm-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 15:36:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1032494909.1059.41.camel@www.avantwave.com> 
References: <1032494909.1059.41.camel@www.avantwave.com>  <1032432851.1847.22.camel@www.avantwave.com> <28606.1032433176@redhat.com> 
To: Victor Tse <victortse@avantwave.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 BUG() in gc.c:135 "Checked all inodes but still..." 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Sep 2002 15:36:53 +0100
Message-ID: <14573.1032532613@redhat.com>
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

victortse@avantwave.com said:
>  Then reboot withing umounting: http://www.avantwave.com/~victortse/
> jffs2.log2.gz 

Hmmm.

	jffs2_scan_inode_node(): Node at 0x001aa4a8
	Node is ino #46, version 1599. Range 0x3a1000-0x3a2000
	jffs2_scan_inode_node(): Node at 0x001aae44
	Node is ino #46, version 1600. Range 0x3a2000-0x3a25a8
	jffs2_scan_inode_node(): Node at 0x001ab250
	Node is ino #46, version 1601. Range 0x3a25a8-0x3a3000
		<...>
	Node at 001ab250 (0) is a data node
	version 1601, highest_version now 1602
	dnode @001ab250: ver 1601, offset 3a25a8, dsize 0a58
	Unknown INCOMPAT nodetype FFFF at 001AAE44
	Node at 001aa4a8 (0) is a data node
	version 1599, highest_version now 1602
	dnode @001aa4a8: ver 1599, offset 3a1000, dsize 1000
	Node at 001aa000 (0) is a data node
		<...>
	Checked all inodes but still 0x40c bytes of unchecked space?
		<...>
	clean_list: 001aa000 (used 00001bf0, dirty 00000000, wasted 00000004, unchecked 0000040c, free 00000000)
		<...>
	kernel BUG at gc.c:135!

So on scan we read a real node from 0x1aae44, but later on during the
readinode we find 0xFFFF as its nodetype. What's _really_ on the flash at
0x1aae44? Is this 100% repeatable with the failure being in the same place?
(And can you reduce the baud rate on your serial console till whatever
you're using for logging can actually keep up)

I can fix the fact that we screw up the accounting and hit the BUG() when we
get this error. But the error should never happen, and if your nodes are
turning into 0xFFFF you are going to lose data. What flash hardware, driver,
etc?

--
dwmw2
