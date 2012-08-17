Received: from smtp13.mail.ru ([94.100.176.90])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Ntt-0007tW-FO
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 14:51:50 +0000
Date: Fri, 17 Aug 2012 18:51:16 +0400
From: Alexander Shiyan <shc_work@mail.ru>
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH RESEND 1/2] MTD: autcpu12-nvram: Fix compile breakage
Message-Id: <20120817185116.a2e565b2.shc_work@mail.ru>
In-Reply-To: <1345207255.27859.70.camel@sauron.fi.intel.com>
References: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
 <1345207255.27859.70.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Aug 2012 15:40:55 +0300
Artem Bityutskiy <artem.bityutskiy@linux.intel.com> wrote:

> > Update driver autcpu12-nvram.c so it compiles. map_read32/map_write32
> > are no longer exist in the kernel so the driver is totally broken.
> > Additionally, map_info name passed to simple_map_init is incorrect.
> Would you please send me a defconfig that I could use to compile-test
> this driver?
Have been sent.

-- 
Alexander Shiyan <shc_work@mail.ru>
