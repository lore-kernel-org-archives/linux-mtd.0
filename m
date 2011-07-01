Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 01 Jul 2011 08:41:01 +0300
In-Reply-To: <20110630170432.GA20948@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110630102728.GB1997@pengutronix.de>
	<20110630170432.GA20948@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309498866.23597.201.camel@sauron>
Mime-Version: 1.0
Cc: thierry.nolf.barco@gmail.com, Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-30 at 19:04 +0200, Wolfram Sang wrote:
> Why can't you define a nand_ecclayout with no free space?

Yes, this sounds like the right way to go.

-- 
Best Regards,
Artem Bityutskiy
