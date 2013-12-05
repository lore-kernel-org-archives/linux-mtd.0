Received: from mail-we0-f171.google.com ([74.125.82.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Voe8w-0002OT-Pu
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 18:59:23 +0000
Received: by mail-we0-f171.google.com with SMTP id q58so16849839wes.2
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 10:58:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131205182628.GF2345@localhost>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
 <52A04E75.3010609@corscience.de>
 <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
 <20131205171326.GA26766@atomide.com>
 <CABxcv=mtqkpyup0y-zv53YRvdgKH0bNXeCWf9mxPFoUTRQ=Gew@mail.gmail.com>
 <20131205182628.GF2345@localhost>
Date: Thu, 5 Dec 2013 19:58:56 +0100
Message-ID: <CABxcv=k56rhXi_gU=VG5NJSrwxRBbdWWFLaCTJDs4my2TXvyEA@mail.gmail.com>
Subject: Re: OMAP3 NAND ECC selection
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-mtd@lists.infradead.org,
 "Gupta, Pekon" <pekon@ti.com>, Peter Meerwald <pmeerw@pmeerw.net>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 =?UTF-8?Q?Andreas_Bie=C3=9Fmann?= <andreas.biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Thu, Dec 5, 2013 at 7:26 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Hi Javier,
>
> (CCing Brian: What do you think about this?)
>
> On Thu, Dec 05, 2013 at 06:39:10PM +0100, Javier Martinez Canillas wrote:
>> On Thu, Dec 5, 2013 at 6:13 PM, Tony Lindgren <tony@atomide.com> wrote:
>>
>> In the another thread [0] pointed out by Enric we were discussing the
>> same issue. Thomas suggested [1] that ideally we should be able to set
>> a per MTD partition ECC scheme. That way we can set 1 bit hamming for
>> the first MTD partition that has the SPL that the boot ROM needs to
>> read and the other partitions can use a more secure ECC scheme. I
>> completely agree with him.
>>
> [..]
>> global ECC scheme and we should expand the GPMC NAND DT binding so
>> partitions support the "ti,nand-ecc-opt". I'll see if I can get some
>> free time to try to implement that.
>>
>
> AFAIK, there's no hardware limitation that would prevent us from setting
> a per-partition ECC, keep in mind this effort is not reduced to make
> devicetree accept ECC on the partitions.
>

Agreed, in fact if you look at what I shared from the Micron NAND
datasheet used on IGEPv2 it says that different ECC schemes could be
used for block 0 and the rest of the NAND so definitely this is a
software limitation.

> While there are some per MTD device (which model each partition), the
> ECC mode is present in the, nand_chip structure. My understanding is that
> the NAND core hasn't been designed for this use case, and thus some
> major re-work is needed to accomplish it.
>

I see thanks for the clarification. I'm not familiar with the MTD
subsystem to be honest so I somehow misunderstood that other nand
drivers did this already and thought that it was just a matter of
adding support to the OMAP NAND driver.

> Therefore, it's a much short-term solution to implement the OMAP
> module parameter to fix the issue.
>
> Of course, feel free to prove me wrong :-)

Agreed.

> --
> Ezequiel Garc=C3=ADa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com

Thanks a lot and best regards,
Javier
