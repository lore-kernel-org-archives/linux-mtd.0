Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RrEa9-0008Pb-RC
 for linux-mtd@lists.infradead.org; Sat, 28 Jan 2012 20:09:06 +0000
Received: by wgbds1 with SMTP id ds1so2153478wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 28 Jan 2012 12:09:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1327676348.29385.7.camel@sauron.fi.intel.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
 <1327120684-7066-2-git-send-email-computersforpeace@gmail.com>
 <1327676348.29385.7.camel@sauron.fi.intel.com>
Date: Sat, 28 Jan 2012 12:09:00 -0800
Message-ID: <CAN8TOE_8OaL7uu-oEzVRGEGTXw3q9cf8HPwtEiu13fL=8Hvg+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: nand: move SCANLASTPAGE handling to the
 correct code block
From: Brian Norris <computersforpeace@gmail.com>
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Angus CLARK <angus.clark@st.com>, Dan Carpenter <error27@gmail.com>,
 Barry Song <21cnbao@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, "Hunter,
 Adrian" <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 "Woodhouse, David" <david.woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Florian Fainelli <florian@openwrt.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, "Dong,
 Chuanxiao" <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
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

On Fri, Jan 27, 2012 at 6:56 AM, Bityutskiy, Artem
<artem.bityutskiy@intel.com> wrote:
> On Fri, 2012-01-20 at 20:38 -0800, Brian Norris wrote:
>> As nand_default_block_markbad() is becoming more complex, it helps to
>> have code appear only in its relevant codepath(s). Here, the calculation
>> of `ofs' based on NAND_BBT_SCANLASTPAGE is only useful on paths where we
>> write bad block markers to OOB. We move the condition/calculation closer
>> to the `write' operation and update the comment to more correctly
>> describe the operation.
>
> Pushed this patch to l2-mtd.git because it seem to be good regardless of
> whether your second patch gets merged or not, thanks.

Sure, thanks.

> Not sure about the second patch yet, though.

OK, what are the remaining concerns?

Last I saw, Shmulik was recommending we follow up on your suggestion
to check the OOB marker before erasing/writing new bad block marker. I
can try implementing this with "chip->block_bad" if this seems
necessary.

Also, there was mention of "lazy checking" of some sort. I feel like
that's not central to this patch and might add unnecessary complexity
and overhead.

So, please comment which of the above are necessary additions to the
second patch. I'm fine as is, but I can easily implement the first.
The second would require more discussion and/or somebody else to do
it.

Brian
