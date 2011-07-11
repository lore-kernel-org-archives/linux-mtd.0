Message-ID: <4E1A8731.9080708@freescale.com>
Date: Mon, 11 Jul 2011 13:16:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v6 1/4] ARM: mxs: add GPMI-NAND support for imx23/imx28
References: <1310102885-4102-1-git-send-email-b32955@freescale.com>
	<1310102885-4102-2-git-send-email-b32955@freescale.com>
	<20110708190722.GA16490@pengutronix.de>
In-Reply-To: <20110708190722.GA16490@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: arnd@arndb.de, s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de,
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
> Hi Huang,
>
>> diff --git a/arch/arm/mach-mxs/include/mach/gpmi-nand.h b/arch/arm/mach-mxs/include/mach/gpmi-nand.h
>> new file mode 100644
>> index 0000000..f1cf565
>> --- /dev/null
>> +++ b/arch/arm/mach-mxs/include/mach/gpmi-nand.h
> I am also mostly happy with it now :)
>
> Assuming the above file will be needed by mx50/mx6, too, would it make sense to
> put it to include/linux/mtd/gpmi-nand.h right from the beginning?
thanks.

A good idea.

Best Regards
Huang Shijie
> Regards,
>
>    Wolfram
>
