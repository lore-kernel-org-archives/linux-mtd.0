Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15guud-0007nX-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 22:17:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010911201345.19481.qmail@qis> 
References: <20010911201345.19481.qmail@qis>  <20010911182623.15217.qmail@qis> <8583.1000239450@redhat.com> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: duplicate DoC millenium with dd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Sep 2001 22:23:46 +0100
Message-ID: <9772.1000243426@redhat.com>
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


niko@isl.net.mx said:
>  ohh, so bad.... I will have to nftl_format every time I update my
> flash....  

Not at all - no more than you need to do a low level format of your hard 
drive every time you put a new filesystem on it. Just do the mkcramfs step 
again.

> > What are you partitioning it for, btw?
> It's a firewall. I place linuxbios & kernel first, then I nftl_format
> /dev/mtd0 0xFIRST_FREE_BLOCK and place a minimal filesystem (cramfs)
> on the  rest of the chip.....

You nftl_format it with the offset, which gives you a block device /dev/
nftla. Then you use sfdisk rather than mkcramfs -o /dev/nftla. If you only 
have one partition, then a partition table is just a waste of space.


> since you say nftl_format removes
> original badblocks  table M-Systems put on the chip at fabrication
> time, I kinda dislike this  util..... 

It's now better than it was. And you shouldn't need to use it more than 
once, if the total size of your LinuxBIOS and kernel don't change (or if 
you left enough space for a little bit of expansion).

>  is there any way to avoid nftl_format and boot my cramfs from /dev/
> mtdblockX  or /dev/mtd0 with an 0xXXXX offset or something like this? 

Not out of the box. It's trivial to do that though, by using the mtd
version of partitions, which makes it look like two (or more) separate MTD
devices. 

--
dwmw2
