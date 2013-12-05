Received: from mail-ve0-x232.google.com ([2607:f8b0:400c:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoeXR-00035w-4f
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 19:24:41 +0000
Received: by mail-ve0-f178.google.com with SMTP id c14so14310778vea.37
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 11:24:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131205200618.19b33ee2@skate>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
 <52A04E75.3010609@corscience.de>
 <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
 <20131205171326.GA26766@atomide.com>
 <CABxcv=mtqkpyup0y-zv53YRvdgKH0bNXeCWf9mxPFoUTRQ=Gew@mail.gmail.com>
 <20131205182628.GF2345@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA5222E@DBDE04.ent.ti.com>
 <20131205200618.19b33ee2@skate>
Date: Thu, 5 Dec 2013 11:24:18 -0800
Message-ID: <CAN8TOE-cv5ppz0Q_asK=6WdRPaK9SAd1ccZF0Ax7QCdGOE7Fjw@mail.gmail.com>
Subject: Re: OMAP3 NAND ECC selection
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Peter Meerwald <pmeerw@pmeerw.net>, Tony Lindgren <tony@atomide.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 =?ISO-8859-1?Q?Andreas_Bie=DFmann?= <andreas.biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 5, 2013 at 11:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 5 Dec 2013 19:02:22 +0000, Gupta, Pekon wrote:
>
>> >From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
>> [...]
>> >AFAIK, there's no hardware limitation that would prevent us from setting
>> >a per-partition ECC, keep in mind this effort is not reduced to make
>> >devicetree accept ECC on the partitions.
>> >
>> I had some reservations in doing so.. (as mentioned in previous email also [2])
>> I would rather like to understand long term benefits of such implementation.
>
> The long term benefits is simply to properly handle the hardware
> constraints. We have hardware platforms were parts of the NAND *MUST*
> use 1-bit ECC to be compatible with the ROM code, and other parts of
> the NAND *MUST* use stronger 4-bits or 8-bits ECC to comply with the
> NAND requirements.

Using 1-bit ECC on NAND is not a long-term solution. Given that fact,
I think your ROM code is what may need to change, not the entire MTD
subsystem.

> Isn't handling hardware constraints properly not a sufficient
> motivation for doing something?

I'm not convinced your hardware constraints are reasonable or
generally useful. But I could be convinced otherwise.

>> Also, any constrain due to ROM code, or upgrading from remote can be
>> handled using various alternative approaches like [a] and [b].
>
> And you're not realizing that these solutions are ugly and impractical?

Solution [a] is both ugly and impractical. Solution [b] is only a
little ugly but quite practical (you could flesh out a better
user-space ECC library, then combine it with nanddump/nandwrite
--noecc). Rewriting both the MTD and NAND layers is not exactly
practical and may still yield something ugly.

Brian
