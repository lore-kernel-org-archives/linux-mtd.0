Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141uGF-0003ol-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 17:46:15 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141uGD-0003of-00
	for mtd@infradead.org; Fri, 01 Dec 2000 17:46:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8574.975681632@redhat.com> 
References: <8574.975681632@redhat.com> 
Cc: mtd@infradead.org, ollie@sis.com.tw, linuxbios@lanl.gov
Subject: Re: DiskOnChip 2000/Millennium driver merge. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Dec 2000 17:45:56 +0000
Message-ID: <31230.975692756@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  If anyone else with Millennium hardware could take a look at the
> differences between doc2000.c and doc2001.c, especially Ollie who
> actually  knows what he's doing, that'd be very much appreciated.

I think it's fixed. It now works on the DiskOnChip2000 - the culprit was 
the change to make doc_write_ecc() actually write the ECC data rather than 
just putting it into a buffer for the caller to subsequently write out.

Just continuing to write bytes to the IO register got it working on the 
Millennium. Not on the 2000, though. I had to change it to store the data 
and call doc_write_oob() at the end of doc_write_ecc() in order to make it 
work on the 2000.

I expect that to continue to work on the Millennium, but unfortunately I 
seem to have blown mine up - docprobe can't even see it any more :(

The combined 2000/Millennium driver now ought to be completely working.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
