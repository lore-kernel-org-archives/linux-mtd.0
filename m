Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LrDN-0003XD-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 18:33:45 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LrDL-0003X7-00
	for mtd@infradead.org; Thu, 25 Jan 2001 18:33:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBLKIBMLGPAFMHEJICGEMICEAA.michalk@awpi.com> 
References: <NEBBLKIBMLGPAFMHEJICGEMICEAA.michalk@awpi.com> 
To: " Brian Michalk" <michalk@awpi.com>
Cc: mtd@infradead.org
Subject: Re: fdisk problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jan 2001 18:33:27 +0000
Message-ID: <17667.980447607@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Please could you look for the find_boot_record() function at the beginning 
of drivers/mtd/nftlmount.c.

In the loop which says 'search for a valid boot record', inside the code 
which executes if the memcmp of DataOrgID with 'ANAND' is zero (line 77 of 
my version), can you first make it printk a message when, so you know it's 
actually _found_ the ANAND header, and then find each instance of 'goto 
ReplUnitTable' and make it print the reason if/when it triggers, rather 
than just doing so silently.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
