Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZL7Y-0003by-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 01:44:16 +0100
Date: Tue, 30 Jul 2002 02:44:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ari Saastamoinen <mtd@oh3mqu.pp.vip.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 and block size for writing
Message-ID: <20020730004415.GA27647@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.44.0207300109560.10806-100000@vernon.teraflops.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.44.0207300109560.10806-100000@vernon.teraflops.com>
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

Hi!

> First I must be sorry if that subject has discussed before and/or this    
> situation is already supported, but only thing what I found was with 
> suvject "Does MTD include support for STM M58LW064?"  And the answer was  
> no.  I have the project what have that chip, and I tried to use that
> command set 0001 with the chip and it seems to be working somehow (using
> linux kernel 2.4.18-rmk7).  When I tried to dd something to the
> /dev/mtdblock/0 it seems to appear to the chip, but the JFFS2 writing do  
> not work.
> 
> I tried to debug what went wrong and it seems that problem might be in    
> write alignments.  On some chips it is possible to write zeros to the chip
> at any time, but with this chip writing to the 4*16 bit page is allowed   
> only once after erase.  Is there any configuration parameters for JFFS2 to
> make it perform writes only with that kind of alignment?
> 
> And if there is no currently supporting for that I will make it by myself.
> What is your suggestions?
> 
> 1) Should I patch mtdblock so it caches all the writes and writes only 64
> at the time?  I believe that file system is not safe agaings power
> failures any more with that patch.

No, jffs2 doesn't actually use the block device, it just picks the
underlying mtd device from it.

> 2) Should I patch mtdblock like: if I write 1 byte to it and it will
> report that 8 bytes were written?  Can JFFS2 recognize that and next write
> will go to the right place?

Again, no.

> 3) Or should I patch JFFS2 so it will do all needed alignment by itself?

More or less yes.

> 4) Does anyone have any other suggestions?

Sure! :-)

I have posted a couple of patches for then current cvs a couple of
weeks ago. With those, our STM flash chips worked and so should yours.
But the code only added the necessary feature, it is not cleaned up
yet, so don't expect inclusion in cvs before end of August.

What you need and what the patches provide is a couple of things:
- a command set 0020, as the byte/word writes are missing
- some more/different error checking, as the ecc changes behaviour
- a functioning writev for the command set
- page aligned erase markers for jffs2
- modified wbuf functions, usually for nand support, now for ecc nor

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
