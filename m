Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13PoOC-0004eK-00
	for mtd-list@infradead.org; Fri, 18 Aug 2000 16:49:00 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13PoO7-0004eE-00
	for mtd@infradead.org; Fri, 18 Aug 2000 16:48:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <399D56A2.BAAFB307@arcom.co.uk> 
References: <399D56A2.BAAFB307@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.org
Subject: Re: Can't change permissions (etc) of FIFOs on JFFS. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 18 Aug 2000 16:47:28 +0100
Message-ID: <32692.966613648@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  Attempting to change permissions and times of FIFOs in JFFS results
> in
>     jffs_notify_change(): Invalid inode number = nnn

Fixed. jffs_notify_change() was assuming that the inode would be a JFFS 
inode, when obviously it's a FIFO inode in this case, so it can't just grab 
the pointer to the struct jffs_file out of it.

Fixed committed - now we use jffs_find_file() to find the file by its inum.

A quick scan shows no more such paths which might expect JFFS inodes but 
actually get other types. You know what to do if you find them, though.

Someone who isn't as pissed off with this game as I am right now probably 
wants to port the last 24 hours worth of fixes from inode-v22.c to 
inode-v23.c


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
