Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AyZr-0003ef-00
	for mtd-list@infradead.org; Wed, 19 Jan 2000 17:07:27 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12AyZq-0003eZ-00
	for mtd@infradead.org; Wed, 19 Jan 2000 17:07:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
References: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
To: Pavel Roskin <pavel_roskin@geocities.com>
Cc: mtd@infradead.org, alan@lxorguk.ukuu.org.uk
Subject: Re: Patch for PowerPC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Jan 2000 17:16:48 +0000
Message-Id: <E12Ayiu-0002tC-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


pavel_roskin@geocities.com said:
>  - Some macros are not constants on PPC and cannot be used after "case".
>   Converted to if-else chains. 

I've reproduced this problem on both PPC and m68k. Essentially, we need the 
__constant_cpu_to_le16 et al. macros which I just posted.

Hopefully these will go straight into 2.3, and Alan has promised to at least 
look at them and consider putting them into 2.2.next

It's not the end of the world if they don't get in immediately - we can stick 
the definitions in our own code, surrounded by #ifdef for now. 

Ugly, but effective.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
