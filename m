Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RHWd-0004Pd-00
	for mtd-list@infradead.org; Tue, 22 Aug 2000 18:07:47 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13RHWb-0004PX-00
	for mtd@infradead.org; Tue, 22 Aug 2000 18:07:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <324D4274C0@mamao.cetuc.puc-rio.br> 
References: <324D4274C0@mamao.cetuc.puc-rio.br> 
To: miguel@cetuc.puc-rio.br
Cc: mtd@infradead.org
Subject: Re: ECC and multi page read write support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 Aug 2000 18:07:43 +0100
Message-ID: <30561.966964063@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



miguel@cetuc.puc-rio.br said:
> . By  allowing multi sector access, it may not be possible to  check/
> generate ECC for all sectors being accessed, unless we  access an
> integral multiple of sectors.

As far as the DiskOnChip is concerned, that's an integral restriction of 
the hardware - ECC is supported only on 512-byte sectors, not on other 
sizes. That's one of the reasons why some people may end up continuing to 
use NFTL on the DiskOnChip rather than switching to JFFS.

JFFS, before it's used on NAND flash, is going to have to do write 
gathering so that it doesn't violate the restrictions on the number of 
writes per page. At that time, if we're going to use the hardware ECC - 
which I'm not sure we _can_ do - then we can make it write only one page at 
a time so we don't necessarily need to support multi-page write_ecc().

Multipage read_ecc() could be useful though, although again not absolutely 
necessary, because it could be handled elsewhere.


miguel@cetuc.puc-rio.br said:
>    3) The read_ecc do have the same eccbuf parameter. IMHO, this
> doesn't make much sense, as the ECC data written to the OOB is of  no
> use to the user module.

You're right. It probably makes more sense to have the ECC correction
handled entirely within the DiskOnChip code. It should have some way of
signalling to the caller that an error was found and corrected, though.


miguel@cetuc.puc-rio.br said:
>    The read_ecc is more "atomic" than write_ecc because the ECC  data
> must be read just after the sector data itself, or the syndrom  could
> be wrong if another process accesses the DoC in the mean  time.

The DiskOnChip driver has to handle that itself. CFI flash can read 'wrong' 
data if you try to read from it while it's in the middle of a write, too. 
It's a simple case of preventing conflicting concurrent access. 


miguel@cetuc.puc-rio.br said:
> 
>    1) we maintain the eccbuf in write_ecc and provide read_ecc with  a
> offset into OOB where it will find the ECC data.
>    2) we hardcode the position of ECC data in offset zero of OOB as
> M-Systems do.

I have no preference here. NFTL will obviously be happy if you hard-code it 
to zero. It depends on how we're going to do JFFS-on-NAND. It's probably 
simpler just to declare that JFFS will use zero too, and hard-code it. We 
can always change that later if we really have to.

It would have been nice if we could have used the ECC engine for individual 
JFFS nodes within a page - storing the syndromes in different places within 
the OOB area. I don't think the hardware lets us to that though - although 
we could pad the writes with 0xff, the reads wouldn't work.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
