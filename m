Received: from el-out-1112.google.com ([209.85.162.181])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IVtQY-0006Nh-IO
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 14:28:38 -0400
Received: by el-out-1112.google.com with SMTP id r27so144078ele
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Sep 2007 11:28:32 -0700 (PDT)
Message-ID: <625fc13d0709131128m5a606b6ewe729c1e72f73f9d9@mail.gmail.com>
Date: Thu, 13 Sep 2007 13:28:31 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Mike Frysinger" <vapier@gentoo.org>
Subject: Re: [patch] update CFI URI n mtd kconfig
In-Reply-To: <200709122339.55267.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200709122339.55267.vapier@gentoo.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/12/07, Mike Frysinger <vapier@gentoo.org> wrote:
> Since AMD shunted its flash memory division, the URI in the mtd Kconfig is now
> broken, so the attached patch points people to Wikipedia.
>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> index 479d32b..980117a 100644
> --- a/drivers/mtd/chips/Kconfig
> +++ b/drivers/mtd/chips/Kconfig
> @@ -11,8 +11,8 @@ config MTD_CFI
>           AMD and other flash manufactures that provides a universal method
>           for probing the capabilities of flash devices. If you wish to
>           support any device that is CFI-compliant, you need to enable this
> -         option. Visit <http://www.amd.com/products/nvd/overview/cfi.html>
> -         for more information on CFI.
> +         option. For more information on CFI, visit:
> +         <http://wikipedia.org/wiki/Common_Flash_Memory_Interface>

Erm, I'd rather not point to wikipedia.  Can you change it to point to:

http://www.intel.com/design/flash/swb/cfi.htm

instead?

josh
