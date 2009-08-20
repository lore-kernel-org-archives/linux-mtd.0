Received: from ey-out-1920.google.com ([74.125.78.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeDxu-0005Cg-F7
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 20:10:35 +0000
Received: by ey-out-1920.google.com with SMTP id 5so83892eyb.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Aug 2009 13:10:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090820125734.GI23444@pengutronix.de>
References: <20090820125734.GI23444@pengutronix.de>
Date: Thu, 20 Aug 2009 22:10:27 +0200
Message-ID: <59b21cf20908201310s2c67dda2t294380e6e6ca5336@mail.gmail.com>
Subject: Re: MXC nand controller performance
From: Magnus Lilja <lilja.magnus@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Sascha,

2009/8/20 Sascha Hauer <s.hauer@pengutronix.de>:
> Hi,
>
> Hi recently found out that on my i.MX27 board the mxc nand controller
> performance nearly doubles when I disable interrupts. Can anybody
> confirm this behaviour, possibly on other i.MXs?
> I'm trying to figure out what to do. We could disable interrupts
> completely in which case the driver would become simpler. Maybe using
> polling mode has other impacts on other workloads, so maybe we want to
> add a flag to platform_data instead of disabling interrupts completely.

A flag sounds like a good idea.

> You can use the following patch to disable interrupts. It is not meant
> for inclusion in this form of course.

I can give it a try on i.MX31, how do you measure the performance?

/Magnus
