Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlqDG-00059v-52
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 23:07:10 +0000
Received: by wgbdt13 with SMTP id dt13so2671896wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 15:07:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1326494553.2258.38.camel@koala>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <1326140612-26323-4-git-send-email-computersforpeace@gmail.com>
 <1326494553.2258.38.camel@koala>
Date: Fri, 13 Jan 2012 15:07:04 -0800
Message-ID: <CAN8TOE9Eb_4+tzdogmpLrmh=Sd3c9Qmu_htotZKALGuatRE+Lw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] mtd: nand: erase block before marking bad
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, Jan 13, 2012 at 2:42 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> This looks like an independent patch to me, is that right? If yes, you
> can send it separately.

It's mostly independent, but its exact code placement will be
dependent on the previous two patches. If you'd prefer, I'll resubmit
this separately. Then, assuming it's applied, I'll fix and resend the
controversial stuff (BBT + OOB) as a separate series, on top of it.

Brian
