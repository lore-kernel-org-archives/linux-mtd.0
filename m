Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbYPq-0005j8-S5
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 21:37:24 +0000
Date: Fri, 6 Jul 2018 23:37:01 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Subject: Re: [PATCH v6 0/6] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Message-ID: <20180706233701.05da0666@bbrezillon>
In-Reply-To: <20180706212720.0e9dacb8@bbrezillon>
References: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
 <20180706212720.0e9dacb8@bbrezillon>
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

On Fri, 6 Jul 2018 21:27:20 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Mon, 25 Jun 2018 10:44:42 +1200
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> 
> > Hi,
> > 
> > I'm looking at adding support for the Micron MT29F1G08ABAFAWP-ITE:F chip  
> 
> Hm, it's even worse than I thought. The model name does not include the
> -ITE suffix (E means ECC can't be disabled), which means we have no way
> to detect the version with forced on-die ECC.
> 
> I see 2 solutions to this problem:
> 1/ Bean provides us a solution to reliably detect when ECC can be
>    de-actived and when it can't
> 2/ We only ever expose 64 bytes of OOB to the user and consider that
>    ECC can be disabled, even if it can't in reality
>

After reading the doc again, I forgot one thing you can try before
deciding to go for option #2.

8th bit in byte 5 of READID's result encodes whether the on-die ECC
state (enabled or not). I remember we had a discussion with Bean where
he told us this was a runtime status reflecting the on-die ECC state,
which is crazy, since READID might return different values depending on
the NAND state, and most of the code in the core assumes READID
provides a fixed ID that encodes the chip characteristics/capabilities,
not its state.

Anyway, if this bit is actually reflecting the on-die ECC state and
on-die cannot be disabled on your chip, it should stay at 1 even after
you have sent the SET_FEATURES(DISABLE_ECC) command. Let's hope this
works as I expect, otherwise we're back to option #2 until Bean suggest
something else.
