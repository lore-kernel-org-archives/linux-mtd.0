Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132uZr-0002vs-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 12:46:23 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 132uZq-0002vm-00
	for mtd@infradead.org; Fri, 16 Jun 2000 12:46:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006161340080.32189-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10006161340080.32189-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org, "Sébastien" "Côté" <scote1@matrox.com>
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 16 Jun 2000 12:46:51 +0100
Message-ID: <18478.961156011@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  Hmmm. There is quite a lot of 'spurious' differences in the 2.2
> version and the 2.3 version. They could be merged to be much more
> alike.

I know. I've imported Sébastien's version as-is for now, and I'm about to 
look at little details like making it compile :)

After that, some of the spurious differences can be eliminated. We may even 
be able to have an 'inode-common.c' and make the v22 and v23 versions even 
smaller - we'll see.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
