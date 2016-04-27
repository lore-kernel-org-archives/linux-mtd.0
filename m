Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avSmU-0001JU-Vz
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 16:57:43 +0000
Received: by mail-pf0-x230.google.com with SMTP id 206so22556996pfu.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 09:57:22 -0700 (PDT)
Date: Wed, 27 Apr 2016 10:57:12 -0600
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] physmap_of: ensure versatile code is reachable
Message-ID: <20160427165712.GA7266@localhost>
References: <1461625501-2160538-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461625501-2160538-1-git-send-email-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2016 at 01:04:38AM +0200, Arnd Bergmann wrote:
> With the newly added physmap_of_versatile code, we get a build error
> when physmap_of is in a module, because of_flash_probe_versatile
> is not exported:
> 
> ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
> 
> This adds the export, and changes the Makefile so that the code is
> also put into a loadable module rather than built-in when physmap_of
> itself is a module.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Brian Norris <computersforpeace@gmail.com>

I presume you're taking this in arm-soc.
