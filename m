Message-ID: <5216C58E.2040400@freescale.com>
Date: Fri, 23 Aug 2013 10:14:38 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V1 4/5] spi: Add Freescale QuadSpi driver
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-5-git-send-email-b32955@freescale.com>
 <20130822192158.GA10038@ld-irv-0074.broadcom.com>
In-Reply-To: <20130822192158.GA10038@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, b44548@freescale.com, dedekind1@gmail.com,
 b18965@freescale.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8823=E6=97=A5 03:21, Brian Norris =E5=86=99=
=E9=81=93:
> Can this controller support more than one chip? If so, then the nor-siz=
e
> property makes even less sense. See below.
>
yes.

this controller can supports two same chips at the same time.
>> >  +- clocks : The clocks needed by the QuadSPI controller
>> >  +- clock-names : the name of the clocks
>> >  +
>> >  +Optional properties:
>> >  +- fsl,nor-size : The NOR size used by the QuadSPI mapping.
> Why does the size of the NOR flash need to be in the controller's devic=
e
> node? Shouldn't this be detected at run-time if possible? Or at least
yes, i can parse out the NOR size by the DT node.

I can remove this DT property in the next version.


> included as a property of m25p80, if absolutely required?
the m25p80 has already contains the NOR size by: sector_size * n_sectors.
but as a spi driver , there is no API i can use to get the NOR size.

thanks
Huang Shijie
