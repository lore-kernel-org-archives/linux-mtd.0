Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2jN9-000106-G7
 for linux-mtd@lists.infradead.org; Sun, 21 Dec 2014 16:28:48 +0000
Date: Sun, 21 Dec 2014 17:28:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: should nand driver create ECC for a page after ERASE cmd?
Message-ID: <20141221172806.4fb64605@bbrezillon>
In-Reply-To: <54953675.1020102@rempel-privat.de>
References: <54953675.1020102@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Oleksij,

On Sat, 20 Dec 2014 09:42:29 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> Hello all,
> 
> i'm trying to pass mtd/tests for my driver.. on pagetest i fail on this
> place:
> http://lxr.free-electrons.com/source/drivers/mtd/tests/pagetest.c#L311
> 
> after ERASE cmd this test trying to read same page. Driver will report
> ECC error on read, because erased page has no ECC data in OOB.
> 
> What is correct way to handle it?

Well, actually it depends on your NAND/ECC controller capabilities (but
given your discussion with Richard on IRC, I guess you already
understood that ;-))

1) Wiser controllers are generating 0xff ECC bytes for a data chunk
(chunk == ECC step size) filled with 0xff. With BCH algorithms this is
easily done by XORing the ECC bytes with the appropriate pattern (see
soft BCH implementation)
2) Some controller just verify if the data chunk + ECC bytes are all
0xff before passing it to the ECC engine. If they are filled with 0xff
the ECC correction is bypassed.
This method has one drawback: it does not properly handle bitflips
occurring in erased pages (if one bitflip occurs the NAND controller
consider the chunk as not empty, and pass it to the BCH engine).
3) The controller does not handle erased pages at all, and in this case
you'll have to manually test it (as Ezequiel suggested) when you
encounter an ECC error.

Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
