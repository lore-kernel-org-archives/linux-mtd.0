Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ7R6-0001O4-Gc
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 14:21:08 +0100
Received: from mail.deutaeit.de ([213.168.79.210])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ7R2-0000Dj-Tb
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 09:21:07 -0400
From: Thorsten Haas <haas@deutaeit.de>
To: Ralph Siemsen <ralphs@netwinder.org>
In-Reply-To: <428DDF13.8030503@netwinder.org>
References: <1116403535.2682.7.camel@shrek> <1116489972.2647.4.camel@shrek>
	<428C7E60.3090908@netwinder.org> <1116573984.2737.13.camel@shrek>
	<428DDF13.8030503@netwinder.org>
Content-Type: text/plain
Date: Fri, 20 May 2005 15:20:57 +0200
Message-Id: <1116595257.2718.34.camel@shrek>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI physmap - how to create partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, den 20.05.2005, 08:58 -0400 schrieb Ralph Siemsen:
> Thorsten Haas wrote:
> 
> > Yes, they are the same. Yes, they are consecutive in memory. Yes, I
> > tried that. Yes, it's now less undocumented, because my diff contains
> > this information :)
> 
> Excellent.
> 
> > Well, actually, when using physmap.c I am able to create partitions, but
> > there is still some trouble when using the mtd partitions: erasing and
> > mounting fails.
> > 
> > Does someone have an idea, what I am doing wrong?
> > 
> > # flash_erase /dev/mtd0
> > File open error
> 
> That's a bit worrysome... Not sure if it checks for this, but do you 
> have this partition mounted at the time?
Nope, not mounted.

> Also check in /proc/devices that major 90 is in fact registered.
It is registered. Device nodes are also present. 

> > # flash_erase /dev/mtd4 0x0 0x40
> > Erase Total 64 Units
> > Performing Flash Erase of length 131072 at offset 0x160000
> > MTD Erase failure: Invalid argument
> 
> Hmm, I always use "flash_eraseall" command myself, so I don't have to 
> worry about the block numbers and such.  But I doubt this makes any 
> difference, your problem seems to lie elsewhere.
> 
> -R
