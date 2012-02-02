Message-ID: <20266.41232.670348.59659@ipc1.ka-ro>
Date: Thu, 2 Feb 2012 15:43:28 +0100
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] mtd/gpmi : add BBT support to gpmi nand driver
In-Reply-To: <Pine.LNX.4.64.1202021441330.554@lnxricardw.se.axis.com>
References: <1328008316-27258-1-git-send-email-b32955@freescale.com>
 <20120131121007.GO2471@pengutronix.de>
 <1328183611.28171.170.camel@sauron.fi.intel.com>
 <20266.36804.844286.216383@ipc1.ka-ro>
 <Pine.LNX.4.64.1202021441330.554@lnxricardw.se.axis.com>
Cc: Huang Shijie <b32955@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bityutskiy,
 Artem" <artem.bityutskiy@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Ricard Wanderlof writes:
> 
> On Thu, 2 Feb 2012, Lothar Waßmann wrote:
> 
> > Hi,
> 
> > IMO it's just silly trying to write anything, even a bad block marker,to 
> > a known bad block in NAND flash.
> >
> > The bad block markers in particular bytes in the OOB area are providedby 
> > the manufacturer to identify "Factory Bad Blocks". That and no more! I 
> > don't know why everybody is trying to interpret them as a general bad 
> > block indicator.
> 
> Why not? It's just another byte within the block.
> 
But on a block that is known to have failed erasure or programming you
cannot rely on being able to program anything reliably. Thus it is
vain to try storing the info that the block is bad within that block
itself.

> The Flash chip reports an error on a write or erase operation if the 
> operation does not complete successfully within certain time constraints, 
> which are grounds for marking a block as unusable, i.e. bad, but usually 
> the block is worn out long before the on-chip write/erase algorithms 
> report errors. Hence a block should really be marked 'bad' while it still 
> is 'good', in a sense.
> 
How do you know that a worn out block will still retain the 'This
block is bad' information?


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
