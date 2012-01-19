Received: from eu1sys200aog119.obsmtp.com ([207.126.144.147])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnoMh-0002cE-Hh
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2012 09:33:04 +0000
Message-ID: <4F17E2C5.2000301@st.com>
Date: Thu, 19 Jan 2012 09:30:45 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>	<4F0C086A.5070608@linutronix.de>	<1326320928.2338.37.camel@koala>	<4F154BF6.6020608@st.com>
 <CAN8TOE9W2txK+tcnuFBKB3ZTp99Fx385=8zxq9N5cbthVJCwoA@mail.gmail.com>
In-Reply-To: <CAN8TOE9W2txK+tcnuFBKB3ZTp99Fx385=8zxq9N5cbthVJCwoA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Dan Carpenter <error27@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Adrian Hunter <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, dedekind1@gmail.com,
 Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/18/2012 10:04 PM, Brian Norris wrote:
> On Tue, Jan 17, 2012 at 2:22 AM, Angus CLARK <angus.clark@st.com> wrote:
>> (Indeed, this issue was raised recently in a meeting with one of the major NAND
>> manufacturers, and the design enginner was horrified at the thought of relying
>> on the OOB for tracking worn blocks.)
> 
> That's interesting. I never had this impression, but perhaps the topic
> just never came up.
> 

Since it was first brought to our attention, we have sought clarification from a
number of sources.  The general consensus seems to be that if a block has gone
bad, then one cannot rely on any further operations succeeding, including
writing BB markers to the OOB area.  However, the extent to which this is a
problem in practice is less clear.  Many of us have been using OOB BB markers
for years without any issue, although perhaps we just haven't noticed!

> Anyway, the important question is: how does this impact the current
> solution I am developing? IMO, this seems primarily a matter of
> perspective, which would drive future development but does not
> fundamentally alter my proposed patch(es). 

Yes, I fully agree.  The patches add functionality that many of us would find
useful and should be regarded as a step in the right direction.

> Another note regarding the primary source: if the BBT is sufficiently
> corrupted (according to ECC), we fall back to the OOB markers. That
> doesn't make the flash-based BBT the 100% primary source, but I think
> it makes sense. This feature was pulled into the 3.2 release, BTW.

If the BBT becomes corrupted, then the best we can do is rely on OOB markers,
and your patch at least gives us a chance to recover information about blocks
that have gone bad through use.  However, it does concern me that the BBTs can
become corrupted in the first place.  Some systems have no other choice but to
rely on BBTs (e.g. no space or access to OOB).  For SLC NAND at least, the
pattern of use for the BBT blocks is well within the reliability/endurance
specifications.  Do you have some experience on BBTs becoming corrupted, other
than our own development practices, of course :-)

Cheers,

Angus
