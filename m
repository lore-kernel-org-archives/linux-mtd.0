Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11ech7-0006Ce-00
	for mtd@infradead.org; Fri, 22 Oct 1999 12:17:13 +0100
To: Jeff Noxon <jeff@planetfall.com>
Cc: Ian Eure <ieure@uswest.net>, linux-kernel@vger.rutgers.edu,
    mtd@infradead.org
Subject: Re: Linux + DiskOnChip problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Oct 1999 12:17:12 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11ech6-0003J5-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jeff@planetfall.com said:
>  According to the following document, you must load new firmware:
>    Linkname: Using DiskOnChip with Linux - Installation Manual
>         URL: http://www.m-sys.com/files/imdoc_linux.pdf 
> Perhaps I misunderstand something.  After all, I don't have a DOC.


David.Woodhouse@mvhi.com said:
>  No, I agree - it definitely says you need an alternative firmware
> image to use  the thing from Linux. I'll ask them about it.


OK - I've asked them about it.

It appears that the DiskOnChip firmware and LILO 'cannot work together since 
they use the same addresses'.

Therefore, the 'new firmware' which you're expected to load is in fact just
full of 0xff, and doesn't do anything. You install the Linux root on the
DiskOnChip, and the patched LILO to work around the problem, and then you
replace the firmware with a real copy again. 

The best answer to this would be to replace the firmware with something that
isn't so badly behaved - either providing an INT 10h interface like the current
firmware does, or just something that's capable of booting a Linux kernel
directly from the DiskOnChip. The latter idea is quite simple to implement.



----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
