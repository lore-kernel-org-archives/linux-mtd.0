Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yagko-00064s-Q7
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 08:33:36 +0000
Date: Wed, 25 Mar 2015 09:33:05 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
In-Reply-To: <EACD232272DA4849B060F0828564D13B6EB7D55E7E@ntcex01.corp.netcomm.com.au>
Message-ID: <alpine.DEB.2.02.1503250918420.13892@lnxricardw1.se.axis.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com>, <55000637.1030702@nod.at>
 <EACD232272DA4849B060F0828564D13B57804E2730@ntcex01.corp.netcomm.com.au>,
 <0D23F1ECC880A74392D56535BCADD7356B6C8603@NTXBOIMBX03.micron.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55E72@ntcex01.corp.netcomm.com.au>,
 <0D23F1ECC880A74392D56535BCADD7356B6C89FA@NTXBOIMBX03.micron.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55E7E@ntcex01.corp.netcomm.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Andrea Scian <rnd4@dave-tech.it>,
 =?ISO-2022-JP?Q?Qi_Wang_=1B$B2&5=2F=1B=28J_=28qiwang=29?= <qiwang@micron.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 25 Mar 2015, Iwo Mergler wrote:

> > From a simplified point of view you're right.  In reality the
> > program/erase recipes are actually quite advanced in order to get
> > very tight distributions on a full page.  The lower/upper page
> > sequence is designed to provide the most reliable results and
> > optimally we would like the lower and upper page programmed 100% of
> > the time.   There's been a lot of work done over the years to improve
> > power loss and it's much better than in the past, but it's still
> > something to be avoided on NAND.  It's always best to check the
> > integrity of the page after a power loss event.
> 
> Is there any way to check the page integrity beyond ECC?
>
> I'm concerned that the power loss could yield an OK looking
> page, but with not so tight charge distribution.
> 
> Maybe the hardware that can achieve tight distributions during
> programming, can be accessed to measure distribution of a
> programmed page?

What would be interesting from a software perspective would be if in some 
special mode one could read the read the memory cells and get an analog 
value with several bits of resolution, alowing the software to make an 
assessment as to how "good" the bits are. This would be in contrast to the 
normal, high speed, read mode. But perhaps matters are not that simple, 
either there is no such value to be had (but as I understand it in certain 
MLC flashes it is possible to shift the read thresholds, thus one could 
accomplish this by successive approximation. Sure, that means that one 
could do it entirely in software using existing devices, but it is a 
rather cumbersome process however), or there are other factors that govern 
the read thresholds which are not known outside the chip (or rather, 
outside the manufacturers lab!).

> > I have to be careful here because it's very dependent on the design
> > and I really need to know the specifics to make a definitive
> > statement, but a few ms should be enough time to protect the NAND.
> > WP# is your friend here.
> 
> The design is somewhat hypothetical - let's assume that we can
> guarantee the NAND supply for 10ms after system reset asserts.
> 
> At reset time, the NAND controller will abort any command sequence in
> progress, so the final "program page" command will be sent either before
> the reset, or not at all. The command byte may be cut short on the bus.

It would seem to me that the only thing really needed to guarantee that 
writes (or erase operations) are not cut short by power loss, is as Iwo 
says that the system design is such that when power loss occurs, there is 
enough power to maintain valid supply voltage levels to allow the NAND to 
complete operations in the worst case, after system reset is asserted.

Admittedly we don't always have the luxury of well-designed hardware, but 
having clear design rules for the hardware guys would help a long way in 
future designs.

> I'm very happy to talk to someone at the coal face of modern NAND 
> manufacturing. :-)

Agreed, I think we're very many that appreciate Jeff's contributions on 
the list, me included. NAND data sheets are often not so forthcoming, and 
there ends up being a lot of speculation about how things actually work, 
so it's really nice to have someone with real knowledge to discuss this 
with.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
