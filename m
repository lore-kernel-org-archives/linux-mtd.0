Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rl6f5-0000FJ-Am
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2012 22:28:51 +0000
Received: by eekc4 with SMTP id c4so648640eek.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2012 14:28:49 -0800 (PST)
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Brian Norris
 <computersforpeace@gmail.com>
Date: Thu, 12 Jan 2012 00:28:45 +0200
In-Reply-To: <4F0C086A.5070608@linutronix.de>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326320928.2338.37.camel@koala>
Mime-Version: 1.0
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
 Florian Fainelli <florian@openwrt.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-01-10 at 10:44 +0100, Sebastian Andrzej Siewior wrote:
> and I am still not convinced that it is a good idea to provide one
> information in two places. It seems to be redundant. If there are other
> people supporting this, I am not in your way.

NANDs become less and less reliable - they suffer from all kinds of read
and write disturb issues, unstable bits, etc. Do you trust MTD's
on-flash BBT which was created for the old reliable flashes? I don't
really trust it. I have a feeling that it is very real to have the BBT
corrupted because of read/write disturb - we read it rarely.

In my view, OOB BB markers is the primary, reliable, and simple
mechanism. And BBT is just an additional optimization to speed up system
startup.

So in general I support Brian's efforts. However, I am not sure that
Brian's decision to first mark block as bad in BBT than in OOB is the
right one. I have a feeling that the opposite way is correct. And it
looks like this will almost automatically solve the possible issue of
getting BBT and OOB out-of-sync due to a power cut while making a block
as bad. At least for the software I know: JFFS2, UBI, user-space tools
like ubiformat - I'll refer it just as "SW".

Indeed, when we mark a block as bad?

1. When we get erase error. Well, if SW erases a block, it does not care
of the contents. This means that if after the reboot SW will re-try
erasing it. And if the block is bad, and previously the erasure failed,
it will fail again, and SW will mark it as bad again.

2. When we get a write error. The SW recovers useful data from the
eraseblock, then tries to mark it bad. Well, UBI will first try to
torture it, but this is a not essential detail. Anyway, if we get a
power cut - the situation is the same - SW will try to erase this block
and write to it, will get errors again and will mark it as bad.

I guess we also need to read oob before writing it when we are marking a
block as bad - just in case it is already marked as bad in OOB.

Comments? If this does not make sense - I have a good excuse - it is
late and I am very sleepy :-)
