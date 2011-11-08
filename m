Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNsyA-0007NA-5o
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2011 21:12:34 +0000
Received: by bkat2 with SMTP id t2so1155842bka.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 Nov 2011 13:12:32 -0800 (PST)
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Tue, 08 Nov 2011 23:12:28 +0200
In-Reply-To: <20111103115914.GA30600@parrot.com>
References: <1388924089.4520961320317174391.JavaMail.root@zimbra20-e3.priv.proxad.net>
 <333650967.4523301320318131386.JavaMail.root@zimbra20-e3.priv.proxad.net>
 <20111103115914.GA30600@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1320786750.17770.15.camel@koala>
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-11-03 at 12:59 +0100, Ivan Djelic wrote:
> On Thu, Nov 03, 2011 at 11:02:11AM +0000, Robert Jarzmik wrote:
> > > I can see two cleaner alternatives to solve this issue:
> > >
> > > 1. When you program a page, before writing hwecc to oob, adjust it like this:
> > > 2. Use unprotected spare oob byte 15 as a programmming marker: remove it from
> > > ...zip...
> > 
> > I would see a third one:
> > 3. After reading the page, check bit DOC_ECCCONF1_PAGE_IS_WRITTEN in DOC_ECCCONF1 register.
> >    I think this bit is calculated from the Hamming Code (not sure), but I'm pretty sure that
> >    this bit is 0 when the page is blank, and 1 if the page was written before.
> > 
> 
> OK, that's even simpler.
> But as Matthieu pointed out, you would still need to clean-up bitflips in blank
> pages for UBIFS...

What happens is UBIFS writes to a blank page which already contains more
bitflips than ECC can handle? I presume UBI would get a write error? If
UBI gets an EIO on write, than it should move all the data to a
different PEB and schedule the bit-flippy eraseblock for torturing. Just
worth checking that the driver indeed returns an error in this case.

Artem.
