Message-ID: <4E3FA88E.4070804@freescale.com>
Date: Mon, 8 Aug 2011 17:12:46 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: GPMI-NAND Status?
References: <20110805135133.GA26981@pengutronix.de>
In-Reply-To: <20110805135133.GA26981@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Koen Beel <koen.beel.barco@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram:
>
> ecclayout needs to be used to show that OOB is fully in use [1]
> ===============================================================
>
> Needed to make it work for JFFS2 and to pass the mtd-testsuite. A driver only
> working with UBIFS is surely not ready for mainline.
>
It seems just modifying the ecclayout of GPMI-NAND can not fix the problem.
It should also change the code of JFFS2 and mtd.

Some one ever posted a patch about this:
http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html

Best Regards
Huang Shijie
