Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKFXe-00082x-D6
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 20:30:11 +0000
Received: by bke11 with SMTP id 11so2683277bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 13:30:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: mark tests EXPERIMENTAL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 29 Oct 2011 23:30:05 +0300
In-Reply-To: <1319533791-32605-2-git-send-email-w.sang@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
	<1319533791-32605-2-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319920207.2126.19.camel@koala>
Mime-Version: 1.0
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-10-25 at 11:09 +0200, Wolfram Sang wrote:
> The tests may erase mtd devices, so mark them EXPERIMENTAL and emphasize
> this fact in the Kconfig entry, so users will think twice before running
> them.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> ---
>  drivers/mtd/Kconfig |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 4be8373..81d9b92 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -27,12 +27,15 @@ config MTD_DEBUG_VERBOSE
>  
>  config MTD_TESTS
>  	tristate "MTD tests support"
> -	depends on m
> +	depends on m && EXPERIMENTAL
>  	help
>  	  This option includes various MTD tests into compilation. The tests
>  	  should normally be compiled as kernel modules. The modules perform
>  	  various checks and verifications when loaded.
>  
> +	  WARNING: Some of the tests will ERASE THE CONTENT of mtd devices!
> +	  Do not use these tests unless you are sure you really need to.
> +

I am OK with this close, but I am not sure about the EXPERIMENTAL. I
though this is used for the code which is considered to be "not ready"
for real use, while the tests work well.

Artem.
