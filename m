Received: from straum.hexapodia.org ([64.81.70.185])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gpqv7-0003q9-33
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 13:46:07 -0500
Date: Thu, 30 Nov 2006 10:45:56 -0800
From: Andy Isaacson <adi@hexapodia.org>
To: Adrian Bunk <bunk@stusta.de>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
Message-ID: <20061130184556.GA23293@hexapodia.org>
References: <20061125191541.GH3702@stusta.de>
	<1164752386.14595.24.camel@pmac.infradead.org>
	<20061125191541.GH3702@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1164752386.14595.24.camel@pmac.infradead.org>
	<20061125191541.GH3702@stusta.de>
Cc: Andrew Morton <akpm@osdl.org>, Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 25, 2006 at 08:15:41PM +0100, Adrian Bunk wrote:
> This patch makes the needlessly global mtdpart_setup() static.
> 
> @@ -346,7 +346,7 @@
>   *
>   * This function needs to be visible for bootloaders.
>   */
> -int mtdpart_setup(char *s)
> +static int mtdpart_setup(char *s)
>  {
>  	cmdline = s;
>  	return 1;

Jarkko,

You're recorded as submitting the original patch to make this
non-static:
http://linux.bkbits.net:8080/linux-2.6/diffs/drivers/mtd/cmdlinepart.c@1.11?nav=index.html|src/|src/drivers|src/drivers/mtd|hist/drivers/mtd/cmdlinepart.c

Is this change correct?

If so, it should also delete the "needs to be visible" comment.

-andy
