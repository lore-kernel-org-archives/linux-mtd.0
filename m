Message-ID: <4E6818EB.3050907@freescale.com>
Date: Thu, 8 Sep 2011 09:22:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v11 1/3] MTD : add the common code for GPMI-NAND controller
	driver
References: <1314616381-11615-1-git-send-email-b32955@freescale.com>
	<1314616381-11615-2-git-send-email-b32955@freescale.com>
	<20110905151752.GA10987@pengutronix.de>
	<4E65F69D.5010808@freescale.com>
	<20110906141708.GJ2610@pengutronix.de>
	<20110907095907.GB1912@pengutronix.de>
In-Reply-To: <20110907095907.GB1912@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, marek.vasut@gmail.com,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> On Tue, Sep 06, 2011 at 04:17:08PM +0200, Wolfram Sang wrote:
>>> Should i wait for your test result, and send out the new version v12?
>>> or I send out the new version first, and then you test it again?
>> I'd suggest you send V12 and I will test it when NAND is on my list
>> again. I need to bring up this board first before I can do further
>> testing.
> Maybe you could also remove the debug log level mechanisms? We have
> DYNAMIC_DEBUG to select debug output these days...
>
thanks

Huang Shijie
