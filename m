From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: mtk: avoid warning in mtk_ecc_encode
Date: Fri, 30 Sep 2016 19:25:17 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20160930163429.380785-1-arnd@arndb.de>
 <20160930185139.15c8be66@bbrezillon>
In-Reply-To: <20160930185139.15c8be66@bbrezillon>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201609301925.17577.arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 30 September 2016, Boris Brezillon wrote:
> > +     /* copy into possibly unaligned OOB region with actual length */
> > +     memcpy(data + bytes, eccdata, len);
> 
> Is it better than
> 
>         for (i = 0; i < len; i += 4) {
>                 u32 val = __raw_readl(ecc->regs + ECC_ENCPAR(i / 4));
> 
>                 memcpy(data + bytes + i, &val, min(len, 4));
>         }
> 
> I'm probably missing something, but what's the point of creating a
> temporary buffer of 112 bytes on the stack since you'll have to copy
> this data to the oob buffer at some point?


I tried something like that first, but wasn't too happy with it for
a number of small reasons:

- __raw_readl in a driver is not usually the right API, __memcpy32_from_io
  uses it internally, but it's better for a driver not to rely on that,
  in case we need some barriers (which we may in factt need for other drivers).

- the min(len,4) expression is incorrect, fixing that makes it more complicated
  again

- I didn't like to call memcpy() multiple times, as that might get turned
  into an external function call (the compiler is free to optimize small
  memcpy calls or not).

I agree that he 112 byte buffer isn't ideal either, it just seemed to
be the lesser annoyance.

	Arnd
