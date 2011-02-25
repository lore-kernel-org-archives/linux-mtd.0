Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pt2Po-0006t5-EB
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 18:29:21 +0000
Date: Fri, 25 Feb 2011 19:27:49 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: David Peverley <pev@sketchymonkey.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
Message-ID: <20110225182749.GB25636@parrot.com>
References: <AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
	<20110225113609.GB21841@parrot.com>
	<1298635930.2798.96.camel@localhost>
	<AANLkTikKe2ub8CZ+vP-1gXjtr=-BDJ6nc8aEG_9iJj6K@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <AANLkTikKe2ub8CZ+vP-1gXjtr=-BDJ6nc8aEG_9iJj6K@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 25, 2011 at 12:59:01PM +0000, David Peverley wrote:
(...)
> Something else to consider - what about bit-flips during writes? These
> are currently only spotted if you enable write verify (and also not
> dealt with or even notified beyond a generic errcode) and ought to be
> handled / notified in a similar manner to the read but it's a lot
> harder to decide how to split this functionality between the MTD and
> FS layers as they're both closely involved. Not everyone wants to
> enable the additional overhead of verifys. Would it be reasonable just
> to leave it to the ECC check on the next read to that block instead?

It is reasonable only if you can guarantee that each page you program belongs to
a properly erased block, and has never been programmed before.

Power failure during erase or programming can produce seemingly erased pages,
but, in reality, unstable pages showing a random (i.e. large), changing amount
of bitflips. At least on recent (<= 50 nm technology) devices.

As of today, the above safety condition is not guaranteed by mtd+ubi+ubifs in
the presence of power failures; in which case enabling write verify is necessary
to avoid data corruption.

> In many ways it would be a lot easier (and involve only a single
> implementation) to provide a config option where if a read or write in
> MTD fails with a (correctable) bit flip or flips that the MTD itself
> takes it on itself to erase the block and re-write the data cleanly.

In order to do that in a safe, atomic way, you need to move data from one block
to another; and to do it in a transparent way, you need some kind of block
management layer, hence UBI...

BR,

Ivan
