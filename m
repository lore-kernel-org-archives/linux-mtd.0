Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139oxj-0002RY-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 14:11:35 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 139oxh-0002RS-00
	for mtd@infradead.org; Wed, 05 Jul 2000 14:11:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00070511345100.24168@frumious.unidec.co.uk> 
References: <00070511345100.24168@frumious.unidec.co.uk> 
To: john@frumious.unidec.co.uk
Cc: mtd@infradead.org
Subject: Re: doc2000 geometry problem? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Jul 2000 14:11:21 +0100
Message-ID: <10462.962802681@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


john@frumious.unidec.co.uk said:
>  The nftldump, erase and nftl_format utils all return an error (-1,
> helpful that) on the ioctl(blah,MEMGETINFO,&blah) call,

You _are_ using them on the flash device /dev/mtd0 aren't you, not on the 
nftl device /dev/nftla ?

You shouldn't need to do it though - can you not mount the /dev/nftla1 
partition? Or reformat it to ext2 with 'mkfs.ext2 /dev/nftla1' ?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
