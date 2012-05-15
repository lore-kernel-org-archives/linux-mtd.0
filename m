Message-ID: <4FB2109A.2080505@freescale.com>
Date: Tue, 15 May 2012 16:15:22 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] MTD: LPC32xx SLC NAND driver
References: <1336829386-23301-1-git-send-email-stigge@antcom.de>
 <1337068543.2528.143.camel@sauron.fi.intel.com>
In-Reply-To: <1337068543.2528.143.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com,
 Lars-Peter Clausen <lars@metafoo.de>, linux-doc@vger.kernel.org,
 Lei Wen <leiwen@marvell.com>, devicetree-discuss@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dwmw2@infradead.org, Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B405=E6=9C=8815=E6=97=A5 15:55, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> I am CCing few other guys who take care of several drivers which use
> similar way of busy-waiting - probably you could change it?
>
> Bastian: drivers/mtd/nand/sh_flctl.c
> Lars-Peter: drivers/mtd/nand/jz4740_nand.c
> Huang: drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> Lei Wen: drivers/mtd/nand/pxa3xx_nand.c
>
> On Sat, 2012-05-12 at 15:29 +0200, Roland Stigge wrote:
>> +       /*
>> +        * The DMA is finished, but the NAND controller may still have
>> +        * buffered data. Wait until all the data is sent.
When all the data is sent, is there an interrupt for this?


Best Regards
Huang Shijie

>> +        */
>> +       timeout =3D LPC32XX_DMA_SIMPLE_TIMEOUT;
>> +       while ((readl(SLC_STAT(host->io_base))&  SLCSTAT_DMA_FIFO)
>> +&&  (timeout>  0))
>> +               timeout--;
>> +       if (!timeout) {
>> +               dev_err(mtd->dev.parent, "FIFO held data too long\n");
>> +               status =3D -EIO;
>> +       }
> I know the MTD tree is full of this, but this is bad, I think. The
> timeout should be time-backed, not CPU-cycles-backed.
>
> I do not know the best way to do this, hopefully someone in the arm lis=
t
> could suggest, but the following pattern is at least better:
>
>
> /* Chip reaction time timeout in milliseconds */
> #define LPC32XX_DMA_TIMEOUT 100
>
> timeout =3D loops_per_jiffy * msecs_to_jiffies(LPC32XX_DMA_TIMEOUT);
>
> while ((readl(...))&&  timeout-->  0)
> 	cpu_relax();
>
> if (!timeout)
> 	error;
>
>
> So basically I turned your hard-coded iterations count into a time-base=
d
> timeout. I also used cpu_relax() which is commonly used in tight-loops
> like this. Here is a piece of documentation about cpu_relax():
>
> "
> The right way to perform a busy wait is:
>
>      while (my_variable !=3D what_i_want)
>          cpu_relax();
>
> The cpu_relax() call can lower CPU power consumption or yield to a
> hyperthreaded twin processor; it also happens to serve as a compiler
> barrier, so, once again, volatile is unnecessary.  Of course, busy-
> waiting is generally an anti-social act to begin with.
> "
>
