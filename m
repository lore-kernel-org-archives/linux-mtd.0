Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z43eS-000272-FC
 for linux-mtd@lists.infradead.org; Sun, 14 Jun 2015 08:52:25 +0000
Date: Sun, 14 Jun 2015 10:51:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roy Spliet <r.spliet@ultimaker.com>
Subject: Re: [RFC] Add DMA RX support for sunxi nand
Message-ID: <20150614105159.78859b36@bbrezillon>
In-Reply-To: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
References: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 Linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roy,

Adding Richard in CC since he was part of the discussion we had on #mtd
about DMA and UBI/UBIFS. 

On Fri, 12 Jun 2015 13:38:47 +0200
Roy Spliet <r.spliet@ultimaker.com> wrote:

> Following are two patches for sunxi nand DMA support. There's a whole phletora
> of reasons why these are marked RFC, including:
> - Sunxi DMA support still needs to be merged upstream
> - Sun7i NAND definitions are not merged upstream
> - No TX support
> - Bounce buffer size is fixed to 8KB, and I have no idea whether this is sane

Here is a patch [1] which should help in creating an sg_table from a
buffer (even if this buffer was allocated with vmalloc), and thus
avoid using this bounce buffer when possible.
I also patched the GPMI driver [2] to use these helpers functions
instead of manually testing the buffer validity.

This is still an early version (note that it hasn't been tested yet),
but IMHO, we should add some consistency in all those NAND drivers which
are pretty much all doing the same kind of tests (when they are not
doing it wrong).

Best Regards,

Boris

[1]http://code.bulix.org/jl997t-88538
[2]http://code.bulix.org/sexjf4-88539

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
