Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12hB4G-0004LY-00
	for mtd-list@infradead.org; Mon, 17 Apr 2000 13:55:56 +0100
Received: from ncc2.infomail.es ([194.224.53.135] helo=infomail.es)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12hB4F-0004LS-00
	for mtd@infradead.org; Mon, 17 Apr 2000 13:55:55 +0100
Message-ID: <38FB0948.A443C9F2@tsai.es>
Date: Mon, 17 Apr 2000 14:53:28 +0200
From: Rodrigo Moya <rmoya@tsai.es>
MIME-Version: 1.0
To: MTD List <mtd@infradead.org>
Subject: Re: no success
References: <38FAEE26.24075503@tsai.es> <14587.2027.787434.857298@jodie.local>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:
> 
> Rodrigo Moya writes ("no success"):
> 
> > could not open /dev/nftl*
> 
> Does /dev/nftl? have the correct major number (93)?
> 
yes, all the nftla* devices have 93 as major number. Another thing, is
that the kernel displays no messages about the MTD drivers. Should it
show something?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
