Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Dmkg-0003mx-00
	for mtd-list@infradead.org; Wed, 03 Jan 2001 12:10:46 +0000
Message-ID: <52AF3CB987C7D41183CD0090271F67C30105F1@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: RE: merging CFI command set drivers.
Date: Wed, 3 Jan 2001 12:10:09 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> A fair amount of the code to handle multiple erase sizes that 
> I've just put 
> into cfi_cmdset_0002.c is also going to be needed in cfi_cmdset_0001.c
> 
> I think it might be best to have the individual drivers provide the
> 'internal' functions (do_write_oneword, do_write_buffer, 
> do_erase_oneblock,
> etc.) and for the wrapper code which provides actual MTD 
> routines to be 
> generic and shared. 
> 
> Comments?
> 
Sounds good to me - I've had concerns in the past that fixes in one command
set don't always make it into the other command set. Making this change
would help ensure that the 'higher' level fixes apply to all command sets.

Simon


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
