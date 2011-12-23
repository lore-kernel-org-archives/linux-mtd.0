Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Re0Ga-0006TB-Jl
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 08:14:13 +0000
Received: by eekc13 with SMTP id c13so8625095eek.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2011 00:14:10 -0800 (PST)
Date: Fri, 23 Dec 2011 10:13:53 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: write bad block marker even with BBT
Message-ID: <20111223101353.40264827@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE-+DYYhzAJfcAb3z+qO6OwcScKTGTqREMO0BH5aXYZeVg@mail.gmail.com>
References: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
 <4EF04C33.7060805@linutronix.de>
 <CAN8TOE_2yuqPnUwA6KWJ7Vqr=dEqevGP5A1nbqYSbJGB_hgSEQ@mail.gmail.com>
 <1324414200.2611.1.camel@koala>
 <CAN8TOE-+DYYhzAJfcAb3z+qO6OwcScKTGTqREMO0BH5aXYZeVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Baruch Siach <baruch@tkos.co.il>, Dan Carpenter <error27@gmail.com>,
 Barry Song <21cnbao@gmail.com>,
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

On Wed, 21 Dec 2011 17:15:29 -0800 Brian Norris <computersforpeace@gmail.com> wrote:
> Another question: I noticed that when writing bad block markers to
> OOB, we simply overwrite without erasing first. This is a problem on
> MLC, which aren't designed to be written twice; they usually can write
> some of the bits to 0, but not all of them. Is it reasonable to change
> nand_default_block_markbad() to always have it erase the block before
> writing?

Not an MLC expert, but could it be that for these MLC chips,
NAND_BBT_USE_FLASH is usually set, hence the complexities invloved in
re-programming the OOB are simply avoided?

If so, it stregthens your NAND_BBT_WRITE_BBM/NAND_NO_WRITE_OOB approach,
which goes hand-in-hand with Sebastian's scenario where there's no room
in the OOB.
