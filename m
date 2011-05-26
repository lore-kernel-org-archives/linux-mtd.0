Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPVSg-00064N-TM
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 07:58:31 +0000
Date: Thu, 26 May 2011 09:57:54 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
Message-ID: <20110526075754.GC22192@parrot.com>
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
	<4DB14439.1050507@parrot.com>
	<Pine.LNX.4.64.1104260929150.30071@lnxricardw.se.axis.com>
	<BANLkTik218nb1bnFL03UA3WYwh+=BQAXCA@mail.gmail.com>
	<20110525164107.GA16801@parrot.com>
	<Pine.LNX.4.64.1105260901290.15966@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1105260901290.15966@lnxricardw.se.axis.com>
Cc: Ricard =?utf-8?Q?Wanderl=C3=B6f?= <ricardw@axis.com>,
	Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 26, 2011 at 08:07:36AM +0100, Ricard Wanderlof wrote:
> > ...
> > <digression>
> > The above note is probably not applicable to recent devices. Because bitflips
> > are much more likely to appear, saying that a specific byte marks a bad block
> > if it "does not contain FFh" it not realistic. ONFI 2.2 clarifies the issue and
> > states that a marker is 0x00, not just a byte that "does not contain FFh".
> > And recent Micron devices do not store markers in flash; they just return 0x00
> > for any byte read in a bad block (instead of the real data), using an internal
> > bad block table.
> > </digression>
> 
> I'm probably wrong here, but I just want to throw this thought into the 
> pot: I always thought that the reason for the 'not contain FFh' phrasing 
> was that there could be something physically wrong in a bad block so that 
> some bits could not be programmed to 0. Saying 'not contain FFh' would be 
> a way of saying 'we try to set all bytes to 0 but if for some reason some 
> bits are stuck at 1 still treat a non-FFh word as a bad block marker'.

I agree. The safest way to check a bb marker is probably to count the number of
set bits, and compare it to a threshold; instead of just comparing it to 0xff or
0x00.
But even if you stick to a simple comparison with 0x00 or 0xff on old nand
devices, I guess the probability that a bit is stuck in the marker is very low
and would maybe result in a few spurious bad blocks in a large set of devices.

Ivan
