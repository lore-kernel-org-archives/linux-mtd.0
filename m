Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14DlkA-0003TL-00
	for mtd-list@infradead.org; Wed, 03 Jan 2001 11:06:10 +0000
Received: from dell-paw-3-eth1.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Dlk8-0003TF-00
	for mtd@infradead.org; Wed, 03 Jan 2001 11:06:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: nico@cam.org, ahennessy@mvista.com, mark.langsdorf@amd.com,
    Simon.Munton@m4data.co.uk, stephane.laroche@colubris.com,
    dv207@cam.ac.uk
Subject: RFC: merging CFI command set drivers.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 Jan 2001 11:05:23 +0000
Message-ID: <17774.978519923@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


A fair amount of the code to handle multiple erase sizes that I've just put 
into cfi_cmdset_0002.c is also going to be needed in cfi_cmdset_0001.c

I think it might be best to have the individual drivers provide the
'internal' functions (do_write_oneword, do_write_buffer, do_erase_oneblock,
etc.) and for the wrapper code which provides actual MTD routines to be 
generic and shared. 

Comments?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
