Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18KFSP-00045s-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2002 10:11:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <049e01c29d0f$b3c52ff0$221faf9d@iphase.com> 
References: <049e01c29d0f$b3c52ff0$221faf9d@iphase.com> 
To: "Chantara Thlang" <thlang@iphase.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: need arguments to use JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Dec 2002 10:42:11 +0000
Message-ID: <28792.1039171331@passion.cambridge.redhat.com>
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

thlang@iphase.com said:
> Please could someone give me some arguments to use JFFS2 instead of
> all others Flash FS such as CRAMFS ? 

cramfs is read-only. If you don't want to write to your file system, you 
should probably be using it instead of JFFS2. 

The only other flash file system for Linux is YAFFS, for use on NAND flash.
I don't know as much about YAFFS as I should -- the choice between YAFFS and
JFFS2 on NAND is basically a tradeoff between the improved speed and mount
time of YAFFS, and the increased storage capacity which JFFS2 compression 
gives, I think. Charles will probably offer more enlightenment.

Other than that, you only have the brain-dead 'translation layer' crap which
is a kind of journalling pseudo-filesystem used to emulate a virtual hard
drive, on which you need to use put a 'normal' journalling file system. This
two-layer approach made some sense in the days of DOS, where you could just
provide an INT 13h Disk BIOS IRQ handler and pretend to be a normal hard
drive to DOS, but it makes far less sense now. You end up with power-loss
safety being implemented in _both_ your 'normal' file system and the
underlying pseudo-fs, the pseudo-fs has no way of knowing which blocks on
the virtual hard drive are marked as 'free' by the higher file system and so
it keep garbage-collecting stale data from one place on the flash to
another, and at least at the moment, it means you don't get compression --
although that's not a fundamental design flaw like the others. 


--
dwmw2
