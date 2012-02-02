Date: Thu, 2 Feb 2012 15:01:35 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v3] mtd/gpmi : add BBT support to gpmi nand driver
In-Reply-To: <20266.36804.844286.216383@ipc1.ka-ro>
Message-ID: <Pine.LNX.4.64.1202021441330.554@lnxricardw.se.axis.com>
References: <1328008316-27258-1-git-send-email-b32955@freescale.com>
 <20120131121007.GO2471@pengutronix.de>
 <1328183611.28171.170.camel@sauron.fi.intel.com>
 <20266.36804.844286.216383@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
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


On Thu, 2 Feb 2012, Lothar Wa=DFmann wrote:

> Hi,

> IMO it's just silly trying to write anything, even a bad block marker,to=
=20
> a known bad block in NAND flash.
>
> The bad block markers in particular bytes in the OOB area are providedby=
=20
> the manufacturer to identify "Factory Bad Blocks". That and no more! I=20
> don't know why everybody is trying to interpret them as a general bad=20
> block indicator.

Why not? It's just another byte within the block.

It depends on what you mean by the concept 'bad block'. In the data sheets=
=20
manufacturers usually state that 'additional bad blocks can develop over=20
time', and this basically means that a block becomes worn out so that they=
=20
don't meet the specifications regarding data retention etc, but the block=
=20
is not defective in the sense that there's been a destructive change in=20
the silicon structure.

In contrast, factory bad blocks can be both blocks with physical defects=20
preventing their use, as well as blocks which don't meet the=20
specifications. In my experience with 1 GB SLC flashes, the latter type of=
=20
'bad' dominates, so that in many cases it is possible to erase the bad=20
block markers on factory bad blocks and use them just as any other block.=
=20
Since they were marked bad from the factory it is not a wise idea and=20
should definitely not be used for production but can be very handy for=20
'unbricking' a device where something has gone wrong with the flash=20
management and all blocks have been marked as 'bad' with no information as=
=20
to whether they were factory bad or not.

(In fact in a test concluded by NASA the factory marked bad blocks did not=
=20
seem to correlate with the blocks having the worst characteristics; I=20
think the relevant document is=20
http://trs-new.jpl.nasa.gov/dspace/bitstream/2014/40761/1/08-07.pdf but=20
I'm not completely sure).

The Flash chip reports an error on a write or erase operation if the=20
operation does not complete successfully within certain time constraints,=
=20
which are grounds for marking a block as unusable, i.e. bad, but usually=20
the block is worn out long before the on-chip write/erase algorithms=20
report errors. Hence a block should really be marked 'bad' while it still=
=20
is 'good', in a sense.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
