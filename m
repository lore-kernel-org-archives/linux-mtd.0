Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142Dbp-00067V-00
	for mtd-list@infradead.org; Sat, 02 Dec 2000 14:25:49 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142Dbo-00067P-00
	for mtd@infradead.org; Sat, 02 Dec 2000 14:25:48 +0000
Date: Sat, 2 Dec 2000 07:29:29 +0000
From: Shane Nay <shane@agendacomputing.com>
To: Shane Nay <shane@agendacomputing.com>
Cc: mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0001 && XIP kernel w/MTD working
Message-ID: <20001202072929.D4457@www.easysolutions.net>
References: <20001202050132.B4457@www.easysolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <20001202050132.B4457@www.easysolutions.net>; from shane@agendacomputing.com on Sat, Dec 02, 2000 at 05:01:32 +0000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Problem solved, and MTD write, read, and erase is now functioning with an
XIP kernel.  Now come my questions..., I realized that it was trying to
fill the write buffer, but wasn't signaling the right size to the flash
chip now.  I traced where it was doing that, and have come to a conclusion
about a particular line of code.  But it might be a special case, and if so
we'll need some logic to deal with it, but I think it might just be a
mistake.  Okay, here it is:

In cfi_cmdset_001.c, in the do_write_buffer code, when it is sending the
size to the cmd_adr after putting the flash chip in write mode.  The
calculation for size there seems to be wrong for interleaved chips.  The
old code reads:
cfi_write(map,CMD((len/(cfi->device_type + CFIDEV_INTERLEAVE))-1),cmd_adr);

However, in my case, when it used this calculation, it undershot the number
of "words" it was going to write.  I think this is really confusing,
because the flash chip I'm working with percieves the number you send there
as "The number of times you will fill the bus".  But in the PDF it says
that that is the number of "words" that you will send it.  I suppose their
definition of word in this case is the present used buswidth of the chip. 
In any event, the correct code in my situation is:
cfi_write(map,CMD((len/(cfi->device_type)-1),cmd_adr);

The interleave should not factor into the division of the number of "words"
you are going to send.  I don't know if this is "generally true", but I
imagine it to be.  Anyone else out there with interleaved intel flashchips?

Thanks,
Shane.

(Ugh, replied to my own thread, bad juju)




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
