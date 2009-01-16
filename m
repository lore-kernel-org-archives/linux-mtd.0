Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNnkd-0002cr-L3
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 12:24:42 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: [PATCH] UBI: add ioctl compatibility
Date: Fri, 16 Jan 2009 13:24:34 +0100
References: <1232036381.25068.10.camel@localhost.localdomain>
	<200901151734.23870.arnd@arndb.de>
	<1232104138.25068.22.camel@localhost.localdomain>
In-Reply-To: <1232104138.25068.22.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901161324.35271.arnd@arndb.de>
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
> Thank you Arnd. Here is the corrected patch. Tested on x68_64 + 32-bit
> UBI tools.
> 

Looks better now, but the compat_ versions are still missing the
compat_ptr() conversions. Those only make a difference on s390,
so you wouldn't see the problem on x86_64.

	Arnd <><
