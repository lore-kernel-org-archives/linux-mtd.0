Received: from mail-ww0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmsL9-0004SV-2j
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 19:35:37 +0000
Received: by wgbdr12 with SMTP id dr12so1857532wgb.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 11:35:32 -0800 (PST)
Date: Mon, 16 Jan 2012 21:35:14 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
Message-ID: <20120116213514.6264f88b@pixies.home.jungo.com>
In-Reply-To: <1326492734.2258.13.camel@koala>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <20120112095845.3c9928d1@pixies.home.jungo.com>
 <1326492734.2258.13.camel@koala>
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

On Sat, 14 Jan 2012 00:12:11 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2012-01-12 at 09:58 +0200, Shmulik Ladkani wrote:
> > On Thu, 12 Jan 2012 00:28:45 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > > In my view, OOB BB markers is the primary, reliable, and simple
> > > mechanism. And BBT is just an additional optimization to speed up system
> > > startup.
> > > 
> > > So in general I support Brian's efforts
> > 
> > I'm in favor of this approach as well.
> > However IMO it should (1) be 'bbt_options' configurable;
> 
> Why does it have to be configurable? Do you have some example in mind?
> 

Can't tell if it's a good enough reason, but it looks like some are
happy with existing behavior (do not expect on-flash BBT reliability
issues, or pleased with current handling of it, and have no
bootloader/kernel OOB-vs-BBT configuration clashes), and as such, they
are simply not interested of this change.
Must it be enforced?

Also, the change introduces some fine nuances (the OOB BBM test needed
within chip->block_markbad, or alternatively, lazy sync code).
Wouldn't it be better to have them scoped using a config?

Regards
Shmulik
