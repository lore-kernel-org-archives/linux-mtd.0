Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKdEs-0001ap-1e
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 00:29:44 +0000
From: Marek Vasut <marex@denx.de>
To: chuck@mds.com
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
Date: Tue, 4 Mar 2014 01:29:12 +0100
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201403021542.09196.marex@denx.de> <5314B336.7090306@mds.com>
In-Reply-To: <5314B336.7090306@mds.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201403040129.12504.marex@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, March 03, 2014 at 05:52:06 PM, Chuck Peplinski wrote:
> On 3/2/2014 8:42 AM, Marek Vasut wrote:
> > On Sunday, March 02, 2014 at 06:28:26 AM, Chuck Peplinski wrote:
> >> Sorry about top posting.
> > 
> > You are sorry, yet you did it again :-(
> > 
> >> I am also using this n25q512.  My working code includes a fix similar to
> >> what Song posted.  I don't consider it elegant.  The problem is that
> >> this 25q512 apparently behaves in a unique fashion.  If you read the
> >> status register instead of the flag status register, reads work but
> >> erases and writes fail.  I know this from a couple of days of
> >> debugging.
> > 
> > So does the SR and FSR not toggle the bit 7 at the same time or what ?
> > 
> >> You must respond to the flag status register.
> > 
> > What do you mean by "respond" ?
> > 
> >> Yes, this is
> >> different from every other part.
> >> 
> >> Some possible solutions are:
> >> - hard code support for this device, as Song did.
> >> - add some other abstraction that affects support for every other part.
> >> I leave the decision to you, but neither sounds very pretty.
> >> 
> >>       Chuck
> >> 
> >> On 3/1/2014 1:22 PM, Marek Vasut wrote:
> >>> To me, it looks like FSR bit 7 and SR bit 7 should toggle exactly at
> >>> the same time and exactly for the same events. Can you try for example
> >>> reading them both and checking that the bit 7 really toggles at
> >>> different times please?
> >> 
> >> ______________________________________________________
> >> Linux MTD discussion mailing list
> >> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> > Best regards,
> > Marek Vasut
> 
> I'm learning about top posting.  How about this?

Better, good job ;-)

Now , how come the CC list was dropped ?

> FSR can apparently toggle without SR.

Is that documented anywhere ? How can that be ?

> For the device to work, I must
> read and then clear the flag status register.
> 
> My "wait_till_done()" (below) is called at the end of m25p80_erase() and
> m25p80_write().

Hmmmm , I have a feeling that if you actually added wait_till_ready() call at 
the end of _erase() and _write(), you would get the same effect. This would in 
turn mean you are instead missing wait_till_ready() somewhere else.

Can you try using wait_till_ready() at the end of _erase() and _write() please ?

> If you would like, I could submit a patch, or just a copy of m25p80.c.
> 
> // used with N25Q512A
> static int wait_till_done(struct m25p *flash) {
>      unsigned long deadline;
>      u8 code, fsreg;
> 
>      code = OPCODE_RD_FLAG_SR;    // read flag status register
>      deadline = jiffies + (1* HZ);  // one second
> 
>      do {
>          spi_write_then_read(flash->spi, &code, 1, &fsreg, 1);
>          if (fsreg & BIT_FLAG_STATUS_READY) {   // not busy.
>              code = OPCODE_CLEAR_FLAG_SR;    // clear flag status register
>              spi_write_then_read(flash->spi, &code, 1, NULL, 0);
>              return 0;
>          }
>          cond_resched();  // a form of kernel sleep
>      } while (!time_after_eq(jiffies, deadline));
>      return 1;
> }
> 
> Chuck
