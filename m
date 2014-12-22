Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y37vD-00043a-Pu
 for linux-mtd@lists.infradead.org; Mon, 22 Dec 2014 18:41:36 +0000
Received: by mail-pa0-f45.google.com with SMTP id lf10so6386702pab.32
 for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2014 10:41:14 -0800 (PST)
Date: Mon, 22 Dec 2014 10:41:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: should nand driver create ECC for a page after ERASE cmd?
Message-ID: <20141222184111.GD9759@ld-irv-0074>
References: <54953675.1020102@rempel-privat.de>
 <20141221172806.4fb64605@bbrezillon>
 <5497150A.9090304@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5497150A.9090304@rempel-privat.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 21, 2014 at 07:44:26PM +0100, Oleksij Rempel wrote:
> Am 21.12.2014 um 17:28 schrieb Boris Brezillon:
> > Well, actually it depends on your NAND/ECC controller capabilities (but
> > given your discussion with Richard on IRC, I guess you already
> > understood that ;-))
> > 
> > 1) Wiser controllers are generating 0xff ECC bytes for a data chunk
> > (chunk == ECC step size) filled with 0xff. With BCH algorithms this is
> > easily done by XORing the ECC bytes with the appropriate pattern (see
> > soft BCH implementation)
> > 2) Some controller just verify if the data chunk + ECC bytes are all
> > 0xff before passing it to the ECC engine. If they are filled with 0xff
> > the ECC correction is bypassed.
> > This method has one drawback: it does not properly handle bitflips
> > occurring in erased pages (if one bitflip occurs the NAND controller
> > consider the chunk as not empty, and pass it to the BCH engine).
> > 3) The controller does not handle erased pages at all, and in this case
> > you'll have to manually test it (as Ezequiel suggested) when you
> > encounter an ECC error.
> 
> Boris,
> i think your explanation can be placed to mtd web page, some where here :)
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

Patches are welcome:

http://www.linux-mtd.infradead.org/faq/general.html#L_mtdwww

Brian
