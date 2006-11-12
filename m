Received: from bay0-omc2-s33.bay0.hotmail.com ([65.54.246.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GjGeJ-000329-33
	for linux-mtd@lists.infradead.org; Sun, 12 Nov 2006 09:49:37 -0500
Message-ID: <BAY110-F110D7AD298D234E0F9AE15B2F50@phx.gbl>
In-Reply-To: <Pine.LNX.4.63.0611121438500.21876@redbean.intranet.gw-instruments.de>
From: "Ming Liu" <eemingliu@hotmail.com>
To: pewi@gw-instruments.de
Subject: Re: how to adress flash memory in Linux
Date: Sun, 12 Nov 2006 14:49:22 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Peter,
Thank you so much and what you said is really what I want! It's really 
helpful. But I still have some questions:

>Next you need a mapping driver. You may either use the generic physmap
>driver and supply your partitions too it or write your own mapping driver.
>This is not very complicated. For examples look under drivers/mtd/maps.

I have enabled the "CFI Flash device in physical memory map" and provided 
the start address and length. Now my system could recognize the flash 
chip.(My chip is CFI Intel/Strata compatible) Could you please say 
something in detail on how to supply my partitions to the physmap driver? 
Shall I do that during kernel configuration or just in Linux?

>Once you got a chip driver and a mapping driver you need to create the
>appropriate device nodes. E.g.:
>
>mknod -m 644 $XROOT/dev/mtd0    c 90 0
>mknod -m 644 $XROOT/dev/mtdr0   c 90 1
>mknod -m 644 $XROOT/dev/mtd1    c 90 2
>mknod -m 644 $XROOT/dev/mtdr1   c 90 3
>mknod -m 644 $XROOT/dev/mtd2    c 90 4
>mknod -m 644 $XROOT/dev/mtdr2   c 90 5
>
>mkdir -p $XROOT/dev/mtdblock
>mknod -m 644 $XROOT/dev/mtdblock/0 b 31 0
>mknod -m 644 $XROOT/dev/mtdblock/1 b 31 1
>mknod -m 644 $XROOT/dev/mtdblock/2 b 31 2
>

I am some confused that what's the difference between the mtd character 
device and the block device. Under which circumstance shall I use mtd char 
or block. In my mind, I think the flash memory device is more like a block 
device and most operations, such as block write and block read, are block 
device operations. Then what's the use for the mtd character device? Sorry 
that I have read the FAQ in MTD website but I cannot understand this very 
well.

Thank you so so so much for your kindly help.

Regards
Ming

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn/  
