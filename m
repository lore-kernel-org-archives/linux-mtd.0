Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdXFt-0002aY-Qa
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 01:15:35 +0000
Received: by wera10 with SMTP id a10so4074044wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2011 17:15:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324414200.2611.1.camel@koala>
References: <1324332231-30884-1-git-send-email-computersforpeace@gmail.com>
 <4EF04C33.7060805@linutronix.de>
 <CAN8TOE_2yuqPnUwA6KWJ7Vqr=dEqevGP5A1nbqYSbJGB_hgSEQ@mail.gmail.com>
 <1324414200.2611.1.camel@koala>
Date: Wed, 21 Dec 2011 17:15:29 -0800
Message-ID: <CAN8TOE-+DYYhzAJfcAb3z+qO6OwcScKTGTqREMO0BH5aXYZeVg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: write bad block marker even with BBT
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 20, 2011 at 12:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-12-20 at 10:17 -0800, Brian Norris wrote:
>> > I use BBT because I
>> > have no room left in OOB or updating a single area in OOB is too
>> > complicated / hardly possible.
>> > In the former case, reading that area again and interpreting it as
>> > something as it was once is a bad thing.
>>
>> Well, then that is one case where you want an option to avoid writing
>> to markers back to OOB. We may need an option flag to enforce the old
>> behavior.
>
> I guess there should be some way of detecting this case (no space in
> OOB) and just not writing.

Any suggestions on how to detect no space in OOB? ECC layout structure
is not necessarily reliable, as its fields are designed for
determining what's available apart from BBM and ECC (for userspace or
filesystem data).

My idea: instead of adding more layout info about free space for
writing BBM, we can add a flag to avoid writing BBM to OOB
(NAND_NO_WRITE_OOB?). Would this suffice for you, Sebastian? It would
effectively be a reversal of my v1 patch; we write to both the
flash-BBT and the OOB BBM by default and provide an option that
prevents writing to OOB.

If we use NAND_NO_WRITE_OOB, are there other reasonable situations in
which we should prevent OOB writes according to this flag?

Another question: I noticed that when writing bad block markers to
OOB, we simply overwrite without erasing first. This is a problem on
MLC, which aren't designed to be written twice; they usually can write
some of the bits to 0, but not all of them. Is it reasonable to change
nand_default_block_markbad() to always have it erase the block before
writing? We can just ignore errors (if this is a really bad block that
can't be erased properly). This would be subject of a second patch of
course.

Brian
