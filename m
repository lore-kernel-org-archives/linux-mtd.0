Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI7pv-0004DE-4f
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 07:24:01 +0000
Date: Mon, 14 May 2018 09:23:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Implement ndelay() as an inline function to force
 type checking/casting
Message-ID: <20180514092334.43b5ee3c@xps13>
In-Reply-To: <20180513140212.3961-1-boris.brezillon@bootlin.com>
References: <20180513140212.3961-1-boris.brezillon@bootlin.com>
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

Hi Boris,

On Sun, 13 May 2018 16:02:12 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> ndelay() is supposed to take an unsigned long, but if you define
> ndelay() as a macro and the caller pass an unsigned long long instead
> of an unsigned long, the unsigned long long to unsigned long cast is
> not done and we end up with an "undefined reference to `__udivdi3'"
> error at link time.
> 
> Fix that by making ndelay() an inline function and then defining dummy
> ndelay() macro that redirects to the ndelay() function (it's how most
> archs do to implement ndelay()).
> 
> Fixes: c8ee038bd148 ("m68k: Implement ndelay() based on the existing udelay() logic")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Thanks for fixing it.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


-- 
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
