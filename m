Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlGem-0000Ab-S3
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 09:09:14 +0000
Message-ID: <4F0EA32E.20500@linutronix.de>
Date: Thu, 12 Jan 2012 10:09:02 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>	
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
In-Reply-To: <1326320928.2338.37.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Florian Fainelli <florian@openwrt.org>,
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

On 01/11/2012 11:28 PM, Artem Bityutskiy wrote:
> On Tue, 2012-01-10 at 10:44 +0100, Sebastian Andrzej Siewior wrote:
>> and I am still not convinced that it is a good idea to provide one
>> information in two places. It seems to be redundant. If there are other
>> people supporting this, I am not in your way.
>
> NANDs become less and less reliable - they suffer from all kinds of read
> and write disturb issues, unstable bits, etc. Do you trust MTD's
> on-flash BBT which was created for the old reliable flashes? I don't
> really trust it. I have a feeling that it is very real to have the BBT
> corrupted because of read/write disturb - we read it rarely.
>
> In my view, OOB BB markers is the primary, reliable, and simple
> mechanism. And BBT is just an additional optimization to speed up system
> startup.

so the OOB array is by design more reliable than the data area? So the
"less reliable" part of NAND does not apply to OOB, right? Because I
was thinking about putting in UBI and deal with it there sice it should
not lose data.

> So in general I support Brian's efforts. However, I am not sure that
> Brian's decision to first mark block as bad in BBT than in OOB is the
> right one. I have a feeling that the opposite way is correct. And it
> looks like this will almost automatically solve the possible issue of
> getting BBT and OOB out-of-sync due to a power cut while making a block
> as bad. At least for the software I know: JFFS2, UBI, user-space tools
> like ubiformat - I'll refer it just as "SW".
>
> Indeed, when we mark a block as bad?
>
> 1. When we get erase error. Well, if SW erases a block, it does not care
> of the contents. This means that if after the reboot SW will re-try
> erasing it. And if the block is bad, and previously the erasure failed,
> it will fail again, and SW will mark it as bad again.
>
> 2. When we get a write error. The SW recovers useful data from the
> eraseblock, then tries to mark it bad. Well, UBI will first try to
> torture it, but this is a not essential detail. Anyway, if we get a
> power cut - the situation is the same - SW will try to erase this block
> and write to it, will get errors again and will mark it as bad.
>
> I guess we also need to read oob before writing it when we are marking a
> block as bad - just in case it is already marked as bad in OOB.

why should it been marked bad and we as the system aka do one that made
the order do not know about it? It would make sense to verify OOB vs
BBT during boot-up. So we read BBT and would then sync the content with
OOB async so we don't block the boot process.

> Comments? If this does not make sense - I have a good excuse - it is
> late and I am very sleepy :-)

Do we lose the BBT table completely or just a few entries? If it is
just a matter of an entry or two what is the worst thing that can
happen? We run into the bad block again and mark it (again).

Sebastian
