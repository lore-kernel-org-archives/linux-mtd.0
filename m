Message-ID: <532AB94D.1050406@freescale.com>
Date: Thu, 20 Mar 2014 17:47:57 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
References: <1395235406-13449-1-git-send-email-y>	<532AB1A2.9010702@freescale.com>
 <20140320102153.7106f915@ipc1.ka-ro>
In-Reply-To: <20140320102153.7106f915@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Mark Rutland <mark.rutland@arm.com>, b47714@freescale.com,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, y@KARO-electronics.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8820=E6=97=A5 17:21, Lothar Wa=C3=9Fmann =
=E5=86=99=E9=81=93:
> Hi,
>
> Huang Shijie wrote:
>> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8819=E6=97=A5 21:23, y@karo-electronic=
s.de =E5=86=99=E9=81=93:
>>> configurable via DT. This is required for the Ka-Ro electronics
>>> platforms.
>>>
>> If you disable the swapping, you will disable the NAND boot in actuall=
y.
>>
> No. All our modules do boot from NAND and none of them does the
> swapping.
>
>
It seems the NAND boot runs well by luck.

The ROM will do the swapping when it reads the BBT table written by the=20
kobs-ng (or something else?).

If the BBT table is small, not bigger then a page, the NAND boot may=20
runs well when you disable the swapping;
But it the BBT table is bigger, the ROM will get a corrupted BBT table.



thanks
Huang Shijie
