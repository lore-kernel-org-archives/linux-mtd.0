Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12WygK-0002W1-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 09:41:04 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12WygI-0002Vv-00
	for mtd@infradead.org; Mon, 20 Mar 2000 09:41:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E12WPTl-0007TN-00@infradead.org> 
References: <E12WPTl-0007TN-00@infradead.org> 
To: "Dvir Oren" <dvir@lucidvon.com>
Cc: MTD <mtd@infradead.org>
Subject: Re: Questions about MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 20 Mar 2000 09:41:01 +0000
Message-ID: <22351.953545261@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dvir@lucidvon.com said:
>  a.  nftl_format in fact does not erase the first 48K, however it does
>  delete the partition table.  As I understand it, the disk partition
> is in  the first 512 bytes, so how can that be? 

In the beginning, there was an expanse of raw flash.

We set aside 49152 bytes of that for the firmware. The firmware may not 
actually take up all of that space, but it's allocated anyway.

The remainder of the flash is taken up with the actual NFTL filing system. 
This is a kind of filesystem which emulates a block device.

Your boot sector is actually in this block device, not on the first 512 bytes 
of the flash itself. When you overwrite the entire contents of the block 
device by using nftl_format, the boot sector is overwritten too - it's just 
like formatting a disk drive.

Think of it like low-level format and high-level format (remember old drives 
where you had to do that?)


> b.  When I try to create the partition, there are a lot of file system
>  errors, possibly because I formatted starting at 49152.  It seems
> like nftl_format doesn't set the start of the device from after the
> first  48k, which will then conflict. 

If this is after you've previously used nftl_format without specifying that 
you want it to start at byte 49152, then there's an NFTL header at the 
beginning of the flash which will be confusing things. 

Otherwise, I'm not sure, and I'd need a complete transcript of what you did, 
and the errors you way.

>  2.  doc_loadbios doesn't seem to do what it's supposed to do.
> However, it does destroy the flash, allowing me to docpmap /e the
> flash, which will lead me to the next...

The firmware that comes from M-Systems isn't supposed to be just loaded 
directly into the flash - which is what doc_loadbios does. You're supposed to 
spread out the first 8k of data over the first 16k of the flash, I think, 
putting 256 bytes of data at the beginning of each 512-byte page of flash.


dvir@lucidvon.com said:
> 3.  erase seg faults.  Is erase supposed to do what docpmap /e  does?

erase is supposed to completely clear the flash, and not do anything more. 
Isn't docpmap /e supposed to reformat it with NFTL again after doing that?

It shouldn't be segfaulting though - where's it doing it?


> 4.  Some odd problems when trying to dd the first 48k.  The  partition
> table is not saved after removing the nftl module.  Only  after
> writing it a second time does it get saved.

dd from where to where? Did you use the /dev/mtd0 device or /dev/nftla ?


dvir@lucidvon.com said:
> 5.  One thing I don't understand:  even though everybody talks  about
> the first 48k being the firmware, the firmware itself is less  than
> 48k.  How does that work? 

It's not using all the flash, because the IPL ROM doesn't know how to address 
the second half of each page of the flash - so it's wasting 8k (I think).

> And what about the first 512bytes  of the partition table? 

That's somewhere in the NFTL.


> Has anybody succeeded in booting off a DiskOnChip 2000 using  the MTD
> drivers?

Not yet. I have grub loading from DiskOnChip, but not then capable of getting 
a kernel off the NFTL.





--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
