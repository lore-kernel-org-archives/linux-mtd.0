Message-ID: <4E16AB39.5000405@freescale.com>
Date: Fri, 8 Jul 2011 15:01:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 1/4] ARM: mxs: add GPMI-NAND support for imx23/imx28
References: <1310102885-4102-1-git-send-email-b32955@freescale.com>
	<1310102885-4102-2-git-send-email-b32955@freescale.com>
	<20110708065337.GN29624@pengutronix.de>
In-Reply-To: <20110708065337.GN29624@pengutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: arnd@arndb.de, s.hauer@pengutronix.de, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
> Hello Huang,
>
> On Fri, Jul 08, 2011 at 01:28:02PM +0800, Huang Shijie wrote:
>> +/* The size of the resource is fixed. */
>> +#define RES_SIZE	6
> This name is too generic. Maybe GPMI_NAND_RES_SIZE?
ok.  I will change it in later version.

  thanks.

Best Regards
Huang Shijie
> Best regards
> Uwe
>
