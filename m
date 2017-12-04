Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eLrNU-0001Fz-Is
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 14:05:50 +0000
Date: Mon, 4 Dec 2017 15:05:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: <linux-mtd@lists.infradead.org>, <peterpandong@micron.com>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Message-ID: <20171204150514.1f17671d@bbrezillon>
In-Reply-To: <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frieder,

On Mon, 4 Dec 2017 14:32:14 +0100
Frieder Schrempf <frieder.schrempf@exceet.de> wrote:

> Hi Boris,
> 
>  > If everything goes well, we should be good for 4.14, and the patches
>  > will have spent enough time in linux-next to discover obvious bugs.  
> 
> What is the latest status of the SPI-NAND framework patches?
> 
> The reason I am asking is, that we have hardware based on the NXP 
> i.MX6UL SOC with a serial NAND connected via QSPI interface.
> 
> We currently have a working implementation based on a 3.14 vendor kernel 
> using a modified version of the "mt29f_spinand" staging driver, but for 
> the future we plan to use a recent mainline kernel.
> 
> We also think about porting our implementation to the new framework to 
> enable support for more SPI NAND chips (Winbond, Toshiba) and for the 
> NXP QSPI-controller.
> 
> Therefore we would like to know about the current schedule for bringing 
> the framework to mainline.

Sorry for the silence and the lack of progress on this front. I don't
have much time to work on this SPI-NAND framework (I do it on my spare
time), and last time I had a look and tried to address my own comments
on Peter's version, I realized I was not really happy with the
implementation, mainly because it copies some of the mistakes done in
the raw/parallel NAND framework.
So I ended up rewriting a lot of code, and didn't have time to test the
new implementation [1].

Note that it's mainly a rewrite of the generic NAND layer the SPI-NAND
framework is based on. I also re-considered the option of moving
existing BBT handling code in the generic layer, because again, I think
we should try to lighten the existing implementation instead of
quickly adapting it to the generic NAND layer. So, what's in [1] is
basic SPI-NAND support without BBT and ECC. Of course, this will be
extended later on, but I think we should start small, and take the time
to think about how we want to extend the generic layer so that some of
the code can be re-used by the parallel/raw NAND and OneNAND frameworks.

I'm really sorry to have blocked this initiative by not responding
and/or not spending the necessary time to rework the code, but I
really think we should have a strong base if we don't want to end up
with what he have in the parallel/raw NAND/OneNAND frameworks (a code
base that is hardly maintainable, with a lot of code duplication).

Anyway, any help is appreciated, so if you do have time to
review/test/enhance this code, feel free to do it.

Regards,

Boris

[1]https://github.com/bbrezillon/linux-0day/commits/nand/spi-nand
