Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q2IY-0003BR-7r
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:53:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: angainor@evo.evopolska.com
In-Reply-To: <Pine.LNX.4.44.0306041127320.8546-100000@evo.evopolska.com>
References: <Pine.LNX.4.44.0306041127320.8546-100000@evo.evopolska.com>
Message-Id: <1055325225.2097.38.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 10:53:45 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: gerg@snapgear.com
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-04 at 11:56, angainor@evo.evopolska.com wrote:
> First of all, docprobe successfuly identifies DOCMP,
> but total size of the DoC is only half of its actual
> size (64MiB chip is identified as 32MiB).

Hmmm. Sounds like a bug in the hardware driver. Greg?

> I have studied the "DiskOnChip 2000 128Mb problem"
> thread here on list and tried to change the
> MAX_CHIPS_MPLUS define to something else than 1.
> Well, this way I got an 128MiB disk, then a
> 256MiB one, and so on... :). way too many chips found.

> 1. inftlcore.c
> 
>         if (mtd->ecctype != MTD_ECC_RS_DiskOnChip)
>                 return;
> 
>    does indeed return. I guess it shouldn't...

Mea Culpa. I've fixed that in CVS now.

> 
> INFTL: Media Header ->
>      bootRecordID          = BNAND
>      NoOfBootImageBlocks   = -1
>      NoOfBinaryPartitions  = 1
>      NoOfBDTLPartitions    = 1
>      BlockMultiplerBits    = 0
>      FormatFlgs            = 1
>      OsakVersion           = 0x30343135
>      PercentUsed           = 98
>      PARTITION[0] ->
>          virtualUnits    = 10
>          firstUnit       = 0
>          lastUnit        = 0
>          flags           = 0x20000000
>          spareUnits      = 0
>  INFTL: Media Header Parition 0  sanity check failed
>      firstUnit 0 : lastUnit 0  >   virtualUnits 0
> 
>    Basically, the start is ok and does reflect the
>    reality. So what goes wrong afterwards?

Can you dump the contents of the media header using the DOS tools? How
big is the 'binary' partition? If you comment out that sanity check does
it actually work? 


> 2. doc2000.h
>    
>    I found the following definition:
> 
> 	#define DoC_Mplus_OutputControl         0x1002
> 
>    Shouldn't this be rather:
> 
> 	#define DoC_Mplus_OutputControl         0x100c
> 
>    This is what I found in DOC_Millennium_Plus_DS_Rev1.7.pdf.
>    0x1002 is actually NOP. I don't think this will help me
>    much though ;)

I haven't seen that documentation. Greg?

-- 
dwmw2
