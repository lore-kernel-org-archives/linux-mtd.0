Received: from [200.53.172.155] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gugd-0007lG-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 22:03:16 +0100
Message-ID: <20010911201345.19481.qmail@qis>
References: <20010911182623.15217.qmail@qis>
            <8583.1000239450@redhat.com>
In-Reply-To: <8583.1000239450@redhat.com> 
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: duplicate DoC millenium with dd
Date: Tue, 11 Sep 2001 20:13:45 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
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

David Woodhouse writes: 

> 
> niko@isl.net.mx said:
>>  for some reason I can not duplicate Disc on chip Millenium (8MB) with
>> dd command. I can build it using dd, fdisk, nftla_format, erase....
>> etc, but  not only dd.  
> 
> The DiskOnChip uses NAND flash, which has 'out of band' data areas. A 
> simple dd won't read or write them. Neither would it be sensible to use the 
> nanddump and nandwrite utilities for doing so, although they can - you want 
> to reformat each device individually, with its own bad block map, not the 
> bad block map of your master.

ohh, so bad.... I will have to nftl_format every time I update my flash.... 

> 
> nftl_format, mkfs and tar or dump/restore are sensible. 
> 
> What are you partitioning it for, btw?

It's a firewall. I place linuxbios & kernel first, then I nftl_format 
/dev/mtd0 0xFIRST_FREE_BLOCK and place a minimal filesystem (cramfs) on the 
rest of the chip..... since you say nftl_format removes original badblocks 
table M-Systems put on the chip at fabrication time, I kinda dislike this 
util..... 

is there any way to avoid nftl_format and boot my cramfs from /dev/mtdblockX 
or /dev/mtd0 with an 0xXXXX offset or something like this? 


Nikolai 
