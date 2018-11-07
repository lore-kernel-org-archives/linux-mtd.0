Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKIsM-0006fa-AJ
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 08:07:47 +0000
Date: Wed, 7 Nov 2018 09:07:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: CONFIG_UBIFS_FS_AUTHENTICATION should depend on
 UBIFS_FS
Message-ID: <20181107080733.ojderb7dkvwtpl2i@pengutronix.de>
References: <20181105082540.21205-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105082540.21205-1-geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 05, 2018 at 09:25:40AM +0100, Geert Uytterhoeven wrote:
> Instead of adding yet another dependency on UBIFS_FS, wrap the whole
> block of ubifs config options in a single "if UBIFS_FS".
> 
> Fixes: d8a22773a12c6d78 ("ubifs: Enable authentication support")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  fs/ubifs/Kconfig | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

I would have sent a similar patch with taking the easier way out of just
adding another "depends on UBIFS_FS". This one is nicer though.

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
