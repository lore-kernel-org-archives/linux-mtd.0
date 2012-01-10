Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkYFh-000073-E9
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 09:44:23 +0000
Message-ID: <4F0C086A.5070608@linutronix.de>
Date: Tue, 10 Jan 2012 10:44:10 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Wippich <pewi@gw-instruments.de>, Gabor Juhos <juhosg@openwrt.org>,
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
 Florian Fainelli <florian@openwrt.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
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

On 01/09/2012 09:23 PM, Brian Norris wrote:
> This patch series is an update to a previous patch (that has split into
> a few patches) with a few additional patches at the end. The important
> segments of this series involve the default steps for marking new bad
> blocks when using a flash-based BBT. The new default behavior will write
> to the BBT as well as attempting to write a BBM to the OOB area of the
> bad block. See the patch descriptions for details.

Why do we update BBT and OOB and have the date in two places? One
Argument was that the boot loader may not have support for BBT and uses
OOB instead. If so, why not update the boot loader and make sure both
users (OS and boot loader) use the same data?
Any other other arguments why updating OOB is a good idea?

> The first patch, regarding NAND_NO_WRITE_OOB, is a first attempt at
So now the old-default behavior requires a flag. If I remember
correctly the OLPC used a different BBT layout and OOB was used for
some other purpose. I remember that we had a controller which wrote ECC
into OOB on its own and the driver could not write into OOB in ECC
mode. But then I don't known if this was simply not implemented in the
driver. So never mind.

> satisfying Sebastian's concerns that some systems utilize the entire OOB
> area for ECC, and so we need an option to prevent writing markers to
> OOB. My attempt to prevent other OOB writes may be misguided,
> incomplete, flawed in some other way, or some combination of the three.
> Please provide constructive criticism.

and I am still not convinced that it is a good idea to provide one
information in two places. It seems to be redundant. If there are other
people supporting this, I am not in your way.

Sebastian
