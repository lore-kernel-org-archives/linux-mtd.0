Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlFYr-0005vZ-KP
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 07:59:02 +0000
Received: by wibhr1 with SMTP id hr1so1345172wib.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2012 23:58:58 -0800 (PST)
Date: Thu, 12 Jan 2012 09:58:45 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
Message-ID: <20120112095845.3c9928d1@pixies.home.jungo.com>
In-Reply-To: <1326320928.2338.37.camel@koala>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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

On Thu, 12 Jan 2012 00:28:45 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> In my view, OOB BB markers is the primary, reliable, and simple
> mechanism. And BBT is just an additional optimization to speed up system
> startup.
> 
> So in general I support Brian's efforts

I'm in favor of this approach as well.
However IMO it should (1) be 'bbt_options' configurable; (2) should
properly address OOB vs BBT out-of-sync issues.

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

So your new scheme for 'nand_default_block_markbad' is as follows:
  (1) mark BBM in OOB
  (2) update on-flash BBT.
Where existing scheme (for NAND_BBT_USE_FLASH devices) is:
  update on-flash BBT.

And hence, if power-cut occurs between (1) and (2) in the new scheme,
it is equivalent to a power-cut that occurred just an instant prior
actually performing the BBT update in the old scheme.

Meaning: the system, being NAND_BBT_USE_FLASH based, will simply won't
be aware of the bad block (although already OOB marked).
Is that right?

> I guess we also need to read oob before writing it when we are marking a
> block as bad - just in case it is already marked as bad in OOB.

I assume you mean using 'chip->block_bad' within the new implementation
of 'nand_default_block_markbad' prior executing (1). Is that right?

> Comments? If this does not make sense - I have a good excuse - it is
> late and I am very sleepy :-)

I guess it's reasonable :)

The only argument I have is that this scheme, although working,
contradicts your view of "OOB BB markers being the primary mechanism".
That's because 'nand_block_checkbad' prefers the info from the BBT
(for NAND_BBT_USE_FLASH devices).

Regards,
Shmulik
