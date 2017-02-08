Received: from mail-ua0-f175.google.com ([209.85.217.175])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbY8C-0000TS-0s
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 19:42:24 +0000
Received: by mail-ua0-f175.google.com with SMTP id 96so117607314uaq.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 11:41:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170208190939.GA97840@google.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 8 Feb 2017 20:40:17 +0100
Message-ID: <CAOMqctTGCWoD-DqKUR3u1cLrQZPy3i1dLKXwoMkLP+hYfEtTyw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Brian Norris <computersforpeace@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8 February 2017 at 20:09, Brian Norris <computersforpeace@gmail.com> wro=
te:
> + Mark, as the disagreement touches his area
>
> Hi,
>
> On Wed, Feb 08, 2017 at 11:36:10AM +0100, Cyrille Pitchen wrote:
>> Le 08/02/2017 =C3=A0 06:52, Heiner Kallweit a =C3=A9crit :
>> > Am 08.02.2017 um 02:09 schrieb Marek Vasut:
>> >> On 02/07/2017 04:31 PM, Cyrille Pitchen wrote:
>> [...]
>> >>> Heiner Kallweit (1):
>> >>>       mtd: m25p80: consider max message size in m25p80_read
[...]
> One example that shows both sides of this coin:
>
> 5185a81c02d4 "spi: rockchip: limit transfers to (64K - 1) bytes"
>
> The hardware has a hard limit on transfers, at least, which can only be
> 64K. For some reason there's an off-by-one error (probably a driver
> bug?), so I cheated and made it one smaller.
>
> [...]
>
> (snip the rest about trying to split spi_messages within the SPI driver;
> I agree that would be awful.)
>
> But one question: *why* exactly is the transfer or message limit so
> fixed? If a SPI controller allows manual control over the CS line, then
> why would anybody care if a sequence of data gets split up into multiple
> HW sequences (e.g., for a long spi_transfer, why can't we split it into
> 2 sub-transfers, while keeping the CS asserted?).
>
> For the above rockchip SPI controller, AIUI we could actually support
> the "transfer limit" by doing this. And in fact, it could probably be
> done within the SPI core code, instead either the SPI driver or the MTD
> driver.

Yes, this is something repeatedly open-coded in SPI drivers, unfortunately.

In this case limiting the transfer size to 64k rather than doing
another clone of the manual CS handling actually looks reasonable.
It's not like anything but mtd_debug normally triggers that limit.

>
> Now, in this case, *transfer* vs. *message* seems to have a difference,
> in whether or not you have guarantees about the CS line. The CS must
> stay asserted (barring the 'cs_change' flag) between transfers, but not
> between messages.
>
> So the one thing I can see that might support Marek's disagreement here:
> does the FSL ESPI hardware support controlling the CS line? It seems
> like currently, the driver just uses a few fixed settings for its CSMODE
> register fields, whereas it might be able to support ->transfer_one()
> (and flexible CS assertion, and splitting large transactions into
> smaller chunks) if you handled that differently...

It was argued that while this is the case with most SPI controllers it
is not the case with FSL ESPI. I do not recall anybody producing any
datasheet/manual supporting this, though. It's not like this is a
confidential piece of hardware, right?

Thanks

Michal
