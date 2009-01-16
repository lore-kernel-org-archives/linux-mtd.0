Received: from moutng.kundenserver.de ([212.227.17.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNsS5-0008Dk-Hp
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 17:25:53 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: [PATCH] UBI: add ioctl compatibility
Date: Fri, 16 Jan 2009 18:25:37 +0100
References: <1232036381.25068.10.camel@localhost.localdomain>
	<200901161324.35271.arnd@arndb.de>
	<1232116447.25068.27.camel@localhost.localdomain>
In-Reply-To: <1232116447.25068.27.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901161825.38029.arnd@arndb.de>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 January 2009, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] UBI: add ioctl compatibility
> 
> UBI ioctl's do not work when running 64-bit kernel and 32-bit
> user-land. Fix this by adding the compat_ioctl method.
> 
> Also, UBI serializes all ioctls, so more than one ioctl at a time
> is not a problem. Amd UBI does not seem to depend on anything else,
> so use unlocked_ioctl instead of ioctl (no BKL needed).
> 
> Reported-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Looks good now, thanks!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
