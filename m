Received: from mail-ww0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rndq8-0000c1-MH
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 22:18:45 +0000
Received: by wgbdr12 with SMTP id dr12so4772742wgb.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2012 14:18:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1326494218.2258.36.camel@koala>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F0EA32E.20500@linutronix.de> <1326494218.2258.36.camel@koala>
Date: Wed, 18 Jan 2012 14:18:40 -0800
Message-ID: <CAN8TOE-YznqG6_FMuHriLkCfKDW72KAGGC+-gyi-vyeaXG_kew@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
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

On Fri, Jan 13, 2012 at 2:36 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Thu, 2012-01-12 at 10:09 +0100, Sebastian Andrzej Siewior wrote:
>> =A0Because I
>> was thinking about putting in UBI and deal with it there sice it should
>> not lose data.
>
> :-) BTW, with current unresolved unstable bits problem I do not
> recommend to use UBI/UBIFS if you need high power cut tolerance.

Also, we cannot reasonably offload all of bad block marking to
UBI(FS), since there are other filesystems/modules/etc. that rely on
the MTD/NAND layer to properly handle bad blocks. If this is moved up
to the filesystem, we miss out on benefits for other layers.

Brian
