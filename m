Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16axVz-0002aF-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 11:23:56 +0000
Date: Wed, 13 Feb 2002 12:34:34 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: joakim.tjernlund@lumentis.se, linux-mtd@lists.infradead.org,
   J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
In-Reply-To: <31104.1013598277@redhat.com>
Message-ID: <Pine.LNX.4.21.0202131224240.27508-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Wed, 13 Feb 2002, David Woodhouse wrote:

> 
> joakim.tjernlund@lumentis.se said:
> >  I thougth this was already supported? Just create a mtd partition
> > that will span two or more banks and mount a JFFS2 FS on top of that
> > partition. 
> 
> Doesn't work if the banks aren't made to appear contiguous by the map 
> driver. The probe code can't handle it. 

Yes. My initial plan _was_ to hide that stuff in the mapping driver
but you (David) persuaded me to look for a more general solution.

BTW, the concat layer even allows to concatenate different kinds of
chips (as long as they are of the same type, e.g. Flash).

> 
> The case in question has something like:
> 
>  --------------
>  |  CFI chip  |
>  --------------
>  |  BIOS chip |
>  --------------
>  |  CFI chip  |
>  --------------
> 
> You could hack up a map driver that appears to have the two CFI chips 
> contiguously, and then the probe code would find them both and make a 
> single MTD device from them -  but there was a reason why he wasn't doing 
> this. Perhaps the 'BIOS' bit is in fact the beginning of the second chip, 
> not actually a separate chip at all? I don't remember.

No, the BIOS is in the middle of the chip's addressing space. All this
_could_ conceivably be solved with a hacked-up map driver, but then again,
one might as well do the partitioning stuff in a hacked-up map driver. The
idea was to have this functionality available in a generic form, so it
it is accessible as a service from the MTD core layer.

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
