Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14moeM-0003Jo-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 04:17:02 +0100
Message-ID: <3AD27A8B.F6226069@sis.com.tw>
Date: Tue, 10 Apr 2001 11:14:19 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: "Carson, Jon A." <JACarson@addcoinc.com>,
        "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: Formatting problems with DOC2000 / 16 meg.
References: <5B08DC7C9AA6D411930E00105A19794B3E23C6@EXCHANGE> <21067.986851062@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> JACarson@addcoinc.com said:
> >  Here is the print-out of "./nftl_format /dev/mtd0" which seems to
> > have failed somehow.
> 
> OK, I'll plug in a DiskOnChip eval board and check this tomorrow morning.
> 
> --
> dwmw2
> 

David,
	I also got this problem on DoC Millennium with current CVS
here too. It seems the READ|WRITE_OOB are the cause.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
