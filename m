Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175wfK-0008CA-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 23:45:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003501c1f7a8$de322840$9702a8c0@maverick> 
References: <003501c1f7a8$de322840$9702a8c0@maverick> 
To: "Darren Martz" <dmartz@shelbrook.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Boot from DoC2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 May 2002 23:45:37 +0100
Message-ID: <23452.1020984337@redhat.com>
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

dmartz@shelbrook.com said:
>  My PC/104 board has an older/patched version of lilo and linux on it,
> how do I replace the current lilo firmware? I have already formatted
> the device from a floppy boot (may that wasn't so smart). Can I
> install grub over top of the existing lilo by bootdisk, or do I need
> to uninstall lilo first? 

Grub (or the original firmware) live in the raw flash, before the actual NFL
format starts. Grub is bigger than the original firmware, so when you 
install Grub, you have to recreate the NFTL format. It's best to do this 
with the M-Systems DFORMAT program under DOS, but it's also possible to use 
the Linux nftl_format program which doesn't deal with bad blocks properly.

You can tell the DFORMAT program how much space to reserve for the 
firmware, I believe. 

You need to apply the DiskOnChip patches to Grub, if they're not already 
merged. 

--
dwmw2
