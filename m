Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XfWi-0006v1-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 10:02:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.GSO.4.31.0108171144030.404-100000@netti.nic.fi> 
References: <Pine.GSO.4.31.0108171144030.404-100000@netti.nic.fi> 
To: Riipinen Petri <riipinen@nic.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [Novice] Few simple questions on DOC. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Aug 2001 10:08:09 +0100
Message-ID: <20660.998039289@redhat.com>
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

riipinen@nic.fi said:
>  1) I found a DOC driver for Linux from M-Systems website. Do I need
> this at all or is everything included in the 2.4.7 kernel? I have read
> the mtd-jffs-HOWTO and configured the kernel accordingly. 

The DiskOnChip driver on the M-Systems website is a different driver. It's 
binary-only, so if you're going to distribute the box you're making, it's 
illegal to link it into the kernel, and it's dubious even whether it's 
legal to use it as a module.

The code in 2.4.7 is slightly out of date - you should update to the latest 
code from CVS which has a couple of useful bug fixes in it. 


>  2) Do I really need to use Lilo/Grub, or can I just write the kernel
> directly into beginning of the DOC to make it boot? I don't need to
> give any parameters to the kernel when booting from hd, so I don't
> really see a need for a boot manager from my point of view.

If you just write the kernel to the beginning of the device, what's going 
to load it? The bootsector built into the kernel is old, probably broken, 
and only designed for use on floppies - I don't think it'll do the job.


>  3) How should I partition the DOC? First a small partition for the
> kernel, and then another partition for the rest of the files? Do I use
> fdisk for that? 

Don't partition it. Just make a filesystem on /dev/nftla and put the kernel 
in that filesystem.


>  4) Maybe I should use jffs on the DOC, can I just make it with mkfs
> -t jffs ...?

JFFS doesn't work on it yet. 

>  5) If I want to write some data into the DOC to keep between boots,
> would it be a good idea to make a small partition (and mount it to /
> var?) and mount that RW and then mount the other partition with other
> files as RO?

No point. NFTL uses the whole device anyway, and partitions within the 
block device wouldn't buy you anything. The NFTL write code ought to be 
fine now anyway - don't be too scared by the help text for CONFIG_NFTL_RW

> 6) To write the kernel bzImage to DOC boot sector, would I just use dd
> if=input of=/dev/mtd ... or what? 

Don't do that. Just use the patched LILO and pretend it's a hard drive.


--
dwmw2
