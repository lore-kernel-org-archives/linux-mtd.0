Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175vQz-00086P-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 22:26:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001e01c1f73d$8a53ad90$9702a8c0@maverick> 
References: <001e01c1f73d$8a53ad90$9702a8c0@maverick> 
To: "Darren Martz" <dmartz@shelbrook.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Boot from DoC2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 May 2002 22:26:39 +0100
Message-ID: <21605.1020979599@redhat.com>
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

You're a little confused. There are two options for the physical format on 
the DiskOnChip. First, there's 'NFTL', which is what M-Systems refer to as 
'TrueFFS', which emulates a block device. On top of that block device you 
put a normal filesystem -- VFAT, ext2 or whatever you prefer.

You need support for that in two places - both in your bootloader which has 
to load the kernel off it, and in your kernel which has to actually _use_ 
it. Just to add to the confusion, for _each_ of those requirements you have 
a choice of two methods.

The kernel part is simple - either you use their binary-only module with an 
initrd hack to get it loaded, or you use the GPL'd support for NFTL which 
is included in the official 2.4 kernel tree.

The bootloader part is only slightly less simple. The DiskOnChip ships with 
firmware built-in that hooks into the INT 13h disk BIOS interrupt, to make 
it look like a normal hard disk driver to DOS and LILO. If you want, you 
can replace their firmware with Grub. To make that useful, you have to have 
a copy of Grub which is capable of reading the DiskOnChip directly, as 
you're going to have taken away the INT 13h support.

Alternatively, you can use JFFS2 on the DiskOnChip. You need to fix up the 
DiskOnChip hardware drivers a little to handle reads and writes larger than 
512 bytes; nothing else that I recall. Booting a kernel on a JFFS2 file 
system on DiskOnChip is not yet implemented. I'd be inclined to use RedBoot 
for that.

--
dwmw2
