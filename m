Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sMcy-000797-00
	for mtd-list@infradead.org; Thu, 18 May 2000 10:30:00 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12sMcx-000791-00
	for mtd@infradead.org; Thu, 18 May 2000 10:29:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0005171506400.17790-100000@phiggins.transzap.com> 
References: <Pine.LNX.4.21.0005171506400.17790-100000@phiggins.transzap.com> 
To: Patrick Higgins <phiggins@transzap.com>
Cc: mtd@infradead.org
Subject: Re: Write support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 May 2000 10:29:57 +0100
Message-ID: <15757.958642197@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



phiggins@transzap.com said:
> I missed the -DCONFIG_NFTL_RW option to gcc.

Hmmm. I'd quite it not to let you remount RW when write support isn't 
present. However, I can even do it with a read-only floppy disc, so I 
assume that deeper magic would be required.


>  The driver also detects two Disk on Chips, although I only have one,
> as seen in the following console output:

Hmmm. Your hardware doesn't seem to be decoding all the address lines; so
the DiskOnChip appears at both 0xd8000 and 0xda000. 

We need to eliminate duplicates - which means that the code in which you
fixed the NULL pointer dereference needs to be made stricter - it needs to 
verify not only that our potential new DiskOnChip isn't at the same 
location as any of the old ones, but also that it's not the same hardware 
in a different location.

I'm not sure how to do this off-hand - possibly by writing to an 
unimportant register in one, and seeing if it changes in the other.

If you don't want to do that right now, just remove one of the two 
addresses from the doc_locations list in your copy of docprobe.c


phiggins@transzap.com said:
> NFTL capacity reduced for geometry reasons from bba0 to bb80 sectors

Now this I disapprove of. I thought I was using exactly the same method for 
calculating geometry as they did. Could you load M-Systems' driver and tell 
me what geometry it reports, along with the geometry reported by my code?


phiggins@transzap.com said:
>  I know you said earlier that the .exb files are not straight firmware
> images.  Do you know what format they are in, and how to convert them?

IIRC the IPL ROM loads the first 0x2000 bytes of the firmware only from the 
'left-hand-side' of the first 0x4000 bytes of the actual flash - using 256 
bytes of each 512-byte page. After that, the whole of the flash is used. 

Therefore, I assume that the EXB files can be converted by something like...

u_char buf[512];
long c=0;

memset(buf,0xff, 512);

while (c<0x2000) {
  read(exbfile, buf, 256);
  write(flash, buf, 512);
}

while (!eof(exbfile)) {
 read(exbfile, buf, 512);
 write(flash, buf, 512);
}

The dd utility could also do this for you without much difficulty, allowing 
you to then feed your converted firmware file to doc_loadbios.

You could confirm this by using the DOS utility to load the firmware once, 
then using dd to read it back off the raw flash (/dev/mtd0). Even if you 
can't work out the conversion from the original EXB file, you'll then have 
a firmware image that _is_ just an image of what to put on the flash, and 
hence can be used with doc_loadbios.


phiggins@transzap.com said:
>  How much work do you estimate would be required to get grub working,
> and what advantages and disadvantages would it have in comparison to
> lilo and syslinux?

The advantage of Grub once it's done is that it would be capable of 
driving the DiskOnChip directly - you wouldn't need to work around the 
problems with the M-Systems firmware using up all your precious sub-640K 
RAM.

It's already capable of finding and driving the hardware, and scanning for 
an NFTL Media Header. All that remains is to transplant some simple 
read-only NFTL support from the existing code in nftl.c - I reckon not a 
lot more than a couple of days' work.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
