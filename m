Received: from eu1sys200aog112.obsmtp.com ([207.126.144.133])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rn6E3-0005Y6-Dz
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 10:25:12 +0000
Message-ID: <4F154BF6.6020608@st.com>
Date: Tue, 17 Jan 2012 10:22:46 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
In-Reply-To: <1326320928.2338.37.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
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
 Kevin Cernekee <cernekee@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
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

On 01/11/2012 10:28 PM, Artem Bityutskiy wrote:
> In my view, OOB BB markers is the primary, reliable, and simple
> mechanism. And BBT is just an additional optimization to speed up system
> startup.

This seems to be contrary to the advice given by the various NAND manufacturers
(with a quite unusual show of consensus!)  Once a block has been deemed to have
gone bad, one cannot rely on *any* operations being successful, and that
includes writing a bad block marker to the OOB area.  The recommended approach
has for some time been to use a Flash-resident bad block table, with an initial
scan for the manufacturer-programmed bad-block markers.

(Indeed, this issue was raised recently in a meeting with one of the major NAND
manufacturers, and the design enginner was horrified at the thought of relying
on the OOB for tracking worn blocks.)

The use of OOB BB markers certainly has some benefits (as already mentioned in
previous posts), and I like the idea of being able to use OOB markers in
conjunction with BBTs.  However, IMHO, I believe the BBT should be regarded as
the primary source of information, especially when considering inconsistencies
between the OOB markers and the BBTs.

> 1. When we get erase error. Well, if SW erases a block, it does not care
> of the contents. This means that if after the reboot SW will re-try
> erasing it. And if the block is bad, and previously the erasure failed,
> it will fail again, and SW will mark it as bad again.
> 

This raises another point.  It is entirely possible that an erase operation will
succeed on a block where it previously failed.  However, that does not mean to
say the block has now become good.  On first erase failure, the block should be
considered bad and steps taken to ensure the block is not used.

In other words, we cannot rely on erase failures as a way of recovering bad
block status, although I accept in some circumstances, it is probably the best
we can do!

Cheers,

Angus
