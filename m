Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2OkY-0002JP-UN
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 21:41:13 +0000
Received: by mail-wm0-x243.google.com with SMTP id q124so2953235wmb.5
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 14:40:50 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi: convert inline functions to macros
To: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20171011135419.3492681-1-arnd@arndb.de>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b109f253-ac22-82b0-6716-6a069eb3e4f2@gmail.com>
Date: Wed, 11 Oct 2017 23:34:33 +0200
MIME-Version: 1.0
In-Reply-To: <20171011135419.3492681-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/11/2017 03:54 PM, Arnd Bergmann wrote:
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

Don't you lose type-checking with this conversion to macros ?

-- 
Best regards,
Marek Vasut
