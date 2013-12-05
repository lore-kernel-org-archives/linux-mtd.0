Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoddO-0001Lm-4f
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 18:26:46 +0000
Date: Thu, 5 Dec 2013 15:26:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: OMAP3 NAND ECC selection
Message-ID: <20131205182628.GF2345@localhost>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
 <52A04E75.3010609@corscience.de>
 <alpine.DEB.2.01.1312051711410.20976@pmeerw.net>
 <20131205171326.GA26766@atomide.com>
 <CABxcv=mtqkpyup0y-zv53YRvdgKH0bNXeCWf9mxPFoUTRQ=Gew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABxcv=mtqkpyup0y-zv53YRvdgKH0bNXeCWf9mxPFoUTRQ=Gew@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-mtd@lists.infradead.org,
 "Gupta, Pekon" <pekon@ti.com>, Peter Meerwald <pmeerw@pmeerw.net>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Andreas =?utf-8?B?Qmllw59tYW5u?= <andreas.biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Javier,

(CCing Brian: What do you think about this?)

On Thu, Dec 05, 2013 at 06:39:10PM +0100, Javier Martinez Canillas wrote:
> On Thu, Dec 5, 2013 at 6:13 PM, Tony Lindgren <tony@atomide.com> wrote:
> 
> In the another thread [0] pointed out by Enric we were discussing the
> same issue. Thomas suggested [1] that ideally we should be able to set
> a per MTD partition ECC scheme. That way we can set 1 bit hamming for
> the first MTD partition that has the SPL that the boot ROM needs to
> read and the other partitions can use a more secure ECC scheme. I
> completely agree with him.
> 
[..]
> global ECC scheme and we should expand the GPMC NAND DT binding so
> partitions support the "ti,nand-ecc-opt". I'll see if I can get some
> free time to try to implement that.
> 

AFAIK, there's no hardware limitation that would prevent us from setting
a per-partition ECC, keep in mind this effort is not reduced to make
devicetree accept ECC on the partitions.

While there are some per MTD device (which model each partition), the
ECC mode is present in the, nand_chip structure. My understanding is that
the NAND core hasn't been designed for this use case, and thus some
major re-work is needed to accomplish it.

Therefore, it's a much short-term solution to implement the OMAP
module parameter to fix the issue.

Of course, feel free to prove me wrong :-)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
