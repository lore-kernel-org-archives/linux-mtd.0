Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160g2X-0005w8-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 09:27:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BE65965.F5C16E70@emcraft.ru> 
References: <3BE65965.F5C16E70@emcraft.ru> 
To: Boris Bulkin <boris@emcraft.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 support for a custom PPC750 board 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Nov 2001 09:36:49 +0000
Message-ID: <29072.1004953009@redhat.com>
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

boris@emcraft.ru said:
>  I'm new to the MTD project, so any information will be very
> appreciated. What is the current state of MTD support for DOC? 

It works, for the DiskOnChip 2000 and DiskOnChip Millennium. Not the
Millennium Plus. It doesn't do sane wear-levelling though. That's left as an
exercise for the reader. Pointers and CVS access will happily be given to
anyone who looks serious about doing it.


> Do MTD DOC drivers require any firmware from M-Sys, or does MTD provide
> its own DOC firmware? 

The DiskOnChip requires no firmware. It is not an intelligent device. 
What's normally referred to as the DiskOnChip 'firmware' is the BIOS 
extension which installs a driver which hooks the PC INT 13h disk service 
interrupt and hence makes DOS and LILO work. I assume you don't want that :)

> Then, I know that M-Systems  suggests running its
> DOS-based tools for partitioning and formatting a DOC device. Are
> there any open-source replacements for them?

There is nftl_format.c which performs the basic function of creating an 
NFTL on the raw flash. NFTL is the translation layer used on the DiskOnChip 
devices to emulate a normal block device. It is preferred to use the DOS 
utilities because their response to finding bad blocks has been far better 
tested. But nftl_format should be OK.

--
dwmw2
