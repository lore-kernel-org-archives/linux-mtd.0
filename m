Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnpOS-0006zn-HC
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 13:52:33 +0000
Date: Mon, 10 Nov 2014 14:52:08 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Juergen Borleis <jbe@pengutronix.de>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
In-Reply-To: <201411101442.51441.jbe@pengutronix.de>
Message-ID: <alpine.DEB.2.02.1411101445360.23184@lnxricardw1.se.axis.com>
References: <201411101307.03225.jbe@pengutronix.de> <5460B10E.9060501@nod.at>
 <alpine.DEB.2.02.1411101404180.23184@lnxricardw1.se.axis.com>
 <201411101442.51441.jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Richard Weinberger <richard@nod.at>,
 =?ISO-8859-15?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 "jlauruhn@micron.com" <jlauruhn@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "tlinder@codeaurora.org" <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 10 Nov 2014, Juergen Borleis wrote:

> Hi Ricard,
> 
> On Monday 10 November 2014 14:13:27 Ricard Wanderlof wrote:
> > [...]
> > These are interesting figures. I must admit I've never seen anything quite
> > so bad before.
> 
> That leads me to the question if I have done the test in a correct way.

Could be. Or there's a lot of difference between flash manufacturers. We 
had very bad experience with a certain manufacturer several years ago.

> I have no idea how the two boards were programmend I run these two tests on. 
> Maybe the NAND programming was done in a wrong way which leads to this bad 
> result.

Unlike for instance old EPROMs, where the software programming the chip 
had to have a programming algorithm, with a NAND flash you basically send 
the data to the flash and wait for the embedded programming algorithm on 
the flash to finish, then check the result.

One problem could be if the page had been programmer more than the 
specified number of times without being erased. E.g. most SLC flashes 
specify a maximum of 3 writes per page before erase becomes necessary. If 
this is violated it could result in unstable bits. 

Another problem could be if the power supply was out of spec during 
programming.

> I have a bunch of boards here with 128/256/512 MiB NANDs where I can 
> repeat the tests. Any recommendations how to setup the NAND before to do 
> the tests again?

Not really, more than checking so that the data in the flash is the result 
of a single write operation (i.e. not written in 16 byte bursts for 
instance), and that the specs for the flash chip haven't been violated 
during programming; in essence, that the write operation is allowed to 
finish on its own (but I'm not sure it can be interrupted except by a 
power cycle anyway, so I don't think there's much that can be abused here. 
Perhaps someone else knows of a more concrete case of abusing a flash in 
software so it fails to retain its data?.)

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
