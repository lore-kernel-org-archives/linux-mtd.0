Message-ID: <4E0D6D69.5090102@freescale.com>
Date: Fri, 1 Jul 2011 14:47:05 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC controller
	driver
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>	
	<1309335878-16678-2-git-send-email-b32955@freescale.com>	
	<20110630102728.GB1997@pengutronix.de>	
	<20110630170432.GA20948@pengutronix.de>
	<1309498866.23597.201.camel@sauron>
In-Reply-To: <1309498866.23597.201.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: thierry.nolf.barco@gmail.com, linux-mtd@lists.infradead.org,
	Wolfram Sang <w.sang@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B407=E6=9C=8801=E6=97=A5 13:41, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Thu, 2011-06-30 at 19:04 +0200, Wolfram Sang wrote:
>> Why can't you define a nand_ecclayout with no free space?
> Yes, this sounds like the right way to go.
>
ok. I will read the code again, and try to use the nand_ecclayout.

thanks

Best Regards
Huang Shijie
