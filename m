Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14JDFF-0005Oj-00
	for mtd-list@infradead.org; Thu, 18 Jan 2001 11:28:45 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14JDFD-0005Od-00
	for mtd@infradead.org; Thu, 18 Jan 2001 11:28:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01011716530001.08043@workbox.atlanta.itserve.com> 
References: <01011716530001.08043@workbox.atlanta.itserve.com> 
To: dhamm@itrepro.com
Cc: mtd@infradead.org
Subject: Re: DiskOnChip 2000 again 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Jan 2001 11:28:15 +0000
Message-ID: <14957.979817295@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dhamm@itrepro.com said:
> Using configured probe address 0xd000 

It's not at 0xd000 if it's in a PC. Try 0xd0000.

Device 93,0 should be /dev/nftla



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
