Received: from mail-ew0-f208.google.com ([209.85.219.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfIuQ-0004pg-R9
	for linux-mtd@lists.infradead.org; Sun, 23 Aug 2009 19:39:44 +0000
Received: by ewy4 with SMTP id 4so1932881ewy.27
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Aug 2009 12:39:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090821122225.GL23444@pengutronix.de>
References: <20090820125734.GI23444@pengutronix.de>
	<59b21cf20908201310s2c67dda2t294380e6e6ca5336@mail.gmail.com>
	<20090821122225.GL23444@pengutronix.de>
Date: Sun, 23 Aug 2009 21:39:17 +0200
Message-ID: <59b21cf20908231239g4d8954d1x2f6d8638dd0ff31b@mail.gmail.com>
Subject: Re: MXC nand controller performance
From: Magnus Lilja <lilja.magnus@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>,
	Linux MTD list <linux-mtd@lists.infradead.org>,
	Eric Benard <ebenard@eukrea.com>, Daniel Mack <daniel@caiaq.de>,
	Alberto Panizzo <maramaopercheseimorto@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

2009/8/21 Sascha Hauer <s.hauer@pengutronix.de>:
> On Thu, Aug 20, 2009 at 10:10:27PM +0200, Magnus Lilja wrote:
>> Hi Sascha,
>>
>> 2009/8/20 Sascha Hauer <s.hauer@pengutronix.de>:
>> > Hi,
>> >
>> > Hi recently found out that on my i.MX27 board the mxc nand controller
>> > performance nearly doubles when I disable interrupts. Can anybody
>> > confirm this behaviour, possibly on other i.MXs?
>> > I'm trying to figure out what to do. We could disable interrupts
>> > completely in which case the driver would become simpler. Maybe using
>> > polling mode has other impacts on other workloads, so maybe we want to
>> > add a flag to platform_data instead of disabling interrupts completely.
>>
>> A flag sounds like a good idea.
>>
>> > You can use the following patch to disable interrupts. It is not meant
>> > for inclusion in this form of course.
>>
>> I can give it a try on i.MX31, how do you measure the performance?
>
> I did a 'time cat /dev/mtdblockx > /dev/null' and looked at the time
> needed to mount an ubifs. I haven't done any write tests though.

I did some tests on a i.MX31 Litekit board using a kernel from Linus'
tree a couple of days ago ('time cat /dev/mtdblockx > /dev/null'):
with interrupts: 18s
without interrupts: 13s

No write tests or mounting filesystems were done.

/Magnus
