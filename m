Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132vH0-0003Cz-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 13:30:58 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 132vGz-0003Ct-00
	for mtd@infradead.org; Fri, 16 Jun 2000 13:30:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006161347310.32189-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10006161347310.32189-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org,
  =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@matrox.com>
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 16 Jun 2000 13:31:25 +0100
Message-ID: <22037.961158685@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  A lot of it is whitespace changes. Some are optimizations, fixes and
> changes I've seem to have done after Sébastien branched his version.

I can compare a diff of the two an eliminate the obvious ones where the 
code is actually the same, or even where one version is obviously better. 

Some of it I should probably leave to you, at least till I know the code a 
bit better.

Rather than doing conflicting patches, do you want me to do the obvious 
ones now and then let you know, or leave it all to you?

I can start right now if the former.

Then, as my only testbed is an Alpha, we'll find out if it's 64-bit clean :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
