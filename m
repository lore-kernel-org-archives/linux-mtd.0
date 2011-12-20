Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rd6dV-0000xn-77
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2011 20:50:09 +0000
Received: by lahc1 with SMTP id c1so5027622lah.36
 for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2011 12:50:04 -0800 (PST)
Subject: Re: [PATCH v2] mtd: nand: write bad block marker even with BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 20 Dec 2011 22:49:54 +0200
In-Reply-To: <CAN8TOE_2yuqPnUwA6KWJ7Vqr=dEqevGP5A1nbqYSbJGB_hgSEQ@mail.gmail.com>
References: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
 <4EF04C33.7060805@linutronix.de>
 <CAN8TOE_2yuqPnUwA6KWJ7Vqr=dEqevGP5A1nbqYSbJGB_hgSEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324414200.2611.1.camel@koala>
Mime-Version: 1.0
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
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
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

On Tue, 2011-12-20 at 10:17 -0800, Brian Norris wrote:
> > I use BBT because I
> > have no room left in OOB or updating a single area in OOB is too
> > complicated / hardly possible.
> > In the former case, reading that area again and interpreting it as
> > something as it was once is a bad thing.
> 
> Well, then that is one case where you want an option to avoid writing
> to markers back to OOB. We may need an option flag to enforce the old
> behavior. 

I guess there should be some way of detecting this case (no space in
OOB) and just not writing.

Artem.
