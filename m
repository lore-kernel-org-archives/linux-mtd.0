Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U8Zp-0006Dm-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 15:10:53 +0100
Received: from passion.cygnus.co.uk ([194.130.39.73] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13U8Zi-0006Df-00
	for mtd@infradead.org; Wed, 30 Aug 2000 15:10:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1512880772E@mamao.cetuc.puc-rio.br> 
References: <1512880772E@mamao.cetuc.puc-rio.br>  <20000828185018.A2777@localhost> 
To: miguel@cetuc.puc-rio.br
Cc: Ciro Cattuto <ciro@prosa.it>, mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Aug 2000 16:07:07 +0100
Message-ID: <16105.967648027@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


miguel@cetuc.puc-rio.br said:
>    Yes, but to not waste the second half of pages AND make
> doc_stage1.S work for all devices we would need to add code to
> identify the nand chip. I don't know how much bigger doc_stage1  would
> be, but it will be probably more than 256 bytes.

That's not a problem. We don't currently start the grub stage2 until byte 
512 anyway, do we?

You don't even need to write the code to probe - if you set it up right 
it'll just happen for you.

Use 768 bytes at the beginning of the flash for doc_stage1.S.

0x000 - 0x0ff holds generic register setup code.
0x100 - 0x1ff holds code specific to the 256-byte-page devices.
0x200 - 0x2ff holds code specific to the 512-byte-page devices.

Now because the IPL ROM only loads the first half of the page on 512-byte 
devices, you'll find that whatever type of device you have, you magically 
get the 'correct' second half of the loader put into offset 256 when it's 
loaded into memory.

Start your grub stage2 at 0x300.

Calculate the checksum over the left-hand-sides of the pages and put it 
into the code for 512-byte-page devices.

Now, calculate the checksum for the 256-byte-page devices and put it into 
the code for the 256-byte-page devices - where the IPL won't see it if 
we're on a 512-byte-page device.

I can hack this up and get it to work on the 512-byte devices if you like.

miguel@cetuc.puc-rio.br said:
>     BTW, forgot my suggestion for "loadbios" ioctl... 

I didn't forget it. You don't like handling it in userspace - I agree. I 
just don't like handling it in the mtd character device _either_ :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
