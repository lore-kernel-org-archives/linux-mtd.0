Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16leRo-0003Ig-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 23:15:48 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFA81@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Mark Meade
	 <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: UnitSizeFactor of != 1 yet? 
Date: Thu, 14 Mar 2002 15:27:24 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Here is how VirtualUnitSize calculated by dformat for DOC2000 or Millennium.

/*originally virtual unit size is equal to erasable unit size*/
  unitSizeBits = erasableBlockSizeBits;
 /*Calculate No of erasable units on the diskonchip*/
  noOfUnits = (unsigned short)(noOfChips /*No of flash devices */ * chipSize
/* size of each flash device */) >>unitSizeBits);

  /* Adjust virtual unit size so Media header with BBT  fit in one virtual
unit */
  while (noOfUnits + SECTOR_SIZE > (1UL << unitSizeBits)) {
    unitSizeBits++;
    noOfUnits >>= 1;
  }
  /* Bound number of units to find room in 64 Kbytes Segment */
  if( (noOfUnits >= MAX_UNIT_NUM) && (unitSizeBits < MAX_UNIT_SIZE_BITS) ) {
    unitSizeBits++;
    noOfUnits >>= 1;
  }  ,

where MAX_UNIT_NUM = 12KB and MAX_UNIT_SIZE_BITS = 15 .


Vadim

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tue, March 12, 2002 5:14 PM
To: Mark Meade
Cc: Vadim Khmelnitsky; linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 



mark@lakeshoremicro.com said:
> Yes, that was the message I got with the latest cvs code, after
> relocating the ReplUnitTable assignment.

> Just to make sure I didn't have something else screwed up, I went back
> to the source in 2.4.18, and added a printk of the UnitSizeFactor.  In
> that case, it also said 0. 

Eep. OK, if you put a check in just before we deal with UnitSizeFactor, 
setting it to 0xFF if it was 0x00 - does that make it work? Don't break the 
memcmp with the later MediaHeader - use a local variable of something.

Vadim, is this expected? Is a UnitSizeFactor of zero _always_ going to mean 
that the Virtual Unit size matches the physical unit size?

--
dwmw2
