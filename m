Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169hT4-0000bv-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 06:48:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <OF9DF5C2D4.39F4A85D-ON85256B13.0079800B@nitsuko.com> 
References: <OF9DF5C2D4.39F4A85D-ON85256B13.0079800B@nitsuko.com> 
To: MQuicquaro@necinfrontia.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: No space on jffs2 fs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Nov 2001 06:58:45 +0000
Message-ID: <23973.1007103525@redhat.com>
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

MQuicquaro@necinfrontia.com said:
> I did a mkfs.jffs2 on my romfs/ directory, padding it with 0xFFs and
> then loading it into my flash via the dBUG "upuser" command.
> Everything seems to work ok except I cannot ever write to my jffs2 fs
> because there is never any free space. 

> Kernel command line: CONSOLE=/dev/ttyS0,19200 root=1f09
> 0x001c0000-0x00200000 : "rootfs J13 (256K)"
> mtd: Giving out device 9 to rootfs J13 (256K)

Your root filesystem is only 256KiB, and that appears to match the erase 
size - you have only one erase block in your root filesystem. JFFS2 
currently needs five spare blocks, although it could get away with fewer if 
I wasn't so cautious about reducing that number.

--
dwmw2
