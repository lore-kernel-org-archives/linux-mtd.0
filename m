Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14v7Zn-0008O9-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 02:06:40 +0100
Message-ID: <3AF0AD7D.AE32DE19@sis.com.tw>
Date: Thu, 03 May 2001 08:59:41 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Stephen Herzog <mtd@sdesign.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: DoC, NFTL, partitions
References: <000f01c0d353$7c5d27c0$160aa8c0@gumby>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Stephen Herzog wrote:
> 
> I was really wanting to see nftla AND nftlb here.   As an aside,
> I can fdisk /dev/nftla and get a single 4M partition on /dev/nftla1
> however I can't seem to find the other 4M of the chip.  From reading
> the nftl kernel code, it sounds like it should scan then entire DoC
> and find the two partitions, however that is not happening.
> 

No, unfortunately. The current nftl driver can not support 2 or
more nftl partitions in a single /dev/mtd device. It should not
be too diffcult to fix. Just add a loop around NFTL_mount in
NFTL_setup. Actually there are some other "bugs", try to 
nftl_format /dev/mtd0 0x100000 0x500000 and see what happen.

> Can someone offer advice as to what I am doing wrong?
> 
> Also, any tips for getting jffs onto the nftl partition, I don't
> seem to be having much luck there either.
> 

AFIAK, you have to use JFFS with /dev/mtdblock rather than /dev/nftl

Ollie
