Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10wvib-0006cF-00
	for mtd@imladris.demon.co.uk; Wed, 23 Jun 1999 23:42:09 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Wed, 23 Jun 1999 23:42:09 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 930177693:10:04608:0; Wed, 23 Jun 99 22:41:33 GMT
Date: Wed, 23 Jun 1999 16:40:31 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: Linux-MTD mailing list <mtd@imladris.demon.co.uk>
Subject: MTD Changes?
Message-ID: <Pine.LNX.3.96.990623163713.2872A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


Has anyone worked on the MTD stuff lately? I have a few changes that I
think would be usefull. The most notable is support for JEDEC number
sensing from flash devices, and ROM/RAM determination. Once the JEDEC
number is determined it is possible to automatically size the flash chips
and determine the writing algorithm to use.

I'd like to encode the JEDEC number into the mtd structure and have a
table of JEDEC -> Info for controling things that write to flash.

Also, I have half written a driver for the Octagon 5066 SBC if anyone is
interested..

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
