Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mGuY-0006mg-00
	for mtd-list@infradead.org; Thu, 19 Oct 2000 15:43:14 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mGuX-0006ma-00
	for mtd@infradead.org; Thu, 19 Oct 2000 15:43:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10010191023540.29348-100000@xanadu.vipswitch.com> 
References: <Pine.LNX.4.10.10010191023540.29348-100000@xanadu.vipswitch.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: cfi_cmdset_0001 unaligned write problems. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Oct 2000 15:43:07 +0100
Message-ID: <25665.971966587@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Quick response :)

nico@cam.org said:
>  Yeah...  I just fixed that one...  Wonder why it worked for me till
> now...

If you're testing with JFFS you won't have exercised that code. 

> However I suspect that there might be an issue with __u16 promoted to
> __u32 then back to __u16 on big endian CPUs.  What is the expected
> behavior?

> On LE, 0x1234 becomes 0x00001234 the back to 0x1234 which is fine... 

On BE, I think it'll match the comments I put in.
 (writing 0x5a to an odd address)
tmp_buf holds {0xff, 0x5a, xx, yy}
*(__u16)tmp_buf is 0xff5a
datum is 0x0000ff5a, which is stored as 0x00,0x00,0xff,0x5a
do_write_oneword uses the two bytes at &datum, which are 0x00 and 0x00.

I have no BE machine to test on ATM, though.

I was also seeing problems with JFFS - whatever I was writing to the flash 
wasn't 'taking'. Immediately reading files back would give corrupted data, 
and the filesystem was entirely untouched on rebooting - it didn't even 
complain of invalid nodes.

I very much doubt that was the same problem - I'm running on SH3 where the
unaligned trap would kill it first time. The unaligned problems showed up
when I was using 'cat' to write to the flash, to check it was working.

I've reverted to v1.25 for now. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
