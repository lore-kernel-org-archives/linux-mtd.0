From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 stable@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4] mtd: nand: sunxi: fix OOB handling in ->write_xxx()
 functions
Date: Mon, 14 Sep 2015 14:36 +0200
Message-ID: <3052942.HDd39OoZnN@wuerfel>
In-Reply-To: <3809181.WuS0af6Yyz@wuerfel>
References: <1442220063-7520-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150914114113.4aa7ea03@bbrezillon> <3809181.WuS0af6Yyz@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 14 September 2015 13:49:12 Arnd Bergmann wrote:
> > > If all hardware can do 32-bit accesses here and the size is guaranteed to be a
> > > multiple of four bytes, you can probably improve performance by using a
> > > __raw_writel() loop there. Using __raw_writel() in general is almost always
> > > a bug, but here it actually makes sense. See also the powerpc implementation
> > > of _memcpy_toio().
> > 
> > AFAICT, buffer passed to ->write_bu() are not necessarily aligned on
> > 32bits, so using writel here might require copying data in temporary
> > buffers :-/.
> > 
> > Don't hesitate to point where I'm wrong ;-).
> 
> Brian or Dwmw2 should be able to know for sure. I think it's definitely
> worth trying as the potential performance gains could be huge, if you
> replace
> 
>         for (p = start; p < start + length; data++, p++) {
>                 writeb(*data, p);
>                 wmb();
>         }
> 
> with
> 
>         for (p = start; p < start + length; data++, p+=4) {
>                 writel(*data, p);
>         };
>         wmb();
> 

As Boris pointed out on IRC, we have an optimized version of
memcpy_toio on little-endian, which already does this. I'm not completely
sure why we don't use it for big-endian architectures as well.

Powerpc uses the same method on big-endian, but it's possible that
it does not do the right thing on one of the older platforms using
BE32 mode, or one that has a weird bus mode.

	Arnd
 
