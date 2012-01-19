Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rnom5-0004SQ-6I
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2012 09:59:18 +0000
Date: Thu, 19 Jan 2012 10:59:06 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Angus CLARK <angus.clark@st.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
In-Reply-To: <4F17E2C5.2000301@st.com>
Message-ID: <Pine.LNX.4.64.1201191046520.6772@lnxricardw.se.axis.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F154BF6.6020608@st.com>
 <CAN8TOE9W2txK+tcnuFBKB3ZTp99Fx385=8zxq9N5cbthVJCwoA@mail.gmail.com>
 <4F17E2C5.2000301@st.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 19 Jan 2012, Angus CLARK wrote:

> On 01/18/2012 10:04 PM, Brian Norris wrote:
>> On Tue, Jan 17, 2012 at 2:22 AM, Angus CLARK <angus.clark@st.com> wrote:
>>> (Indeed, this issue was raised recently in a meeting with one of the ma=
jor NAND
>>> manufacturers, and the design enginner was horrified at the thought of =
relying
>>> on the OOB for tracking worn blocks.)
>>
>> That's interesting. I never had this impression, but perhaps the topic
>> just never came up.
>>
> Since it was first brought to our attention, we have sought clarification=
 from a
> number of sources.  The general consensus seems to be that if a block has=
 gone
> bad, then one cannot rely on any further operations succeeding, including
> writing BB markers to the OOB area.  However, the extent to which this is=
 a
> problem in practice is less clear.  Many of us have been using OOB BB mar=
kers
> for years without any issue, although perhaps we just haven't noticed!

As far as I understand, a block going bad during ordinary operation=20
basically means it is worn out to the point that the on-flash write=20
algorithm fails and responds with an error. So yes, that would mean that=20
in principle writes will fail so that the oob cannot be written. On the=20
other hand, that the chip reports a write error really means that it has=20
not managed to reliabily write all bits; it would seem unlikely that all=20
8 bits of the bad block marker byte in the oob would fail to get written=20
with zeros.

We ran a test on a 32 MB flash many years ago to get some sort of an idea=
=20
of what happens when a block 'wears out'. In that test, it was the erase=20
operation that failed first, and even then it was not an either-or=20
situation; a block where the chip reported an error during erase could=20
very well be erased successfully later. Furthermore, the number of erase=20
cycles was way above (with a factor 20 or so) above the endurance spec for=
=20
the chip - not surprising, since the specs by nature must be conservative.

What was more interesting was that the data retention at this state was=20
utterly lousy; writing to another block that had been written as many=20
times as the one that had 'failed' would have a retention time in the=20
region of hours before bits started flipping on subsequent reads.

What it all boiled down to was that for the failure mode we were seeing,=20
it was appearent that one cannot rely on the error status from the flash=20
to determine when a block is 'bad', one must have some form of erase=20
counter and proactively set a block as bad once the number of erase cycles=
=20
has reached a predetermined value (i.e. the endurance spec for the chip).=
=20
Furthermore, it was appearent that a block going bad is primarily a=20
wearing-out process, not something were a block suddenly 'goes bad' and is=
=20
unusable after that.

Of course, there are must likely other failure modes which we have not=20
observed, and also this was a couple of years ago; shrinking geometries=20
have affected the behavior of flash chips since then.

It would be interesting if anyone else has any hard data on this; the=20
flash manufacturers are usually not very forthcoming.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
