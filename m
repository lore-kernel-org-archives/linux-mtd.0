Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQUYM-0002TZ-KD
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 08:44:13 +0000
Date: Sun, 17 Dec 2017 09:43:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: convert inline functions to macros
Message-ID: <20171217094345.3d327c54@bbrezillon>
In-Reply-To: <b109f253-ac22-82b0-6716-6a069eb3e4f2@gmail.com>
References: <20171011135419.3492681-1-arnd@arndb.de>
 <b109f253-ac22-82b0-6716-6a069eb3e4f2@gmail.com>
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

Hi Marek,

On Wed, 11 Oct 2017 23:34:33 +0200
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 10/11/2017 03:54 PM, Arnd Bergmann wrote:
> > The map_word_() functions, dating back to linux-2.6.8, try to perform
> > bitwise operations on a 'map_word' structure. This may have worked
> > with compilers that were current then (gcc-3.4 or earlier), but end
> > up being rather inefficient on any version I could try now (gcc-4.4 or
> > higher). Specifically we hit a problem analyzed in gcc PR81715 where we
> > fail to reuse the stack space for local variables.
> > 
> > This can be seen immediately in the stack consumption for
> > cfi_staa_erase_varsize() and other functions that (with CONFIG_KASAN)
> > can be up to 2200 bytes. Changing the inline functions into macros brings
> > this down to 1280 bytes.  Without KASAN, the same problem exists, but
> > the stack consumption is lower to start with, my patch shrinks it from
> > 920 to 496 bytes on with arm-linux-gnueabi-gcc-5.4, and saves around
> > 1KB in .text size for cfi_cmdset_0020.c, as it avoids copying map_word
> > structures for each call to one of these helpers.
> > 
> > With the latest gcc-8 snapshot, the problem is fixed in upstream gcc,
> > but nobody uses that yet, so we should still work around it in mainline
> > kernels and probably backport the workaround to stable kernels as well.
> > We had a couple of other functions that suffered from the same gcc bug,
> > and all of those had a simpler workaround involving dummy variables
> > in the inline function. Unfortunately that did not work here, the
> > macro hack was the best I could come up with.
> > 
> > It would also be helpful to have someone to a little performance testing
> > on the patch, to see how much it helps in terms of CPU utilitzation.
> > 
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>  
> 
> Don't you lose type-checking with this conversion to macros ?
> 

Yes, we loose strict type checking, but if you look at the code, you'll
see that the macros do (valN).x[i], so, if valN is not a struct or
a union containing a field named x, the compiler will complain. That
should save us from devs passing random arguments to those macros.

Anyway, this code is not seeing a lot of changes lately, so I wouldn't
be so worried by the lack of strict type-checking implied by this
transition to macros. 

Regards,

Boris
