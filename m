Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gtsb-0007iN-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 21:11:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010911182623.15217.qmail@qis> 
References: <20010911182623.15217.qmail@qis> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: duplicate DoC millenium with dd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Sep 2001 21:17:30 +0100
Message-ID: <8583.1000239450@redhat.com>
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
>  for some reason I can not duplicate Disc on chip Millenium (8MB) with
> dd command. I can build it using dd, fdisk, nftla_format, erase....
> etc, but  not only dd.  

The DiskOnChip uses NAND flash, which has 'out of band' data areas. A 
simple dd won't read or write them. Neither would it be sensible to use the 
nanddump and nandwrite utilities for doing so, although they can - you want 
to reformat each device individually, with its own bad block map, not the 
bad block map of your master.

nftl_format, mkfs and tar or dump/restore are sensible.

What are you partitioning it for, btw?

--
dwmw2
