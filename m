Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjkHH-0000wI-4j
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 10:17:37 +0000
Date: Fri, 3 Mar 2017 11:17:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpansjtu@gmail.com>, Peter Pan <peterpandong@micron.com>,
 Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, "linshunquan
 (A)" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v2 1/6] nand: spi: Add init/release function
Message-ID: <20170303111713.54e2ee48@bbrezillon>
In-Reply-To: <e6ca3ed5-29df-2ffe-1ae2-df7f31995a8d@gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-2-git-send-email-peterpandong@micron.com>
 <20170301105851.5bc9eb0d@bbrezillon>
 <CAAyFORL67p4y8ZeoZg1iD4SOF5e+d6u8tC=--eHdPWgvBWTE9g@mail.gmail.com>
 <20170303102831.4d6fac6c@bbrezillon>
 <eeae52f3-e446-4865-d0c6-2c97b5d9842e@gmail.com>
 <20170303110003.5d734f1e@bbrezillon>
 <e6ca3ed5-29df-2ffe-1ae2-df7f31995a8d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 Mar 2017 11:12:12 +0100
Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:

> On 03/03/2017 11:00, Boris Brezillon wrote:
> > On Fri, 3 Mar 2017 10:37:04 +0100
> > Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:
> >  
> >> On 03/03/2017 10:28, Boris Brezillon wrote:  
> >>> On Fri, 3 Mar 2017 16:37:55 +0800
> >>> Peter Pan <peterpansjtu@gmail.com> wrote:
> >>>
> >>> [..]  
> >>>> BTW, there is another question. read id method is not unique. Micron spi nand
> >>>> need a dummy byte before reading ID while some vendors don't. Now I define
> >>>> vendor alias in DTS and use this info to choose right manufacture ops. Do you
> >>>> have a better idea?  
> >>> Ouch. That's bad news. How about letting the manufacturer code read the
> >>> ID and detect the NAND?
> >>>
> >>> That means you'll iterate over all manufacturer entries in the
> >>> manufacturer table and call ->detect(). The ->detect() hook will be
> >>> responsible for reading the ID (with the proper read-id sequence) and
> >>> initialize the NAND parameters.
> >>>
> >>> If we find a common pattern between different vendors, we can then
> >>> provide default helpers for the read-id and/or detect implementation.  
> >> A effective way will be to read the up to 4 bytes of ID response, and
> >> ask every manufacturer to provide an ID and mask to compare with.
> >> Here is the list of ID/MASK I have compiled.
> >>
> >>           "MT29F1G01AAADD",
> >>           .id = 0x002C1200,  .id_mask = 0x00FFFF00,
> >>
> >>           "MT29F2G01AAAED",
> >>
> >>           "MT29F4G01AAADD",
> >>           .id = 0x002C3200,  .id_mask = 0x00FFFF00,
> >>
> >>           "GD5F1GQ4xC", /* version U (3.3V) or R (1.8) */
> >>           .id = 0xC8A14800,  .id_mask = 0xffefff00, /* 0xC8A148 or
> >> 0xC8B148 */
> >>
> >>           "GD5F2GQ4xC", /* version U (3.3V) or R (1.8) */
> >>           .id = 0xC8A24800,  .id_mask = 0xffefff00, /* 0xC8A248 or
> >> 0xC8B248 */
> >>
> >>           "GD5F1GQ4xBYIG", /* version U (3.3V) or R (1.8) */
> >>           .id = 0x00C8D100,  .id_mask = 0x00ffef00, /* C8D1 or C8C1 */
> >>
> >>           "GD5F2GQ4xBYIG", /* version U (3.3V) or R (1.8) */
> >>           .id = 0x00C8D200,  .id_mask = 0x00ffef00, /* C8D2 or C8C2 */
> >>
> >>           "F50L1G41A", /* ESMT */
> >>           .id = 0x00C8217F,  .id_mask = 0x00ffffff,
> >>
> >>           "W25N01GVZEIG", /* Winbond */
> >>           .id = 0x00EFAA21,  .id_mask = 0x00ffffff,
> >>
> >>           "MX35LF1GE4AB", /* Micronix */
> >>           .id = 0x00C21200,  .id_mask = 0x00ffff00,  
> > I'm not a big fan of this approach. See how each vendor seems to have
> > its own scheme, and we're not even sure they will use the same for
> > their next chips. That's what happened with raw NANDs, and the NAND ID
> > parsing just became a huge pile of hacks like that:
> >
> > 	if(vendorX and revisionY) then id-should-decoded-like-that;
> >
> > By letting the detection process to manufacturer code, we just get rid
> > of this complexity in the core, which is a good thing IMO.  
> 
> I agree, but only if you do the SPI command once, and ask each vendor 
> "->detect()" to check the content of the returned data.
> Otherwise, it may take some [long] time to finally know the real ID of 
> one chip.

Hm, we don't have that many manufacturers, and I don't think reading
the id takes a lot of time, but yes, we could define an array of 4
bytes (might need to be extended at some point), read the id once and
let the manufacturer code detect the NAND.


> 
> Arnaud
