Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQfdC-0002gR-9N
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 20:33:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: convert inline functions to macros
Date: Sun, 17 Dec 2017 21:34:01 +0100
Message-ID: <2276602.9klaxVRupl@blindfold>
In-Reply-To: <20171011135419.3492681-1-arnd@arndb.de>
References: <20171011135419.3492681-1-arnd@arndb.de>
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

Am Mittwoch, 11. Oktober 2017, 15:54:10 CET schrieb Arnd Bergmann:
> The map_word_() functions, dating back to linux-2.6.8, try to perform
> bitwise operations on a 'map_word' structure. This may have worked
> with compilers that were current then (gcc-3.4 or earlier), but end
> up being rather inefficient on any version I could try now (gcc-4.4 or
> higher). Specifically we hit a problem analyzed in gcc PR81715 where we
> fail to reuse the stack space for local variables.
> 
> This can be seen immediately in the stack consumption for
> cfi_staa_erase_varsize() and other functions that (with CONFIG_KASAN)
> can be up to 2200 bytes. Changing the inline functions into macros brings
> this down to 1280 bytes.  Without KASAN, the same problem exists, but
> the stack consumption is lower to start with, my patch shrinks it from
> 920 to 496 bytes on with arm-linux-gnueabi-gcc-5.4, and saves around
> 1KB in .text size for cfi_cmdset_0020.c, as it avoids copying map_word
> structures for each call to one of these helpers.
> 
> With the latest gcc-8 snapshot, the problem is fixed in upstream gcc,
> but nobody uses that yet, so we should still work around it in mainline
> kernels and probably backport the workaround to stable kernels as well.
> We had a couple of other functions that suffered from the same gcc bug,
> and all of those had a simpler workaround involving dummy variables
> in the inline function. Unfortunately that did not work here, the
> macro hack was the best I could come up with.
> 
> It would also be helpful to have someone to a little performance testing
> on the patch, to see how much it helps in terms of CPU utilitzation.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Richard Weinberger <richard@nod.at>

Marek, I know you are not super happy with this patch but IMHO this is the 
solution with the least hassle.
While functions offer better type checking I think this functions are trivial 
enough to exist as macros too.
Also forcing users to upgrade/fix their compilers is only possible in a 
perfect world.

Thanks,
//richard
